Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD1E288044
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 04:13:51 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQhuo-0003Ms-KL
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 22:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kQhoo-00067C-P7
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 22:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kQhog-0006sB-2e
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 22:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602209247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jnj9zIISjvynJAb3iL34smTPNKHTz5UdnoDisyXaetk=;
 b=LEzdxmN/2c9Ys+gXQF5381sjWcIghqYcNB4yVUFVRVilNDxZfxHXuooEJ+DweQfoTiq/5L
 rew+uSQvCIlH7ePEqo6TFTRnKlBD3U786fzxmZsk7dGrG8MCJvqLDRxXhk6bSMQaSm5wei
 SePPNoEwZiYt95l7oSDNWWhgFp1u0K8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-gdennriqMnOyb5osbg190Q-1; Thu, 08 Oct 2020 22:07:25 -0400
X-MC-Unique: gdennriqMnOyb5osbg190Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA7D084A5F7;
 Fri,  9 Oct 2020 02:07:24 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-14.phx2.redhat.com [10.3.113.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F9FB76650;
 Fri,  9 Oct 2020 02:07:24 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] nbd: Allow export of multiple bitmaps for one device
Date: Thu,  8 Oct 2020 21:07:14 -0500
Message-Id: <20201009020714.1074061-7-eblake@redhat.com>
In-Reply-To: <20201009020714.1074061-1-eblake@redhat.com>
References: <20201009020714.1074061-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 22:07:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 rjones@redhat.com, Max Reitz <mreitz@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With this, 'qemu-nbd -B b0 -B b1 -f qcow2 img.qcow2' can let you sniff
out multiple bitmaps from one server.  qemu-img as client can still
only read one bitmap per client connection, but other NBD clients
(hello libnbd) can now read multiple bitmaps in a single pass.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c           | 89 +++++++++++++++++++++++++++++-------------
 tests/qemu-iotests/291 |  6 +--
 2 files changed, 63 insertions(+), 32 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 3664f9e744b4..0017e18254a3 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -96,7 +96,8 @@ struct NBDExport {
     Notifier eject_notifier;

     bool alloc_context;
-    BdrvDirtyBitmap *export_bitmap;
+    BdrvDirtyBitmap **export_bitmaps;
+    size_t nr_export_bitmaps;
 };

 static QTAILQ_HEAD(, NBDExport) exports = QTAILQ_HEAD_INITIALIZER(exports);
