Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98696454A87
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:06:36 +0100 (CET)
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNSF-0003Ae-MV
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:06:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQD-000098-7V
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:29 -0500
Received: from [2a00:1450:4864:20::42d] (port=41875
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQB-00032b-72
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:28 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a9so5652879wrr.8
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fImwBgyiUxW2cyko0HSyaGAM3opUFv591S/8+t1daM=;
 b=wu+5e7ofA/OOBEA95ehmKjeTVCVHPJzJhXMi5p9R+MD5kZ6NbsXRL0n7vLDTfMVxD5
 rxHpdrVk8RUqf/IWVeSgLivxoKSKOZ/mb7C5V2A48MQl3Ldyju8LZ/6yJ3XOnFEJlQe4
 kYFcx1IENd6tzZpXIHx7Of+IYPwqUtHUhnV6RZfySSwExdUfGS9I/CDrvnxJPxRSBVfl
 A6oLiWcynqL0sh5xx+y8ABOPGPp1sOFxiJS4a2koSIesTYEyc1CvIkzk9OIWHXcy5mdD
 E5gRUH2tRKdmCtyrq5sEkBuH3TmuixKoXZdqCraE9FXa9XteB17Fobc5onAvsSEY4WGd
 66AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fImwBgyiUxW2cyko0HSyaGAM3opUFv591S/8+t1daM=;
 b=OQPuw4hYCDpYAhMQkO/t3UZyU8ruWHNnpx8Os1vEe4CisKUKN/p2bYlktVsvb5R7fa
 lTn2b/PBMwJal1vu2nKZ/nyf/Ou8QCeDiH3MDbjl5GHMsTSBamWMn9CfdBWrQz/7FDBv
 vzl1WKL4bubHCZvMPTNeT2iGqczsnIgGAF63C4I5ZEglQCt2ZJxvWL50MKekZD9jQDgZ
 ss0YhmB2nMj602j0/58FSuMckbhENKvaAeis7YkVpI8VcckYERpRo4iRov3ZrBYWZTm2
 rtC9DiI4HuISLop+q2l5HCpe/yPIoYhWpqDPMoxEAWL6qFTrfntY1xTCPELfOhtuOuYg
 W5PQ==
X-Gm-Message-State: AOAM533Zll5vQTjJpbiCpYyEpLYt2FEPX50v4GzNeEMazW2rXhqqcK4x
 t7R03hXFgpvoCR3j+BjuOIdNj7uvzHatzb5KrdE=
X-Google-Smtp-Source: ABdhPJwyE1t3fNSXbOqI4ooQK5iw+2R9lC5z3ZeKl+qTi8PyR7W8fFCpPyauRf2Z0MaVla++tyve7w==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr21231356wri.322.1637165065751; 
 Wed, 17 Nov 2021 08:04:25 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/17] common-user/host/mips: Add safe-syscall.inc.S
Date: Wed, 17 Nov 2021 17:04:00 +0100
Message-Id: <20211117160412.71563-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 common-user/host/mips/hostdep.h          |   2 +
 common-user/host/mips/safe-syscall.inc.S | 135 +++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 common-user/host/mips/hostdep.h
 create mode 100644 common-user/host/mips/safe-syscall.inc.S

