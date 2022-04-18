Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58394505E5B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 21:20:44 +0200 (CEST)
Received: from localhost ([::1]:50128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngWvT-0006mv-Dy
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 15:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ngWn4-0006jO-6O; Mon, 18 Apr 2022 15:12:02 -0400
Received: from [187.72.171.209] (port=10848 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ngWn2-00036o-Cv; Mon, 18 Apr 2022 15:12:01 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 18 Apr 2022 16:11:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 494168000A0;
 Mon, 18 Apr 2022 16:11:55 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v3 5/5] tests/tcg/ppc64: Build PowerNV and LE tests
Date: Mon, 18 Apr 2022 16:11:00 -0300
Message-Id: <20220418191100.270334-6-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Apr 2022 19:11:55.0718 (UTC)
 FILETIME=[2B5D1E60:01D85358]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each Microwatt/PowerNV test use its own head.S file and thus needs
different build rules.

Also add rules to build and run all tests in LE mode.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 tests/tcg/ppc64/Makefile.softmmu-rules  |  34 +++++++
 tests/tcg/ppc64/Makefile.softmmu-target | 121 +++++++++++++++++++-----
 2 files changed, 129 insertions(+), 26 deletions(-)
 create mode 100644 tests/tcg/ppc64/Makefile.softmmu-rules

diff --git a/tests/tcg/ppc64/Makefile.softmmu-rules b/tests/tcg/ppc64/Makefile.softmmu-rules
new file mode 100644
index 0000000000..abe0de0a7f
--- /dev/null
+++ b/tests/tcg/ppc64/Makefile.softmmu-rules
@@ -0,0 +1,34 @@
+#
+# Rules to build PowerPC64 softmmu tests, for both BE and LE
+#
+
+# Build CRT and test objects
+%$(LE_SUFFIX).o: $(CRT_PATH)/%.S
+	$(CC) $(PPC64_CFLAGS) -x assembler-with-cpp -c $< -o $@
+
+%$(LE_SUFFIX).o: %.S
+	$(CC) $(PPC64_CFLAGS) -x assembler-with-cpp -c $< -o $@
+
+%$(LE_SUFFIX).o: $(CRT_PATH)/%.c
+	$(CC) $(PPC64_CFLAGS) -c $< -o $@
+
+%$(LE_SUFFIX).o: %.c
+	$(CC) $(PPC64_CFLAGS) -c $< -o $@
+
+# Build .elf files for debugging
+%$(LE_SUFFIX).elf: %$(LE_SUFFIX).o $(LINK_SCRIPT) $(CRT_DEPS) $(MINILIB_DEPS)
+	$(CC) $(PPC64_CFLAGS) -o $@ $< $(LDFLAGS)
+
+$(PPC64_PNV_ELFS): %$(LE_SUFFIX).elf: %-head$(LE_SUFFIX).o %$(LE_SUFFIX).o \
+                    $(LINK_SCRIPT) $(CRT_DEPS) $(MINILIB_DEPS)
+	$(CC) $(PPC64_CFLAGS) -o $@ $< $*$(LE_SUFFIX).o $(LDFLAGS)
+
+# Build test binaries
+%$(LE_SUFFIX): %$(LE_SUFFIX).o $(LINK_SCRIPT) $(CRT_DEPS) $(MINILIB_DEPS) \
+               %$(LE_SUFFIX).elf
+	$(CC) $(PPC64_CFLAGS) -o $@ $< $(LDFLAGS) -Wl,--oformat=binary
+
+$(PPC64_PNV_TESTS): %$(LE_SUFFIX): %-head$(LE_SUFFIX).o %$(LE_SUFFIX).o \
+                    $(LINK_SCRIPT) $(CRT_DEPS) $(MINILIB_DEPS) %$(LE_SUFFIX).elf
+	$(CC) $(PPC64_CFLAGS) -o $@ $< $*$(LE_SUFFIX).o $(LDFLAGS) \
+				-Wl,--oformat=binary
diff --git a/tests/tcg/ppc64/Makefile.softmmu-target b/tests/tcg/ppc64/Makefile.softmmu-target
index 948427b70d..cf89d2f950 100644
--- a/tests/tcg/ppc64/Makefile.softmmu-target
+++ b/tests/tcg/ppc64/Makefile.softmmu-target
@@ -5,22 +5,52 @@
 # For now, disable tests that are failing
 DISABLED_TESTS := memory
 DISABLED_EXTRA_RUNS := run-gdbstub-memory
+# Disable LE tests too
+DISABLED_TESTS += $(addsuffix -le, $(DISABLED_TESTS))
+DISABLED_EXTRA_RUNS += $(addsuffix -le, $(DISABLED_EXTRA_RUNS))
 
-PPC64_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/ppc64/system
-VPATH+=$(PPC64_SYSTEM_SRC)
+PPC64_SRC := $(SRC_PATH)/tests/tcg/ppc64
+PPC64_SYSTEM_SRC := $(PPC64_SRC)/system
+VPATH += $(PPC64_SYSTEM_SRC)
 
 # These objects provide the basic boot code and helper functions for all tests
-CRT_PATH=$(PPC64_SYSTEM_SRC)/lib
-CRT_OBJS=boot.o
+CRT_PATH := $(PPC64_SYSTEM_SRC)/lib
+CRT_OBJS_BE := boot.o
+CRT_OBJS_LE := boot-le.o
+# NOTE: %-head.o replaces boot.o on PowerNV tests
+PNV_CRT_OBJS_BE := $(filter-out boot.o, $(CRT_OBJS_BE))
+PNV_CRT_OBJS_LE := $(filter-out boot-le.o, $(CRT_OBJS_LE))
 
-LINK_SCRIPT=$(CRT_PATH)/powerpc.lds
-# NOTE: --build-id is stored before the first code section in the linked
-#       binary, which causes problems for most tests, that expect to
-#       begin at address 0.
-LDFLAGS=-Wl,-T$(LINK_SCRIPT) -Wl,--build-id=none -static -nostdlib \
-    $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
-TESTS += $(filter-out $(DISABLED_TESTS),$(MULTIARCH_TESTS))
-EXTRA_RUNS += $(filter-out $(DISABLED_EXTRA_RUNS),$(MULTIARCH_RUNS))
+MINILIB_OBJS_BE := $(MINILIB_OBJS)
+MINILIB_OBJS_LE := $(patsubst %.o, %-le.o, $(MINILIB_OBJS))
+
+# Add BE and LE tests
+
+# Each Microwatt/PowerNV test use its own head.S file and thus needs
+# different rules.
+PPC64BE_PNV_TESTS := mmu
+PPC64BE_PNV_ELFS := $(addsuffix .elf, $(PPC64BE_PNV_TESTS))
+PPC64LE_PNV_TESTS := $(addsuffix -le, $(PPC64BE_PNV_TESTS))
+PPC64LE_PNV_ELFS := $(addsuffix .elf, $(PPC64LE_PNV_TESTS))
+
+# Remaining test sources are assumed to be non-PowerNV tests
+PPC64_TEST_SRCS := $(wildcard $(PPC64_SYSTEM_SRC)/*.c)
+PPC64BE_TESTS := $(MULTIARCH_TESTS)
+PPC64BE_TESTS += $(filter-out $(PPC64BE_PNV_TESTS),\
+                 $(patsubst $(PPC64_SYSTEM_SRC)/%.c, %, $(PPC64_TEST_SRCS)))
+PPC64BE_ELFS := $(addsuffix .elf,$(PPC64BE_TESTS))
+PPC64LE_TESTS := $(addsuffix -le, $(PPC64BE_TESTS))
+PPC64LE_ELFS := $(addsuffix .elf,$(PPC64LE_TESTS))
+
+TESTS += $(filter-out $(DISABLED_TESTS), $(PPC64BE_TESTS) $(PPC64LE_TESTS))
+TESTS += $(PPC64BE_PNV_TESTS) $(PPC64LE_PNV_TESTS)
+
+MULTIARCH_RUNS_BE := $(MULTIARCH_RUNS)
+MULTIARCH_RUNS_LE := $(addsuffix -le, $(MULTIARCH_RUNS))
+EXTRA_RUNS += $(filter-out $(DISABLED_EXTRA_RUNS), \
+                           $(MULTIARCH_RUNS_BE) $(MULTIARCH_RUNS_LE))
+
+LINK_SCRIPT := $(CRT_PATH)/powerpc.lds
 
 # NOTE: -Os doesn't work well with -Wl,--oformat=binary
 #       Some linker generated functions, such as savegpr*/restgpr*,
@@ -30,27 +60,66 @@ CFLAGS = -O -g -Wall -std=c99 -msoft-float -mno-vsx -mno-altivec \
          -I $(PPC64_SYSTEM_SRC)/include $(MINILIB_INC) \
          -mcpu=power8
 
-# Uncomment to test in LE
-# override EXTRA_CFLAGS += -mlittle-endian -mabi=elfv2
+# NOTE: --build-id is stored before the first code section in the linked
+#       binary, which causes problems for most tests, that expect to
+#       begin at address 0.
+LDFLAGS = -Wl,-T$(LINK_SCRIPT) -Wl,--build-id=none -static -nostdlib \
+    $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
+
+memory memory-le: CFLAGS+=-DCHECK_UNALIGNED=1
+
+# PowerNV tests build outputs
+PPC64BE_PNV_OUTPUTS := $(PPC64BE_PNV_TESTS) $(PPC64BE_PNV_ELFS)
+PPC64LE_PNV_OUTPUTS := $(PPC64LE_PNV_TESTS) $(PPC64LE_PNV_ELFS)
+# Non-PowerNV tests build outputs
+PPC64BE_OUTPUTS := $(PPC64BE_TESTS) $(PPC64BE_ELFS)
+PPC64LE_OUTPUTS := $(PPC64LE_TESTS) $(PPC64LE_ELFS)
+# Outputs of all tests
+PPC64BE_ALL_OUTPUTS := $(PPC64BE_OUTPUTS) $(PPC64BE_PNV_OUTPUTS)
+PPC64LE_ALL_OUTPUTS := $(PPC64LE_OUTPUTS) $(PPC64LE_PNV_OUTPUTS)
+
+PPC64_CFLAGS = $(CFLAGS) $(EXTRA_CFLAGS) $(PPC64LE_CFLAGS)
 
 # Leave the .elf files, to make debugging easier
-.PRECIOUS: $(CRT_OBJS) $(addsuffix .elf,$(TESTS))
+.PRECIOUS: $(CRT_OBJS_BE) $(CRT_OBJS_LE) $(addsuffix .elf,$(TESTS))
+
+# BE rules
+
+LE_SUFFIX :=
+CRT_DEPS := $(CRT_OBJS_BE)
+MINILIB_DEPS := $(MINILIB_OBJS_BE)
+PPC64_PNV_ELFS := $(PPC64BE_PNV_ELFS)
+PPC64_PNV_TESTS := $(PPC64BE_PNV_TESTS)
+
+$(PPC64BE_ALL_OUTPUTS): LE_SUFFIX =
+$(PPC64BE_ALL_OUTPUTS): PPC64LE_CFLAGS =
+$(PPC64BE_OUTPUTS): CRT_OBJS = $(CRT_OBJS_BE)
+$(PPC64BE_PNV_OUTPUTS): CRT_OBJS = $(PNV_CRT_OBJS_BE)
+$(PPC64BE_ALL_OUTPUTS): MINILIB_OBJS = $(MINILIB_OBJS_BE)
+
+include $(PPC64_SRC)/Makefile.softmmu-rules
 
-# Build CRT objects
-%.o: $(CRT_PATH)/%.S
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
+# LE rules
 
-# Build and link the tests
+LE_SUFFIX := -le
+CRT_DEPS := $(CRT_OBJS_LE)
+MINILIB_DEPS := $(MINILIB_OBJS_LE)
+PPC64_PNV_ELFS := $(PPC64LE_PNV_ELFS)
+PPC64_PNV_TESTS := $(PPC64LE_PNV_TESTS)
 
-# The .elf files are just for debugging
-%.elf: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+$(PPC64LE_ALL_OUTPUTS): LE_SUFFIX = -le
+$(PPC64LE_ALL_OUTPUTS): PPC64LE_CFLAGS = -mlittle-endian -mabi=elfv2
+$(PPC64LE_OUTPUTS): CRT_OBJS = $(CRT_OBJS_LE)
+$(PPC64LE_PNV_OUTPUTS): CRT_OBJS = $(PNV_CRT_OBJS_LE)
+$(PPC64LE_ALL_OUTPUTS): MINILIB_OBJS = $(MINILIB_OBJS_LE)
 
-%: %.c %.elf $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) -Wl,--oformat=binary
+include $(PPC64_SRC)/Makefile.softmmu-rules
 
-memory: CFLAGS+=-DCHECK_UNALIGNED=1
+# Build LE Minilib objs
+%-le.o: $(SYSTEM_MINILIB_SRC)/%.c
+	$(CC) $(PPC64_CFLAGS) -c $< -o $@
 
 # Running
 QEMU_BASE_MACHINE=-cpu power9 -M powernv9 -m 1G -vga none -nographic
-QEMU_OPTS+=$(QEMU_BASE_MACHINE) -serial chardev:output -bios
+QEMU_OPTS+=$(QEMU_BASE_MACHINE) -semihosting-config \
+    enable=on,target=native,chardev=output -bios
-- 
2.25.1


