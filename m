Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B4168E0D8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:04:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTFW-00074r-OD; Tue, 07 Feb 2023 14:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTFR-0006yK-Bs
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:03:21 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTFO-0003ln-1a
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:03:21 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317IxBDO022103; Tue, 7 Feb 2023 19:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=HpcNO3xKaEyZwldbRgtvEzHCtuh8GJWyU19mxXFmtUo=;
 b=Gk57RVXtXGflUYqHeD2irraUstmHfkB34HpUprdPBM+WARtyrKHQOWznyrWdubFdpY9M
 Fou34gfE5H9DSuzE01MDWC02wA7J7/L3+5QIiXc8Sto4oxR7ulxVsX//OjqtmKUTmMIJ
 Ccdpgk9ff3KPoa8AEPKepaPoIjByOdOgVoY7xN6uN9OViq+eGmNS8bNjRAXGRoz8+Ef3
 I/FuTAhZRlLgR4QmMa4CUNBUs+kKuLJhWZ7XadUg+N0mnuW4jOSDNu5Ef8fLIk8qwkIL
 yuzY2J6NbwFX4OjGVrCKX57sYPVCGpny0nl5Sp7NtO7c+PWKy9zEdUbV8EbZpGG1svnz NQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfwu6ag5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:03:16 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317I5HF9012099; Tue, 7 Feb 2023 19:03:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtckyxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:03:14 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317J3EBL008006;
 Tue, 7 Feb 2023 19:03:14 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with
 ESMTP id 3nhdtckywu-1; Tue, 07 Feb 2023 19:03:14 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2] migration: simplify blockers
Date: Tue,  7 Feb 2023 11:03:13 -0800
Message-Id: <1675796593-235541-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070170
X-Proofpoint-GUID: Y3CXUO7r10vv5XcGcpaDQ3w70ugK_xY2
X-Proofpoint-ORIG-GUID: Y3CXUO7r10vv5XcGcpaDQ3w70ugK_xY2
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Modify migrate_add_blocker and migrate_del_blocker to take an Error **
reason.  This allows migration to own the Error object, so that if
an error occurs, migration code can free the Error and clear the client
handle, simplifying client code.  This is a pre-requisite for a future
patch that will allow one Error blocker to be registered for multiple
migration modes.

No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 backends/tpm/tpm_emulator.c  | 10 ++--------
 block/parallels.c            |  6 ++----
 block/qcow.c                 |  6 ++----
 block/vdi.c                  |  6 ++----
 block/vhdx.c                 |  6 ++----
 block/vmdk.c                 |  6 ++----
 block/vpc.c                  |  6 ++----
 block/vvfat.c                |  6 ++----
 dump/dump.c                  |  4 ++--
 hw/9pfs/9p.c                 | 10 ++--------
 hw/display/virtio-gpu-base.c |  8 ++------
 hw/intc/arm_gic_kvm.c        |  3 +--
 hw/intc/arm_gicv3_its_kvm.c  |  3 +--
 hw/intc/arm_gicv3_kvm.c      |  3 +--
 hw/misc/ivshmem.c            |  8 ++------
 hw/ppc/pef.c                 |  2 +-
 hw/ppc/spapr.c               |  2 +-
 hw/ppc/spapr_events.c        |  2 +-
 hw/ppc/spapr_rtas.c          |  2 +-
 hw/remote/proxy.c            |  7 ++-----
 hw/s390x/s390-virtio-ccw.c   |  9 +++------
 hw/scsi/vhost-scsi.c         |  8 +++-----
 hw/vfio/migration.c          | 13 ++-----------
 hw/virtio/vhost.c            |  8 ++------
 include/migration/blocker.h  | 22 +++++++++++++++-------
 migration/migration.c        | 22 ++++++++++++++--------
 stubs/migr-blocker.c         |  4 ++--
 target/i386/kvm/kvm.c        |  8 ++++----
 target/i386/nvmm/nvmm-all.c  |  3 +--
 target/i386/sev.c            |  2 +-
 target/i386/whpx/whpx-all.c  |  3 +--
 ui/vdagent.c                 |  5 ++---
 32 files changed, 83 insertions(+), 130 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 67e7b21..2de738a 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -535,11 +535,8 @@ static int tpm_emulator_block_migration(TPMEmulator *tpm_emu)
         error_setg(&tpm_emu->migration_blocker,
                    "Migration disabled: TPM emulator does not support "
                    "migration");
