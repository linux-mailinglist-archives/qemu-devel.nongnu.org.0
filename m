Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F1585476
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:26:52 +0200 (CEST)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTlD-0001BI-VV
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTgL-0002pn-FR
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:21:50 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTgH-0003nW-8f
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:21:48 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 a7-20020a17090a008700b001f325db8b90so4442404pja.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 10:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9GgmeiJQSr2xjaj5SsR3wBj4T3CMWdOAEf/FFOx6HQ=;
 b=BEZjAcpAfEOV9i1gp9Z3PVL1JV3gHV18ZnrHS8HlzIicrQ20cMbYxogeeQ74RHxhPW
 vIn4dKBPKtHio7S7/fd08UhSCA0jeF54Hbh5VtqxTS9l85SVgE5kLS/VEoHgXYIao4lq
 2doI+X7FKpi9+a5BlgzFFRGx7FOT7nR+mvO4serkSRWVEADSO/VwdVl0MxOpccvwUik9
 JdlPtm+9bDCcrJ9jxTPK8CB41fNeud0WpQTt4YkMBwilxpjsioVaYoEAuzval4Oo87Cx
 JCL49tHiWS8OPsx2xX1KeP3oV6MwLYsfTM0LFkhVD2agaugi8AnyRsFnJkh4/NU8cYUy
 1R9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A9GgmeiJQSr2xjaj5SsR3wBj4T3CMWdOAEf/FFOx6HQ=;
 b=oPkLvGKW1+vYMJjiBHy9gO5MCz8ZvtihB29SAhKgrBRmuNklKTnM++cxj3tIreA+AV
 XaN+1OHnZWcrA31Sqh/FjOB9vc/fRAAch5jhGfEaQiu2QdX4rr5DcNjpPATCx9Z6fa1O
 Gg2RopLESdiSDCawMIP2mrzCJnh3NJJ4BwpZxKGuP2hnVg23EWNxKcJMUh6+qJk8r7fn
 2qSB3JkptFguMHS5NihXMCdY2mKsEkdzG3zAZ18BwufKCwqExdY3NmEXfG5BD/+kmGhf
 zhSx6i/NfkPXcvet7WcUgmdyJrSCi9NL6gD+cS72Hqd6cDXhUzFFA8YzVjO2/hzxxoE+
 3BUg==
X-Gm-Message-State: ACgBeo2TFTY0QLQ/LqN1IKY7z7w+TKhdAf4L+LP9fS50vx0t1OX1AQst
 Ln0BFuGVZpwy8ADinFM83/URbHP1c2EF0Q==
X-Google-Smtp-Source: AA6agR4zRC+qK8q1CpbI3KbA+LoGvxDx4fcVENPJ7agzH7iDq07FeDH+vGktL0f/erRgS6L57+D6ig==
X-Received: by 2002:a17:90a:8a8d:b0:1f3:155:3324 with SMTP id
 x13-20020a17090a8a8d00b001f301553324mr5117194pjn.89.1659115303917; 
 Fri, 29 Jul 2022 10:21:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170902aa9200b0016bb24f5d19sm3881039plr.209.2022.07.29.10.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 10:21:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	qemu-ppc@nongnu.org,
	laurent@vivier.eu
Subject: [PATCH 1/2] common-user/host/ppc: Implement safe-syscall.inc.S
Date: Fri, 29 Jul 2022 10:21:40 -0700
Message-Id: <20220729172141.1789105-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729172141.1789105-1-richard.henderson@linaro.org>
References: <20220729172141.1789105-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 common-user/host/ppc/safe-syscall.inc.S | 107 ++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 common-user/host/ppc/safe-syscall.inc.S

diff --git a/common-user/host/ppc/safe-syscall.inc.S b/common-user/host/ppc/safe-syscall.inc.S
new file mode 100644
index 0000000000..0851f6c0b8
--- /dev/null
+++ b/common-user/host/ppc/safe-syscall.inc.S
@@ -0,0 +1,107 @@
+/*
+ * safe-syscall.inc.S : host-specific assembly fragment
+ * to handle signals occurring at the same time as system calls.
+ * This is intended to be included by common-user/safe-syscall.S
+ *
+ * Copyright (C) 2022 Linaro, Ltd.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+/*
+ * Standardize on the _CALL_FOO symbols used by GCC:
+ * Apple XCode does not define _CALL_DARWIN.
+ * Clang defines _CALL_ELF (64-bit) but not _CALL_SYSV (32-bit).
+ */
+#if !defined(_CALL_SYSV) && \
+    !defined(_CALL_DARWIN) && \
+    !defined(_CALL_AIX) && \
+    !defined(_CALL_ELF)
+# if defined(__APPLE__)
+#  define _CALL_DARWIN
+# elif defined(__ELF__) && TCG_TARGET_REG_BITS == 32
+#  define _CALL_SYSV
+# else
+#  error "Unknown ABI"
+# endif
+#endif 
+
+#ifndef _CALL_SYSV
+# error "Unsupported ABI"
+#endif
+
+
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, @function
+
+        .text
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
+        stwu    1, -8(1)
+        .cfi_def_cfa_offset 8
+        stw     30, 4(1)
+        .cfi_offset 30, -4
+
+        /*
+         * We enter with r3 == &signal_pending
+         *               r4 == syscall number
+         *               r5 ... r10 == syscall arguments
+         *               and return the result in r3
+         * and the syscall instruction needs
+         *               r0 == syscall number
+         *               r3 ... r8 == syscall arguments
+         *               and returns the result in r3
+         * Shuffle everything around appropriately.
+         */
+        mr      30, 3           /* signal_pending */
+        mr      0, 4            /* syscall number */
+        mr      3, 5            /* syscall arguments */
+        mr      4, 6
+        mr      5, 7
+        mr      6, 8
+        mr      7, 9
+        mr      8, 10
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
+        lwz     12, 0(30)
+        cmpwi   0, 12, 0
+        bne-    2f
+        sc
+safe_syscall_end:
+        /* code path when we did execute the syscall */
+        lwz     30, 4(1)        /* restore r30 */
+        addi    1, 1, 8         /* restore stack */
+        .cfi_restore 30
+        .cfi_def_cfa_offset 0
+        bnslr+                  /* return on success */
+        b       safe_syscall_set_errno_tail
+
+        /* code path when we didn't execute the syscall */
+2:      lwz     30, 4(1)
+        addi    1, 1, 8
+        addi    3, 0, QEMU_ERESTARTSYS
+        b       safe_syscall_set_errno_tail
+
+        .cfi_endproc
+
+        .size   safe_syscall_base, .-safe_syscall_base
-- 
2.34.1


