Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E04B5F10
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 01:31:01 +0100 (CET)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJlkB-0006xM-UJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 19:30:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJlgg-0005Wf-D1
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 19:27:22 -0500
Received: from [2607:f8b0:4864:20::42d] (port=46999
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJlgd-000305-R9
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 19:27:22 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i21so30569417pfd.13
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 16:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhUX6hoIe/XXFCGxxCf6LO2gddbwggaBNY4iBCzgVVM=;
 b=ES6sc8VDfxixIssrUp3nj8FjYkU6qxeKC3W1o1ZBIS4f1BCI7aui2zQznks4DxlA9C
 97pWnxfDBjONmzAic2rBy+KlAB5eawe2a0FwQ876C3Z5JNMOXLkCyaZ8E/QBR+9UM1ph
 nB/xf5fcPED0GQCTNilHjNf4z6C5iOuXP4Hw0aUpNqlEg69JkC0N7F4Yo5SbnczrPzMA
 Dje8krnLk+nqjlUf5s/xs+QuYbzrZwlikTOjUfL28Fivvpcit6u/e6LtbQNLs8BZ0mtB
 gHlKgcz0/Zy0EGshvzM3u9aGgexcEZvvzcb9oXJXYbUxGXERUOF5Br1MIwgWyHvz8h9e
 OCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IhUX6hoIe/XXFCGxxCf6LO2gddbwggaBNY4iBCzgVVM=;
 b=smkVYHpWu+1ELrx15y96uDVct2eJKzliwNRnipDWqHCJQdaq3tZImxWGfp7iKhz+Rb
 tq9STlNHy6oHRj0/B7Zw++/ZqbgYx2+D2t9wl4DxroTIhI0y8LLxS7TdeS5MR6pPAwuc
 60Vew7RWeSAldlCcScoya7sxro9LjOqwlBlew6qVNckgkG4MHX93K1anmb4QctKs+GiX
 ToEbqoRJwugJDp6/Ly/HWEzSrhWFJwqyYpSHrH2OVqGvAegO9D1Zdj9ejJeYIiR98TwH
 tsHE1ROG7n4Na5V902BIZzjRZGuGy3DH5Dh/VEIznG1szLPAxDs3vzFRYa9lFV6AweLn
 aGog==
X-Gm-Message-State: AOAM530sR9Uezmm4Qs5VYagiNAOny4idANsnpPatHPAhrkQO22h1EseU
 2zLHH55xIOwFUbAlmlP8TBQ=
X-Google-Smtp-Source: ABdhPJyRE8SGcx65H2rJjZwZASv5p0wBC5qjdCC45pQej3fBzGnffd8zK9AZ3yXoiDIhob5yuAmqeA==
X-Received: by 2002:aa7:9ad0:: with SMTP id x16mr1676347pfp.55.1644884838474; 
 Mon, 14 Feb 2022 16:27:18 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id b14sm38062399pfm.17.2022.02.14.16.27.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 16:27:18 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>, Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [NOTFORMERGE PATCH 1/1] target: Add system emulation aiming to target
 any architecture
Date: Tue, 15 Feb 2022 01:26:58 +0100
Message-Id: <20220215002658.60678-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215002658.60678-1-f4bug@amsat.org>
References: <20220215002658.60678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Add the 'any'-architecture target.

- Only consider 64-bit targets
- Do not use any hardware accelerator (except qtest)
- For architecture constants, use:
  . max of supported targets phys/virt address space
  . max of supported targets MMU modes
  . min of supported targets variable page bits

Build as:

  $ ../configure --target-list=any-softmmu \
      --disable-tcg --disable-kvm --disable-hvf

Test as:

  $ qemu-system-any -M none,accel=qtest -monitor stdio
  QEMU 6.2.50 monitor - type 'help' for more information
  (qemu) info mtree
  address-space: I/O
    0000000000000000-000000000000ffff (prio 0, i/o): io

  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system

  (qemu) info qom-tree
  /machine (none-machine)
    /peripheral (container)
    /peripheral-anon (container)
    /unattached (container)
      /io[0] (memory-region)
      /sysbus (System)
      /system[0] (memory-region)
  (qemu) info qtree
  bus: main-system-bus
    type System
  (qemu) info cpus
  (qemu)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configs/devices/any-softmmu/default.mak |  1 +
 configs/targets/any-softmmu.mak         |  3 +++
 hw/any/meson.build                      |  5 +++++
 hw/meson.build                          |  1 +
 include/sysemu/arch_init.h              |  1 +
 meson.build                             |  6 +++--
 qapi/machine.json                       |  2 +-
 target/Kconfig                          |  1 +
 target/any/Kconfig                      |  4 ++++
 target/any/cpu-param.h                  | 30 +++++++++++++++++++++++++
 target/any/cpu.h                        | 26 +++++++++++++++++++++
 target/any/meson.build                  |  8 +++++++
 target/meson.build                      |  1 +
 13 files changed, 86 insertions(+), 3 deletions(-)
 create mode 100644 configs/devices/any-softmmu/default.mak
 create mode 100644 configs/targets/any-softmmu.mak
 create mode 100644 hw/any/meson.build
 create mode 100644 target/any/Kconfig
 create mode 100644 target/any/cpu-param.h
 create mode 100644 target/any/cpu.h
 create mode 100644 target/any/meson.build

diff --git a/configs/devices/any-softmmu/default.mak b/configs/devices/any-softmmu/default.mak
new file mode 100644
index 0000000000..315c06b689
--- /dev/null
+++ b/configs/devices/any-softmmu/default.mak
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
diff --git a/configs/targets/any-softmmu.mak b/configs/targets/any-softmmu.mak
new file mode 100644
index 0000000000..2c6cf1edd4
--- /dev/null
+++ b/configs/targets/any-softmmu.mak
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+TARGET_ARCH=any
diff --git a/hw/any/meson.build b/hw/any/meson.build
new file mode 100644
index 0000000000..60e1567e53
--- /dev/null
+++ b/hw/any/meson.build
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+any_ss = ss.source_set()
+
+hw_arch += {'any': any_ss}
diff --git a/hw/meson.build b/hw/meson.build
index b3366c888e..6e7e102bbd 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -44,6 +44,7 @@ subdir('xen')
 subdir('xenpv')
 
 subdir('alpha')
+subdir('any')
 subdir('arm')
 subdir('avr')
 subdir('cris')
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 79c2591425..f86bf4b0cd 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -4,6 +4,7 @@
 
 enum {
     QEMU_ARCH_ALL = -1,
+    QEMU_ARCH_ANY = -1,
     QEMU_ARCH_ALPHA = (1 << 0),
     QEMU_ARCH_ARM = (1 << 1),
     QEMU_ARCH_CRIS = (1 << 2),
diff --git a/meson.build b/meson.build
index 9460875693..f587f4ba59 100644
--- a/meson.build
+++ b/meson.build
@@ -61,7 +61,7 @@ python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
-  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc64', 'any']
 
 cpu = host_machine.cpu_family()
 
@@ -1934,7 +1934,9 @@ foreach target : target_dirs
     if default_targets
       continue
     endif
-    error('No accelerator available for target @0@'.format(target))
+    if 'any-softmmu' not in target_dirs
+      error('No accelerator available for target @0@'.format(target))
+    endif
   endif
 
   actual_target_dirs += target
diff --git a/qapi/machine.json b/qapi/machine.json
index 42fc68403d..4b09831a27 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -34,7 +34,7 @@
              'mips64el', 'mipsel', 'nios2', 'or1k', 'ppc',
              'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
              'sh4eb', 'sparc', 'sparc64', 'tricore',
-             'x86_64', 'xtensa', 'xtensaeb' ] }
+             'x86_64', 'xtensa', 'xtensaeb', 'any' ] }
 
 ##
 # @CpuS390State:
