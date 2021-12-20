Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B147B469
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:35:12 +0100 (CET)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPNH-0001KO-Il
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:35:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDi-0001hd-An
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:18 -0500
Received: from [2607:f8b0:4864:20::431] (port=38492
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDe-00070e-HA
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:17 -0500
Received: by mail-pf1-x431.google.com with SMTP id b22so4941100pfb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT2OMMtgUWRlyX31jrb7FBHkLkGN7+LrqX+ZG1ZjPS0=;
 b=WKNqGYJOwE+MHykF/LPnqx1AVKQjddRdjPlSwV7BHvdcC7JUFEjNGYBmR+gN+gCI/s
 vcZkspcLTHM7YoS6eqBKjlDD+2hzrHiSGmquxaNk9jYX7CGTdWWeMMD7KmHPyFfQ/Y5/
 3KCbh74KmXK1Uu76y06d5jM3HsU7BH2puree68KyA1iXnglKBOaz2AtZx9oixInIr6W+
 3qRBZ1cn8HwmOhUqAlT1K3QODLJ/U/zoYRSI9T6rMV53yx/ps9FlQLSWzlQIqLeTbvub
 yCFvZWPCvkFmZ18hW/CZQJ3BVUQhP+I/uy6864R+MRRH/4ipIUcfxB8vyK42NZMagk6r
 EXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT2OMMtgUWRlyX31jrb7FBHkLkGN7+LrqX+ZG1ZjPS0=;
 b=KvUgnFOiLXYupDduY0yHXcRhNY2mhWnzJZPqBCGm2NHG+iE5sdRhgzhF2Ytgz8nTJQ
 d2O/crMFMxgluPmvkWE9XeMaC2pDi3Azv/vGkQrPbhS7LfkSGwgxwpVYwiSuH/hy4Hg5
 XMMUTbUsNLcUiPFJHqPkU7JLBGLfl51leSwp9jGX3wgg67GJOWnuG6fDN1qSGyLWia4U
 CcB20AlhhafEaeuqDErwPDxI7CSZub+KZ/ujk6NXYLL9N4CTsHTBC+E6533Xp2VAd5DP
 LNkOAXav6201pS38Q+rEThi/pG1yIpMDoUZCPA3zQKUyaJDG1K9Rv+Bo8/FwL9W++z8o
 xgSQ==
X-Gm-Message-State: AOAM531zKcCvbrEWDyJmPhBhkzzas4fOYmVkSmpOB0VL4mlcK6sWG4ia
 vH3HfuSojLHUhtV27McAgu7wKNwbQUaE5w==
X-Google-Smtp-Source: ABdhPJzP3Z2xg4nE3TOb/gK2k7/n7rUU+ZULYUjEa9dhyAJ+CHRBZwsG7lVtZXAhW46Wf3jVjNQ9jg==
X-Received: by 2002:a62:d10f:0:b0:4b1:3bd6:533 with SMTP id
 z15-20020a62d10f000000b004b13bd60533mr2101810pfg.8.1640031912711; 
 Mon, 20 Dec 2021 12:25:12 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] common-user: Adjust system call return on FreeBSD
Date: Mon, 20 Dec 2021 12:24:57 -0800
Message-Id: <20211220202500.111897-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Warner Losh <imp@bsdimp.com>
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


