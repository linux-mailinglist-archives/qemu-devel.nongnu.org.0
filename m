Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14713454AB0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:11:48 +0100 (CET)
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNXH-0005mA-6E
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:11:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQF-0000EU-2F
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:31 -0500
Received: from [2a00:1450:4864:20::42a] (port=46639
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQ9-00032G-OI
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u1so5618949wru.13
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xoq3219+S6QUhn6Pd7je4gi18GFwEZswxg82Ghhg8EE=;
 b=P+l/XvCQZrOVPxVIP0T98ZqQXKX2HBXCuqKKr5tmp/B4aI/5znCkGFXe9eUuxDYT3u
 Ao5zRc72h7WXTij8EDllmu/Ue6g8zxvbzG/NmmH8bKqpNgBfG3jsyTsjljyCn+ITfsfC
 UFK8tTivXlyp9xIIrPZoVzTAToPfyonq5CZ6n0hvHrozcsE137en5uixSy2sjsX7w67b
 8x0UUaUx6tCPkxagYCM2WeCwwhALelOKog/j09CsG69EbJaMlUmdySN8lTpbqyx9FaVV
 smokeFd8oIpNgHQtc0im1P8X0M+yZVqFA0WUIExNu6Jgomt5k0b0nOiS6NCVuWavLTHB
 jEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xoq3219+S6QUhn6Pd7je4gi18GFwEZswxg82Ghhg8EE=;
 b=p0GX9a8hDL8BLq1TNmw28hLG+AQPvuL6K+rums1Ol27T+U0n1hWLDHXAVfvbFd3YQX
 hECMVb71BfpEMGEpiSE51jjtIxHe109Z3lHOh5b2twrSM12y6J558MfgFiARF/VukRhs
 ie7DBUP5UCZy/YCrvTmDHwqDkNSMPZePT2ssWbyN4iW1pCWrgNKne8WBAhEwZhJeaogv
 EIDsNkklbXHuBcI8OYLFq+CEl/h/1g78UIH7XIu1ndCHmM0dc6ROj6csHThi/b27IIzZ
 +9IHzvYmg+zntk5sYKFDjd1qeAso2wYyav8VQNLJ6xWW5+PK5i1cUmkszOrLxfYk2Aab
 HeJw==
X-Gm-Message-State: AOAM530DGa+AiEEb399xtnoXAGre5FawCdfF1Mul2OjNuDpkXsJv1XCD
 rpgDdqWBFQzUmVza36ZNR5OLdB+YaxM0wCp2NDY=
X-Google-Smtp-Source: ABdhPJzvJUiL+VfrVFFno8F8ZY37XSwL5oZE8e21M7W08W7OJxRErj5RllbvRV49r0LiMs24FUC9Ig==
X-Received: by 2002:adf:e991:: with SMTP id h17mr20727232wrm.40.1637165064113; 
 Wed, 17 Nov 2021 08:04:24 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/17] common-user: Move syscall error detection into
 safe_syscall_base
Date: Wed, 17 Nov 2021 17:03:59 +0100
Message-Id: <20211117160412.71563-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current api from safe_syscall_base() is to return -errno, which is
the interface provided by *some* linux kernel abis.  The wrapper macro,
safe_syscall(), detects error, stores into errno, and returns -1, to
match the api of the system syscall().

For those kernel abis that do not return -errno natively, this leads
to double syscall error detection.  E.g. Linux ppc64, which sets the
SO flag for error.

Simplify the usage from C by moving the error detection into assembly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/safe-syscall.h                   | 20 +++---
 common-user/host/aarch64/safe-syscall.inc.S | 55 +++++++++-------
 common-user/host/arm/safe-syscall.inc.S     | 58 ++++++++++-------
 common-user/host/i386/safe-syscall.inc.S    | 51 +++++++++------
 common-user/host/ppc64/safe-syscall.inc.S   | 63 +++++++++++--------
 common-user/host/riscv/safe-syscall.inc.S   | 50 +++++++++------
 common-user/host/s390x/safe-syscall.inc.S   | 50 +++++++++------
 common-user/host/x86_64/safe-syscall.inc.S  | 70 ++++++++++++---------
 8 files changed, 243 insertions(+), 174 deletions(-)

diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
index aaa9ffc0e2..ea0e8a8d24 100644
--- a/linux-user/safe-syscall.h
+++ b/linux-user/safe-syscall.h
@@ -125,23 +125,17 @@
  * kinds of restartability.
  */
 #ifdef HAVE_SAFE_SYSCALL
-/* The core part of this function is implemented in assembly */
-extern long safe_syscall_base(int *pending, long number, ...);
+
+/* The core part of this function is implemented in assembly. */
+extern long safe_syscall_base(int *pending, int *errnop, long number, ...);
+
 /* These are defined by the safe-syscall.inc.S file */
 extern char safe_syscall_start[];
 extern char safe_syscall_end[];
 
-#define safe_syscall(...)                                               \
-    ({                                                                  \
-        long ret_;                                                      \
-        int *psp_ = &((TaskState *)thread_cpu->opaque)->signal_pending; \
-        ret_ = safe_syscall_base(psp_, __VA_ARGS__);                    \
-        if (is_error(ret_)) {                                           \
-            errno = -ret_;                                              \
-            ret_ = -1;                                                  \
-        }                                                               \
-        ret_;                                                           \
-    })
+#define safe_syscall(...)                                                 \
+    safe_syscall_base(&((TaskState *)thread_cpu->opaque)->signal_pending, \
+                      &errno, __VA_ARGS__)
 
 #else
 
diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
index bc1f5a9792..95c60d8609 100644
--- a/common-user/host/aarch64/safe-syscall.inc.S
+++ b/common-user/host/aarch64/safe-syscall.inc.S
@@ -17,22 +17,21 @@
 	.type	safe_syscall_start, #function
 	.type	safe_syscall_end, #function
 
-	/* This is the entry point for making a system call. The calling
+	/*
+	 * This is the entry point for making a system call. The calling
 	 * convention here is that of a C varargs function with the
 	 * first argument an 'int *' to the signal_pending flag, the
 	 * second one the system call number (as a 'long'), and all further
 	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
 	 */
 safe_syscall_base:
 	.cfi_startproc
-	/* The syscall calling convention isn't the same as the
-	 * C one:
+	/*
+         * The syscall calling convention isn't the same as the C one:
 	 * we enter with x0 == *signal_pending
-	 *               x1 == syscall number
-	 *               x2 ... x7, (stack) == syscall arguments
+	 *               x1 == errno
+	 *               x2 == syscall number
+	 *               x3 ... x7, (stack) == syscall arguments
 	 *               and return the result in x0
 	 * and the syscall instruction needs
 	 *               x8 == syscall number
@@ -40,17 +39,18 @@ safe_syscall_base:
 	 *               and returns the result in x0
 	 * Shuffle everything around appropriately.
 	 */
-	mov	x9, x0		/* signal_pending pointer */
-	mov	x8, x1		/* syscall number */
-	mov	x0, x2		/* syscall arguments */
-	mov	x1, x3
-	mov	x2, x4
-	mov	x3, x5
-	mov	x4, x6
-	mov	x5, x7
-	ldr	x6, [sp]
+	mov	x10, x0		/* signal_pending pointer */
+	mov	x11, x1		/* errno pointer */
+	mov	x8, x2		/* syscall number */
+	mov	x0, x3		/* syscall arguments */
+	mov	x1, x4
+	mov	x2, x5
+	mov	x3, x6
+	mov	x4, x7
+	ldp	x5, x6, [sp]
 
-	/* This next sequence of code works in conjunction with the
+	/*
+         * This next sequence of code works in conjunction with the
 	 * rewind_if_safe_syscall_function(). If a signal is taken
 	 * and the interrupted PC is anywhere between 'safe_syscall_start'
 	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
@@ -59,17 +59,26 @@ safe_syscall_base:
 	 */
 safe_syscall_start:
 	/* if signal_pending is non-zero, don't do the call */
