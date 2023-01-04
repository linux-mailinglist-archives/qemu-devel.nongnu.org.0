Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C40765D498
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:42:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD40A-0003sa-UB; Wed, 04 Jan 2023 08:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD404-0003pN-9Q
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:40:12 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD402-00026a-69
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:40:12 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so24027821wms.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZI17cYoR2O/p08Q/wmFBu65ZPE9ZWexei1omODYWfc=;
 b=X2ZTOzIlUcMi19lIK4WTe9EuppF5iZ/1U3BJD0LXm0e4TW6OuAeVeOfsT/TC6Lg0lS
 5HYXa4edPlRTk2/ta8xiWiIvFBd0Oi/yEtn+WqPBAkd4TFeEwTopCPgFlnDk19yyCpW6
 uQpdGxMxlVPedMVbnRzBftrmDtxq60slrW9W0R/eb7roSKi4/gSKFjje4OogongnvY4Q
 pL3b+LBhsLjnh0TowYVWM3Kx9vW/iNYALI90jkPQWKRlttMtHkh+xRvcsJ2LeRk5k80t
 pb4DfxxbIZgznjMyn4OgDiZKnNsGUB3sHCjPtz9u6QLKbL888W8t8rqkFsq+zrB5EjeN
 XgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZI17cYoR2O/p08Q/wmFBu65ZPE9ZWexei1omODYWfc=;
 b=UNQL1YHwbb8V4E7U9s0SwHNuGdTgTX143yuQWribf9D7X+yT3IuVYcBkoHHpiIwb8o
 NLs5a6575pl+G9aAwebWq19WcXYDsqSMm8+qdZvjopbmTiW2kwQM1FJrYvLvLQajgJmo
 r+zuqp+wZqFTyyBSwQWnosrKohhW9u7cubTL/OLiWU3sc01J7qImFFfQDV3Pg9o/YXIo
 Mm7RmmroRSoFRbZWo2DaSVdI5UTTDyMJDOOOLypQhbwzJXm3X+xlceHZUXwQJYqnbClC
 5tEMg88vWyFJhw2YfawL1XUpBDl0Q5mzj13uFIh5U92Tvnl60iD459kL2hjX/G0ru2iG
 MmPQ==
X-Gm-Message-State: AFqh2koL34uKlbxjDHIbZch2/NWa8amyUfKIsjl3qMvBAey3Mp+PXytv
 vOAplm1C5Rf9/rAEASqmbL95XSIG5sJ1egFO
X-Google-Smtp-Source: AMrXdXvLILaWjgzOG9fyur2ppp1kdRvO9MKuQT76RpBCgBhaOeVqU83PNKc39tTippI+8lmxh3yD0A==
X-Received: by 2002:a05:600c:34d4:b0:3cf:a39f:eb2a with SMTP id
 d20-20020a05600c34d400b003cfa39feb2amr33718751wmq.11.1672839608662; 
 Wed, 04 Jan 2023 05:40:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c191400b003b4fe03c881sm57979094wmq.48.2023.01.04.05.40.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 05:40:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/6] tests/avocado: Add tests booting YAMON ROM on MIPS Malta
 machines
Date: Wed,  4 Jan 2023 14:39:35 +0100
Message-Id: <20230104133935.4639-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104133935.4639-1-philmd@linaro.org>
References: <20230104133935.4639-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add quick tests booting YAMON:

  $ avocado --show=app,console run -t machine:malta tests/avocado/machine_mips_malta.py
   (1/2) tests/avocado/machine_mips_malta.py:MaltaMachine.test_mipsel_malta_yamon:
  console: YAMON ROM Monitor, Revision 02.22.
  console: Copyright (c) 1999-2007 MIPS Technologies, Inc. - All Rights Reserved.
  console: For a list of available commands, type 'help'.
  console: Compilation time =              May 24 2013  12:16:34 (pburton)
  console: Board type/revision =           0x02 (Malta) / 0x00
  console: Core board type/revision =      0x01 (CoreLV) / 0x00
  console: System controller/revision =    Galileo / GT_64120A-B-0
  console: FPGA revision =                 0x0000
  console: MAC address =                   ff.ff.ff.ff.ff.ff
  console: Board S/N =                     0123456789
  console: PCI bus frequency =             33.33 MHz
  console: Processor Company ID/options =  0x01 (MIPS Technologies, Inc.) / 0x00
  console: Processor ID/revision =         0x93 (MIPS 24Kf) / 0x00
  console: Endianness =                    Little
  console: CPU/Bus frequency =             333 MHz / 419 MHz
  console: Coherency =                     None
  console: Flash memory size =             4 MByte
  console: SDRAM size =                    128 MByte
  console: First free SDRAM address =      0x800c32f0
  console: WARNING: Environment variable flash area is invalid!
  console: HINT   : Perform "erase -e"
  console: YAMON>
  PASS (1.88 s)
   (2/2) tests/avocado/machine_mips_malta.py:MaltaMachine.test_mips64el_malta_yamon:
  ...
  console: System controller/revision =    Galileo / GT_64120A-B-0
  console: Processor Company ID/options =  0x01 (MIPS Technologies, Inc.) / 0x00
  console: Processor ID/revision =         0x82 (MIPS 20Kc) / 0xa0
  ...
  console: YAMON>
  PASS (1.89 s)
  RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 4.57 s

YAMON does some endian-swapped acceses on the ISD<->PCI CFG/DATA
registers. These tests are useful to debug cross-endianness issues,
in particular on big-endian host.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/machine_mips_malta.py | 52 ++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
index f1895d59f3..a3b0b55305 100644
--- a/tests/avocado/machine_mips_malta.py
+++ b/tests/avocado/machine_mips_malta.py
@@ -11,11 +11,13 @@
 import gzip
 import logging
 
-from avocado import skipUnless
-from avocado_qemu import QemuSystemTest
-from avocado_qemu import wait_for_console_pattern
-from avocado.utils import archive
 from avocado import skipIf
+from avocado import skipUnless
+from avocado.utils import archive
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
+from avocado_qemu import wait_for_console_pattern
 
 
 NUMPY_AVAILABLE = True
@@ -118,3 +120,45 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         :avocado: tags=mips:smp
         """
         self.do_test_i6400_framebuffer_logo(8)
+
+class MaltaMachine(QemuSystemTest):
+
+    def do_test_yamon(self):
+        """
+        :avocado: tags=arch:mipsel
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:malta
+        """
+        rom_url = ('http://www.imgtec.com/tools/mips-tools/downloads/'
+                   'yamon/yamon-bin-02.22.zip')
+        rom_hash = '8da7ecddbc5312704b8b324341ee238189bde480'
+        zip_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
+
+        archive.extract(zip_path, self.workdir)
+        yamon_path = os.path.join(self.workdir, 'yamon-02.22.bin')
+
+        self.vm.set_console()
+        self.vm.add_args('-bios', yamon_path)
+        self.vm.launch()
+
+        prompt =  'YAMON>'
+        pattern = 'YAMON ROM Monitor'
+        interrupt_interactive_console_until_pattern(self, pattern, prompt)
+        wait_for_console_pattern(self, prompt)
+        self.vm.shutdown()
+
+    def test_mipsel_malta_yamon(self):
+        """
+        :avocado: tags=arch:mipsel
+        :avocado: tags=machine:malta
+        :avocado: tags=endian:little
+        """
+        self.do_test_yamon()
+
+    def test_mips64el_malta_yamon(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:malta
+        :avocado: tags=endian:little
+        """
+        self.do_test_yamon()
-- 
2.38.1


