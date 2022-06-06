Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A053F284
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:25:00 +0200 (CEST)
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyM5f-0001Fh-PL
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwK-0001gb-FS
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:16 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwE-0003xp-FZ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:13 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 123so3823775pgb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDpcSfPbAq8nwtiRx5EO7FVR2edeY3xIlH+Px2B17Z4=;
 b=ZjX+5/ACbJ+Q35KFUpRuq5ddD2aK82Y9Kqg3x73ahqUZ+YYrf9rIgGCuSdnLcjdSBS
 4KkbY47P9A+OVHdqvoNkBrZlQGPKXgwqPOiiKXAC+V1ebHdGBMTkLqwVQAmpAekO/EkF
 efvpXgaiwPhZmSOIGWjf/LN78/qQ6IYBOGhupedJnigsluAekCEtAYTsNgP+xc8C74H0
 CS9v4HIk590EYtGEQMhzCwyf1jJ5M+M2TaGIaellZGRag0QrAK7xKbh6dRL4xyt1yBQe
 MeyVeQjRq0FgSUHupLobl0PClvZPeItjeiKO5ihnoKZiP5gik4OkuUqYsZsjJGdiEtlm
 apSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDpcSfPbAq8nwtiRx5EO7FVR2edeY3xIlH+Px2B17Z4=;
 b=HEY1GhmRM3MPRqZivTIXiMTjxq4zE5UJ5qbP1hQfEChlsZFlUfV5v11ZoYNzvo4U+r
 1DpHKK1XEz6ja0NouspzQfjV56c29Xyy1t3YTk8FzvApCLw6aTF7tXb1EQZTAUX77j/6
 p6tRX1aj1MIIbOXBDUOrfBz2MFhrQC2SbP4mkhzZHsecpugg8a+e61oPskKZiBhWMk2A
 4u7BucPOftPOigoNX/pqTO61VQ0NR20S4Zt7ReLcC2wiU7LtalK1dEGawIWLl35gPifC
 aigzTMev81OoXXsZvJczuikurKa8QucevNcfBqruaBkcuyCJZv0rrxHYYRMjxNOkxRcJ
 9TrA==
X-Gm-Message-State: AOAM5329UdZ7GfmkIo3v59RmulGpGD5SfjaJm0Pj1PjWIZhX2b8VUYXa
 DxrWevA9RCQtxcSx+RcOwf8UQJO/XSTuew==
X-Google-Smtp-Source: ABdhPJyVJd6gusuNcgz0ruLqS+7T4BemfHceFQeCyhQq2YXJYfQ9DRLv0gCQCaPxe6d/duw/eVOnDw==
X-Received: by 2002:a65:62d0:0:b0:3fa:c6aa:6901 with SMTP id
 m16-20020a6562d0000000b003fac6aa6901mr22573282pgv.314.1654557308887; 
 Mon, 06 Jun 2022 16:15:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 18/43] target/loongarch: Add system emulation introduction
Date: Mon,  6 Jun 2022 16:14:25 -0700
Message-Id: <20220606231450.448443-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-19-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/loongarch/loongson3.rst | 41 ++++++++++++++++++++++
 MAINTAINERS                         |  8 +++++
 target/loongarch/README             | 54 +++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 docs/system/loongarch/loongson3.rst

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
diff --git a/MAINTAINERS b/MAINTAINERS
index 319a5d805a..e3f875071a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1122,6 +1122,14 @@ F: include/hw/net/lasi_82596.h
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
2.34.1


