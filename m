Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4422678DE5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:06:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gc-0008OO-EE; Mon, 23 Jan 2023 21:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gZ-0008Ns-94
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:19 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gX-0003mr-5x
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:18 -0500
Received: by mail-pl1-x635.google.com with SMTP id c6so13362445pls.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PZScXMlEaGULysLczewzRnr1DphZcQFOhwL94oC81cs=;
 b=Yy67SUopQxznhg4z+En77gJiBxzx1utthusqg6vseSq6MRl1XgpHv3kku81MtiQvIJ
 ILs7tRLfUMwUbTubsLJe85UQVyvYO5l7FhL0KQRSN6j8/zq074H2Zq6cP+CPgHNUeQ71
 7LSmFBQvqZ1Ir9Vj5+8RVBaj4zax1CbaVc7sh4nkeahCSOCJ+/ewek6j90scM4XJ2j2G
 K2GwQzfmhKrvCdLSdbRSL0QHmrQUY7/OVI0u75KWnuXmKn70G2A9m6W8khAsnBvTvLwe
 Gs/8hJnw82CToTkO4WttvfOyfJemlesVRM04p/yH40N1yiumkSd/wVZA9a0dlRLqzJ9N
 atmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZScXMlEaGULysLczewzRnr1DphZcQFOhwL94oC81cs=;
 b=h26FAnuI0aKMZyPXHBBxghJPjcl/IpOgufbwISGSY144GRG1ZRCWARlHwiDpNxY9bP
 n6LfPP/sAVN4x3zKtfpZ2X612wAi2qrDNZx0fwcowG7zs+R3NKYKN249NKZV3RgKvBw7
 4nSfG5NBfO+jHxAcGCuhFMWOZt5CEzp+rHJUspFctKDEWrKUzUSmVI1GE4MaX8pyZ0Py
 86apAScpTJ7Em+4lYxIOFpQRlsXUjcnjRz1RD73z23xK39WH6DXGEePBQfwZLRu75AVs
 msVknu+XMEwSKHnvPOA/p8axQFEhQwa/HBTe6HN3JRsGM7+a5hOQ0QbLz+gORnacc9Ur
 bs4Q==
X-Gm-Message-State: AFqh2kplMLTmcimWYn4SYyLFZVsT96R1M3kzOwQiK5D93z1V917oifVe
 WyFVHAtDC5ZzOnKYEhCe00fKkJ3NdaEzTfHA
X-Google-Smtp-Source: AMrXdXuu6WlG9/QY1OJtdnKgn040nNqTPxPCzdSUJpMiRwfE7+OU0BIi1sYiiMW4uPLg7ZdsLf96gw==
X-Received: by 2002:a17:90b:887:b0:229:5041:c590 with SMTP id
 bj7-20020a17090b088700b002295041c590mr27731653pjb.18.1674525915303; 
 Mon, 23 Jan 2023 18:05:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 03/15] common-user/host/ppc: Implement safe-syscall.inc.S
Date: Mon, 23 Jan 2023 16:04:55 -1000
Message-Id: <20230124020507.3732200-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220729172141.1789105-2-richard.henderson@linaro.org>
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


