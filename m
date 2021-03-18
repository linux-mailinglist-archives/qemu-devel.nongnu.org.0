Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118234023D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:39:33 +0100 (CET)
Received: from localhost ([::1]:40062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMp7s-00015x-Jz
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMoyp-0006Nw-Un
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMoym-0002d2-HT
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sMdKVkzZffHzHAr+ZSqMB26NMoreMWRdATTRUxxI+k=;
 b=IORwR0dZIetrU4pFBElLZbQtmw6F1VPJkQguENiOVwU3kIUJqFYFjhCrcio4UbEnpzNHt5
 sD24C+En8V6hSgPHcbEjZ3U4xIq7qVxJKrw9LiUtaME1CFPq4Gffdb8iJzpw4p1r8KwX4/
 BfFfxsGavud6/Shqxz1pGsC685XqbSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-SHsU-NiTNOyFe_ygMAXkpw-1; Thu, 18 Mar 2021 05:30:04 -0400
X-MC-Unique: SHsU-NiTNOyFe_ygMAXkpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E0CC10866A0;
 Thu, 18 Mar 2021 09:30:02 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-61.ams2.redhat.com
 [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B30BB682AC;
 Thu, 18 Mar 2021 09:29:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/13] hw/scsi: remove 'scsi-disk' device
Date: Thu, 18 Mar 2021 09:25:08 +0000
Message-Id: <20210318092512.250725-10-berrange@redhat.com>
In-Reply-To: <20210318092512.250725-1-berrange@redhat.com>
References: <20210318092512.250725-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'scsi-hd' and 'scsi-cd' devices provide suitable alternatives.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst       |  9 -----
 docs/system/removed-features.rst |  6 ++++
 hw/i386/pc.c                     |  1 -
 hw/scsi/scsi-disk.c              | 62 --------------------------------
 scripts/device-crash-test        |  1 -
 tests/qemu-iotests/051           |  2 --
 tests/qemu-iotests/051.pc.out    | 10 ------
 7 files changed, 6 insertions(+), 85 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index f512e05734..ced6adf752 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -275,15 +275,6 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
 (the ISA has never been upstreamed to a compiler toolchain). Therefore
 this CPU is also deprecated.
 
-System emulator devices
------------------------
-
-``scsi-disk`` (since 4.2)
-'''''''''''''''''''''''''
-
-The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
-'scsi-cd' as appropriate to get a SCSI hard disk or CD-ROM as needed.
-
 System emulator machines
 ------------------------
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 794fc3f367..2d6ff6aaf6 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -233,6 +233,12 @@ System emulator devices
 The 'ide-drive' device has been removed. Users should use 'ide-hd' or
 'ide-cd' as appropriate to get an IDE hard disk or CD-ROM as needed.
 
+``scsi-disk`` (removed in 6.0)
+''''''''''''''''''''''''''''''
+
+The 'scsi-disk' device has been removed. Users should use 'scsi-hd' or
+'scsi-cd' as appropriate to get a SCSI hard disk or CD-ROM as needed.
+
 Related binaries
 ----------------
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 804913bb7e..35e1770950 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -338,7 +338,6 @@ GlobalProperty pc_compat_1_4[] = {
     PC_CPU_MODEL_IDS("1.4.0")
     { "scsi-hd", "discard_granularity", "0" },
     { "scsi-cd", "discard_granularity", "0" },
-    { "scsi-disk", "discard_granularity", "0" },
     { "ide-hd", "discard_granularity", "0" },
     { "ide-cd", "discard_granularity", "0" },
     { "virtio-blk-pci", "discard_granularity", "0" },
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 2eaea7e637..3580e7ee61 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2476,28 +2476,6 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
     aio_context_release(ctx);
 }
 
-static void scsi_disk_realize(SCSIDevice *dev, Error **errp)
-{
-    DriveInfo *dinfo;
-    Error *local_err = NULL;
-
-    warn_report("'scsi-disk' is deprecated, "
-                "please use 'scsi-hd' or 'scsi-cd' instead");
-
-    if (!dev->conf.blk) {
-        scsi_realize(dev, &local_err);
-        assert(local_err);
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    dinfo = blk_legacy_dinfo(dev->conf.blk);
-    if (dinfo && dinfo->media_cd) {
-        scsi_cd_realize(dev, errp);
-    } else {
-        scsi_hd_realize(dev, errp);
-    }
-}
 
 static const SCSIReqOps scsi_disk_emulate_reqops = {
     .size         = sizeof(SCSIDiskReq),
@@ -3161,45 +3139,6 @@ static const TypeInfo scsi_block_info = {
 };
 #endif
 
-static Property scsi_disk_properties[] = {
-    DEFINE_SCSI_DISK_PROPERTIES(),
-    DEFINE_PROP_BIT("removable", SCSIDiskState, features,
-                    SCSI_DISK_F_REMOVABLE, false),
-    DEFINE_PROP_BIT("dpofua", SCSIDiskState, features,
-                    SCSI_DISK_F_DPOFUA, false),
-    DEFINE_PROP_UINT64("wwn", SCSIDiskState, qdev.wwn, 0),
-    DEFINE_PROP_UINT64("port_wwn", SCSIDiskState, qdev.port_wwn, 0),
-    DEFINE_PROP_UINT16("port_index", SCSIDiskState, port_index, 0),
-    DEFINE_PROP_UINT64("max_unmap_size", SCSIDiskState, max_unmap_size,
-                       DEFAULT_MAX_UNMAP_SIZE),
-    DEFINE_PROP_UINT64("max_io_size", SCSIDiskState, max_io_size,
-                       DEFAULT_MAX_IO_SIZE),
-    DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
-                      5),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void scsi_disk_class_initfn(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    SCSIDeviceClass *sc = SCSI_DEVICE_CLASS(klass);
-
-    sc->realize      = scsi_disk_realize;
-    sc->alloc_req    = scsi_new_request;
-    sc->unit_attention_reported = scsi_disk_unit_attention_reported;
-    dc->fw_name = "disk";
-    dc->desc = "virtual SCSI disk or CD-ROM (legacy)";
-    dc->reset = scsi_disk_reset;
-    device_class_set_props(dc, scsi_disk_properties);
-    dc->vmsd  = &vmstate_scsi_disk_state;
-}
-
-static const TypeInfo scsi_disk_info = {
-    .name          = "scsi-disk",
-    .parent        = TYPE_SCSI_DISK_BASE,
-    .class_init    = scsi_disk_class_initfn,
-};
-
 static void scsi_disk_register_types(void)
 {
     type_register_static(&scsi_disk_base_info);
@@ -3208,7 +3147,6 @@ static void scsi_disk_register_types(void)
 #ifdef __linux__
     type_register_static(&scsi_block_info);
 #endif
-    type_register_static(&scsi_disk_info);
 }
 
 type_init(scsi_disk_register_types)
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 3981209165..6d809ac711 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -93,7 +93,6 @@ ERROR_RULE_LIST = [
     {'device':'pci-bridge-seat', 'expected':True},         # Bridge chassis not specified. Each bridge is required to be assigned a unique chassis id > 0.
     {'device':'pxb', 'expected':True},                     # Bridge chassis not specified. Each bridge is required to be assigned a unique chassis id > 0.
     {'device':'scsi-block', 'expected':True},              # drive property not set
-    {'device':'scsi-disk', 'expected':True},               # drive property not set
     {'device':'scsi-generic', 'expected':True},            # drive property not set
     {'device':'scsi-hd', 'expected':True},                 # drive property not set
     {'device':'spapr-pci-host-bridge', 'expected':True},   # BUID not specified for PHB
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 8b334fe41d..f92161d8ef 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -186,7 +186,6 @@ case "$QEMU_DEFAULT_MACHINE" in
         run_qemu -drive if=none,id=disk -device ide-cd,drive=disk
         run_qemu -drive if=none,id=disk -device lsi53c895a -device scsi-cd,drive=disk
         run_qemu -drive if=none,id=disk -device ide-hd,drive=disk
-        run_qemu -drive if=none,id=disk -device lsi53c895a -device scsi-disk,drive=disk
         run_qemu -drive if=none,id=disk -device lsi53c895a -device scsi-hd,drive=disk
         ;;
      *)
@@ -238,7 +237,6 @@ case "$QEMU_DEFAULT_MACHINE" in
         run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device ide-cd,drive=disk
         run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device lsi53c895a -device scsi-cd,drive=disk
         run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device ide-hd,drive=disk
-        run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device lsi53c895a -device scsi-disk,drive=disk
         run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device lsi53c895a -device scsi-hd,drive=disk
         ;;
      *)
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index 29c0d698b0..a28e3fc124 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -160,11 +160,6 @@ Testing: -drive if=none,id=disk -device ide-hd,drive=disk
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device ide-hd,drive=disk: Device needs media, but drive is empty
 
-Testing: -drive if=none,id=disk -device lsi53c895a -device scsi-disk,drive=disk
-QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: -device scsi-disk,drive=disk: warning: 'scsi-disk' is deprecated, please use 'scsi-hd' or 'scsi-cd' instead
-QEMU_PROG: -device scsi-disk,drive=disk: Device needs media, but drive is empty
-
 Testing: -drive if=none,id=disk -device lsi53c895a -device scsi-hd,drive=disk
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device scsi-hd,drive=disk: Device needs media, but drive is empty
@@ -227,11 +222,6 @@ Testing: -drive file=TEST_DIR/t.qcow2,if=none,id=disk,readonly=on -device ide-hd
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device ide-hd,drive=disk: Block node is read-only
 
-Testing: -drive file=TEST_DIR/t.qcow2,if=none,id=disk,readonly=on -device lsi53c895a -device scsi-disk,drive=disk
-QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: -device scsi-disk,drive=disk: warning: 'scsi-disk' is deprecated, please use 'scsi-hd' or 'scsi-cd' instead
-quit
-
 Testing: -drive file=TEST_DIR/t.qcow2,if=none,id=disk,readonly=on -device lsi53c895a -device scsi-hd,drive=disk
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
-- 
2.30.2


