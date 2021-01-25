Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244413027DC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:32:18 +0100 (CET)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44mn-0007qs-83
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l44f8-0001kT-5s
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:24:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l44f0-0007kS-S1
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611591853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSkkZoklNfCguw8hzfOmPCrtPG5csAcFSU7l4IFFih4=;
 b=iEUwCUZeh017lE4LQ9xo1wsutJh9Ak++n8n61PIXuPrfDN/vikQ6GaKoTlssNeaZnZ/noi
 1SEAf/jK83ergYG5bKTm9irhaOh9U1nNzqsfjOvCdshXJ2SszUEkAEAbgMoItjQvWXZ7ae
 e1CvtKITMKKNKTp3JLP/60IQCXsNnjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-84GcCC9EMZypJEkC4rvm-Q-1; Mon, 25 Jan 2021 11:24:09 -0500
X-MC-Unique: 84GcCC9EMZypJEkC4rvm-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A969804002;
 Mon, 25 Jan 2021 16:24:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A6D319C78;
 Mon, 25 Jan 2021 16:24:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A7E1113861E; Mon, 25 Jan 2021 17:24:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] fdc: Drop deprecated floppy configuration
Date: Mon, 25 Jan 2021 17:24:00 +0100
Message-Id: <20210125162402.1807394-2-armbru@redhat.com>
In-Reply-To: <20210125162402.1807394-1-armbru@redhat.com>
References: <20210125162402.1807394-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: kwolf@redhat.com, libvir-list@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
configuring floppies with -global isa-fdc" (v5.1.0).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/system/deprecated.rst       |  26 --
 docs/system/removed-features.rst |  26 ++
 hw/block/fdc.c                   |  54 +--
 tests/qemu-iotests/172           |  31 +-
 tests/qemu-iotests/172.out       | 571 +------------------------------
 5 files changed, 30 insertions(+), 678 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 9de663526a..ccbddc79ff 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -94,32 +94,6 @@ QEMU 5.1 has three options:
       to the user to load all the images they need.
  3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
 
-``Configuring floppies with ``-global``
-'''''''''''''''''''''''''''''''''''''''
-
-Use ``-device floppy,...`` instead:
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
 ``-drive`` with bogus interface type
 ''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 88b81a6156..d17c39bce3 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -38,6 +38,32 @@ or ``-display default,show-cursor=on`` instead.
 QEMU 5.0 introduced an alternative syntax to specify the size of the translation
 block cache, ``-accel tcg,tb-size=``.
 
+``Configuring floppies with ``-global`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-device floppy,...`` instead:
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
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 3636874432..c6c9393e29 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -869,7 +869,6 @@ struct FDCtrl {
     uint8_t num_floppies;
     FDrive drives[MAX_FD];
     struct {
-        BlockBackend *blk;
         FloppyDriveType type;
     } qdev_for_drives[MAX_FD];
     int reset_sensei;
@@ -2527,56 +2526,12 @@ static void fdctrl_connect_drives(FDCtrl *fdctrl, DeviceState *fdc_dev,
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
 
@@ -2892,8 +2847,6 @@ static Property isa_fdc_properties[] = {
     DEFINE_PROP_UINT32("iobase", FDCtrlISABus, iobase, 0x3f0),
     DEFINE_PROP_UINT32("irq", FDCtrlISABus, irq, 6),
     DEFINE_PROP_UINT32("dma", FDCtrlISABus, dma, 2),
-    DEFINE_PROP_DRIVE("driveA", FDCtrlISABus, state.qdev_for_drives[0].blk),
-    DEFINE_PROP_DRIVE("driveB", FDCtrlISABus, state.qdev_for_drives[1].blk),
     DEFINE_PROP_BIT("check_media_rate", FDCtrlISABus, state.check_media_rate,
                     0, true),
     DEFINE_PROP_SIGNED("fdtypeA", FDCtrlISABus, state.qdev_for_drives[0].type,
@@ -2953,8 +2906,6 @@ static const VMStateDescription vmstate_sysbus_fdc ={
 };
 
 static Property sysbus_fdc_properties[] = {
-    DEFINE_PROP_DRIVE("driveA", FDCtrlSysBus, state.qdev_for_drives[0].blk),
-    DEFINE_PROP_DRIVE("driveB", FDCtrlSysBus, state.qdev_for_drives[1].blk),
     DEFINE_PROP_SIGNED("fdtypeA", FDCtrlSysBus, state.qdev_for_drives[0].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
@@ -2983,7 +2934,6 @@ static const TypeInfo sysbus_fdc_info = {
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
index 2cd4a8fd83..e495fb9b3b 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -12,8 +12,6 @@ Testing:
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -42,8 +40,6 @@ Testing: -fda TEST_DIR/t.qcow2
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -82,8 +78,6 @@ Testing: -fdb TEST_DIR/t.qcow2
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -137,8 +131,6 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -193,8 +185,6 @@ Testing: -fdb
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -234,8 +224,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -274,8 +262,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -329,8 +315,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -380,153 +364,6 @@ sd0: [not inserted]
 
 
 
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
-            check_media_rate = true
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
-            check_media_rate = true
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
-            check_media_rate = true
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
@@ -535,8 +372,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -575,8 +410,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -615,8 +448,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -668,132 +499,6 @@ sd0: [not inserted]
 
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
-            check_media_rate = true
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
-            check_media_rate = true
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
 
@@ -806,8 +511,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -862,8 +565,6 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -918,8 +619,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -974,8 +673,6 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1039,8 +736,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1095,8 +790,6 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1151,246 +844,12 @@ QEMU_PROG: -device floppy,drive=none0,unit=0: Floppy unit 0 is in use
 
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
-            check_media_rate = true
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
-            check_media_rate = true
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
-            check_media_rate = true
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
-            check_media_rate = true
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
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1423,16 +882,6 @@ sd0: [not inserted]
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
 
@@ -1457,9 +906,7 @@ QEMU_PROG: -device floppy,drive=floppy0: Property 'floppy.drive' can't find valu
 
 === Too many floppy drives ===
 
-Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -drive if=none,file=TEST_DIR/t.qcow2.3 -global isa-fdc.driveB=none0 -device floppy,drive=none1
-QEMU_PROG: warning: warning: property isa-fdc.driveB is deprecated
-Use -device floppy,unit=1,drive=... instead.
+Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -drive if=none,file=TEST_DIR/t.qcow2.3 -device floppy,drive=none0 -device floppy,drive=none1
 QEMU_PROG: -device floppy,drive=none1: Can't create floppy unit 2, bus supports only 2 units
 
 
@@ -1471,8 +918,6 @@ Testing: -device floppy
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1498,8 +943,6 @@ Testing: -device floppy,drive-type=120
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1525,8 +968,6 @@ Testing: -device floppy,drive-type=144
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1552,8 +993,6 @@ Testing: -device floppy,drive-type=288
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1582,8 +1021,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1622,8 +1059,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1665,8 +1100,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
@@ -1705,8 +1138,6 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
             iobase = 1008 (0x3f0)
             irq = 6 (0x6)
             dma = 2 (0x2)
-            driveA = ""
-            driveB = ""
             check_media_rate = true
             fdtypeA = "auto"
             fdtypeB = "auto"
-- 
2.26.2


