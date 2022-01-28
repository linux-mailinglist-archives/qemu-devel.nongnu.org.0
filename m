Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490304A0472
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:46:34 +0100 (CET)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDawr-0004g3-CC
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:46:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf6-0000H8-UU
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:12 -0500
Received: from [2607:f8b0:4864:20::d31] (port=34802
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf5-0001Z2-C7
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:12 -0500
Received: by mail-io1-xd31.google.com with SMTP id i62so9719959ioa.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IIwWr4XQkvp7rEwjOGXmWZZadDj8kG6ZitoG4k00onk=;
 b=tjYLNQne+w/q/cgCQOn9/MCpZo8OsZ+agiKl2NycwIwh4lFOwW40xkiwTKz810AA66
 6dMuwek1kTtTozxadyjK5q36yT6pdqCQYo1iShx/1r7xAz50cXaNBqMwzC6NHtkO51Ov
 bfIvbuwxPzCuDgBg4XiXDuIE14pUW+YsVx+Wf92dAFYbypTcn0uG/V3X7bat1xyjg/Ao
 KmwKyCAS7fy8osHDRVpiMZ015OTWxybxqEAwTh+hBBpqL0IDx64Eu7MGKcBk5XhFLtYn
 WFl1EOhRVOc8DuMp3qSZdckiJTccugCaSn+U6bGAhUKs/jEH8fJ1WqUMN7MpVk1LjkRt
 MTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IIwWr4XQkvp7rEwjOGXmWZZadDj8kG6ZitoG4k00onk=;
 b=t/Wuh4MRJAamuwOjBY17lGEDIA4BvP6VxNP/wnFsBM6csnst7Wi1NtP+c3fYUhUrVl
 mFjoAreesh/MbCW8FJSFq6SD3xi5jRQA7DuES1QljKebvW2AsYDl2X9sMC4SjmeUuqEc
 tl+hSdUk5W6NpdL3A6V6vaUw74NzDIKUXXX6ZZyCNm2sbKNYamX2sErZH/bT/60sD3Vh
 GRkCMutJ3QU8h58H/DUHqu/glnUOM3ymx0gmfYCVkGTGYn9rIL8IqyAKJJGN83XkyYVL
 1smcH8nGqx/BiNZ7z0FAD9MgmL6iZOcbaZb337UbNG7/HPIWF+r/bJnRvoho4ucFiIBY
 2KGA==
X-Gm-Message-State: AOAM530qPCed6jBjx1Pxcdc0aEcqT2GLmZfQ7gWH3qbFDOmubHUD8py5
 TYjeXZ6nt3foRfwK1cKpCNEV55qgye07JQ==
X-Google-Smtp-Source: ABdhPJwac7O+HX+W6J5ce2nHrB5kjyGREmUQS8E1HbOxbkk1bVkx3lvkpioWH2FJcxOilAazAD9gAA==
X-Received: by 2002:a05:6638:4105:: with SMTP id
 ay5mr6057564jab.128.1643412490084; 
 Fri, 28 Jan 2022 15:28:10 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:09 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/40] bsd-user/signal-common.h: Move signal functions
 prototypes to here
Date: Fri, 28 Jan 2022 16:27:34 -0700
Message-Id: <20220128232805.86191-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h    | 1 +
 bsd-user/i386/target_arch_cpu.h   | 1 +
 bsd-user/qemu.h                   | 8 --------
 bsd-user/signal-common.h          | 6 ++++++
 bsd-user/x86_64/target_arch_cpu.h | 1 +
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index c526fc73502..b7f728fd667 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -21,6 +21,7 @@
 #define _TARGET_ARCH_CPU_H_
 
 #include "target_arch.h"
+#include "signal-common.h"
 
 #define TARGET_DEFAULT_CPU_MODEL "any"
 
diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index b28602adbbd..472a96689fc 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -20,6 +20,7 @@
 #define _TARGET_ARCH_CPU_H_
 
 #include "target_arch.h"
+#include "signal-common.h"
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu32"
 
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 671b26f00cc..99c37fc9942 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -199,14 +199,6 @@ print_openbsd_syscall(int num,
 void print_openbsd_syscall_ret(int num, abi_long ret);
 extern int do_strace;
 
-/* signal.c */
-void process_pending_signals(CPUArchState *cpu_env);
-void signal_init(void);
-long do_sigreturn(CPUArchState *env);
-long do_rt_sigreturn(CPUArchState *env);
-void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
-
 /* mmap.c */
 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index 6207417d39e..f9a9d1e01aa 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -9,6 +9,12 @@
 #ifndef SIGNAL_COMMON_H
 #define SIGNAL_COMMON_H
 
+long do_rt_sigreturn(CPUArchState *env);
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
+long do_sigreturn(CPUArchState *env);
 void force_sig_fault(int sig, int code, abi_ulong addr);
+void process_pending_signals(CPUArchState *env);
+void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
+void signal_init(void);
 
 #endif
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 5172b230f09..14def48adb5 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -20,6 +20,7 @@
 #define _TARGET_ARCH_CPU_H_
 
 #include "target_arch.h"
+#include "signal-common.h"
 
 #define TARGET_DEFAULT_CPU_MODEL "qemu64"
 
-- 
2.33.1


