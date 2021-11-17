Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A538E454A86
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:06:33 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNSC-0002wt-PA
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:06:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQE-0000CZ-AS
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:30 -0500
Received: from [2a00:1450:4864:20::430] (port=46645
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQC-00032p-MD
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id u1so5619153wru.13
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Si5w/xVL8tcePRB9XtTS7XLZl+YblTkzCMS4YZk/72Q=;
 b=YZR+tSRcjCXXQO/r+eXQrtqVq8pFznmlG2Y8TSTd+cNRsWIjd4e2RUmvsy01YrD+EU
 dTFGDMBXxSaPF+mZrpznJC/Ba8lKi+2LKCS65dM0I1cKGuUEmlxLuyvQx/QSdkLwRMii
 TdTCbAkWd/uu9pspGWsa/VdnTrRuVy+gASv8bOl0NEEjxqB31eU+9ZMG7ao7QaV+yi7Q
 v1vC1w6sbVeCaIwHG0B0Ct3h+FbQIdcRu2JR4rPwySQYWoSxLsa1yQQliYgkqIEs2+Uq
 u01Y0fTc6nsU+SHUFAuYd2cnUTOYmCbjTJs4J8lEOUyOtHMC3BaRNJ9T9Va8RH+D+C4J
 xHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Si5w/xVL8tcePRB9XtTS7XLZl+YblTkzCMS4YZk/72Q=;
 b=SlDevN+WZP6z9UGgV+/C0O/cq0nTEr6yXQfQuAsrnhXv5JsnF72PgAamYLgcqkMyZJ
 xuF4xdwDNLZZYrPRqZCPVMYqPEhmEHBKJe7m+Cgc2f7BKg6MIYghERJJfbbb7masZzsM
 JuLjTqj5r+94PN5/26AO//cXF7zbOhNwuS3Gc0xcpBs7OWpDT8eyqjlEKHyX0MdxWhJI
 ofPdtzMkMijbBnzSr9UUhc2bATL7ahz6WrrbDfDIlfnbX4zcQypA6Ajss7N7qBrNR6Tw
 oNj+p4yLBGt2H15g+jtJC8iT5wQszIjXp1d6HriGxdjHuQK3WYSJ96dQ3tYHGBOt5ZAl
 o6aQ==
X-Gm-Message-State: AOAM530Vkyj9TXjtWdo0XpuPJwinFIvNZwcRUGPp9p+ek+UO7sRLEblB
 9YqSxYbXsBjjjzF8j327/p6TSVenkV/vTpCEgp4=
X-Google-Smtp-Source: ABdhPJw+I87RhY9D68AFDuvoI8OcHHTBMo4g1MyxCQ8q4yT7yJdiAIOekVOsmwBCH9/4w1v2PpSoCA==
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr20528072wrb.436.1637165067332; 
 Wed, 17 Nov 2021 08:04:27 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/17] common-user/host/sparc64: Add safe-syscall.inc.S
Date: Wed, 17 Nov 2021 17:04:01 +0100
Message-Id: <20211117160412.71563-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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