-        if (migrate_add_blocker(tpm_emu->migration_blocker, &err) < 0) {
+        if (migrate_add_blocker(&tpm_emu->migration_blocker, &err) < 0) {
             error_report_err(err);
-            error_free(tpm_emu->migration_blocker);
-            tpm_emu->migration_blocker = NULL;
-
             return -1;
         }
     }
@@ -1017,10 +1014,7 @@ static void tpm_emulator_inst_finalize(Object *obj)
 
     qapi_free_TPMEmulatorOptions(tpm_emu->options);
 
-    if (tpm_emu->migration_blocker) {
-        migrate_del_blocker(tpm_emu->migration_blocker);
-        error_free(tpm_emu->migration_blocker);
-    }
+    migrate_del_blocker(&tpm_emu->migration_blocker);
 
     tpm_sized_buffer_reset(&state_blobs->volatil);
     tpm_sized_buffer_reset(&state_blobs->permanent);
diff --git a/block/parallels.c b/block/parallels.c
index bbea2f2..9719cf0 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -877,9 +877,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The Parallels format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, errp);
+    ret = migrate_add_blocker(&s->migration_blocker, errp);
     if (ret < 0) {
-        error_free(s->migration_blocker);
         goto fail;
     }
     qemu_co_mutex_init(&s->lock);
@@ -911,8 +910,7 @@ static void parallels_close(BlockDriverState *bs)
     g_free(s->bat_dirty_bmap);
     qemu_vfree(s->header);
 
-    migrate_del_blocker(s->migration_blocker);
-    error_free(s->migration_blocker);
+    migrate_del_blocker(&s->migration_blocker);
 }
 
 static BlockDriver bdrv_parallels = {
diff --git a/block/qcow.c b/block/qcow.c
index 5f0801f..04b2d54 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -304,9 +304,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The qcow format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, errp);
+    ret = migrate_add_blocker(&s->migration_blocker, errp);
     if (ret < 0) {
-        error_free(s->migration_blocker);
         goto fail;
     }
 
@@ -798,8 +797,7 @@ static void qcow_close(BlockDriverState *bs)
     g_free(s->cluster_cache);
     g_free(s->cluster_data);
 
-    migrate_del_blocker(s->migration_blocker);
-    error_free(s->migration_blocker);
+    migrate_del_blocker(&s->migration_blocker);
 }
 
 static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
diff --git a/block/vdi.c b/block/vdi.c
index 9c8736b..615194a 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -495,9 +495,8 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vdi format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, errp);
+    ret = migrate_add_blocker(&s->migration_blocker, errp);
     if (ret < 0) {
-        error_free(s->migration_blocker);
         goto fail_free_bmap;
     }
 
@@ -986,8 +985,7 @@ static void vdi_close(BlockDriverState *bs)
 
     qemu_vfree(s->bmap);
 
-    migrate_del_blocker(s->migration_blocker);
-    error_free(s->migration_blocker);
+    migrate_del_blocker(&s->migration_blocker);
 }
 
 static int vdi_has_zero_init(BlockDriverState *bs)
diff --git a/block/vhdx.c b/block/vhdx.c
index ef1f65d..b458f25 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -985,8 +985,7 @@ static void vhdx_close(BlockDriverState *bs)
     s->bat = NULL;
     qemu_vfree(s->parent_entries);
     s->parent_entries = NULL;
-    migrate_del_blocker(s->migration_blocker);
-    error_free(s->migration_blocker);
+    migrate_del_blocker(&s->migration_blocker);
     qemu_vfree(s->log.hdr);
     s->log.hdr = NULL;
     vhdx_region_unregister_all(s);
