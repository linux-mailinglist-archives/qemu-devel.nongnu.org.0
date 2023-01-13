Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6226698F5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:46:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKHM-0007qJ-Rl; Fri, 13 Jan 2023 08:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHK-0007pp-OT
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGKHH-00052w-F0
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so3082853wms.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IpI+f91+f5TQxZSZ9YYmXQNXzc5fyENbdAfl6yb8iI0=;
 b=YWYBidxtquvEle0b+gcUGiVVaqAoWFgOz81WXVV4mGs2EkMkAeisDuh+9DrPvek9Tk
 ro59LmzpRXekMICZDRZ9cx4L5MqkdxpS8l90ImtpCKd+onYOc4GyT415ZK9mZ+aE2aTW
 bQ2oS+bcU4vZU6wP/eV37Tba3DpmrgSwywYyGxgVfn+o7BpauTT8WaHdzo5czwDOykC1
 MH5A8YcUQPU1oSurHGHxG3pU+jNGMBU/VC5Sj/Io6u92dl9+WWp12lhRDsq2ocIQpRUu
 oHOlJFNUqquv8CGubkjk0y/v5itnSnEfC6f9WpIxonkioeDZ29WAMJuKx3u9BHbqVA0V
 zRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IpI+f91+f5TQxZSZ9YYmXQNXzc5fyENbdAfl6yb8iI0=;
 b=3xRjWd6jNX8N6MdExWrQUHekEhiLySNEePBYHh/JAkf5R5611r3rTk6txps5kXBMQZ
 mEyuseIJUxq/CK3o0U7/YkFD189OD5zCcHeyxOjLpLax1pRB/zyg/ovPpHD9JUz/xoco
 9fvW07PwwDh/Daad/mhr0FjhATNMgB+czIMvzMFy8xS62qdamut76NUbq6viovRQ/0hk
 cP4LcE06tdJ7p1aOMu8dv8MeZZT1IyAlldsiSYc91lnw1+H+4WGfFP2x/l/xVl+mnJte
 adR+Ltr5YcPQvCFu2pUFzuhepgy752NyukP6ukaKcLioJW5db8b2i3kyTNZvXtHXh3gA
 U2Gg==
X-Gm-Message-State: AFqh2kquDwNeziYsIJUDKVP2cIwRZW73QT424LtBjFh8U1xlR+B0jkqd
 doWAYUrdEzSn2VTrDwKWiakjwA==
X-Google-Smtp-Source: AMrXdXt8AeNDKflibce0uvi6rbCkE3IhhgwNfVXeVtDPbCYnMNcUa67z0MN8FAqCtJjPo6v0xVYd6Q==
X-Received: by 2002:a05:600c:5113:b0:3d3:5c21:dd99 with SMTP id
 o19-20020a05600c511300b003d35c21dd99mr58335451wms.18.1673617165641; 
 Fri, 13 Jan 2023 05:39:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c3b0700b003cfd4cf0761sm33086908wms.1.2023.01.13.05.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 05:39:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBEF71FFBC;
 Fri, 13 Jan 2023 13:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexandre Iooss <erdnaxe@crans.org>, peter.maydell@linaro.org,
 Markus Armbruster <armbru@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Subject: [PATCH 4/4] docs: add an introduction to the system docs
Date: Fri, 13 Jan 2023 13:39:23 +0000
Message-Id: <20230113133923.1642627-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113133923.1642627-1-alex.bennee@linaro.org>
References: <20230113133923.1642627-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Drop the frankly misleading quickstart section for a more rounded
introduction section. This new section gives an overview of the
accelerators and high level introduction to some of the key features
of the emulator. We also expand on a general form for a QEMU command
line with a hopefully not too scary worked example of what this looks
like.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/interop/qemu-qmp-ref.rst |   2 +
 docs/system/index.rst         |   2 +-
 docs/system/introduction.rst  | 216 ++++++++++++++++++++++++++++++++++
 docs/system/multi-process.rst |   2 +
 docs/system/quickstart.rst    |  21 ----
 qemu-options.hx               |   3 +
 6 files changed, 224 insertions(+), 22 deletions(-)
 create mode 100644 docs/system/introduction.rst
 delete mode 100644 docs/system/quickstart.rst