-	ldr	w10, [x9]
-	cbnz	w10, 0f 
+	ldr	w9, [x10]
+	cbnz	w9, 2f
 	svc	0x0
 safe_syscall_end:
+
 	/* code path for having successfully executed the syscall */
+	cmn	x0, #4095
+	b.cs	1f
 	ret
 
-0:
-	/* code path when we didn't execute the syscall */
-	mov	x0, #-TARGET_ERESTARTSYS
+	/* code path setting errno */
+0:	neg	w0, w0			/* create positive errno */
+1:	str	w0, [x11]		/* store errno */
+	mov	x0, #-1
 	ret
+
+	/* code path when we didn't execute the syscall */
+2:	mov	w0, #TARGET_ERESTARTSYS
+	b	1b
+
 	.cfi_endproc
 
 	.size	safe_syscall_base, .-safe_syscall_base
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
index 88c4958504..17839c6486 100644
--- a/common-user/host/arm/safe-syscall.inc.S
+++ b/common-user/host/arm/safe-syscall.inc.S
@@ -22,33 +22,35 @@
 	.arm
 	.align 2
 
-	/* This is the entry point for making a system call. The calling
+	/*
+	 * This is the entry point for making a system call. The calling
 	 * convention here is that of a C varargs function with the
 	 * first argument an 'int *' to the signal_pending flag, the
 	 * second one the system call number (as a 'long'), and all further
 	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
 	 */
 safe_syscall_base:
 	.fnstart
 	.cfi_startproc
 	mov	r12, sp			/* save entry stack */
-	push	{ r4, r5, r6, r7, r8, lr }
-	.save	{ r4, r5, r6, r7, r8, lr }
-	.cfi_adjust_cfa_offset 24
+	push	{ r4, r5, r6, r7, r8, r9, r10, lr }
+	.save	{ r4, r5, r6, r7, r8, r9, r10, lr }
+	.cfi_adjust_cfa_offset 32
 	.cfi_rel_offset r4, 0
 	.cfi_rel_offset r5, 4
 	.cfi_rel_offset r6, 8
 	.cfi_rel_offset r7, 12
 	.cfi_rel_offset r8, 16
-	.cfi_rel_offset lr, 20
+	.cfi_rel_offset r9, 20
+	.cfi_rel_offset r10, 24
+	.cfi_rel_offset lr, 28
 
-	/* The syscall calling convention isn't the same as the C one:
-	 * we enter with r0 == *signal_pending
-	 *               r1 == syscall number
-	 *               r2, r3, [sp+0] ... [sp+12] == syscall arguments
+	/*
+	 * The syscall calling convention isn't the same as the C one:
+	 * we enter with r0 == &signal_pending
+         *               r1 == &errno
+	 *               r2 == syscall number
+	 *               r3, [sp+0] ... [sp+16] == syscall arguments
 	 *               and return the result in r0
 	 * and the syscall instruction needs
 	 *               r7 == syscall number
@@ -58,12 +60,13 @@ safe_syscall_base:
 	 * Note the 16 bytes that we pushed to save registers.
 	 */
 	mov	r8, r0			/* copy signal_pending */
-	mov	r7, r1			/* syscall number */
-	mov	r0, r2			/* syscall args */
-	mov	r1, r3
-	ldm	r12, { r2, r3, r4, r5, r6 }
+	mov	r9, r1			/* copy errnop */
+	mov	r7, r2			/* syscall number */
+	mov	r0, r3			/* syscall args */
+	ldm	r12, { r1, r2, r3, r4, r5, r6 }
 
-	/* This next sequence of code works in conjunction with the
+	/*
+	 * This next sequence of code works in conjunction with the
 	 * rewind_if_safe_syscall_function(). If a signal is taken
 	 * and the interrupted PC is anywhere between 'safe_syscall_start'
 	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
@@ -74,16 +77,25 @@ safe_syscall_start:
 	/* if signal_pending is non-zero, don't do the call */
 	ldr	r12, [r8]		/* signal_pending */
 	tst	r12, r12
