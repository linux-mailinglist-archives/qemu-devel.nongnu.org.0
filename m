Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC9323E48
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:32:59 +0100 (CET)
Received: from localhost ([::1]:55904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuHi-0000KT-Ul
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu0r-0004ay-Q1
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:15:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEu0p-00063L-CW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hgp3Ivuf7y5HYNQKGzzSka+Uf/kvFmx7vyLC/I97ZFI=;
 b=SPhJxf5pNFFFKBGZDzIoII2FsoKVDcC7v8oVgEVFpv0mYrMtYkO8Awwqn1LYsB9FLksy/3
 iIXTyR8OeJ5+DZQvPdwT9ZedkP8B7FA28YhPRcOPZo1+QG/XrO/Nk+KSNLNnvkysQN679Y
 Xgg6vPSzdKeJUyoNA3VdpPKHtoh47w0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-O9F1kCgrOCC8vhTEEKlqBg-1; Wed, 24 Feb 2021 08:15:26 -0500
X-MC-Unique: O9F1kCgrOCC8vhTEEKlqBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1AEE10074B4;
 Wed, 24 Feb 2021 13:15:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AC521002388;
 Wed, 24 Feb 2021 13:15:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/14] hw/ide: remove 'ide-drive' device
Date: Wed, 24 Feb 2021 13:11:37 +0000
Message-Id: <20210224131142.1952027-10-berrange@redhat.com>
In-Reply-To: <20210224131142.1952027-1-berrange@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The 'ide-hd' and 'ide-cd' devices provide suitable alternatives.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/qdev-device-use.txt         |  2 +-
 docs/system/deprecated.rst       |  6 -----
 docs/system/removed-features.rst |  9 ++++++++
 hw/i386/pc.c                     |  1 -
 hw/ide/qdev.c                    | 38 --------------------------------
 hw/ppc/mac_newworld.c            | 13 -----------
 hw/ppc/mac_oldworld.c            | 13 -----------
 hw/sparc64/sun4u.c               | 14 ------------
 scripts/device-crash-test        |  1 -
 softmmu/vl.c                     |  1 -
 tests/qemu-iotests/051           |  2 --
 tests/qemu-iotests/051.pc.out    | 10 ---------
 12 files changed, 10 insertions(+), 100 deletions(-)

diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
index 245cdf29c7..2408889334 100644
--- a/docs/qdev-device-use.txt
+++ b/docs/qdev-device-use.txt
@@ -388,7 +388,7 @@ type.
 some DEVNAMEs:
 
     default device      suppressing DEVNAMEs
-    CD-ROM              ide-cd, ide-drive, ide-hd, scsi-cd, scsi-hd
+    CD-ROM              ide-cd, ide-hd, scsi-cd, scsi-hd
     floppy              floppy, isa-fdc
     parallel            isa-parallel
     serial              isa-serial
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index c69887dca8..f5c82a46dc 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -242,12 +242,6 @@ this CPU is also deprecated.
 System emulator devices
 -----------------------
 
