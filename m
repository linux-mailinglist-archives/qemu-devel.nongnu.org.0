Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E23B53269C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 11:39:17 +0200 (CEST)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntR0W-0001G0-Aa
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 05:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ntQC2-0000dx-RS
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:47:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58602 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ntQBz-0006pJ-E1
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:47:06 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axqti8lIxi2v8gAA--.27451S20; 
 Tue, 24 May 2022 16:18:34 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca
Subject: [PATCH v5 18/43] target/loongarch: Add system emulation introduction
Date: Tue, 24 May 2022 16:17:39 +0800
Message-Id: <20220524081804.3608101-19-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220524081804.3608101-1-yangxiaojuan@loongson.cn>
References: <20220524081804.3608101-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axqti8lIxi2v8gAA--.27451S20
X-Coremail-Antispam: 1UD129KBjvJXoWxGry5Cw45uryrtrWDtrW5ZFb_yoWrKw1rpF
 nxu34fKrWUXry7Crsag34xWr1rJrn3Gr17WFn2yw1Fkr1qy34qgrn5ta48XFy7GayrAFyj
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
index fc3c02f0e5..96e5a3218d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1123,6 +1123,14 @@ F: include/hw/net/lasi_82596.h
 F: include/hw/pci-host/dino.h
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


