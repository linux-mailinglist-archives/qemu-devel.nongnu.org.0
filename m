Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A685E59C3C2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:11:43 +0200 (CEST)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQA1d-0008Ga-De
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LX-0007to-9z
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:11 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LO-0000mw-OT
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:10 -0400
Received: by mail-pl1-x636.google.com with SMTP id u22so10221170plq.12
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fkqNnGX/LlEsyEi6tEsb9lBzSUYuvqb6pZAxiEEB13M=;
 b=P6WcUszVwC4wCvwTpred3Wmnnf8VJGGrSF6dmBJLyuFnLSGNA0xZnc5YkW/bvGsdCG
 BMCO6S2oCwuPjciv67c21wBoFpXxjOadqjGO9P1XWE64m0owJwBPRxBv2nDd+JBFZOGs
 o1JM1Mxv3cZdV+6bioIQIYRS7n3MQo3puGWfuGL/hHY+BV3Y47N4eyETg2lJEfmXKga7
 Ms3bGSaPMZ3tn2/Uw7RXb4nh1h8KhJ6NW3uSdvhgPkrjvADSkbGCS9YKIkXoqsWkWPIj
 KhcRpK6PTGJ9B7s4jGdBZcy/4Hc+2ht4LJ3OSV++hzQIU9qAu0cfx0FZGnstZacCBn2a
 bRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fkqNnGX/LlEsyEi6tEsb9lBzSUYuvqb6pZAxiEEB13M=;
 b=ySIkOEbzecfBn86Ap75CZAF26bejaGx7RJM9l2MHS8jTJnjEEB5tzIyzUIaDSKjHSD
 75Y6uOc6FdwcrsOw51yHFwHWo5kKIL+q5x7bKRvgkv1sxKakFlEPQCLqOgVxj2vXI4Id
 MS60t+i7inOjVCwYsjiiF2aze70PnCMpedxFZz+gWyZ8xoSRmVi1Cy6RDjS2AkoKligc
 vw0zWRGO/nk6Xh0m8aB9vvFbvfkrrGvm+wDHtK53vkXUa/y30ls7nJOmXBeNgfW+Po6x
 b7anT6XE5UB89ohz5zpjnZtfF7OkDUctePD7xF9ELxIFxh78G51M+twJdfJmn2SYP9x6
 pszQ==
X-Gm-Message-State: ACgBeo15aFO99zwt31VeiFjzp6GlG58LQGi3znE3fPRK36rRU6Cl1eUL
 kx7//cLKOmt2eCpnOiAmDk+bGq79JT28bw==
X-Google-Smtp-Source: AA6agR7YK15O7gAlGlm04oTL8n6t70wIMmPII6ZFliobhNheaMK3JOZRLGQEi5/ZOf+YDpzDUYl8uw==
X-Received: by 2002:a17:902:f395:b0:172:e677:e35f with SMTP id
 f21-20020a170902f39500b00172e677e35fmr6412077ple.94.1661182081122; 
 Mon, 22 Aug 2022 08:28:01 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 23/66] target/arm: Add TBFLAG_M32.SECURE
Date: Mon, 22 Aug 2022 08:26:58 -0700
Message-Id: <20220822152741.1617527-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
index 5168e3d837..ee94d8e653 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3192,6 +3192,8 @@ FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 3, 1)     /* Not cached. */
 FIELD(TBFLAG_M32, FPCCR_S_WRONG, 4, 1)          /* Not cached. */
 /* Set if MVE insns are definitely not predicated by VPR or LTPSIZE */
 FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
+/* Set if in secure mode */
+FIELD(TBFLAG_M32, SECURE, 6, 1)
 
 /*
  * Bit usage when in AArch64 state
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 68373bc0a9..1fcfc85b76 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10764,6 +10764,10 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
         DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
+        DP_TBFLAG_M32(flags, SECURE, 1);
+    }
+
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ad617b9948..bf30231079 100644
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


