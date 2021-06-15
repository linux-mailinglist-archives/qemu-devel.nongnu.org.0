Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BFF3A8ACE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:14:08 +0200 (CEST)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGNr-0007yP-P6
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFzE-00034X-58
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz8-0001Ep-D2
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnaoTipBCU3dHjYzpfRJeeaDu/fHIsONolRvLPHuKiA=;
 b=PyHK3XK1gEYH7g/HvN7TS+3J/ju4lGuc3t5Qf2bDRAlEB7zqzmf8Akjkmiht7MEu8GVNrN
 I3QcFVmWfnUAfgRmO2KkQCITwOIMczhOoGcLZGChFrwzDiegyu7DmSWOSx28N49pch2foe
 fkEdrl4DyQHkRJF4kmWa3LoOxqu3iZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-eeLYOryCNAadQpquEP8r-w-1; Tue, 15 Jun 2021 16:48:28 -0400
X-MC-Unique: eeLYOryCNAadQpquEP8r-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 959EE80EDA7;
 Tue, 15 Jun 2021 20:48:27 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 256FD5D9CA;
 Tue, 15 Jun 2021 20:48:24 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/34] block/nbd: split nbd_handle_updated_info out of
 nbd_client_handshake()
Date: Tue, 15 Jun 2021 15:47:46 -0500
Message-Id: <20210615204756.281505-25-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

To be reused in the following patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-23-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 112 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 64 insertions(+), 48 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index df9d241313f4..240c6e1b3d72 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -314,6 +314,51 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }

+/*
+ * Update @bs with information learned during a completed negotiation process.
+ * Return failure if the server's advertised options are incompatible with the
+ * client's needs.
+ */
+static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
+{
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    int ret;
+
+    if (s->x_dirty_bitmap) {
+        if (!s->info.base_allocation) {
+            error_setg(errp, "requested x-dirty-bitmap %s not found",
+                       s->x_dirty_bitmap);
+            return -EINVAL;
+        }
+        if (strcmp(s->x_dirty_bitmap, "qemu:allocation-depth") == 0) {
+            s->alloc_depth = true;
+        }
+    }
+
+    if (s->info.flags & NBD_FLAG_READ_ONLY) {
+        ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    if (s->info.flags & NBD_FLAG_SEND_FUA) {
+        bs->supported_write_flags = BDRV_REQ_FUA;
+        bs->supported_zero_flags |= BDRV_REQ_FUA;
+    }
+
+    if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
+        bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
+        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
+            bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
+        }
+    }
+
+    trace_nbd_client_handshake_success(s->export);
+
+    return 0;
+}
+
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
@@ -1575,32 +1620,25 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
         s->sioc = NULL;
         return ret;
     }
-    if (s->x_dirty_bitmap) {
-        if (!s->info.base_allocation) {
-            error_setg(errp, "requested x-dirty-bitmap %s not found",
-                       s->x_dirty_bitmap);
-            ret = -EINVAL;
-            goto fail;
-        }
-        if (strcmp(s->x_dirty_bitmap, "qemu:allocation-depth") == 0) {
-            s->alloc_depth = true;
-        }
-    }
-    if (s->info.flags & NBD_FLAG_READ_ONLY) {
-        ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
-        if (ret < 0) {
-            goto fail;
-        }
-    }
-    if (s->info.flags & NBD_FLAG_SEND_FUA) {
-        bs->supported_write_flags = BDRV_REQ_FUA;
-        bs->supported_zero_flags |= BDRV_REQ_FUA;
-    }
-    if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
-        bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
-        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
-            bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
-        }
+
+    ret = nbd_handle_updated_info(bs, errp);
+    if (ret < 0) {
+        /*
+         * We have connected, but must fail for other reasons.
+         * Send NBD_CMD_DISC as a courtesy to the server.
+         */
+        NBDRequest request = { .type = NBD_CMD_DISC };
+
+        nbd_send_request(s->ioc ?: QIO_CHANNEL(s->sioc), &request);
+
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                                 nbd_yank, bs);
+        object_unref(OBJECT(s->sioc));
+        s->sioc = NULL;
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
+
+        return ret;
     }

     if (!s->ioc) {
@@ -1608,29 +1646,7 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
         object_ref(OBJECT(s->ioc));
     }

-    trace_nbd_client_handshake_success(s->export);
-
     return 0;
-
- fail:
-    /*
-     * We have connected, but must fail for other reasons.
-     * Send NBD_CMD_DISC as a courtesy to the server.
-     */
-    {
-        NBDRequest request = { .type = NBD_CMD_DISC };
-
-        nbd_send_request(s->ioc ?: QIO_CHANNEL(s->sioc), &request);
-
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                 nbd_yank, bs);
-        object_unref(OBJECT(s->sioc));
-        s->sioc = NULL;
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
-
-        return ret;
-    }
 }

 /*
-- 
2.31.1


