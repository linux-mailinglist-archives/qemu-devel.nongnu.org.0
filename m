Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB2741A29F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:06:20 +0200 (CEST)
Received: from localhost ([::1]:49912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUylP-0001n6-Ve
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybn-0002jp-FP
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybj-00032P-Ln
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljiF9o/BxZLMVY9v+EznM1MHruhp9Mf/QYChNFexN94=;
 b=DIFV3MM2wrYN0O+kkJtFkgEQ5amiaU1eWbBcoudea4/1LGpU65eEyL0e3mZSvCBhPCEtbS
 u1pT/d40vsroxRKMB8d/ebbqrmZ6b03NGbj7VQ6akO+FrBP07nvD5mGpblnODuQKF6qL3f
 6c7Eih4xQvOfViQ+nw0Iw9yLLMpsFpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-Ltlq3K3oOKuxtKKI6jK57w-1; Mon, 27 Sep 2021 17:56:17 -0400
X-MC-Unique: Ltlq3K3oOKuxtKKI6jK57w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CA3B824FA8;
 Mon, 27 Sep 2021 21:56:16 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6B2A5D9D5;
 Mon, 27 Sep 2021 21:56:15 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] block/nbd: move nbd_recv_coroutines_wake_all() up
Date: Mon, 27 Sep 2021 16:55:41 -0500
Message-Id: <20210927215545.3930309-17-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to use it in nbd_channel_error(), so move it up. Note,
that we are going also refactor and rename
nbd_recv_coroutines_wake_all() in future anyway, so keeping it where it
is and making forward declaration doesn't make real sense.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210902103805.25686-3-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index de59e76378ab..2842e6263fe4 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -127,22 +127,6 @@ static bool nbd_client_connected(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
 }

-static void nbd_channel_error(BDRVNBDState *s, int ret)
-{
-    if (nbd_client_connected(s)) {
-        qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-    }
-
-    if (ret == -EIO) {
-        if (nbd_client_connected(s)) {
-            s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
-                                            NBD_CLIENT_CONNECTING_NOWAIT;
-        }
-    } else {
-        s->state = NBD_CLIENT_QUIT;
-    }
-}
-
 static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
 {
     int i;
@@ -157,6 +141,22 @@ static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
     }
 }

+static void nbd_channel_error(BDRVNBDState *s, int ret)
+{
+    if (nbd_client_connected(s)) {
+        qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    }
+
+    if (ret == -EIO) {
+        if (nbd_client_connected(s)) {
+            s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
+                                            NBD_CLIENT_CONNECTING_NOWAIT;
+        }
+    } else {
+        s->state = NBD_CLIENT_QUIT;
+    }
+}
+
 static void reconnect_delay_timer_del(BDRVNBDState *s)
 {
     if (s->reconnect_delay_timer) {
-- 
2.31.1


