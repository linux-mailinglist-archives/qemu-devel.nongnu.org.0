Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26C04478AB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 03:49:08 +0100 (CET)
Received: from [::1] (port=54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjuiZ-0000az-SV
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 21:49:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjueo-00031C-Sb
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:45:16 -0500
Received: from [2607:f8b0:4864:20::729] (port=45012
 helo=mail-qk1-x729.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjuem-0005iS-KW
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:45:14 -0500
Received: by mail-qk1-x729.google.com with SMTP id bj27so12616114qkb.11
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 18:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QM8P6vA6pWnuv+Hy7+9bIDhpoDEGw1El8RwQH909eMg=;
 b=iWiohcwSc3a7WtOW5w5HIw+cG5KlcsMwzlCjiGDkG4zxZfVPbJ5SoWcsNTUcZ7UtHw
 5T3twnTC9iNUyCAO/uHdAExMPiB6sU6eCrwmTDNmkqreFRTTwGNmcLX6RgGdjClVspRc
 0GIAVpyQioo3QS6Tga/8kcc5y8njCXJyZzHQMgAy4Q59SKULjjap4CaCCeEfbvoRdKvP
 xLJZuPAVG1EPT3vQvYVxOj9FVr1c9Fy3tLfXXr+k7TX9VjaRCNnJdDQ4ZslBKzKlrKVc
 6uo85SoXjnEVe14KWATv6cSYUNZYf0y3wHbO2q9zpBjwQtcXL98Bpi/MbOMVr1hrQO3V
 2wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QM8P6vA6pWnuv+Hy7+9bIDhpoDEGw1El8RwQH909eMg=;
 b=YENjTh40LKplfA3hR4opCa8GIR06oUOAjji5mwY8zpMnbi2auxNw28hiQiaEbDeDqV
 9F3LYfAeGlozVsJSkhWpifVgQoVkdWYkriThfOS4qmIC5X8Xc5klVp0qFoU+pGSHqF+b
 4IcxBxoVR3UIfr1492oGwWPQ+pohXp+V7D6N22rCQGOSAiOcZtUOCWNbNpddsVuk8GSZ
 kiVZ7QwRJlcFOx+ij570q5zJ4xI9bTeWDD1XT8/rfd9KATPjeSXKvvTcZEcZecJ9RkkN
 iQs2KYBWfp2M7PqsRk/1p+/omJF4UP5ARd9DWAYIVx7+8+O3JjDbEN45ZxKmgMKU55co
 c7Ug==
X-Gm-Message-State: AOAM531y1gr9lvwOTP6xZ77MDjdHF7EhqlhjjcPgRO6I5i4NwAPZgVFY
 dvIkVpP2A05yQSx72XWIamwXW/sbLzzZLQ==
X-Google-Smtp-Source: ABdhPJz3eYaDzxnJKgOLnqOX2xI4HrSS/nuKt8JbyTI0OKTntUMIO0ydh7/nEVDgbNCeW97P4i3LTA==
X-Received: by 2002:a02:2a04:: with SMTP id w4mr21541594jaw.107.1636339094116; 
 Sun, 07 Nov 2021 18:38:14 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m2sm9030284iow.6.2021.11.07.18.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 18:38:13 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC 4/4] common-user: Allow return codes to be adjusted after sytsem
 call
Date: Sun,  7 Nov 2021 19:37:38 -0700
Message-Id: <20211108023738.42125-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108023738.42125-1-imp@bsdimp.com>
References: <20211108023738.42125-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::729
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::729;
 envelope-from=imp@bsdimp.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the *-users generally use the Linux style of negative return codes
for errno. However, other systems, like FreeBSD, have a different
convention. Allow those systems to insert code after the syscall that
adjusts the return value of the system call to match the native linux
format.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 common-user/host/aarch64/safe-syscall.inc.S | 1 +
 common-user/host/arm/safe-syscall.inc.S     | 1 +
 common-user/host/i386/safe-syscall.inc.S    | 1 +
 common-user/host/ppc64/safe-syscall.inc.S   | 1 +
 common-user/host/riscv/safe-syscall.inc.S   | 1 +
 common-user/host/s390x/safe-syscall.inc.S   | 1 +
 common-user/host/x86_64/safe-syscall.inc.S  | 1 +
 linux-user/safe-syscall.S                   | 1 +
 8 files changed, 8 insertions(+)

diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
index bc1f5a9792..81d83e8e79 100644
--- a/common-user/host/aarch64/safe-syscall.inc.S
+++ b/common-user/host/aarch64/safe-syscall.inc.S
@@ -64,6 +64,7 @@ safe_syscall_start:
 	svc	0x0
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+	ADJUST_SYSCALL_RETCODE
 	ret
 
 0:
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
index 88c4958504..40e9a5e28d 100644
--- a/common-user/host/arm/safe-syscall.inc.S
+++ b/common-user/host/arm/safe-syscall.inc.S
@@ -78,6 +78,7 @@ safe_syscall_start:
 	swi	0
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+	ADJUST_SYSCALL_RETCODE
 	pop	{ r4, r5, r6, r7, r8, pc }
 
 1:
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index 9e58fc6504..eb6b43bd81 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -75,6 +75,7 @@ safe_syscall_start:
 	int	$0x80
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+	ADJUST_SYSCALL_RETCODE
 	pop	%ebx
 	.cfi_remember_state
 	.cfi_adjust_cfa_offset -4
diff --git a/common-user/host/ppc64/safe-syscall.inc.S b/common-user/host/ppc64/safe-syscall.inc.S
index 875133173b..974bd03f8d 100644
--- a/common-user/host/ppc64/safe-syscall.inc.S
+++ b/common-user/host/ppc64/safe-syscall.inc.S
@@ -75,6 +75,7 @@ safe_syscall_start:
 	sc
 safe_syscall_end:
 	/* code path when we did execute the syscall */
+	ADJUST_SYSCALL_RETCODE
 	ld 14, 16(1) /* restore r14 to its original value */
 	bnslr+
 
diff --git a/common-user/host/riscv/safe-syscall.inc.S b/common-user/host/riscv/safe-syscall.inc.S
index 9ca3fbfd1e..a4bd5c5c72 100644
--- a/common-user/host/riscv/safe-syscall.inc.S
+++ b/common-user/host/riscv/safe-syscall.inc.S
@@ -66,6 +66,7 @@ safe_syscall_start:
 	scall
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+	ADJUST_SYSCALL_RETCODE
 	ret
 
 0:
diff --git a/common-user/host/s390x/safe-syscall.inc.S b/common-user/host/s390x/safe-syscall.inc.S
index 414b44ad38..4ba60fbed0 100644
--- a/common-user/host/s390x/safe-syscall.inc.S
+++ b/common-user/host/s390x/safe-syscall.inc.S
@@ -76,6 +76,7 @@ safe_syscall_start:
 	jne	2f
 	svc	0
 safe_syscall_end:
+	ADJUST_SYSCALL_RETCODE
 
 1:	lg	%r15,0(%r15)		/* load back chain */
 	.cfi_remember_state
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
index f36992daa3..e1ae6f83e6 100644
--- a/common-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -72,6 +72,7 @@ safe_syscall_start:
         syscall
 safe_syscall_end:
         /* code path for having successfully executed the syscall */
+	ADJUST_SYSCALL_RETCODE
         pop     %rbp
         .cfi_remember_state
         .cfi_def_cfa_offset 8
diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S
index 42ea7c40ba..0d6dd19398 100644
--- a/linux-user/safe-syscall.S
+++ b/linux-user/safe-syscall.S
@@ -17,6 +17,7 @@
  * so that this will pull in the right fragment for the architecture.
  */
 #ifdef HAVE_SAFE_SYSCALL
+#define ADJUST_SYSCALL_RETCODE		/* No adjustment for linux */
 #include "safe-syscall.inc.S"
 #endif
 
-- 
2.33.0


