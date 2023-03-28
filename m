Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B516CBF43
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:37:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8YS-0004EZ-2F; Tue, 28 Mar 2023 08:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ph8YO-0004BY-6l
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ph8YM-0006CV-QU
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680006954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2rTzy4TesxCg60LU6meuGfbZE05Jvzsyuo/AaMdHhJ8=;
 b=LRvl+oFzBzUzft/Dm+Hdl1hyvNnG3/YJHLaII7TkQaGDu1D+SWRmBXkMed7bSCHEtU+5df
 pRJQbCxKIzyWVdbT5iqVulLQWTvLtsEFrSgsrWNw3lib2W6Sal23+/o9Ntb7Z7BudZHCay
 0sYi3eUwm4ZJoBYa98t8QM5fKMFPdd8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-R3vaBVX1NH6zthQCtUzxRQ-1; Tue, 28 Mar 2023 08:35:51 -0400
X-MC-Unique: R3vaBVX1NH6zthQCtUzxRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A862E385556A;
 Tue, 28 Mar 2023 12:35:50 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDA78C15BA0;
 Tue, 28 Mar 2023 12:35:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 1/4] nbd/server: push pending frames after sending reply
Date: Tue, 28 Mar 2023 14:35:39 +0200
Message-Id: <20230328123542.222022-2-kwolf@redhat.com>
In-Reply-To: <20230328123542.222022-1-kwolf@redhat.com>
References: <20230328123542.222022-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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

From: Florian Westphal <fw@strlen.de>

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
Message-Id: <20230324104720.2498-1-fw@strlen.de>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 nbd/server.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/nbd/server.c b/nbd/server.c
index a4750e4188..848836d414 100644
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


