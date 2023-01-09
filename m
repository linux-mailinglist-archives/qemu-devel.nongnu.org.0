Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB77662C1E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:05:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvZ3-00081n-9m; Mon, 09 Jan 2023 12:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pEvYm-0007rI-Rp
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:03:45 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pEvYk-0007gc-9R
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:03:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j7so3870469wrn.9
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vNGDkXlHTP33TpyjFRprNS8SOHYdp9qTngXO8OmT7UI=;
 b=fLbp0VyNC8eWnMq13Q8OR2CBJunqi5P0AWFdWj3Yq/gVWST3Obk3I376S2YvW3+tQu
 k1NSvSP0kUvtosWn1ySWImoavC6/cuiCONznBSfI1GTQkjgPG/OJp9iOqOLU2nRtCZzN
 DKTpAaJ7Ij2wdqCRcWP8QzdjXhbTMe4Fv1jjaT2WiIwSKB1+KMbjzw9DTa473TbNrdmd
 vanBAZzXyZ69E12BqzwScW8gKhQAujrPwppCz+0uTXP9JnY3AKv1F/Nk+ACwzjDSzLkq
 Axafy1c7dkKilAeQv5Pu4MRnN/DCSb+mozqEa4c/7QZvqKsN3iQOTurC0IEssyMyIFX/
 IyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vNGDkXlHTP33TpyjFRprNS8SOHYdp9qTngXO8OmT7UI=;
 b=EcfED4ESB30/nsSiTWeEF47rQCFzkLySOTqQ5VntBrjKjvc3T7vx4hPtSxLFEHsaaJ
 eWrK3MHtHT3Pz0Zrp6wcmQQpmCwEQ95YsSI9+4Cte39K3vRNpU9lEIRALGFaBx+ZnJUZ
 SK96EJ09i023OmMrJU5KO5dHLpbIbMpeYyJTxe5nJRGDpMX5cy1VQIIX+37i0TsZyeDE
 aTOJ9eAX2Rt5rLJBI37Y5QXNrrPfMsUuxbJMqQpX1xfL1OWZB0dAvkyXkI6S7CGuQN+Q
 M1MJ9ID6Yaqkps21CGRYKWPxoaXMPJlvp5HmG3PgKI5d4LKugiBEMpf3qYlWCqmpsL4N
 2ayg==
X-Gm-Message-State: AFqh2koqCSxfnlV/Vb182I8um2dH+2YVq1+OBD2pxzZnUpZyyh/wieLv
 XxgQWZd8ql0JxbCALpXsU3TnHA==
X-Google-Smtp-Source: AMrXdXvTk4yck9HqxuPnDjEDrlWPZUcTdcNswJcqGZHlS/j5W44eo0GJgXVmxYCcuvEW3xyWn7y/qQ==
X-Received: by 2002:adf:de04:0:b0:29a:f48:770a with SMTP id
 b4-20020adfde04000000b0029a0f48770amr19324521wrm.40.1673283819395; 
 Mon, 09 Jan 2023 09:03:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l1-20020adfe9c1000000b00289bdda07b7sm8837321wrn.92.2023.01.09.09.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:03:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D9101FFB7;
 Mon,  9 Jan 2023 17:03:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [RFC PATCH] docs: add a proper feature overview in "About QEMU"
Date: Mon,  9 Jan 2023 17:03:23 +0000
Message-Id: <20230109170323.3796306-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I decide to do this because I was looking for the best place to add a
reference to a document on semihosting and there didn't seem to be
an obvious place to do this. To do this I took the original pre-amble
to the about index and moved it to its own section, expanding the
description and giving a quick high level overview of some of the key
feature of QEMU.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/features.rst       | 236 ++++++++++++++++++++++++++++++++++
 docs/about/index.rst          |  16 +--
 docs/devel/tcg-plugins.rst    |   2 +
 docs/system/arm/emulation.rst |   2 +
 docs/system/index.rst         |   2 +
 docs/system/multi-process.rst |   2 +
 docs/tools/index.rst          |   2 +
 docs/user/index.rst           |   2 +
 8 files changed, 249 insertions(+), 15 deletions(-)
 create mode 100644 docs/about/features.rst

