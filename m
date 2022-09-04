Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D15AC349
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:45:30 +0200 (CEST)
Received: from localhost ([::1]:60690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUkJs-0003EM-E1
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1T-0008BZ-Ug
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1R-00031p-Hb
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id t14so200512wrx.8
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yo8BLXkIhvlRYA2tzKsR9l2OkcjmyffGdEMrU1eo4vI=;
 b=EZet259mbtt7K+D7MgD7jnq3Cfu8cT0glqzrt75Hrlcy3TJSLgeZAffR6fjq249L7O
 dokyW1qazyEfpa9IeQ55KkI83zJgbS9xd9Ey6+IDrLVcMs/QxSiHsO3Wsa2QWYz0TQ8J
 bwoXrwyNVfxzNNGKfS2RGbgGBexEw+ya5ZdWsk2FZdzzPKim2Mf1F6ru6TLeDEi9qCcm
 cbwKoW4SskSaFFWE8DI4eFkOGtMyu7jqDDqjQ9bJgV+i/xCOD6kQUyIKQYvqUFuoAHLE
 Cg24k0fiFs+Rlp6txUM49qR3TCdPo65Uoy6leiJuHOJYnsOs5yAeK3al+tlxmkaxfd0n
 eGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yo8BLXkIhvlRYA2tzKsR9l2OkcjmyffGdEMrU1eo4vI=;
 b=6XJ92J9KRTl6+Mqh6DNrOZt59k/UHY4tFdNRV27ccBmZqlW7Jq8Dr3e7F2M7Xhunt8
 qk4m9am/4O8UW8+FHFHIT9pKX5bOWjrEqwZlU9YsZFZO5T39uB3rN0Xls4naUl9f697i
 W8uU4H8uiu0V+4AbI5LFbqEiqGQI26PeHny0cf+wM+32rIbM51LJqAnf5dYBI6CtXlT/
 2TZ0oI7ZnKjSYVB6RmcHIYv4VE1bViO3jG5zSRzfX+WyiEFGVolR3eIfS+d/JCYRiJ6p
 UP/kVySR7J1d4CY9y/WBdJ0tXEg5nre9hABwt6HUzXaFriMLGP0vf0g/tZQq6ahwrsyT
 O+/g==
X-Gm-Message-State: ACgBeo15PxLEDUALMQzGDQKU8F70acTRQJivFg1FtSMf6AJ3SzAszcts
 tFEi1AfVxT3UJXAqMVszGz/6+SrD5nw=
X-Google-Smtp-Source: AA6agR4MaEP3dhqppXdvS4sqckgbTjZB0cJYh1ywgUKVQa9rRWwXaKuakwKXRci8z5IgraILOlyTdA==
X-Received: by 2002:a5d:59a6:0:b0:226:fdaf:3ece with SMTP id
 p6-20020a5d59a6000000b00226fdaf3ecemr7009330wrr.444.1662276383754; 
 Sun, 04 Sep 2022 00:26:23 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003a62052053csm17777955wms.18.2022.09.04.00.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:23 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/11] docs/system: openrisc: Add OpenRISC documentation
Date: Sun,  4 Sep 2022 08:26:07 +0100
Message-Id: <20220904072607.44275-12-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 docs/system/openrisc/cpu-features.rst | 15 ++++++
 docs/system/openrisc/emulation.rst    | 17 +++++++
 docs/system/openrisc/or1k-sim.rst     | 43 ++++++++++++++++
 docs/system/openrisc/virt.rst         | 50 +++++++++++++++++++
 docs/system/target-openrisc.rst       | 71 +++++++++++++++++++++++++++
 docs/system/targets.rst               |  1 +
 6 files changed, 197 insertions(+)
 create mode 100644 docs/system/openrisc/cpu-features.rst
 create mode 100644 docs/system/openrisc/emulation.rst
 create mode 100644 docs/system/openrisc/or1k-sim.rst
 create mode 100644 docs/system/openrisc/virt.rst
 create mode 100644 docs/system/target-openrisc.rst

