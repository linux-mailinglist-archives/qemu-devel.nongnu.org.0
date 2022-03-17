Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB24DBEC1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:53:11 +0100 (CET)
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUj4Q-0006ra-S8
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:53:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiON-0005tl-0M
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:43 -0400
Received: from [2607:f8b0:4864:20::1033] (port=40564
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO9-0002gO-KR
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:31 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so622883pjb.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OypOZjm97nIervrNwFNfORUwhAUM3Oj2hEMCC5WyHN8=;
 b=kz2hkfO8HjPC8FeDLDDZp7RggteJ0OEOb0VdY7bpjbk/2y6uVPUwhL8/Bx9tXrSp5S
 i1AZS8dkhLXPRYMiUcwlRQEOhNrq4v6wNGOvQPuJIFsHg/iHqOcEAMPZuOyUPCJCOF9i
 5UApkQq5NGh2Qpskxh5/GRPfs7hhxydLtVus+fFYBEbZoJopp6Kv/4zvHhuSat+mNFS7
 YAEM6EzUlcIO7L67E4YJIQZQ+bWVj434AwFxznMS6W8axZMAG3vX0eFcLbVZvThiLzab
 nW9PQeIN5ZNBpJDtMOCjtk7cklLAdLOaGPYaVOa3EQlqX0KsEMswlMJoezBpYgSKiRe1
 Pb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OypOZjm97nIervrNwFNfORUwhAUM3Oj2hEMCC5WyHN8=;
 b=bGL60U2qWnVRopZgJPcWHOnBwIJKEkVCib42GOM2zXjDnS4MQmIc+D2158F16lqSjj
 fZaPCaGFIe5DC2kI4/Be4lfmrx39pyoJs+C7KVo844tQLdQlJ4OyE1ZlOSdn3QkslDr9
 7x2y9viWrsQDDKIg/v2mAG1nDgKoTZsQCHQkrfaRuxeKl+qPt5kDtEPpyrKE5jcAVNOz
 gRVfnzYnmAYI0GgMSHns1N86WvX2Qm1jo2TNvynTHwazqjF8dStBQzBRj+pcD57iEz4J
 +rJtBFFCtLQZouJfXcdDQXytHy4ns0X6iGttC3uYekprH1JvJhsy0pqBL0wa8uWMDcWA
 IxEw==
X-Gm-Message-State: AOAM533J6/GHCGcKa/+TRkk0al4Zjwj9AF/JXGoF6ITOhV5M/eNl/LRq
 sceVT3Dlsky5mBuuJkSRtZq70PTd0e+HrQ==
X-Google-Smtp-Source: ABdhPJzTt+shRcoJzf6uSmKXkV+tGBmJfXFtMwFZqz5wEc0rWMhPk9fAWbYpx9BaKwsvaFi2r0Z7nw==
X-Received: by 2002:a17:90b:1a8b:b0:1c6:3c6e:3b99 with SMTP id
 ng11-20020a17090b1a8b00b001c63c6e3b99mr12049861pjb.82.1647493768311; 
 Wed, 16 Mar 2022 22:09:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 50/51] test/tcg/nios2: Add semihosting multiarch
 tests