diff --git a/target/Kconfig b/target/Kconfig
index ae7f24fc66..ea381d28b5 100644
--- a/target/Kconfig
+++ b/target/Kconfig
@@ -1,4 +1,5 @@
 source alpha/Kconfig
+source any/Kconfig
 source arm/Kconfig
 source avr/Kconfig
 source cris/Kconfig
diff --git a/target/any/Kconfig b/target/any/Kconfig
new file mode 100644
index 0000000000..8840d70e55
--- /dev/null
+++ b/target/any/Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+config ANY
+    bool
diff --git a/target/any/cpu-param.h b/target/any/cpu-param.h
new file mode 100644
index 0000000000..21cda0ddc2
--- /dev/null
+++ b/target/any/cpu-param.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef ANY_CPU_PARAM_H
+#define ANY_CPU_PARAM_H
+
+#define TARGET_LONG_BITS 64
+
+#define TARGET_PHYS_ADDR_SPACE_BITS 64 /* MAX(targets) */
+#define TARGET_VIRT_ADDR_SPACE_BITS 64 /* MAX(targets) */
+
+#define TARGET_PAGE_BITS_VARY
+#define TARGET_PAGE_BITS_MIN  10 /* MIN(targets)=ARMv5/ARMv6, ignoring AVR */
+
+#define NB_MMU_MODES 15 /* MAX(targets) = ARM */
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_ANY_CPU "any-cpu"
+
+OBJECT_DECLARE_CPU_TYPE(ANYCPU, ANYCPUClass, ANY_CPU)
+
+struct ANYCPUClass {
+    /*< private >*/
+    CPUClass parent_class;
+    /*< public >*/
+    DeviceRealize parent_realize;
+    DeviceReset parent_reset;
+};
+
+#endif
diff --git a/target/any/cpu.h b/target/any/cpu.h
new file mode 100644
index 0000000000..f85ebed956
--- /dev/null
+++ b/target/any/cpu.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef TARGET_ANY_CPU_H
+#define TARGET_ANY_CPU_H
+
+#include "exec/cpu-defs.h"
+
+#define ANY_CPU_TYPE_SUFFIX "-" TYPE_ANY_CPU
+#define ANY_CPU_TYPE_NAME(name) (name ANY_CPU_TYPE_SUFFIX)
+#define CPU_RESOLVING_TYPE TYPE_ANY_CPU
+
+struct CPUArchState {
+    /* nothing here */
+};
+
+struct ArchCPU {
+    /*< private >*/
+    CPUState parent_obj;
+    /*< public >*/
+
+    CPUNegativeOffsetState neg;
+    CPUArchState env;
+};
+
+#include "exec/cpu-all.h"
+
+#endif
diff --git a/target/any/meson.build b/target/any/meson.build
new file mode 100644
index 0000000000..1c36a6e3a1
--- /dev/null
+++ b/target/any/meson.build
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+any_ss = ss.source_set()
+
+any_softmmu_ss = ss.source_set()
+
+target_arch += {'any': any_ss}
+target_softmmu_arch += {'any': any_softmmu_ss}
diff --git a/target/meson.build b/target/meson.build
index 2f6940255e..ef7f960f6e 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -1,4 +1,5 @@
 subdir('alpha')
+subdir('any')
 subdir('arm')
 subdir('avr')
 subdir('cris')
-- 
2.34.1


