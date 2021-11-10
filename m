Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83E44C511
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:34:07 +0100 (CET)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqY2-0001or-Dg
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:34:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWh-0007Zq-4A
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:43 -0500
Received: from [2607:f8b0:4864:20::133] (port=34507
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWe-0005cC-OH
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:42 -0500
Received: by mail-il1-x133.google.com with SMTP id j28so3151099ila.1
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pp/SgrJ7oVlk8CEiQ0y2Iv+sqjnUd/aIJ3A0oSLvc2o=;
 b=uWVVrdL2g1xI6fGTzgZyBXhKN6Th/d/5zyTfftPE8PNRC6ZnAOMhDZErNXnsNj3575
 dLw7vJ7DLSg/2ptH+oEEU8AFkEmPxVTtvoQ16jKMXZ/mdf8lXGhZt4IzA2AeqPfgQGfo
 JASm98m8l6nEXhsGn4nE+qL3iludjBEmjYUgEeH39cOl7G+6U34oR7J6yGbIHZwukw9L
 GFZw0rYLkRgADzeub+TN+b59wbGkoeXAgYy8l9m9zmHE+Vnfz36UF+FtF3U35JEaBwgt
 iC6Ve+4jXqTT1BUC6nmOcHXcComOMc+EOaMBIVIAg2t4r0LlsdS43k3To3PMh6e6l/qn
 NviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pp/SgrJ7oVlk8CEiQ0y2Iv+sqjnUd/aIJ3A0oSLvc2o=;
 b=V9kJjm6MICL4KfhCdl4S3StnqLX6Gn/3pKNNpI4uBy7YeS1i4+ZRAA9bUKNh2CbmaF
 6FyXvfWvMUxqEbAovpbQFafWzd99eqCrng3wrtTRdI60YwSNtenuz6UPAbGQiFTjGCy1
 P7YwhffoKva66MQzNRP2pIcERTwhfYzcFd9Wq7SnFORuZOoL5CQwSVO/wv7DfHRAPVwj
 txJF/yzl1SJofC3MQ2ws4Iz50EG27+ccsA6IZeqpiaawD/wtVFahuC7yPw9yYkenpAZy
 1yfacsMcPf6dMAD7x8yH9/uNKK+wbUMZN+tSc0fUPk6/vsmxml2Ur+WJ+OOr/h+gQXnB
 bsPg==
X-Gm-Message-State: AOAM533ci5larn/PW1wyMZBWbY8WIdtFk+MpxkW3YnLqDtkRVDmfjMx+
 ks4ZHERSPf97D83g454/ZQRvdD+1/DnQug==
X-Google-Smtp-Source: ABdhPJyvaTp0lBJgZlIFZX/kXxcsBxcWCX51Oda4B4yR/lfWEosu3Qq6B/+PKD+N86HUuVk8QqfJqw==
X-Received: by 2002:a05:6e02:1b8a:: with SMTP id
 h10mr181962ili.237.1636561959191; 
 Wed, 10 Nov 2021 08:32:39 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x2sm130403iom.46.2021.11.10.08.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 08:32:38 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 4/6] common-user: Adjust system call return on FreeBSD
Date: Wed, 10 Nov 2021 09:31:31 -0700
Message-Id: <20211110163133.76357-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211110163133.76357-1-imp@bsdimp.com>
References: <20211110163133.76357-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the *-users generally use the Linux style of negative return codes
for errno. FreeBSD returns errno, not -errno. Add ifdefs for FreeBSD to
make the adjustment on the 4 hosts that we have support for.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 common-user/host/aarch64/safe-syscall.inc.S | 5 +++++
 common-user/host/arm/safe-syscall.inc.S     | 5 +++++
 common-user/host/i386/safe-syscall.inc.S    | 5 +++++
 common-user/host/x86_64/safe-syscall.inc.S  | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host/aarch64/safe-syscall.inc.S
index bc1f5a9792..6584950ccf 100644
--- a/common-user/host/aarch64/safe-syscall.inc.S
+++ b/common-user/host/aarch64/safe-syscall.inc.S
@@ -64,6 +64,11 @@ safe_syscall_start:
 	svc	0x0
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+#ifdef __FreeBSD__
+        b.cc    2f              /* Convert to Linux -ERRNO convention */
+        neg     x0, x0
+2:
+#endif
 	ret
 
 0:
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm/safe-syscall.inc.S
index 88c4958504..85c47387f9 100644
--- a/common-user/host/arm/safe-syscall.inc.S
+++ b/common-user/host/arm/safe-syscall.inc.S
@@ -78,6 +78,11 @@ safe_syscall_start:
 	swi	0
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+#ifdef __FreeBSD__
+        bcc     2f
+        neg     r0, r0
+2:
+#endif
 	pop	{ r4, r5, r6, r7, r8, pc }
 
 1:
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index 9e58fc6504..7bb6a98a8b 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -75,6 +75,11 @@ safe_syscall_start:
 	int	$0x80
 safe_syscall_end:
 	/* code path for having successfully executed the syscall */
+#ifdef __FreeBSD__
+        jnb     2f              /* Convert to Linux -ERRNO convention */
+        neg     %eax
+2:
+#endif
 	pop	%ebx
 	.cfi_remember_state
 	.cfi_adjust_cfa_offset -4
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
index f36992daa3..7d8792c7ef 100644
--- a/common-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -72,6 +72,11 @@ safe_syscall_start:
         syscall
 safe_syscall_end:
         /* code path for having successfully executed the syscall */
+#ifdef __FreeBSD__
+        jnb     2f	/* Convert to Linux -ERRNO convention */
+        neg     %rax
+2:
+#endif
         pop     %rbp
         .cfi_remember_state
         .cfi_def_cfa_offset 8
-- 
2.33.0


