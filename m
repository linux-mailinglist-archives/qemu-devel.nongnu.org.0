Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530D653F2D7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:57:15 +0200 (CEST)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMaw-0007nk-4a
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLzX-0000aC-75
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:18:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLzV-0004Nn-CL
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:18:34 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so6548810pjb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yaCNw5rJY+gqVfvyhJDRM7VL58Ux2ymp+kdgW1zoAwQ=;
 b=nwCK1d8s/ZhIbVQQnp+4C+ngWSq4UlJVAfmbLmcnFo5/wdO8tS/eWcB90XWryMTQF5
 t7pho4qBzI9so0QYVMBXUQa6komzZE3S+e9oOi27vCsGY24/KOult/QBjjUP5hlltY6j
 EX27dJ+Blg93UqAmI+edOBwFiOEoekbqOkS/3Hzwq+UDP2Pc/l/s1p4ImB1T+OwW08Ry
 c5eZQ2Wgj4KYRuejClj25Fv9h/lsklHOvhq9ZF6W3E05QwXs4vk7X5bJ+rsMzJHamrpi
 fmkVXdGa9l4/3e7z+QfQHP5KWItFQvboxZCjAfCPimOCG1QhKx2ZbgOxc24x/N0Y657/
 L30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yaCNw5rJY+gqVfvyhJDRM7VL58Ux2ymp+kdgW1zoAwQ=;
 b=k/HcxxU27SYmOCTal/83WHLR0kd7pHvBm1WHI7TwvIX2F9Lz0UXUwtJJoTiynk9IXj
 jhKk1LN7x3zbOctAma6Puz4HS4+T+JTV4qhnQjmdTGrpZ66GJrbRlT2vrZAe53yuVcsi
 PgTEclPYAr8Ft5wUwtIbx9X//wjuLdI+HIX6g11gjCNpBQq8BZmr92pmwtFF1/AxX1ME
 5K5mtTbSkg1Vom2o7P6tvlyh/jI25ZUh35pD2WMl9BfzNVOeKRA5YblJneb+3hxLZf8G
 BAzJIzRSK23BZ78dIpwtOf2NvZESB0gUw5dRVzV56VXkFhxI7z/LsMlxmIZsg3VzIiyf
 2ytg==
X-Gm-Message-State: AOAM53234+AjEPN1lGpy1caDblbGC2E8gVHBj8lJwIN6tMTWAWpx4z6N
 f4QgZ6jwGkwpAjNNaciDEt20Q6BLTN6mUQ==
X-Google-Smtp-Source: ABdhPJxtTuit+38HKMeUxwEWPtSFulfzkhMR8tC2Y1Nq7qqQWE7lvrD9nlkh1Kv5rMYnGuJZGO6gXw==
X-Received: by 2002:a17:902:9a83:b0:15e:f718:4ced with SMTP id
 w3-20020a1709029a8300b0015ef7184cedmr26035327plp.69.1654557511908; 
 Mon, 06 Jun 2022 16:18:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a170e00b001df239bab14sm10667754pjd.46.2022.06.06.16.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:18:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 42/43] tests/tcg/loongarch64: Add hello/memory test in
 loongarch64 system
Date: Mon,  6 Jun 2022 16:14:49 -0700
Message-Id: <20220606231450.448443-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

- We write a very minimal softmmu harness.
- This is a very simple smoke test with no need to run a full Linux/kernel.
- The Makefile.softmmu-target record the rule to run.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-43-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/loongarch64/system/regdef.h         | 86 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 tests/tcg/loongarch64/Makefile.softmmu-target | 33 +++++++
 tests/tcg/loongarch64/system/boot.S           | 56 ++++++++++++
 tests/tcg/loongarch64/system/kernel.ld        | 30 +++++++
 5 files changed, 206 insertions(+)
 create mode 100644 tests/tcg/loongarch64/system/regdef.h
 create mode 100644 tests/tcg/loongarch64/Makefile.softmmu-target
 create mode 100644 tests/tcg/loongarch64/system/boot.S
 create mode 100644 tests/tcg/loongarch64/system/kernel.ld

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
diff --git a/MAINTAINERS b/MAINTAINERS
index 954fb95218..5580a36b68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -217,6 +217,7 @@ M: Song Gao <gaosong@loongson.cn>
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
index 0000000000..67eb1c04ce
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
+	li.w  t0, 0xff
+	li.w  t1, 0x10080010
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
-- 
2.34.1


