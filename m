Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8350DD98
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:05:16 +0200 (CEST)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nival-00061I-9Z
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niukY-0008LX-E8
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39746 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niukV-0001Lf-AA
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:17 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S44; 
 Mon, 25 Apr 2022 17:11:02 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 42/43] tests/tcg/loongarch64: Add hello/memory test in
 loongarch64 system
Date: Mon, 25 Apr 2022 17:10:26 +0800
Message-Id: <20220425091027.2877892-43-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S44
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw43Kw4Dury5WF1UJFy5urg_yoWxXr1rpw
 4akFyrKrs7JFZrGwn7KF1rGF13Jry8CF1UuFyaqr40vFs7Ww1vqw1FgrW5JFy2qws5GrWI
 v3ZYyw1Y9F97Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- We write a very minimal softmmu harness.
- This is a very simple smoke test with no need to run a full Linux/kernel.
- The Makefile.softmmu-target record the rule to run.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                                   |  1 +
 tests/tcg/loongarch64/Makefile.softmmu-target | 33 +++++++
 tests/tcg/loongarch64/system/boot.S           | 56 ++++++++++++
 tests/tcg/loongarch64/system/kernel.ld        | 30 +++++++
 tests/tcg/loongarch64/system/regdef.h         | 86 +++++++++++++++++++
 5 files changed, 206 insertions(+)
 create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
 create mode 100644 tests/tcg/loongarch64/system/boot.S
 create mode 100644 tests/tcg/loongarch64/system/kernel.ld
 create mode 100644 tests/tcg/loongarch64/system/regdef.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e123f3026c..31a8c26e71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -218,6 +218,7 @@ M: Song Gao <gaosong@loongson.cn>
 M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
 S: Maintained
 F: target/loongarch/