@@ -1093,9 +1092,8 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vhdx format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, errp);
+    ret = migrate_add_blocker(&s->migration_blocker, errp);
     if (ret < 0) {
-        error_free(s->migration_blocker);
         goto fail;
     }
 
diff --git a/block/vmdk.c b/block/vmdk.c
index 5b0eae8..8b27c60 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1359,9 +1359,8 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vmdk format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, errp);
+    ret = migrate_add_blocker(&s->migration_blocker, errp);
     if (ret < 0) {
-        error_free(s->migration_blocker);
         goto fail;
     }
 
@@ -2852,8 +2851,7 @@ static void vmdk_close(BlockDriverState *bs)
     vmdk_free_extents(bs);
     g_free(s->create_type);
 
-    migrate_del_blocker(s->migration_blocker);
-    error_free(s->migration_blocker);
+    migrate_del_blocker(&s->migration_blocker);
 }
 
 static int64_t coroutine_fn
diff --git a/block/vpc.c b/block/vpc.c
index cfdea7d..8241a88 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -449,9 +449,8 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vpc format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, errp);
+    ret = migrate_add_blocker(&s->migration_blocker, errp);
     if (ret < 0) {
-        error_free(s->migration_blocker);
         goto fail;
     }
 
@@ -1188,8 +1187,7 @@ static void vpc_close(BlockDriverState *bs)
     g_free(s->pageentry_u8);
 #endif
 
-    migrate_del_blocker(s->migration_blocker);
-    error_free(s->migration_blocker);
+    migrate_del_blocker(&s->migration_blocker);
 }
 
 static QemuOptsList vpc_create_opts = {
diff --git a/block/vvfat.c b/block/vvfat.c
index d7d775b..5e8cb33 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1267,9 +1267,8 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
                    "The vvfat (rw) format used by node '%s' "
                    "does not support live migration",
                    bdrv_get_device_or_node_name(bs));
-        ret = migrate_add_blocker(s->migration_blocker, errp);
+        ret = migrate_add_blocker(&s->migration_blocker, errp);
         if (ret < 0) {
-            error_free(s->migration_blocker);
             goto fail;
         }
     }
@@ -3237,8 +3236,7 @@ static void vvfat_close(BlockDriverState *bs)
     g_free(s->cluster_buffer);
 
     if (s->qcow) {
-        migrate_del_blocker(s->migration_blocker);
-        error_free(s->migration_blocker);
+        migrate_del_blocker(&s->migration_blocker);
     }
 }
 
diff --git a/dump/dump.c b/dump/dump.c
index 279b07f..4435c1c 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -114,7 +114,7 @@ static int dump_cleanup(DumpState *s)
             qemu_mutex_unlock_iothread();
         }
     }
-    migrate_del_blocker(dump_migration_blocker);
+    migrate_del_blocker(&dump_migration_blocker);
 
     return 0;
 }
