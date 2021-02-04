Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2BC30F9D8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:36:54 +0100 (CET)
Received: from localhost ([::1]:35184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iYn-0007vx-IL
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hhS-0003B0-VU
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hhQ-0005SS-FP
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUWamYU21yHx0lZ1uvO8Nq9sAhO1HE51cuYk8gqkjLc=;
 b=eJrC8/X7XhTPjbMBOK+YY0qXW0d+pyT/ksjtSEzoNy30/6ymGbL8jbBFWZizhqj0Wbs+eA
 5E6ZW/4aM7/wuxKtNVhHSnLU2AItEfhxXtsAVE8+d3xJba6Y2r7VSITsHekP7aEuA8eJyI
 Q5Z020bu3hJgTbyBDmx3ZOdxzgrufuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-31rnn8uZM3iHF14PBj3Wow-1; Thu, 04 Feb 2021 11:41:41 -0500
X-MC-Unique: 31rnn8uZM3iHF14PBj3Wow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77EFE1800D50;
 Thu,  4 Feb 2021 16:41:40 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4515D19708;
 Thu,  4 Feb 2021 16:41:31 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 16/27] block: push error reporting into bdrv_all_*_snapshot
 functions
Date: Thu,  4 Feb 2021 16:39:48 +0000
Message-Id: <20210204163959.377618-17-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
References: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The bdrv_all_*_snapshot functions return a BlockDriverState pointer
for the invalid backend, which the callers then use to report an
error message. In some cases multiple callers are reporting the
same error message, but with slightly different text. In the future
there will be more error scenarios for some of these methods, which
will benefit from fine grained error message reporting. So it is
helpful to push error reporting down a level.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[PMD: Initialize variables]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210204124834.774401-2-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 block/monitor/block-hmp-cmds.c |  7 ++--
 block/snapshot.c               | 77 +++++++++++++++++-----------------
 include/block/snapshot.h       | 14 +++----
 migration/savevm.c             | 39 +++++------------
 monitor/hmp-cmds.c             |  7 +---
 replay/replay-debugging.c      |  4 +-
 tests/qemu-iotests/267.out     | 10 ++---
 7 files changed, 68 insertions(+), 90 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index afd75ab628..9532d085ea 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -900,10 +900,11 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
 
     ImageEntry *image_entry, *next_ie;
     SnapshotEntry *snapshot_entry;
+    Error *err = NULL;
 
-    bs = bdrv_all_find_vmstate_bs();
+    bs = bdrv_all_find_vmstate_bs(&err);
     if (!bs) {
-        monitor_printf(mon, "No available block device supports snapshots\n");
+        error_report_err(err);
         return;
     }
     aio_context = bdrv_get_aio_context(bs);
