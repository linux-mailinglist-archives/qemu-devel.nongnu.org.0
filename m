Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C37C273E8E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 11:31:32 +0200 (CEST)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKee3-0004GA-FM
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 05:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1kKeW1-0002E8-0e; Tue, 22 Sep 2020 05:23:13 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:48959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1kKeVy-0005ca-15; Tue, 22 Sep 2020 05:23:12 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C5701454B8;
 Tue, 22 Sep 2020 11:14:36 +0200 (CEST)
From: =?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu 3/4] mirror: move some checks to qmp
Date: Tue, 22 Sep 2020 11:14:17 +0200
Message-Id: <20200922091418.53562-4-f.gruenbichler@proxmox.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200922091418.53562-1-f.gruenbichler@proxmox.com>
References: <20200922091418.53562-1-f.gruenbichler@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=f.gruenbichler@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 05:14:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

and assert the passing conditions in block/mirror.c. while incremental
mode was never available for drive-mirror, it makes the interface more
in line with  backup block jobs.

Signed-off-by: Fabian Grünbichler <f.gruenbichler@proxmox.com>
---
 block/mirror.c | 28 +++++-----------------------
 blockdev.c     | 29 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index bc4f4563d9..fe70f9b93c 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1592,31 +1592,13 @@ static BlockJob *mirror_start_job(
     Error *local_err = NULL;
     int ret;
 
-    if (sync_mode == MIRROR_SYNC_MODE_INCREMENTAL) {
-        error_setg(errp, "Sync mode '%s' not supported",
-                   MirrorSyncMode_str(sync_mode));
-        return NULL;
-    } else if (sync_mode == MIRROR_SYNC_MODE_BITMAP) {
-        if (!bitmap) {
-            error_setg(errp, "Must provide a valid bitmap name for '%s'"
-                       " sync mode",
-                       MirrorSyncMode_str(sync_mode));
-            return NULL;
-        }
-    } else if (bitmap) {
-        error_setg(errp,
-                   "sync mode '%s' is not compatible with bitmaps",
-                   MirrorSyncMode_str(sync_mode));
-        return NULL;
-    }
+    /* QMP interface protects us from these cases */
+    assert(sync_mode != MIRROR_SYNC_MODE_INCREMENTAL);
+    assert((bitmap && sync_mode == MIRROR_SYNC_MODE_BITMAP) ||
+           (!bitmap && sync_mode != MIRROR_SYNC_MODE_BITMAP));
+    assert(!(bitmap && granularity));
 
     if (bitmap) {
-        if (granularity) {
-            error_setg(errp, "granularity (%d)"
-                       "cannot be specified when a bitmap is provided",
-                       granularity);
-            return NULL;
-        }
         granularity = bdrv_dirty_bitmap_granularity(bitmap);
 
         if (bitmap_mode != BITMAP_SYNC_MODE_NEVER) {
diff --git a/blockdev.c b/blockdev.c
index 0fd30a392d..3b090cc749 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2998,7 +2998,36 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
         sync = MIRROR_SYNC_MODE_FULL;
     }
 
+    if ((sync == MIRROR_SYNC_MODE_BITMAP) ||
+        (sync == MIRROR_SYNC_MODE_INCREMENTAL)) {
+        /* done before desugaring 'incremental' to print the right message */
+        if (!has_bitmap) {
+            error_setg(errp, "Must provide a valid bitmap name for "
+                       "'%s' sync mode", MirrorSyncMode_str(sync));
+            return;
+        }
+    }
+
+    if (sync == MIRROR_SYNC_MODE_INCREMENTAL) {
+        if (has_bitmap_mode &&
+            bitmap_mode != BITMAP_SYNC_MODE_ON_SUCCESS) {
+            error_setg(errp, "Bitmap sync mode must be '%s' "
+                       "when using sync mode '%s'",
+                       BitmapSyncMode_str(BITMAP_SYNC_MODE_ON_SUCCESS),
+                       MirrorSyncMode_str(sync));
+            return;
+        }
+        has_bitmap_mode = true;
+        sync = MIRROR_SYNC_MODE_BITMAP;
+        bitmap_mode = BITMAP_SYNC_MODE_ON_SUCCESS;
+    }
+
     if (has_bitmap) {
+        if (sync != MIRROR_SYNC_MODE_BITMAP) {
+            error_setg(errp, "Sync mode '%s' not supported with bitmap.",
+                       MirrorSyncMode_str(sync));
+            return;
+        }
         if (granularity) {
             error_setg(errp, "Granularity and bitmap cannot both be set");
             return;
-- 
2.20.1



