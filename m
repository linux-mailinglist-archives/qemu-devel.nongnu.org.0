Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A04F80A8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:34:55 +0200 (CEST)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSHm-0005oa-Ky
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAp-00076Z-SQ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:44 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:33527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAm-0007tR-Q2
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:43 -0400
Received: by mail-lf1-x12a.google.com with SMTP id bu29so9723359lfb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MK8pPU12kjPgTFt+DOPb8QAB/ifI3wj1b2ZKZFO8n2Y=;
 b=PoWHWcJBphO4WFEfrunAi90n8jzfhNgwqHLSUMhTjMFD8dIjBbx3km0et06LEGbHIQ
 fMxg7Z8osy9aYNpOZRMWSOm+t6tToo2A+ZVZeqFP7f4nQux5UBXHsxHC/1RNHqOccOnV
 IgDTGQcUgqiibZP4uJx1P+hVefOqOA5wHy1xjHqVl+WJmzg2pZYr78AHMsaLjNlE19J5
 OcLGzN/kCM4RrablcHulrM7cS8BJrYje2FwnfqAixrEKbNf+Fh/Ub4I+wSHsWb2atdJj
 HX/Uss9Z0RmfwjvG3gyxpO+NrLDudEaOOym6kOrjhWfENr6QzQ13bnhbKioT/9bhRHSw
 lPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MK8pPU12kjPgTFt+DOPb8QAB/ifI3wj1b2ZKZFO8n2Y=;
 b=Ghh9J1HxnPnLsftQJf6X1Wu4TLTPLRTXEzYOgTC2LlzA8Gw8VbSuVHoK3fnpfxs+Ej
 B8BhmjxI5mw7VUSRh/N3nP9BgldOw7MOABskpmRpBYk4aXO5P1G0NOkEO+LdSqCq4FRr
 HBEcFNT8Y4koEBeDSAdFe3Di7a5MblGEWL0UKSBj6cmUpYbyL1coMPoX0ZlwdEnNBGUM
 uZ//ltzRGdyas2s2aPAM9XVDZg25M0UoAgLt0OeY6229zK8h8ajmX7BoAHIYzTFAeeWk
 0ApgCQjLtZHkKQnu6yBJoJ+v5LAwMJ2/DJsu18vQwa/cVAbWwkSX2ICg14415+sYBqcY
 xBTw==
X-Gm-Message-State: AOAM5333cM9AoBWC08lNnDkNNrT+A8g0NXDbQhD2aT13iKNyF86V9Vbi
 Wz9zZ5MJu8/zCFEJ61aiVFbk0A==
X-Google-Smtp-Source: ABdhPJwxWe7vXsvdJ5tyXI7nRV0GLhGPXNU/3J3b/na5Ig6y/QSuKnHvsfw/QHPIEyRjZw5CuZXG7Q==
X-Received: by 2002:a05:6512:10c3:b0:45c:d26a:d5e with SMTP id
 k3-20020a05651210c300b0045cd26a0d5emr9352194lfg.296.1649338059078; 
 Thu, 07 Apr 2022 06:27:39 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b0024b0437ed8asm1929271ljg.7.2022.04.07.06.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:27:38 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v4 2/7] block/copy-before-write: add on-cbw-error open
 parameter
Date: Thu,  7 Apr 2022 16:27:21 +0300
Message-Id: <20220407132726.85114-3-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407132726.85114-1-vsementsov@openvz.org>
References: <20220407132726.85114-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The realisation is simple: on copy-before-write failure we set
s->snapshot_ret and continue guest operations. s->snapshot_ret being
set will lead to all further snapshot API requests. Note that all
in-flight snapshot-API requests may still success: we do wait for them
on BREAK_SNAPSHOT-failure path in cbw_do_copy_before_write().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block-core.json      | 25 ++++++++++++++++++++++++-
 block/copy-before-write.c | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index beeb91952a..6b870b2f37 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4163,6 +4163,25 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { '*bottom': 'str' } }
 
+##
+# @OnCbwError:
+#
+# An enumeration of possible behaviors for copy-before-write operation
+# failures.
+#
+# @break-guest-write: report the error to the guest. This way, the guest
+#                     will not be able to overwrite areas that cannot be
+#                     backed up, so the backup process remains valid.
+#
+# @break-snapshot: continue guest write. Doing so will make the provided
+#                  snapshot state invalid and any backup or export
+#                  process based on it will finally fail.
+#
+# Since: 7.1
+##
+{ 'enum': 'OnCbwError',
+  'data': [ 'break-guest-write', 'break-snapshot' ] }
+
 ##
 # @BlockdevOptionsCbw:
 #
@@ -4184,11 +4203,15 @@
 #          modifications (or removing) of specified bitmap doesn't
 #          influence the filter. (Since 7.0)
 #
+# @on-cbw-error: Behavior on failure of copy-before-write operation.
+#                Default is @break-guest-write. (Since 7.1)
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
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index e29c46cd7a..c8a11a09d2 100644
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
+     * snapshot-API requests will fail with that error.
+     */
+    int snapshot_error;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -95,16 +104,27 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
         return 0;
     }
 
+    if (s->snapshot_error) {
+        return 0;
+    }
+
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
     ret = block_copy(s->bcs, off, end - off, true);
-    if (ret < 0) {
+    if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
-        bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
+        if (ret < 0) {
+            assert(s->on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT);
+            if (!s->snapshot_error) {
+                s->snapshot_error = ret;
+            }
+        } else {
+            bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
+        }
         reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
     }
 
@@ -176,6 +196,11 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
 
     QEMU_LOCK_GUARD(&s->lock);
 
+    if (s->snapshot_error) {
+        g_free(req);
+        return NULL;
+    }
+
     if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
         g_free(req);
         return NULL;
@@ -351,6 +376,7 @@ static BlockdevOptions *cbw_parse_options(QDict *options, Error **errp)
      * object for original options.
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
+    qdict_del(options, "on-cbw-error");
 
 out:
     visit_free(v);
@@ -395,6 +421,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             return -EINVAL;
         }
     }
+    s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
+            ON_CBW_ERROR_BREAK_GUEST_WRITE;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-- 
2.35.1


