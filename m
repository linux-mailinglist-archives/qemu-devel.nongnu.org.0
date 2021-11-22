Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B507458FFC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:09:46 +0100 (CET)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpA0v-0001Qr-Go
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:09:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mp9tq-0001Tm-IB
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:02:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mp9tj-0006Dq-Qc
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637589739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1s4gIdmWmJJqJEj01NGTgcYt6J2rkpdjZoxa2C8B1BM=;
 b=SIdj4Sdyx/f9AWExq1ODc8F9qDeXJjnQPher11egEb9cFpgBxZXw+xmPYGnGXZkYGpa7AF
 lrNeocP3oVlknW4TMk+4rCX/NxrvNOyhv1WD6BOiXX8x4RKDuog/zRqw0eDo+f4nyltojm
 JfRqpANgIZYtL0NFr/W2aOJBbipbNpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-CePcm6EdMvS3f6RByOg1iA-1; Mon, 22 Nov 2021 09:02:15 -0500
X-MC-Unique: CePcm6EdMvS3f6RByOg1iA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1CA919057A0;
 Mon, 22 Nov 2021 14:02:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8238360862;
 Mon, 22 Nov 2021 14:02:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] nbd/server: Don't complain on certain client disconnects
Date: Mon, 22 Nov 2021 08:02:11 -0600
Message-Id: <20211122140212.1511814-2-eblake@redhat.com>
In-Reply-To: <20211122140212.1511814-1-eblake@redhat.com>
References: <20211122140212.1511814-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-stable@nongnu.org,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a client disconnects abruptly, but did not have any pending
requests (for example, when using nbdsh without calling h.shutdown),
we used to output the following message:

$ qemu-nbd -f raw file
$ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)'
qemu-nbd: Disconnect client, due to: Failed to read request: Unexpected end-of-file before all bytes were read

Then in commit f148ae7, we refactored nbd_receive_request() to use
nbd_read_eof(); when this returns 0, we regressed into tracing
uninitialized memory (if tracing is enabled) and reporting a
less-specific:

qemu-nbd: Disconnect client, due to: Request handling failed in intermediate state

Note that with Unix sockets, we have yet another error message,
unchanged by the 6.0 regression:

$ qemu-nbd -k /tmp/sock -f raw file
$ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.trim(1,0)'
qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe

But in all cases, the error message goes away if the client performs a
soft shutdown by using NBD_CMD_DISC, rather than a hard shutdown by
abrupt disconnect:

$ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)' -c 'h.shutdown()'

This patch fixes things to avoid uninitialized memory, and in general
avoids warning about a client that does a hard shutdown when not in
the middle of a packet.  A client that aborts mid-request, or which
does not read the full server's reply, can still result in warnings,
but those are indeed much more unusual situations.

CC: qemu-stable@nongnu.org
Fixes: f148ae7d36 ("nbd/server: Quiesce coroutines on context switch", v6.0.0)
Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
[eblake: defer unrelated typo fixes to later patch]
Message-Id: <20211117170230.1128262-2-eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/nbd/server.c b/nbd/server.c
index d9164ee6d0da..74ba48709451 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1418,6 +1418,9 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
     if (ret < 0) {
         return ret;
     }
+    if (ret == 0) {
+        return -EIO;
+    }

     /* Request
        [ 0 ..  3]   magic   (NBD_REQUEST_MAGIC)
-- 
2.33.1


