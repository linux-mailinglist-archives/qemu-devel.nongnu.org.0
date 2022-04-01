Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6D4EEA58
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:24:22 +0200 (CEST)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDW1-0003sF-OV
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:24:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRY-0000Hh-FH
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:46 -0400
Received: from [2a00:1450:4864:20::22c] (port=45621
 helo=mail-lj1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRU-0006sk-W0
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:43 -0400
Received: by mail-lj1-x22c.google.com with SMTP id q14so3042601ljc.12
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ViEHEA0d9uGyAW6tQbnNNxaf+SfwsruQbjKtBfxNGc4=;
 b=51k6CfCRQW/N83/SBuEwjwusB6K0BzbCDzCypBbImftYN/ixPULgDiGbJv5mS0KpUX
 RZTMfYeV/tAeRTIZLit4/iti58TyDVLk724C5sLlHJ9M+Kp1PtudkybFUVeDwoFkm6NX
 hF/yODnhvdhgPAvGQnmoL4Gph0PtL1fnqxzI7AAMcNqVDyEfLMbR3hIBrtD0NtZ64puk
 BC3lRlO1r+5E1ZEM0ojgyIIEo9gFLdqXxj4/4Lksbf81njyQzBpD/3xRsE0Qblo1Q9MW
 qzlFRvfJdG2oNd4D6Xh0rM6LzG/SUujoemXdpEwOn1bOPord0K02pkmuOkBq6wCHGrzD
 jMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ViEHEA0d9uGyAW6tQbnNNxaf+SfwsruQbjKtBfxNGc4=;
 b=ANnhD47VbMDTLYcBHc8XF2KHdWgLz52dEVyuZd2c8qosIieO+URGHltxKHt5sm1dh+
 4EuWrndZVotv7Zf2kUnr2DBrmtl4GdT8ixzgX8iDx+G87LkRrEUyLeWjJ7/+QQa6GoH7
 gopnkl3PWhQD5w8YWb3QwZXyKJvkAySDXHyoukxx648jh9ifu9FTkVxfR7XiR6nAmqYG
 GxcuIwE95lo47nPL2LM6yRH++ldqG/w+47hzlKYvDmYM3Qqm8Wo3jBvFIviNNd0Ltdmn
 Cdkcgmdsrg7Fw+TnvzN4ysyzI9D+UIFDpSVS96P65LpNo0v3tPLm0HWINhE/8ZjDZizq
 33wQ==
X-Gm-Message-State: AOAM531Zg0f5NTzggpshrfJss43+HW2TCK2ouaBPv0n6qmiwO6uYZ1hI
 cWJM4/ot2Elu5SlxQE/+yDFHFA==
X-Google-Smtp-Source: ABdhPJyo2GO4w8+yhUqSisJTcX91gX2JH+QIwMa1cGmEFXSFvfL7cIdMioyB2p2FQ0v9VpxJ77z2jQ==
X-Received: by 2002:a2e:9dc7:0:b0:24a:ff6a:c145 with SMTP id
 x7-20020a2e9dc7000000b0024aff6ac145mr2237797ljj.334.1648804775544; 
 Fri, 01 Apr 2022 02:19:35 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 d16-20020a2eb050000000b002461d8f365bsm155135ljl.38.2022.04.01.02.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:19:35 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/7] block/copy-before-write: add on-cbw-error open
 parameter
Date: Fri,  1 Apr 2022 12:19:15 +0300
Message-Id: <20220401091920.287612-3-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401091920.287612-1-vsementsov@openvz.org>
References: <20220401091920.287612-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, behavior on copy-before-write operation failure is simple:
report error to the guest.

Let's implement alternative behavior: break the whole copy-before-write
process (and corresponding backup job or NBD client) but keep guest
working. It's needed if we consider guest stability as more important.

The realisation is simple: on copy-before-write failure we immediately
continue guest write operation and set s->snapshot_ret variable which
will lead to all further and in-flight snapshot-API requests failure.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/copy-before-write.c | 62 ++++++++++++++++++++++++++++++++++-----
 qapi/block-core.json      | 27 ++++++++++++++++-
 2 files changed, 81 insertions(+), 8 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 394e73b094..0614c3d08b 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -41,6 +41,7 @@
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+    OnCbwError on_cbw_error;
 
     /*
      * @lock: protects access to @access_bitmap, @done_bitmap and
@@ -65,6 +66,14 @@ typedef struct BDRVCopyBeforeWriteState {
      * node. These areas must not be rewritten by guest.
      */
     BlockReqList frozen_read_reqs;
