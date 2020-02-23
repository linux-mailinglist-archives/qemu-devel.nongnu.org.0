Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B4616967C
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Feb 2020 07:59:41 +0100 (CET)
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5lEq-0004lB-J1
	for lists+qemu-devel@lfdr.de; Sun, 23 Feb 2020 01:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j5l6n-0004NG-2W
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 01:51:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j5l6k-0004qQ-59
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 01:51:19 -0500
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:47204)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j5l6j-0004ov-Qu
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 01:51:18 -0500
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 11E3FE3578;
 Sun, 23 Feb 2020 15:51:17 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id B99B4240095;
 Sun, 23 Feb 2020 15:51:16 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v31 20/22] Add rx-softmmu
Date: Sun, 23 Feb 2020 15:51:00 +0900
Message-Id: <20200223065102.61652-21-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200223065102.61652-1-ysato@users.sourceforge.jp>
References: <20200223065102.61652-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.15
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
Cc: richard.henderson@linaro.org, philmd@redhat.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>
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
---
 configure                       | 11 ++++++++++-
 default-configs/rx-softmmu.mak  |  3 +++
 qapi/machine.json               |  2 +-
 include/exec/poison.h           |  1 +
 include/sysemu/arch_init.h      |  1 +
 arch_init.c                     |  2 ++
 tests/qtest/machine-none-test.c |  1 +
 hw/Kconfig                      |  1 +
 8 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 default-configs/rx-softmmu.mak

diff --git a/configure b/configure
index d57261e3ad..d852d7101d 100755
--- a/configure
+++ b/configure
@@ -4128,7 +4128,7 @@ fi
 fdt_required=3Dno
 for target in $target_list; do
   case $target in
-    aarch64*-softmmu|arm*-softmmu|ppc*-softmmu|microblaze*-softmmu|mips6=
4el-softmmu|riscv*-softmmu)
+    aarch64*-softmmu|arm*-softmmu|ppc*-softmmu|microblaze*-softmmu|mips6=
4el-softmmu|riscv*-softmmu|rx-softmmu)
       fdt_required=3Dyes
     ;;
   esac
@@ -7793,6 +7793,12 @@ case "$target_name" in
     mttcg=3Dyes
     gdb_xml_files=3D"riscv-64bit-cpu.xml riscv-32bit-fpu.xml riscv-64bit=
-fpu.xml riscv-64bit-csr.xml riscv-64bit-virtual.xml"
   ;;
+  rx)
+    TARGET_ARCH=3Drx
+    bflt=3D"yes"
+    target_compiler=3D$cross_cc_rx
+    gdb_xml_files=3D"rx-core.xml"
+  ;;
   sh4|sh4eb)
     TARGET_ARCH=3Dsh4
     bflt=3D"yes"
@@ -7974,6 +7980,9 @@ for i in $ARCH $TARGET_BASE_ARCH ; do
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
diff --git a/qapi/machine.json b/qapi/machine.json
index 6c11e3cf3a..40f8b9d872 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -26,7 +26,7 @@
   'data' : [ 'aarch64', 'alpha', 'arm', 'cris', 'hppa', 'i386', 'lm32',
              'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
              'mips64el', 'mipsel', 'moxie', 'nios2', 'or1k', 'ppc',
-             'ppc64', 'riscv32', 'riscv64', 's390x', 'sh4',
+             'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
              'sh4eb', 'sparc', 'sparc64', 'tricore', 'unicore32',
              'x86_64', 'xtensa', 'xtensaeb' ] }
=20
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 955eb863ab..7b9ac361dc 100644
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
index 62c6fe4cf1..6c011acc52 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -24,6 +24,7 @@ enum {
     QEMU_ARCH_NIOS2 =3D (1 << 17),
     QEMU_ARCH_HPPA =3D (1 << 18),
     QEMU_ARCH_RISCV =3D (1 << 19),
+    QEMU_ARCH_RX =3D (1 << 20),
 };
=20
 extern const uint32_t arch_type;
diff --git a/arch_init.c b/arch_init.c
index 705d0b94ad..d9eb0ec1dd 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -77,6 +77,8 @@ int graphic_depth =3D 32;
 #define QEMU_ARCH QEMU_ARCH_PPC
 #elif defined(TARGET_RISCV)
 #define QEMU_ARCH QEMU_ARCH_RISCV
+#elif defined(TARGET_RX)
+#define QEMU_ARCH QEMU_ARCH_RX
 #elif defined(TARGET_S390X)
 #define QEMU_ARCH QEMU_ARCH_S390X
 #elif defined(TARGET_SH4)
diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-t=
est.c
index 5953d31755..8bb54a6360 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -56,6 +56,7 @@ static struct arch2cpu cpus_map[] =3D {
     { "hppa", "hppa" },
     { "riscv64", "rv64gcsu-v1.10.0" },
     { "riscv32", "rv32gcsu-v1.9.1" },
+    { "rx", "rx62n" },
 };
=20
 static const char *get_cpu_model_by_arch(const char *arch)
diff --git a/hw/Kconfig b/hw/Kconfig
index ecf491bf04..62f9ebdc22 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -55,6 +55,7 @@ source nios2/Kconfig
 source openrisc/Kconfig
 source ppc/Kconfig
 source riscv/Kconfig
+source rx/Kconfig
 source s390x/Kconfig
 source sh4/Kconfig
 source sparc/Kconfig
--=20
2.20.1


