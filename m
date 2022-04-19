Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486F75067B9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:29:47 +0200 (CEST)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkB8-0007AY-CV
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsS-0005Hk-6z
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:28 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngjsO-0008II-NW
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:10:27 -0400
Received: by mail-ed1-x533.google.com with SMTP id t25so20402792edt.9
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZbWPiXBtnz0VkzdX0DVcMc8Bcjhgo9EGKHKpmgZy9A=;
 b=BLzAGurppIziuBWLaPdc920fMRyKMUFaflW7pPmMMsBPqv8Pxm1ToRAhaRX5ueYeCK
 f8wR5BQDXnA08VrFNHXgBb+DoM5/RqQwUxilrIHhO4fjUK+uHPkhRdjaA7Nb9ckrBC/K
 y7S0+BPUS0YEf1DxkjlKLYovx6dg3u0Bdjiy5Puh52V9hDk0MMkJKijnvK1kqp+dLYTR
 Or6Vf7ovtdw/SkNlha0EMw1GHhfLPXrFoBw6lJzWkNlhPnEZk6nA2Hue6CpKKI+UMgVt
 Qo3BD5l1k0pm4JkndJ5hATt87ODDsrOYCtcDek5A6B6UwQIuvmzGqfjWbdY6Z2LuNbmj
 ISuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZbWPiXBtnz0VkzdX0DVcMc8Bcjhgo9EGKHKpmgZy9A=;
 b=YTcziAnYitwBIJ7Bbpn6uBfCx0AMH55FsQdbjGgkbTgDWvf7gs1T0UQsb1BmW/Mpzp
 1jzfNqa6GII4m8ED3mpU4hPe4gSUeVmxD/hGFh/VEH/2F+LrQT8tYEbuytvU03F65hB7
 1ldOw4QlFPTEw10H34f8e9qts3eStJ+eO6d5OB/k8mp7dgdd6GIlMJWoK8WFTbJU4G4w
 F5s3eLKy/eIL07yvf7tCmX/jKjzy5saDgB5rxpMkUiAp87QFqV6H0X1HBKqR0tReAMP9
 WvINqidzPWeET0cr2tH5CQiR3QxDI9TASpjTLfPrbvhatKoRl9iIKMLy2mVNN6lASPDS
 rILw==
X-Gm-Message-State: AOAM5301S+bCRUXRa55n9aAkdmvt8dbx8tep0DLnCtWKhsDAWi9+HEj0
 YAfAH6SfA+jTl9zQyl6rw/r4lg==
X-Google-Smtp-Source: ABdhPJyqB5fR4V9mVGUFb+sb7tFqmQqVbV7mE7ZG657Q7eZD7L8S9JBG/+DqyXKdtKBxgYc2bjz/qA==
X-Received: by 2002:a50:ba8a:0:b0:423:bdf5:41d6 with SMTP id
 x10-20020a50ba8a000000b00423bdf541d6mr14895435ede.204.1650359423079; 
 Tue, 19 Apr 2022 02:10:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ch26-20020a0564021bda00b00422dfcce6e2sm5973962edb.50.2022.04.19.02.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 712871FFB8;
 Tue, 19 Apr 2022 10:10:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/25] tests/avocado: update aarch64_virt test to exercise
 -cpu max
Date: Tue, 19 Apr 2022 10:09:56 +0100
Message-Id: <20220419091020.3008144-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:Virt" <qemu-arm@nongnu.org>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Fedora 29 kernel is quite old and importantly fails when running
in LPA2 scenarios. As it's not really exercising much of the CPU space
replace it with a custom 5.16.12 kernel with all the architecture
options turned on. There is a minimal buildroot initramfs included in
the kernel which has a few tools for stress testing the memory
subsystem. The userspace also targets the Neoverse N1 processor so
would fail with a v8.0 cpu like cortex-a53.

While we are at it move the test into its own file so it can have an
assigned maintainer.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220315121251.2280317-3-alex.bennee@linaro.org>

---
v2
  - move test into own machine file
v3
  - minor reword of commit, added tags
---
 MAINTAINERS                           |  1 +
 tests/avocado/boot_linux_console.py   | 25 -------------
 tests/avocado/machine_aarch64_virt.py | 51 +++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 25 deletions(-)
 create mode 100644 tests/avocado/machine_aarch64_virt.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ad2451e03..dcedfaed1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -942,6 +942,7 @@ S: Maintained
 F: hw/arm/virt*
 F: include/hw/arm/virt.h
 F: docs/system/arm/virt.rst
+F: tests/avocado/machine_aarch64_virt.py
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index b40a3abc81..45a2ceda22 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -325,31 +325,6 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
         self.do_test_mips_malta32el_nanomips(kernel_url, kernel_hash)
 
-    def test_aarch64_virt(self):
-        """
-        :avocado: tags=arch:aarch64
-        :avocado: tags=machine:virt
-        :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a53
-        """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
-                      '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
-                      '/vmlinuz')
-        kernel_hash = '8c73e469fc6ea06a58dc83a628fc695b693b8493'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        self.vm.set_console()
-        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'console=ttyAMA0')
-        self.require_accelerator("tcg")
-        self.vm.add_args('-cpu', 'cortex-a53',
-                         '-accel', 'tcg',
-                         '-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
-
     def test_aarch64_xlnx_versal_virt(self):
         """
         :avocado: tags=arch:aarch64
diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
new file mode 100644
index 0000000000..21848cba70
--- /dev/null
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -0,0 +1,51 @@
+# Functional test that boots a Linux kernel and checks the console
+#
+# Copyright (c) 2022 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import time
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+
+class Aarch64VirtMachine(QemuSystemTest):
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def test_aarch64_virt(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=accel:tcg
+        :avocado: tags=cpu:max
+        """
+        kernel_url = ('https://fileserver.linaro.org/s/'
+                      'z6B2ARM7DQT3HWN/download')
+
+        kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyAMA0')
+        self.require_accelerator("tcg")
+        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
+                         '-accel', 'tcg',
+                         '-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+        exec_command(self, 'cat /proc/self/maps')
+        time.sleep(0.1)
-- 
2.30.2