+
+    /*
+     * @snapshot_error is normally zero. But on first copy-before-write failure
+     * when @on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT, @snapshot_error takes
+     * value of this error (<0). After that all in-flight and further
+     * snaoshot-API requests will fail with that error.
+     */
+    int snapshot_error;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -99,11 +108,25 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
     ret = block_copy(s->bcs, off, end - off, true);
-    if (ret < 0) {
+    if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
+        if (ret < 0) {
+            assert(s->on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT);
+            if (!s->snapshot_error) {
+                s->snapshot_error = ret;
+            }
+            /*
+             * No need to wait for s->frozen_read_reqs: they will fail anyway,
+             * as s->snapshot_error is set.
+             *
+             * We return 0, as error is handled. Guest operation should be
+             * continued.
+             */
+            return 0;
+        }
         bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
         reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
     }
@@ -176,6 +199,11 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
 
     QEMU_LOCK_GUARD(&s->lock);
 
+    if (s->snapshot_error) {
+        g_free(req);
+        return NULL;
+    }
+
     if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
         g_free(req);
         return NULL;
@@ -198,19 +226,26 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
     return req;
 }
 
-static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+static int cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
     if (req->offset == -1 && req->bytes == -1) {
         g_free(req);
-        return;
+        /*
+         * No real need to read snapshot_error under mutex here: we are actually
+         * safe to ignore it and return 0, as this request was to s->target, and
+         * can't be influenced by guest write. But if we can new read negative
+         * s->snapshot_error let's return it, so that backup failed earlier.
+         */
+        return s->snapshot_error;
     }
 
     QEMU_LOCK_GUARD(&s->lock);
 
     reqlist_remove_req(req);
     g_free(req);
+    return s->snapshot_error;
 }
 
 static coroutine_fn int
@@ -219,7 +254,7 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
 {
     BlockReq *req;
     BdrvChild *file;
-    int ret;
+    int ret, ret2;
 
     /* TODO: upgrade to async loop using AioTask */
     while (bytes) {
@@ -232,10 +267,13 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
 
         ret = bdrv_co_preadv_part(file, offset, cur_bytes,
                                   qiov, qiov_offset, 0);
-        cbw_snapshot_read_unlock(bs, req);
+        ret2 = cbw_snapshot_read_unlock(bs, req);
         if (ret < 0) {
             return ret;
         }
+        if (ret2 < 0) {
+            return ret2;
+        }
 
         bytes -= cur_bytes;
         offset += cur_bytes;
@@ -253,7 +291,7 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BlockReq *req;
-    int ret;
+    int ret, ret2;
     int64_t cur_bytes;
     BdrvChild *child;
 
@@ -273,7 +311,14 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
         assert(ret & BDRV_BLOCK_ALLOCATED);
     }
 
-    cbw_snapshot_read_unlock(bs, req);
+    ret2 = cbw_snapshot_read_unlock(bs, req);
+
+    if (ret < 0) {
+        return ret;
+    }
+    if (ret2 < 0) {
+        return ret2;
+    }
 
     return ret;
 }
@@ -366,6 +411,7 @@ static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
      * object for original options.
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
+    qdict_del(options, "on-cbw-error");
 
 out:
     visit_free(v);
@@ -407,6 +453,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             return -EINVAL;
         }
     }
+    s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
+            ON_CBW_ERROR_BREAK_GUEST_WRITE;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
diff --git a/qapi/block-core.json b/qapi/block-core.json
index e89f2dfb5b..3f08025114 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4162,6 +4162,27 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*bottom': 'str' } }
 
+##
+# @OnCbwError:
+#
+# An enumeration of possible behaviors for copy-before-write operation
+# failures.
+#
+# @break-guest-write: report the error to the guest. This way the state
+#                     of copy-before-write process is kept OK and
+#                     copy-before-write filter continues to work normally.
+#
+# @break-snapshot: continue guest write. Since this, the snapshot state
+#                  provided by copy-before-write filter becomes broken.
+#                  So, all in-flight and all further snapshot-access
+#                  operations (through snapshot-access block driver)
+#                  will fail.
+#
+# Since: 7.0
+##
+{ 'enum': 'OnCbwError',
+  'data': [ 'break-guest-write', 'break-snapshot' ] }
+
 ##
 # @BlockdevOptionsCbw:
 #
@@ -4183,11 +4204,15 @@
 #          modifications (or removing) of specified bitmap doesn't
 #          influence the filter. (Since 7.0)
 #
+# @on-cbw-error: Behavior on failure of copy-before-write operation.
+#                Default is @break-guest-write. (Since 7.0)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
+            '*on-cbw-error': 'OnCbwError' } }
 
 ##
 # @BlockdevOptions:
-- 
2.35.1