@@ -953,7 +954,7 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
     total = 0;
     for (i = 0; i < nb_sns; i++) {
         SnapshotEntry *next_sn;
-        if (bdrv_all_find_snapshot(sn_tab[i].name, &bs1) == 0) {
+        if (bdrv_all_find_snapshot(sn_tab[i].name, NULL) == 0) {
             global_snapshots[total] = i;
             total++;
             QTAILQ_FOREACH(image_entry, &image_list, next) {
diff --git a/block/snapshot.c b/block/snapshot.c
index a2bf3a54eb..482e3fc7b7 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -462,14 +462,14 @@ static bool bdrv_all_snapshots_includes_bs(BlockDriverState *bs)
  * These functions will properly handle dataplane (take aio_context_acquire
  * when appropriate for appropriate block drivers) */
 
-bool bdrv_all_can_snapshot(BlockDriverState **first_bad_bs)
+bool bdrv_all_can_snapshot(Error **errp)
 {
-    bool ok = true;
     BlockDriverState *bs;
     BdrvNextIterator it;
 
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *ctx = bdrv_get_aio_context(bs);
+        bool ok = true;
 
         aio_context_acquire(ctx);
         if (bdrv_all_snapshots_includes_bs(bs)) {
@@ -477,26 +477,25 @@ bool bdrv_all_can_snapshot(BlockDriverState **first_bad_bs)
         }
         aio_context_release(ctx);
         if (!ok) {
+            error_setg(errp, "Device '%s' is writable but does not support "
+                       "snapshots", bdrv_get_device_or_node_name(bs));
             bdrv_next_cleanup(&it);
-            goto fail;
+            return false;
         }
     }
 
-fail:
-    *first_bad_bs = bs;
-    return ok;
+    return true;
 }
 
-int bdrv_all_delete_snapshot(const char *name, BlockDriverState **first_bad_bs,
-                             Error **errp)
+int bdrv_all_delete_snapshot(const char *name, Error **errp)
 {
-    int ret = 0;
     BlockDriverState *bs;
     BdrvNextIterator it;
     QEMUSnapshotInfo sn1, *snapshot = &sn1;
 
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *ctx = bdrv_get_aio_context(bs);
+        int ret = 0;
 
         aio_context_acquire(ctx);
         if (bdrv_all_snapshots_includes_bs(bs) &&
@@ -507,26 +506,25 @@ int bdrv_all_delete_snapshot(const char *name, BlockDriverState **first_bad_bs,
         }
         aio_context_release(ctx);
         if (ret < 0) {
+            error_prepend(errp, "Could not delete snapshot '%s' on '%s': ",
+                          name, bdrv_get_device_or_node_name(bs));
             bdrv_next_cleanup(&it);
-            goto fail;
+            return -1;
         }
     }
 
-fail:
-    *first_bad_bs = bs;
-    return ret;
+    return 0;
 }
 
 
-int bdrv_all_goto_snapshot(const char *name, BlockDriverState **first_bad_bs,
-                           Error **errp)
+int bdrv_all_goto_snapshot(const char *name, Error **errp)
 {
-    int ret = 0;
     BlockDriverState *bs;
     BdrvNextIterator it;
 
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *ctx = bdrv_get_aio_context(bs);
+        int ret = 0;
 
         aio_context_acquire(ctx);
         if (bdrv_all_snapshots_includes_bs(bs)) {
@@ -534,75 +532,75 @@ int bdrv_all_goto_snapshot(const char *name, BlockDriverState **first_bad_bs,
         }
         aio_context_release(ctx);
         if (ret < 0) {
+            error_prepend(errp, "Could not load snapshot '%s' on '%s': ",
+                          name, bdrv_get_device_or_node_name(bs));
             bdrv_next_cleanup(&it);
-            goto fail;
+            return -1;
         }
     }
 
-fail:
-    *first_bad_bs = bs;
-    return ret;
+    return 0;
 }
 
-int bdrv_all_find_snapshot(const char *name, BlockDriverState **first_bad_bs)
+int bdrv_all_find_snapshot(const char *name, Error **errp)
 {
     QEMUSnapshotInfo sn;
-    int err = 0;
     BlockDriverState *bs;
     BdrvNextIterator it;
 
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *ctx = bdrv_get_aio_context(bs);
+        int ret = 0;
 
         aio_context_acquire(ctx);
         if (bdrv_all_snapshots_includes_bs(bs)) {
-            err = bdrv_snapshot_find(bs, &sn, name);
+            ret = bdrv_snapshot_find(bs, &sn, name);
         }
         aio_context_release(ctx);
-        if (err < 0) {
+        if (ret < 0) {
+            error_setg(errp, "Could not find snapshot '%s' on '%s'",
+                       name, bdrv_get_device_or_node_name(bs));
             bdrv_next_cleanup(&it);
-            goto fail;
+            return -1;
         }
     }
 
-fail:
-    *first_bad_bs = bs;
-    return err;
+    return 0;
 }
 
 int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
                              BlockDriverState *vm_state_bs,
                              uint64_t vm_state_size,
-                             BlockDriverState **first_bad_bs)
+                             Error **errp)
 {
-    int err = 0;
     BlockDriverState *bs;
     BdrvNextIterator it;
 
     for (bs = bdrv_first(&it); bs; bs = bdrv_next(&it)) {
         AioContext *ctx = bdrv_get_aio_context(bs);
+        int ret = 0;
 
         aio_context_acquire(ctx);
         if (bs == vm_state_bs) {
             sn->vm_state_size = vm_state_size;
-            err = bdrv_snapshot_create(bs, sn);
+            ret = bdrv_snapshot_create(bs, sn);
         } else if (bdrv_all_snapshots_includes_bs(bs)) {
             sn->vm_state_size = 0;
-            err = bdrv_snapshot_create(bs, sn);
+            ret = bdrv_snapshot_create(bs, sn);
         }
         aio_context_release(ctx);
-        if (err < 0) {
+        if (ret < 0) {
+            error_setg(errp, "Could not create snapshot '%s' on '%s'",
+                       sn->name, bdrv_get_device_or_node_name(bs));
             bdrv_next_cleanup(&it);
-            goto fail;
+            return -1;
         }
     }
 
-fail:
-    *first_bad_bs = bs;
-    return err;
+    return 0;
 }
 
-BlockDriverState *bdrv_all_find_vmstate_bs(void)
+BlockDriverState *bdrv_all_find_vmstate_bs(Error **errp)
 {
     BlockDriverState *bs;
     BdrvNextIterator it;
@@ -620,5 +618,8 @@ BlockDriverState *bdrv_all_find_vmstate_bs(void)
             break;
         }
     }
+    if (!bs) {
+        error_setg(errp, "No block device supports snapshots");
+    }
     return bs;
 }
