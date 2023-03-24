Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35F6C8126
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:24:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjCF-0007h7-1P; Fri, 24 Mar 2023 11:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@breakpoint.cc>)
 id 1pffXw-000651-El; Fri, 24 Mar 2023 07:25:24 -0400
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fw@breakpoint.cc>)
 id 1pffXj-00063B-5B; Fri, 24 Mar 2023 07:25:24 -0400
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
 (envelope-from <fw@breakpoint.cc>)
 id 1pff3c-0000Dx-10; Fri, 24 Mar 2023 11:54:04 +0100
From: Florian Westphal <fw@strlen.de>
To: qemu-block@nongnu.org
Cc: eblake@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org,
 Florian Westphal <fw@strlen.de>
Subject: [PATCH 1/1] nbd/server: push pending frames after sending reply
Date: Fri, 24 Mar 2023 11:47:20 +0100
Message-Id: <20230324104720.2498-1-fw@strlen.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a0a:51c0:0:237:300::1;
 envelope-from=fw@breakpoint.cc; helo=Chamillionaire.breakpoint.cc
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Mar 2023 11:19:07 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qemu-nbd doesn't set TCP_NODELAY on the tcp socket.

Kernel waits for more data and avoids transmission of small packets.
Without TLS this is barely noticeable, but with TLS this really shows.

Booting a VM via qemu-nbd on localhost (with tls) takes more than
2 minutes on my system.  tcpdump shows frequent wait periods, where no
packets get sent for a 40ms period.

Add explicit (un)corking when processing (and responding to) requests.
"TCP_CORK, &zero" after earlier "CORK, &one" will flush pending data.

VM Boot time:
main:    no tls:  23s, with tls: 2m45s
patched: no tls:  14s, with tls: 15s

VM Boot time, qemu-nbd via network (same lan):
main:    no tls:  18s, with tls: 1m50s
patched: no tls:  17s, with tls: 18s

Future optimization: if we could detect if there is another pending
request we could defer the uncork operation because more data would be
appended.

Signed-off-by: Florian Westphal <fw@strlen.de>
---
 nbd/server.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/nbd/server.c b/nbd/server.c
index a4750e41880a..848836d41405 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2667,6 +2667,8 @@ static coroutine_fn void nbd_trip(void *opaque)
         goto disconnect;
     }
 
+    qio_channel_set_cork(client->ioc, true);
+
     if (ret < 0) {
         /* It wasn't -EIO, so, according to nbd_co_receive_request()
          * semantics, we should return the error to the client. */
@@ -2692,6 +2694,7 @@ static coroutine_fn void nbd_trip(void *opaque)
         goto disconnect;
     }
 
+    qio_channel_set_cork(client->ioc, false);
 done:
     nbd_request_put(req);
     nbd_client_put(client);
-- 
2.39.2


