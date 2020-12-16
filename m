Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BFC2DC627
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:20:02 +0100 (CET)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpbP7-0004ES-78
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpbNF-0002kI-GX
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:18:05 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpbND-0008Br-Fr
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:18:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id d26so10881027wrb.12
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zyYWQdXg+c2aeo1aLPZtdhmX14D4g9q1dSRfdwHjVqc=;
 b=bTht2zAGyezzTipPvqdYYxNTsTugr41eH3exAIUCtB3XqdychoLrQS/HjweG1tMBWS
 yEJYRwmOXCBbZFGRdiguH4VBmbVPltzkjp39s3Gcs4aYwgIUeMgnXlH4zGD2wZiKuU87
 ai3moWqlPRZw1xfA8Z12BdLf0u4TxpVqsocTDgedQNH3keZLF60+cERQbsiyfrj3gYLX
 UcJooOCF7ZpWRhVZLWaNQIZ1l/fW7+NHyXme+bckepGb2QFSo+S4WMIXVNvSPB22Qz0I
 U4Mqyi/1lmFWl1Hf0q14CrSjhUAoFN7dDIwK/iP+VnRcJPaB9rC4+LbOvPuzNoniCzrK
 9KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zyYWQdXg+c2aeo1aLPZtdhmX14D4g9q1dSRfdwHjVqc=;
 b=PioVM6py+jrj9VDCf6txBvuXWXmPHiR44W3Qa4LVRW4c4TlaTTMdZVVPyyv7e4fvO1
 z1MJR0dko5XJgZEAU1/DjWIEnaPQa0Z0yynwo4vnV0nv75R/wxTCWmayJ/ToJf5mVVVT
 /6vKIO/iPRacpZ3FSaRvp4FhUlNeone9HuqIO/0RqQddo5mmeSNcE0gdI89RGuQYdUkP
 NNpKInZKd20f9PRc4Z9hDRKXeQM/nrHjk/UdrLKgU9QUdANpvVZ5KYM51+7KuD+VvbPF
 7xgNJWQ0tv158U+6+f+MAg0FXLAT6M+1h0qhXet30PKINNkRcawU5zgI3qGna0cVGZlD
 RgvQ==
X-Gm-Message-State: AOAM533rgwa7Op1kGI/nvlOflPDcIphLbE7cSAr3wsNantHqOtT2KdmA
 smOZdLMPTFbIR/Ba+YNGYVlSSu7BYOE=
X-Google-Smtp-Source: ABdhPJwopGYBO9AZNKyKSCjvuxK8QaZSQlsQgaaOU/SxPawvGu2/mliF0N+cIp7FphUx28r2koiWTw==
X-Received: by 2002:adf:8b0d:: with SMTP id n13mr39527798wra.57.1608142681436; 
 Wed, 16 Dec 2020 10:18:01 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s25sm4450464wrs.49.2020.12.16.10.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 10:18:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