@@ -2167,7 +2167,7 @@ void qmp_dump_guest_memory(bool paging, const char *file,
      * Allows even for -only-migratable, but forbid migration during the
      * process of dump guest memory.
      */
-    if (migrate_add_blocker_internal(dump_migration_blocker, errp)) {
+    if (migrate_add_blocker_internal(&dump_migration_blocker, errp)) {
         /* Remember to release the fd before passing it over to dump state */
         close(fd);
         return;
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 072cf67..a1a23f6 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -408,11 +408,7 @@ static int coroutine_fn put_fid(V9fsPDU *pdu, V9fsFidState *fidp)
              * delete the migration blocker. Ideally, this
              * should be hooked to transport close notification
              */
-            if (pdu->s->migration_blocker) {
-                migrate_del_blocker(pdu->s->migration_blocker);
-                error_free(pdu->s->migration_blocker);
-                pdu->s->migration_blocker = NULL;
-            }
+            migrate_del_blocker(&pdu->s->migration_blocker);
         }
         return free_fid(pdu, fidp);
     }
@@ -1508,10 +1504,8 @@ static void coroutine_fn v9fs_attach(void *opaque)
         error_setg(&s->migration_blocker,
                    "Migration is disabled when VirtFS export path '%s' is mounted in the guest using mount_tag '%s'",
                    s->ctx.fs_root ? s->ctx.fs_root : "NULL", s->tag);
-        err = migrate_add_blocker(s->migration_blocker, NULL);
+        err = migrate_add_blocker(&s->migration_blocker, NULL);
         if (err < 0) {
-            error_free(s->migration_blocker);
-            s->migration_blocker = NULL;
             clunk_fid(s, fid);
             goto out;
         }
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index a29f191..995c9a9 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -167,8 +167,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
 
     if (virtio_gpu_virgl_enabled(g->conf)) {
         error_setg(&g->migration_blocker, "virgl is not yet migratable");
-        if (migrate_add_blocker(g->migration_blocker, errp) < 0) {
-            error_free(g->migration_blocker);
+        if (migrate_add_blocker(&g->migration_blocker, errp) < 0) {
             return false;
         }
     }
@@ -232,10 +231,7 @@ virtio_gpu_base_device_unrealize(DeviceState *qdev)
 {
     VirtIOGPUBase *g = VIRTIO_GPU_BASE(qdev);
 
-    if (g->migration_blocker) {
-        migrate_del_blocker(g->migration_blocker);
-        error_free(g->migration_blocker);
-    }
+    migrate_del_blocker(&g->migration_blocker);
 }
 
 static void
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 1d58894..e0d9e51 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -516,8 +516,7 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
     if (!kvm_arm_gic_can_save_restore(s)) {
         error_setg(&s->migration_blocker, "This operating system kernel does "
                                           "not support vGICv2 migration");
-        if (migrate_add_blocker(s->migration_blocker, errp) < 0) {
-            error_free(s->migration_blocker);
+        if (migrate_add_blocker(&s->migration_blocker, errp) < 0) {
             return;
         }
     }
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 7eda9fb..61c1cc7 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -114,8 +114,7 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
         GITS_CTLR)) {
         error_setg(&s->migration_blocker, "This operating system kernel "
                    "does not support vITS migration");
-        if (migrate_add_blocker(s->migration_blocker, errp) < 0) {
-            error_free(s->migration_blocker);
+        if (migrate_add_blocker(&s->migration_blocker, errp) < 0) {
             return;
         }
     } else {
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 72ad916..77eb37e 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -878,8 +878,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
                                GICD_CTLR)) {
         error_setg(&s->migration_blocker, "This operating system kernel does "
                                           "not support vGICv3 migration");
-        if (migrate_add_blocker(s->migration_blocker, errp) < 0) {
-            error_free(s->migration_blocker);
+        if (migrate_add_blocker(&s->migration_blocker, errp) < 0) {
             return;
         }
     }
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index d66d912..0447888 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -903,8 +903,7 @@ static void ivshmem_common_realize(PCIDevice *dev, Error **errp)
     if (!ivshmem_is_master(s)) {
         error_setg(&s->migration_blocker,
                    "Migration is disabled when using feature 'peer mode' in device 'ivshmem'");
-        if (migrate_add_blocker(s->migration_blocker, errp) < 0) {
-            error_free(s->migration_blocker);
+        if (migrate_add_blocker(&s->migration_blocker, errp) < 0) {
             return;
         }
     }
@@ -922,10 +921,7 @@ static void ivshmem_exit(PCIDevice *dev)
     IVShmemState *s = IVSHMEM_COMMON(dev);
     int i;
 
-    if (s->migration_blocker) {
-        migrate_del_blocker(s->migration_blocker);
-        error_free(s->migration_blocker);
-    }
+    migrate_del_blocker(&s->migration_blocker);
 
     if (memory_region_is_mapped(s->ivshmem_bar2)) {
         if (!s->hostmem) {
diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
index cc44d5e..d28ed3b 100644
--- a/hw/ppc/pef.c
+++ b/hw/ppc/pef.c
@@ -63,7 +63,7 @@ static int kvmppc_svm_init(ConfidentialGuestSupport *cgs, Error **errp)
     /* add migration blocker */
     error_setg(&pef_mig_blocker, "PEF: Migration is not implemented");
     /* NB: This can fail if --only-migratable is used */
-    migrate_add_blocker(pef_mig_blocker, &error_fatal);
+    migrate_add_blocker(&pef_mig_blocker, &error_fatal);
 
     cgs->ready = true;
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4921198..2a31d4a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1727,7 +1727,7 @@ static void spapr_machine_reset(MachineState *machine, ShutdownCause reason)
     /* Signal all vCPUs waiting on this condition */
     qemu_cond_broadcast(&spapr->fwnmi_machine_check_interlock_cond);
 
-    migrate_del_blocker(spapr->fwnmi_migration_blocker);
+    migrate_del_blocker(&spapr->fwnmi_migration_blocker);
 }
 
 static void spapr_create_nvram(SpaprMachineState *spapr)
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 4508e40..c1b7bb9 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -920,7 +920,7 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
      * fails when running with -only-migrate.  A proper interface to
      * delay migration completion for a bit could avoid that.
      */
-    ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, NULL);
+    ret = migrate_add_blocker(&spapr->fwnmi_migration_blocker, NULL);
     if (ret == -EBUSY) {
         warn_report("Received a fwnmi while migration was in progress");
     }
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 3f664ea..e2e6aff 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -495,7 +495,7 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
     spapr->fwnmi_machine_check_interlock = -1;
     qemu_cond_signal(&spapr->fwnmi_machine_check_interlock_cond);
     rtas_st(rets, 0, RTAS_OUT_SUCCESS);
-    migrate_del_blocker(spapr->fwnmi_migration_blocker);
+    migrate_del_blocker(&spapr->fwnmi_migration_blocker);
 }
 
 static struct rtas_call {
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 1c7786b..d8797ac 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -108,8 +108,7 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 
     error_setg(&dev->migration_blocker, "%s does not support migration",
                TYPE_PCI_PROXY_DEV);
-    if (migrate_add_blocker(dev->migration_blocker, errp) < 0) {
-        error_free(dev->migration_blocker);
+    if (migrate_add_blocker(&dev->migration_blocker, errp) < 0) {
         object_unref(dev->ioc);
         return;
     }
@@ -135,9 +134,7 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
         qio_channel_close(dev->ioc, NULL);
     }
 
-    migrate_del_blocker(dev->migration_blocker);
-
-    error_free(dev->migration_blocker);
+    migrate_del_blocker(&dev->migration_blocker);
 
     proxy_memory_listener_deconfigure(&dev->proxy_listener);
 
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index f22f61b..4e50f0c 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -331,8 +331,7 @@ static void s390_machine_unprotect(S390CcwMachineState *ms)
 {
     s390_pv_vm_disable();
     ms->pv = false;
-    migrate_del_blocker(pv_mig_blocker);
-    error_free_or_abort(&pv_mig_blocker);
+    migrate_del_blocker(&pv_mig_blocker);
     ram_block_discard_disable(false);
 }
 
@@ -355,11 +354,10 @@ static int s390_machine_protect(S390CcwMachineState *ms)
 
     error_setg(&pv_mig_blocker,
                "protected VMs are currently not migratable.");
-    rc = migrate_add_blocker(pv_mig_blocker, &local_err);
+    rc = migrate_add_blocker(&pv_mig_blocker, &local_err);
     if (rc) {
         ram_block_discard_disable(false);
         error_report_err(local_err);
-        error_free_or_abort(&pv_mig_blocker);
         return rc;
     }
 
@@ -367,8 +365,7 @@ static int s390_machine_protect(S390CcwMachineState *ms)
     rc = s390_pv_vm_enable();
     if (rc) {
         ram_block_discard_disable(false);
-        migrate_del_blocker(pv_mig_blocker);
-        error_free_or_abort(&pv_mig_blocker);
+        migrate_del_blocker(&pv_mig_blocker);
         return rc;
     }
 
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 6a0fd0d..21cb345 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -209,7 +209,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
                 "When external environment supports it (Orchestrator migrates "
                 "target SCSI device state or use shared storage over network), "
                 "set 'migratable' property to true to enable migration.");
-        if (migrate_add_blocker(vsc->migration_blocker, errp) < 0) {
+        if (migrate_add_blocker(&vsc->migration_blocker, errp) < 0) {
             goto free_virtio;
         }
     }
@@ -242,10 +242,9 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
  free_vqs:
     g_free(vqs);
     if (!vsc->migratable) {
-        migrate_del_blocker(vsc->migration_blocker);
+        migrate_del_blocker(&vsc->migration_blocker);
     }
  free_virtio:
-    error_free(vsc->migration_blocker);
     virtio_scsi_common_unrealize(dev);
  close_fd:
     if (vhostfd >= 0) {
@@ -261,8 +260,7 @@ static void vhost_scsi_unrealize(DeviceState *dev)
     struct vhost_virtqueue *vqs = vsc->dev.vqs;
 
     if (!vsc->migratable) {
-        migrate_del_blocker(vsc->migration_blocker);
-        error_free(vsc->migration_blocker);
+        migrate_del_blocker(&vsc->migration_blocker);
     }
 
     /* This will stop vhost backend. */
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index c74453e..d149176 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -889,12 +889,7 @@ add_blocker:
                "VFIO device doesn't support migration");
     g_free(info);
 
-    ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
-    if (ret < 0) {
-        error_free(vbasedev->migration_blocker);
-        vbasedev->migration_blocker = NULL;
-    }
-    return ret;
+    return migrate_add_blocker(&vbasedev->migration_blocker, errp);
 }
 
 void vfio_migration_finalize(VFIODevice *vbasedev)
@@ -908,9 +903,5 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
         vfio_migration_exit(vbasedev);
     }
 