-	bne	1f
+	bne	2f
 	swi	0
 safe_syscall_end:
-	/* code path for having successfully executed the syscall */
-	pop	{ r4, r5, r6, r7, r8, pc }
 
-1:
+	/* code path for having successfully executed the syscall */
+	cmp	r0, #-4096
+	bhi	0f
+9:	pop	{ r4, r5, r6, r7, r8, r9, r10, pc }
+
+	/* code path setting errno */
+0:	neg	r0, r0		/* create positive errno */
+1:	str	r0, [r9]	/* store errno */
+	mov	r0, #-1
+	b	9b
+
 	/* code path when we didn't execute the syscall */
-	ldr	r0, =-TARGET_ERESTARTSYS
-	pop	{ r4, r5, r6, r7, r8, pc }
+2:	ldr	r0, =TARGET_ERESTARTSYS
+	b	1b
+
 	.fnend
 	.cfi_endproc
 
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index 9e58fc6504..ad89521783 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -15,14 +15,12 @@
 	.global safe_syscall_end
 	.type	safe_syscall_base, @function
 
-	/* This is the entry point for making a system call. The calling
+	/*
+	 * This is the entry point for making a system call. The calling
 	 * convention here is that of a C varargs function with the
 	 * first argument an 'int *' to the signal_pending flag, the
 	 * second one the system call number (as a 'long'), and all further
 	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
 	 */
 safe_syscall_base:
 	.cfi_startproc
@@ -41,9 +39,10 @@ safe_syscall_base:
 
 	/* The syscall calling convention isn't the same as the C one:
 	 * we enter with 0(%esp) == return address
-	 *               4(%esp) == *signal_pending
-	 *               8(%esp) == syscall number
-	 *               12(%esp) ... 32(%esp) == syscall arguments
+	 *               4(%esp) == &signal_pending
+	 *               8(%esp) == &errno
+	 *               12(%esp) == syscall number
+	 *               16(%esp) ... 36(%esp) == syscall arguments
 	 *               and return the result in eax
 	 * and the syscall instruction needs
 	 *               eax == syscall number
@@ -52,14 +51,15 @@ safe_syscall_base:
 	 * Shuffle everything around appropriately.
 	 * Note the 16 bytes that we pushed to save registers.
 	 */
-	mov	12+16(%esp), %ebx	/* the syscall arguments */
-	mov	16+16(%esp), %ecx
-	mov	20+16(%esp), %edx
-	mov	24+16(%esp), %esi
-	mov	28+16(%esp), %edi
-	mov	32+16(%esp), %ebp
+	mov	16+16(%esp), %ebx	/* the syscall arguments */
+	mov	20+16(%esp), %ecx
+	mov	24+16(%esp), %edx
+	mov	28+16(%esp), %esi
+	mov	32+16(%esp), %edi
+	mov	36+16(%esp), %ebp
 
-	/* This next sequence of code works in conjunction with the
+	/*
+	 * This next sequence of code works in conjunction with the
 	 * rewind_if_safe_syscall_function(). If a signal is taken
 	 * and the interrupted PC is anywhere between 'safe_syscall_start'
 	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
@@ -70,12 +70,16 @@ safe_syscall_start:
 	/* if signal_pending is non-zero, don't do the call */
 	mov	4+16(%esp), %eax	/* signal_pending */
 	cmpl	$0, (%eax)
-	jnz	1f
+	jnz	2f
 	mov	8+16(%esp), %eax	/* syscall number */
 	int	$0x80
 safe_syscall_end:
+
 	/* code path for having successfully executed the syscall */
-	pop	%ebx
+	cmp	$-4095, %eax
+	jae	0f
+
+9:	pop	%ebx
 	.cfi_remember_state
 	.cfi_adjust_cfa_offset -4
 	.cfi_restore ebx
@@ -90,11 +94,18 @@ safe_syscall_end:
 	.cfi_restore ebp
 	ret
 
