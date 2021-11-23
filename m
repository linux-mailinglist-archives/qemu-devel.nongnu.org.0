Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E145AA4A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:44:44 +0100 (CET)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZqV-0000wV-Uk
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:44:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkC-00042W-FN
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:12 -0500
Received: from [2a00:1450:4864:20::331] (port=33729
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkA-0004zp-RM
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:12 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso2439600wmh.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N7ifV7lHO8lRE2Wpho0vLQOIlb6dvWhebWkO0CZFmhw=;
 b=OlXCwYDhzfokR1zsTCPF+AICPDesNr1MJNBDIYnUqFS7iiwhrfMgDXiyQbk7bYrpE0
 Qi4HxbciewP96tgbAPM6PE17226wPbfZML8tR09TBeI6hC7JuB6tnSNz3S/MQlbqRNnw
 31bApKF7fRLy1T1UNfS+EsOrwft88NisEXU0lKKyakU2xKUaDr3RWdm5+QEKhNN1Wka/
 8hr30bDDANekcM4F3WJYvPiNgvDUgZvWX7sj5ntUmjFcu3VRnOHjXt0LAb1sjatJnA8a
 Iiii5VvfdPCvsDJaJ5l6wcOdmlW+2neyRsGtOkxl8/txxv/+SqSapxymwbsHAsKkIfcu
 FHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N7ifV7lHO8lRE2Wpho0vLQOIlb6dvWhebWkO0CZFmhw=;
 b=sGl7cbfRe5pYcNIcuXAb8+c8IHmYkEbA8rx8H6pIqdWRcZtKJJc5nzhHMDhR2pEgvC
 BQq4AxPydVn7nQikkOgyEv5CeKt3b5wFX5ewsl+uONYsxCp/hC5HDprjpvKHIf3Mo53D
 ce5Cg31VNj4NLbR41GtTsKHKNpfV98dICWSfQBNoSFS1iMSW2Zy2tQhrJl6emjQWJhXQ
 whSIYr/FPxwGEyWsdrVJb7GCJ6fDSuqbUYMu4ioA10UwwJHSC7bhBOzVQhdmry9aLb3D
 9QQQlww9R3876XSBD+C2BXl6rso9uD7GQzWL6YgPw9mv2xgwqMR2xYPr3tCqIJNZocOZ
 nqAQ==
X-Gm-Message-State: AOAM532gBLyqTK63ogTVOPBZTOgK1hI6daiLhFGzFDy6ay8fG7huv6R6
 em5CkZtnDEFMEd5licbPk0SXDkyE+MlmZ7UDncw=
X-Google-Smtp-Source: ABdhPJx/vuw+OziEBc6mcaCRyqBj2zKukL7riAGiwKjFP/9yidX4ZRPc0tfKf7PSMrD2ZlB5vuA/AQ==
X-Received: by 2002:a05:600c:6016:: with SMTP id
 az22mr5385546wmb.11.1637689089443; 
 Tue, 23 Nov 2021 09:38:09 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/16] linux-user/host/mips: Add safe-syscall.inc.S
Date: Tue, 23 Nov 2021 18:37:47 +0100
Message-Id: <20211123173759.1383510-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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
 linux-user/host/mips/hostdep.h          |   3 +
 linux-user/host/mips/safe-syscall.inc.S | 123 ++++++++++++++++++++++++
 2 files changed, 126 insertions(+)
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
index 0000000000..c6dd726001
--- /dev/null
+++ b/linux-user/host/mips/safe-syscall.inc.S
@@ -0,0 +1,123 @@
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
+LEAF(safe_syscall_base)
+        .cfi_startproc
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
+        move    t0, a0          /* signal_pending pointer */
+        move    v0, a1          /* syscall number */
+        move    a0, a2          /* syscall arguments */
+        move    a1, a3
+        lw      a2, 16(sp)
+        lw      a3, 20(sp)
+        lw      t4, 24(sp)
+        lw      t5, 28(sp)
+        lw      t6, 32(sp)
+        lw      t7, 40(sp)
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
+        move    t0, a0          /* signal_pending pointer */
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
+        lw      t1, 0(t0)
+        bnez    t1, 2f
+        syscall
+safe_syscall_end:
+
+        /* code path for having successfully executed the syscall */
+        bnez    a3, 1f
+        jr      ra
+
+        /* code path when we didn't execute the syscall */
+2:      li      v0, TARGET_ERESTARTSYS
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