Date: Wed, 16 Dec 2020 19:17:59 +0100
Message-Id: <20201216181759.933527-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test the PMON firmware. As the firmware is not redistributable,
it has to be downloaded manually first. Then it can be used by
providing its path via the PMON_PATH environment variable:

  $ AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
    PMON_PATH=/images/pmon \
    avocado --show=app,console \
      run -t machine:loongson3-virt tests/acceptance
  JOB ID     : 363e66a2d20b1c0e3f515653f9137483b83b2984
  JOB LOG    : /home/phil/avocado/job-results/job-2020-12-16T19.02-363e66a/job.log
   (1/2) tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_pmon_BLD_serial_console:
  console: PMON2000 MIPS Initializing. Standby...
  console: 00000000
  console: Shut down other cores
  console: 0xbfe00190  : 0000000000000000
  console: CPU CLK SEL : 00000000
  console: MEM CLK SEL : 00000000
  console: Change the driver
  console: Soft CLK SEL adjust begin
  console: HT         :00000000
  console: DDR_DIV:00000002
  console: BBGEN start  :
  console: BBGEN config value  :00000000
  console: MC RESET
  console: Fix L1xbar illegal access at NODE 0
  console: Fix L2xbar in NODE 0
  console: 32 bit PCI space translate to 64 bit HT space
  console: Waiting HyperTransport bus to be up.
  PASS (0.10 s)
   (2/2) tests/acceptance/machine_mips_fuloong3.py:MipsFuloong3.test_pmon_A1101_serial_console:
  console: PMON2000 MIPS Initializing. Standby...
  console: 0xbfe00190  : 0000000000000000
  console: CPU CLK SEL : 00000000
  console: CPU clk frequency = SYSCLK x 0x0000001e /  1
  console: MEM CLK SEL : 00000000
  console: DDR clk frequency = MEMCLK x 0x0000001e /  3
  console: Fix L1xbar illegal access
  console: Fix L2xbar illegal access
  console: Init tlb...
  console: godson2 caches found
  PASS (0.12 s)
  RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 0.58 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <20201215125716.477023-1-chenhuacai@kernel.org>
---
 MAINTAINERS                                 |  1 +
 tests/acceptance/machine_mips_loongson3v.py | 66 +++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 tests/acceptance/machine_mips_loongson3v.py

diff --git a/MAINTAINERS b/MAINTAINERS
index f75fa2a7142..9a02d44f997 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1166,6 +1166,7 @@ M: Huacai Chen <chenhuacai@kernel.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Maintained
 F: hw/intc/loongson_liointc.c
+F: tests/acceptance/machine_mips_loongson3v.py
 
 Boston
 M: Paul Burton <paulburton@kernel.org>
diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
new file mode 100644
index 00000000000..8e698bbc99b
--- /dev/null
+++ b/tests/acceptance/machine_mips_loongson3v.py
@@ -0,0 +1,66 @@
+# Functional tests for the Generic Loongson-3 Platform.
+#
+# Copyright (c) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
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
+from avocado_qemu import wait_for_console_pattern
+
+class MipsFuloong3(Test):
+
+    timeout = 60
+
+    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_pmon_BLD_serial_console(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=endian:little
+        :avocado: tags=machine:loongson3-virt
+        :avocado: tags=cpu:Loongson-3A1000
+        :avocado: tags=device:liointc
+        :avocado: tags=device:goldfish_rtc
+        """
+        pmon_name = 'pmon_BLD-3A3000-780EMATX-1w-V1.10.bin'
+        pmon_hash = '38916ee03ed09a86997b40c687c83e92'
+        pmon_path = self.fetch_asset('file://' + os.path.join(
+                                        os.getenv('PMON_PATH'), pmon_name),
+                                     asset_hash=pmon_hash, algorithm='md5')
+
+        self.vm.set_console()
+        self.vm.add_args('-bios', pmon_path)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
+        wait_for_console_pattern(self, 'Shut down other cores')
+        wait_for_console_pattern(self, 'Waiting HyperTransport bus to be up.')
+
+    @skipUnless(os.getenv('PMON_PATH'), 'PMON_PATH not available')
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_pmon_A1101_serial_console(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=endian:little
+        :avocado: tags=machine:loongson3-virt
+        :avocado: tags=cpu:Loongson-3A1000
+        :avocado: tags=device:liointc
+        :avocado: tags=device:goldfish_rtc
+        """
+        pmon_name = 'pmon-A1101-2.0.8.bin'
+        pmon_hash = 'cc40276213cfa20922720f183b92ab61'
+        pmon_path = self.fetch_asset('file://' + os.path.join(
+                                        os.getenv('PMON_PATH'), pmon_name),
+                                     asset_hash=pmon_hash, algorithm='md5')
+
+        self.vm.set_console()
+        self.vm.add_args('-bios', pmon_path)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
+        wait_for_console_pattern(self, 'godson2 caches found')
-- 
2.26.2


