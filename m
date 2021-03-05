Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E1232F192
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:43:05 +0100 (CET)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIETg-00051U-TU
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDp8-0003fb-Cw
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:11 -0500
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19]:52752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDp6-0001A2-CQ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UCilZwbHcPdz6hzqQOOPTcq0yhBPvT/yMI5E9ua/fvM=; b=Ri1rivLvorRMYTa9ypcgXBrIrx
 MBCA9BasM77H5hKrYyetYlH1Bmx8pBflouxa9xMo5MxzubFKwKBESkRu6KdJsNLHXkFGchgZ2QQfh
 VjZvV4X8cYcysUMfh3rxDN3psEZmP7e45f4kvhr885VhKqtDHrOs/36IvKMSKzGrTeME=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/15] tests/tcg/tricore: Add macros to create tests and
 first test 'abs'
Date: Fri,  5 Mar 2021 18:00:36 +0100
Message-Id: <20210305170045.869437-7-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.165117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30601048, da=102572729,
 mc=539, sc=4, hc=535, sp=0, fso=30601048, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::19;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=hoth.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kbastian@mail.uni-paderborn.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This kind of tests is inspired by the riscv-tests repository. This adds
macros that makes it easy to create single instruction self containing
tests.

It is achieved by macros that create a test sequence for an
instruction and check for a supplied correct value. If the value is correct the
next instruction is tested. Otherwise we jump to fail handler that writes is
test number as a status code back to qemu that then exits on that status code.
If all tests pass we write back 0 as a status code and exit.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 tests/tcg/configure.sh                    |  7 ++-
 tests/tcg/tricore/Makefile.softmmu-target |  2 +
 tests/tcg/tricore/macros.h                | 53 +++++++++++++++++++++++
 tests/tcg/tricore/test_abs.S              |  7 +++
 4 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/tricore/macros.h
 create mode 100644 tests/tcg/tricore/test_abs.S

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 4da8c3fa12..5f244e5c2f 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -102,7 +102,7 @@ for target in $target_list; do
     xtensa|xtensaeb)
       arches=xtensa
       ;;
-    alpha|cris|hexagon|hppa|i386|lm32|microblaze|microblazeel|m68k|openrisc|riscv64|s390x|sh4|sparc64)
+    alpha|cris|hexagon|hppa|i386|lm32|microblaze|microblazeel|m68k|openrisc|riscv64|s390x|sh4|sparc64|tricore)
       arches=$target
       ;;
     *)
@@ -186,6 +186,11 @@ for target in $target_list; do
       container_image=debian-sparc64-cross
       container_cross_cc=sparc64-linux-gnu-gcc
       ;;
+    tricore-softmmu)
+        container_image=debian-tricore-cross
+        container_cross_as=tricore-as
+        container_cross_ld=tricore-ld
+        ;;
     xtensa*-softmmu)
       container_image=debian-xtensa-cross
 
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index d64a99b95f..3b048e49fa 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -3,6 +3,8 @@ TESTS_PATH = $(SRC_PATH)/tests/tcg/tricore
 LDFLAGS = -T$(TESTS_PATH)/link.ld
 ASFLAGS =
 
+TESTS += test_abs.tst
+
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
 %.pS: $(TESTS_PATH)/%.S
diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
new file mode 100644
index 0000000000..76c133132a
--- /dev/null
+++ b/tests/tcg/tricore/macros.h
@@ -0,0 +1,53 @@
+/* Helpers */
+#define LI(reg, val)           \
+    mov.u reg, lo:val;         \
+    movh DREG_TEMP_LI, up:val; \
+    or reg, reg, DREG_TEMP_LI; \
+
+/* Address definitions */
+#define TESTDEV_ADDR 0xf0000000
+/* Register definitions */
+#define DREG_RS1 %d0
+#define DREG_CALC_RESULT %d1
+#define DREG_TEMP_LI %d10
+#define DREG_TEMP %d11
+#define DREG_TEST_NUM %d14
+#define DREG_CORRECT_RESULT %d15
+
+#define DREG_DEV_ADDR %a15
+
+/* Test case wrappers */
+#define TEST_CASE(num, testreg, correct, code...) \
+test_ ## num:                                     \
+    code;                                         \
+    LI(DREG_CORRECT_RESULT, correct)              \
+    mov DREG_TEST_NUM, num;                       \
+    jne testreg, DREG_CORRECT_RESULT, fail        \
+
+/* Actual test case type
+ * e.g inst %dX, %dY      -> TEST_D_D
+ *     inst %dX, %dY, %dZ -> TEST_D_DD
+ *     inst %eX, %dY, %dZ -> TEST_E_DD
+ */
+#define TEST_D_D(insn, num, result, rs1)      \
+    TEST_CASE(num, DREG_CALC_RESULT, result,  \
+    LI(DREG_RS1, rs1);                        \
+    insn DREG_CALC_RESULT, DREG_RS1;          \
+    )
+
+/* Pass/Fail handling part */
+#define TEST_PASSFAIL                       \
+        j pass;                             \
+fail:                                       \
+        LI(DREG_TEMP, TESTDEV_ADDR)         \
+        mov.a DREG_DEV_ADDR, DREG_TEMP;     \
+        st.w [DREG_DEV_ADDR], DREG_TEST_NUM;\
+        debug;                              \
+        j fail;                             \
+pass:                                       \
+        LI(DREG_TEMP, TESTDEV_ADDR)         \
+        mov.a DREG_DEV_ADDR, DREG_TEMP;     \
+        mov DREG_TEST_NUM, 0;               \
+        st.w [DREG_DEV_ADDR], DREG_TEST_NUM;\
+        debug;                              \
+        j pass;
diff --git a/tests/tcg/tricore/test_abs.S b/tests/tcg/tricore/test_abs.S
new file mode 100644
index 0000000000..e42240159a
--- /dev/null
+++ b/tests/tcg/tricore/test_abs.S
@@ -0,0 +1,7 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_D(abs, 1, 0, 0)
+
+    TEST_PASSFAIL
-- 
2.30.1


