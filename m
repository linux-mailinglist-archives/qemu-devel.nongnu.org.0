Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98C454AB8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:12:43 +0100 (CET)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNYA-0007ZP-Tf
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:12:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQH-0000Ln-IK
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:33 -0500
Received: from [2a00:1450:4864:20::429] (port=37393
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQF-00033J-Uu
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:33 -0500
Received: by mail-wr1-x429.google.com with SMTP id b12so5665041wrh.4
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IaZ8V/ONic8Ys5rmKynWN7qHC6dKp3nMuaxeyGdYyPo=;
 b=uAcNK8WAD0lk6DL5AlXo7OICncTMRozM6r1JZ+EPw08mS8Ting6RvlPMqecR6i1B+1
 JS8SCTFXdl7l58xyKQX27isaN3akfLCaJoJ5BNRp4GRigtgPTN0kiw/4stLlTviLkfZh
 X2RkLTZfL25vij4fFxZh9/9yfaBmSYd/a1cQdNShMVFD/5gCWmHcqjIPnudXAfovFF1U
 btZ8tcWCg6APsqsxKQF7yx/TWBZvhA3iA4W1qSTJHI0DfXc7YuWLvjNXWBAuf/ALxe+S
 LjBhHalROwanCvgUfIgC6BLnm2GlYm78OISKV6WlEKxGtQEpMG+BRgwltFvjI9ZdXd8k
 zK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IaZ8V/ONic8Ys5rmKynWN7qHC6dKp3nMuaxeyGdYyPo=;
 b=5eP6SR4y4N/m/XkjieWI5p8d2UJGkXUSYPIea1u2ZJfYYCHuM5uycGuEV6okAnpn8P
 ddtSS8b4hLFD2UuKtd/iwdbL5v2o8+G+fyvy/HO/an1QiyQmA3EKdzOE+PP/fhQ/ceWi
 YB1yfJ7pI3Y+U+UuyKm184SbjOjgfstWT7ufOyABeU8yuqBizjenOnAaA3eMnP4tQI3t
 Ojh9cQH9dS49LbNXV5PLNZxpADChI4Lsr+6W98dV0T27LK1m3yVJw9k3j/x78qRJk+w8
 nb/6mwbmEz2UBgyP9A0E3t6FC8TRj5zWO06yJhyEUb7sBKO4l07wXGY8nVJrQbIyHyYZ
 DUEw==
X-Gm-Message-State: AOAM533X3UO8T4ww57tH7X9MY/Gxqfm2mCjKdEMnq5LAXTooBOGDHYie
 yg1gXzuiq0yJkjSND45G5Wn5NerKOTbOXjLgLls=
X-Google-Smtp-Source: ABdhPJwpN2lg6aS0Z+v49IuxM68sgB/Y7lWIXeBRRZgzQi+m8ZzYv2lL2EGioLBI/7V3WYUx9BWv2g==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr21162458wrm.83.1637165070268; 
 Wed, 17 Nov 2021 08:04:30 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/17] common-user: Adjust system call return on FreeBSD
Date: Wed, 17 Nov 2021 17:04:03 +0100
Message-Id: <20211117160412.71563-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
index ad89521783..c27207492a 100644
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
+	jc	1f
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
index 9a0c4c93b4..e3f920fa5c 100644
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
+	jc	1f
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


