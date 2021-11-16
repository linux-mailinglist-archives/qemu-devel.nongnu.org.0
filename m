Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41215452FD4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:07:40 +0100 (CET)
Received: from localhost ([::1]:54828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwJP-0001Oy-Cz
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:07:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF7-0001sO-6d
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:13 -0500
Received: from [2a00:1450:4864:20::330] (port=51941
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF3-0004vP-7A
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id z200so16535504wmc.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Si5w/xVL8tcePRB9XtTS7XLZl+YblTkzCMS4YZk/72Q=;
 b=Q1EpEtffCGDP6QxKUCUY5hmACO69iQqdbqzd3oeuV5ZVpwBqX8U2ZbKT6r02TyW7gA
 mSM3pWbifi9kQpjPD+4AW2DqG+khHLF74yNY2AJNmiz7/pgQnkwTpbp1AV6CTXn8qwum
 XSfO8Hmh4hHfDhb0CXHpMvepQPHU0gJHWRSwZD0Nsj8LKup6pldvhwXq2wdiD9h8v3Ut
 lQJcWJMxQD5gnQ11CVI6sMPaAVh5Y1F6iFJH3JHXPC4QWltSaoio5TI+G004QCcQTLmg
 o1uT8ICDyyQmm07vk0sDxTl0kyKbm8GP45GX/thBt2PNUR0s/C4YGqiBbVuTarJwfVw5
 nITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Si5w/xVL8tcePRB9XtTS7XLZl+YblTkzCMS4YZk/72Q=;
 b=sV/OyNApp3X6vlBYnC2qUsiTXBUhwXPiDmIvWSWMpyjYtvF81LjLZBirYoldC7unZf
 cXMEItx5tCJyCvI+51/gDM2iWu+kRJ5zIPDfkgWnQ89UA/ghbKhH7+ny61IS3DIXE/pZ
 thZD2l20l9PE3K85cU7h/hWbHTaCOh3gXaryC+IvYjp5ynBvoqnCSsGEBLbDadCG5Ml6
 8fkbcmxFpbTIUvZ3rIU4La7sWwaEDYCr12SLQiFDpj/bgCbEB8+COnaVg1EDz/Y9Hcb9
 nLCcnePvr5QEthcZUrzrU+ktaEQMhR0b79H4j9r/TSvf8WZe+RprWEzxD+y0iFZJooQz
 9I/A==
X-Gm-Message-State: AOAM533dwDa/qKFRWTER+42rTONn81PHWEfx0cJKgSqpyM0J5kqpEEDm
 MlNdLC6FZIeZcx1556LtOgysU97YQ6M9vWTjbSE=
X-Google-Smtp-Source: ABdhPJzcUq15YJsuS7JLpucQBy0TrtVomiZ+Vvw3L7Zh6BuDI6O5GqlQu5l4vXVn+kNLDuTlzYGoLQ==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr6793608wmk.27.1637060587769; 
 Tue, 16 Nov 2021 03:03:07 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f15sm2639779wmg.30.2021.11.16.03.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:03:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/9] common-user/host/sparc64: Add safe-syscall.inc.S
Date: Tue, 16 Nov 2021 12:02:53 +0100
Message-Id: <20211116110256.365484-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116110256.365484-1-richard.henderson@linaro.org>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
 common-user/host/sparc64/hostdep.h          |  2 +
 common-user/host/sparc64/safe-syscall.inc.S | 91 +++++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 common-user/host/sparc64/hostdep.h
 create mode 100644 common-user/host/sparc64/safe-syscall.inc.S

diff --git a/common-user/host/sparc64/hostdep.h b/common-user/host/sparc64/hostdep.h
new file mode 100644
index 0000000000..b18aca1deb
--- /dev/null
+++ b/common-user/host/sparc64/hostdep.h
@@ -0,0 +1,2 @@
+/* We have a safe-syscall.inc.S */
+#define HAVE_SAFE_SYSCALL
diff --git a/common-user/host/sparc64/safe-syscall.inc.S b/common-user/host/sparc64/safe-syscall.inc.S
new file mode 100644
index 0000000000..2492fcbd9e
--- /dev/null
+++ b/common-user/host/sparc64/safe-syscall.inc.S
@@ -0,0 +1,91 @@
+/*
+ * safe-syscall.inc.S : host-specific assembly fragment
+ * to handle signals occurring at the same time as system calls.
+ * This is intended to be included by linux-user/safe-syscall.S
+ *
+ * Written by Richard Henderson <rth@twiddle.net>
+ * Copyright (C) 2021 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+	.text
+	.balign	4
+
+	.global safe_syscall_base
+	.global safe_syscall_start
+	.global safe_syscall_end
+	.type	safe_syscall_base, @function
+	.type	safe_syscall_start, @object
+	.type	safe_syscall_end, @object
+
+#define STACK_BIAS  2047
+#define PARAM(N)    STACK_BIAS + N*8
+
+	/*
+	 * This is the entry point for making a system call. The calling
+	 * convention here is that of a C varargs function with the
+	 * first argument an 'int *' to the signal_pending flag, the
+	 * second one the system call number (as a 'long'), and all further
+	 * arguments being syscall arguments (also 'long').
+	 */
+safe_syscall_base:
+	.cfi_startproc
+	/*
+         * The syscall calling convention isn't the same as the C one:
+	 * we enter with o0 == *signal_pending
+	 *               o1 == errno
+	 *               o2 == syscall number
+	 *               o3 ... o5, (stack) == syscall arguments
+	 *               and return the result in x0
+	 * and the syscall instruction needs
+	 *               g1 == syscall number
+	 *               o0 ... o5 == syscall arguments
+	 *               and returns the result in o0
+	 * Shuffle everything around appropriately.
+	 */
+	mov	%o0, %g2		/* signal_pending pointer */
+	stx	%o1, [%sp + PARAM(1)]	/* save errno pointer */
+	mov	%o2, %g1		/* syscall number */
+	mov	%o3, %o0		/* syscall arguments */
+	mov	%o4, %o1
+	mov	%o5, %o2
+	ldx	[%sp + PARAM(6)], %o3
+	ldx	[%sp + PARAM(7)], %o4
+	ldx	[%sp + PARAM(8)], %o5
+
+	/*
+         * This next sequence of code works in conjunction with the
+	 * rewind_if_safe_syscall_function(). If a signal is taken
+	 * and the interrupted PC is anywhere between 'safe_syscall_start'
+	 * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+	 * The code sequence must therefore be able to cope with this, and
+	 * the syscall instruction must be the final one in the sequence.
+	 */
+safe_syscall_start:
+	/* if signal_pending is non-zero, don't do the call */
+	lduw	[%g2], %g3
+	brnz,pn	%g3, 2f
+	 nop
+	ta	0x6d
+safe_syscall_end:
+
+	/* code path for having successfully executed the syscall */
+	bcc,pt	%xcc, 9f
+	 nop
+
+	/* code path setting errno */
+1:	ldx	[%sp + PARAM(1)], %g2
+	stw	%o0, [%g2]		/* store errno */
+	set	-1, %o0
+
+9:	ret
+	 nop
+
+	/* code path when we didn't execute the syscall */
+2:	ba,pt	%xcc, 1b
+	 set	TARGET_ERESTARTSYS, %o0
+
+	.cfi_endproc
+	.size	safe_syscall_base, .-safe_syscall_base
-- 
2.25.1