diff --git a/docs/about/features.rst b/docs/about/features.rst
new file mode 100644
index 0000000000..037234c10a
--- /dev/null
+++ b/docs/about/features.rst
@@ -0,0 +1,236 @@
+Features
+========
+
+Virtualisation
+--------------
+
+The most common use case for QEMU is to provide a virtual model of a
+machine (CPU, memory and emulated devices) to run a guest OS. It
+supports a number of hypervisors (known as accelerators) as well as a
+dynamic JIT known as the Tiny Code Generator (TCG) capable of
+emulating many CPUs.
+
+.. list-table:: Supported Accelerators
+  :header-rows: 1
+
+  * - Accelerator
+    - Host OS
+    - Host Architectures
+  * - KVM
+    - Linux
+    - Arm (64 bit only), MIPS, PPC, RISC-V, s390x, x86
+  * - Xen
+    - Linux (as dom0)
+    - Arm, x86
+  * - Intel HAXM (hax)
+    - Linux, Windows
+    - x86
+  * - Hypervisor Framework (hvf)
+    - MacOS
+    - x86 (64 bit only), Arm (64 bit only)
+  * - Windows Hypervisor Platform (wphx)
+    - Windows
+    - x86
+  * - NetBSD Virtual Machine Monitor (nvmm)
+    - NetBSD
+    - x86
+  * - Tiny Code Generator (tcg)
+    - Linux, other POSIX, Windows, MacOS
+    - Arm, x86, Loongarch64, MIPS, PPC, s390x, Sparc64, TCI [#tci]_
+
+.. [#tci] The Tiny Code Interpreter (TCI) can be used where there is no
+          explicit support for a processor backend. It will be even
+          slower than normal TCG guests.
+
+Related features
+~~~~~~~~~~~~~~~~
+
+System emulation provides a wide range of device models to emulate
+various hardware components you may want to add to your machine. This
+includes a wide number of VirtIO devices which are specifically tuned
+for efficient operation under virtualisation. Some of the device
+emulation can be offloaded from the main QEMU process using either
+vhost-user (for VirtIO) or :ref:`Multi-process QEMU`. If the platform
+supports it QEMU also supports directly passing devices through to
+guest VMs to eliminate the device emulation overhead. See
+:ref:`device-emulation` for more details.
+
+There is a full featured block layer allows for construction of
+complex storage typologies which can be stacked across multiple layers
+supporting redirection, networking, snapshots and migration support.
+
+The flexible ``chardev`` system allows for handling IO from character
+like devices using stdio, files, unix sockets and TCP networking.
+
+QEMU provides a number of management interfaces including a line based
+Human Monitor Protocol (HMP) that allows you to dynamically add and
+remove devices as well as introspect the system state. The QEMU
+Monitor Protocol (QMP) is a well defined, versioned, machine usable
+API that presents a rich interface to other tools to create, control
+and manage Virtual Machines. This is the interface used by higher
+level tools interfaces such as `Virt Manager
+<https://virt-manager.org/>`_ using the `libvirt framework
+<https://libvirt.org>`_. Using some sort of management layer to
+configure complex QEMU setups is recommended.
+
+For the common accelerators QEMU supported debugging with its
+:ref:`gdbstub<GDB usage>` which allows users to connect GDB and debug
+system software images.
+
+See the :ref:`System Emulation` section of the manual for full details
+of how to run QEMU as a VMM.
+
+Emulation
+---------
+
+As alluded to above QEMU's Tiny Code Generator (TCG) also has the
+ability to emulate a number of CPU architectures on any supported
+platform. This can either be using full system emulation or using its
+"user mode emulation" support to run user space processes compiled for
+one CPU on another CPU.
+
+See `User Mode Emulation` for more details on running in this mode.
+
+.. list-table:: Supported Guest Architectures for Emulation
+  :widths: 30 10 10 50
+  :header-rows: 1
+
+  * - Architecture (qemu name)
+    - System
+    - User-mode
+    - Notes
+  * - Alpha
+    - Yes
+    - Yes
+    - Legacy 64 bit RISC ISA developed by DEC
+  * - Arm (arm, aarch64)
+    - Yes
+    - Yes
+    - Wide range of features, see :ref:`Arm Emulation` for details
+  * - AVR
+    - Yes
+    - No
+    - 8 bit micro controller, often used in maker projects
+  * - Cris
+    - Yes
+    - Yes
+    - Embedded RISC chip developed by AXIS
+  * - Hexagon
+    - No
+    - Yes
+    - Family of DSPs by Qualcomm
+  * - PA-RISC (hppa)
+    - Yes
+    - Yes
+    - A legacy RISC system used in HPs old minicomputers
+  * - x86 (i386, x86_64)
+    - Yes
+    - Yes
+    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
+  * - Loongarch
+    - Yes
+    - Yes
+    - A MIPs-like 64bit RISC architecture developed in China
+  * - m68k
+    - Yes
+    - Yes
+    - Motorola 68000 variants and ColdFire
+  * - Microblaze
+    - Yes
+    - Yes
+    - RISC based soft-core by Xilinx
+  * - MIPS (mips, mipsel, mips64, mips64el)
+    - Yes
+    - Yes
+    - Venerable RISC architecture originally out of Stanford University
+  * - Nios2
+    - Yes
+    - Yes
+    - 32 bit embedded soft-core by Altera
+  * - OpenRISC
+    - Yes
+    - Yes
+    - Open source RISC architecture developed by the OpenRISC community
+  * - Power (ppc, ppc64)
+    - Yes
+    - Yes
+    - A general purpose RISC architecture now managed by IBM
+  * - RISC-V
+    - Yes
+    - Yes
+    - An open standard RISC ISA maintained by RISC-V International
+  * - RX
+    - Yes
+    - No
+    - A 32 bit micro controller developed by Renesas
+  * - s390x
+    - Yes
+    - Yes
+    - A 64 bit CPU found in IBM's System Z mainframes
+  * - sh4
+    - Yes
+    - Yes
+    - A 32 bit RISC embedded CPU developed by Hitachi
+  * - SPARC (sparc, sparc64)
+    - Yes
+    - Yes
+    - A RISC ISA originally developed by Sun Microsystems
+  * - Tricore
+    - Yes
+    - No
+    - A 32 bit RISC/uController/DSP developed by Infineon
+  * - Xtensa
+    - Yes
+    - Yes
+    - A configurable 32 bit soft core now owned by Cadence
+
+Semi-hosting
+~~~~~~~~~~~~
+
+A number of guest architecture support semi-hosting which provides a
+way for guest programs to access the host system though a POSIX-like
+system call layer. This has applications for early software bring-up
+making it easy for a guest to dump data or read configuration files
+before a full operating system is implemented.
+
+Some of those guest architectures also support semi-hosting in
+user-mode making the testing of "bare-metal" micro-controller code
+easy in a user-mode environment that doesn't have a full libc port.
+
+Deterministic Execution with Record/Replay
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For system emulation QEMU offers a execution mode called ``icount``
+which allows for guest time to be purely a function of the number of
+instructions executed. Combined with snapshots and a logging of HW
+events a deterministic execution can be recorded and played back at
+will.
+
+gdbstub
+~~~~~~~
+
+Under emulation the :ref:`gdbstub<GDB usage>` is fully supported and
+takes advantage of the implementation to support unlimited breakpoints
+in the guest code. For system emulation we also support an unlimited
+number of memory based watchpoints as well as integration with
+record/replay to support reverse debugging.
+
+
+TCG Plugins
+~~~~~~~~~~~
+
+In any emulation execution mode you can write :ref:`TCG Plugins` which
+can instrument the guest code as it executes to a per-instruction
+granularity. This is useful for writing tools to analyse the real
+world execution behaviour of your programs.
+
+Tools
+-----
+
+QEMU also provides a number of standalone commandline utilities, such
+as the ``qemu-img`` disk image utility that allows you to create,
+convert and modify disk images. While most are expected to be used in
+conjunction with QEMU itself some can also be used with other VMMs
+that support the same interfaces.
+
+See :ref:`Tools` for more details.
diff --git a/docs/about/index.rst b/docs/about/index.rst
index 5bea653c07..6949e6dc93 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -4,24 +4,10 @@ About QEMU
 
 QEMU is a generic and open source machine emulator and virtualizer.
 
-QEMU can be used in several different ways. The most common is for
-"system emulation", where it provides a virtual model of an
-entire machine (CPU, memory and emulated devices) to run a guest OS.
-In this mode the CPU may be fully emulated, or it may work with
-a hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to
-allow the guest to run directly on the host CPU.
-
-The second supported way to use QEMU is "user mode emulation",
-where QEMU can launch processes compiled for one CPU on another CPU.
-In this mode the CPU is always emulated.
-
-QEMU also provides a number of standalone commandline utilities,
-such as the ``qemu-img`` disk image utility that allows you to create,
-convert and modify disk images.
-
 .. toctree::
    :maxdepth: 2
 
+   features
    build-platforms
    deprecated
    removed-features
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 9740a70406..81dcd43a61 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -3,6 +3,8 @@
    Copyright (c) 2019, Linaro Limited
    Written by Emilio Cota and Alex Bennée
 
+.. _TCG Plugins:
+
 QEMU TCG Plugins
 ================
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b33d7c28dc..b87e064d9d 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -1,3 +1,5 @@
+.. _Arm Emulation:
+
 A-profile CPU architecture support
 ==================================
 
diff --git a/docs/system/index.rst b/docs/system/index.rst
index e3695649c5..282b6ffb56 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -1,3 +1,5 @@
+.. _System Emulation:
+
 ----------------
 System Emulation
 ----------------
diff --git a/docs/system/multi-process.rst b/docs/system/multi-process.rst
index 210531ee17..16f0352416 100644
--- a/docs/system/multi-process.rst
+++ b/docs/system/multi-process.rst
@@ -1,3 +1,5 @@
+.. _Multi-process QEMU:
+
 Multi-process QEMU
 ==================
 
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index 1edd5a8054..2151adcf78 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -1,3 +1,5 @@
+.. _Tools:
+
 -----
 Tools
 -----
diff --git a/docs/user/index.rst b/docs/user/index.rst
index 2c4e29f3db..782d27cda2 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -1,3 +1,5 @@
+.. _User Mode Emulation:
+
 -------------------
 User Mode Emulation
 -------------------
-- 
2.34.1