-    if (vbasedev->migration_blocker) {
-        migrate_del_blocker(vbasedev->migration_blocker);
-        error_free(vbasedev->migration_blocker);
-        vbasedev->migration_blocker = NULL;
-    }
+    migrate_del_blocker(&vbasedev->migration_blocker);
 }
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index eb8c4c3..91ce924 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1479,9 +1479,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     }
 
     if (hdev->migration_blocker != NULL) {
-        r = migrate_add_blocker(hdev->migration_blocker, errp);
+        r = migrate_add_blocker(&hdev->migration_blocker, errp);
         if (r < 0) {
-            error_free(hdev->migration_blocker);
             goto fail_busyloop;
         }
     }
@@ -1531,10 +1530,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
         memory_listener_unregister(&hdev->memory_listener);
         QLIST_REMOVE(hdev, entry);
     }
-    if (hdev->migration_blocker) {
-        migrate_del_blocker(hdev->migration_blocker);
-        error_free(hdev->migration_blocker);
-    }
+    migrate_del_blocker(&hdev->migration_blocker);
     g_free(hdev->mem);
     g_free(hdev->mem_sections);
     if (hdev->vhost_ops) {
diff --git a/include/migration/blocker.h b/include/migration/blocker.h
index 9cebe2b..7c8d326 100644
--- a/include/migration/blocker.h
+++ b/include/migration/blocker.h
@@ -17,19 +17,22 @@
 /**
  * @migrate_add_blocker - prevent migration from proceeding
  *
- * @reason - an error to be returned whenever migration is attempted
+ * @reasonp - address of an error to be returned whenever migration is attempted
  *
  * @errp - [out] The reason (if any) we cannot block migration right now.
  *
  * @returns - 0 on success, -EBUSY/-EACCES on failure, with errp set.
+ *
+ * *@reasonp is freed and set to NULL if failure is returned.
+ * On success, the caller no longer owns *@reasonp and must not free it.
  */
-int migrate_add_blocker(Error *reason, Error **errp);
+int migrate_add_blocker(Error **reasonp, Error **errp);
 
 /**
  * @migrate_add_blocker_internal - prevent migration from proceeding without
  *                                 only-migrate implications
  *
- * @reason - an error to be returned whenever migration is attempted
+ * @reasonp - address of an error to be returned whenever migration is attempted
  *
  * @errp - [out] The reason (if any) we cannot block migration right now.
  *
@@ -38,14 +41,19 @@ int migrate_add_blocker(Error *reason, Error **errp);
  * Some of the migration blockers can be temporary (e.g., for a few seconds),
  * so it shouldn't need to conflict with "-only-migratable".  For those cases,
  * we can call this function rather than @migrate_add_blocker().
+ *
+ * *@reasonp is freed and set to NULL if failure is returned.
+ * On success, the caller no longer owns *@reasonp and must not free it.
  */
-int migrate_add_blocker_internal(Error *reason, Error **errp);
+int migrate_add_blocker_internal(Error **reasonp, Error **errp);
 
 /**
- * @migrate_del_blocker - remove a blocking error from migration
+ * @migrate_del_blocker - remove a blocking error from migration and free it.
+ *
+ * @reasonp - address of the error blocking migration
  *
- * @reason - the error blocking migration
+ * This function frees *@reasonp and sets it to NULL.
  */
-void migrate_del_blocker(Error *reason);
+void migrate_del_blocker(Error **reasonp);
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index b60e470..6c5283c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2205,35 +2205,41 @@ void migrate_init(MigrationState *s)
     s->threshold_size = 0;
 }
 
