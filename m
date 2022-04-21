Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A0E50A513
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:16:10 +0200 (CEST)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZTV-0006En-KA
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdP-0005o9-Au
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:20 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:44942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYdN-0007HO-9d
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:19 -0400
Received: by mail-il1-x134.google.com with SMTP id o5so3247379ils.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y6wXmLblCt6S4c4wZEMyG9x0jyr+hkrFDS0c7/JgCQA=;
 b=UV74OxD+7GTuEgs2mw9kECDLX1gYWAvsSCef8JXV/uFDv5iqIb8c2VvCLnp9WmzoGN
 xSmAT3Lak3h1+aK37lKauuU1IrIfPfGgeGlXOuEzJLdWQb/ELSe/fC6sTdcz/Oy/PqY8
 twWL8OESwEzI8xl7RY4O7HKUGAqKmoxN1T20rH2bjoON1veK/ppcZcFhZ/QY3iMRzR51
 Y7KqG32Fg6rCuPaXBolzmRYHcnmgsbWkqUspoCIildFnMC9B+kloDrVMeKz1Ff0ar4KI
 j7uJMIrEQDBrr2+JcdZWefG34cbCHTPUTWDPpMx0RyQGrPmoMCV3zNlX5GCNikG8aXqz
 Jqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y6wXmLblCt6S4c4wZEMyG9x0jyr+hkrFDS0c7/JgCQA=;
 b=Tm8DhaYlfwVq6qJZOYd5bqxGr14qi/3wMJpGKQ/ZbTXQ8rcikw+e0JkoNd0vQrBmMQ
 gto0s2pxAwGlfMX0kiABDSqf5X2ZlKxhWJSQaiWNSmJeK1vzkn9rb5LvCzeSoPNxEg2O
 RazCEd9+Ynq/FHpA2vBo1sH7o+yzjd66LL7i/4v2AgdEgXjWpCiH+UP3niZtOTz4z79m
 5R6MMt+TtTBsKEkgpqoaz6d8cRJXTxMG6ZhFcv9F9iOkyFpyWDgGkkDoS0YBPHi1uCrb
 wvP624joO3ULdX0fg/XKUe7ExAC4c5fE5Pct8ULlA1FXHSGgFewP0g2VH110zWqcuuAi
 rp4g==
X-Gm-Message-State: AOAM531nTUY+REtqpQs5rY9WvzHFDFomZTjZczP97Cz36dsaOAjiZo65
 g//DhMB3kXsD47yCrSZNyCbnHyNBzHvXAg==
X-Google-Smtp-Source: ABdhPJxSlAA8z8Wxj7LaaYYG9Frgt+m15ZepCjc3cea1xrA6/94ksKDz9hG/YM7HTHbzVfMCOr7G9g==
X-Received: by 2002:a05:6e02:8ae:b0:2c7:90a5:90b8 with SMTP id
 a14-20020a056e0208ae00b002c790a590b8mr84911ilt.19.1650554532485; 
 Thu, 21 Apr 2022 08:22:12 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:22:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 63/64] tests/tcg/nios2: Add semihosting multiarch tests
Date: Thu, 21 Apr 2022 08:17:34 -0700
Message-Id: <20220421151735.31996-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x134.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add runtime supporting the nios2-semi.c interface.
Execute the hello and memory multiarch tests.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/nios2/semicall.h              |  25 +++
 tests/tcg/nios2/10m50-ghrd.ld           |  59 +++++++
 tests/tcg/nios2/Makefile.softmmu-target |  29 ++++
 tests/tcg/nios2/boot.S                  | 218 ++++++++++++++++++++++++
 tests/tcg/nios2/intr.S                  |  31 ++++
 5 files changed, 362 insertions(+)
 create mode 100644 tests/tcg/nios2/semicall.h
 create mode 100644 tests/tcg/nios2/10m50-ghrd.ld
 create mode 100644 tests/tcg/nios2/Makefile.softmmu-target
 create mode 100644 tests/tcg/nios2/boot.S
 create mode 100644 tests/tcg/nios2/intr.S

