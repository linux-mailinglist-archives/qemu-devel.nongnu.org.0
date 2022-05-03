Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B475182B9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 12:55:50 +0200 (CEST)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlqC5-0005Ls-Md
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 06:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nlpqv-00040j-3T; Tue, 03 May 2022 06:33:58 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nlpqt-0003fY-F0; Tue, 03 May 2022 06:33:56 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e5so2617674pgc.5;
 Tue, 03 May 2022 03:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+z+BIR5Fz4MEzbcLcrzqBKYgAkLBehsDf+0ISlNokLo=;
 b=l/HpBbxLG5TpvIaZzXfgYRCLLjmv8xhNJpSKK3xFAxoAPNMuD5ef5cHxkTEXXFqYyR
 WopDWhgcfev1qsT5R3SPlUrsWEz+YhpELNknBFGhKBeR04aR6PC86YGeKncIg4kko2Kc
 V5feH9Zm2H9SPiahH759r0Cp11SfBj+m1kEOMb1X8OEzgZvn5/QMkH6gj81ZP405hYXo
 QlqjTnfBgl7+ON9enXVRN2QeCZqGlHRg6tkoz2ESy4dKhwdM4gE+6vjgayqCTus9CO6A
 K/MjjjKqIEWU0UVbe1mQFiAqtFCeCFeE1yLMuLP8mPDUSK1qeGBz3h28Rxr1HAeo1n5V
 7rFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+z+BIR5Fz4MEzbcLcrzqBKYgAkLBehsDf+0ISlNokLo=;
 b=VHP+zJCZCgNnDgR0XaRPoZYWBpg+u33b2p7yljTm5fCaPf3gSJTyz+rgJRdgg1CCfh
 sUM0N2R6csvKwKV+1zpqE+CgAsf/SZzzGZOwbZflZMesLv1CYjgQmOlWCjK6gXEuG2n8
 FxXLCyYK3Zaqk+a7BCVi14nDwVyoA50mb252gIRt/Dmmmlbf55GeHdbfB0CRrTflVvXt
 zujbLHZjclLHS6NTnWGD0lUX3wza+x/oXYAeBXB01JNi63PYvzwJyCq3UDAaK92PfJCE
 DBlypnqqxddwD0g6lYoWUXWEa230QV6S+iyNi17VTP5CgIa8sqjDvPxD4cgu4nXM1Lmy
 6pbQ==
X-Gm-Message-State: AOAM532whCScLSvuXn3ltVC+nQ2ykRyPzz7GL7VtcaZDrgTNE3v9o4Ye
 PWu6E3SWwvZNmCQ174b75zygaJUXURs2FA==
X-Google-Smtp-Source: ABdhPJyS0eBzOQG9UoP/qvf7ew/IMvnPV/20kWAars2eF4rYCyAzCGurRQxjgo1LhA7OA7ezblko+Q==
X-Received: by 2002:a63:2215:0:b0:3c1:fd25:b6a1 with SMTP id
 i21-20020a632215000000b003c1fd25b6a1mr9383925pgi.406.1651574033321; 
 Tue, 03 May 2022 03:33:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-108-62.tpgi.com.au.
 [193.116.108.62]) by smtp.gmail.com with ESMTPSA id
 x48-20020a056a000bf000b0050dc76281dcsm6056301pfu.182.2022.05.03.03.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 03:33:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 4/4] target/ppc: Implement lwsync with weaker memory
 ordering
