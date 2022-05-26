Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D73535608
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:14:01 +0200 (CEST)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLk1-0005Ld-3j
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCs-0002NM-Pm; Thu, 26 May 2022 17:39:47 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCq-0008FY-RA; Thu, 26 May 2022 17:39:46 -0400
Received: by mail-oi1-x22c.google.com with SMTP id m125so3649383oia.6;
 Thu, 26 May 2022 14:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3gK8LwQ/NDj2zBjYqQ45BcWBXt36s/G327UQSxUznB8=;
 b=gdEAEIHQlEpkIUIYhpF79k401RtuByrvwDiA/3colhI/BPEYbEaa8eWG3mgNTHhNuN
 46yBHz1q8z/XL+4TQO5jBZCdP/a+LUIl0AnyUYxp2k9JbHs39rD4oP5llgnCCHPzN7bT
 h1G5nnLRWnpOzw0ciLfyKIy1fbK2ZetzO49YiN+Tg/gCOUDrsAYy0PjN6TmNdr0inqIM
 BHlJCGf3tD34ml2XSIiUYIJ4WrzaBhk8ioAOlcRuwgUGCe4/tXr3ZGDGd5c4KxX7igqr
 cbQjNKJQQywGWj4EKZad08yijXbpPsGeDlN2mLGKCqEZntaweUnOnpHWGmCcu9wWtWew
 yanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gK8LwQ/NDj2zBjYqQ45BcWBXt36s/G327UQSxUznB8=;
 b=3mIifdYde3hcUR6k48XFDiQgVp09ez8WY1umIpWKBRxE1s22mAtiILeQOA6DfJ31aQ
 cTGyiFTD6VuJsYYXypM1wy3CEySYyoKzWIy34NZKMyiSi090pBlryxRj/TCoggbK2D0U
 CQQD3Oa3dqt4McJfpdWy8FVeuXaMZ40sH2ZEteoctbIuqr2ds7QLrRIHEO74Lr5hCxLV
 JWYwGM4LyVc7eoNRFTzD9uuTXGSlt6ppuoUzBGHYP4S4h5l0A2b/4zMeM3pS8epobBCr
 u8hXNqtVfRbFtNxJW4h+XMv6plGKIerq2PbpHivjkcreWRtGyWT85e1IDOTm67kcSXp8
 JSSA==
X-Gm-Message-State: AOAM533iz1KUJBCEiLPf9Wh5au3VldOlXnWpuIlTBAKvyTJGElNtycl+
 eVWkwkX7/ZjHhL3B6yt258wFvoyHYfQ=
X-Google-Smtp-Source: ABdhPJya/0WlnwphlUDAl8/+um0eczcKCS7/RfP8mnZ6BBYM33mqK7e6J7tRserxJmiLeD7ANqbPag==
X-Received: by 2002:a05:6808:118b:b0:2cf:761c:184d with SMTP id
 j11-20020a056808118b00b002cf761c184dmr2233585oil.87.1653601183365; 
 Thu, 26 May 2022 14:39:43 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Nicholas Piggin <npiggin@gmail.com>
Subject: [PULL 26/34] target/ppc: Implement lwsync with weaker memory ordering
Date: Thu, 26 May 2022 18:38:07 -0300
Message-Id: <20220526213815.92701-27-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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

From: Nicholas Piggin <npiggin@gmail.com>

This allows an x86 host to no-op lwsyncs, and ppc host can use lwsync
rather than sync.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220519135908.21282-5-npiggin@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h       |  4 +++-
 target/ppc/cpu_init.c  | 13 +++++++------
 target/ppc/machine.c   |  3 ++-
 target/ppc/translate.c |  8 +++++++-
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 901ded79e9..bf8f8aad2c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2273,6 +2273,8 @@ enum {
     PPC2_ISA300        = 0x0000000000080000ULL,
     /* POWER ISA 3.1                                                         */
     PPC2_ISA310        = 0x0000000000100000ULL,
+    /*   lwsync instruction                                                  */
+    PPC2_MEM_LWSYNC    = 0x0000000000200000ULL,
 
 #define PPC_TCG_INSNS2 (PPC2_BOOKE206 | PPC2_VSX | PPC2_PRCNTL | PPC2_DBRX | \
                         PPC2_ISA205 | PPC2_VSX207 | PPC2_PERM_ISA206 | \
@@ -2281,7 +2283,7 @@ enum {
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
2.36.1


