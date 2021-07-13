Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447263C6836
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 03:45:34 +0200 (CEST)
Received: from localhost ([::1]:39272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m37UK-0007mR-Q8
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 21:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m37T4-00076X-15
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 21:44:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m37Sy-0003Ck-KK
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 21:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626140647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ylY6BCcdHq8AWcE6jAq8balcyWYIXyv6OMDHXpWtRiM=;
 b=i/MC5v3ciAMvyGjFyNHkxT3iAy4xnO/9AsrHtGJz5MeYxLd/zv5J3ZQSszGpYEfSC6W3Kp
 emgsSxtiiKEXTnNTXaysFWXz85QEK+Gx+kcxMB1C3fQEBrAtnv51wXGdWcwEqArLUkQrCs
 KRT+GtOzYzcJ5i/QlX+P07KSGVxGwbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-du_CDwOWPkCNl7A8m0NAKw-1; Mon, 12 Jul 2021 21:43:59 -0400
X-MC-Unique: du_CDwOWPkCNl7A8m0NAKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B60AF800C78;
 Tue, 13 Jul 2021 01:43:58 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62F5060916;
 Tue, 13 Jul 2021 01:43:54 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: Add tests for the Pegasos2 machine
Date: Mon, 12 Jul 2021 21:43:42 -0400
Message-Id: <20210713014342.3086855-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a pair of tests for the Pegasos2 machine following the steps from:
https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html

  $ AVOCADO_ALLOW_UNTRUSTED_CODE=1 avocado --show=app,console,tesseract \
      run -t machine:pegasos2 tests/acceptance/
   (1/2) tests/acceptance/machine_ppc_pegasos.py:PPCPegasos2.test_rom_serial_console:
  console: PegasosII Boot Strap (c) 2002-2003 bplan GmbH
  console: Running on CPU PVR:000C0209
  console: Enable L1 ICache...                                                    Done.
  console: Reading W83194 :                                                       FAILED.
  console: Setting Front Side Bus to 133MHz...                                    FAILED.
  console: Configuring DDR...                                                     Done.
  console: Configuring PCI0...                                                    Done.
  console: Configuring PCI1...                                                    Done.
  console: Configuring ETH...                                                     Done.
  console: Releasing IDE reset ...                                                Done.
  console: Configuring Legacy Devices
  console: Initializing KBD...                                                    Done.
  console: Testing 10000000 Bytes, Pass: 00000000 Failed: 00000000
  console: RAM TEST (fill linear)...                                              Done.
  console: FFFFFFFF
  console: SmartFirmware:
  console: cpu0: PowerPC,G4 CPUClock 599 Mhz BUSClock 133 Mhz (Version 0x000C,0x0209)
  console: no/bad nvramrc - performing default startup script
  console: channel 1 unit 0 : atapi | QEMU DVD-ROM                             | 2.5+
  console: ATA device not present or not responding
  console: Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1 (20040405172512)
  PASS (5.23 s)
   (2/2) tests/acceptance/machine_ppc_pegasos.py:PPCPegasos2.test_morphos_cdrom_vga:
  ...
  console: Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1 (20040405172512)
  console: SmartFirmware(tm) Copyright 1996-2001 by CodeGen, Inc.
  console: All Rights Reserved.
  console: Pegasos BIOS Extensions Copyright 2001-2003 by bplan GmbH.
  console: All Rights Reserved.
  console: entering main read/eval loop...
  console: ok boot cd boot.img
  console: ISO-9660 filesystem:  System-ID: "MORPHOS"  Volume-ID: "MorphOSBoot"
  console: " flags=0x2 extent=0x20 size=0x1800
  console: Memory used before SYS_Init: 9MB
  console: PCI ATA/ATAPI Driver@2: PIO Mode 4
  console: PCI ATA/ATAPI Driver@2: UDMA Mode 5
  console: ide.device@2: QEMU     QEMU DVD-ROM     <CDROM>
  console: ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootable
  tesseract: Ambient Screen 4: Saturday, 15 May 2021, 13:36:06 &
  tesseract: keymap
  tesseract: Albanian keyboard with 101/104 keys
  tesseract: ‘American keyboard with Greek input extension, 105 keys
  tesseract: Belarusian keyboard with 105 keys
  tesseract: Belgian keyboard with 105 keys J
  tesseract: British Apple keyboard
  tesseract: British keyboard with 105 keys
  tesseract: Bulgarian keyboard with 104 keys
  tesseract: Canadian keyboard with 105 keys
  tesseract: Colemak layout for keyboards with 101/104 keys
  tesseract: Croatian keyboard with 101/108 keys
  tesseract: Czech keyboard (QWERTY) with 101/104 keys
  tesseract: Czech keyboard (QWERTZ) with 101/104 keys
  tesseract: Danish keyboard with 105 keys
  PASS (28.56 s)
  RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 34.42 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/machine_ppc_pegasos.py | 103 ++++++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 tests/acceptance/machine_ppc_pegasos.py

diff --git a/tests/acceptance/machine_ppc_pegasos.py b/tests/acceptance/machine_ppc_pegasos.py
new file mode 100644
index 0000000000..e890a3a539
--- /dev/null
+++ b/tests/acceptance/machine_ppc_pegasos.py
@@ -0,0 +1,103 @@
+# Functional tests for the Pegasos2 machine.
+#
+# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import time
+
+from avocado import skipUnless
+from avocado_qemu import Test
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import wait_for_console_pattern
+from tesseract_utils import tesseract_available, tesseract_ocr
+
+PIL_AVAILABLE = True
+try:
+    from PIL import Image
+except ImportError:
+    PIL_AVAILABLE = False
+
+
+@skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+class PPCPegasos2(Test):
+    """These tests require a Pegasos2 ROM.  You need to perform a one
+    time manual set up of the ROM, registering it with the Avocado
+    assets system.  Please follow the steps bellow from a QEMU build
+    directory, replaceing $MY_ROMS_DIR with a suitable directory.
+
+    1. make check-venv
+    2. curl http://web.archive.org/web/20071021223056/http://www.bplan-gmbh.de/up050404/up050404 -o $MY_ROMS_DIR/up050404
+    3. tail -c +85581 /tmp/up050404 | head -c 524288 > $MY_ROMS_DIR/pegasos2.rom
+    4. ./tests/venv/bin/avocado assets register --hash 08dc28afb3d10fb223376a28eebfd07c9f8df9fa pegasos2.rom $MY_ROMS_DIR/pegasos2.rom
+    """
+    timeout = 60
+    rom_hash = '08dc28afb3d10fb223376a28eebfd07c9f8df9fa'
+
+    def test_rom_serial_console(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:pegasos2
+        :avocado: tags=device:mv64361
+        :avocado: tags=device:vt8231
+        """
+        rom_path = self.fetch_asset('pegasos2.rom', asset_hash=self.rom_hash)
+        self.vm.set_console()
+        self.vm.add_args('-bios', rom_path)
+        self.vm.launch()
+        msg = 'PegasosII Boot Strap (c) 2002-2003 bplan GmbH'
+        wait_for_console_pattern(self, msg)
+        msg = 'Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1'
+        wait_for_console_pattern(self, msg)
+
+    def test_morphos_cdrom_vga(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:pegasos2
+        :avocado: tags=device:mv64361
+        :avocado: tags=device:vt8231
+        :avocado: tags=device:ati-vga
+        """
+        rom_path = self.fetch_asset('pegasos2.rom', asset_hash=self.rom_hash)
+        iso_url = 'https://www.morphos-team.net/morphos-3.15.iso'
+        iso_hash = 'a19dbfbbc4728e0ba9ceb6335db69ca4'
+        iso_path = self.fetch_asset(iso_url,
+                                    asset_hash=iso_hash, algorithm='md5')
+
+        self.vm.set_console()
+        self.vm.add_args('-bios', rom_path,
+                         '-device', 'ati-vga,romfile=',
+                         '-cdrom', iso_path)
+        self.vm.launch()
+        msg = 'Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1'
+        wait_for_console_pattern(self, msg)
+        wait_for_console_pattern(self, 'entering main read/eval loop...')
+        msg = 'filesystem:  System-ID: "MORPHOS"  Volume-ID: "MorphOSBoot"'
+        exec_command_and_wait_for_pattern(self, 'boot cd boot.img', msg)
+
+        msg = 'ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootable'
+        wait_for_console_pattern(self, msg)
+        if PIL_AVAILABLE:
+            delay_s = 20 if tesseract_available(4) else 8
+
+            self.log.info('VM launched, waiting for display')
+            # TODO: Use avocado.utils.wait.wait_for to catch the
+            #       'displaysurface_create 1120x832' trace-event.
+            time.sleep(delay_s)
+
+            screenshot_path = os.path.join(self.workdir, "dump.ppm")
+            self.vm.command('human-monitor-command',
+                            command_line='screendump %s' % screenshot_path)
+            width, height = Image.open(screenshot_path).size
+            self.assertEqual(width, 2048)
+            self.assertEqual(height, 1152)
+
+            if tesseract_available(4):
+                lines = tesseract_ocr(screenshot_path, tesseract_version=4)
+                text = '\n'.join(lines)
+                msg = 'American keyboard with Greek input extension, 105 keys'
+                self.assertIn(msg, text)
-- 
2.31.1


