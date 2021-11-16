Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B7452FD6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:07:42 +0100 (CET)
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwJR-0001ZL-GS
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:07:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF8-0001wR-FV
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:15 -0500
Received: from [2a00:1450:4864:20::333] (port=56074
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF6-0004vZ-9A
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:14 -0500
Received: by mail-wm1-x333.google.com with SMTP id p18so7170825wmq.5
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YpcjTT4P6M+JhDh0Vs6QNN1pw9wodcEf+Q7kgbhpHC8=;
 b=z2kbWq2kH8YguRruTmzFN6QLvoIAvBXEhWBf9jvrdn5T16KVBik5OamQB7j8KWBac3
 U1SYa2w7udX3p386QLVLoVW6sGeFOJF7gJX2d9etwbjLP+9zwtaoCbvP6Gd0gEEHmBoH
 HqjKrZuZ1lfnWSmrXNGs6hhTORylBwa4MADYUvTBUKItVuC2tVWk4IsK4ZrH17W5+Qd0
 8DqPlRVaeQlpuojcYcPLBMkuCXnwswkv7+SS4AlYmPjwqZiCAyT2MmSoL6znrHllRBT9
 Z6xxTLE0+AWQX+JNnlZF3lIbI88qo0btkZQnwYJLu3rES95DWOawvQ2m7RaaSNkTNNfn
 XRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YpcjTT4P6M+JhDh0Vs6QNN1pw9wodcEf+Q7kgbhpHC8=;
 b=XngFbG59wgWEgg9TZFGyBjJTyQ3IWr5v5G+nbZxifnVJjmAZtPiB2zPTSEIORZaHcy
 um3Qc1V7YIXIP2NJBVyE/XsFfDxKO8bimAHD97hSruUZoXo8x+c38/+8o+DGFt3Bl6qm
 4b1gxRORoX0Z8J7rTwxL/LQXTtmk20ZQpuF4O6HQ24wF8gKErpsReJ/ojMoieZh5IuuF
 pWjS6nG1S4zhshUQ/4rcux2rvN4x/HMYJmu/zivhT+OuNqSwLLfJ4/qMMI1hTwOT9/Q2
 UgG1o+nmxe4ui7Nn63AhLls9Wkm6HK1bNlp2l4ZgMKY4MweGQR/iOVCyexaq/oSTvh5a
 34bA==
X-Gm-Message-State: AOAM531avsOQhVx40gA+fW/3qtlO0iuSWYR2+Qo4JWlFyWCi70Xmu1Px
 QuQ80oS+bwiLs5l7CjmrmfL0TcscWUeQWLaLDNQ=
X-Google-Smtp-Source: ABdhPJyc3KPZ2uQq5yDfQvayPXcP7UYX3OGvRyzIESuImQx41MHsIdb5aP7VGlHEYkluLcYA82slTw==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr6596521wmq.111.1637060590888; 
 Tue, 16 Nov 2021 03:03:10 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f15sm2639779wmg.30.2021.11.16.03.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:03:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 8/9] common-user: Adjust system call return on FreeBSD
Date: Tue, 16 Nov 2021 12:02:55 +0100
Message-Id: <20211116110256.365484-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116110256.365484-1-richard.henderson@linaro.org>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

From: Warner Losh <imp@bsdimp.com>

FreeBSD system calls return positive errno.  On the 4 hosts for
which we have support, error is indicated by the C bit set or clear.

Signed-off-by: Warner Losh <imp@bsdimp.com>
[rth: Rebase on new safe_syscall_base api; add #error check.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 common-user/host/aarch64/safe-syscall.inc.S | 12 +++++++++++-
 common-user/host/arm/safe-syscall.inc.S     | 11 +++++++++++
 common-user/host/i386/safe-syscall.inc.S    | 10 ++++++++++
 common-user/host/x86_64/safe-syscall.inc.S  | 10 ++++++++++
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
index 95c60d8609..d3f065cdef 100644
--- a/common-user/host/aarch64/safe-syscall.inc.S
+++ b/common-user/host/aarch64/safe-syscall.inc.S
@@ -65,12 +65,22 @@ safe_syscall_start:
 safe_syscall_end:
 
 	/* code path for having successfully executed the syscall */
-	cmn	x0, #4095
+#if defined(__linux__)
+	/* Linux kernel returns (small) negative errno. */
+	cmn	x0, #4096
+	b.hi	0f
+#elif defined(__FreeBSD__)
+	/* FreeBSD kernel returns positive errno and C bit set. */
 	b.cs	1f
+#else
+#error "unsupported os"
+#endif
 	ret
 
 	/* code path setting errno */
+#ifdef __linux__
 0:	neg	w0, w0			/* create positive errno */
+#endif
 1:	str	w0, [x11]		/* store errno */
 	mov	x0, #-1
 	ret
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
index 17839c6486..328299021d 100644
--- a/common-user/host/arm/safe-syscall.inc.S
+++ b/common-user/host/arm/safe-syscall.inc.S
@@ -82,12 +82,23 @@ safe_syscall_start:
 safe_syscall_end:
 
 	/* code path for having successfully executed the syscall */
+#if defined(__linux__)
+	/* Linux kernel returns (small) negative errno. */
 	cmp	r0, #-4096
 	bhi	0f
+#elif defined(__FreeBSD__)
+	/* FreeBSD kernel returns positive errno and C bit set. */
+	bcs	1f
+#else
+#error "unsupported os"
+#endif
+
 9:	pop	{ r4, r5, r6, r7, r8, r9, r10, pc }
 
 	/* code path setting errno */
+#ifdef __linux__
 0:	neg	r0, r0		/* create positive errno */
+#endif
 1:	str	r0, [r9]	/* store errno */
 	mov	r0, #-1
 	b	9b
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index ad89521783..a9382f777e 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -76,8 +76,16 @@ safe_syscall_start:
 safe_syscall_end:
 
 	/* code path for having successfully executed the syscall */
+#if defined(__linux__)
+	/* Linux kernel returns (small) negative errno. */
 	cmp	$-4095, %eax
 	jae	0f
+#elif defined(__FreeBSD__)
+	/* FreeBSD kernel returns positive errno and C bit set. */
+	jcs	1f
+#else
+#error "unsupported os"
+#endif
 
 9:	pop	%ebx
 	.cfi_remember_state
@@ -97,7 +105,9 @@ safe_syscall_end:
 	.cfi_restore_state
 
 	/* code path setting errno */
+#ifdef __linux__
 0:	neg	%eax			/* create positive errno */
+#endif
 1:	mov	8+16(%esp), %ebx	/* load errno pointer */
 	mov	%eax, (%ebx)		/* store errno */
 	mov	$-1, %eax
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
index 9a0c4c93b4..36b7efe2ca 100644
--- a/common-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -75,8 +75,16 @@ safe_syscall_start:
 safe_syscall_end:
 
         /* code path for having successfully executed the syscall */
+#if defined(__linux__)
+	/* Linux kernel returns (small) negative errno. */
         cmp	$-4095, %rax
         jae	0f
+#elif defined(__FreeBSD__)
+	/* FreeBSD kernel returns positive errno and C bit set. */
+	jcs	1f
+#else
+#error "unsupported os"
+#endif
 
 9:      pop     %rbp
         .cfi_remember_state
@@ -86,7 +94,9 @@ safe_syscall_end:
         .cfi_restore_state
 
         /* code path setting errno */
+#ifdef __linux__
 0:      neg	%eax			/* create positive errno */
+#endif
 1:      mov	%eax, (%rbp)		/* store errno */
         mov	$-1, %rax
         jmp	9b
-- 
2.25.1


