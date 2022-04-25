Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9A150DD16
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:47:20 +0200 (CEST)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivJP-00081b-Ga
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niukJ-00086w-0k
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:03 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39344 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niukG-0001Hh-HK
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:02 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S20; 
 Mon, 25 Apr 2022 17:10:48 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/43] target/loongarch: Add system emulation introduction
Date: Mon, 25 Apr 2022 17:10:02 +0800
Message-Id: <20220425091027.2877892-19-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S20
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUXF4UKr15Kw4DCr17KFg_yoWrKFW5pF
 nxu34fKrWUXry7Crs3W34xWr1rGrn3Gr17WFn2yw1Fkr1qy34qgrn5ta48XFy7G348AFyj
 vry8Cr1UWa1UWwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                         |  8 +++++
 docs/system/loongarch/loongson3.rst | 41 ++++++++++++++++++++++
 target/loongarch/README             | 54 +++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 docs/system/loongarch/loongson3.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b5377d353..6361c24b3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1123,6 +1123,14 @@ F: hw/net/*i82596*
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
index 0000000000..fa3acd01c0
--- /dev/null
+++ b/docs/system/loongarch/loongson3.rst
@@ -0,0 +1,41 @@
+:orphan:
+
+==========================================
+loongson3 virt generic platform (``virt``)
+==========================================
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
+Now the ``virt`` machine can run test program in ELF format and the
+method of compiling is in target/loongarch/README.
+
+.. code-block:: bash
+
+  $ qemu-system-loongarch64 -machine virt -m 4G -cpu Loongson-3A5000 \
+      -smp 1 -kernel hello -monitor none -display none \
+      -chardev file,path=hello.out,id=output -serial chardev:output
diff --git a/target/loongarch/README b/target/loongarch/README
index de141c1a58..4dcd0f1682 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -8,3 +8,57 @@
 
   We can get the latest loongarch documents at https://github.com/loongson/LoongArch-Documentation/tags.
 
+
+- System emulation
+
+  Mainly emulate a virt 3A5000 board and ls7a bridge that is not exactly the same as the host.
+  3A5000 support multiple interrupt cascading while here we just emulate the extioi interrupt
+  cascading. LS7A1000 host bridge support multiple devices, such as sata, gmac, uart, rtc
+  and so on. But we just realize the rtc. Others use the qemu common devices. It does not affect
+  the general use. We also introduced the emulation of devices at docs/system/loongarch/loongson3.rst.
+
+  This version only supports running binary files in ELF format, and does not depend on BIOS and kernel file.
+  You can compile the test program with 'make & make check-tcg' and run the test case with the following command:
+
+  1. Install LoongArch cross-tools on X86 machines.
+
+    Download cross-tools.
+
+      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20211202-cross-tools.tar.xz
+
+      tar -vxf loongarch64-clfs-20211202-cross-tools.tar.xz -C /opt
+
+    Config cross-tools env.
+
+      . setenv.sh
+
+      setenv.sh:
+
+          #!/bin/sh
+          set -x
+          CC_PREFIX=/opt/cross-tools
+
+          export PATH=$CC_PREFIX/bin:$PATH
+          export LD_LIBRARY_PATH=$CC_PREFIX/lib:$LD_LIBRARY_PATH
+          export LD_LIBRARY_PATH=$CC_PREFIX/loongarch64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH
+          set +x
+
+  2. Test tests/tcg/multiarch.
+
+    ./configure --disable-rdma --disable-pvrdma --prefix=/usr  \
+            --target-list="loongarch64-softmmu"  \
+            --disable-libiscsi --disable-libnfs --disable-libpmem \
+            --disable-glusterfs --enable-libusb --enable-usb-redir \
+            --disable-opengl --disable-xen --enable-spice --disable-werror \
+            --enable-debug --disable-capstone --disable-kvm --enable-profiler
+
+    cd  build/
+
+    make && make check-tcg
+
+    or
+
+    ./build/qemu-system-loongarch64 -machine virt -m 4G -cpu Loongson-3A5000 -smp 1 -kernel build/tests/tcg/loongarch64-softmmu/hello -monitor none -display none -chardev file,path=hello.out,id=output -serial chardev:output
+
+- Note.
+  We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
-- 
2.31.1


