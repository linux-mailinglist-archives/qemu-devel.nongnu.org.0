Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC0C364AB0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:39:52 +0200 (CEST)
Received: from localhost ([::1]:49480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZkN-0003if-5T
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQp-0007PB-90
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:40 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZQl-0001QA-BH
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:19:36 -0400
Received: by mail-wr1-x434.google.com with SMTP id m9so22428124wrx.3
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7OS6JG9BL3+LnpLCM/Z0MR7VlobeUEBPsxpBEJslEbA=;
 b=uyES6ySc2HcRVFh6U2kXt/V9WNKAAR8pc+c+OF30XeeknGfr7BSHuebRrzcpEHNohh
 Dj6xruh2R0kWVvKAYJdcFFKYZ3jch4ijO2Szp6ReotmOWBk0dbS4s72UfECOU+0qLnVh
 u0NOI4luX97VLX50+MAkgbLVq6M9EVZgSK35b9dHlXKIVumo1Di/DYmFs3U3RxFg3k/a
 FP4f3GYA0vz5Xqpe66B+f+Wigs8xGw3dSdIs485EZsxtEcZecHg8b5GadSOMAt7QUycx
 sEJ2UwNHX6KR8rVsrr5+smWmplNpnfAq1DAgLX9EnJVrx7rgvvdg6SpzhfMAWiVbolHV
 bqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7OS6JG9BL3+LnpLCM/Z0MR7VlobeUEBPsxpBEJslEbA=;
 b=phynp6/nVvlttIwR4nu6MHq8Npsd/ua1vpIWhWbULynr/wF5jb68oEmKPo5r5hU53z
 Wagukrs7mYj320tZT/xgLxj2bIaLXCwM78kfFacngBldrmh5N9G6tsc2K48SP2odYnS+
 yLsxnzMU+csFJuhCEx5uRNJOkQGr+TQKJl7Fm8n+Dm91cL0M8S1fRk6KEax+11gWDNOI
 530MeCcnM0i3R2UBWrI4xVEaa4XvqMznEQ+IiixKK5ZTUNy/oeNd9piKwKrUoW37jjfS
 rAbAiuWE7Wg7zBZO2rrADfAb8cuyxgL+LZrHWCl9ex32uyNEuLylkiAsaQzBa0JKkDyk
 5ibw==
X-Gm-Message-State: AOAM531jpVf1A16VpJ/hnz8YaQ/txAKzhhfBJCK/HSwsTDGdpbeOzGaB
 F0SF79bStoYNN2EO4t7cmrA+yE6//YNbTA==
X-Google-Smtp-Source: ABdhPJzTXwljAEMpX/uUq4buorfznC+YSLNBmBrk2KnnduyMBDEOJzX9XGPSDfNJEH1WKatZLZxszw==
X-Received: by 2002:adf:ce12:: with SMTP id p18mr16218911wrn.144.1618859973870; 
 Mon, 19 Apr 2021 12:19:33 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 18sm527650wmo.47.2021.04.19.12.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:19:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/30] target/mips: Add simple user-mode mips_cpu_tlb_fill()
Date: Mon, 19 Apr 2021 21:18:07 +0200
Message-Id: <20210419191823.1555482-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tlb_helper.c's #ifdef'ry hides a quite simple user-mode
implementation of mips_cpu_tlb_fill().

Copy the user-mode implementation (without #ifdef'ry) to
tcg/user/helper.c and simplify tlb_helper.c's #ifdef'ry.

This will allow us to restrict tlb_helper.c to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/user/tlb_helper.c | 36 +++++++++++++++++++++++++++++++
 target/mips/tlb_helper.c          | 10 ---------
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_helper.c
index 453b9e9b930..b835144b820 100644
--- a/target/mips/tcg/user/tlb_helper.c
+++ b/target/mips/tcg/user/tlb_helper.c
@@ -22,6 +22,42 @@
 #include "exec/exec-all.h"
 #include "internal.h"
 
+static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
+                                MMUAccessType access_type)
+{
+    CPUState *cs = env_cpu(env);
+
+    env->error_code = 0;
+    if (access_type == MMU_INST_FETCH) {
+        env->error_code |= EXCP_INST_NOTAVAIL;
+    }
+
+    /* Reference to kernel address from user mode or supervisor mode */
+    /* Reference to supervisor address from user mode */
+    if (access_type == MMU_DATA_STORE) {
+        cs->exception_index = EXCP_AdES;
+    } else {
+        cs->exception_index = EXCP_AdEL;
+    }
+
+    /* Raise exception */
+    if (!(env->hflags & MIPS_HFLAG_DM)) {
+        env->CP0_BadVAddr = address;
+    }
+}
+
+bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool probe, uintptr_t retaddr)
+{
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+
+    /* data access */
+    raise_mmu_exception(env, address, access_type);
+    do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
+}
+
 void mips_cpu_do_interrupt(CPUState *cs)
 {
     cs->exception_index = EXCP_NONE;
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 78720c4d20a..afc019c80dd 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -403,8 +403,6 @@ void cpu_mips_tlb_flush(CPUMIPSState *env)
     env->tlb->tlb_in_use = env->tlb->nb_tlb;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
                                 MMUAccessType access_type, int tlb_error)
 {
@@ -484,8 +482,6 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
     env->error_code = error_code;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
 hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -833,7 +829,6 @@ refill:
     return true;
 }
 #endif
-#endif /* !CONFIG_USER_ONLY */
 
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
@@ -841,14 +836,11 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
-#if !defined(CONFIG_USER_ONLY)
     hwaddr physical;
     int prot;
-#endif
     int ret = TLBRET_BADADDR;
 
     /* data access */
-#if !defined(CONFIG_USER_ONLY)
     /* XXX: put correct access by using cpu_restore_state() correctly */
     ret = get_physical_address(env, &physical, &prot, address,
                                access_type, mmu_idx);
@@ -896,13 +888,11 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     if (probe) {
         return false;
     }
-#endif
 
     raise_mmu_exception(env, address, access_type, ret);
     do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
 }
 
-#ifndef CONFIG_USER_ONLY
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
                                   MMUAccessType access_type, uintptr_t retaddr)
 {
-- 
2.26.3