-1:
-	/* code path when we didn't execute the syscall */
 	.cfi_restore_state
-	mov	$-TARGET_ERESTARTSYS, %eax
-	jmp	safe_syscall_end
+
+	/* code path setting errno */
+0:	neg	%eax			/* create positive errno */
+1:	mov	8+16(%esp), %ebx	/* load errno pointer */
+	mov	%eax, (%ebx)		/* store errno */
+	mov	$-1, %eax
+	jmp	9b
+
+	/* code path when we didn't execute the syscall */
+2:	mov	$TARGET_ERESTARTSYS, %eax
+	jmp	1b
 	.cfi_endproc
 
 	.size	safe_syscall_base, .-safe_syscall_base
diff --git a/common-user/host/ppc64/safe-syscall.inc.S b/common-user/host/ppc64/safe-syscall.inc.S
index 875133173b..e35408c5fb 100644
--- a/common-user/host/ppc64/safe-syscall.inc.S
+++ b/common-user/host/ppc64/safe-syscall.inc.S
@@ -17,14 +17,19 @@
 
 	.text
 
-	/* This is the entry point for making a system call. The calling
+#if _CALL_ELF == 2
+#define PARAM_OFS   32
+#else
+#define PARAM_OFS   48
+#endif
+#define PARAM(X)    PARAM_OFS + X*8
+
+	/*
+	 * This is the entry point for making a system call. The calling
 	 * convention here is that of a C varargs function with the
 	 * first argument an 'int *' to the signal_pending flag, the
 	 * second one the system call number (as a 'long'), and all further
 	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
 	 */
 #if _CALL_ELF == 2
 safe_syscall_base:
@@ -39,9 +44,11 @@ safe_syscall_base:
 .L.safe_syscall_base:
 	.cfi_startproc
 #endif
-	/* We enter with r3 == *signal_pending
-	 *               r4 == syscall number
-	 *               r5 ... r10 == syscall arguments
+	/*
+	 * We enter with r3 == &signal_pending
+	 *               r4 == &errno
+	 *               r5 == syscall number
+	 *               r6 ... r10, (stack) == syscall arguments
 	 *               and return the result in r3
 	 * and the syscall instruction needs
 	 *               r0 == syscall number
@@ -49,18 +56,18 @@ safe_syscall_base:
 	 *               and returns the result in r3
 	 * Shuffle everything around appropriately.
 	 */
-	std     14, 16(1) /* Preserve r14 in SP+16 */
-	.cfi_offset 14, 16
-	mr	14, 3	/* signal_pending */
-	mr	0, 4	/* syscall number */
-	mr	3, 5	/* syscall arguments */
-	mr	4, 6
-	mr	5, 7
-	mr	6, 8
-	mr	7, 9
-	mr	8, 10
+	mr	11, 3		/* signal_pending pointer */
+	std	4, PARAM(1)(1)	/* save errno pointer in param slot */
+	mr	0, 5		/* syscall number */
+	mr	3, 6		/* syscall arguments */
+	mr	4, 7
+	mr	5, 8
+	mr	6, 9
+	mr	7, 10
+	ld	8, PARAM(8)(1)
 
-	/* This next sequence of code works in conjunction with the
+	/*
+	 * This next sequence of code works in conjunction with the
 	 * rewind_if_safe_syscall_function(). If a signal is taken
 	 * and the interrupted PC is anywhere between 'safe_syscall_start'
 	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
@@ -69,23 +76,25 @@ safe_syscall_base:
 	 */
 safe_syscall_start:
 	/* if signal_pending is non-zero, don't do the call */
-	lwz	12, 0(14)
+	lwz	12, 0(11)
 	cmpwi	0, 12, 0
 	bne-	0f
 	sc
 safe_syscall_end:
-	/* code path when we did execute the syscall */
-	ld 14, 16(1) /* restore r14 to its original value */
-	bnslr+
 