-``ide-drive`` (since 4.2)
-'''''''''''''''''''''''''
-
-The 'ide-drive' device is deprecated. Users should use 'ide-hd' or
-'ide-cd' as appropriate to get an IDE hard disk or CD-ROM as needed.
-
 ``scsi-disk`` (since 4.2)
 '''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 870a222062..8fd3fafb32 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -213,6 +213,15 @@ This machine has been renamed ``fuloong2e``.
 These machine types were very old and likely could not be used for live
 migration from old QEMU versions anymore. Use a newer machine type instead.
 
+System emulator devices
+-----------------------
+
+``ide-drive`` (removed in 6.0)
+''''''''''''''''''''''''''''''
+
+The 'ide-drive' device has been removed. Users should use 'ide-hd' or
+'ide-cd' as appropriate to get an IDE hard disk or CD-ROM as needed.
+
 Related binaries
 ----------------
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8aa85dec54..828122e21e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -342,7 +342,6 @@ GlobalProperty pc_compat_1_4[] = {
     { "scsi-disk", "discard_granularity", "0" },
     { "ide-hd", "discard_granularity", "0" },
     { "ide-cd", "discard_granularity", "0" },
-    { "ide-drive", "discard_granularity", "0" },
     { "virtio-blk-pci", "discard_granularity", "0" },
     /* DEV_NVECTORS_UNSPECIFIED as a uint32_t string: */
     { "virtio-serial-pci", "vectors", "0xFFFFFFFF" },
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 8cd19fa5e9..e70ebc83a0 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -283,20 +283,6 @@ static void ide_cd_realize(IDEDevice *dev, Error **errp)
     ide_dev_initfn(dev, IDE_CD, errp);
 }
 
-static void ide_drive_realize(IDEDevice *dev, Error **errp)
-{
-    DriveInfo *dinfo = NULL;
-
-    warn_report("'ide-drive' is deprecated, "
-                "please use 'ide-hd' or 'ide-cd' instead");
-
-    if (dev->conf.blk) {
-        dinfo = blk_legacy_dinfo(dev->conf.blk);
-    }
-
-    ide_dev_initfn(dev, dinfo && dinfo->media_cd ? IDE_CD : IDE_HD, errp);
-}
-
 #define DEFINE_IDE_DEV_PROPERTIES()                     \
     DEFINE_BLOCK_PROPERTIES(IDEDrive, dev.conf),        \
     DEFINE_BLOCK_ERROR_PROPERTIES(IDEDrive, dev.conf),  \
@@ -355,29 +341,6 @@ static const TypeInfo ide_cd_info = {
     .class_init    = ide_cd_class_init,
 };
 
-static Property ide_drive_properties[] = {
-    DEFINE_IDE_DEV_PROPERTIES(),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void ide_drive_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    IDEDeviceClass *k = IDE_DEVICE_CLASS(klass);
-
-    k->realize  = ide_drive_realize;
-    dc->fw_name = "drive";
-    dc->desc    = "virtual IDE disk or CD-ROM (legacy)";
-    device_class_set_props(dc, ide_drive_properties);
-}
-
-static const TypeInfo ide_drive_info = {
-    .name          = "ide-drive",
-    .parent        = TYPE_IDE_DEVICE,
-    .instance_size = sizeof(IDEDrive),
-    .class_init    = ide_drive_class_init,
-};
-
 static void ide_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
@@ -402,7 +365,6 @@ static void ide_register_types(void)
     type_register_static(&ide_bus_info);
     type_register_static(&ide_hd_info);
     type_register_static(&ide_cd_info);
-    type_register_static(&ide_drive_info);
     type_register_static(&ide_device_type_info);
 }
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index e991db4add..2175962846 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -539,8 +539,6 @@ static char *core99_fw_dev_path(FWPathProvider *p, BusState *bus,
                                 DeviceState *dev)
 {
     PCIDevice *pci;
-    IDEBus *ide_bus;
-    IDEState *ide_s;
     MACIOIDEState *macio_ide;
 
     if (!strcmp(object_get_typename(OBJECT(dev)), "macio-newworld")) {
@@ -553,17 +551,6 @@ static char *core99_fw_dev_path(FWPathProvider *p, BusState *bus,
         return g_strdup_printf("ata-3@%x", macio_ide->addr);
     }
 
-    if (!strcmp(object_get_typename(OBJECT(dev)), "ide-drive")) {
-        ide_bus = IDE_BUS(qdev_get_parent_bus(dev));
-        ide_s = idebus_active_if(ide_bus);
-
-        if (ide_s->drive_kind == IDE_CD) {
-            return g_strdup("cdrom");
-        }
-
-        return g_strdup("disk");
-    }
-
     if (!strcmp(object_get_typename(OBJECT(dev)), "ide-hd")) {
         return g_strdup("disk");
     }
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 44ee99be88..963d247f5f 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -384,8 +384,6 @@ static char *heathrow_fw_dev_path(FWPathProvider *p, BusState *bus,
                                   DeviceState *dev)
 {
     PCIDevice *pci;
-    IDEBus *ide_bus;
-    IDEState *ide_s;
     MACIOIDEState *macio_ide;
 
     if (!strcmp(object_get_typename(OBJECT(dev)), "macio-oldworld")) {
@@ -398,17 +396,6 @@ static char *heathrow_fw_dev_path(FWPathProvider *p, BusState *bus,
         return g_strdup_printf("ata-3@%x", macio_ide->addr);
     }
 
-    if (!strcmp(object_get_typename(OBJECT(dev)), "ide-drive")) {
-        ide_bus = IDE_BUS(qdev_get_parent_bus(dev));
-        ide_s = idebus_active_if(ide_bus);
-
-        if (ide_s->drive_kind == IDE_CD) {
-            return g_strdup("cdrom");
-        }
-
-        return g_strdup("disk");
-    }
-
     if (!strcmp(object_get_typename(OBJECT(dev)), "ide-hd")) {
         return g_strdup("disk");
     }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 0fa13a7330..d7c27144ba 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -749,8 +749,6 @@ static char *sun4u_fw_dev_path(FWPathProvider *p, BusState *bus,
                                DeviceState *dev)
 {
     PCIDevice *pci;
-    IDEBus *ide_bus;
-    IDEState *ide_s;
     int bus_id;
 
     if (!strcmp(object_get_typename(OBJECT(dev)), "pbm-bridge")) {
@@ -764,18 +762,6 @@ static char *sun4u_fw_dev_path(FWPathProvider *p, BusState *bus,
         }
     }
 
-    if (!strcmp(object_get_typename(OBJECT(dev)), "ide-drive")) {
-         ide_bus = IDE_BUS(qdev_get_parent_bus(dev));
-         ide_s = idebus_active_if(ide_bus);
-         bus_id = ide_bus->bus_id;
-
-         if (ide_s->drive_kind == IDE_CD) {
-             return g_strdup_printf("ide@%x/cdrom", bus_id);
-         }
-
-         return g_strdup_printf("ide@%x/disk", bus_id);
-    }
-
     if (!strcmp(object_get_typename(OBJECT(dev)), "ide-hd")) {
         return g_strdup("disk");
     }
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index ef1412ca59..3981209165 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -76,7 +76,6 @@ ERROR_RULE_LIST = [
     {'device':'ics', 'expected':True},                     # ics_base_realize: required link 'xics' not found: Property '.xics' not found
     # "-device ide-cd" does work on more recent QEMU versions, so it doesn't have expected=True
     {'device':'ide-cd'},                                 # No drive specified
-    {'device':'ide-drive', 'expected':True},               # No drive specified
     {'device':'ide-hd', 'expected':True},                  # No drive specified
     {'device':'ipmi-bmc-extern', 'expected':True},         # IPMI external bmc requires chardev attribute
     {'device':'isa-debugcon', 'expected':True},            # Can't create serial device, empty char device
diff --git a/softmmu/vl.c b/softmmu/vl.c
index c31061cc09..fdabf68433 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -177,7 +177,6 @@ static struct {
     { .driver = "floppy",               .flag = &default_floppy    },
     { .driver = "ide-cd",               .flag = &default_cdrom     },
     { .driver = "ide-hd",               .flag = &default_cdrom     },
-    { .driver = "ide-drive",            .flag = &default_cdrom     },
     { .driver = "scsi-cd",              .flag = &default_cdrom     },
     { .driver = "scsi-hd",              .flag = &default_cdrom     },
     { .driver = "VGA",                  .flag = &default_vga       },
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 7cbd1415ce..8b334fe41d 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -185,7 +185,6 @@ case "$QEMU_DEFAULT_MACHINE" in
     pc)
         run_qemu -drive if=none,id=disk -device ide-cd,drive=disk
         run_qemu -drive if=none,id=disk -device lsi53c895a -device scsi-cd,drive=disk
-        run_qemu -drive if=none,id=disk -device ide-drive,drive=disk
         run_qemu -drive if=none,id=disk -device ide-hd,drive=disk
         run_qemu -drive if=none,id=disk -device lsi53c895a -device scsi-disk,drive=disk
         run_qemu -drive if=none,id=disk -device lsi53c895a -device scsi-hd,drive=disk
@@ -238,7 +237,6 @@ case "$QEMU_DEFAULT_MACHINE" in
     pc)
         run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device ide-cd,drive=disk
         run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device lsi53c895a -device scsi-cd,drive=disk
-        run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device ide-drive,drive=disk
         run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device ide-hd,drive=disk
         run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device lsi53c895a -device scsi-disk,drive=disk
         run_qemu -drive file="$TEST_IMG",if=none,id=disk,readonly=on -device lsi53c895a -device scsi-hd,drive=disk
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index f707471fb0..2e23a4caa0 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -156,11 +156,6 @@ Testing: -drive if=none,id=disk -device lsi53c895a -device scsi-cd,drive=disk
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
-Testing: -drive if=none,id=disk -device ide-drive,drive=disk
-QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: -device ide-drive,drive=disk: warning: 'ide-drive' is deprecated, please use 'ide-hd' or 'ide-cd' instead
-QEMU_PROG: -device ide-drive,drive=disk: Device needs media, but drive is empty
-
 Testing: -drive if=none,id=disk -device ide-hd,drive=disk
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device ide-hd,drive=disk: Device needs media, but drive is empty
@@ -228,11 +223,6 @@ Testing: -drive file=TEST_DIR/t.qcow2,if=none,id=disk,readonly=on -device lsi53c
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
-Testing: -drive file=TEST_DIR/t.qcow2,if=none,id=disk,readonly=on -device ide-drive,drive=disk
-QEMU X.Y.Z monitor - type 'help' for more information
-(qemu) QEMU_PROG: -device ide-drive,drive=disk: warning: 'ide-drive' is deprecated, please use 'ide-hd' or 'ide-cd' instead
-QEMU_PROG: -device ide-drive,drive=disk: Block node is read-only
-
 Testing: -drive file=TEST_DIR/t.qcow2,if=none,id=disk,readonly=on -device ide-hd,drive=disk
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -device ide-hd,drive=disk: Block node is read-only
-- 
2.29.2


