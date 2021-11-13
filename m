Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEBA44F149
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 05:58:44 +0100 (CET)
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mll7j-0000l0-Up
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 23:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5z-00075Y-4g
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:55 -0500
Received: from [2607:f8b0:4864:20::12d] (port=38872
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5x-0003MM-FI
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:54 -0500
Received: by mail-il1-x12d.google.com with SMTP id m11so11007339ilh.5
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 20:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/cI7/lZ29fPR8PehHUnyTqOz707sUTy3NDk8wdWBImQ=;
 b=wNsPTT8KprmBo+K671mMfXxdGVVbUpGXQDBDRatJMCX3MLsNTK0WvMhTNVxEvy8cej
 RyMs3OiE8PmExD6umrZaBdP4DoVnijqD1eU4CkZpVfXEQ+4ne2u7ulMI/APppMBWFo+A
 qH6vlPyq0ERzOkQMtwZbveht1bY+Z2oN0M30qNRSkk/aWdYEEMkn8LfsiKGP4pIpn6fA
 5AM2o8dLb6ak9uaBnTEvXJEUd+rF/8+qvvI5++dlIMQMh4C14wF4jg4XACCqT1DODBl5
 RpDySDvBwe7pqkOtxIhSJuxF12S/7EUvE1jWkTCSEqwsxlUnRnpdzUcEgN/vkMWEe5nd
 JO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/cI7/lZ29fPR8PehHUnyTqOz707sUTy3NDk8wdWBImQ=;
 b=0oBhAPoTCM18rUYXNiIR/guoG+3uPnuL70aR5py5hWjj2SHKn71JNgh5kHocpRmVCp
 UCnXgb2h8y7QSRqhQIADqdz0C0T3qoP5d/Hipiu6aexSR0zTIW20wtKU7Ilik0uupPRv
 4eCeSNxjOg7f4OC1agvhcofeYiD0DPOoRL06a071ky7Jb7N5wraKU+HrvWCZbTfimDSP
 BQ38bTpXPL3ZSSWhca//M0kc4AKn+84DUw+OvhmJBNLxMTmIrbSVXJqhU/XmSKUQQKGW
 cQLAMs3bDaGSy1g7NBoJq+8tCWJ1dohelvvcIepj0XUiWCc8ipGcWRjEtTeaH0kon4zG
 edFA==
X-Gm-Message-State: AOAM533IewQvC8L/L+gQZKw5bvhRpN6qOKoe8Mle1BFKkxuXHLjEisfk
 Tccl+pv+Kt6cI1TuY2FpvyBUlOpqJStCSQ==
X-Google-Smtp-Source: ABdhPJwwUkbnhVXXSkrNm1ndNv+N7RIj22056XGlV6NksiW9pGA7sfyWCdtE5bHVWofno3vF42mUSg==
X-Received: by 2002:a05:6e02:144e:: with SMTP id
 p14mr12271986ilo.180.1636779412254; 
 Fri, 12 Nov 2021 20:56:52 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id r14sm5414455iov.14.2021.11.12.20.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 20:56:51 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 4/5] common-user: Adjust system call return on FreeBSD
Date: Fri, 12 Nov 2021 21:56:02 -0700
Message-Id: <20211113045603.60391-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211113045603.60391-1-imp@bsdimp.com>
References: <20211113045603.60391-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Konrad Witaszczyk <def@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the *-users generally use the negative errno return codes to signal
errno for a system call.  FreeBSD's system calls, on the other hand,
returns errno, not -errno. Add ifdefs for FreeBSD to make the adjustment
on the 4 hosts that we have support for.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 common-user/host/aarch64/safe-syscall.inc.S | 8 ++++++++
 common-user/host/arm/safe-syscall.inc.S     | 7 +++++++
 common-user/host/i386/safe-syscall.inc.S    | 9 +++++++++
 common-user/host/x86_64/safe-syscall.inc.S  | 9 +++++++++
 4 files changed, 33 insertions(+)

diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
index bc1f5a9792..9f9525fe25 100644
--- a/common-user/host/aarch64/safe-syscall.inc.S
+++ b/common-user/host/aarch64/safe-syscall.inc.S
@@ -64,6 +64,14 @@ safe_syscall_start:
 	svc	0x0
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+#ifdef __FreeBSD__
+        /*
+         * FreeBSD kernel returns C bit set with positive errno.
+         * Encode this for use in bsd-user as -errno:
+	 *    x0 = !c ? x0 : -x0
+	 */
+	csneg  x0, x0, x0, cc
+#endif
 	ret
 
 0:
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
index 88c4958504..459e5f87c2 100644
--- a/common-user/host/arm/safe-syscall.inc.S
+++ b/common-user/host/arm/safe-syscall.inc.S
@@ -78,6 +78,13 @@ safe_syscall_start:
 	swi	0
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+#ifdef __FreeBSD__
+        /*
+         * FreeBSD kernel returns C bit set with positive errno.
+         * Encode this for use in bsd-user as -errno:
+         */
+        negcs   r0, r0
+#endif
 	pop	{ r4, r5, r6, r7, r8, pc }
 
 1:
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index 9e58fc6504..ba55a35e92 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -75,6 +75,15 @@ safe_syscall_start:
 	int	$0x80
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+#ifdef __FreeBSD__
+        /*
+         * FreeBSD kernel returns C bit set with positive errno.
+         * Encode this for use in bsd-user as -errno:
+         */
+        jnb     2f
+        neg     %eax
+2:
+#endif
 	pop	%ebx
 	.cfi_remember_state
 	.cfi_adjust_cfa_offset -4
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
index f36992daa3..46c527e058 100644
--- a/common-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -72,6 +72,15 @@ safe_syscall_start:
         syscall
 safe_syscall_end:
         /* code path for having successfully executed the syscall */
+#ifdef __FreeBSD__
+        /*
+         * FreeBSD kernel returns C bit set with positive errno.
+         * Encode this for use in bsd-user as -errno:
+         */
+        jnb     2f
+        neg     %rax
+2:
+#endif
         pop     %rbp
         .cfi_remember_state
         .cfi_def_cfa_offset 8
-- 
2.33.0


