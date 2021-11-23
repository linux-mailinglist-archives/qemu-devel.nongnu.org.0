Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B054F45AA49
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:44:43 +0100 (CET)
Received: from localhost ([::1]:49360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZqU-0000rw-QX
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:44:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkQ-0004dX-2O
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:26 -0500
Received: from [2a00:1450:4864:20::429] (port=42877
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkO-00051f-44
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:25 -0500
Received: by mail-wr1-x429.google.com with SMTP id c4so40260658wrd.9
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT2OMMtgUWRlyX31jrb7FBHkLkGN7+LrqX+ZG1ZjPS0=;
 b=a8isYkxchPBI2kG171Ixrg55LY6eoLftSd99O1kunKem/Y7BYl9ZIXTsS5DJEZVHDM
 PDFVu2RlItAPeJZ0tM/q8gGCsSqhjL7N05XtmBAWdJmQ0XXjOQppQ7n5yLTdVVXOgy7L
 28rYMJU1A4+YEKrb90lPE5s5xzoEsN2OMeFihOuBEgdopxA8LAZhrNrLJZALqc66Yg/o
 NKpvqlTKxyZuitk1f8elsR/r7JTx2h4z9e9K5oyGkouuEhLcR74xDYJ/FAzQgbXPn1oY
 JyOVo92uy03OpXJAuPJ2GCuwW92neS64qxFPEPyptZR64Eh4OxUP2Kas0C/KMEt93p2k
 Pybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT2OMMtgUWRlyX31jrb7FBHkLkGN7+LrqX+ZG1ZjPS0=;
 b=KZgk244a85cOI3IiDPyewk+MGUnsfglCnYKGlxNxsIQV/XKWLZqs632+Ume+K467jz
 aIgrz9NBt/BQNxjBd1QajvL4sFUhTf3NYwjGxnlQmQ0mGOJ4efV834Wh4FqQtqMq4xNs
 Dt7ybY4Wfrt3M+Ng4rgHX+BZfV9m4/V7sC1nUY8qwfsPvo4xoXhfct3LMrlMxNmRy9ho
 PI7bzSUH6rwxaxoP3Gdg922uStV3ikRrBuE8yh0ts10irBGMlJns1w26wou+eC2mdXTU
 1l++LWQ4YMkKA2lWWM6fyoVA2jjEg99APsY+NlK0k1VERpmIU1mweXdN9bCnsUamQhgt
 HY/w==
X-Gm-Message-State: AOAM530n3x5jYJO+3opLg9h+eA87AGpxW2WTaFDSeo4h9s4WeqYqlfiK
 /DdxLefgPlullm28PN4FHuLAfVdn3b+CifxAneo=
X-Google-Smtp-Source: ABdhPJyCCyUlflNbCPZ39PkXhmVcy4ITnBRIiWKfO0wzCkf5uIzFtssQ3hKj/voF6SpuSfNLL0JTXw==
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr9280183wry.55.1637689102341; 
 Tue, 23 Nov 2021 09:38:22 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 13/16] common-user: Adjust system call return on FreeBSD
Date: Tue, 23 Nov 2021 18:37:56 +0100
Message-Id: <20211123173759.1383510-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
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


