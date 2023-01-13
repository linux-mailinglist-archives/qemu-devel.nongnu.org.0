Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C14669FA4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:16:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGa-0001sG-Cp; Fri, 13 Jan 2023 10:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGL-0001i0-DO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:37 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGJ-00069h-Cj
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:37 -0500
Received: by mail-wr1-x436.google.com with SMTP id h16so21446871wrz.12
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3G7QMmtWQGs6Pv27KQ4kq/TbMIOtKy3Cuo5JWRlvQY=;
 b=XHeOo+CcBaz9HBgvESunDcN1mK8nyZMgc8uxOvQ6GvZ7KxxheM/hDTYwcuIaXwvYqC
 jIEz2u01mdnhWEQ1yOFr9m/8gt3WzGi3Ars1NzbhWLdXz3tPAToTqJ2GGFEvrje3n9ND
 BK+MgpVMxG97csGm6SClLsXeRXxDHhSShtroL6QDjKV3hqY16Z0CdJAxS72MW9eTiVHl
 e4JSBvbRQsE02xN78ounaFj/+/xJLHdS5GutciHTK5M1f1nB0U/CxyYeNnY8tpeZUZoh
 XgwteH9Z/slUErn5XwCNBj369WPIeahQIxOwj7cu5aPsMc4q5yZSgx3rZ2i8QkOdVSAE
 ktBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3G7QMmtWQGs6Pv27KQ4kq/TbMIOtKy3Cuo5JWRlvQY=;
 b=S2pEtf9AKteVs6S34XJNGjTc1nf3St/GT98+QEaLrL7MDXBjt+mTZjsyRLGcrz0JYT
 LoW+DTI9/a17XI599H3CLZiKUzgDsoGo7mJrTdIZq9qH6pySlea+A49yC83rd6tORfTt
 bvBAOVb7GZQpVE7o8ggpqHCzxT7UDzOzzqQlzeDy9iAk656jFbbz0/pPofJT98tWd/UQ
 tC6PLb9mltafvs1jQqNauRFZSLQIOeky+vXgBRLl0cH4wczD/1NwuLV7hLvB5fTUY0RU
 1gI1w3858j/JnQPIie0ldmo1lX2z84kENdmtNaIBmRDtmctTnL0dom+LJvgH2xmF2pSP
 OjOg==
X-Gm-Message-State: AFqh2kqPJxxxEdfxFQ5PfQgDZwjgd6MP/Oj51zmEyQHnT7k0wrArpBl7
 vpy3uLZcyqMTUgQrlEyeC34xuJOsZNg/tCrs
X-Google-Smtp-Source: AMrXdXsNet3egOiibvwliVAst7LW/MdK4a1k43Yul6vdJ7MIJQofWvBcumPZ9ndCJ+U8FkGlkgXWlA==
X-Received: by 2002:a5d:640c:0:b0:29f:7c0c:5a46 with SMTP id
 z12-20020a5d640c000000b0029f7c0c5a46mr26090624wru.68.1673624792323; 
 Fri, 13 Jan 2023 07:46:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm19246972wrq.70.2023.01.13.07.46.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/46] tests/avocado: Add tests booting YAMON ROM on MIPS Malta
 machines
Date: Fri, 13 Jan 2023 16:44:58 +0100
Message-Id: <20230113154532.49979-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230104133935.4639-7-philmd@linaro.org>
---
 tests/avocado/machine_mips_malta.py | 47 ++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
index f1895d59f3..92233451c5 100644
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
@@ -118,3 +120,40 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         :avocado: tags=mips:smp
         """
         self.do_test_i6400_framebuffer_logo(8)
+
+class MaltaMachine(QemuSystemTest):
+
+    def do_test_yamon(self):
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