@@ -109,7 +110,10 @@ typedef struct NBDExportMetaContexts {
     size_t count; /* number of negotiated contexts */
     bool base_allocation; /* export base:allocation context (block status) */
     bool allocation_depth; /* export qemu:allocation-depth */
-    bool bitmap; /* export qemu:dirty-bitmap:<export bitmap name> */
+    bool *bitmaps; /*
+                    * export qemu:dirty-bitmap:<export bitmap name>,
+                    * sized by exp->nr_export_bitmaps
+                    */
 } NBDExportMetaContexts;

 struct NBDClient {
@@ -861,6 +865,8 @@ static bool nbd_meta_base_query(NBDClient *client, NBDExportMetaContexts *meta,
 static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
                                 const char *query)
 {
+    size_t i;
+
     if (!nbd_strshift(&query, "qemu:")) {
         return false;
     }
@@ -869,7 +875,7 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
     if (!*query) {
         if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
             meta->allocation_depth = meta->exp->alloc_context;
-            meta->bitmap = !!meta->exp->export_bitmap;
+            memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
         }
         trace_nbd_negotiate_meta_query_parse("empty");
         return true;
@@ -882,17 +888,26 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
     }

     if (nbd_strshift(&query, "dirty-bitmap:")) {
-        const char *bm_name;
-
         trace_nbd_negotiate_meta_query_parse("dirty-bitmap:");
-        if (!meta->exp->export_bitmap) {
-            trace_nbd_negotiate_meta_query_skip("no dirty-bitmap exported");
+        if (!*query) {
+            if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
+                memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
+            }
+            trace_nbd_negotiate_meta_query_parse("empty");
             return true;
         }
-        bm_name = bdrv_dirty_bitmap_name(meta->exp->export_bitmap);
-        if (nbd_meta_empty_or_pattern(client, bm_name, query)) {
-            meta->bitmap = true;
+
+        for (i = 0; i < meta->exp->nr_export_bitmaps; i++) {
+            const char *bm_name;
+
+            bm_name = bdrv_dirty_bitmap_name(meta->exp->export_bitmaps[i]);
+            if (strcmp(bm_name, query) == 0) {
+                meta->bitmaps[i] = true;
+                trace_nbd_negotiate_meta_query_parse(query);
+                return true;
+            }
         }
+        trace_nbd_negotiate_meta_query_skip("no dirty-bitmap match");
         return true;
     }

@@ -954,9 +969,10 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
 {
     int ret;
     g_autofree char *export_name = NULL;
-    NBDExportMetaContexts local_meta;
+    g_autofree bool *bitmaps = NULL;
+    NBDExportMetaContexts local_meta = {0};
     uint32_t nb_queries;
-    int i;
+    size_t i;
     size_t count = 0;

     if (!client->structured_reply) {
@@ -971,6 +987,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         meta = &local_meta;
     }

+    g_free(meta->bitmaps);
     memset(meta, 0, sizeof(*meta));

     ret = nbd_opt_read_name(client, &export_name, NULL, errp);
@@ -985,6 +1002,10 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         return nbd_opt_drop(client, NBD_REP_ERR_UNKNOWN, errp,
                             "export '%s' not present", sane_name);
     }
+    meta->bitmaps = g_new0(bool, meta->exp->nr_export_bitmaps);
+    if (client->opt == NBD_OPT_LIST_META_CONTEXT) {
+        bitmaps = meta->bitmaps;
+    }

     ret = nbd_opt_read(client, &nb_queries, sizeof(nb_queries), false, errp);
     if (ret <= 0) {
@@ -998,7 +1019,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         /* enable all known contexts */
         meta->base_allocation = true;
         meta->allocation_depth = meta->exp->alloc_context;
-        meta->bitmap = !!meta->exp->export_bitmap;
+        memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);
     } else {
         for (i = 0; i < nb_queries; ++i) {
             ret = nbd_negotiate_meta_query(client, meta, errp);
@@ -1028,13 +1049,19 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         count++;
     }

-    if (meta->bitmap) {
-        const char *bm_name = bdrv_dirty_bitmap_name(meta->exp->export_bitmap);
-        g_autofree char *context = g_strdup_printf("qemu:dirty-bitmap:%s",
-                                                   bm_name);
+    for (i = 0; i < meta->exp->nr_export_bitmaps; i++) {
+        const char *bm_name;
+        g_autofree char *context = NULL;
+
+        if (!meta->bitmaps[i]) {
+            continue;
+        }
+
+        bm_name = bdrv_dirty_bitmap_name(meta->exp->export_bitmaps[i]);
+        context = g_strdup_printf("qemu:dirty-bitmap:%s", bm_name);

         ret = nbd_negotiate_send_meta_context(client, context,
-                                              NBD_META_ID_DIRTY_BITMAP,
+                                              NBD_META_ID_DIRTY_BITMAP + i,
                                               errp);
         if (ret < 0) {
             return ret;
@@ -1388,6 +1415,7 @@ void nbd_client_put(NBDClient *client)
             QTAILQ_REMOVE(&client->exp->clients, client, next);
             blk_exp_unref(&client->exp->common);
         }
+        g_free(client->export_meta.bitmaps);
         g_free(client);
     }
 }
@@ -1565,11 +1593,11 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     }
     exp->size = QEMU_ALIGN_DOWN(size, BDRV_SECTOR_SIZE);

-    /* XXX Allow more than one bitmap */
-    if (arg->bitmaps && arg->bitmaps->next) {
-        error_setg(errp, "multiple bitmaps per export not supported yet");
-        return -EOPNOTSUPP;
+    for (bitmaps = arg->bitmaps; bitmaps; bitmaps = bitmaps->next) {
+        exp->nr_export_bitmaps++;
     }
+    exp->export_bitmaps = g_new0(BdrvDirtyBitmap *, exp->nr_export_bitmaps);
+    exp->nr_export_bitmaps = 0;
     for (bitmaps = arg->bitmaps; bitmaps; bitmaps = bitmaps->next) {
         const char *bitmap = bitmaps->value;
         BlockDriverState *bs = blk_bs(blk);
@@ -1605,7 +1633,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
         }

         bdrv_dirty_bitmap_set_busy(bm, true);
-        exp->export_bitmap = bm;
+        exp->export_bitmaps[exp->nr_export_bitmaps++] = bm;
         assert(strlen(bitmap) <= BDRV_BITMAP_MAX_NAME_SIZE);
     }

@@ -1667,6 +1695,7 @@ static void nbd_export_request_shutdown(BlockExport *blk_exp)

 static void nbd_export_delete(BlockExport *blk_exp)
 {
+    size_t i;
     NBDExport *exp = container_of(blk_exp, NBDExport, common);

     assert(exp->name == NULL);
@@ -1684,8 +1713,8 @@ static void nbd_export_delete(BlockExport *blk_exp)
                                         blk_aio_detach, exp);
     }