-	/* syscall failed; return negative errno */
-	neg	3, 3
+	/* code path for having successfully executed the syscall */
+	bnslr+			/* SO set for syscall error */
+
+	/* code path setting errno */
+1:	ld	11, PARAM(1)(1)	/* restore errno pointer */
+	stw	3, 0(11)	/* store errno */
+	li	3, -1
 	blr
 
 	/* code path when we didn't execute the syscall */
-0:	addi	3, 0, -TARGET_ERESTARTSYS
-	ld 14, 16(1) /* restore r14 to its original value */
-	blr
+0:	li	3, TARGET_ERESTARTSYS
+	b	1b
+
 	.cfi_endproc
 
 #if _CALL_ELF == 2
diff --git a/common-user/host/riscv/safe-syscall.inc.S b/common-user/host/riscv/safe-syscall.inc.S
index 9ca3fbfd1e..eddede702b 100644
--- a/common-user/host/riscv/safe-syscall.inc.S
+++ b/common-user/host/riscv/safe-syscall.inc.S
@@ -23,17 +23,15 @@
 	 * first argument an 'int *' to the signal_pending flag, the
 	 * second one the system call number (as a 'long'), and all further
 	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
 	 */
 safe_syscall_base:
 	.cfi_startproc
 	/*
 	 * The syscall calling convention is nearly the same as C:
-	 * we enter with a0 == *signal_pending
-	 *               a1 == syscall number
-	 *               a2 ... a7 == syscall arguments
+	 * we enter with a0 == &signal_pending
+	 *               a1 == &errno
+	 *               a2 == syscall number
+	 *               a3 ... a7, [sp] == syscall arguments
 	 *               and return the result in a0
 	 * and the syscall instruction needs
 	 *               a7 == syscall number
@@ -42,14 +40,19 @@ safe_syscall_base:
 	 * Shuffle everything around appropriately.
 	 */
 	mv	t0, a0		/* signal_pending pointer */
-	mv	t1, a1		/* syscall number */
-	mv	a0, a2		/* syscall arguments */
-	mv	a1, a3
-	mv	a2, a4
-	mv	a3, a5
-	mv	a4, a6
-	mv	a5, a7
-	mv	a7, t1
+	mv	t1, a1		/* errno pointer */
+	mv	t2, a2		/* syscall number */
+	mv	a0, a3		/* syscall arguments */
+	mv	a1, a4
+	mv	a2, a5
+	mv	a3, a6
+	mv	a4, a7
+#if __riscv_xlen == 32
+	lw	a5, 0(sp)
+#else
+	ld	a5, 0(sp)
+#endif
+	mv	a7, t2
 
 	/*
 	 * This next sequence of code works in conjunction with the
@@ -61,17 +64,26 @@ safe_syscall_base:
 	 */
 safe_syscall_start:
 	/* If signal_pending is non-zero, don't do the call */
-	lw	t1, 0(t0)
-	bnez	t1, 0f
+	lw	t2, 0(t0)
+	bnez	t2, 2f
 	scall
 safe_syscall_end:
+
 	/* code path for having successfully executed the syscall */
+	li	t2, -4096
+	bgtu	a0, t2, 0f
 	ret
 
-0:
-	/* code path when we didn't execute the syscall */
-	li	a0, -TARGET_ERESTARTSYS
+	/* code path setting errno */
+0:	neg	a0, a0			/* create positive errno */
+1:	sw	a0, 0(t1)		/* store errno */
+	li	a0, -1
 	ret
+
+	/* code path when we didn't execute the syscall */
+2:	li	a0, TARGET_ERESTARTSYS
+	j	1b
+
 	.cfi_endproc
 
 	.size	safe_syscall_base, .-safe_syscall_base
diff --git a/common-user/host/s390x/safe-syscall.inc.S b/common-user/host/s390x/safe-syscall.inc.S
index 414b44ad38..f2a3bccc13 100644
--- a/common-user/host/s390x/safe-syscall.inc.S
+++ b/common-user/host/s390x/safe-syscall.inc.S
@@ -15,14 +15,12 @@
 	.global safe_syscall_end
 	.type	safe_syscall_base, @function
 
