Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFE38192B
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:49:10 +0200 (CEST)
Received: from localhost ([::1]:59310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhufF-0007ZE-B6
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhucM-0004VD-Tc; Sat, 15 May 2021 09:46:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhucK-0002NB-TE; Sat, 15 May 2021 09:46:10 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z17so1847652wrq.7;
 Sat, 15 May 2021 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XZFRK9/LLw0BGiAUqsrQqTackDYMnMDegdSD7t3zQU=;
 b=H+bloeOqZ0tfskx+FtfqKqFGuVsckcQX2c9rQ/iXn/vgsbYlhnncm1bsOTCNl+h+t3
 QliZm961RE1PDtv7S1r+tx9UQecdSGMPsxAp+dUUKmyNpYyvAVrz+RmPuYx9NwuAYa7c
 Du14LcoQz0V6xsNZWT7Jjq5OlcHGZZritFKY7nYRG0bhrEufH9eAbX/YmP40PQ8NOmpD
 nlACDVoWETUTEYNYddFv4xcHXfIxhkZXncn+dTunzAebNWLl4qKnoFXySGBd+V1t0UD1
 k/BwZbuvVNul6edcf5oun7KMpmIlIr/cQSr7fyYQYqacipNs3ZlITK2hn+0eI1rhqHja
 VBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2XZFRK9/LLw0BGiAUqsrQqTackDYMnMDegdSD7t3zQU=;
 b=W2YCS2yui4FKDnejHMp5sGH3+Vk9wyeNdoo5W3EIq7hxHhttHHUEaqKTLSqlROIa+L
 tJtPYblE+/m8TdXnM4j11epmS3qQ909i2kdKpSWvX+qO7IBEey9QD/xcHXWFgJZQwlxU
 abnXu6S7pBVEoyEWz/cVMQ+kuhrjeKonqSJbF46cNy7vqWwHEdajC5n/7jmCDkwJFrys
 jdmcLD/qp98+AliPWr1aZgPKCV736BhAFm5C9wVIk1a9tZw1/T6KmDng5D7v5EIaUv8m
 7DU2YSR7AFU8QML3rTO39uZ/oV+DhgeqHJf9ZvBmU5Ld0mSB24M7kQosK447amMeaHNT
 PnCQ==
X-Gm-Message-State: AOAM531VOdUdOnlXrngqmDxca/nz+rwRhYGpjA5N8nzVKYTUtw+2Fl34
 oSs66TMyesPoBEv/J/bBU+26UErWb+JW+w==
X-Google-Smtp-Source: ABdhPJywuEa1/ALQc81EQMZS66WkCLHghlSVhKwPcUHSI/hPE8HsKKFYcX5Udz1ragptLBWxlH/lKA==
X-Received: by 2002:a5d:4d52:: with SMTP id a18mr64223223wru.45.1621086366985; 
 Sat, 15 May 2021 06:46:06 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f3sm9278973wrp.7.2021.05.15.06.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:46:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests/acceptance: Add tests for the Pegasos2 machine
Date: Sat, 15 May 2021 15:45:55 +0200
Message-Id: <20210515134555.307404-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515134555.307404-1-f4bug@amsat.org>
References: <20210515134555.307404-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a pair of tests for the Pegasos2 machine following the steps from:
https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html

  $ PEGASOS2_ROM_PATH=/tmp/pegasos2.rom AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
    avocado --show=app,console,tesseract \
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
---
 tests/acceptance/machine_ppc_pegasos.py | 98 +++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 tests/acceptance/machine_ppc_pegasos.py

diff --git a/tests/acceptance/machine_ppc_pegasos.py b/tests/acceptance/machine_ppc_pegasos.py
new file mode 100644
index 00000000000..d36e920ebde
--- /dev/null
+++ b/tests/acceptance/machine_ppc_pegasos.py
@@ -0,0 +1,98 @@
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
+@skipUnless(os.getenv('PEGASOS2_ROM_PATH'), 'PEGASOS2_ROM_PATH not available')
+class PPCPegasos2(Test):
+    timeout = 60
+
+    def test_rom_serial_console(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:pegasos2
+        :avocado: tags=device:mv64361
+        :avocado: tags=device:vt8231
+        """
+        rom_hash = '3248e02596480f2dba5944bd219ecfad'
+        rom_path = self.fetch_asset('file://' + os.getenv('PEGASOS2_ROM_PATH'),
+                                    asset_hash=rom_hash, algorithm='md5')
+
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
+        rom_hash = '3248e02596480f2dba5944bd219ecfad'
+        rom_path = self.fetch_asset('file://' + os.getenv('PEGASOS2_ROM_PATH'),
+                                    asset_hash=rom_hash, algorithm='md5')
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
2.26.3