-    if (exp->export_bitmap) {
-        bdrv_dirty_bitmap_set_busy(exp->export_bitmap, false);
+    for (i = 0; i < exp->nr_export_bitmaps; i++) {
+        bdrv_dirty_bitmap_set_busy(exp->export_bitmaps[i], false);
     }
 }

@@ -2332,6 +2361,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
     int flags;
     NBDExport *exp = client->exp;
     char *msg;
+    size_t i;

     switch (request->type) {
     case NBD_CMD_CACHE:
@@ -2435,12 +2465,15 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
                 }
             }

-            if (client->export_meta.bitmap) {
+            for (i = 0; i < client->exp->nr_export_bitmaps; i++) {
+                if (!client->export_meta.bitmaps[i]) {
+                    continue;
+                }
                 ret = nbd_co_send_bitmap(client, request->handle,
-                                         client->exp->export_bitmap,
+                                         client->exp->export_bitmaps[i],
                                          request->from, request->len,
                                          dont_fragment, !--contexts_remaining,
-                                         NBD_META_ID_DIRTY_BITMAP, errp);
+                                         NBD_META_ID_DIRTY_BITMAP + i, errp);
                 if (ret < 0) {
                     return ret;
                 }
diff --git a/tests/qemu-iotests/291 b/tests/qemu-iotests/291
index 4f837b205655..37848ac60bba 100755
--- a/tests/qemu-iotests/291
+++ b/tests/qemu-iotests/291
@@ -107,16 +107,14 @@ echo
 # x-dirty-bitmap is a hack for reading bitmaps; it abuses block status to
 # report "data":false for portions of the bitmap which are set
 IMG="driver=nbd,server.type=unix,server.path=$nbd_unix_socket"
-nbd_server_start_unix_socket -r -f qcow2 -B b0 "$TEST_IMG"
+nbd_server_start_unix_socket -r -f qcow2 \
+    -B b0 -B b1 -B b2 -B b3 "$TEST_IMG"
 $QEMU_IMG map --output=json --image-opts \
     "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b0" | _filter_qemu_img_map
-nbd_server_start_unix_socket -r -f qcow2 -B b1 "$TEST_IMG"
 $QEMU_IMG map --output=json --image-opts \
     "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b1" | _filter_qemu_img_map
-nbd_server_start_unix_socket -r -f qcow2 -B b2 "$TEST_IMG"
 $QEMU_IMG map --output=json --image-opts \
     "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b2" | _filter_qemu_img_map
-nbd_server_start_unix_socket -r -f qcow2 -B b3 "$TEST_IMG"
 $QEMU_IMG map --output=json --image-opts \
     "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b3" | _filter_qemu_img_map

-- 
2.28.0