-	/* This is the entry point for making a system call. The calling
+	/*
+	 * This is the entry point for making a system call. The calling
 	 * convention here is that of a C varargs function with the
 	 * first argument an 'int *' to the signal_pending flag, the
 	 * second one the system call number (as a 'long'), and all further
 	 * arguments being syscall arguments (also 'long').
-	 * We return a long which is the syscall's return value, which
-	 * may be negative-errno on failure. Conversion to the
-	 * -1-and-errno-set convention is done by the calling wrapper.
 	 */
 safe_syscall_base:
 	.cfi_startproc
@@ -44,11 +42,13 @@ safe_syscall_base:
 	stg	%r1,0(%r15)		/* store back chain */
 	stg	%r0,8(%r15)		/* store eos */
 
-	/* The syscall calling convention isn't the same as the
+	/*
+	 * The syscall calling convention isn't the same as the
 	 * C one:
-	 * we enter with r2 == *signal_pending
-	 *               r3 == syscall number
-	 *               r4, r5, r6, (stack) == syscall arguments
+	 * we enter with r2 == &signal_pending
+	 *               r3 == &errno
+	 *               r4 == syscall number
+	 *               r5, r6, (stack) == syscall arguments
 	 *               and return the result in r2
 	 * and the syscall instruction needs
 	 *               r1 == syscall number
@@ -57,13 +57,14 @@ safe_syscall_base:
 	 * Shuffle everything around appropriately.
 	 */
 	lgr	%r8,%r2			/* signal_pending pointer */
-	lgr	%r1,%r3			/* syscall number */
-	lgr	%r2,%r4			/* syscall args */
-	lgr	%r3,%r5
-	lgr	%r4,%r6
-	lmg	%r5,%r7,320(%r15)
+	lgr	%r9,%r3			/* errno pointer */
+	lgr	%r1,%r4			/* syscall number */
+	lgr	%r2,%r5			/* syscall args */
+	lgr	%r3,%r6
+	lmg	%r4,%r7,320(%r15)
 
-	/* This next sequence of code works in conjunction with the
+	/*
+	 * This next sequence of code works in conjunction with the
 	 * rewind_if_safe_syscall_function(). If a signal is taken
 	 * and the interrupted PC is anywhere between 'safe_syscall_start'
 	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
@@ -73,18 +74,31 @@ safe_syscall_base:
 safe_syscall_start:
 	/* if signal_pending is non-zero, don't do the call */
 	icm	%r0,15,0(%r8)
-	jne	2f
+	jne	1f
 	svc	0
 safe_syscall_end:
 
-1:	lg	%r15,0(%r15)		/* load back chain */
+	/* code path for having successfully executed the syscall */
+	lghi	%r0, -4095		/* check for syscall error */
+	clgr	%r2, %r0
+	jgnl	0f
+
+9:	lg	%r15,0(%r15)		/* load back chain */
 	.cfi_remember_state
 	.cfi_adjust_cfa_offset -160
 	lmg	%r6,%r15,48(%r15)	/* load saved registers */
 	br	%r14
 	.cfi_restore_state
-2:	lghi	%r2, -TARGET_ERESTARTSYS
-	j	1b
+
+	/* code path when we didn't execute the syscall */
+1:	lghi	%r2, -TARGET_ERESTARTSYS
+
+	/* code path setting errno */
+0:	lcr	%r2, %r2		/* create positive errno */
+	st	%r2, 0(%r9)		/* store errno */
+	lghi	%r2, -1
+	j	9b
+
 	.cfi_endproc
 
 	.size	safe_syscall_base, .-safe_syscall_base
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
index f36992daa3..9a0c4c93b4 100644
--- a/common-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -14,18 +14,17 @@
         .global safe_syscall_end
         .type   safe_syscall_base, @function
 
