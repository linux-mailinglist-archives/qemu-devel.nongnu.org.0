Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B9933DE42
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:54:25 +0100 (CET)
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFlo-0002R4-BX
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMFIN-0000FS-Jy
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMFII-0002Nh-Pt
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615922633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P73mbHZWEKWOJ+udz0i04RWCoN9vx1f1zfg5SMVTcsg=;
 b=dyHY0FfQPut2J8TyjDZYJLr6Va7TPzA7bhyPUdZEN6rkCJZ88/ljI7uRvZQGMQGtvcdikL
 W0GEh5apnyXSDFYAgx+DENBo76CrNArMptUH0J78vYhi4zspEXuOfbMncmh5HoLvmX4BPR
 bVL9ZXFY5pDmNCTulqFUIon3QoegtIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-K-CZwKpXP_eIWD36he6Mng-1; Tue, 16 Mar 2021 15:23:50 -0400
X-MC-Unique: K-CZwKpXP_eIWD36he6Mng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 759571850604;
 Tue, 16 Mar 2021 19:23:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF00B60CCC;
 Tue, 16 Mar 2021 19:23:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3356E1132C14; Tue, 16 Mar 2021 20:23:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 2/6] fdc: Drop deprecated floppy configuration
Date: Tue, 16 Mar 2021 20:23:43 +0100
Message-Id: <20210316192347.3918857-3-armbru@redhat.com>
In-Reply-To: <20210316192347.3918857-1-armbru@redhat.com>
References: <20210316192347.3918857-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: John Snow <jsnow@redhat.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
configuring floppies with -global isa-fdc" (v5.1.0).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20210309161214.1402527-3-armbru@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/system/deprecated.rst       |  49 ---
 docs/system/removed-features.rst |  49 +++
 hw/block/fdc.c                   |  54 +--
 tests/qemu-iotests/172           |  31 +-
 tests/qemu-iotests/172.out       | 562 +------------------------------
 5 files changed, 53 insertions(+), 692 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index c89d0a207c..8e78ff3dad 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -94,55 +94,6 @@ QEMU 5.1 has three options:
       to the user to load all the images they need.
  3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
 