Date: Wed, 16 Mar 2022 22:05:37 -0700
Message-Id: <20220317050538.924111-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add runtime supporting the nios2-semi.c interface.
Execute the hello and memory multiarch tests.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/nios2/semicall.h              | 25 +++++++
 tests/tcg/nios2/10m50-ghrd.ld           | 59 +++++++++++++++++
 tests/tcg/nios2/Makefile.softmmu-target | 32 +++++++++
 tests/tcg/nios2/ml-ftm.S                | 20 ++++++
 tests/tcg/nios2/ml-intr.S               | 21 ++++++
 tests/tcg/nios2/ml-memcpy.S             | 68 +++++++++++++++++++
 tests/tcg/nios2/ml-memset.S             | 88 +++++++++++++++++++++++++
 tests/tcg/nios2/ml-outc.S               | 31 +++++++++
 tests/tcg/nios2/ml-start.S              | 46 +++++++++++++
 9 files changed, 390 insertions(+)
 create mode 100644 tests/tcg/nios2/semicall.h
 create mode 100644 tests/tcg/nios2/10m50-ghrd.ld
 create mode 100644 tests/tcg/nios2/Makefile.softmmu-target
 create mode 100644 tests/tcg/nios2/ml-ftm.S
 create mode 100644 tests/tcg/nios2/ml-intr.S
 create mode 100644 tests/tcg/nios2/ml-memcpy.S
 create mode 100644 tests/tcg/nios2/ml-memset.S
 create mode 100644 tests/tcg/nios2/ml-outc.S
 create mode 100644 tests/tcg/nios2/ml-start.S

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
index 0000000000..20d8d143c6
--- /dev/null
+++ b/tests/tcg/nios2/Makefile.softmmu-target
@@ -0,0 +1,32 @@
+#
+# Nios2 system tests
+#
+
+NIOS2_SYSTEM_SRC = $(SRC_PATH)/tests/tcg/nios2
+VPATH += $(NIOS2_SYSTEM_SRC)
+
+# These objects provide the basic boot code and helper functions for all tests
+CRT_OBJS = minilib.a
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
+minilib.a: ml-intr.o ml-start.o ml-ftm.o ml-outc.o ml-memcpy.o ml-memset.o $(MINILIB_OBJS)
+	$(call quiet-command, $(AR) cqs $@ $^, AR, $@)
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
diff --git a/tests/tcg/nios2/ml-ftm.S b/tests/tcg/nios2/ml-ftm.S
new file mode 100644
index 0000000000..e21da45be5
--- /dev/null
+++ b/tests/tcg/nios2/ml-ftm.S
@@ -0,0 +1,20 @@
+/*
+ * Minimal Nios2 system boot code.
+ *
+ * Copyright Linaro Ltd 2022
+ *
+ * Using semihosting for serial output and exit functions.
+ */
+
+#include "semicall.h"
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
diff --git a/tests/tcg/nios2/ml-intr.S b/tests/tcg/nios2/ml-intr.S
new file mode 100644
index 0000000000..b5a56c686c
--- /dev/null
+++ b/tests/tcg/nios2/ml-intr.S
@@ -0,0 +1,21 @@
+/*
+ * Minimal Nios2 system boot code.
+ *
+ * Copyright Linaro Ltd 2022
+ *
+ * Using semihosting for serial output and exit functions.
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
diff --git a/tests/tcg/nios2/ml-memcpy.S b/tests/tcg/nios2/ml-memcpy.S
new file mode 100644
index 0000000000..8bdd934503
--- /dev/null
+++ b/tests/tcg/nios2/ml-memcpy.S
@@ -0,0 +1,68 @@
+/*
+ * Minimal Nios2 system minilib code: memcpy
+ * Copyright Linaro Ltd 2022
+ */
+
+	.set	noat
+
+        .text
+	.global	memcpy
+	.type	memcpy, @function
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
+	bne	at, zero, .L_test1
+
+	/* Copy blocks of 8. */
+
+	movi	at, 8
+	bltu	len, at, .L_test4
+
+.L_loop8:
+	ldw	r8, 0(src)
+	ldw	r9, 4(src)
+	addi	src, src, 8
+	addi	dst, dst, 8
+	subi	len, len, 8
+	stw	r8, -8(dst)
+	stw	r9, -4(dst)
+	bgeu	len, at, .L_loop8
+
+	/* Copy final aligned block of 4. */
+
+.L_test4:
+	movi	at, 4
+	bltu	len, at, .L_test1
+
+	ldw	r8, 0(src)
+	addi	src, src, 4
+	addi	dst, dst, 4
+	subi	len, len, 4
+	stw	r8, -4(dst)
+
+	/* Copy single bytes to finish. */
+
+.L_test1:
+	beq	len, zero, .L_done
+
+.L_loop1:
+	ldb	r8, 0(src)
+	addi	src, src, 1
+	addi	dst, dst, 1
+	subi	len, len, 1
+	stb	r8, -1(dst)
+	bne	len, zero, .L_loop1
+
+.L_done:
+	ret
+
+	.size	memcpy, . - memcpy
diff --git a/tests/tcg/nios2/ml-memset.S b/tests/tcg/nios2/ml-memset.S
new file mode 100644
index 0000000000..5c9bdde3e0
--- /dev/null
+++ b/tests/tcg/nios2/ml-memset.S
@@ -0,0 +1,88 @@
+/*
+ * Minimal Nios2 system minilib code: memset
+ * Copyright Linaro Ltd 2022
+ */
+
+	.set	noat
+
+        .text
+	.global	memset
+	.type	memset, @function
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
+	bltu	len, r3, .L_test1
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
+	bne	at, zero, .L_align
+
+	/* Set blocks of 8. */
+
+.L_loop8:
+	stw	val, 0(dst)
+	stw	val, 4(dst)
+	addi	dst, dst, 8
+	subi	len, len, 8
+	bgeu	len, r3, .L_loop8
+
+	/* Set final aligned block of 4. */
+
+.L_test4:
+	movi	at, 4
+	bltu	len, at, .L_test1
+
+	stw	r8, 0(dst)
+	addi	dst, dst, 4
+	subi	len, len, 4
+	stw	r8, -4(dst)
+
+	/* Set single bytes to finish. */
+
+.L_test1:
+	beq	len, zero, .L_done
+
+.L_loop1:
+	stb	r8, 0(dst)
+	addi	dst, dst, 1
+	subi	len, len, 1
+	bne	len, zero, .L_loop1
+
+.L_done:
+	ret
+
+	/* Realign for a large block, len >= 8. */
+.L_align:
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
+4:	bgeu	len, r3, .L_loop8
+	br	.L_test4
+
+	.size	memset, . - memset
diff --git a/tests/tcg/nios2/ml-outc.S b/tests/tcg/nios2/ml-outc.S
new file mode 100644
index 0000000000..e13f0f2581
--- /dev/null
+++ b/tests/tcg/nios2/ml-outc.S
@@ -0,0 +1,31 @@
+/*
+ * Minimal Nios2 system minilib code: __sys_outc
+ * Copyright Linaro Ltd 2022
+ */
+
+#include "semicall.h"
+
+        .text
+	.global	__sys_outc
+	.type	__sys_outc, @function
+	.set	noat
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
+	.size	__sys_outc, . - __sys_outc
diff --git a/tests/tcg/nios2/ml-start.S b/tests/tcg/nios2/ml-start.S
new file mode 100644
index 0000000000..68b612d70b
--- /dev/null
+++ b/tests/tcg/nios2/ml-start.S
@@ -0,0 +1,46 @@
+/*
+ * Minimal Nios2 system boot code.
+ * Copyright Linaro Ltd 2022
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
-- 
2.25.1


