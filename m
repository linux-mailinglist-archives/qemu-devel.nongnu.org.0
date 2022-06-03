Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC58D53C932
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 13:21:22 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx5Mn-0006be-JZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 07:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx5KW-0005Yi-W8
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 07:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx5KS-0005eC-Bx
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 07:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654255135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KrgGtwwePF8sETGt2Mh/1UR9FcfHsk1Wt8hAxX8m0Ck=;
 b=BNXNPwLiQdOh3ravvIBsmThpyh+UexAQLHTuoj8njAeBNMSRjBfAgp2BqSj0poPkBpYrFh
 SQiK0ickSi5t2wXW1wM1+xyyZipNWRDXS1J8WHy0if/cvFeV7x7nZ70Zj49FDKAgbC/PrS
 rtcaiu5psqY6tvpbNmx+RBAE3G0mI6E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-SwVrakS_MgiCwrFHaTzpCg-1; Fri, 03 Jun 2022 07:18:52 -0400
X-MC-Unique: SwVrakS_MgiCwrFHaTzpCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F199811E75;
 Fri,  3 Jun 2022 11:18:52 +0000 (UTC)
Received: from gator.home (unknown [10.40.194.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F347210725;
 Fri,  3 Jun 2022 11:18:50 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: f4bug@amsat.org,
	alex.bennee@linaro.org,
	cohuck@redhat.com
Subject: [PATCH v2] tests: Prefer max cpu type when using AArch64 virt machine
Date: Fri,  3 Jun 2022 13:18:49 +0200
Message-Id: <20220603111849.1481100-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The max cpu type is the best default cpu type for tests to use
when specifying the cpu type for AArch64 mach-virt. Switch all
tests to it.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 tests/avocado/boot_xen.py          |  6 +++---
 tests/avocado/replay_kernel.py     |  2 +-
 tests/avocado/reverse_debugging.py |  2 +-
 tests/avocado/tcg_plugins.py       |  6 +++---
 tests/qtest/bios-tables-test.c     | 12 ++++++------
 tests/qtest/machine-none-test.c    |  4 ++--
 tests/vm/aarch64vm.py              |  2 +-
 tests/vm/ubuntu.aarch64            |  2 +-
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index fc2faeedb559..899c396bd55c 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -66,7 +66,7 @@ def test_arm64_xen_411_and_dom0(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:max
         :avocado: tags=machine:virt
         """
 
@@ -84,7 +84,7 @@ def test_arm64_xen_414_and_dom0(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:max
         :avocado: tags=machine:virt
         """
 
@@ -102,7 +102,7 @@ def test_arm64_xen_415_and_dom0(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:max
         :avocado: tags=machine:virt
         """
 
diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 0b2b0dc692b1..c19022ea977d 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -147,7 +147,7 @@ def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
index d2921e70c3b4..d6a6d7277235 100644
--- a/tests/avocado/reverse_debugging.py
+++ b/tests/avocado/reverse_debugging.py
@@ -198,7 +198,7 @@ def test_aarch64_virt(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 642d2e49e305..2bbf62f5036e 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -94,7 +94,7 @@ def test_aarch64_virt_insn_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -120,7 +120,7 @@ def test_aarch64_virt_mem_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index a4a46e97f0b8..7c3a58a97460 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1270,7 +1270,7 @@ static void test_acpi_virt_tcg_memhp(void)
 
     data.variant = ".memhp";
     test_acpi_one(" -machine nvdimm=on"
-                  " -cpu cortex-a57"
+                  " -cpu max"
                   " -m 256M,slots=3,maxmem=1G"
                   " -object memory-backend-ram,id=ram0,size=128M"
                   " -object memory-backend-ram,id=ram1,size=128M"
@@ -1363,7 +1363,7 @@ static void test_acpi_virt_tcg_numamem(void)
     };
 
     data.variant = ".numamem";
-    test_acpi_one(" -cpu cortex-a57"
+    test_acpi_one(" -cpu max"
                   " -object memory-backend-ram,id=ram0,size=128M"
                   " -numa node,memdev=ram0",
                   &data);
@@ -1397,7 +1397,7 @@ static void test_acpi_virt_tcg_pxb(void)
                   "if=none,media=cdrom,id=drive-scsi0-0-0-1,readonly=on"
                   " -device scsi-cd,bus=scsi0.0,scsi-id=0,"
                   "drive=drive-scsi0-0-0-1,id=scsi0-0-0-1,bootindex=1"
-                  " -cpu cortex-a57"
+                  " -cpu max"
                   " -device pxb-pcie,bus_nr=128",
                   &data);
 
@@ -1511,7 +1511,7 @@ static void test_acpi_virt_tcg(void)
 
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu max "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
@@ -1591,7 +1591,7 @@ static void test_acpi_virt_viot(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu max "
                   "-device virtio-iommu-pci", &data);
     free_test_data(&data);
 }
@@ -1699,7 +1699,7 @@ static void test_acpi_oem_fields_virt(void)
     char *args;
 
     args = test_acpi_create_args(&data,
-                                 "-cpu cortex-a57 "OEM_TEST_ARGS, true);
+                                 "-cpu max "OEM_TEST_ARGS, true);
     data.qts = qtest_init(args);
     test_acpi_load_tables(&data, true);
     test_oem_fields(&data);
diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
index d0f8cd990245..d47533a835b7 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -24,8 +24,8 @@ struct arch2cpu {
 
 static struct arch2cpu cpus_map[] = {
     /* tested targets list */
-    { "arm", "cortex-a15" },
-    { "aarch64", "cortex-a57" },
+    { "arm", "max" },
+    { "aarch64", "max" },
     { "avr", "avr6-avr-cpu" },
     { "x86_64", "qemu64,apic-id=0" },
     { "i386", "qemu32,apic-id=0" },
diff --git a/tests/vm/aarch64vm.py b/tests/vm/aarch64vm.py
index b00cce07eb81..a82b4dd7a91a 100644
--- a/tests/vm/aarch64vm.py
+++ b/tests/vm/aarch64vm.py
@@ -31,7 +31,7 @@
 # parameters that works for backwards compatibility.
 DEFAULT_CONFIG = {'kvm' : {'cpu'          : "host",
                            'machine'      : "virt,gic-version=host"},
-                  'tcg' : {'cpu'          : "cortex-a57",
+                  'tcg' : {'cpu'          : "max",
                            'machine'      : "virt"},
 }
 
diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
index b291945a7e9d..e2958ccd2a44 100755
--- a/tests/vm/ubuntu.aarch64
+++ b/tests/vm/ubuntu.aarch64
@@ -18,7 +18,7 @@ import aarch64vm
 import ubuntuvm
 
 DEFAULT_CONFIG = {
-    'cpu'          : "cortex-a57",
+    'cpu'          : "max",
     'machine'      : "virt,gic-version=3",
     'install_cmds' : "apt-get update,"\
                      "apt-get build-dep -y --arch-only qemu,"\
-- 
2.34.3