diff --git a/include/block/snapshot.h b/include/block/snapshot.h
index b0fe42993d..5cb2b696ad 100644
--- a/include/block/snapshot.h
+++ b/include/block/snapshot.h
@@ -77,17 +77,15 @@ int bdrv_snapshot_load_tmp_by_id_or_name(BlockDriverState *bs,
  * These functions will properly handle dataplane (take aio_context_acquire
  * when appropriate for appropriate block drivers */
 
-bool bdrv_all_can_snapshot(BlockDriverState **first_bad_bs);
-int bdrv_all_delete_snapshot(const char *name, BlockDriverState **first_bsd_bs,
-                             Error **errp);
-int bdrv_all_goto_snapshot(const char *name, BlockDriverState **first_bad_bs,
-                           Error **errp);
-int bdrv_all_find_snapshot(const char *name, BlockDriverState **first_bad_bs);
+bool bdrv_all_can_snapshot(Error **errp);
+int bdrv_all_delete_snapshot(const char *name, Error **errp);
+int bdrv_all_goto_snapshot(const char *name, Error **errp);
+int bdrv_all_find_snapshot(const char *name, Error **errp);
 int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
                              BlockDriverState *vm_state_bs,
                              uint64_t vm_state_size,
-                             BlockDriverState **first_bad_bs);
+                             Error **errp);
 
-BlockDriverState *bdrv_all_find_vmstate_bs(void);
+BlockDriverState *bdrv_all_find_vmstate_bs(Error **errp);
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index 1178c6ca90..948e82c9ed 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2766,7 +2766,7 @@ int qemu_load_device_state(QEMUFile *f)
 
 int save_snapshot(const char *name, Error **errp)
 {
-    BlockDriverState *bs, *bs1;
+    BlockDriverState *bs;
     QEMUSnapshotInfo sn1, *sn = &sn1;
     int ret = -1, ret2;
     QEMUFile *f;
@@ -2786,25 +2786,19 @@ int save_snapshot(const char *name, Error **errp)
         return ret;
     }
 
