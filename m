Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399302033E8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 11:48:09 +0200 (CEST)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnJ3W-0002Ls-2D
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 05:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyN-0001ap-IZ
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:42:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30966
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyI-0003uz-Ep
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592818953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1/2wOS6EjnQe7vT7F0eLC0J8+3B15sMMl7PxXR/abf4=;
 b=fv2UKfcXZpNnNa8uv6duf/dSdMF7uov0YU1WPH9j98rAPEpmtcBFXGipQc1TlCi9qQq2im
 hrOx6sMWu42jzyXWNy/4Nca0nI4myPmKJAu21NzEh4khCV9LavX9t1z1/+AakhOIBtu9yS
 +kLAWxC6Vl97YZLq7KpVlRtPacNYxk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-xBfnfhNRMAWL9TjRyDhKNQ-1; Mon, 22 Jun 2020 05:42:30 -0400
X-MC-Unique: xBfnfhNRMAWL9TjRyDhKNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA5D4835B41;
 Mon, 22 Jun 2020 09:42:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5784610013D2;
 Mon, 22 Jun 2020 09:42:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C51BD1138471; Mon, 22 Jun 2020 11:42:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/16] iotests/172: Cover -global floppy.drive=...
Date: Mon, 22 Jun 2020 11:42:14 +0200
Message-Id: <20200622094227.1271650-4-armbru@redhat.com>
In-Reply-To: <20200622094227.1271650-1-armbru@redhat.com>
References: <20200622094227.1271650-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, mreitz@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use of -global to set a default backend for non-singleton devices is a
bad idea.  But as long as we permit it, we better test it.

Test output demonstrates we screw up when -global floppy clashes with
-fda or with -device floppy: according to "info qtree", only the
latter backend is attached, but according to "info block", both are.
Here's the clash with -device:

    Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global floppy.drive=none0 -device floppy,drive=none1,unit=0

              dev: isa-fdc, id ""
                [...]
                driveA = ""
                driveB = ""
                [...]
                bus: floppy-bus.0
                  type floppy-bus
                  dev: floppy, id ""
                    unit = 0 (0x0)
--->                drive = "none1"
    [...]
    none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
--->    Attached to:      /machine/peripheral-anon/device[0]
        Cache mode:       writeback

    none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
--->    Attached to:      /machine/peripheral-anon/device[0]
        Removable device: not locked, tray closed
        Cache mode:       writeback

/machine/peripheral-anon/device[0] is the floppy created with -device.

Test output further demonstrates the "Drive 'FOO' is already in use
because it has been automatically connected to another device" error
message can be misleading.  With '-fda "" -global
floppy.drive=floppy0', it's in use because -global reuses -fda's
backend.  There is no other device involved.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qemu-iotests/172     |   7 ++
 tests/qemu-iotests/172.out | 134 +++++++++++++++++++++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
index 714c7527b4..18056bcef7 100755
--- a/tests/qemu-iotests/172
+++ b/tests/qemu-iotests/172
@@ -151,6 +151,7 @@ check_floppy_qtree -fdb "$TEST_IMG" -drive if=none,file="$TEST_IMG.2" -global is
 # Conflicting (-fdX wins)
 check_floppy_qtree -fda "$TEST_IMG" -drive if=none,file="$TEST_IMG.2" -global isa-fdc.driveA=none0
 check_floppy_qtree -fdb "$TEST_IMG" -drive if=none,file="$TEST_IMG.2" -global isa-fdc.driveB=none0
+check_floppy_qtree -fda "$TEST_IMG" -drive if=none,file="$TEST_IMG.2" -global floppy.drive=none0
 
 echo
 echo
@@ -192,12 +193,16 @@ check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IM
                    -global isa-fdc.driveB=none0 -device floppy,drive=none1
 check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
                    -global isa-fdc.driveB=none0 -device floppy,drive=none1,unit=0
+check_floppy_qtree -drive if=none,file="$TEST_IMG" \
+                   -global floppy.drive=none0 -device floppy,unit=0
 
 # Conflicting
 check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
                    -global isa-fdc.driveA=none0 -device floppy,drive=none1,unit=0
 check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
                    -global isa-fdc.driveB=none0 -device floppy,drive=none1,unit=1
+check_floppy_qtree -drive if=none,file="$TEST_IMG" -drive if=none,file="$TEST_IMG.2" \
+                   -global floppy.drive=none0 -device floppy,drive=none1,unit=0
 
 echo
 echo
@@ -205,8 +210,10 @@ echo === Attempt to use drive twice ===
 
 # if=none
 check_floppy_qtree -drive if=none -device floppy,drive=none0 -device floppy -device floppy,drive=none0
+check_floppy_qtree -drive if=none -global floppy.drive=none0 -device floppy -device floppy
 # if=floppy
 check_floppy_qtree -fda "" -device floppy,drive=floppy0