-Floppy controllers' drive properties (since 5.1)
-''''''''''''''''''''''''''''''''''''''''''''''''
-
-Use ``-device floppy,...`` instead.  When configuring onboard floppy
-controllers
-::
-
-    -global isa-fdc.driveA=...
-    -global sysbus-fdc.driveA=...
-    -global SUNW,fdtwo.drive=...
-
-become
-::
-
-    -device floppy,unit=0,drive=...
-
-and
-::
-
-    -global isa-fdc.driveB=...
-    -global sysbus-fdc.driveB=...
-
-become
-::
-
-    -device floppy,unit=1,drive=...
-
-When plugging in a floppy controller
-::
-
-    -device isa-fdc,...,driveA=...
-
-becomes
-::
-
-    -device isa-fdc,...
-    -device floppy,unit=0,drive=...
-
-and
-::
-
-    -device isa-fdc,...,driveB=...
-
-becomes
-::
-
-    -device isa-fdc,...
-    -device floppy,unit=1,drive=...
-
 ``-drive`` with bogus interface type (since 5.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 83148dcfda..1d73567acf 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -38,6 +38,55 @@ or ``-display default,show-cursor=on`` instead.
 QEMU 5.0 introduced an alternative syntax to specify the size of the translation
 block cache, ``-accel tcg,tb-size=``.
 
+Floppy controllers' drive properties (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-device floppy,...`` instead.  When configuring onboard floppy
+controllers
+::
+
+    -global isa-fdc.driveA=...
+    -global sysbus-fdc.driveA=...
+    -global SUNW,fdtwo.drive=...
+
+become
+::
+
+    -device floppy,unit=0,drive=...
+
+and
+::
+
+    -global isa-fdc.driveB=...
+    -global sysbus-fdc.driveB=...
+
+become
+::
+
+    -device floppy,unit=1,drive=...
+
+When plugging in a floppy controller
+::
+
+    -device isa-fdc,...,driveA=...
+
+becomes
+::
+
+    -device isa-fdc,...
+    -device floppy,unit=0,drive=...
+
+and
+::
+
+    -device isa-fdc,...,driveB=...
+
+becomes
+::
+
+    -device isa-fdc,...
+    -device floppy,unit=1,drive=...
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 198940e737..f978ddf647 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -870,7 +870,6 @@ struct FDCtrl {
     uint8_t num_floppies;
     FDrive drives[MAX_FD];
     struct {
-        BlockBackend *blk;
         FloppyDriveType type;
     } qdev_for_drives[MAX_FD];
     int reset_sensei;
@@ -2517,56 +2516,12 @@ static void fdctrl_connect_drives(FDCtrl *fdctrl, DeviceState *fdc_dev,
 {
     unsigned int i;
     FDrive *drive;
-    DeviceState *dev;
-    BlockBackend *blk;
-    bool ok;
-    const char *fdc_name, *drive_suffix;
 
     for (i = 0; i < MAX_FD; i++) {
         drive = &fdctrl->drives[i];
         drive->fdctrl = fdctrl;
-
-        /* If the drive is not present, we skip creating the qdev device, but
-         * still have to initialise the controller. */
-        blk = fdctrl->qdev_for_drives[i].blk;
-        if (!blk) {
-            fd_init(drive);
-            fd_revalidate(drive);
-            continue;
-        }
-
-        fdc_name = object_get_typename(OBJECT(fdc_dev));
-        drive_suffix = !strcmp(fdc_name, "SUNW,fdtwo") ? "" : i ? "B" : "A";
-        warn_report("warning: property %s.drive%s is deprecated",
-                    fdc_name, drive_suffix);
-        error_printf("Use -device floppy,unit=%d,drive=... instead.\n", i);
-
-        dev = qdev_new("floppy");
-        qdev_prop_set_uint32(dev, "unit", i);
-        qdev_prop_set_enum(dev, "drive-type", fdctrl->qdev_for_drives[i].type);
-
-        /*
-         * Hack alert: we move the backend from the floppy controller
-         * device to the floppy device.  We first need to detach the
-         * controller, or else floppy_create()'s qdev_prop_set_drive()
-         * will die when it attaches floppy device.  We also need to
-         * take another reference so that blk_detach_dev() doesn't
-         * free blk while we still need it.
-         *
-         * The hack is probably a bad idea.
-         */
-        blk_ref(blk);
-        blk_detach_dev(blk, fdc_dev);
-        fdctrl->qdev_for_drives[i].blk = NULL;
-        ok = qdev_prop_set_drive_err(dev, "drive", blk, errp);
-        blk_unref(blk);
-        if (!ok) {
-            return;
-        }
-
-        if (!qdev_realize_and_unref(dev, &fdctrl->bus.bus, errp)) {
-            return;
-        }
+        fd_init(drive);
+        fd_revalidate(drive);
     }
 }
 
@@ -2882,8 +2837,6 @@ static Property isa_fdc_properties[] = {
     DEFINE_PROP_UINT32("iobase", FDCtrlISABus, iobase, 0x3f0),
     DEFINE_PROP_UINT32("irq", FDCtrlISABus, irq, 6),
     DEFINE_PROP_UINT32("dma", FDCtrlISABus, dma, 2),
-    DEFINE_PROP_DRIVE("driveA", FDCtrlISABus, state.qdev_for_drives[0].blk),
-    DEFINE_PROP_DRIVE("driveB", FDCtrlISABus, state.qdev_for_drives[1].blk),
     DEFINE_PROP_SIGNED("fdtypeA", FDCtrlISABus, state.qdev_for_drives[0].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
@@ -2941,8 +2894,6 @@ static const VMStateDescription vmstate_sysbus_fdc ={
 };
 
 static Property sysbus_fdc_properties[] = {
-    DEFINE_PROP_DRIVE("driveA", FDCtrlSysBus, state.qdev_for_drives[0].blk),
-    DEFINE_PROP_DRIVE("driveB", FDCtrlSysBus, state.qdev_for_drives[1].blk),
     DEFINE_PROP_SIGNED("fdtypeA", FDCtrlSysBus, state.qdev_for_drives[0].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
@@ -2971,7 +2922,6 @@ static const TypeInfo sysbus_fdc_info = {
 };
 
 static Property sun4m_fdc_properties[] = {
-    DEFINE_PROP_DRIVE("drive", FDCtrlSysBus, state.qdev_for_drives[0].blk),
     DEFINE_PROP_SIGNED("fdtype", FDCtrlSysBus, state.qdev_for_drives[0].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
index 0ac942a6c5..ff269ca7b5 100755
--- a/tests/qemu-iotests/172
+++ b/tests/qemu-iotests/172
@@ -123,15 +123,6 @@ check_floppy_qtree -drive if=floppy,file="$TEST_IMG"
 check_floppy_qtree -drive if=floppy,file="$TEST_IMG",index=1
 check_floppy_qtree -drive if=floppy,file="$TEST_IMG" -drive if=floppy,file="$TEST_IMG.2",index=1
 
-echo
-echo
-echo === Using -drive if=none and -global ===
-
-check_floppy_qtree -drive if=none,file="$TEST_IMG" -global isa-fdc.driveA=none0
-check_floppy_qtree -drive if=none,file="$TEST_IMG" -global isa-fdc.driveB=none0
-check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
-                   -global isa-fdc.driveA=none0 -global isa-fdc.driveB=none1
-
 echo
 echo
 echo === Using -drive if=none and -device ===
@@ -145,13 +136,6 @@ echo
 echo
 echo === Mixing -fdX and -global ===
 
-# Working
-check_floppy_qtree -fda "$TEST_IMG" -drive if=none,file="$TEST_IMG.2" -global isa-fdc.driveB=none0
-check_floppy_qtree -fdb "$TEST_IMG" -drive if=none,file="$TEST_IMG.2" -global isa-fdc.driveA=none0
-
-# Conflicting
-check_floppy_qtree -fda "$TEST_IMG" -drive if=none,file="$TEST_IMG.2" -global isa-fdc.driveA=none0
-check_floppy_qtree -fdb "$TEST_IMG" -drive if=none,file="$TEST_IMG.2" -global isa-fdc.driveB=none0
 # Conflicting, -fdX wins
 check_floppy_qtree -fda "$TEST_IMG" -drive if=none,file="$TEST_IMG.2" -global floppy.drive=none0
 
@@ -186,23 +170,10 @@ echo
 echo === Mixing -global and -device ===
 
 # Working
-check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
-                   -global isa-fdc.driveA=none0 -device floppy,drive=none1
-check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
-                   -global isa-fdc.driveA=none0 -device floppy,drive=none1,unit=1
-
-check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
-                   -global isa-fdc.driveB=none0 -device floppy,drive=none1
-check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
-                   -global isa-fdc.driveB=none0 -device floppy,drive=none1,unit=0
 check_floppy_qtree -drive if=none,file="$TEST_IMG" \
                    -global floppy.drive=none0 -device floppy,unit=0
 
 # Conflicting
-check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
-                   -global isa-fdc.driveA=none0 -device floppy,drive=none1,unit=0
-check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
-                   -global isa-fdc.driveB=none0 -device floppy,drive=none1,unit=1
 check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
                    -global floppy.drive=none0 -device floppy,drive=none1,unit=0
 
@@ -227,7 +198,7 @@ echo === Too many floppy drives ===
 check_floppy_qtree -drive if=floppy,file="$TEST_IMG" \
                    -drive if=none,file="$TEST_IMG.2" \
                    -drive if=none,file="$TEST_IMG.3" \
-                   -global isa-fdc.driveB=none0 \
+                   -device floppy,drive=none0 \
                    -device floppy,drive=none1
 
 echo
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index 349ae51d6c..d53f61d0de 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -12,8 +12,6 @@ Testing:
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -41,8 +39,6 @@ Testing: -fda TEST_DIR/t.qcow2
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -80,8 +76,6 @@ Testing: -fdb TEST_DIR/t.qcow2
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -134,8 +128,6 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -189,8 +181,6 @@ Testing: -fdb
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -229,8 +219,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -268,8 +256,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -322,8 +308,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -372,150 +356,6 @@ sd0: [not inserted]
 
 
 
-=== Using -drive if=none and -global ===
-
-Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global isa-fdc.driveA=none0
-QEMU_PROG: warning: warning: property isa-fdc.driveA is deprecated
-Use -device floppy,unit=0,drive=... instead.
-
-          dev: isa-fdc, id ""
-            iobase = 1008 (0x3f0)
-            irq = 6 (0x6)
-            dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
-            fdtypeA = "auto"
-            fdtypeB = "auto"
-            fallback = "288"
-            isa irq 6
-            bus: floppy-bus.0
-              type floppy-bus
-              dev: floppy, id ""
-                unit = 0 (0x0)
-                drive = "none0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-
-sd0: [not inserted]
-    Removable device: not locked, tray closed
-(qemu) quit
-
-
-Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global isa-fdc.driveB=none0
-QEMU_PROG: warning: warning: property isa-fdc.driveB is deprecated
-Use -device floppy,unit=1,drive=... instead.
-
-          dev: isa-fdc, id ""
-            iobase = 1008 (0x3f0)
-            irq = 6 (0x6)
-            dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
-            fdtypeA = "auto"
-            fdtypeB = "auto"
-            fallback = "288"
-            isa irq 6
-            bus: floppy-bus.0
-              type floppy-bus
-              dev: floppy, id ""
-                unit = 1 (0x1)
-                drive = "none0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-
-sd0: [not inserted]
-    Removable device: not locked, tray closed
-(qemu) quit
-
-
-Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0 -global isa-fdc.driveB=none1
-QEMU_PROG: warning: warning: property isa-fdc.driveA is deprecated
-Use -device floppy,unit=0,drive=... instead.
-QEMU_PROG: warning: warning: property isa-fdc.driveB is deprecated
-Use -device floppy,unit=1,drive=... instead.
-
-          dev: isa-fdc, id ""
-            iobase = 1008 (0x3f0)
-            irq = 6 (0x6)
-            dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
-            fdtypeA = "auto"
-            fdtypeB = "auto"
-            fallback = "288"
-            isa irq 6
-            bus: floppy-bus.0
-              type floppy-bus
-              dev: floppy, id ""
-                unit = 1 (0x1)
-                drive = "none1"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-              dev: floppy, id ""
-                unit = 0 (0x0)
-                drive = "none0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-
-sd0: [not inserted]
-    Removable device: not locked, tray closed
-(qemu) quit
-
-
-
 === Using -drive if=none and -device ===
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
@@ -524,8 +364,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -563,8 +401,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -602,8 +438,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -654,130 +488,6 @@ sd0: [not inserted]
 
 === Mixing -fdX and -global ===
 
-Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveB=none0
-QEMU_PROG: warning: warning: property isa-fdc.driveB is deprecated
-Use -device floppy,unit=1,drive=... instead.
-
-          dev: isa-fdc, id ""
-            iobase = 1008 (0x3f0)
-            irq = 6 (0x6)
-            dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
-            fdtypeA = "auto"
-            fdtypeB = "auto"
-            fallback = "288"
-            isa irq 6
-            bus: floppy-bus.0
-              type floppy-bus
-              dev: floppy, id ""
-                unit = 0 (0x0)
-                drive = "floppy0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-              dev: floppy, id ""
-                unit = 1 (0x1)
-                drive = "none0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-
-sd0: [not inserted]
-    Removable device: not locked, tray closed
-(qemu) quit
-
-
-Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0
-QEMU_PROG: warning: warning: property isa-fdc.driveA is deprecated
-Use -device floppy,unit=0,drive=... instead.
-
-          dev: isa-fdc, id ""
-            iobase = 1008 (0x3f0)
-            irq = 6 (0x6)
-            dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
-            fdtypeA = "auto"
-            fdtypeB = "auto"
-            fallback = "288"
-            isa irq 6
-            bus: floppy-bus.0
-              type floppy-bus
-              dev: floppy, id ""
-                unit = 1 (0x1)
-                drive = "floppy1"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-              dev: floppy, id ""
-                unit = 0 (0x0)
-                drive = "none0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-
-sd0: [not inserted]
-    Removable device: not locked, tray closed
-(qemu) quit
-
-
-Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0
-QEMU_PROG: warning: warning: property isa-fdc.driveA is deprecated
-Use -device floppy,unit=0,drive=... instead.
-QEMU_PROG: Floppy unit 0 is in use
-
-Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveB=none0
-QEMU_PROG: warning: warning: property isa-fdc.driveB is deprecated
-Use -device floppy,unit=1,drive=... instead.
-QEMU_PROG: Floppy unit 1 is in use
-
 Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global floppy.drive=none0
 QEMU_PROG: -global floppy.drive=... conflicts with drive=floppy0
 
@@ -790,8 +500,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -845,8 +553,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -900,8 +606,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -955,8 +659,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1019,8 +721,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1074,8 +774,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1129,242 +827,12 @@ QEMU_PROG: -device floppy,drive=none0,unit=0: Floppy unit 0 is in use
 
 === Mixing -global and -device ===
 
-Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0 -device floppy,drive=none1
-QEMU_PROG: warning: warning: property isa-fdc.driveA is deprecated
-Use -device floppy,unit=0,drive=... instead.
-
-          dev: isa-fdc, id ""
-            iobase = 1008 (0x3f0)
-            irq = 6 (0x6)
-            dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
-            fdtypeA = "auto"
-            fdtypeB = "auto"
-            fallback = "288"
-            isa irq 6
-            bus: floppy-bus.0
-              type floppy-bus
-              dev: floppy, id ""
-                unit = 1 (0x1)
-                drive = "none1"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-              dev: floppy, id ""
-                unit = 0 (0x0)
-                drive = "none0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-
-sd0: [not inserted]
-    Removable device: not locked, tray closed
-(qemu) quit
-
-
-Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0 -device floppy,drive=none1,unit=1
-QEMU_PROG: warning: warning: property isa-fdc.driveA is deprecated
-Use -device floppy,unit=0,drive=... instead.
-
-          dev: isa-fdc, id ""
-            iobase = 1008 (0x3f0)
-            irq = 6 (0x6)
-            dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
-            fdtypeA = "auto"
-            fdtypeB = "auto"
-            fallback = "288"
-            isa irq 6
-            bus: floppy-bus.0
-              type floppy-bus
-              dev: floppy, id ""
-                unit = 1 (0x1)
-                drive = "none1"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-              dev: floppy, id ""
-                unit = 0 (0x0)
-                drive = "none0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-
-sd0: [not inserted]
-    Removable device: not locked, tray closed
-(qemu) quit
-
-
-Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveB=none0 -device floppy,drive=none1
-QEMU_PROG: warning: warning: property isa-fdc.driveB is deprecated
-Use -device floppy,unit=1,drive=... instead.
-
-          dev: isa-fdc, id ""
-            iobase = 1008 (0x3f0)
-            irq = 6 (0x6)
-            dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
-            fdtypeA = "auto"
-            fdtypeB = "auto"
-            fallback = "288"
-            isa irq 6
-            bus: floppy-bus.0
-              type floppy-bus
-              dev: floppy, id ""
-                unit = 0 (0x0)
-                drive = "none1"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-              dev: floppy, id ""
-                unit = 1 (0x1)
-                drive = "none0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-
-sd0: [not inserted]
-    Removable device: not locked, tray closed
-(qemu) quit
-
-
-Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveB=none0 -device floppy,drive=none1,unit=0
-QEMU_PROG: warning: warning: property isa-fdc.driveB is deprecated
-Use -device floppy,unit=1,drive=... instead.
-
-          dev: isa-fdc, id ""
-            iobase = 1008 (0x3f0)
-            irq = 6 (0x6)
-            dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
-            fdtypeA = "auto"
-            fdtypeB = "auto"
-            fallback = "288"
-            isa irq 6
-            bus: floppy-bus.0
-              type floppy-bus
-              dev: floppy, id ""
-                unit = 0 (0x0)
-                drive = "none1"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-              dev: floppy, id ""
-                unit = 1 (0x1)
-                drive = "none0"
-                logical_block_size = 512 (512 B)
-                physical_block_size = 512 (512 B)
-                min_io_size = 0 (0 B)
-                opt_io_size = 0 (0 B)
-                discard_granularity = 4294967295 (4 GiB)
-                write-cache = "auto"
-                share-rw = false
-                drive-type = "144"
-none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
-    Attached to:      /machine/peripheral-anon/device[N]
-    Removable device: not locked, tray closed
-    Cache mode:       writeback
-
-ide1-cd0: [not inserted]
-    Attached to:      /machine/unattached/device[N]
-    Removable device: not locked, tray closed
-
-sd0: [not inserted]
-    Removable device: not locked, tray closed
-(qemu) quit
-
-
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device floppy,unit=0
 
           dev: isa-fdc, id ""
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1396,16 +864,6 @@ sd0: [not inserted]
 (qemu) quit
 
 
-Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0 -device floppy,drive=none1,unit=0
-QEMU_PROG: warning: warning: property isa-fdc.driveA is deprecated
-Use -device floppy,unit=0,drive=... instead.
-QEMU_PROG: -device floppy,drive=none1,unit=0: Floppy unit 0 is in use
-
-Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveB=none0 -device floppy,drive=none1,unit=1
-QEMU_PROG: warning: warning: property isa-fdc.driveB is deprecated
-Use -device floppy,unit=1,drive=... instead.
-QEMU_PROG: -device floppy,drive=none1,unit=1: Floppy unit 1 is in use
-
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global floppy.drive=none0 -device floppy,drive=none1,unit=0
 QEMU_PROG: -device floppy,drive=none1,unit=0: -global floppy.drive=... conflicts with drive=none1
 
@@ -1430,9 +888,7 @@ QEMU_PROG: -device floppy,drive=floppy0: Property 'floppy.drive' can't find valu
 
 === Too many floppy drives ===
 
-Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -drive if=none,file=TEST_DIR/t.qcow2.3 -global isa-fdc.driveB=none0 -device floppy,drive=none1
-QEMU_PROG: warning: warning: property isa-fdc.driveB is deprecated
-Use -device floppy,unit=1,drive=... instead.
+Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -drive if=none,file=TEST_DIR/t.qcow2.3 -device floppy,drive=none0 -device floppy,drive=none1
 QEMU_PROG: -device floppy,drive=none1: Can't create floppy unit 2, bus supports only 2 units
 
 
@@ -1444,8 +900,6 @@ Testing: -device floppy
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1470,8 +924,6 @@ Testing: -device floppy,drive-type=120
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1496,8 +948,6 @@ Testing: -device floppy,drive-type=144
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1522,8 +972,6 @@ Testing: -device floppy,drive-type=288
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1551,8 +999,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1590,8 +1036,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1632,8 +1076,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
@@ -1671,8 +1113,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             fdtypeA = "auto"
             fdtypeB = "auto"
             fallback = "288"
-- 
2.26.2


