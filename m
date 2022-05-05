Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E20751C9BD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:56:57 +0200 (CEST)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhaq-00077v-JP
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZB-0003Sj-2H; Thu, 05 May 2022 14:51:10 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:46072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZ8-0004b2-3Q; Thu, 05 May 2022 14:51:07 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so3501558otq.12; 
 Thu, 05 May 2022 11:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iREEK7YQCVNl6aqmIZD6DiVspuMek65x7eD0wvb4T9M=;
 b=LRE9sFqLnNVdp96wrWyPd/mk58N2drK6Eht6MhUnFc5hFvfattVg0ZhzHnVTG/D7Gn
 JA2j4jih40FX6VxrLEi5PCxMwuz1gtU7Bin5XXGSnha6uyq5s0iLph028exALPEFUuLw
 JuntCu7YW3gwEbwu8SLKn2YJesQw/5SfS9SSxwIR7ClRv4xnisHpEbkDrO0xMTV7YjS5
 3nA6/4zhH7CO0TtyO3mkLISNXpF2XK1O0E4EUh8zewN5dsshEIogDEun2CXuH6E+mO7r
 aTBFQOu3Y5klnLLxVuKVP/FQk6b1kNjpbGGcd+yy2iVm8ZL4DlMWD20vAhg9nT4gkuvU
 +OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iREEK7YQCVNl6aqmIZD6DiVspuMek65x7eD0wvb4T9M=;
 b=GdJ8etTKpXf7bJCXPDFVGXWiLt9/ZHIwLq6GMWaKVguzVTGCBkznNaDx08uVwFDH3X
 tq1kDprURnzBuhJvVO/lD/bXNtH+x4dFYtQsStTjv28UGkWUTqfK7WSSuuj7cRCRujvz
 TPQ5pDD37I858uPl5WNIp2Fhq2IsrcwO068qaRpF0YdDIn/+8gW2JvOw9dVFyF6tENuO
 GbOIid5qmlkSZyoJnwNjXi5U/0Z58N6xvgIPu7rNh4a8YT7SF1BfAmsj5EFyy9zvw/el
 cHrkYBV/gSt6NvMd0Cr8o9G37PPztAOiEvjqBzvt+FK79KFJXJfdyWZGzYZlM2lqC9LK
 wkzw==
X-Gm-Message-State: AOAM533D24BsF6l4OEHTXequaoXJyuR5XJaH0nG7EirLxr5yBacyzdkS
 MRlNWjCWmTYmncmm6X4X1HKGHSazjCA=
X-Google-Smtp-Source: ABdhPJyS4foRERjMlFP587Vi0fjMET3Y3hvaTgmc6J3PKoFkqYC1Qo2Era9YQeVjwc426U33iG6TKA==
X-Received: by 2002:a9d:5e91:0:b0:605:df49:462 with SMTP id
 f17-20020a9d5e91000000b00605df490462mr10180618otl.228.1651776664952; 
 Thu, 05 May 2022 11:51:04 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 19/30] target/ppc: Remove msr_gs macro
Date: Thu,  5 May 2022 15:49:27 -0300
Message-Id: <20220505184938.351866-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

msr_gs macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-12-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         | 2 +-
 target/ppc/helper_regs.c | 2 +-
 target/ppc/mmu_helper.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index deb861f5f3..bd5dffc9b1 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, GS, MSR_GS, 1)
 FIELD(MSR, POW, MSR_POW, 1)
 FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
@@ -479,7 +480,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_hv   (0)
 #endif
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
-#define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 79c0143a7a..4e649d8b0e 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -233,7 +233,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
     }
     if ((env->mmu_model == POWERPC_MMU_BOOKE ||
          env->mmu_model == POWERPC_MMU_BOOKE206) &&
-        ((value >> MSR_GS) & 1) != msr_gs) {
+        ((value ^ env->msr) & R_MSR_GS_MASK)) {
         cpu_interrupt_exittb(cs);
     }
     if (unlikely((env->flags & POWERPC_FLAG_TGPR) &&
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 142a717255..5bb5c71038 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -935,7 +935,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
     }
 
     if (((env->spr[SPR_BOOKE_MAS0] & MAS0_ATSEL) == MAS0_ATSEL_LRAT) &&
-        !msr_gs) {
+        !FIELD_EX64(env->msr, MSR, GS)) {
         /* XXX we don't support direct LRAT setting yet */
         fprintf(stderr, "cpu: don't support LRAT setting yet\n");
         return;
@@ -962,7 +962,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
                                POWERPC_EXCP_INVAL_INVAL, GETPC());
     }
 
-    if (msr_gs) {
+    if (FIELD_EX64(env->msr, MSR, GS)) {
         cpu_abort(env_cpu(env), "missing HV implementation\n");
     }
 
-- 
2.32.0


