Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D53B47399C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:34:13 +0100 (CET)
Received: from localhost ([::1]:46098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvlk-0004Yb-9F
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:34:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve2-0007q1-HP
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:14 -0500
Received: from [2607:f8b0:4864:20::1033] (port=34699
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwvdy-0005RU-P6
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:13 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 q22-20020a17090a431600b001b0e3a74cf7so144842pjg.1
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hxGCMJpmTzYYg3VRoBHyRUrZEqJuEhtbeQRnSM3V1e4=;
 b=dbF+3lXaYq9orqvj3clT+BRE13+kKag6qBt4UkOtlmLZsQZSh8IDPNtnT2N5Z4f/8M
 PVRws9TI4K4e82crqCdTAdRhNYwXt1Ki3DfrA8hGxM90EMGDN82Bhi1SHJ5FKd589DB4
 5Shus49+I0YBsao6pRGYVhvEyHgf6zdRbsWKscAOZOPVJbU+XkEG+VYDgVUixr15BqYd
 IEEziPDApwOcOYloYr+UQ73aeLV00ws9cv1ONWQKs30eGL/9mhii0f7J8TsSlCQXB7Zu
 Y3QXLtTFnyiEz/q+wuAbhbbLASArt0bXGhHnxFH1mLmAhbC+BlGeHJKebqfBFyPUInDK
 kByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hxGCMJpmTzYYg3VRoBHyRUrZEqJuEhtbeQRnSM3V1e4=;
 b=bYlnWwOXi3L0Q7fc5cwYm8nhmHOWktogJcGmz5FXV6tg/cpR+bBihpGAHb7WcMUPYv
 OxmvlnucgQVixjvVDe93oQiSKRosFZN3UPOMo5JSMROnLOLvxHYYoUD1f3y7L3eeL3fa
 pekJEIS5+zuJoPdZcH8q9s5xCidRBICbKoJKkQnWc6uK541VNw/9B2cmQmfuLDnstqAW
 WHISWC+fA0HqAaGIGOCi5PcEwm+F/ymhfXbgwc5HEoN5jSJ3xrQGcGN3vp+8ff1PK7Qm
 e1BGDWrolHvW9A52wFevq3MAbjhbN2d+kjlQzpUPE5qMSWo+QXfKtmn42qkysl9n8xcY
 6AAA==
X-Gm-Message-State: AOAM532ghkfirJZ3twUwjA3ZZ3Com6nmvY8OuOhfmbD1Klg4Q4GBGj2x
 hhsToDfIxxjQvcvC4KNCDynIgbiakzaKoQ==
X-Google-Smtp-Source: ABdhPJyNjGLjtJGpy8EH5kuyo9P7BpjQPH3w4QMIbRMqKqmo9Lpof4VkC42IEBJyZrLSeYgtvUEIyA==
X-Received: by 2002:a17:90b:3a89:: with SMTP id
 om9mr1692339pjb.99.1639441569448; 
 Mon, 13 Dec 2021 16:26:09 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/15] linux-user/host/mips: Add safe-syscall.inc.S
Date: Mon, 13 Dec 2021 16:25:52 -0800
Message-Id: <20211214002604.161983-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/mips/hostdep.h          |   3 +
 linux-user/host/mips/safe-syscall.inc.S | 148 ++++++++++++++++++++++++
 2 files changed, 151 insertions(+)
 create mode 100644 linux-user/host/mips/safe-syscall.inc.S

diff --git a/linux-user/host/mips/hostdep.h b/linux-user/host/mips/hostdep.h
index ba111d75c3..d9e90a096b 100644
--- a/linux-user/host/mips/hostdep.h
+++ b/linux-user/host/mips/hostdep.h
@@ -12,4 +12,7 @@
 #ifndef MIPS_HOSTDEP_H
 #define MIPS_HOSTDEP_H
 
+/* We have a safe-syscall.inc.S */
+#define HAVE_SAFE_SYSCALL
+
 #endif
diff --git a/linux-user/host/mips/safe-syscall.inc.S b/linux-user/host/mips/safe-syscall.inc.S
new file mode 100644
index 0000000000..041d1a6e65
--- /dev/null
+++ b/linux-user/host/mips/safe-syscall.inc.S
@@ -0,0 +1,148 @@
+/*
+ * safe-syscall.inc.S : host-specific assembly fragment
+ * to handle signals occurring at the same time as system calls.
+ * This is intended to be included by linux-user/safe-syscall.S
+ *
+ * Written by Richard Henderson <richard.henderson@linaro.org>
+ * Copyright (C) 2021 Linaro, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "sys/regdef.h"
+#include "sys/asm.h"
+
+        .text
+        .set    nomips16
+        .set    reorder
+
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_start, @function
+        .type   safe_syscall_end, @function
+
+        /*
+         * This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         */
+
+#if _MIPS_SIM == _ABIO32
+/* 8 * 4 = 32 for outgoing parameters; 1 * 4 for s0 save; 1 * 4 for align. */
+#define FRAME    40
+#define OFS_S0   32
+#else
+/* 1 * 8 for s0 save; 1 * 8 for align. */
+#define FRAME    16
+#define OFS_S0   0
+#endif
+
+
+NESTED(safe_syscall_base, FRAME, ra)
+        .cfi_startproc
+        PTR_ADDIU sp, sp, -FRAME
+        .cfi_adjust_cfa_offset FRAME
+        REG_S   s0, OFS_S0(sp)
+        .cfi_rel_offset s0, OFS_S0
+#if _MIPS_SIM == _ABIO32
+        /*
+         * The syscall calling convention is nearly the same as C:
+         * we enter with a0 == &signal_pending
+         *               a1 == syscall number
+         *               a2, a3, stack == syscall arguments
+         *               and return the result in a0
+         * and the syscall instruction needs
+         *               v0 == syscall number
+         *               a0 ... a3, stack == syscall arguments
+         *               and returns the result in v0
+         * Shuffle everything around appropriately.
+         */
+        move    s0, a0          /* signal_pending pointer */
+        move    v0, a1          /* syscall number */
+        move    a0, a2          /* syscall arguments */
+        move    a1, a3
+        lw      a2, FRAME+16(sp)
+        lw      a3, FRAME+20(sp)
+        lw      t4, FRAME+24(sp)
+        lw      t5, FRAME+28(sp)
+        lw      t6, FRAME+32(sp)
+        lw      t7, FRAME+40(sp)
+        sw      t4, 16(sp)
+        sw      t5, 20(sp)
+        sw      t6, 24(sp)
+        sw      t7, 28(sp)
+#else
+        /*
+         * The syscall calling convention is nearly the same as C:
+         * we enter with a0 == &signal_pending
+         *               a1 == syscall number
+         *               a2 ... a7 == syscall arguments
+         *               and return the result in a0
+         * and the syscall instruction needs
+         *               v0 == syscall number
+         *               a0 ... a5 == syscall arguments
+         *               and returns the result in v0
+         * Shuffle everything around appropriately.
+         */
+        move    s0, a0          /* signal_pending pointer */
+        move    v0, a1          /* syscall number */
+        move    a0, a2          /* syscall arguments */
+        move    a1, a3
+        move    a2, a4
+        move    a3, a5
+        move    a4, a6
+        move    a5, a7
+#endif
+
+        /*
+         * This next sequence of code works in conjunction with the
+         * rewind_if_safe_syscall_function(). If a signal is taken
+         * and the interrupted PC is anywhere between 'safe_syscall_start'
+         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+         * The code sequence must therefore be able to cope with this, and
+         * the syscall instruction must be the final one in the sequence.
+         */
+safe_syscall_start:
+        /* If signal_pending is non-zero, don't do the call */
+        lw      t1, 0(s0)
+        bnez    t1, 2f
+        syscall
+safe_syscall_end:
+
+        /* code path for having successfully executed the syscall */
+        REG_L   s0, OFS_S0(sp)
+        PTR_ADDIU sp, sp, FRAME
+        .cfi_remember_state
+        .cfi_adjust_cfa_offset -FRAME
+        .cfi_restore s0
+        bnez    a3, 1f
+        jr      ra
+        .cfi_restore_state
+
+        /* code path when we didn't execute the syscall */
+2:      REG_L   s0, OFS_S0(sp)
+        PTR_ADDIU sp, sp, FRAME
+        .cfi_adjust_cfa_offset -FRAME
+        .cfi_restore s0
+        li      v0, TARGET_ERESTARTSYS
+
+        /* code path setting errno */
+        /*
+         * We didn't setup GP on entry, optimistic of the syscall success.
+         * We must do so now to load the address of the helper, as required
+         * by the ABI, into t9.
+         *
+         * Note that SETUP_GPX and SETUP_GPX64 are themselves conditional,
+         * so we can simply let the one that's not empty succeed.
+         */
+1:      USE_ALT_CP(t0)
+        SETUP_GPX(t1)
+        SETUP_GPX64(t0, t1)
+        PTR_LA  t9, safe_syscall_set_errno_tail
+        jr      t9
+
+        .cfi_endproc
+END(safe_syscall_base)
-- 
2.25.1


