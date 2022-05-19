Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA152D5A3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:10:25 +0200 (CEST)
Received: from localhost ([::1]:54708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgr9-00080Q-U0
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrggf-0002Ef-7b; Thu, 19 May 2022 09:59:33 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrggd-0001a5-HH; Thu, 19 May 2022 09:59:32 -0400
Received: by mail-pg1-x536.google.com with SMTP id a9so3129080pgv.12;
 Thu, 19 May 2022 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tpp5suq5uU4fzLqfyCHy/fMAmZc5HnMOxanR9yNsa3I=;
 b=VZzb4DPtJxgBUL6hhio22QPzsivDJvQyWCyDjvXAyMKHg+/9CTey7YUpaAVaDQhryu
 Jq+yYwMUKqbrawKC3Db5lRCrz/UR0N9OSr+umPcIM/LmiPsS7iRIpVuGFhxLDipmnkvI
 BoVg1PAXhXlEIssF4QPsym2YRJFIFaWm3mJE62y8o5zpdsOSdCXjZ7acLSfqNM+37PQI
 QrPKeDz8iZoq3deKUy8QHS7EOA3APi061/JoFwdxyNsZEEUQ2IQSTjInGRWsenh2cAun
 AaZK2RjdZD+j6uVtmGCvEdo069zgSd4iGu6dhi+cc3jn8gxwSUvu3e41yfv7KvQ8THdZ
 Orvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tpp5suq5uU4fzLqfyCHy/fMAmZc5HnMOxanR9yNsa3I=;
 b=pmP4k5YBeRIi2YrMQbLtdEb4R0w0IfaxOLcY7+JvgBnzYqNp30oHWVGnnVOwYZTAr4
 cmSWKEiyNyuoLGdUCMbexlrsxet4a4FLJDMsCQbCel1RFV0yYfNLd1YvzhW/X9FDfaNo
 IZRiSVjfsM/+vvdxrDGLxRi1Bl0v0bmeS3Pror6btSNs2hvkYMJhbpdiWaDgqcULi/Xn
 Qe70bsxxW16a0U8scfCrxNyp1uQU5tA1L7haWNT68kEyk1QRh5Lmr6yaMqZmSjmos6q+
 Ovkh1f1L4BVPTTdViiTw5uN1IOFAEc/nuwoZLnA2e7SArJWSgz3lue9egWemZLga7ALG
 7xRA==
X-Gm-Message-State: AOAM532/NY+va020s/4z6Lyf87LtrNDRooRbE/fuN1LIscWoDQH4f+xH
 miwNUlgdeaTelFfwH+1TaWr3SegxeBRh8w==
X-Google-Smtp-Source: ABdhPJyKIv7hmuN9Qw03H00/5nqo2bif2k/Z1hK21XsArNMtIADBB/9Ba1yDiyl0uxEC6c0D7V0mdg==
X-Received: by 2002:a05:6a00:18a4:b0:50d:f418:b982 with SMTP id
 x36-20020a056a0018a400b0050df418b982mr5035104pfh.49.1652968769622; 
 Thu, 19 May 2022 06:59:29 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.131.68])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090b078800b001d9927ef1desm5603817pjz.34.2022.05.19.06.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:59:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 4/4] target/ppc: Implement lwsync with weaker memory ordering
Date: Thu, 19 May 2022 23:59:08 +1000
Message-Id: <20220519135908.21282-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519135908.21282-1-npiggin@gmail.com>
References: <20220519135908.21282-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x536.google.com
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
index 48596cfb25..b9b2536394 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2271,6 +2271,8 @@ enum {
     PPC2_ISA300        = 0x0000000000080000ULL,
     /* POWER ISA 3.1                                                         */
     PPC2_ISA310        = 0x0000000000100000ULL,
+    /*   lwsync instruction                                                  */
+    PPC2_MEM_LWSYNC    = 0x0000000000200000ULL,
 
 #define PPC_TCG_INSNS2 (PPC2_BOOKE206 | PPC2_VSX | PPC2_PRCNTL | PPC2_DBRX | \
                         PPC2_ISA205 | PPC2_VSX207 | PPC2_PERM_ISA206 | \
@@ -2279,7 +2281,7 @@ enum {
                         PPC2_BCTAR_ISA207 | PPC2_LSQ_ISA207 | \
                         PPC2_ALTIVEC_207 | PPC2_ISA207S | PPC2_DFP | \
                         PPC2_FP_CVT_S64 | PPC2_TM | PPC2_PM_ISA206 | \
-                        PPC2_ISA300 | PPC2_ISA310)
+                        PPC2_ISA300 | PPC2_ISA310 | PPC2_MEM_LWSYNC)
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 527ad40fcb..0f891afa04 100644
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
@@ -5985,7 +5985,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
                         PPC2_PERM_ISA206 | PPC2_DIVE_ISA206 |
                         PPC2_ATOMIC_ISA206 | PPC2_FP_CVT_ISA206 |
                         PPC2_FP_TST_ISA206 | PPC2_FP_CVT_S64 |
-                        PPC2_PM_ISA206;
+                        PPC2_PM_ISA206 | PPC2_MEM_LWSYNC;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_VR) |
                     (1ull << MSR_VSX) |
@@ -6159,7 +6159,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_PM_ISA206;
+                        PPC2_TM | PPC2_PM_ISA206 | PPC2_MEM_LWSYNC;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6379,7 +6379,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                         PPC2_FP_TST_ISA206 | PPC2_BCTAR_ISA207 |
                         PPC2_LSQ_ISA207 | PPC2_ALTIVEC_207 |
                         PPC2_ISA205 | PPC2_ISA207S | PPC2_FP_CVT_S64 |
-                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL;
+                        PPC2_TM | PPC2_ISA300 | PPC2_PRCNTL | PPC2_MEM_LWSYNC;
     pcc->msr_mask = (1ull << MSR_SF) |
                     (1ull << MSR_HV) |
                     (1ull << MSR_TM) |
@@ -6596,7 +6596,8 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
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
index 7104a5c67e..a7d9036c09 100644
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
index eb42f7e459..1d6daa4608 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4041,8 +4041,13 @@ static void gen_stqcx_(DisasContext *ctx)
 /* sync */
 static void gen_sync(DisasContext *ctx)
 {
+    TCGBar bar = TCG_MO_ALL;
     uint32_t l = (ctx->opcode >> 21) & 3;
 
+    if ((l == 1) && (ctx->insns_flags2 & PPC2_MEM_LWSYNC)) {
+        bar = TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_ST;
+    }
+
     /*
      * We may need to check for a pending TLB flush.
      *
@@ -4054,7 +4059,8 @@ static void gen_sync(DisasContext *ctx)
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


