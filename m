Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A392847B453
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:27:58 +0100 (CET)
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPGH-0004LV-PN
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:27:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDe-0001fY-SI
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:15 -0500
Received: from [2607:f8b0:4864:20::42e] (port=42873
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDX-0006zw-Bf
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:09 -0500
Received: by mail-pf1-x42e.google.com with SMTP id t19so3393820pfg.9
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Ij3KpROxLC8dtK7aIvTpcOO8V/yzRNnTNXtooq2NSs=;
 b=jzlkNKQErIHVxlwRHnlBOfoMsT3ttJDGtY1KP7fOap/thxnXd9RYNZ3VqI5N6g5bAm
 OfmNdzAMTrzXNyuIIeHQKqLjEse/wSLEWpZ+nFqxu97lCFqjsu8o2hoDdfQEv0H8eOlV
 GRX8Cfhad/5HrIOqVb3CReJbV40iCXO+4IY7uZfcPWv1fiQ68EJqnFqulftRbbUq1gDh
 t+87AV57G5PZ3wU4y8SmP5zn3y9wDqcR0rRCk6Hv/1bU5PC044P9Jz8Zg+DGQh03gtsZ
 uqPENlNMbgFes9cBH8Hy+oSfybRbf2rK1ELe4HUhzCwBY2AAbx7J0zRj+ZWRWB/8MC94
 fe0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Ij3KpROxLC8dtK7aIvTpcOO8V/yzRNnTNXtooq2NSs=;
 b=ojeizySKt6SHLGcjUCB8ZmDkjOyfroE+zUM35u6AZDvA7Yh/WD/E1CBfTcKbXuwDK2
 GnQajpOB4QH3GCA6kDMPxPPajajgbcdIaDMK4scVF0Uu3PvOsThFnBcHGGLcc5OHnS52
 ZpdTjW+JS1HuTauI8q3czLmbWzVRBgWIcKx0YPrnVPsjOHqrdwSx3ndoVo34tYiMSstf
 lgxul+RQKdV6RIzOA3uisi9DdnEgKstBqDLHaVm7ggOe8DIn2hTI6HS0LOeHgmo5r3zJ
 ftgdqQkXD58TZG/f8lDZA0hp/2NQyIMDoE4xL8LQblEdJy1+3NjJgshTReHUt6SdxKXW
 Klyw==
X-Gm-Message-State: AOAM531HQFrIv2xbGppqdUTqdbQbFeKF5L51GKh8K9d89wH/wBToT9UM
 HU2jeNeCmGO0UqiXARCEodEajKZRWbFNMg==
X-Google-Smtp-Source: ABdhPJyv2hfkjBBhuoNhXET7kEv2JIyMfjjkg0LJoqTU66aq3iLmdPz3JM6TW1LJGlia9FGuAGpKqw==
X-Received: by 2002:a63:701b:: with SMTP id l27mr16235615pgc.241.1640031906032; 
 Mon, 20 Dec 2021 12:25:06 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] linux-user/host/sparc64: Add safe-syscall.inc.S
Date: Mon, 20 Dec 2021 12:24:49 -0800
Message-Id: <20211220202500.111897-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/sparc64/hostdep.h          |  3 +
 linux-user/host/sparc64/safe-syscall.inc.S | 89 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 linux-user/host/sparc64/safe-syscall.inc.S

diff --git a/linux-user/host/sparc64/hostdep.h b/linux-user/host/sparc64/hostdep.h
index ce3968fca0..d832868cb1 100644
--- a/linux-user/host/sparc64/hostdep.h
+++ b/linux-user/host/sparc64/hostdep.h
@@ -12,4 +12,7 @@
 #ifndef SPARC64_HOSTDEP_H
 #define SPARC64_HOSTDEP_H
 
+/* We have a safe-syscall.inc.S */
+#define HAVE_SAFE_SYSCALL
+
 #endif
diff --git a/linux-user/host/sparc64/safe-syscall.inc.S b/linux-user/host/sparc64/safe-syscall.inc.S
new file mode 100644
index 0000000000..901db15959
--- /dev/null
+++ b/linux-user/host/sparc64/safe-syscall.inc.S
@@ -0,0 +1,89 @@
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
+        .text
+        .balign 4
+
+        .register %g2, #scratch
+        .register %g3, #scratch
+
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, @function
+        .type   safe_syscall_start, @function
+        .type   safe_syscall_end, @function
+
+#define STACK_BIAS  2047
+#define PARAM(N)    STACK_BIAS + N*8
+
+        /*
+         * This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         */
+safe_syscall_base:
+        .cfi_startproc
+        /*
+         * The syscall calling convention isn't the same as the C one:
+         * we enter with o0 == &signal_pending
+         *               o1 == syscall number
+         *               o2 ... o5, (stack) == syscall arguments
+         *               and return the result in x0
+         * and the syscall instruction needs
+         *               g1 == syscall number
+         *               o0 ... o5 == syscall arguments
+         *               and returns the result in o0
+         * Shuffle everything around appropriately.
+         */
+        mov     %o0, %g2                /* signal_pending pointer */
+        mov     %o1, %g1                /* syscall number */
+        mov     %o2, %o0                /* syscall arguments */
+        mov     %o3, %o1
+        mov     %o4, %o2
+        mov     %o5, %o3
+        ldx     [%sp + PARAM(6)], %o4
+        ldx     [%sp + PARAM(7)], %o5
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
+        /* if signal_pending is non-zero, don't do the call */
+        lduw    [%g2], %g3
+        brnz,pn %g3, 2f
+         nop
+        ta      0x6d
+safe_syscall_end:
+        /* code path for having successfully executed the syscall */
+        bcs,pn  %xcc, 1f
+         nop
+        ret
+         nop
+
+        /* code path when we didn't execute the syscall */
+2:      set     TARGET_ERESTARTSYS, %o0
+
+        /* code path setting errno */
+1:      mov     %o7, %g1
+        call    safe_syscall_set_errno_tail
+         mov    %g1, %o7
+
+        .cfi_endproc
+        .size   safe_syscall_base, .-safe_syscall_base
-- 
2.25.1