-        /* This is the entry point for making a system call. The calling
+        /*
+         * This is the entry point for making a system call. The calling
          * convention here is that of a C varargs function with the
          * first argument an 'int *' to the signal_pending flag, the
          * second one the system call number (as a 'long'), and all further
          * arguments being syscall arguments (also 'long').
-         * We return a long which is the syscall's return value, which
-         * may be negative-errno on failure. Conversion to the
-         * -1-and-errno-set convention is done by the calling wrapper.
          */
 safe_syscall_base:
         .cfi_startproc
-        /* This saves a frame pointer and aligns the stack for the syscall.
+        /*
+         * This saves a frame pointer and aligns the stack for the syscall.
          * (It's unclear if the syscall ABI has the same stack alignment
          * requirements as the userspace function call ABI, but better safe than
          * sorry. Appendix A2 of http://www.x86-64.org/documentation/abi.pdf
@@ -35,11 +34,12 @@ safe_syscall_base:
         .cfi_adjust_cfa_offset 8
         .cfi_rel_offset rbp, 0
 
-        /* The syscall calling convention isn't the same as the
-         * C one:
-         * we enter with rdi == *signal_pending
-         *               rsi == syscall number
-         *               rdx, rcx, r8, r9, (stack), (stack) == syscall arguments
+        /*
+         * The syscall calling convention isn't the same as the C one:
+         * we enter with rdi == &signal_pending
+         *               rsi == &errno
+         *               rdx == syscall number
+         *               rcx, r8, r9, (stack...) == syscall arguments
          *               and return the result in rax
          * and the syscall instruction needs
          *               rax == syscall number
@@ -48,17 +48,19 @@ safe_syscall_base:
          * Shuffle everything around appropriately.
          * Note that syscall will trash rcx and r11.
          */
-        mov     %rsi, %rax /* syscall number */
-        mov     %rdi, %rbp /* signal_pending pointer */
+        mov     %rdi, %r11 /* signal_pending pointer */
+        mov     %rsi, %rbp /* errno pointer */
+        mov     %rdx, %rax /* syscall number */
         /* and the syscall arguments */
-        mov     %rdx, %rdi
-        mov     %rcx, %rsi
-        mov     %r8,  %rdx
-        mov     %r9,  %r10
-        mov     16(%rsp), %r8
-        mov     24(%rsp), %r9
+        mov     %rcx, %rdi
+        mov     %r8, %rsi
+        mov     %r9,  %rdx
+        mov     16(%rsp), %r10
+        mov     24(%rsp), %r8
+        mov     32(%rsp), %r9
 
-        /* This next sequence of code works in conjunction with the
+        /*
+         * This next sequence of code works in conjunction with the
          * rewind_if_safe_syscall_function(). If a signal is taken
          * and the interrupted PC is anywhere between 'safe_syscall_start'
          * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
@@ -67,25 +69,31 @@ safe_syscall_base:
          */
 safe_syscall_start:
         /* if signal_pending is non-zero, don't do the call */
-        cmpl	$0, (%rbp)
-        jnz     1f
+        cmpl    $0, (%r11)
+        jnz     2f
         syscall
 safe_syscall_end:
+
         /* code path for having successfully executed the syscall */
-        pop     %rbp
+        cmp	$-4095, %rax
+        jae	0f
+
+9:      pop     %rbp
         .cfi_remember_state
         .cfi_def_cfa_offset 8
         .cfi_restore rbp
         ret
-
-1:
-        /* code path when we didn't execute the syscall */
         .cfi_restore_state
-        mov     $-TARGET_ERESTARTSYS, %rax
-        pop     %rbp
-        .cfi_def_cfa_offset 8
-        .cfi_restore rbp
-        ret
-        .cfi_endproc
 
+        /* code path setting errno */
+0:      neg	%eax			/* create positive errno */
+1:      mov	%eax, (%rbp)		/* store errno */
+        mov	$-1, %rax
+        jmp	9b
+
+        /* code path when we didn't execute the syscall */
+2:      mov     $TARGET_ERESTARTSYS, %eax
+        jmp	1b
+
+        .cfi_endproc
         .size   safe_syscall_base, .-safe_syscall_base
-- 
2.25.1