-    if (!bdrv_all_can_snapshot(&bs)) {
-        error_setg(errp, "Device '%s' is writable but does not support "
-                   "snapshots", bdrv_get_device_or_node_name(bs));
+    if (!bdrv_all_can_snapshot(errp)) {
         return ret;
     }
 
     /* Delete old snapshots of the same name */
     if (name) {
-        ret = bdrv_all_delete_snapshot(name, &bs1, errp);
-        if (ret < 0) {
-            error_prepend(errp, "Error while deleting snapshot on device "
-                          "'%s': ", bdrv_get_device_or_node_name(bs1));
+        if (bdrv_all_delete_snapshot(name, errp) < 0) {
             return ret;
         }
     }
 
-    bs = bdrv_all_find_vmstate_bs();
+    bs = bdrv_all_find_vmstate_bs(errp);
     if (bs == NULL) {
-        error_setg(errp, "No block device can accept snapshots");
         return ret;
     }
     aio_context = bdrv_get_aio_context(bs);
@@ -2868,11 +2862,9 @@ int save_snapshot(const char *name, Error **errp)
     aio_context_release(aio_context);
     aio_context = NULL;
 
-    ret = bdrv_all_create_snapshot(sn, bs, vm_state_size, &bs);
+    ret = bdrv_all_create_snapshot(sn, bs, vm_state_size, errp);
     if (ret < 0) {
-        error_setg(errp, "Error while creating snapshot on '%s'",
-                   bdrv_get_device_or_node_name(bs));
-        bdrv_all_delete_snapshot(sn->name, &bs, NULL);
+        bdrv_all_delete_snapshot(sn->name, NULL);
         goto the_end;
     }
 
@@ -2975,30 +2967,23 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
 
 int load_snapshot(const char *name, Error **errp)
 {
-    BlockDriverState *bs, *bs_vm_state;
+    BlockDriverState *bs_vm_state;
     QEMUSnapshotInfo sn;
     QEMUFile *f;
     int ret;
     AioContext *aio_context;
     MigrationIncomingState *mis = migration_incoming_get_current();
 
-    if (!bdrv_all_can_snapshot(&bs)) {
-        error_setg(errp,
-                   "Device '%s' is writable but does not support snapshots",
-                   bdrv_get_device_or_node_name(bs));
+    if (!bdrv_all_can_snapshot(errp)) {
         return -ENOTSUP;
     }
-    ret = bdrv_all_find_snapshot(name, &bs);
+    ret = bdrv_all_find_snapshot(name, errp);
     if (ret < 0) {
-        error_setg(errp,
-                   "Device '%s' does not have the requested snapshot '%s'",
-                   bdrv_get_device_or_node_name(bs), name);
         return ret;
     }
 
-    bs_vm_state = bdrv_all_find_vmstate_bs();
+    bs_vm_state = bdrv_all_find_vmstate_bs(errp);
     if (!bs_vm_state) {
-        error_setg(errp, "No block device supports snapshots");
         return -ENOTSUP;
     }
     aio_context = bdrv_get_aio_context(bs_vm_state);
@@ -3024,10 +3009,8 @@ int load_snapshot(const char *name, Error **errp)
     /* Flush all IO requests so they don't interfere with the new state.  */
     bdrv_drain_all_begin();
 
-    ret = bdrv_all_goto_snapshot(name, &bs, errp);
+    ret = bdrv_all_goto_snapshot(name, errp);
     if (ret < 0) {
-        error_prepend(errp, "Could not load snapshot '%s' on '%s': ",
-                      name, bdrv_get_device_or_node_name(bs));
         goto err_drain;
     }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 992ecf6f04..2b954763e4 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1155,15 +1155,10 @@ void hmp_savevm(Monitor *mon, const QDict *qdict)
 
 void hmp_delvm(Monitor *mon, const QDict *qdict)
 {
-    BlockDriverState *bs;
     Error *err = NULL;
     const char *name = qdict_get_str(qdict, "name");
 
-    if (bdrv_all_delete_snapshot(name, &bs, &err) < 0) {
-        error_prepend(&err,
-                      "deleting snapshot on device '%s': ",
-                      bdrv_get_device_name(bs));
-    }
+    bdrv_all_delete_snapshot(name, &err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 5ec574724a..3a9b609e62 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -148,7 +148,7 @@ static char *replay_find_nearest_snapshot(int64_t icount,
 
     *snapshot_icount = -1;
 
-    bs = bdrv_all_find_vmstate_bs();
+    bs = bdrv_all_find_vmstate_bs(NULL);
     if (!bs) {
         goto fail;
     }
@@ -159,7 +159,7 @@ static char *replay_find_nearest_snapshot(int64_t icount,
     aio_context_release(aio_context);
 
     for (i = 0; i < nb_sns; i++) {
-        if (bdrv_all_find_snapshot(sn_tab[i].name, &bs) == 0) {
+        if (bdrv_all_find_snapshot(sn_tab[i].name, NULL) == 0) {
             if (sn_tab[i].icount != -1ULL
                 && sn_tab[i].icount <= icount
                 && (!nearest || nearest->icount < sn_tab[i].icount)) {
diff --git a/tests/qemu-iotests/267.out b/tests/qemu-iotests/267.out
index 27471ffae8..6149029b25 100644
--- a/tests/qemu-iotests/267.out
+++ b/tests/qemu-iotests/267.out
@@ -6,9 +6,9 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 Testing:
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
-Error: No block device can accept snapshots
+Error: No block device supports snapshots
 (qemu) info snapshots
-No available block device supports snapshots
+No block device supports snapshots
 (qemu) loadvm snap0
 Error: No block device supports snapshots
 (qemu) quit
@@ -22,7 +22,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 Error: Device 'none0' is writable but does not support snapshots
 (qemu) info snapshots
-No available block device supports snapshots
+No block device supports snapshots
 (qemu) loadvm snap0
 Error: Device 'none0' is writable but does not support snapshots
 (qemu) quit
@@ -58,7 +58,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 Error: Device 'virtio0' is writable but does not support snapshots
 (qemu) info snapshots
-No available block device supports snapshots
+No block device supports snapshots
 (qemu) loadvm snap0
 Error: Device 'virtio0' is writable but does not support snapshots
 (qemu) quit
@@ -83,7 +83,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) savevm snap0
 Error: Device 'file' is writable but does not support snapshots
 (qemu) info snapshots
-No available block device supports snapshots
+No block device supports snapshots
 (qemu) loadvm snap0
 Error: Device 'file' is writable but does not support snapshots
 (qemu) quit
-- 
2.29.2


