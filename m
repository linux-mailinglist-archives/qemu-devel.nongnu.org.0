Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA4B36DE36
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:25:36 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnwN-0006jZ-OB
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndE-0000PI-NS
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:48 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndD-0006Li-7H
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h4so54793113wrt.12
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7OS6JG9BL3+LnpLCM/Z0MR7VlobeUEBPsxpBEJslEbA=;
 b=i0M8/cDwR59x500XlqqbXm/fDCJJXLwyw7qcQR4qYH+qS9TWIuLe6ddSSp4TOeBqBR
 f93VWlsykeXhH+aYqND9xOq88SaVHYSuOjJfJhR0Um3lyHSzkl5rxCf3ZvgU1jUORKZd
 3kcPa55ljxBz0gE5wenShWWpiwTveBrJj+cv5mIPMJ4lC9Jt3onWP8s8D4amN4mwo26K
 fAdYrgwvJLE1eF1uStXdSKPiDZBCM/xMJn2sG05aaj4Jkr+JjeZd7IBSMqtzP08vwNBy
 lorCHL/M9n+NKkk+CqMF3FBQc1jGXz58iIB8H1Ngp/g+GepE+LZiBsLKQaa4mj20eQxp
 1f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7OS6JG9BL3+LnpLCM/Z0MR7VlobeUEBPsxpBEJslEbA=;
 b=i6w8QTWalQisvzjQ1I/h/FeMMWqKqWHLFF2qr1n26su6vfcyADb/ycjBX3thCR2HV1
 dDxL8/0ygA2WEZfvlDMlZhLyhbj3B7XOYhkss7U+oHtdbrtEG/iQ8mVFbJHYH/CQt+eD
 wfWfjvvC475/7wrNF/UATo3jWHcw0jCEQk56m7BGR/j9xHv5IetlM97c/oSbqnoATAoW
 XblJdQ3/k0Dtud5/NdFNH+bV32nN9n3VvBH5RKIBSxjiiroCVFdd0IgHoAh5RgjC4Nas
 /Vu5KvI10UeGAmlJ8HruTT1OMTlhKOhx7JryPKbtw6ZOQb+kHErtOAYIEat2YPumyJQU
 fpEQ==
X-Gm-Message-State: AOAM532FRYEmhy5J2PA1VXs3GeJUoPLK0fLc/fTVzRynaDhRSF4zmI97
 85fQayV51vmo+JJBA0/rM/zUCErfo3JNBw==
X-Google-Smtp-Source: ABdhPJwCKKP04wpsCRscD1BqWoRrZbSQnXQdMVgtt5BRv7r00fKJ6uqE68JbYoszCcPkPZLNtLz6Vg==
X-Received: by 2002:adf:9245:: with SMTP id 63mr35960296wrj.324.1619629545517; 
 Wed, 28 Apr 2021 10:05:45 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t20sm6774853wmi.35.2021.04.28.10.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/30] target/mips: Add simple user-mode mips_cpu_tlb_fill()
Date: Wed, 28 Apr 2021 19:03:54 +0200
Message-Id: <20210428170410.479308-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


