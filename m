Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553DB49F1FD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:49:48 +0100 (CET)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDIGh-00020L-Cf
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:49:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIBa-0007Q6-8O
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:31 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40278 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIBX-0002KD-QP
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:29 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S3; 
 Fri, 28 Jan 2022 11:44:23 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 01/30] target/loongarch: Add system emulation
 introduction
Date: Thu, 27 Jan 2022 22:43:43 -0500
Message-Id: <20220128034412.1262452-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw13uw1UGFy8JF1furWDtwb_yoWxXrWxpr
 y3ZryxKr48try7Jr4DJr15JF1Utws3A3W3JFyfJry8CryDur18X34UtryktFyDX345tw1a
 qr1kJr4UK3WUAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 docs/system/loongarch/loongson3.rst | 78 +++++++++++++++++++++++++++++
 target/loongarch/README             | 28 +++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 docs/system/loongarch/loongson3.rst

diff --git a/docs/system/loongarch/loongson3.rst b/docs/system/loongarch/loongson3.rst
new file mode 100644
index 0000000000..1840ec5e75
--- /dev/null
+++ b/docs/system/loongarch/loongson3.rst
@@ -0,0 +1,78 @@
+loongson3-ls7a generic platform (``loongson3-ls7a``)
+====================================================
+
+Use ``loongson3-ls7a`` machine type to emulate the loongson7a board.
+There are some devices on loongson7a board, such as RTC device,
+IOAPIC device, ACPI device and so on.
+
+Supported devices
+-----------------
+
+The ``loongson3-ls7a`` machine supports:
+- PCI/PCIe devices
+- Memory device
+- CPU device
+- Ls7a host bridge
+- Ls7a RTC device
+- Ls7a IOAPIC device
+- Ls7a ACPI device
+- Fw_cfg device
+- CPU device. Type: Loongson-3A5000.
+
+CPU and machine Type
+--------------------
+
+The ``qemu-system-loongarch64`` provides emulation for loongson7a
+machine. You can specify the machine type ``loongson3-ls7a`` and
+cpu type ``Loongson-3A5000``.
+
+Boot options
+------------
+
+Now the ``loongson3-ls7a`` machine can start using -bios parameter:
+
+.. code-block:: bash
+
+  $ qemu-system-loongarch64 -M loongson3-ls7a -cpu Loongson-3A5000 -smp 2 -m 1G \
+      -display none -serial stdio \
+      -bios loongarch_bios.bini
+
+Info mtree
+----------
+address-space: memory
+  0000000000000000-ffffffffffffffff (prio 0, i/o): system
+    0000000000000000-ffffffffffffffff (prio 0, i/o): ls7a_mmio
+      00000000000a0000-00000000000bffff (prio 1, i/o): cirrus-lowmem-container
+        00000000000a0000-00000000000bffff (prio 0, i/o): cirrus-low-memory
+    0000000000000000-000000000fffffff (prio 0, ram): alias loongarch.lowram @loongarch.ram 0000000000000000-000000000fffffff
+    0000000010000000-00000000100000ff (prio 0, i/o): loongarch_pch_pic.reg32_part1
+    0000000010000100-000000001000039f (prio 0, i/o): loongarch_pch_pic.reg8
+    00000000100003a0-0000000010000fff (prio 0, i/o): loongarch_pch_pic.reg32_part2
+    000000001001041c-000000001001041f (prio -1000, i/o): pci-dma-cfg
+    0000000010013ffc-0000000010013fff (prio -1000, i/o): mmio fallback 1
+    00000000100d0000-00000000100d00ff (prio 0, i/o): ls7a_pm
+      00000000100d000c-00000000100d0013 (prio 0, i/o): acpi-evt
+      00000000100d0014-00000000100d0017 (prio 0, i/o): acpi-cnt
+      00000000100d0018-00000000100d001b (prio 0, i/o): acpi-tmr
+      00000000100d0028-00000000100d002f (prio 0, i/o): acpi-gpe0
+      00000000100d0030-00000000100d0033 (prio 0, i/o): acpi-reset
+    00000000100d0100-00000000100d01ff (prio 0, i/o): ls7a_rtc
+    0000000018000000-0000000018003fff (prio 0, i/o): alias isa-io @io 0000000000000000-0000000000003fff
+    0000000018004000-000000001800ffff (prio 0, i/o): alias ls7a-pci-io @io 0000000000004000-000000000000ffff
+    000000001a000000-000000001bffffff (prio 0, i/o): ls7a_pci_conf
+    000000001c000000-000000001c3fffff (prio 0, rom): loongarch.bios
+    000000001e020000-000000001e020001 (prio 0, i/o): fwcfg.ctl
+    000000001e020008-000000001e02000f (prio 0, i/o): fwcfg.data
+    000000001fe001e0-000000001fe001e7 (prio 0, i/o): serial
+    0000000020000000-0000000027ffffff (prio 0, i/o): pcie-mmcfg-mmio
+    000000002ff00000-000000002ff00007 (prio 0, i/o): loongarch_pch_msi
+    0000000090000000-000000017fffffff (prio 0, ram): alias loongarch.highmem @loongarch.ram 0000000010000000-00000000ffffffff
+
+address-space: IOCSR
+  0000000000000000-ffffffffffffffff (prio 0, i/o): iocsr
+    0000000000000008-0000000000000427 (prio 0, i/o): iocsr_misc
+    0000000000001000-00000000000010ff (prio 0, i/o): loongarch_ipi
+    0000000000001400-00000000000014bf (prio 0, i/o): loongarch_extioi.nodetype
+    00000000000014c0-000000000000167f (prio 0, i/o): loongarch_extioi.ipmap_enable
+    0000000000001680-0000000000001bff (prio 0, i/o): loongarch_extioi.bounce_coreisr
+    0000000000001c00-0000000000001cff (prio 0, i/o): loongarch_extioi.coremap
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


