Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4684A4A0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 16:57:47 +0200 (CEST)
Received: from localhost ([::1]:58692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdFYQ-0000VW-NP
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 10:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hdEqF-00032P-Nq
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:12:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hdEqE-0008UZ-8c
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:12:07 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:60272)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hdEqA-0007zA-Rp
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:12:04 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 7F2A7126D9A;
 Tue, 18 Jun 2019 23:11:39 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 326CA240085;
 Tue, 18 Jun 2019 23:11:39 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Tue, 18 Jun 2019 23:11:17 +0900
Message-Id: <20190618141118.52955-39-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190618141118.52955-1-ysato@users.sourceforge.jp>
References: <20190618141118.52955-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.13
Subject: [Qemu-devel] [PATCH v21 20/21] Add rx-softmmu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, imammedo@redhat.com, richard.henderson@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20190607091116.49044-17-ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
pick ed65c02993 target/rx: Add RX to SysEmuTarget
pick 01372568ae tests: Add rx to machine-none-test.c
[PMD: Squashed patches from Richard Henderson modifying
      qapi/common.json and tests/machine-none-test.c]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 configure                      | 8 ++++++++
 default-configs/rx-softmmu.mak | 3 +++
 qapi/common.json               | 3 ++-
 include/exec/poison.h          | 1 +
 include/sysemu/arch_init.h     | 1 +
 arch_init.c                    | 2 ++
 tests/machine-none-test.c      | 1 +
 hw/Kconfig                     | 1 +
 8 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 default-configs/rx-softmmu.mak

diff --git a/configure b/configure
index b091b82cb3..d6e16c58c3 100755
--- a/configure
+++ b/configure
@@ -7595,6 +7595,11 @@ case "$target_name" in
     gdb_xml_files=3D"riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit=
-csr.xml"
     target_compiler=3D$cross_cc_riscv64
   ;;
+  rx)
+    TARGET_ARCH=3Drx
+    bflt=3D"yes"
+    target_compiler=3D$cross_cc_rx
+  ;;
   sh4|sh4eb)
     TARGET_ARCH=3Dsh4
     bflt=3D"yes"
@@ -7815,6 +7820,9 @@ for i in $ARCH $TARGET_BASE_ARCH ; do
   riscv*)
     disas_config "RISCV"
   ;;
+  rx)
+    disas_config "RX"
+  ;;
   s390*)
     disas_config "S390"
   ;;
diff --git a/default-configs/rx-softmmu.mak b/default-configs/rx-softmmu.=
mak
new file mode 100644
index 0000000000..a3eecefb11
--- /dev/null
+++ b/default-configs/rx-softmmu.mak
@@ -0,0 +1,3 @@
+# Default configuration for rx-softmmu
+
+CONFIG_RX_VIRT=3Dy
diff --git a/qapi/common.json b/qapi/common.json
index 99d313ef3b..d0fc931159 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -183,6 +183,7 @@
 #        is true even for "qemu-system-x86_64".
 #
 # ppcemb: dropped in 3.1
+# rx: added in 4.1
 #
 # Since: 3.0
 ##
@@ -190,6 +191,6 @@
   'data' : [ 'aarch64', 'alpha', 'arm', 'cris', 'hppa', 'i386', 'lm32',
              'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
              'mips64el', 'mipsel', 'moxie', 'nios2', 'or1k', 'ppc',
-             'ppc64', 'riscv32', 'riscv64', 's390x', 'sh4',
+             'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
              'sh4eb', 'sparc', 'sparc64', 'tricore', 'unicore32',
              'x86_64', 'xtensa', 'xtensaeb' ] }
diff --git a/include/exec/poison.h b/include/exec/poison.h
index b862320fa6..c17911d859 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -26,6 +26,7 @@
 #pragma GCC poison TARGET_PPC
 #pragma GCC poison TARGET_PPC64
 #pragma GCC poison TARGET_ABI32
+#pragma GCC poison TARGET_RX
 #pragma GCC poison TARGET_S390X
 #pragma GCC poison TARGET_SH4
 #pragma GCC poison TARGET_SPARC
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 10cbafe970..3f4f844f7b 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -25,6 +25,7 @@ enum {
     QEMU_ARCH_NIOS2 =3D (1 << 17),
     QEMU_ARCH_HPPA =3D (1 << 18),
     QEMU_ARCH_RISCV =3D (1 << 19),
+    QEMU_ARCH_RX =3D (1 << 20),
 };
=20
 extern const uint32_t arch_type;
diff --git a/arch_init.c b/arch_init.c
index 74b0708634..48d9b4c86f 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -73,6 +73,8 @@ int graphic_depth =3D 32;
 #define QEMU_ARCH QEMU_ARCH_PPC
 #elif defined(TARGET_RISCV)
 #define QEMU_ARCH QEMU_ARCH_RISCV
+#elif defined(TARGET_RX)
+#define QEMU_ARCH QEMU_ARCH_RX
 #elif defined(TARGET_S390X)
 #define QEMU_ARCH QEMU_ARCH_S390X
 #elif defined(TARGET_SH4)
diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
index 4c6d470798..80df277357 100644
--- a/tests/machine-none-test.c
+++ b/tests/machine-none-test.c
@@ -56,6 +56,7 @@ static struct arch2cpu cpus_map[] =3D {
     { "hppa", "hppa" },
     { "riscv64", "rv64gcsu-v1.10.0" },
     { "riscv32", "rv32gcsu-v1.9.1" },
+    { "rx", "rx62n" },
 };
=20
 static const char *get_cpu_model_by_arch(const char *arch)
diff --git a/hw/Kconfig b/hw/Kconfig
index 195f541e50..b0c7221240 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -54,6 +54,7 @@ source nios2/Kconfig
 source openrisc/Kconfig
 source ppc/Kconfig
 source riscv/Kconfig
+source rx/Kconfig
 source s390x/Kconfig
 source sh4/Kconfig
 source sparc/Kconfig
--=20
2.11.0


