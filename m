Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55556460C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:56:24 +0200 (CEST)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vOw-0004b0-9T
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvX-0000OQ-3m
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:59 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvV-0005vK-JM
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:58 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d17so6334413pfq.9
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ksx6W4Sx5o5nja+lkexLW8pvcoLuTT+mih01KAHBd4Q=;
 b=wZ7H3pKQ/D78ehF7aylWWstzzV32gIJ2gK8GHhapNKohJYPONVymz6znV44EziPDzu
 SmSgpDKKat+ZlvuRfjwhVcIBlEg3tmyetD5HVUWn7ViZLGuDUH7ViQGf7LULryw8dpxZ
 q6bmo2REXia8rmTgenmIk+qsw4XtPuib+Td+uo9M8lnje23mUzhQrbLQKPyY2rodlgZw
 aPf1LpFHkGBow+45JVAAnHCsE6V53ZMazDO4Srh8lB9RdyzhKXMJPBwFmnkOZx/15Pc6
 la78QAPfSBJzPn0l4ozA2tDWUH6uRD44LQZYl8Qsh/Biv+MnZG6LvKLebx0Ja3Ltq8b+
 /YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ksx6W4Sx5o5nja+lkexLW8pvcoLuTT+mih01KAHBd4Q=;
 b=TpfSlrIAc7k0VSg9vgxQ1vKem9kABOF8Q5j1gUcb55SZJtqvtosEvf6JOHy57ZxgeQ
 KxpiLnZyf1j6b2DoL4VM5QKMlCPumeT90WvcTbWUYD7ck6bHGfJMgBfOjtNBamAVtkBc
 adWQ9Mg6+f5CliqPN38MkKXjRHwiMsQBtBf2NH1DJiaJRhseQ7g86SUnU557DxKhqOck
 QZEebMDzQSu+8cDSPAQNHz4viO3vUdR7QmdUU/B2GKzAEej3JGVNUZpi9+MqF4BXlB7B
 m/cIL1LOmBNcU/EWt/BxhQ1GXKwHVgCwZenu7NDDO2Ks6976a3P5BB+jVs1AlnKcZUlg
 Q4ww==
X-Gm-Message-State: AJIora8lQwi1Bup+UBEJx/gSkYLSGIdbk1QyeGmouCssJ0d4RgBxEryC
 kO1yGWcNO7oeVUlTG6r4e8F+YjIi45SdOoLa
X-Google-Smtp-Source: AGRyM1u4xS+4CMPMx7Y5CNeg2lQ6K7JV2XlBi+B0zmIMnb8/kJlvpu+XRBo6+y8fYLCd93R9g1qMSw==
X-Received: by 2002:a63:224f:0:b0:412:12cc:1960 with SMTP id
 t15-20020a63224f000000b0041212cc1960mr4500469pgm.348.1656836756742; 
 Sun, 03 Jul 2022 01:25:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 30/62] target/arm: Add TBFLAG_M32.SECURE
Date: Sun,  3 Jul 2022 13:53:47 +0530
Message-Id: <20220703082419.770989-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Remove the use of regime_is_secure from arm_tr_init_disas_context.
Instead, provide the value of v8m_secure directly from tb_flags.
Rather than use regime_is_secure, use the env->v7m.secure directly,
as per arm_mmu_idx_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 2 ++
 target/arm/helper.c    | 4 ++++
 target/arm/translate.c | 3 +--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4a41b5dcef..919e7c27a3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3162,6 +3162,8 @@ FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 3, 1)     /* Not cached. */
 FIELD(TBFLAG_M32, FPCCR_S_WRONG, 4, 1)          /* Not cached. */
 /* Set if MVE insns are definitely not predicated by VPR or LTPSIZE */
 FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
+/* Set if in secure mode */
+FIELD(TBFLAG_M32, SECURE, 6, 1)
 
 /*
  * Bit usage when in AArch64 state
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fb13e0f4c0..0908c20215 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11281,6 +11281,10 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
         DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
+        DP_TBFLAG_M32(flags, SECURE, 1);
+    }
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6617de775f..540ce84d95 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9359,8 +9359,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->vfp_enabled = 1;
         dc->be_data = MO_TE;
         dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
-        dc->v8m_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-            regime_is_secure(env, dc->mmu_idx);
+        dc->v8m_secure = EX_TBFLAG_M32(tb_flags, SECURE);
         dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);
         dc->v8m_fpccr_s_wrong = EX_TBFLAG_M32(tb_flags, FPCCR_S_WRONG);
         dc->v7m_new_fp_ctxt_needed =
-- 
2.34.1


