Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52732153DC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 10:18:53 +0200 (CEST)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsMKy-0001tE-RG
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 04:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCy-0002kI-GH
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37360
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCS-0003Hf-2G
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594023002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WjH6u2neeF6V9LZ/KREOUckiZbXFB+nVE57Q8KWQk5U=;
 b=ah23GCoKcAEg34sAjG6g6yWxQ0dnww2GdJgctaSTJmIeILZgd6AEltRVExsmUe5PlofjVT
 BYXteBu9YF9wmoyjjge0rhGPRuWsa8VUr4n1u2Vtwui2me47C1E0Z4SL201VoQ1/ckfXSr
 cjQS7/jidCZ62FcWnP2b9Fiowb8MatA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-YxovzKjsO2qUSxLhYZEzWA-1; Mon, 06 Jul 2020 04:10:00 -0400
X-MC-Unique: YxovzKjsO2qUSxLhYZEzWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1F56188361A;
 Mon,  6 Jul 2020 08:09:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E45DC6E6E4;
 Mon,  6 Jul 2020 08:09:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 88A971133023; Mon,  6 Jul 2020 10:09:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 41/44] error: Avoid error_propagate() after
 migrate_add_blocker()
Date: Mon,  6 Jul 2020 10:09:47 +0200
Message-Id: <20200706080950.403087-42-armbru@redhat.com>
In-Reply-To: <20200706080950.403087-1-armbru@redhat.com>
References: <20200706080950.403087-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When migrate_add_blocker(blocker, &errp) is followed by
error_propagate(errp, err), we can often just as well do
migrate_add_blocker(..., errp).

