Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246536FF173
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:22:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5Iw-00007f-Ld; Thu, 11 May 2023 08:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1px5It-00007B-J2
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:21:51 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1px5In-0005ZQ-7e
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:21:51 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Bx5ejS3Vxk5r4HAA--.13204S3;
 Thu, 11 May 2023 20:21:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxRrXQ3VxkTspVAA--.21477S2; 
 Thu, 11 May 2023 20:21:36 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: thuth@redhat.com,
	qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org, philmd@linaro.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn, lvivier@redhat.com, atar4qemu@gmail.com,
 edgar.iglesias@gmail.com, wainersm@redhat.com, quic_llindhol@quicinc.com,
 kraxel@redhat.com, deller@gmx.de, stefanha@redhat.com, crosa@redhat.com,
 eduardo@habkost.net, quintela@redhat.com, jsnow@redhat.com,
 ysato@users.sourceforge.jp, clg@kaod.org, iii@linux.ibm.com,
 pavel.dovgaluk@ispras.ru, andrew@aj.id.au, kbastian@mail.uni-paderborn.de,
 bleal@redhat.com, jcmvbkbc@gmail.com, marcandre.lureau@redhat.com,
 mark.cave-ayland@ilande.co.uk, rad@semihalf.com, aurelien@aurel32.net,
 david@redhat.com, armbru@redhat.com, joel@jms.id.au, berrange@redhat.com
Subject: [PATCH v1] tests/avocado: Add LoongArch machine start test
Date: Thu, 11 May 2023 20:21:35 +0800
Message-Id: <20230511122136.1601475-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxRrXQ3VxkTspVAA--.21477S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAF45XrWfJryxJFWkGw4Durg_yoW5uw45pr
 4jkr15GrZ7AFs7Zrnagas5ury8Xa1kuFy7JF12yrnY9F4DAw10gF1Ykw1xZrWqqaykua4S
 9rykZw4fWa1xJFJanT9S1TB71UUUUbJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bcxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF
 6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8V
 WrMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8
 ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr
 0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUUGjg7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add a new test in tests/avocado to check LoongArch virt machine start.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 MAINTAINERS                              |  1 +
 tests/avocado/machine_loongarch_start.py | 68 ++++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 tests/avocado/machine_loongarch_start.py

diff --git a/MAINTAINERS b/MAINTAINERS
index f757369373..d3b11ac056 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -245,6 +245,7 @@ M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
 S: Maintained
 F: target/loongarch/
 F: tests/tcg/loongarch64/
+F: tests/avocado/machine_loongarch_start.py
 
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
diff --git a/tests/avocado/machine_loongarch_start.py b/tests/avocado/machine_loongarch_start.py
new file mode 100644
index 0000000000..fa5dc5c49d
--- /dev/null
+++ b/tests/avocado/machine_loongarch_start.py
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# LoongArch virt start test.
+#
+# Copyright (c) 2023 Loongson Technology Corporation Limited
+#
+
+import os
+import tempfile
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import wait_for_console_pattern
+
+class LoongArchMachine(QemuSystemTest):
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    timeout = 120
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    dmesg_clear_count = 1
+    def clear_guest_dmesg(self):
+        exec_command_and_wait_for_pattern(self, 'dmesg -c > /dev/null; '
+                    'echo dm_clear\ ' + str(self.dmesg_clear_count),
+                    'dm_clear ' + str(self.dmesg_clear_count))
+        self.dmesg_clear_count += 1
+
+    def test_loongarch64_devices(self):
+
+        """
+        :avocado: tags=arch:loongarch64
+        :avocado: tags=machine:virt
+        """
+
+        kernel_url = ('https://github.com/yangxiaojuan-loongson/qemu-binary/'
+                      'releases/download/binary-files/vmlinuz.efi')
+        kernel_hash = '951b485b16e3788b6db03a3e1793c067009e31a2'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        initrd_url = ('https://github.com/yangxiaojuan-loongson/qemu-binary/'
+                      'releases/download/binary-files/ramdisk')
+        initrd_hash = 'c67658d9b2a447ce7db2f73ba3d373c9b2b90ab2'
+        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+
+        bios_url = ('https://github.com/yangxiaojuan-loongson/qemu-binary/'
+                    'releases/download/binary-files/QEMU_EFI.fd')
+        bios_hash = ('dfc1bfba4853cd763b9d392d0031827e8addbca8')
+        bios_path = self.fetch_asset(bios_url, asset_hash=bios_hash)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'root=/dev/ram rdinit=/sbin/init console=ttyS0,115200')
+        self.vm.add_args('-nographic',
+                         '-smp', '4',
+                         '-m', '1024',
+                         '-cpu', 'la464',
+                         '-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-bios', bios_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        self.wait_for_console_pattern('Run /sbin/init as init process')
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                          'processor		: 3')
-- 
2.31.1