+check_floppy_qtree -fda "" -global floppy.drive=floppy0
 # default if=floppy (not found, because it's created later)
 check_floppy_qtree -device floppy,drive=floppy0
 
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index 0665cdcb51..68e7a5ea5f 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -860,6 +860,50 @@ sd0: [not inserted]
 (qemu) quit
 
 
+Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global floppy.drive=none0
+
+          dev: isa-fdc, id ""
+            iobase = 1008 (0x3f0)
+            irq = 6 (0x6)
+            dma = 2 (0x2)
+            driveA = ""
+            driveB = ""
+            check_media_rate = true
+            fdtypeA = "auto"
+            fdtypeB = "auto"
+            fallback = "288"
+            isa irq 6
+            bus: floppy-bus.0
+              type floppy-bus
+              dev: floppy, id ""
+                unit = 0 (0x0)
+                drive = "floppy0"
+                logical_block_size = 512 (0x200)
+                physical_block_size = 512 (0x200)
+                min_io_size = 0 (0x0)
+                opt_io_size = 0 (0x0)
+                discard_granularity = 4294967295 (0xffffffff)
+                write-cache = "auto"
+                share-rw = false
+                drive-type = "144"
+floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+none0 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/unattached/device[15]
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[22]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
+
 
 === Mixing -fdX and -device ===
 
@@ -1438,21 +1482,111 @@ sd0: [not inserted]
 (qemu) quit
 
 
+Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device floppy,unit=0
+
+          dev: isa-fdc, id ""
+            iobase = 1008 (0x3f0)
+            irq = 6 (0x6)
+            dma = 2 (0x2)
+            driveA = ""
+            driveB = ""
+            check_media_rate = true
+            fdtypeA = "auto"
+            fdtypeB = "auto"
+            fallback = "288"
+            isa irq 6
+            bus: floppy-bus.0
+              type floppy-bus
+              dev: floppy, id ""
+                unit = 0 (0x0)
+                drive = "none0"
+                logical_block_size = 512 (0x200)
+                physical_block_size = 512 (0x200)
+                min_io_size = 0 (0x0)
+                opt_io_size = 0 (0x0)
+                discard_granularity = 4294967295 (0xffffffff)
+                write-cache = "auto"
+                share-rw = false
+                drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[21]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
+
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveA=none0 -device floppy,drive=none1,unit=0
 QEMU_PROG: -device floppy,drive=none1,unit=0: Floppy unit 0 is in use
 
 Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global isa-fdc.driveB=none0 -device floppy,drive=none1,unit=1
 QEMU_PROG: -device floppy,drive=none1,unit=1: Floppy unit 1 is in use
 
+Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global floppy.drive=none0 -device floppy,drive=none1,unit=0
+
+          dev: isa-fdc, id ""
+            iobase = 1008 (0x3f0)
+            irq = 6 (0x6)
+            dma = 2 (0x2)
+            driveA = ""
+            driveB = ""
+            check_media_rate = true
+            fdtypeA = "auto"
+            fdtypeB = "auto"
+            fallback = "288"
+            isa irq 6
+            bus: floppy-bus.0
+              type floppy-bus
+              dev: floppy, id ""
+                unit = 0 (0x0)
+                drive = "none1"
+                logical_block_size = 512 (0x200)
+                physical_block_size = 512 (0x200)
+                min_io_size = 0 (0x0)
+                opt_io_size = 0 (0x0)
+                discard_granularity = 4294967295 (0xffffffff)
+                write-cache = "auto"
+                share-rw = false
+                drive-type = "144"
+none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Cache mode:       writeback
+
+none1 (NODE_NAME): TEST_DIR/t.qcow2.2 (qcow2)
+    Attached to:      /machine/peripheral-anon/device[0]
+    Removable device: not locked, tray closed
+    Cache mode:       writeback
+
+ide1-cd0: [not inserted]
+    Attached to:      /machine/unattached/device[21]
+    Removable device: not locked, tray closed
+
+sd0: [not inserted]
+    Removable device: not locked, tray closed
+(qemu) quit
+
+
 
 === Attempt to use drive twice ===
 
 Testing: -drive if=none -device floppy,drive=none0 -device floppy -device floppy,drive=none0
 QEMU_PROG: -device floppy,drive=none0: Drive 'none0' is already in use by another device
 
+Testing: -drive if=none -global floppy.drive=none0 -device floppy -device floppy
+QEMU_PROG: -device floppy: can't apply global floppy.drive=none0: Drive 'none0' is already in use by another device
+
 Testing: -fda  -device floppy,drive=floppy0
 QEMU_PROG: -device floppy,drive=floppy0: Drive 'floppy0' is already in use because it has been automatically connected to another device (did you need 'if=none' in the drive options?)
 
+Testing: -fda  -global floppy.drive=floppy0
+QEMU_PROG: can't apply global floppy.drive=floppy0: Drive 'floppy0' is already in use because it has been automatically connected to another device (did you need 'if=none' in the drive options?)
+
 Testing: -device floppy,drive=floppy0
 QEMU_PROG: -device floppy,drive=floppy0: Property 'floppy.drive' can't find value 'floppy0'
 
-- 
2.26.2


