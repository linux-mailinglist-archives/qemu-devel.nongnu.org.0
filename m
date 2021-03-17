Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322533F64F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:12:32 +0100 (CET)
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZig-0007eE-0f
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ7A-0000N4-F8
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:33:46 -0400
Received: from relay.sw.ru ([185.231.240.75]:49604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ75-0004jS-3G
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=cOs5lK6sYyvwHZDboMekbywKe4agSAHQpulY6WbxnJ0=; b=sD6sP6IU9fgi
 wKGWSe0ZuJz5zuaUb/Nr6Xzd9DhnOMNlaD8TdpDKdWGkcNsLZmeJDgBmQvV8tvpP4MELbxXvWdZ5X
 UwU4ro7ZH6CTAzGTTygei6M0oNzSbfij0LgEUjNckKk4R2vODgDvwsaEgB0hvRfmCBwU9x7cAlOr5
 ISz7c=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ6R-0034yI-S8; Wed, 17 Mar 2021 19:33:00 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH 2/9] migration/snap-tool: Snapshot image create/open
 routines for qemu-snap tool
Date: Wed, 17 Mar 2021 19:32:15 +0300
Message-Id: <20210317163222.182609-3-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
References: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implementation of routines for QCOW2 image creation and opening. Some
predefined parameters for image creation and opening are introduced that
provide reasonable tradeoff between performance, file size and usability.

Thus, it was chosen to disable preallocation and keep image file dense on
host file system, the apparent file size equals allocated in this case
which is anyways beneficial for the user experience.
Larger 1MB cluster size is adopted to reduce allocation overhead and
improve I/O performance while keeping internal fragmentation of snapshot
image reasonably small.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 qemu-snap.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 90 insertions(+), 4 deletions(-)

diff --git a/qemu-snap.c b/qemu-snap.c
index c7118927f7..c9f8d7166a 100644
--- a/qemu-snap.c
+++ b/qemu-snap.c
@@ -31,6 +31,16 @@
 #include "migration/qemu-file.h"
 #include "qemu-snap.h"
 
+/* QCOW2 image options */
+#define BLK_FORMAT_DRIVER       "qcow2"
+#define BLK_CREATE_OPT_STRING   "preallocation=off,lazy_refcounts=on,"  \
+                                        "extended_l2=off,compat=v3,cluster_size=1M,"    \
+                                        "refcount_bits=8"
+/* L2 cache size to cover 2TB of memory */
+#define BLK_L2_CACHE_SIZE       "16M"
+/* Single L2 cache entry for the whole L2 table */
+#define BLK_L2_CACHE_ENTRY_SIZE "1M"
+
 #define OPT_CACHE   256
 #define OPT_AIO     257
 
@@ -104,30 +114,106 @@ static void snap_load_destroy_state(void)
     /* TODO: implement */
 }
 
+static BlockBackend *snap_create(const char *filename, int64_t image_size,
+        int flags, bool writethrough)
+{
+    char *create_opt_string;
+    QDict *blk_opts;
+    BlockBackend *blk;
+    Error *local_err = NULL;
+
+    /* Create QCOW2 image with given parameters */
+    create_opt_string = g_strdup(BLK_CREATE_OPT_STRING);
+    bdrv_img_create(filename, BLK_FORMAT_DRIVER, NULL, NULL,
+            create_opt_string, image_size, flags, true, &local_err);
+    g_free(create_opt_string);
+
+    if (local_err) {
+        error_reportf_err(local_err, "Could not create '%s': ", filename);
+        goto fail;
+    }
+
+    /* Block backend open options */
+    blk_opts = qdict_new();
+    qdict_put_str(blk_opts, "driver", BLK_FORMAT_DRIVER);
+    qdict_put_str(blk_opts, "l2-cache-size", BLK_L2_CACHE_SIZE);
+    qdict_put_str(blk_opts, "l2-cache-entry-size", BLK_L2_CACHE_ENTRY_SIZE);
+
+    /* Open block backend instance for the created image */
+    blk = blk_new_open(filename, NULL, blk_opts, flags, &local_err);
+    if (!blk) {
+        error_reportf_err(local_err, "Could not open '%s': ", filename);
+        /* Delete image file */
+        qemu_unlink(filename);
+        goto fail;
+    }
+
+    blk_set_enable_write_cache(blk, !writethrough);
+    return blk;
+
+fail:
+    return NULL;
+}
+
+static BlockBackend *snap_open(const char *filename, int flags)
+{
+    QDict *blk_opts;
+    BlockBackend *blk;
+    Error *local_err = NULL;
+
+    /* Block backend open options */
+    blk_opts = qdict_new();
+    qdict_put_str(blk_opts, "driver", BLK_FORMAT_DRIVER);
+    qdict_put_str(blk_opts, "l2-cache-size", BLK_L2_CACHE_SIZE);
+    qdict_put_str(blk_opts, "l2-cache-entry-size", BLK_L2_CACHE_ENTRY_SIZE);
+
+    /* Open block backend instance */
+    blk = blk_new_open(filename, NULL, blk_opts, flags, &local_err);
+    if (!blk) {
+        error_reportf_err(local_err, "Could not open '%s': ", filename);
+        return NULL;
+    }
+
+    return blk;
+}
+
 static int snap_save(const SnapSaveParams *params)
 {
     SnapSaveState *sn;
+    int res = -1;
 
     snap_save_init_state();
     sn = snap_save_get_state();
-    (void) sn;
 
+    sn->blk = snap_create(params->filename, params->image_size,
+            params->bdrv_flags, params->writethrough);
+    if (!sn->blk) {
+        goto fail;
+    }
+
+fail:
     snap_save_destroy_state();
 
-    return 0;
+    return res;
 }
 
 static int snap_load(SnapLoadParams *params)
 {
     SnapLoadState *sn;
+    int res = -1;
 
     snap_load_init_state();
     sn = snap_load_get_state();
-    (void) sn;
 
+    sn->blk = snap_open(params->filename, params->bdrv_flags);
+    if (!sn->blk) {
+        goto fail;
+    }
+
+fail:
     snap_load_destroy_state();
 
-    return 0;
+    return res;
 }
 
 static int64_t cvtnum_full(const char *name, const char *value,
-- 
2.25.1