diff --git a/tests/tcg/nios2/semicall.h b/tests/tcg/nios2/semicall.h
new file mode 100644
index 0000000000..d7acf665e1
--- /dev/null
+++ b/tests/tcg/nios2/semicall.h
@@ -0,0 +1,25 @@
+/*
+ * Nios2 semihosting interface.
+ */
+
+#ifndef SEMICALL_H
+#define SEMICALL_H
+
+#define HOSTED_EXIT          0
+#define HOSTED_INIT_SIM      1
+#define HOSTED_OPEN          2
+#define HOSTED_CLOSE         3
+#define HOSTED_READ          4
+#define HOSTED_WRITE         5
+#define HOSTED_LSEEK         6
+#define HOSTED_RENAME        7
+#define HOSTED_UNLINK        8
+#define HOSTED_STAT          9
+#define HOSTED_FSTAT         10
+#define HOSTED_GETTIMEOFDAY  11
+#define HOSTED_ISATTY        12
+#define HOSTED_SYSTEM        13
+
+#define semihosting_call     break 1
+
+#endif /* SEMICALL_H */
diff --git a/tests/tcg/nios2/10m50-ghrd.ld b/tests/tcg/nios2/10m50-ghrd.ld
new file mode 100644
index 0000000000..d83e136267
--- /dev/null
+++ b/tests/tcg/nios2/10m50-ghrd.ld
@@ -0,0 +1,59 @@
+MEMORY
+{
+  tpf (rx)  : ORIGIN = 0xc0000000, LENGTH = 1K
+  ram (rwx) : ORIGIN = 0xc8000000, LENGTH = 128M
+}
+
+PHDRS
+{
+  RAM PT_LOAD;
+}
+
+ENTRY(_start)
+EXTERN(_start)
+EXTERN(_interrupt)
+EXTERN(_fast_tlb_miss)
+
+SECTIONS
+{
+    /* Begin at the (hardcoded) _interrupt entry point. */
+    .text 0xc8000120 : {
+        *(.text.intr)
+        *(.text .text.* .gnu.linkonce.t.*)
+    } >ram :RAM
+
+    .rodata : ALIGN(4) {
+        *(.rodata .rodata.* .gnu.linkonce.r.*)
+    } > ram :RAM
+
+    .eh_frame_hdr : ALIGN (4) {
+        KEEP (*(.eh_frame_hdr))
+        *(.eh_frame_entry .eh_frame_entry.*)
+    } >ram :RAM
+    .eh_frame : ALIGN (4) {
+        KEEP (*(.eh_frame)) *(.eh_frame.*)
+    } >ram :RAM
+
+    .data : ALIGN(4) {
+        *(.shdata)
+        *(.data .data.* .gnu.linkonce.d.*)
+        . = ALIGN(4);
+        _gp = ABSOLUTE(. + 0x8000);
+        *(.got.plt) *(.got)
+        *(.lit8)
+        *(.lit4)
+        *(.sdata .sdata.* .gnu.linkonce.s.*)
+    } >ram :RAM
+
+    .bss : ALIGN(4) {
+         __bss_start = ABSOLUTE(.);
+        *(.sbss .sbss.* .gnu.linkonce.sb.*)
+        *(.scommon)
+        *(.bss .bss.* .gnu.linkonce.b.*)
+        *(COMMON)
+        . = ALIGN(4);
+        __bss_end = ABSOLUTE(.);
+    } >ram :RAM
+
+    __stack = ORIGIN(ram) + LENGTH(ram);
+}
diff --git a/tests/tcg/nios2/Makefile.softmmu-target b/tests/tcg/nios2/Makefile.softmmu-target
new file mode 100644
index 0000000000..70664db81c
--- /dev/null
+++ b/tests/tcg/nios2/Makefile.softmmu-target
@@ -0,0 +1,29 @@
+#
+# Nios2 system tests
+#
+
+NIOS2_SYSTEM_SRC = $(SRC_PATH)/tests/tcg/nios2
+VPATH += $(NIOS2_SYSTEM_SRC)
+
+# These objects provide the basic boot code and helper functions for all tests
+CRT_OBJS = boot.o intr.o $(MINILIB_OBJS)
+LINK_SCRIPT = $(NIOS2_SYSTEM_SRC)/10m50-ghrd.ld
+
+CFLAGS  += -nostdlib -g -O0 $(MINILIB_INC)
+LDFLAGS += -Wl,-T$(LINK_SCRIPT) -static -nostdlib $(CRT_OBJS) -lgcc
+
+%.o: %.S
+	$(call quiet-command, $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@, AS, $@)
+
+%.o: %.c
+	$(call quiet-command, $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@, CC, $@)
+
+# Build and link the tests
+%: %.o $(LINK_SCRIPT) $(CRT_OBJS)
+	$(call quiet-command, $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS), LD, $@)
+
+# FIXME: nios2 semihosting writes to stdout, not a chardev
+QEMU_OPTS = -M 10m50-ghrd,vic=on -semihosting >$@.out -kernel
+
+memory: CFLAGS+=-DCHECK_UNALIGNED=0
+TESTS += $(MULTIARCH_TESTS)
diff --git a/tests/tcg/nios2/boot.S b/tests/tcg/nios2/boot.S
new file mode 100644
index 0000000000..f6771cbc81
--- /dev/null
+++ b/tests/tcg/nios2/boot.S
@@ -0,0 +1,218 @@
+/*
+ * Minimal Nios2 system boot code.
+ *
+ * Copyright Linaro Ltd 2022
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "semicall.h"
+
+        .text
+	.set	noat
+
+_start:
+	/* Linker script defines stack at end of ram. */
+	movia	sp, __stack
+
+	/* Install trampoline to _fast_tlb_miss at hardcoded vector. */
+	movia	r4, 0xc0000100
+	movia	r5, _ftm_tramp
+	movi	r6, .L__ftm_end - _ftm_tramp
+	call	memcpy
+
+	/* Zero the bss to satisfy C. */
+	movia	r4, __bss_start
+	movia	r6, __bss_end
+	sub	r6, r6, r4
+	movi	r5, 0
+	call	memset
+
+	/* Test! */
+	call	main
+
+	/* Exit with main's return value. */
+	movi	r4, HOSTED_EXIT
+	mov	r5, r2
+	semihosting_call
+
+	.globl	_start
+	.type	_start, @function
+	.size	_start, . - _start
+
+_ftm_tramp:
+	movia	et, _fast_tlb_miss
+	jmp	et
+.L__ftm_end:
+
+	.type	_ftm_tramp, @function
+	.size	_ftm_tramp, . - _ftm_tramp
+
+#define dst	r4
+#define src	r5
+#define len	r6
+
+memcpy:
+	/* Store return value right away, per API */
+	mov	r2, dst
+
+	/* Check for both dst and src aligned. */
+	or	at, dst, src
+	andi	at, at, 3
+	bne	at, zero, .L_mc_test1
+
+	/* Copy blocks of 8. */
+
+	movi	at, 8
+	bltu	len, at, .L_mc_test4
+
+.L_mc_loop8:
+	ldw	r8, 0(src)
+	ldw	r9, 4(src)
+	addi	src, src, 8
+	addi	dst, dst, 8
+	subi	len, len, 8
+	stw	r8, -8(dst)
+	stw	r9, -4(dst)
+	bgeu	len, at, .L_mc_loop8
+
+	/* Copy final aligned block of 4. */
+
+.L_mc_test4:
+	movi	at, 4
+	bltu	len, at, .L_mc_test1
+
+	ldw	r8, 0(src)
+	addi	src, src, 4
+	addi	dst, dst, 4
+	subi	len, len, 4
+	stw	r8, -4(dst)
+
+	/* Copy single bytes to finish. */
+
+.L_mc_test1:
+	beq	len, zero, .L_mc_done
+
+.L_mc_loop1:
+	ldb	r8, 0(src)
+	addi	src, src, 1
+	addi	dst, dst, 1
+	subi	len, len, 1
+	stb	r8, -1(dst)
+	bne	len, zero, .L_mc_loop1
+
+.L_mc_done:
+	ret
+
+#undef dst
+#undef src
+#undef len
+
+	.global	memcpy
+	.type	memcpy, @function
+	.size	memcpy, . - memcpy
+
+#define dst	r4
+#define val	r5
+#define len	r6
+
+memset:
+	/* Store return value right away, per API */
+	mov	r2, dst
+
+	/* Check for small blocks; fall back to bytewise. */
+	movi	r3, 8
+	bltu	len, r3, .L_ms_test1
+
+	/* Replicate the byte across the word. */
+	andi	val, val, 0xff
+	slli	at, val, 8
+	or	val, val, at
+	slli	at, val, 16
+	or	val, val, at
+
+	/* Check for destination alignment; realign if needed. */
+	andi	at, dst, 3
+	bne	at, zero, .L_ms_align
+
+	/* Set blocks of 8. */
+
+.L_ms_loop8:
+	stw	val, 0(dst)
+	stw	val, 4(dst)
+	addi	dst, dst, 8
+	subi	len, len, 8
+	bgeu	len, r3, .L_ms_loop8
+
+	/* Set final aligned block of 4. */
+
+.L_ms_test4:
+	movi	at, 4
+	bltu	len, at, .L_ms_test1
+
+	stw	r8, 0(dst)
+	addi	dst, dst, 4
+	subi	len, len, 4
+	stw	r8, -4(dst)
+
+	/* Set single bytes to finish. */
+
+.L_ms_test1:
+	beq	len, zero, .L_ms_done
+
+.L_ms_loop1:
+	stb	r8, 0(dst)
+	addi	dst, dst, 1
+	subi	len, len, 1
+	bne	len, zero, .L_ms_loop1
+
+.L_ms_done:
+	ret
+
+	/* Realign for a large block, len >= 8. */
+.L_ms_align:
+	andi	at, dst, 1
+	beq	at, zero, 2f
+
+	stb	val, 0(dst)
+	addi	dst, dst, 1
+	subi	len, len, 1
+
+2:	andi	at, dst, 2
+	beq	at, zero, 4f
+
+	sth	val, 0(dst)
+	addi	dst, dst, 2
+	subi	len, len, 2
+
+4:	bgeu	len, r3, .L_ms_loop8
+	br	.L_ms_test4
+
+#undef dst
+#undef val
+#undef len
+
+	.global	memset
+	.type	memset, @function
+	.size	memset, . - memset
+
+/*
+ * void __sys_outc(char c);
+ */
+__sys_outc:
+	subi	sp, sp, 16
+	stb	r4, 0(sp)	/* buffer[0] = c */
+	movi	at, 1
+	stw	at, 4(sp)	/* STDOUT_FILENO */
+	stw	sp, 8(sp)	/* buffer */
+	stw	at, 12(sp)	/* len */
+
+	movi	r4, HOSTED_WRITE
+	addi	r5, sp, 4
+	semihosting_call
+
+	addi	sp, sp, 16
+	ret
+
+	.global	__sys_outc
+	.type	__sys_outc, @function
+	.size	__sys_outc, . - __sys_outc
diff --git a/tests/tcg/nios2/intr.S b/tests/tcg/nios2/intr.S
new file mode 100644
index 0000000000..c1730692ba
--- /dev/null
+++ b/tests/tcg/nios2/intr.S
@@ -0,0 +1,31 @@
+/*
+ * Minimal Nios2 system boot code -- exit on interrupt.
+ *
+ * Copyright Linaro Ltd 2022
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "semicall.h"
+
+        .section .text.intr, "ax"
+	.global	_interrupt
+	.type	_interrupt, @function
+
+_interrupt:
+	rdctl	r5, exception		/* extract exception.CAUSE */
+	srli	r5, r5, 2
+	movi	r4, HOSTED_EXIT
+	semihosting_call
+
+	.size	_interrupt, . - _interrupt
+
+        .text
+	.global	_fast_tlb_miss
+	.type	_fast_tlb_miss, @function
+
+_fast_tlb_miss:
+	movi	r5, 32
+	movi	r4, HOSTED_EXIT
+	semihosting_call
+
+	.size	_fast_tlb_miss, . - _fast_tlb_miss
-- 
2.34.1