Date: Tue,  3 May 2022 20:33:34 +1000
Message-Id: <20220503103334.2046414-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503103334.2046414-1-npiggin@gmail.com>
References: <20220503103334.2046414-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This allows an x86 host to no-op lwsyncs, and ppc host can use lwsync
rather than sync.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/cpu.h       |  4 +++-
 target/ppc/cpu_init.c  | 13 +++++++------
 target/ppc/machine.c   |  3 ++-
 target/ppc/translate.c |  8 +++++++-
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 0b0e9761cd..bf5f226567 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2287,6 +2287,8 @@ enum {
     PPC2_ISA300        = 0x0000000000080000ULL,
     /* POWER ISA 3.1                                                         */
     PPC2_ISA310        = 0x0000000000100000ULL,
+    /*   lwsync instruction                                                  */
+    PPC2_MEM_LWSYNC    = 0x0000000000200000ULL,
 
 #define PPC_TCG_INSNS2 (PPC2_BOOKE206 | PPC2_VSX | PPC2_PRCNTL | PPC2_DBRX | \
                         PPC2_ISA205 | PPC2_VSX207 | PPC2_PERM_ISA206 | \
@@ -2295,7 +2297,7 @@ enum {
                         PPC2_BCTAR_ISA207 | PPC2_LSQ_ISA207 | \
                         PPC2_ALTIVEC_207 | PPC2_ISA207S | PPC2_DFP | \
                         PPC2_FP_CVT_S64 | PPC2_TM | PPC2_PM_ISA206 | \
-                        PPC2_ISA300 | PPC2_ISA310)
+                        PPC2_ISA300 | PPC2_ISA310 | PPC2_MEM_LWSYNC)
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d42e2ba8e0..26d9277ffb 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5769,7 +5769,7 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
                        PPC_64B | PPC_ALTIVEC |
                        PPC_SEGMENT_64B | PPC_SLBI;
-    pcc->insns_flags2 = PPC2_FP_CVT_S64;
+    pcc->insns_flags2 = PPC2_FP_CVT_S64 | PPC2_MEM_LWSYNC;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_VR) |
                     (1ull << MSR_POW) |
@@ -5846,7 +5846,7 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
                        PPC_64B |
                        PPC_POPCNTB |
                        PPC_SEGMENT_64B | PPC_SLBI;
-    pcc->insns_flags2 = PPC2_FP_CVT_S64;
+    pcc->insns_flags2 = PPC2_FP_CVT_S64 | PPC2_MEM_LWSYNC;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_VR) |
                     (1ull << MSR_POW) |
@@ -5984,7 +5984,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
                         PPC2_PERM_ISA206 | PPC2_DIVE_ISA206 |
                         PPC2_ATOMIC_ISA206 | PPC2_FP_CVT_ISA206 |
                         PPC2_FP_TST_ISA206 | PPC2_FP_CVT_S64 |
-                        PPC2_PM_ISA206;
+                        PPC2_PM_ISA206 | PPC2_MEM_LWSYNC;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_VR) |
                     (1ull << MSR_VSX) |
@@ -6157,7 +6157,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_PM_ISA206;
+                        PPC2_TM | PPC2_PM_ISA206 | PPC2_MEM_LWSYNC;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6375,7 +6375,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL;
+                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_MEM_LWSYNC;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6590,7 +6590,8 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_ISA310;
+                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_ISA310 |
+                        PPC2_MEM_LWSYNC;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index e673944597..33b3d6cf30 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -157,7 +157,8 @@ static int cpu_pre_save(void *opaque)
         | PPC2_ATOMIC_ISA206 | PPC2_FP_CVT_ISA206
         | PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207
         | PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207
-        | PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 | PPC2_TM;
+        | PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 | PPC2_TM
+        | PPC2_MEM_LWSYNC;
 
     env->spr[SPR_LR] = env->lr;
     env->spr[SPR_CTR] = env->ctr;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index abb8807180..76691cf082 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4040,8 +4040,13 @@ static void gen_stqcx_(DisasContext *ctx)
 /* sync */
 static void gen_sync(DisasContext *ctx)
 {
+    TCGBar bar = TCG_MO_ALL;
     uint32_t l = (ctx->opcode >> 21) & 3;
 
+    if ((l == 1) && (ctx->insns_flags2 & PPC2_MEM_LWSYNC)) {
+        bar = PPC_LWSYNC_MO;
+    }
+
     /*
      * We may need to check for a pending TLB flush.
      *
@@ -4053,7 +4058,8 @@ static void gen_sync(DisasContext *ctx)
     if (((l == 2) || !(ctx->insns_flags & PPC_64B)) && !ctx->pr) {
         gen_check_tlb_flush(ctx, true);
     }
-    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+
+    tcg_gen_mb(bar | TCG_BAR_SC);
 }
 
 /* wait */
-- 
2.35.1


