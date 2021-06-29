Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A93B78DB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:49:28 +0200 (CEST)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJjb-0000Xc-Cy
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItU-0000Bc-6d
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:36 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItC-0000wf-JX
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id c8so104495pfp.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Zapp0K87eHLqDH9uXtHOc8lqqdhk1016Rq7nGzaj2E=;
 b=QjX9pJ6jB5H8fuTkUsMw+Rfxx+TBAM+XKt2XF/j/aRaxGvdEdNEU1/gyFb/lfnmnKS
 onDPXS1QozvlxUCEPKOrGCaglc2NcGbnIhYDxQcpc82TuT1ulNQPvw2GbLdiP+zApC/b
 F1pJq7K2vNd80ChWn50SZIO2WCxEiCk5lA1CbjRgY+Wy8z1hFPXet42kaq+NzGG5UWT/
 79nE1C6YFE8fSck2Qcxc1UGeT9W+CKL+U9Lc2m2avJ2DZM9aAvC1C6cBeE80lQb7GKq4
 KXreiMPvfunxcOJxo5QbcyHHVhOEs9eIvwlaLFKntK2HvmBcaG8qevK3TXNV4sq5Gtp3
 ++hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Zapp0K87eHLqDH9uXtHOc8lqqdhk1016Rq7nGzaj2E=;
 b=rxGn6dke5UtIymtw5d/kyfxpOJbGyo/TKjibWYTJ+BucEp3CyROGv7KraLx3QpwTm9
 WftSVvtQWxdiV5SixxeuTzOeFdQX4omZl0YfNCyd1YVVjlmwwON5zETIJZabfo1YyXaT
 sfQrUGd4UaVOn3uNqABgub+Xf7m2W6XQGg/c/sgHvFMAvaMtgA/UL53WJvYfTh4uVE9j
 JudryV1Xy1+nFGrrVp4cWbBP24Oaqc7+28OZ5cI3XxSYgenjwuSl4WUSnfX70NleerOd
 aAOekRzLllznE8O/6b2surH77719By86pi5b8jbN7ZNAKyX0X2JliUNho9YchEVbf4bE
 hsmw==
X-Gm-Message-State: AOAM531qhJf3t9FvIqgeBekt8ISS9d437o0AoTAnDcIowDD1vaT9qEK3
 IzQvIVURwqdLaSGiH6HdqkpITlbHgHAn1Q==
X-Google-Smtp-Source: ABdhPJz86yhV46uPhl/U8HmW75qv3IP7SeZirRvEEAS7oDFctlvGBggySej6CltAN0Hg3TzSnehydA==
X-Received: by 2002:a65:6494:: with SMTP id e20mr2796181pgv.101.1624992917326; 
 Tue, 29 Jun 2021 11:55:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/63] tcg: Use correct trap number for page faults on *BSD
 systems
Date: Tue, 29 Jun 2021 11:54:26 -0700
Message-Id: <20210629185455.3131172-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juergen Lock <nox@FreeBSD.org>, Mark Johnston <markj@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

The trap number for a page fault on BSD systems is T_PAGEFLT
not 0xe -- 0xe is used by Linux and represents the intel hardware
trap vector. The BSD kernels, however, translate this to T_PAGEFLT
in their Xpage, Xtrap0e, Xtrap14, etc fault handlers. This is true
for i386 and x86_64, though the name of the trap hanlder can very
on the flavor of BSD. As far as I can tell, Linux doesn't provide
a define for this value. Invent a new one (PAGE_FAULT_TRAP) and
use it instead to avoid uglier ifdefs.

Signed-off-by: Mark Johnston <markj@FreeBSD.org>
Signed-off-by: Juergen Lock <nox@FreeBSD.org>
[ Rework to avoid ifdefs and expand it to i386 ]
Signed-off-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20210625045707.84534-3-imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index e67b1617b5..ba09fd0413 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -254,28 +254,35 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 
 #if defined(__NetBSD__)
 #include <ucontext.h>
+#include <machine/trap.h>
 
 #define EIP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_EIP])
 #define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
+#include <machine/trap.h>
 
 #define EIP_sig(context)  (*((unsigned long *)&(context)->uc_mcontext.mc_eip))
 #define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
 #define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__OpenBSD__)
+#include <machine/trap.h>
 #define EIP_sig(context)     ((context)->sc_eip)
 #define TRAP_sig(context)    ((context)->sc_trapno)
 #define ERROR_sig(context)   ((context)->sc_err)
 #define MASK_sig(context)    ((context)->sc_mask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #else
 #define EIP_sig(context)     ((context)->uc_mcontext.gregs[REG_EIP])
 #define TRAP_sig(context)    ((context)->uc_mcontext.gregs[REG_TRAPNO])
 #define ERROR_sig(context)   ((context)->uc_mcontext.gregs[REG_ERR])
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      0xe
 #endif
 
 int cpu_signal_handler(int host_signum, void *pinfo,
@@ -301,34 +308,42 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     pc = EIP_sig(uc);
     trapno = TRAP_sig(uc);
     return handle_cpu_signal(pc, info,
-                             trapno == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             trapno == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
 #elif defined(__x86_64__)
 
 #ifdef __NetBSD__
+#include <machine/trap.h>
 #define PC_sig(context)       _UC_MACHINE_PC(context)
 #define TRAP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__OpenBSD__)
+#include <machine/trap.h>
 #define PC_sig(context)       ((context)->sc_rip)
 #define TRAP_sig(context)     ((context)->sc_trapno)
 #define ERROR_sig(context)    ((context)->sc_err)
 #define MASK_sig(context)     ((context)->sc_mask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
+#include <machine/trap.h>
 
 #define PC_sig(context)  (*((unsigned long *)&(context)->uc_mcontext.mc_rip))
 #define TRAP_sig(context)     ((context)->uc_mcontext.mc_trapno)
 #define ERROR_sig(context)    ((context)->uc_mcontext.mc_err)
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #else
 #define PC_sig(context)       ((context)->uc_mcontext.gregs[REG_RIP])
 #define TRAP_sig(context)     ((context)->uc_mcontext.gregs[REG_TRAPNO])
 #define ERROR_sig(context)    ((context)->uc_mcontext.gregs[REG_ERR])
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       0xe
 #endif
 
 int cpu_signal_handler(int host_signum, void *pinfo,
@@ -346,7 +361,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     pc = PC_sig(uc);
     return handle_cpu_signal(pc, info,
-                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
-- 
2.25.1