-int migrate_add_blocker_internal(Error *reason, Error **errp)
+int migrate_add_blocker_internal(Error **reasonp, Error **errp)
 {
     /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
     if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
-        error_propagate_prepend(errp, error_copy(reason),
+        error_propagate_prepend(errp, *reasonp,
                                 "disallowing migration blocker "
                                 "(migration/snapshot in progress) for: ");
+        *reasonp = NULL;
         return -EBUSY;
     }
 
-    migration_blockers = g_slist_prepend(migration_blockers, reason);
+    migration_blockers = g_slist_prepend(migration_blockers, *reasonp);
     return 0;
 }
 
-int migrate_add_blocker(Error *reason, Error **errp)
+int migrate_add_blocker(Error **reasonp, Error **errp)
 {
     if (only_migratable) {
-        error_propagate_prepend(errp, error_copy(reason),
+        error_propagate_prepend(errp, *reasonp,
                                 "disallowing migration blocker "
                                 "(--only-migratable) for: ");
+        *reasonp = NULL;
         return -EACCES;
     }
 
-    return migrate_add_blocker_internal(reason, errp);
+    return migrate_add_blocker_internal(reasonp, errp);
 }
 
-void migrate_del_blocker(Error *reason)
+void migrate_del_blocker(Error **reasonp)
 {
-    migration_blockers = g_slist_remove(migration_blockers, reason);
+    if (*reasonp) {
+        migration_blockers = g_slist_remove(migration_blockers, *reasonp);
+        error_free(*reasonp);
+        *reasonp = NULL;
+    }
 }
 
 void qmp_migrate_incoming(const char *uri, Error **errp)
diff --git a/stubs/migr-blocker.c b/stubs/migr-blocker.c
index 5676a2f..17a5dbf 100644
--- a/stubs/migr-blocker.c
+++ b/stubs/migr-blocker.c
@@ -1,11 +1,11 @@
 #include "qemu/osdep.h"
 #include "migration/blocker.h"
 
-int migrate_add_blocker(Error *reason, Error **errp)
+int migrate_add_blocker(Error **reasonp, Error **errp)
 {
     return 0;
 }
 
-void migrate_del_blocker(Error *reason)
+void migrate_del_blocker(Error **reasonp)
 {
 }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 5870301..52193f8 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1576,7 +1576,7 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         error_setg(&hv_passthrough_mig_blocker,
                    "'hv-passthrough' CPU flag prevents migration, use explicit"
                    " set of hv-* flags instead");
-        ret = migrate_add_blocker(hv_passthrough_mig_blocker, &local_err);
+        ret = migrate_add_blocker(&hv_passthrough_mig_blocker, &local_err);
         if (ret < 0) {
             error_report_err(local_err);
             return ret;
@@ -1590,7 +1590,7 @@ static int hyperv_init_vcpu(X86CPU *cpu)
                    " use explicit 'hv-no-nonarch-coresharing=on' instead (but"
                    " make sure SMT is disabled and/or that vCPUs are properly"
                    " pinned)");
-        ret = migrate_add_blocker(hv_no_nonarch_cs_mig_blocker, &local_err);
+        ret = migrate_add_blocker(&hv_no_nonarch_cs_mig_blocker, &local_err);
         if (ret < 0) {
             error_report_err(local_err);
             return ret;
@@ -2111,7 +2111,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
             error_setg(&invtsc_mig_blocker,
                        "State blocked by non-migratable CPU device"
                        " (invtsc flag)");
-            r = migrate_add_blocker(invtsc_mig_blocker, &local_err);
+            r = migrate_add_blocker(&invtsc_mig_blocker, &local_err);
             if (r < 0) {
                 error_report_err(local_err);
                 return r;
@@ -2169,7 +2169,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     return 0;
 
  fail:
-    migrate_del_blocker(invtsc_mig_blocker);
+    migrate_del_blocker(&invtsc_mig_blocker);
 
     return r;
 }
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index b75738e..f66b140 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -935,9 +935,8 @@ nvmm_init_vcpu(CPUState *cpu)
         error_setg(&nvmm_migration_blocker,
             "NVMM: Migration not supported");
 
-        if (migrate_add_blocker(nvmm_migration_blocker, &local_error) < 0) {
+        if (migrate_add_blocker(&nvmm_migration_blocker, &local_error) < 0) {
             error_report_err(local_error);
-            error_free(nvmm_migration_blocker);
             return -EINVAL;
         }
     }
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 32f7dba..927bd75 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -891,7 +891,7 @@ sev_launch_finish(SevGuestState *sev)
     /* add migration blocker */
     error_setg(&sev_mig_blocker,
                "SEV: Migration is not implemented");
-    migrate_add_blocker(sev_mig_blocker, &error_fatal);
+    migrate_add_blocker(&sev_mig_blocker, &error_fatal);
 }
 
 static void
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index e738d83..f99a342 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2169,9 +2169,8 @@ int whpx_init_vcpu(CPUState *cpu)
                "State blocked due to non-migratable CPUID feature support,"
                "dirty memory tracking support, and XSAVE/XRSTOR support");
 
-        if (migrate_add_blocker(whpx_migration_blocker, &local_error) < 0) {
+        if (migrate_add_blocker(&whpx_migration_blocker, &local_error) < 0) {
             error_report_err(local_error);
-            error_free(whpx_migration_blocker);
             ret = -EINVAL;
             goto error;
         }
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 1f51a78..2e4d442 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -670,7 +670,7 @@ static void vdagent_chr_open(Chardev *chr,
     return;
 #endif
 
-    if (migrate_add_blocker(vd->migration_blocker, errp) != 0) {
+    if (migrate_add_blocker(&vd->migration_blocker, errp) != 0) {
         return;
     }
 
@@ -920,10 +920,9 @@ static void vdagent_chr_fini(Object *obj)
 {
     VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(obj);
 
-    migrate_del_blocker(vd->migration_blocker);
+    migrate_del_blocker(&vd->migration_blocker);
     vdagent_disconnect(vd);
     buffer_free(&vd->outbuf);
-    error_free(vd->migration_blocker);
 }
 
 static const TypeInfo vdagent_chr_type_info = {
-- 
1.8.3.1