diff --git a/common-user/host/mips/hostdep.h b/common-user/host/mips/hostdep.h
new file mode 100644
index 0000000000..b18aca1deb
--- /dev/null
+++ b/common-user/host/mips/hostdep.h
@@ -0,0 +1,2 @@
+/* We have a safe-syscall.inc.S */
+#define HAVE_SAFE_SYSCALL
diff --git a/common-user/host/mips/safe-syscall.inc.S b/common-user/host/mips/safe-syscall.inc.S
new file mode 100644
index 0000000000..1e2f5a079c
--- /dev/null
+++ b/common-user/host/mips/safe-syscall.inc.S
@@ -0,0 +1,135 @@
+/*
+ * safe-syscall.inc.S : host-specific assembly fragment
+ * to handle signals occurring at the same time as system calls.
+ * This is intended to be included by linux-user/safe-syscall.S
+ *
+ * Written by Richard Henderson <rth@twiddle.net>
+ * Copyright (C) 2021 Linaro, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "sys/regdef.h"
+#include "sys/asm.h"
+
+	.text
+	.set	nomips16
+	.set	noreorder
+
+	.global safe_syscall_start
+	.global safe_syscall_end
+	.type	safe_syscall_start, @function
+	.type	safe_syscall_end, @function
+
+	/*
+	 * This is the entry point for making a system call. The calling
+	 * convention here is that of a C varargs function with the
+	 * first argument an 'int *' to the signal_pending flag, the
+	 * second one the system call number (as a 'long'), and all further
+	 * arguments being syscall arguments (also 'long').
+	 */
+
+#if _MIPS_SIM == _ABIO32
+/* Do not allocate a stack frame and store into the parameter space. */
+#define FRAME   0
+#define ERRNOP  4
+#else
+/* Allocate a stack frame and store into the first allocated slot. */
+#define FRAME   16
+#define ERRNOP  0
+#endif
+
+NESTED(safe_syscall_base, FRAME, ra)
+	.cfi_startproc
+#if _MIPS_SIM == _ABIO32
+	/*
+	 * The syscall calling convention is nearly the same as C:
+	 * we enter with a0 == &signal_pending
+	 *               a1 == &errno
+	 *               a2 == syscall number
+	 *               a3, stack == syscall arguments
+	 *               and return the result in a0
+	 * and the syscall instruction needs
+	 *               v0 == syscall number
+	 *               a0 ... a3, stack == syscall arguments
+	 *               and returns the result in v0
+	 * Shuffle everything around appropriately.
+	 */
+	move	t0, a0		/* signal_pending pointer */
+	sw	a1, ERRNOP(sp)	/* errno pointer */
+	move	v0, a2		/* syscall number */
+	move	a0, a3		/* syscall arguments */
+	lw	a1, 16(sp)
+	lw	a2, 20(sp)
+	lw	a3, 24(sp)
+	lw	t4, 28(sp)
+	lw	t5, 32(sp)
+	lw	t6, 40(sp)
+	lw	t7, 44(sp)
+	sw	t4, 16(sp)
+	sw	t5, 20(sp)
+	sw	t6, 24(sp)
+	sw	t7, 28(sp)
+#else
+	PTR_ADDIU sp, sp, -FRAME
+	.cfi_adjust_cfa_offset FRAME
+
+	/*
+	 * The syscall calling convention is nearly the same as C:
+	 * we enter with a0 == &signal_pending
+	 *               a1 == &errno
+	 *               a2 == syscall number
+	 *               a3 ... a7, stack == syscall arguments
+	 *               and return the result in a0
+	 * and the syscall instruction needs
+	 *               v0 == syscall number
+	 *               a0 ... a5 == syscall arguments
+	 *               and returns the result in v0
+	 * Shuffle everything around appropriately.
+	 */
+	move	t0, a0		/* signal_pending pointer */
+	PTR_S	a1, ERRNOP(sp)	/* save errno pointer */
+	move	v0, a2		/* syscall number */
+	move	a0, a3		/* syscall arguments */
+	move	a1, a4
+	move	a2, a5
+	move	a3, a6
+	move	a4, a7
+	ld	a5, 16(sp)
+#endif
+
+	/*
+	 * This next sequence of code works in conjunction with the
+	 * rewind_if_safe_syscall_function(). If a signal is taken
+	 * and the interrupted PC is anywhere between 'safe_syscall_start'
+	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+	 * The code sequence must therefore be able to cope with this, and
+	 * the syscall instruction must be the final one in the sequence.
+	 */
+safe_syscall_start:
+	/* If signal_pending is non-zero, don't do the call */
+	lw	t1, 0(t0)
+	bnez	t1, 0f
+	 nop
+	syscall
+safe_syscall_end:
+
+	/* code path for having successfully executed the syscall */
+	bnez	a3, 1f
+	 nop
+	jr	ra
+	 PTR_ADDIU sp, sp, FRAME
+
+	/* code path when we didn't execute the syscall */
+0:	li	v0, TARGET_ERESTARTSYS
+
+	/* code path setting errno */
+1:	PTR_L	t0, ERRNOP(sp)
+	sw	v0, 0(t0)		/* store errno */
+	li	v0, -1
+	jr	ra
+	 PTR_ADDIU sp, sp, FRAME
+
+	.cfi_endproc
+END(safe_syscall_base)
-- 
2.25.1


