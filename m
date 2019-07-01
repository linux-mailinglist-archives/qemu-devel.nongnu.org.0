Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA901B7EB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 16:17:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQBld-0000Gj-9o
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 10:17:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yo-satoh@sios.com>) id 1hQ3Sw-0000dv-GL
	for qemu-devel@nongnu.org; Mon, 13 May 2019 01:25:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yo-satoh@sios.com>) id 1hQ3Sv-0006PR-54
	for qemu-devel@nongnu.org; Mon, 13 May 2019 01:25:34 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:46293)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yo-satoh@sios.com>) id 1hQ3Su-0006KL-KM
	for qemu-devel@nongnu.org; Mon, 13 May 2019 01:25:32 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.vps.ablenet.jp
	[61.195.96.97]) (Authenticated sender: PQ4Y-STU)
	by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 1CBFC11C34A;
	Mon, 13 May 2019 14:25:31 +0900 (JST)
Received: from ysato.dip.jp (ZM005235.ppp.dion.ne.jp [222.8.5.235])
	by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id CE162240085; 
	Mon, 13 May 2019 14:25:30 +0900 (JST)
From: Yoshinori Sato <yo-satoh@sios.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 14:25:17 +0900
Message-Id: <20190513052518.6274-12-yo-satoh@sios.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190513052518.6274-1-yo-satoh@sios.com>
References: <20190513052518.6274-1-yo-satoh@sios.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.224.55.13
X-Mailman-Approved-At: Mon, 13 May 2019 10:11:53 -0400
Subject: [Qemu-devel] [PATCH v11 11/12] Add rx-softmmu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	Yoshinori Sato <yo-satoh@sios.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yoshinori Sato <ysato@users.sourceforge.jp>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Yoshinori Sato <yo-satoh@sios.com>
---
 arch_init.c                    | 2 ++
 configure                      | 8 ++++++++
 default-configs/rx-softmmu.mak | 3 +++
 hw/Kconfig                     | 1 +
 include/sysemu/arch_init.h     | 1 +
 5 files changed, 15 insertions(+)
 create mode 100644 default-configs/rx-softmmu.mak

diff --git a/arch_init.c b/arch_init.c
index f4f3f610c8..cc25ddd7ca 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -74,6 +74,8 @@ int graphic_depth = 32;
 #define QEMU_ARCH QEMU_ARCH_PPC
 #elif defined(TARGET_RISCV)
 #define QEMU_ARCH QEMU_ARCH_RISCV
+#elif defined(TARGET_RX)
+#define QEMU_ARCH QEMU_ARCH_RX
 #elif defined(TARGET_S390X)
 #define QEMU_ARCH QEMU_ARCH_S390X
 #elif defined(TARGET_SH4)
diff --git a/configure b/configure
index 63f312bd1f..142827b743 100755
--- a/configure
+++ b/configure
@@ -7547,6 +7547,11 @@ case "$target_name" in
     gdb_xml_files="riscv-64bit-cpu.xml riscv-64bit-fpu.xml riscv-64bit-csr.xml"
     target_compiler=$cross_cc_riscv64
   ;;
+  rx)
+    TARGET_ARCH=rx
+    bflt="yes"
+    target_compiler=$cross_cc_rx
+  ;;
   sh4|sh4eb)
     TARGET_ARCH=sh4
     bflt="yes"
@@ -7767,6 +7772,9 @@ for i in $ARCH $TARGET_BASE_ARCH ; do
   riscv*)
     disas_config "RISCV"
   ;;
+  rx)
+    disas_config "RX"
+  ;;
   s390*)
     disas_config "S390"
   ;;
diff --git a/default-configs/rx-softmmu.mak b/default-configs/rx-softmmu.mak
new file mode 100644
index 0000000000..a3eecefb11
--- /dev/null
+++ b/default-configs/rx-softmmu.mak
@@ -0,0 +1,3 @@
+# Default configuration for rx-softmmu
+
+CONFIG_RX_VIRT=y
diff --git a/hw/Kconfig b/hw/Kconfig
index 88b9f15007..63a071092e 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -53,6 +53,7 @@ source nios2/Kconfig
 source openrisc/Kconfig
 source ppc/Kconfig
 source riscv/Kconfig
+source rx/Kconfig
 source s390x/Kconfig
 source sh4/Kconfig
 source sparc/Kconfig
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 10cbafe970..3f4f844f7b 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -25,6 +25,7 @@ enum {
     QEMU_ARCH_NIOS2 = (1 << 17),
     QEMU_ARCH_HPPA = (1 << 18),
     QEMU_ARCH_RISCV = (1 << 19),
+    QEMU_ARCH_RX = (1 << 20),
 };
 
 extern const uint32_t arch_type;
-- 
2.11.0


