Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E701D4C3FEB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 09:17:07 +0100 (CET)
Received: from localhost ([::1]:45104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNVml-0004Wf-0Y
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 03:17:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nNVZi-00080j-NR
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:03:41 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41746 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nNVZK-0002R7-05
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:03:38 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxqMg8jRhiw9UGAA--.8228S3;
 Fri, 25 Feb 2022 16:03:11 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 01/29] target/loongarch: Add system emulation
 introduction
Date: Fri, 25 Feb 2022 03:02:40 -0500
Message-Id: <20220225080308.1405-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
References: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxqMg8jRhiw9UGAA--.8228S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUur48uw17ZF1fAF45GFg_yoWrXFy3pr
 nxua4fKr48Gr9rArsagFy3Xr15trn3Cr17Xa1xAry09FZrAr1vqr1rt3WktFy7C34rCFyY
 qry8Gr4UWa15W3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 MAINTAINERS                         |  8 +++++++
 docs/system/loongarch/loongson3.rst | 37 +++++++++++++++++++++++++++++
 target/loongarch/README             | 28 ++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 docs/system/loongarch/loongson3.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 568fb731f7..df3d738d17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1115,6 +1115,14 @@ F: hw/net/*i82596*
 F: include/hw/net/lasi_82596.h
 F: pc-bios/hppa-firmware.img
 
+LoongArch Machines
+------------------
+Virt
+M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
+M: Song Gao <gaosong@loongson.cn>
+S: Maintained
+F: docs/system/loongarch/loongson3.rst
+
 M68K Machines
 -------------
 an5206
diff --git a/docs/system/loongarch/loongson3.rst b/docs/system/loongarch/loongson3.rst
new file mode 100644
index 0000000000..367fff9d9d
--- /dev/null
+++ b/docs/system/loongarch/loongson3.rst
@@ -0,0 +1,37 @@
+loongson3 virt generic platform (``virt``)
+====================================================
+
+The ``virt`` machine use gpex host bridge, and there are some
+emulated devices on virt board, such as loongson7a RTC device,
+IOAPIC device, ACPI device and so on.
+
+Supported devices
+-----------------
+
+The ``virt`` machine supports:
+- Gpex host bridge
+- Ls7a RTC device
+- Ls7a IOAPIC device
+- Ls7a ACPI device
+- Fw_cfg device
+- PCI/PCIe devices
+- Memory device
+- CPU device. Type: Loongson-3A5000.
+
+CPU and machine Type
+--------------------
+
+The ``qemu-system-loongarch64`` provides emulation for virt
+machine. You can specify the machine type ``virt`` and
+cpu type ``Loongson-3A5000``.
+
+Boot options
+------------
+
+Now the ``virt`` machine can start using -bios parameter:
+
+.. code-block:: bash
+
+  $ qemu-system-loongarch64 -M virt -cpu Loongson-3A5000 -smp 2 -m 1G \
+      -display none -serial stdio \
+      -bios loongarch_bios.bin
diff --git a/target/loongarch/README b/target/loongarch/README
index 383db6cc15..de44d39561 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -71,6 +71,34 @@
       ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
       ...
 
+- System emulation
+
+  Mainly emulate a virt 3A5000 board and ls7a bridge that is not exactly the same as the host.
+  3A5000 support multiple interrupt cascading while here we just emulate the extioi interrupt
+  cascading. LS7A1000 host bridge support multiple devices, such as sata, gmac, uart, rtc
+  and so on. But we just realize the rtc. Others use the qemu common devices. It does not affect
+  the general use. We also introduced the emulation of devices at docs/system/loongarch/loongson3.rst.
+
+  You can compile the binaries by youself or just get all required binaries from the github for testing.
+
+  1.Download kernel and the cross-tools.(vmlinux)
+
+      https://github.com/loongson/linux/tree/loongarch-next
+      https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20211202-cross-tools.tar.xz
+
+  2.Download uefi code.(loongarch_bios.bin)
+
+      https://github.com/loongson/edk2/tree/LoongArch
+      https://github.com/loongson/edk2-platforms
+
+  3.Download the clfs-system and make a ramdisk with busybox.(ramdisk)
+
+  4.Run with command,eg:
+
+   ./build/qemu-system-loongarch64 -m 4G -smp 4 --cpu Loongson-3A5000 --machine loongson3-ls7a -kernel ./vmlinux -initrd ./ramdisk  -append "root=/dev/ram console=ttyS0,115200 rdinit=/sbin/init loglevel=8" -monitor tcp::4000,server,nowait -nographic
+
+All binaries can get from here directly:
+    git clone https://github.com/yangxiaojuan-loongson/qemu-binary
 
 - Note.
   We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
-- 
2.27.0