diff --git a/docs/system/openrisc/cpu-features.rst b/docs/system/openrisc/cpu-features.rst
new file mode 100644
index 0000000000..aeb65e22ff
--- /dev/null
+++ b/docs/system/openrisc/cpu-features.rst
@@ -0,0 +1,15 @@
+CPU Features
+============
+
+The QEMU emulation of the OpenRISC architecture provides following built in
+features.
+
+- Shadow GPRs
+- MMU TLB with 128 entries, 1 way
+- Power Management (PM)
+- Programmable Interrupt Controller (PIC)
+- Tick Timer
+
+These features are on by default and the presence can be confirmed by checking
+the contents of the Unit Presence Register (``UPR``) and CPU Configuration
+Register (``CPUCFGR``).
diff --git a/docs/system/openrisc/emulation.rst b/docs/system/openrisc/emulation.rst
new file mode 100644
index 0000000000..0af898ab20
--- /dev/null
+++ b/docs/system/openrisc/emulation.rst
@@ -0,0 +1,17 @@
+OpenRISC 1000 CPU architecture support
+======================================
+
+QEMU's TCG emulation includes support for the OpenRISC or1200 implementation of
+the OpenRISC 1000 cpu architecture.
+
+The or1200 cpu also has support for the following instruction subsets:
+
+- ORBIS32 (OpenRISC Basic Instruction Set)
+- ORFPX32 (OpenRISC Floating-Point eXtension)
+
+In addition to the instruction subsets the QEMU TCG emulation also has support
+for most Class II (optional) instructions.
+
+For information on all OpenRISC instructions please refer to the latest
+architecture manual available on the OpenRISC website in the
+`OpenRISC Architecture <https://openrisc.io/architecture>`_ section.
diff --git a/docs/system/openrisc/or1k-sim.rst b/docs/system/openrisc/or1k-sim.rst
new file mode 100644
index 0000000000..ef10439737
--- /dev/null
+++ b/docs/system/openrisc/or1k-sim.rst
@@ -0,0 +1,43 @@
+Or1ksim board
+=============
+
+The QEMU Or1ksim machine emulates the standard OpenRISC board simulator which is
+also the standard SoC configuration.
+
+Supported devices
+-----------------
+
+ * 16550A UART
+ * ETHOC Ethernet controller
+ * SMP (OpenRISC multicore using ompic)
+
+Boot options
+------------
+
+The Or1ksim machine can be started using the ``-kernel`` and ``-initrd`` options
+to load a Linux kernel and optional disk image.
+
+.. code-block:: bash
+
+  $ qemu-system-or1k -cpu or1220 -M or1k-sim -nographic \
+        -kernel vmlinux \
+        -initrd initramfs.cpio.gz \
+        -m 128
+
+Linux guest kernel configuration
+""""""""""""""""""""""""""""""""
+
+The 'or1ksim_defconfig' for Linux openrisc kernels includes the right
+drivers for the or1ksim machine.  If you would like to run an SMP system
+choose the 'simple_smp_defconfig' config.
+
+Hardware configuration information
+""""""""""""""""""""""""""""""""""
+
+The ``or1k-sim`` board automatically generates a device tree blob ("dtb")
+which it passes to the guest. This provides information about the
+addresses, interrupt lines and other configuration of the various devices
+in the system.
+
+The location of the DTB will be passed in register ``r3`` to the guest operating
+system.
diff --git a/docs/system/openrisc/virt.rst b/docs/system/openrisc/virt.rst
new file mode 100644
index 0000000000..2fe61ac942
--- /dev/null
+++ b/docs/system/openrisc/virt.rst
@@ -0,0 +1,50 @@
+'virt' generic virtual platform
+===============================
+
+The ``virt`` board is a platform which does not correspond to any
+real hardware; it is designed for use in virtual machines.
+It is the recommended board type if you simply want to run
+a guest such as Linux and do not care about reproducing the
+idiosyncrasies and limitations of a particular bit of real-world
+hardware.
+
+Supported devices
+-----------------
+
+ * PCI/PCIe devices
+ * 8 virtio-mmio transport devices
+ * 16550A UART
+ * Goldfish RTC
+ * SiFive Test device for poweroff and reboot
+ * SMP (OpenRISC multicore using ompic)
+
+Boot options
+------------
+
+The virt machine can be started using the ``-kernel`` and ``-initrd`` options
+to load a Linux kernel and optional disk image. For example:
+
+.. code-block:: bash
+
+  $ qemu-system-or1k -cpu or1220 -M or1k-sim -nographic \
+        -device virtio-net-device,netdev=user -netdev user,id=user,net=10.9.0.1/24,host=10.9.0.100 \
+        -device virtio-blk-device,drive=d0 -drive file=virt.qcow2,id=d0,if=none,format=qcow2 \
+        -kernel vmlinux \
+        -initrd initramfs.cpio.gz \
+        -m 128
+
+Linux guest kernel configuration
+""""""""""""""""""""""""""""""""
+
+The 'virt_defconfig' for Linux openrisc kernels includes the right drivers for
+the ``virt`` machine.
+
+Hardware configuration information
+""""""""""""""""""""""""""""""""""
+
+The ``virt`` board automatically generates a device tree blob ("dtb") which it
+passes to the guest. This provides information about the addresses, interrupt
+lines and other configuration of the various devices in the system.
+
+The location of the DTB will be passed in register ``r3`` to the guest operating
+system.
diff --git a/docs/system/target-openrisc.rst b/docs/system/target-openrisc.rst
new file mode 100644
index 0000000000..22cb2217a6
--- /dev/null
+++ b/docs/system/target-openrisc.rst
@@ -0,0 +1,71 @@
+.. _OpenRISC-System-emulator:
+
+OpenRISC System emulator
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+QEMU can emulate 32-bit OpenRISC CPUs using the ``qemu-system-or1k`` executable.
+
+OpenRISC CPUs are generally built into "system-on-chip" (SoC) designs that run
+on FPGAs.  These SoCs are based on the same core architecture as the or1ksim
+(the original OpenRISC instruction level simulator) which QEMU supports. For
+this reason QEMU does not need to support many different boards to support the
+OpenRISC hardware ecosystem.
+
+The OpenRISC CPU supported by QEMU is the ``or1200``, it supports an MMU and can
+run linux.
+
+Choosing a board model
+======================
+
+For QEMU's OpenRISC system emulation, you must specify which board model you
+want to use with the ``-M`` or ``--machine`` option; the default machine is
+``or1k-sim``.
+
+If you intend to boot Linux, it is possible to have a single kernel image that
+will boot on any of the QEMU machines. To do this one would compile all required
+drivers into the kernel. This is possible because QEMU will create a device tree
+structure that describes the QEMU machine and pass a pointer to the structure to
+the kernel.  The kernel can then use this to configure itself for the machine.
+
+However, typically users will have specific firmware images for a specific machine.
+
+If you already have a system image or a kernel that works on hardware and you
+want to boot with QEMU, check whether QEMU lists that machine in its ``-machine
+help`` output. If it is listed, then you can probably use that board model. If
+it is not listed, then unfortunately your image will almost certainly not boot
+on QEMU. (You might be able to extract the filesystem and use that with a
+different kernel which boots on a system that QEMU does emulate.)
+
+If you don't care about reproducing the idiosyncrasies of a particular
+bit of hardware, such as small amount of RAM, no PCI or other hard disk, etc.,
+and just want to run Linux, the best option is to use the ``virt`` board. This
+is a platform which doesn't correspond to any real hardware and is designed for
+use in virtual machines. You'll need to compile Linux with a suitable
+configuration for running on the ``virt`` board. ``virt`` supports PCI, virtio
+and large amounts of RAM.
+
+Board-specific documentation
+============================
+
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
+
+.. toctree::
+   :maxdepth: 1
+
+   openrisc/or1k-sim
+   openrisc/virt
+
+Emulated CPU architecture support
+=================================
+
+.. toctree::
+   openrisc/emulation
+
+OpenRISC CPU features
+=====================
+
+.. toctree::
+   openrisc/cpu-features
diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 9dcd95dd84..224fadae71 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -21,6 +21,7 @@ Contents:
    target-m68k
    target-mips
    target-ppc
+   target-openrisc
    target-riscv
    target-rx
    target-s390x
-- 
2.37.2


