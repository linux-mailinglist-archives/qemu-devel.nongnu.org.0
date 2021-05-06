Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733AF3759A5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:46:49 +0200 (CEST)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lei5I-00024S-A1
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lehxS-0006Cc-VC
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:38:44 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:42642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lehxO-0006iE-7Y
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:38:42 -0400
Received: by mail-oi1-x232.google.com with SMTP id v24so6213810oiv.9
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 10:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rne3U+/ZLMogLFHepUdp/G8/8NoRBowraqCCuQ7gMMc=;
 b=BE9xUiVoujValPC38rTw3HJ6dx4iRe9H/GFtxLA5vqM0cngHPs1Tx6RDUWy1nfLon/
 kJ0bmwWrwOIrGaDn2ze8MRLiOLVN8PYmI4M8sUsjXKVY4nrezc58NTE9Xr2kkFpFKvF/
 dmMEdQzNbdNIBjmJdUF+q0JbXvvSgL4hYndSRzAWIPNHRJ//31L9AmoNltOms2sr6tBP
 4zHFC2JGD+MufGiA3TaKKGIvRmmJUoFfgDw/EtD0SpquFafyaEHC0TpCP8m53mrozpCI
 K+gKB8gKkxZ6P9a+4LjglsKZRDlQfVbmjuLOh1PuJbU3+fkRGnMqCH/T1iHmg6rbU61f
 VTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rne3U+/ZLMogLFHepUdp/G8/8NoRBowraqCCuQ7gMMc=;
 b=dEXD2Atcg8vf56DAdTpnugFvFZFRA601VwO8QCy2Bit8eJ9m62VEBJ8HZlmvdJpTPc
 3xuSi3TRe57CUrBJuhlhs/vU2Eu2Hv1SkH7W5ltVN7x5ViEQPcyxqfeVEwZ4Zn4RbJiY
 I3lS5UxKmd6zd2R2i2xneUPHnqLva5dsLBZRsIYqO61p5EYAhiflRaYVxra1Xv4qrwTT
 gtgx3WmJ+Wnl5a6SqbpT+0LaE8YVHOS8xIzHeEV5YEjZmdeoYJNPAC0NuT3ijAID0w+o
 YwbgF6Onzfdl0NauunUZ7XiTI8SqDA1yMJ6VRXYy8iDtanY4UHjVluXB/zfUEGP/WONg
 z/kw==
X-Gm-Message-State: AOAM531BxTqbI99ixXZopa3TRppF3zhyZ3fZgqu53YMPuc30/ZAo9ZcY
 Wrj8amaPvOoF2QO4eiHkbvMFITEJAjfeaQ==
X-Google-Smtp-Source: ABdhPJxye0ZUYGSkBFwWeZuP8qhdEz1jyQIbHsczpIXYKGNW4IbzqwMG0ONIhnUrNJd8FEIl84op/Q==
X-Received: by 2002:aca:b807:: with SMTP id i7mr4274340oif.98.1620322716134;
 Thu, 06 May 2021 10:38:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id g6sm179705ooe.1.2021.05.06.10.38.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 May 2021 10:38:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tcg: Use correct trap number for page faults on *BSD
 systems
Date: Thu,  6 May 2021 11:38:26 -0600
Message-Id: <20210506173826.72832-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::232;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Johnston <markj@FreeBSD.org>, Juergen Lock <nox@FreeBSD.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe. 0xe is
used by Linux and represents the intel hardware trap vector. The BSD kernels,
however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14, etc fault
handlers. This is true for i386 and x86_64, though the name of the trap hanlder
can very on the flavor of BSD. As far as I can tell, Linux doesn't provide a
define for this value. Invent a new one (PAGE_FAULT_TRAP) and use it instead to
avoid uglier ifdefs.

Signed-off-by: Mark Johnston <markj@FreeBSD.org>
Signed-off-by: Juergen Lock <nox@FreeBSD.org>
[ Rework to avoid ifdefs and expand it to i386 ]
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 accel/tcg/user-exec.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 0d8cc27b21..959fec1257 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -260,6 +260,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 #define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
 
@@ -267,16 +268,19 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 #define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
 #define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__OpenBSD__)
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
@@ -302,7 +306,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     pc = EIP_sig(uc);
     trapno = TRAP_sig(uc);
     return handle_cpu_signal(pc, info,
-                             trapno == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             trapno == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
@@ -313,11 +318,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 #define TRAP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__OpenBSD__)
 #define PC_sig(context)       ((context)->sc_rip)
 #define TRAP_sig(context)     ((context)->sc_trapno)
 #define ERROR_sig(context)    ((context)->sc_err)
 #define MASK_sig(context)     ((context)->sc_mask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
 
@@ -325,11 +332,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
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
@@ -347,7 +356,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     pc = PC_sig(uc);
     return handle_cpu_signal(pc, info,
-                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
-- 
2.22.1


