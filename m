Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCE14F9B29
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:57:58 +0200 (CEST)
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrvq-0002EH-0m
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmK-000787-T5
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmH-00031i-IC
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 i6-20020a1c3b06000000b0038e710da2dcso8018078wma.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZbWPiXBtnz0VkzdX0DVcMc8Bcjhgo9EGKHKpmgZy9A=;
 b=JeFEVtdJriKS5wzkW05lhnTJb/USR5XG9IB6Lfe67H/7ByKWSoFuTQJa1QnDRZVUzd
 yUykSP3AwFFqHu4ZCpQ7mgpp1VnGDNOf8jt3pAMWjwz5C7sf2xE21U6+GVGWd7HjfSVC
 HkpdEy6X3VQQP9p9VjIpIs4A2rXLxIoJvIaWoly5headMDp7f0ECum5Av9UiIt6BlH/V
 mJVUDykpXCtYe7Y7hLQ/jEjuxfhZ1l5YhX5ACdZHeDTlbRsXSzvKSh/iMAOWChMihVSV
 +Ql8T3urJRQPhc/Hy/DLNuQaeOmCjAJ7GflU3KKwElVA2vJu3jbungpoGi34N8WI+9uW
 63rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZbWPiXBtnz0VkzdX0DVcMc8Bcjhgo9EGKHKpmgZy9A=;
 b=k6xZYXGyxtzbJVTFUnLPBdA1Tr3C6Pxxzbhgai85Lu5pi8DIW5wMuG8/vTLdfEXfXc
 kbTlGAPCWB6DW8NS9fQvkUy8hteoxt89YmqdlR2uR2WfmnUtAgH8pv9lCRwwKkH+/44v
 ixvTkgqG5osYpsznNOZWUAU9/qiHO3au0If5g1RILJyw9IjiUp28Y4Wt2pC2FsgI5tuW
 2qZAIP6a7Bb7cWgSF76z3UzQ8CorOtUBLR04009NbikmIwL7nY8aAWkDSFVToYWo5iRt
 6pl3J/dTfSBpAdXg0wjRu7HXRi5SNRC+Dq3YXVgYZZ3bsrbb9X39uoyf0TlQd5uQZMQx
 WeFg==
X-Gm-Message-State: AOAM532XBrrqxJpyPWls3okYfohy0dunjXRyqxexO+FxIWXj8oCmMqRy
 0PxVFETmQc0c5RyaaIAJ6c/7ug==
X-Google-Smtp-Source: ABdhPJw7+Lg8PcMoL9IlvZoqgqTwlWI3gByU3kJO5GLIHu1vFpXK7ZSEPKZfi8w1qdOjMRMD/xV7lg==
X-Received: by 2002:a05:600c:1e8d:b0:38e:6eb6:f18b with SMTP id
 be13-20020a05600c1e8d00b0038e6eb6f18bmr17595723wmb.125.1649436469594; 
 Fri, 08 Apr 2022 09:47:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b0038cbd13e06esm10932021wmq.2.2022.04.08.09.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D701B1FFB8;
 Fri,  8 Apr 2022 17:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/15] tests/avocado: update aarch64_virt test to exercise
 -cpu max
Date: Fri,  8 Apr 2022 17:47:28 +0100
Message-Id: <20220408164742.2844631-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
 berrange@redhat.com, stefanha@redhat.com,
 "open list:Virt" <qemu-arm@nongnu.org>, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Luke.Craig@ll.mit.edu,
 pbonzini@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Beraldo Leal <bleal@redhat.com>
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