+F: tests/tcg/loongarch64/
 
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
diff --git a/tests/tcg/loongarch64/Makefile.softmmu-target b/tests/tcg/loongarch64/Makefile.softmmu-target
new file mode 100644
index 0000000000..908f3a8c0f
--- /dev/null
+++ b/tests/tcg/loongarch64/Makefile.softmmu-target
@@ -0,0 +1,33 @@
+#
+# Loongarch64 system tests
+#
+
+LOONGARCH64_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/loongarch64/system
+VPATH+=$(LOONGARCH64_SYSTEM_SRC)
+
+# These objects provide the basic boot code and helper functions for all tests
+CRT_OBJS=boot.o
+
+LOONGARCH64_TEST_SRCS=$(wildcard $(LOONGARCH64_SYSTEM_SRC)/*.c)
+LOONGARCH64_TESTS = $(patsubst $(LOONGARCH64_SYSTEM_SRC)/%.c, %, $(LOONGARCH64_TEST_SRCS))
+
+CRT_PATH=$(LOONGARCH64_SYSTEM_SRC)
+LINK_SCRIPT=$(LOONGARCH64_SYSTEM_SRC)/kernel.ld
+LDFLAGS=-Wl,-T$(LINK_SCRIPT)
+TESTS+=$(LOONGARCH64_TESTS) $(MULTIARCH_TESTS)
+CFLAGS+=-nostdlib -g -O1 -march=loongarch64 -mabi=lp64d $(MINILIB_INC)
+LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
+
+# building head blobs
+.PRECIOUS: $(CRT_OBJS)
+
+%.o: $(CRT_PATH)/%.S
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
+
+# Build and link the tests
+%: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+memory: CFLAGS+=-DCHECK_UNALIGNED=0
+# Running
+QEMU_OPTS+=-serial chardev:output -kernel
diff --git a/tests/tcg/loongarch64/system/boot.S b/tests/tcg/loongarch64/system/boot.S
new file mode 100644
index 0000000000..aec116a327
--- /dev/null
+++ b/tests/tcg/loongarch64/system/boot.S
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Minimal LoongArch system boot code.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "regdef.h"
+
+	.global _start
+	.align 16
+_start:
+	la.local t0, stack_end
+	move sp, t0
+	bl main
+
+	.type _start 2
+	.size _start, .-_start
+
+	.global _exit
+	.align 16
+_exit:
+2:      /* QEMU ACPI poweroff */
+	li.w  t0, 0x3c00
+	li.w  t1, 0x100d0014
+	st.w  t0, t1, 0
+	idle  0
+	bl    2b
+
+	.type _exit 2
+	.size _exit, .-_exit
+
+	.global __sys_outc
+__sys_outc:
+	li.d t1, 1000000
+loop:
+	lu12i.w	t2, 0x1fe00
+	ori	t0, t2, 0x1e5
+	ld.bu	t0, t0, 0
+	andi	t0, t0, 0x20
+	ext.w.b	t0, t0
+	bnez	t0, in
+	addi.w	t1, t1, -1
+	bnez	t1, loop
+in:
+	ext.w.b	a0, a0
+	lu12i.w	t0, 0x1fe00
+	ori	t0, t0, 0x1e0
+	st.b	a0, t0, 0
+	jirl	$r0, ra, 0
+
+	.data
+	.align 4
+stack:
+	.space	65536
+stack_end:
diff --git a/tests/tcg/loongarch64/system/kernel.ld b/tests/tcg/loongarch64/system/kernel.ld
new file mode 100644
index 0000000000..f1a7c0168c
--- /dev/null
+++ b/tests/tcg/loongarch64/system/kernel.ld
@@ -0,0 +1,30 @@
+ENTRY(_start)
+
+SECTIONS
+{
+    /* Linux kernel legacy start address.  */
+    . = 0x9000000000200000;
+    _text = .;
+    .text : {
+        *(.text)
+    }
+    .rodata : {
+        *(.rodata)
+    }
+    _etext = .;
+
+    . = ALIGN(8192);
+    _data = .;
+    .got : {
+        *(.got)
+    }
+    .data : {
+	*(.sdata)
+        *(.data)
+    }
+    _edata = .;
+    .bss : {
+        *(.bss)
+    }
+    _end = .;
+}
diff --git a/tests/tcg/loongarch64/system/regdef.h b/tests/tcg/loongarch64/system/regdef.h
new file mode 100644
index 0000000000..faa09b2377
--- /dev/null
+++ b/tests/tcg/loongarch64/system/regdef.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+#ifndef _ASM_REGDEF_H
+#define _ASM_REGDEF_H
+
+#define zero    $r0     /* wired zero */
+#define ra      $r1     /* return address */
+#define tp      $r2
+#define sp      $r3     /* stack pointer */
+#define v0      $r4     /* return value - caller saved */
+#define v1      $r5
+#define a0      $r4     /* argument registers */
+#define a1      $r5
+#define a2      $r6
+#define a3      $r7
+#define a4      $r8
+#define a5      $r9
+#define a6      $r10
+#define a7      $r11
+#define t0      $r12    /* caller saved */
+#define t1      $r13
+#define t2      $r14
+#define t3      $r15
+#define t4      $r16
+#define t5      $r17
+#define t6      $r18
+#define t7      $r19
+#define t8      $r20
+                        /* $r21: Temporarily reserved */
+#define fp      $r22    /* frame pointer */
+#define s0      $r23    /* callee saved */
+#define s1      $r24
+#define s2      $r25
+#define s3      $r26
+#define s4      $r27
+#define s5      $r28
+#define s6      $r29
+#define s7      $r30
+#define s8      $r31
+
+#define gr0     $r0
+#define gr1     $r1
+#define gr2     $r2
+#define gr3     $r3
+#define gr4     $r4
+#define gr5     $r5
+#define gr6     $r6
+#define gr7     $r7
+#define gr8     $r8
+#define gr9     $r9
+#define gr10    $r10
+#define gr11    $r11
+#define gr12    $r12
+#define gr13    $r13
+#define gr14    $r14
+#define gr15    $r15
+#define gr16    $r16
+#define gr17    $r17
+#define gr18    $r18
+#define gr19    $r19
+#define gr20    $r20
+#define gr21    $r21
+#define gr22    $r22
+#define gr23    $r23
+#define gr24    $r24
+#define gr25    $r25
+#define gr26    $r26
+#define gr27    $r27
+#define gr28    $r28
+#define gr29    $r29
+#define gr30    $r30
+#define gr31    $r31
+
+#define STT_NOTYPE  0
+#define STT_OBJECT  1
+#define STT_FUNC    2
+#define STT_SECTION 3
+#define STT_FILE    4
+#define STT_COMMON  5
+#define STT_TLS     6
+
+#define ASM_NL           ;
+
+#endif /* _ASM_REGDEF_H */
-- 
2.31.1


