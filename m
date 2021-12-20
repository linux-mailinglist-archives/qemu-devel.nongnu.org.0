Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A857347B454
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:29:26 +0100 (CET)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPHf-0008W5-Oc
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:29:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDe-0001fa-PO
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:14 -0500
Received: from [2607:f8b0:4864:20::436] (port=34480
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDW-0006zm-K6
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:08 -0500
Received: by mail-pf1-x436.google.com with SMTP id c2so9693442pfc.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8fpxAyMyVNl+CmSBxFw2EondzEXrJSlZxjaKGpCYVGY=;
 b=MHzNLKb+2HdQAyjzVHeDctJOrHtzXlSQ2VofPdhIhOjJaIFBi1CUnZZ2eiu0+dZhUW
 KtsLKm4d1fLfcg9DCKVxZRCFC/6RLsO+sVxquG86UqEFr70f/anMRJyYwC3c6ZhQVCxj
 uhPuKqqRR9l+zk8SgcPzIwvx3owYbEv/r749uzeMwu04/X8/crY2RGS30V3GVz+2ycKf
 NL0WAvh8LutLy4ob7xq4EQI6BD0KqhsslnN5Hyb6Scron7u6jVhdlgv0Jd7vP3JSCtbX
 vTFeyWygkTFwDUDT8+aEnOZKnPSMAJ9mylNmL2ufLCuxn77p65zig+2K+O0jFwRHrMlm
 hkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8fpxAyMyVNl+CmSBxFw2EondzEXrJSlZxjaKGpCYVGY=;
 b=v9axodgbsdvsG7QpKagP6DfR6V/3wkHz67FfWRFfCvlQBzk+S6R7d2Qiz4RCvBYAc6
 DAcwwEjWAUUj3EhkXvRnMJ3wMetnnzHvWNZgyG9vVojs6V9ax1wdNnajc28R6fNGkarG
 cf9GVueRL2pe1F285RgPy1AveLlA99K2+5l9pNiuiYltIH5TpOzOrRrlPIEhEyERH7uW
 /HU4mLI7dH98xUXcKuDvk+pCQ+99H5UYC6mg1kY/3wnqJBH5laqvnjQBpcStdwviXjZG
 X8vAIVVQa9tE3/b7xu03VTw9GKI/e4SDmcHNEvZgeb4nJwfsvRm1kPWxBELvVIO1eu/T
 JQhA==
X-Gm-Message-State: AOAM5322hWZPI3TdJ8vTWMKEF/lxVAeFciNLNq1bBuTKD8ww3Up/IFu6
 Lsa8cplocFTSexFKCQFVxpQM/c92OU1Reg==
X-Google-Smtp-Source: ABdhPJyJf7eRYm1ZNWgI1h77W0VMFW5v9sQki+rAO0rIU/n6hArNwZkZa/qsH1ZOlC15lJY0OkKj3g==
X-Received: by 2002:a05:6a00:2401:b0:4a8:909:1d01 with SMTP id
 z1-20020a056a00240100b004a809091d01mr17727147pfh.83.1640031905339; 
 Mon, 20 Dec 2021 12:25:05 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] linux-user/host/mips: Add safe-syscall.inc.S
Date: Mon, 20 Dec 2021 12:24:48 -0800
Message-Id: <20211220202500.111897-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


