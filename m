Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07D452FEB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:09:26 +0100 (CET)
Received: from localhost ([::1]:33862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwL7-0006DE-It
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:09:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF8-0001wQ-D5
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:14 -0500
Received: from [2a00:1450:4864:20::329] (port=56064
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF1-0004vL-MM
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:14 -0500
Received: by mail-wm1-x329.google.com with SMTP id p18so7170596wmq.5
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fImwBgyiUxW2cyko0HSyaGAM3opUFv591S/8+t1daM=;
 b=Bx1EDe6endb4vBcTy97thv4Fbl2+EuYoq+0wEKIa9Afi8wREUJBOzzxrc5aj5LxGxX
 SsJGIDQZScqQvsm7gu59K5KRla7wag6/yDq4qFL7t4qsPQBZWuObSzeuOy3YMiNoqUEJ
 0CrusgUbwIe5CEZbsC8q3Z+Nd9QOGTK81MJCa/jd86/Hvc/OH8yEB2yDfPbTZPM+/5+c
 fgWsr4Fkq9os88ZbL5a66sZvWCIOBOU2kqtDHjYRO5+woRbHMvLJXoskgkA1XPnMwiJ1
 Y7J0c4nGAAEj12hp8/ME7D67FhteeVTvaeHCNiflvhzBo7Ot0CXgaSUKYt6kMtZJH/BS
 jgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fImwBgyiUxW2cyko0HSyaGAM3opUFv591S/8+t1daM=;
 b=NqUYjh6wEUPtv9WS30sF9GaSJP7GaIuQUYXIUqIDKSTMOPmVgV8t/3FeNZykyN+oml
 T/wq2SAUht+aTcRQoGtXdQj1SopAGByz3A7tu1GPgqMNC9ZoDHO0IPSyC4orobJ9OD7w
 EDJ9SCwJfBb+RJYMz5T7yQzIT3Z+Ofw/n8JBfo7W9v7XjiCtXgSEdHokiAkYk0Co5xzI
 W8Moa7keBy6UFrqqyoDYrZtDU0hsAJHsYLn98xiWPcDiergQH7xj8h7fqQcb5AQ22w6o
 Ab6WyLVJMctKEQwnDa1jg9N+oFv/B6RWIjxXLXYC8HQPRz+CrYOGZm8L7c+26JM90fN4
 rs8Q==
X-Gm-Message-State: AOAM531geGu3A9Z/tBXUA1QjcdoCkp8WMV75AL0NAtZRaAlgbMAF6CXH
 mDj0ZLcP2RLMhTAcFOvR9QrTAMnd1/Qm3MhhXtU=
X-Google-Smtp-Source: ABdhPJwv1qmNjBAiKB5D97oDjsXhFioSPxQA7z3i8v41T9L6fw/4+TZDved/x/YqH5EQK6C9h3hfPg==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr19724470wmk.77.1637060586216; 
 Tue, 16 Nov 2021 03:03:06 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f15sm2639779wmg.30.2021.11.16.03.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:03:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/9] common-user/host/mips: Add safe-syscall.inc.S
Date: Tue, 16 Nov 2021 12:02:52 +0100
Message-Id: <20211116110256.365484-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116110256.365484-1-richard.henderson@linaro.org>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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


