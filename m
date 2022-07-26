Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C095817C1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:44:24 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNfR-0002x7-Dv
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9t-00030X-8B
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9q-0006BC-TJ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:44 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3rk031740;
 Tue, 26 Jul 2022 16:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=2EOuQhaCd9UWT/Q589HzRGAsuRiC/nE7vvjBOKmhXA4=;
 b=NM6V1f/T42zIOOPmZzCn3ZK8uQaIjgAw6dl3VThQYq8vtFwLIA3Te7jiFd4+klfa7BEN
 45ANCz03nZ2IwU2Fr2ZAa6UCH0zp3j3c9gfZpbeOQ3R30g54XAh2y5O2mGlfmXbprJBg
 wedBEcdjPboKLlbU6hUHw3mCSXX9cnISbT5LnuXCvfmC5gr//grJXmfE+JvF6GNnkSAm
 nG2O0BeQiC7EV+/poSzUnHLazADykSD4l/OL1UZSTWGVT24ZezkdhlbE9l5ciPYqgREe
 Gjwnnhvo93L/9KJGaVxjNNESGQiHEIj1P8U/iEYrOAMrmqUQnEucoRg0iLe+FjbuAsj1 0A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4q193-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:00 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QF5Npb006270; Tue, 26 Jul 2022 16:10:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:58 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSP023334;
 Tue, 26 Jul 2022 16:10:57 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-9; Tue, 26 Jul 2022 16:10:57 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 08/46] cpr: relax some blockers
Date: Tue, 26 Jul 2022 09:10:05 -0700
Message-Id: <1658851843-236870-9-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-ORIG-GUID: sP9Yz6skpefXBsizyx8SZz-EMa6PxkDH
X-Proofpoint-GUID: sP9Yz6skpefXBsizyx8SZz-EMa6PxkDH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some devices block migration because they rely on local state that
is not migrated to the target host, such as for local filesystems.
These need not block cpr, which will restart qemu on the same host.
Narrow the scope of these blockers so they only apply to normal mode.
They will not block cpr modes when they are added in subsequent patches.

No functional change until a new mode is added.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 backends/tpm/tpm_emulator.c | 3 ++-
 block/parallels.c           | 3 ++-
 block/qcow.c                | 3 ++-
 block/vdi.c                 | 3 ++-
 block/vhdx.c                | 3 ++-
 block/vmdk.c                | 3 ++-
 block/vpc.c                 | 3 ++-
 block/vvfat.c               | 3 ++-
 hw/9pfs/9p.c                | 3 ++-
 hw/scsi/vhost-scsi.c        | 3 ++-
 hw/virtio/vhost.c           | 3 ++-
 target/i386/nvmm/nvmm-all.c | 3 ++-
 12 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index ed67633..18cac1b 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -492,7 +492,8 @@ static int tpm_emulator_block_migration(TPMEmulator *tpm_emu)
         error_setg(&tpm_emu->migration_blocker,
                    "Migration disabled: TPM emulator does not support "
                    "migration");
-        if (migrate_add_blocker(&tpm_emu->migration_blocker, &err) < 0) {
+        if (migrate_add_blockers(&tpm_emu->migration_blocker, &err,
+                                 MIG_MODE_NORMAL, -1) < 0) {
             error_report_err(err);
             return -1;
         }
diff --git a/block/parallels.c b/block/parallels.c
index 25d24d6..0837c32 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -878,7 +878,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The Parallels format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blockers(&s->migration_blocker, errp, MIG_MODE_NORMAL,
+                               -1);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/qcow.c b/block/qcow.c
index 3b4e6a4..4057438 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -305,7 +305,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The qcow format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blockers(&s->migration_blocker, errp, MIG_MODE_NORMAL,
+                               -1);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vdi.c b/block/vdi.c
index cead854..022dab5 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -495,7 +495,8 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vdi format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blockers(&s->migration_blocker, errp, MIG_MODE_NORMAL,
+                               -1);
     if (ret < 0) {
         goto fail_free_bmap;
     }
diff --git a/block/vhdx.c b/block/vhdx.c
index 07b6077..8564777 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1093,7 +1093,8 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vhdx format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blockers(&s->migration_blocker, errp, MIG_MODE_NORMAL,
+                              -1);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vmdk.c b/block/vmdk.c
index 7a7cb57..043b895 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1360,7 +1360,8 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vmdk format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blockers(&s->migration_blocker, errp, MIG_MODE_NORMAL,
+                               -1);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vpc.c b/block/vpc.c
index a465784..6a25e2d 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -450,7 +450,8 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vpc format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blockers(&s->migration_blocker, errp, MIG_MODE_NORMAL,
+                               -1);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vvfat.c b/block/vvfat.c
index bc96876..45f3280 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1265,7 +1265,8 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
                    "The vvfat (rw) format used by node '%s' "
                    "does not support live migration",
                    bdrv_get_device_or_node_name(bs));
-        ret = migrate_add_blocker(&s->migration_blocker, errp);
+        ret = migrate_add_blockers(&s->migration_blocker, errp, MIG_MODE_NORMAL,
+                                   -1);
         if (ret < 0) {
             goto fail;
         }
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index d5ac01f..3a48f32 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1487,7 +1487,8 @@ static void coroutine_fn v9fs_attach(void *opaque)
         error_setg(&s->migration_blocker,
                    "Migration is disabled when VirtFS export path '%s' is mounted in the guest using mount_tag '%s'",
                    s->ctx.fs_root ? s->ctx.fs_root : "NULL", s->tag);
-        err = migrate_add_blocker(&s->migration_blocker, NULL);
+        err = migrate_add_blockers(&s->migration_blocker, NULL, MIG_MODE_NORMAL,
+                                   -1);
         if (err < 0) {
             clunk_fid(s, fid);
             goto out;
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index b5e34f2..4a9d711 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -208,7 +208,8 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
                 "When external environment supports it (Orchestrator migrates "
                 "target SCSI device state or use shared storage over network), "
                 "set 'migratable' property to true to enable migration.");
-        if (migrate_add_blocker(&vsc->migration_blocker, errp) < 0) {
+        if (migrate_add_blockers(&vsc->migration_blocker, errp, MIG_MODE_NORMAL,
+                                 -1) < 0) {
             goto free_virtio;
         }
     }
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index ae52b62..8d2a136 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1431,7 +1431,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     }
 
     if (hdev->migration_blocker != NULL) {
-        r = migrate_add_blocker(&hdev->migration_blocker, errp);
+        r = migrate_add_blockers(&hdev->migration_blocker, errp,
+                                 MIG_MODE_NORMAL, -1);
         if (r < 0) {
             goto fail_busyloop;
         }
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index f66b140..e102f64 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -935,7 +935,8 @@ nvmm_init_vcpu(CPUState *cpu)
         error_setg(&nvmm_migration_blocker,
             "NVMM: Migration not supported");
 
-        if (migrate_add_blocker(&nvmm_migration_blocker, &local_error) < 0) {
+        if (migrate_add_blockers(&nvmm_migration_blocker, &local_error,
+                                 MIG_MODE_NORMAL, -1) < 0) {
             error_report_err(local_error);
             return -EINVAL;
         }
-- 
1.8.3.1


