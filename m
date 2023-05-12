Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810D1700097
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 08:33:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxMLL-00088c-Or; Fri, 12 May 2023 02:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pxML9-00086P-Ji
 for qemu-devel@nongnu.org; Fri, 12 May 2023 02:33:21 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pxML6-0004bf-83
 for qemu-devel@nongnu.org; Fri, 12 May 2023 02:33:19 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxX+uo3V1ksgcIAA--.13777S3;
 Fri, 12 May 2023 14:33:12 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axgjil3V1kPRBXAA--.22618S2; 
 Fri, 12 May 2023 14:33:09 +0800 (CST)
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
Subject: [PATCH v2] tests/avocado: Add LoongArch machine start test
Date: Fri, 12 May 2023 14:33:05 +0800
Message-Id: <20230512063305.1629046-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axgjil3V1kPRBXAA--.22618S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAF47tFWUCw45Ar1xXFW8JFb_yoW5uw4fpr
 4jkr15Gr97AFs7Zrnag3sY9FyrXa1kCFy7JF42yrsY9F4DAr40g3WYkw1xZFWqqa1kWa4S
 grykZw4fW3W8JFJanT9S1TB71UUUUbJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bcAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jw0_GFyle2I262IYc4CY6c8Ij28IcVAaY2xG8wAq
 jxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6c
 x26rWlOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q
 6r43MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
 Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2I
 x0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
 8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
 0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU18nYUUUUU
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 MAINTAINERS                        |  1 +
 tests/avocado/machine_loongarch.py | 68 ++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 tests/avocado/machine_loongarch.py

diff --git a/MAINTAINERS b/MAINTAINERS
index f757369373..4c0d37a1aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -245,6 +245,7 @@ M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
 S: Maintained
 F: target/loongarch/
 F: tests/tcg/loongarch64/
+F: tests/avocado/machine_loongarch.py
 
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
diff --git a/tests/avocado/machine_loongarch.py b/tests/avocado/machine_loongarch.py
new file mode 100644
index 0000000000..e8fcb578d7
--- /dev/null
+++ b/tests/avocado/machine_loongarch.py
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# LoongArch virt test.
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