diff --git a/docs/interop/qemu-qmp-ref.rst b/docs/interop/qemu-qmp-ref.rst
index 357effd64f..f94614a0b2 100644
--- a/docs/interop/qemu-qmp-ref.rst
+++ b/docs/interop/qemu-qmp-ref.rst
@@ -1,3 +1,5 @@
+.. _QMP Ref:
+
 QEMU QMP Reference Manual
 =========================
 
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 282b6ffb56..3605bbe1ce 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -12,7 +12,7 @@ or Hypervisor.Framework.
 .. toctree::
    :maxdepth: 3
 
-   quickstart
+   introduction
    invocation
    device-emulation
    keys
diff --git a/docs/system/introduction.rst b/docs/system/introduction.rst
new file mode 100644
index 0000000000..15e4cf773d
--- /dev/null
+++ b/docs/system/introduction.rst
@@ -0,0 +1,216 @@
+Introduction
+============
+
+Virtualisation Accelerators
+---------------------------
+
+QEMU's system emulation provides a virtual model of a machine (CPU,
+memory and emulated devices) to run a guest OS. It supports a number
+of hypervisors (known as accelerators) as well as a dynamic JIT known
+as the Tiny Code Generator (TCG) capable of emulating many CPUs.
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
+    - Arm, x86, Loongarch64, MIPS, PPC, s390x, Sparc64
+
+Feature Overview
+----------------
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
+complex storage topology which can be stacked across multiple layers
+supporting redirection, networking, snapshots and migration support.
+
+The flexible ``chardev`` system allows for handling IO from character
+like devices using stdio, files, unix sockets and TCP networking.
+
+QEMU provides a number of management interfaces including a line based
+:ref:`Human Monitor Protocol (HMP)<QEMU monitor>` that allows you to
+dynamically add and remove devices as well as introspect the system
+state. The :ref:`QEMU Monitor Protocol<QMP Ref>` (QMP) is a well
+defined, versioned, machine usable API that presents a rich interface
+to other tools to create, control and manage Virtual Machines. This is
+the interface used by higher level tools interfaces such as `Virt
+Manager <https://virt-manager.org/>`_ using the `libvirt framework
+<https://libvirt.org>`_.
+
+For the common accelerators QEMU supported debugging with its
+:ref:`gdbstub<GDB usage>` which allows users to connect GDB and debug
+system software images.
+
+Running
+-------
+
+QEMU provides a rich and complex API which can be overwhelming to
+understand. While some architectures can boot something with just a
+disk image those examples elide a lot of details with defaults that
+may not be optimal for modern systems.
+
+For a non-x86 system where we emulate a broad range of machine types,
+the command lines are generally more explicit in defining the machine
+and boot behaviour. You will find often find example command lines in
+the :ref:`system-targets-ref` section of the manual.
+
+While the project doesn't want to discourage users from using the
+command line to launch VMs we do want to highlight there are a number
+of projects dedicated to providing a more user friendly experience.
+Those built around the ``libvirt`` framework can make use of feature
+probing to build modern VM images tailored to run on the hardware you
+have.
+
+That said the general form of a QEMU command line could be expressed
+as:
+
+.. parsed-literal::
+
+  $ |qemu_system| [machine opts] \\
+                  [cpu opts] \\
+                  [accelerator opts] \\
+                  [device opts] \\
+                  [backend opts] \\
+                  [interface opts] \\
+                  [boot opts] 
+
+Most options will generate some help information. So for example:
+
+.. parsed-literal::
+
+   $ |qemu_system| -M help
+
+will list the supported machine types by that QEMU binary. Help can
+also be passed as an argument to another option. For example:
+
+.. parsed-literal::
+
+  $ |qemu_system| -device scsi-hd,help
+
+will list the arguments and their default values of additional options
+that can control the behaviour of the ``scsi-hd`` device.
+
+.. list-table:: Options Overview
+  :header-rows: 1
+  :widths: 10, 90
+
+  * - Options
+    -
+  * - Machine
+    - Define the :ref:`machine type<Machine Options>`, amount of memory etc
+  * - CPU
+    - Type and number/topology of vCPUs. Most accelerators offer
+      a ``host`` cpu option which simply passes through your host CPU
+      configurtaion without filtering out any features.
+  * - Accelerator
+    - This will depend on the hypervisor you run, will fallback to
+      slow TCG emulation by default
+  * - Devices
+    - Additional devices that are not defined as default with the
+      machine type
+  * - Backends
+    - Backends are how QEMU deals with the guests data, for example
+      how a block device is stored, how network devices see the
+      network or a serial device is directed to the outside world.
+  * - Interfaces
+    - How the system is displayed, how it is managed and controlled or
+      debugged
+  * - Boot
+    - How the system boots, via firmware or direct kernel boot
+
+In the following example we first define a ``virt`` machine which is a
+general purpose platform for running Aarch64 guests. We enable
+virtualisation so we can use KVM inside the emulated guest
+
+.. code::
+
+ $ qemu-system-aarch64 \
+    -machine type=virt,virtualization=on \
+    -m 4096 \
+
+We then define the 4 vCPUs using the ``max`` option which gives us all
+the Arm features QEMU is capable of emulating. We enable a more
+emulation friendly implementation of Arm's pointer authentication
+algorithm. We specify TCG acceleration (although it would actually
+default to that)
+
+.. code::
+
+ -cpu max,pauth-impdef=on \
+ -smp 4 \
+ -accel tcg \
+
+As the ``virt`` platform doesn't have any default network or storage
+devices we need to define them. We give them ids so we can link them
+with the backend later on.
+
+.. code::
+
+ -device virtio-net-pci,netdev=unet \
+ -device virtio-scsi-pci \
+ -device scsi-hd,drive=hd \
+
+We connect the user-mode networking to our network device. As
+user-mode networking isn't directly accessible from the outside world
+we forward localhost port 2222 to the ssh port on the guest.
+
+.. code::
+
+ -netdev user,id=unet,hostfwd=tcp::2222-:22 \
+
+We connect the guest visible block device to an LVM partition we have
+set aside for our guest.
+
+.. code::
+
+ -blockdev driver=raw,node-name=hd,file.driver=host_device,file.filename=/dev/lvm-disk/debian-bullseye-arm64 \
+
+We then tell QEMU to multiplex the :ref:`QEMU monitor` with the serial
+port output (we can switch between the two using :ref:`keys in the
+character backend multiplexer`). As there is no default graphical
+device we disable the display as we can work entirely in the terminal.
+
+.. code::
+
+ -serial mon:stdio \
+ -display none \
+
+Finally we override the default firmware to ensure we have have some
+storage for EFI to persist its configuration. That firmware is
+responsible for finding the disk, booting grub and eventually running
+our system.
+
+.. code::
+
+ -drive if=pflash,file=(pwd)/pc-bios/edk2-aarch64-code.fd,format=raw,readonly=on \
+ -drive if=pflash,file=$HOME/images/qemu-arm64-efivars,format=raw
diff --git a/docs/system/multi-process.rst b/docs/system/multi-process.rst
index 210531ee17..16f0352416 100644
--- a/docs/system/multi-process.rst
+++ b/docs/system/multi-process.rst
@@ -1,3 +1,5 @@
+.. _Multi-process QEMU:
+
 Multi-process QEMU
 ==================
 
diff --git a/docs/system/quickstart.rst b/docs/system/quickstart.rst
deleted file mode 100644
index 681678c86e..0000000000
--- a/docs/system/quickstart.rst
+++ /dev/null
@@ -1,21 +0,0 @@
-.. _pcsys_005fquickstart:
-
-Quick Start
------------
-
-Download and uncompress a PC hard disk image with Linux installed (e.g.
-``linux.img``) and type:
-
-.. parsed-literal::
-
-   |qemu_system| linux.img
-
-Linux should boot and give you a prompt.
-
-Users should be aware the above example elides a lot of the complexity
-of setting up a VM with x86_64 specific defaults and assumes the
-first non switch argument is a PC compatible disk image with a boot
-sector. For a non-x86 system where we emulate a broad range of machine
-types, the command lines are generally more explicit in defining the
-machine and boot behaviour. You will find more example command lines
-in the :ref:`system-targets-ref` section of the manual.
diff --git a/qemu-options.hx b/qemu-options.hx
index de3a368f58..1568f1e496 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -20,6 +20,9 @@ DEF("version", 0, QEMU_OPTION_version,
 SRST
 ``-version``
     Display version information and exit
+
+    .. _Machine Options:
+
 ERST
 
 DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
-- 
2.34.1


