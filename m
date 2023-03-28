Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581966CBEA7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:10:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph88N-00014I-BI; Tue, 28 Mar 2023 08:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ph88K-00013s-Rw
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:09:00 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ph88I-0001MF-0O
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:09:00 -0400
Received: by mail-pj1-x102f.google.com with SMTP id d13so10610320pjh.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680005336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=2I4n75O4YDlTqsjwA2Qywjvyl1TE6xuLu9b3Rj7mY5U=;
 b=imljsU3Bn8KO6Z5QIKqIsfNiJMrNYWUhj6xxUgAMSPIrdNveytC6lqW6Rkbv2AXmg1
 0ukDA8S7FG2Lv5kGTpuczLvWLOX3fXxjj8JZlMDzTz5mb4wYAI3Py5rhsxtCqCu1BlF2
 o/xsjS0rJ8NIqS4OA4EiOaYQZ6wOV3o0ABKBNmZDicSgut12bAbltpzWdG9QGWIuFT1W
 6ChFSVrPZ0RMUxKpT/cLsFI70h+Oum1exScWCig7cYhtPOcH2fiWKHTxaYU1JbxBqS6O
 4gkBVchoIYTueJGYaEFWl2a1zyICAs4x7GlTv6gAornudVp/IMwtq+10HIOgGKFe+wqA
 6GqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680005336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2I4n75O4YDlTqsjwA2Qywjvyl1TE6xuLu9b3Rj7mY5U=;
 b=oOfH31ovO10hKrrAuy3xzlpogPTRF1k6eEPdqq+rAXYTuLxf8AkrLZUmosVBx2CAg/
 r5V2Q08KppZeRNtQ8/bLJwGfKBUGdUiKaYBMW8ZcMBIvXbLbRUPC9SXFpRCtEVVXZd9c
 Hg2UzVb5TzvbRhvg3Xf+Miq4mxGRkxYNYUmgWouLEZIfg8i7tI95CJj4lG1+muJKqHD3
 BB2yHwaQLHxHErdi3gvB9GyyCQNud73Bl19pzqSGGskeMOTYKZEWR9CDWsxTUodFj1W3
 pyH00h5TEXg2OZJcc4FWROkPYZRzTijrjQ4Ry1qK9n+bLlh550McJbU03OAVoycPIgH2
 aCtw==
X-Gm-Message-State: AAQBX9fKT2rV7St0Rv3jwiSc47iF1W1hwzjGDKUVYo2vDMDtDzbpCjhD
 +Q/w94N+FCZvcMGIZ6bieUk=
X-Google-Smtp-Source: AKy350aFa2ninb6LSqwh03DXn6WpEqvLHtzSE5FkE1EwMcseZrjQl9fTYy9Oka/O8ZOqZ1t3cUQnog==
X-Received: by 2002:a17:902:fa48:b0:1a2:1513:44bf with SMTP id
 lb8-20020a170902fa4800b001a2151344bfmr13398059plb.1.1680005335722; 
 Tue, 28 Mar 2023 05:08:55 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 ja2-20020a170902efc200b001a1f830c9d0sm8977081plb.13.2023.03.28.05.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 05:08:54 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 stefanb@linux.ibm.com, ninad@linux.ibm.com
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH] tests/avocado/aspeed: Add TPM TIS I2C test
Date: Tue, 28 Mar 2023 22:38:44 +1030
Message-Id: <20230328120844.190914-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add a new buildroot image based test that attaches a TPM emulator to the
I2C bus and checks for a known PCR0 value for the image that was booted.

Note that this does not tear down swtpm process when qemu execution fails.
The swtpm process will exit when qemu exits if a connection has been
made, but if the test errors before connection then the swtpm process
will still be around.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/avocado/machine_aspeed.py | 42 +++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 35723af4ede0..a4485a5c4d4d 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -7,14 +7,18 @@
 
 import time
 import os
+import tempfile
+import subprocess
 
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import interrupt_interactive_console_until_pattern
+from avocado_qemu import has_cmd
 from avocado.utils import archive
 from avocado import skipIf
+from avocado import skipUnless
 
 
 class AST1030Machine(QemuSystemTest):
@@ -132,7 +136,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
 
         self.do_test_arm_aspeed(image_path)
 
-    def do_test_arm_aspeed_buildroot_start(self, image, cpu_id):
+    def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
         self.require_netdev('user')
 
         self.vm.set_console()
@@ -146,7 +150,7 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id):
         self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
         self.wait_for_console_pattern('lease of 10.0.2.15')
         # the line before login:
-        self.wait_for_console_pattern('Aspeed EVB')
+        self.wait_for_console_pattern(pattern)
         time.sleep(0.1)
         exec_command(self, 'root')
         time.sleep(0.1)
@@ -229,6 +233,40 @@ def test_arm_ast2600_evb_buildroot(self):
              '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
         self.do_test_arm_aspeed_buildroot_poweroff()
 
+    @skipUnless(*has_cmd('swtpm'))
+    def test_arm_ast2600_evb_buildroot_tpm(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2600-evb
+        """
+
+        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
+                     'images/ast2600-evb/buildroot-2023.02-tpm/flash.img')
+        image_hash = ('a46009ae8a5403a0826d607215e731a8c68d27c14c41e55331706b8f9c7bd997')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        socket = os.path.join(self.vm.sock_dir, 'swtpm-socket')
+
+        subprocess.run(['swtpm', 'socket', '-d', '--tpm2',
+                        '--tpmstate', f'dir={self.vm.temp_dir}',
+                        '--ctrl', f'type=unixio,path={socket}'])
+
+        self.vm.add_args('-chardev', f'socket,id=chrtpm,path={socket}')
+        self.vm.add_args('-tpmdev', 'emulator,id=tpm0,chardev=chrtpm')
+        self.vm.add_args('-device',
+                         'tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.12,address=0x2e')
+        self.do_test_arm_aspeed_buildroot_start(image_path, '0xf00', 'Aspeed AST2600 EVB')
+        exec_command(self, "passw0rd")
+
+        exec_command_and_wait_for_pattern(self,
+            'echo tpm_tis_i2c 0x2e > /sys/bus/i2c/devices/i2c-12/new_device',
+            'tpm_tis_i2c 12-002e: 2.0 TPM (device-id 0x1, rev-id 1)');
+        exec_command_and_wait_for_pattern(self,
+            'cat /sys/class/tpm/tpm0/pcr-sha256/0',
+            'B804724EA13F52A9072BA87FE8FDCC497DFC9DF9AA15B9088694639C431688E0');
+
+        self.do_test_arm_aspeed_buildroot_poweroff()
 
 class AST2x00MachineSDK(QemuSystemTest):
 
-- 
2.39.2