Do that with this Coccinelle script:

    @@
    expression blocker, err, errp;
    expression ret;
    @@
    -    ret = migrate_add_blocker(blocker, &err);
    -    if (err) {
    +    ret = migrate_add_blocker(blocker, errp);
    +    if (ret < 0) {
             ... when != err;
    -        error_propagate(errp, err);
             ...
         }

    @@
    expression blocker, err, errp;
    @@
    -    migrate_add_blocker(blocker, &err);
    -    if (err) {
    +    if (migrate_add_blocker(blocker, errp) < 0) {
             ... when != err;
    -        error_propagate(errp, err);
             ...
         }

Double-check @err is not used afterwards.  Dereferencing it would be
use after free, but checking whether it's null would be legitimate.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/parallels.c            | 5 ++---
 block/qcow.c                 | 6 ++----
 block/vdi.c                  | 6 ++----
 block/vhdx.c                 | 5 ++---
 block/vmdk.c                 | 6 ++----
 block/vpc.c                  | 5 ++---
 block/vvfat.c                | 6 ++----
 hw/display/virtio-gpu-base.c | 5 +----
 hw/intc/arm_gic_kvm.c        | 4 +---
 hw/intc/arm_gicv3_its_kvm.c  | 5 +----
 hw/intc/arm_gicv3_kvm.c      | 4 +---
 hw/misc/ivshmem.c            | 4 +---
 hw/scsi/vhost-scsi.c         | 4 +---
 13 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index f489c0d4ba..3c22dfdc9d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -859,9 +859,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The Parallels format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = migrate_add_blocker(s->migration_blocker, errp);
+    if (ret < 0) {
         error_free(s->migration_blocker);
         goto fail;
     }
diff --git a/block/qcow.c b/block/qcow.c
index c22d1bf6b8..1e134f3445 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -121,7 +121,6 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
     unsigned int len, i, shift;
     int ret;
     QCowHeader header;
-    Error *local_err = NULL;
     QCryptoBlockOpenOptions *crypto_opts = NULL;
     unsigned int cflags = 0;
     QDict *encryptopts = NULL;
@@ -314,9 +313,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The qcow format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = migrate_add_blocker(s->migration_blocker, errp);
+    if (ret < 0) {
         error_free(s->migration_blocker);
         goto fail;
     }
diff --git a/block/vdi.c b/block/vdi.c
index 0a60be773e..3a3df45f84 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -375,7 +375,6 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
     VdiHeader header;
     size_t bmap_size;
     int ret;
-    Error *local_err = NULL;
     QemuUUID uuid_link, uuid_parent;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
@@ -496,9 +495,8 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vdi format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = migrate_add_blocker(s->migration_blocker, errp);
+    if (ret < 0) {
         error_free(s->migration_blocker);
         goto fail_free_bmap;
     }
diff --git a/block/vhdx.c b/block/vhdx.c
index eed9c3b860..1f9fca837d 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1089,9 +1089,8 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vhdx format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = migrate_add_blocker(s->migration_blocker, errp);
+    if (ret < 0) {
         error_free(s->migration_blocker);
         goto fail;
     }
diff --git a/block/vmdk.c b/block/vmdk.c
index 9a09193f3b..28cec50f38 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1263,7 +1263,6 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     BDRVVmdkState *s = bs->opaque;
     uint32_t magic;
-    Error *local_err = NULL;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_IMAGE, false, errp);
@@ -1317,9 +1316,8 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vmdk format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = migrate_add_blocker(s->migration_blocker, errp);
+    if (ret < 0) {
         error_free(s->migration_blocker);
         goto fail;
     }
diff --git a/block/vpc.c b/block/vpc.c
index 77043c2424..259d0ad2fe 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -446,9 +446,8 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vpc format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(s->migration_blocker, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = migrate_add_blocker(s->migration_blocker, errp);
+    if (ret < 0) {
         error_free(s->migration_blocker);
         goto fail;
     }
diff --git a/block/vvfat.c b/block/vvfat.c
index 24d36220d3..36b53c8757 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1141,7 +1141,6 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
     bool floppy;
     const char *dirname, *label;
     QemuOpts *opts;
-    Error *local_err = NULL;
     int ret;
 
 #ifdef DEBUG
@@ -1267,9 +1266,8 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
                    "The vvfat (rw) format used by node '%s' "
                    "does not support live migration",
                    bdrv_get_device_or_node_name(bs));
-        ret = migrate_add_blocker(s->migration_blocker, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        ret = migrate_add_blocker(s->migration_blocker, errp);
+        if (ret < 0) {
             error_free(s->migration_blocker);
             goto fail;
         }
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index c159351be3..7961308606 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -128,7 +128,6 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
     VirtIOGPUBase *g = VIRTIO_GPU_BASE(qdev);
-    Error *local_err = NULL;
     int i;
 
     if (g->conf.max_outputs > VIRTIO_GPU_MAX_SCANOUTS) {
@@ -139,9 +138,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     g->use_virgl_renderer = false;
     if (virtio_gpu_virgl_enabled(g->conf)) {
         error_setg(&g->migration_blocker, "virgl is not yet migratable");
-        migrate_add_blocker(g->migration_blocker, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (migrate_add_blocker(g->migration_blocker, errp) < 0) {
             error_free(g->migration_blocker);
             return false;
         }
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index d7df423a7a..07b95143c9 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -517,9 +517,7 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
     if (!kvm_arm_gic_can_save_restore(s)) {
         error_setg(&s->migration_blocker, "This operating system kernel does "
                                           "not support vGICv2 migration");
-        migrate_add_blocker(s->migration_blocker, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (migrate_add_blocker(s->migration_blocker, errp) < 0) {
             error_free(s->migration_blocker);
             return;
         }
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index ad0ebabc87..46835ed085 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -91,7 +91,6 @@ static void vm_change_state_handler(void *opaque, int running,
 static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
 {
     GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
-    Error *local_err = NULL;
 
     s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_ITS, false);
     if (s->dev_fd < 0) {
@@ -113,9 +112,7 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
         GITS_CTLR)) {
         error_setg(&s->migration_blocker, "This operating system kernel "
                    "does not support vITS migration");
-        migrate_add_blocker(s->migration_blocker, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (migrate_add_blocker(s->migration_blocker, errp) < 0) {
             error_free(s->migration_blocker);
             return;
         }
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index ca43bf87ca..eddd07c743 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -858,9 +858,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
                                GICD_CTLR)) {
         error_setg(&s->migration_blocker, "This operating system kernel does "
                                           "not support vGICv3 migration");
-        migrate_add_blocker(s->migration_blocker, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (migrate_add_blocker(s->migration_blocker, errp) < 0) {
             error_free(s->migration_blocker);
             return;
         }
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index a8dc9b377d..fc128b25e2 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -898,9 +898,7 @@ static void ivshmem_common_realize(PCIDevice *dev, Error **errp)
     if (!ivshmem_is_master(s)) {
         error_setg(&s->migration_blocker,
                    "Migration is disabled when using feature 'peer mode' in device 'ivshmem'");
-        migrate_add_blocker(s->migration_blocker, &err);
-        if (err) {
-            error_propagate(errp, err);
+        if (migrate_add_blocker(s->migration_blocker, errp) < 0) {
             error_free(s->migration_blocker);
             return;
         }
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index c1b012aea4..13b05af29b 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -207,9 +207,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
                 "When external environment supports it (Orchestrator migrates "
                 "target SCSI device state or use shared storage over network), "
                 "set 'migratable' property to true to enable migration.");
-        migrate_add_blocker(vsc->migration_blocker, &err);
-        if (err) {
-            error_propagate(errp, err);
+        if (migrate_add_blocker(vsc->migration_blocker, errp) < 0) {
             error_free(vsc->migration_blocker);
             goto free_virtio;
         }
-- 
2.26.2


