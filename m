Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8196A47399E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:34:36 +0100 (CET)
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvm7-0005vt-L8
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwveC-0008LM-QG
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:24 -0500
Received: from [2607:f8b0:4864:20::429] (port=33625
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve7-0005TM-4S
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:24 -0500
Received: by mail-pf1-x429.google.com with SMTP id x5so16487324pfr.0
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT2OMMtgUWRlyX31jrb7FBHkLkGN7+LrqX+ZG1ZjPS0=;
 b=UegC0wtoanFt+7J6lKtDfPrNiqkzITr4HLS5OZULysGaPG1Vy4UIgwbpf1X+MYwghQ
 sJCiaGU3tIMOQbfrPbystQdEuGE53mZJHPuFlLUm+2Y/C8Q5xNVDFPrsSiuYflJ0PHTs
 T1m8DLCdnVMNOQ0JgMHUG2YwzAd5cOeahP2KVzQ61bzYCKpJRvPAwDE+ivAj7p00kyL4
 oHs2fhB99dAU759wMba6Yf0miEy85D6EUwC5nPTMnFzHqcpJSq5aDw14cGebcainMaZ9
 hGVkO9E2vvs9bnvbA2TBhrVtcbSGb5MwdKsrJCaQ1lvPWmLhPD7ZqvIxjLRpE7j0sXK8
 SQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT2OMMtgUWRlyX31jrb7FBHkLkGN7+LrqX+ZG1ZjPS0=;
 b=j4mymPx+UPkM/zGuiU8q/4l+jUVYgyC8qXcDzDNl5rauVCMHjxblNkzIo3oUyr9EOv
 xDjnRt2FNFHqDE+q2Sniljg/lsfMEkYrZUovpEaG63xVJ+xaSHzj5R6Xdy0Yn3TsKRj2
 Ge4gdTbhc4VaJNDnH86l3QIw6UMSEkitrBbkWt2+lVrLQaAob6uDaXnMRb6izmh0eLWf
 IkAWQTLsnvtL/zKPXadc7tiCzOXoHDeYDMNxliX2ZLn7cotI3Rxe2krRa5/lbQaAkgHG
 jpvsYWYu9rimCUtp+AshV5GSsYwNdkpMXF4/sAiendkDk9Lbc+7JaT0/OCsxgJfstQFV
 Ct8w==
X-Gm-Message-State: AOAM532STKkR4k/9y9ml97k2/q8jBuCNrRwgRCcvM0FZgWqt2xs7Vuwc
 Fd2CSZcu4vfFEnPpSFsDIxSvGEwvPARJZQ==
X-Google-Smtp-Source: ABdhPJzG9Cy51XfcnhsiqtuKWT//i2xqx2mQOf7BRMsnuB6896hZAMHHHrbkNBaoIYjKGJMfd6V1Ug==
X-Received: by 2002:a63:6ecb:: with SMTP id j194mr1411119pgc.46.1639441577795; 
 Mon, 13 Dec 2021 16:26:17 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/15] common-user: Adjust system call return on FreeBSD
Date: Mon, 13 Dec 2021 16:26:01 -0800
Message-Id: <20211214002604.161983-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

FreeBSD system calls return positive errno.  On the 4 hosts for
which we have support, error is indicated by the C bit set or clear.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 common-user/host/aarch64/safe-syscall.inc.S | 14 +++++++++++++-
 common-user/host/arm/safe-syscall.inc.S     |  9 +++++++++
 common-user/host/i386/safe-syscall.inc.S    | 11 +++++++++++
 common-user/host/x86_64/safe-syscall.inc.S  | 11 +++++++++++
 4 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
index 73a04b73b3..b8fd5b553e 100644
--- a/common-user/host/aarch64/safe-syscall.inc.S
+++ b/common-user/host/aarch64/safe-syscall.inc.S
@@ -60,17 +60,29 @@ safe_syscall_start:
         cbnz    w10, 2f
         svc     0x0
 safe_syscall_end:
+
         /* code path for having successfully executed the syscall */
+#if defined(__linux__)
+        /* Linux kernel returns (small) negative errno. */
         cmp     x0, #-4096
         b.hi    0f
+#elif defined(__FreeBSD__)
+        /* FreeBSD kernel returns positive errno and C bit set. */
+        b.cs    1f
+#else
+#error "unsupported os"
+#endif
         ret
 
+#if defined(__linux__)
         /* code path setting errno */
 0:      neg     w0, w0
         b       safe_syscall_set_errno_tail
+#endif
 
         /* code path when we didn't execute the syscall */
 2:      mov     w0, #QEMU_ERESTARTSYS
-        b       safe_syscall_set_errno_tail
+1:      b       safe_syscall_set_errno_tail
+
         .cfi_endproc
         .size   safe_syscall_base, .-safe_syscall_base
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
index 66176a902c..bbfb89634e 100644
--- a/common-user/host/arm/safe-syscall.inc.S
+++ b/common-user/host/arm/safe-syscall.inc.S
@@ -74,10 +74,19 @@ safe_syscall_start:
         bne     2f
         swi     0
 safe_syscall_end:
+
         /* code path for having successfully executed the syscall */
+#if defined(__linux__)
+        /* Linux kernel returns (small) negative errno. */
         cmp     r0, #-4096
         neghi   r0, r0
         bhi     1f
+#elif defined(__FreeBSD__)
+        /* FreeBSD kernel returns positive errno and C bit set. */
+        bcs     1f
+#else
+#error "unsupported os"
+#endif
         pop     { r4, r5, r6, r7, r8, pc }
 
         /* code path when we didn't execute the syscall */
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index aced8c5141..baf5400a29 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -71,9 +71,18 @@ safe_syscall_start:
         mov     8+16(%esp), %eax        /* syscall number */
         int     $0x80
 safe_syscall_end:
+
         /* code path for having successfully executed the syscall */
+#if defined(__linux__)
+        /* Linux kernel returns (small) negative errno. */
         cmp     $-4095, %eax
         jae     0f
+#elif defined(__FreeBSD__)
+        /* FreeBSD kernel returns positive errno and C bit set. */
+        jc      1f
+#else
+#error "unsupported os"
+#endif
         pop     %ebx
         .cfi_remember_state
         .cfi_adjust_cfa_offset -4
@@ -90,8 +99,10 @@ safe_syscall_end:
         ret
         .cfi_restore_state
 
+#if defined(__linux__)
 0:      neg     %eax
         jmp     1f
+#endif
 
         /* code path when we didn't execute the syscall */
 2:      mov     $QEMU_ERESTARTSYS, %eax
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
index 84fed206f9..a20927a783 100644
--- a/common-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -68,9 +68,18 @@ safe_syscall_start:
         jnz     2f
         syscall
 safe_syscall_end:
+
         /* code path for having successfully executed the syscall */
+#if defined(__linux__)
+        /* Linux kernel returns (small) negative errno. */
         cmp     $-4095, %rax
         jae     0f
+#elif defined(__FreeBSD__)
+        /* FreeBSD kernel returns positive errno and C bit set. */
+        jc      1f
+#else
+#error "unsupported os"
+#endif
         pop     %rbp
         .cfi_remember_state
         .cfi_def_cfa_offset 8
@@ -78,8 +87,10 @@ safe_syscall_end:
         ret
         .cfi_restore_state
 
+#if defined(__linux__)
 0:      neg     %eax
         jmp     1f
+#endif
 
         /* code path when we didn't execute the syscall */
 2:      mov     $QEMU_ERESTARTSYS, %eax
-- 
2.25.1


