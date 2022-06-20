Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897D3552373
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:02:58 +0200 (CEST)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Ljl-00062l-KV
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La6-0006AY-2V
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La2-0001L7-MY
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id k7so10385861plg.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnbi+8HuuZUy/uCkr6x1dYJgpIFmPQ1iR6bOVmgPFo4=;
 b=d4FAUZUp2UWc7a9eqFoPq4a4z48a+oTf7OvUXUdVICpsXMBleM+bi4Zx3Rfyfagse1
 nE95t6SrCLQ05/mhUlt+RI5VDbS6/WLEyTf4TC96WDOsyvkTMwArOWfiQgt0CIVK9F20
 XHbb3KSWm3zLkygiRiV2/enFBecgpBEzEbmeFmezfDyRUKnae/21gF38vTq6Y9dwhp0E
 cQklqNyJJgzdW/eOno/zF8wITcasGU9KNmPSvuADEoHKMKUsoItvrA6btTcI6551b8yk
 xXRNT/B6nZT+p6ksvk51sp4pwsvdOR+auOcGwqOJKupk8ttMGwiWdopp5FHDe6ufen+J
 n+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnbi+8HuuZUy/uCkr6x1dYJgpIFmPQ1iR6bOVmgPFo4=;
 b=qAxRsbSrvkKcfAj/Jz7ges/JuoBXjgP/hyWYT+yyCfP9apPK7Koy8b6RAO4DF0/sjL
 zTWxiQEnzzCn0eG8izo6bWhCH6+MVYC/KOh23cVov2mqGgOV0ucTadnwO5Z1PbgBfbmQ
 /Dz6j3cspBYXpyimcmURd+sYljpAzhUMn2y1PfTTNQ3SwvAcCk/mfuFTSt3pWGeccT5C
 Sik0Si0iWqGAeyc+vaAWuwbbYvQ56GRwL15qIoWd+YW+uU72NYXF4ZWftMFR0wqiqeZ1
 rs9GrL4tx8Go5glNBWiOjvvNMONAcz051RFyhEbuXc/ODuNaxicmMW1jJaLaR36Ub/pv
 0ZXQ==
X-Gm-Message-State: AJIora/jfrl/tnTJba/ChC/TSYL1N+W+BFey0ho2B+Kjjxc9Poi5aenV
 V9EpEbGIbjwyB04+3JuoAxEvmJyQ5T0FoQ==
X-Google-Smtp-Source: AGRyM1ttyIiHpSVgaDaCov3tbWGA90/XXbjhYGY3gKzQ30d4uGHCal8oYs83SN5USQPI6JEccbF6+w==
X-Received: by 2002:a17:90b:3b4c:b0:1e8:5e4d:ed83 with SMTP id
 ot12-20020a17090b3b4c00b001e85e4ded83mr38993945pjb.19.1655747573406; 
 Mon, 20 Jun 2022 10:52:53 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 19/51] target/arm: Add SVL to TB flags
Date: Mon, 20 Jun 2022 10:52:03 -0700
Message-Id: <20220620175235.60881-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

We need SVL separate from VL for RDSVL et al, as well as
ZA storage loads and stores, which do not require PSTATE.SM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 12 ++++++++++++
 target/arm/translate.h     |  1 +
 target/arm/helper.c        |  8 +++++++-
 target/arm/translate-a64.c |  1 +
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 244f8428e9..068877323c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3168,6 +3168,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
 FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
+FIELD(TBFLAG_A64, SVL, 24, 4)
 
 /*
  * Helpers for using the above.
@@ -3213,6 +3214,17 @@ static inline int sve_vq(CPUARMState *env)
     return EX_TBFLAG_A64(env->hflags, VL) + 1;
 }
 
+/**
+ * sme_vq
+ * @env: the cpu context
+ *
+ * Return the SVL cached within env->hflags, in units of quadwords.
+ */
+static inline int sme_vq(CPUARMState *env)
+{
+    return EX_TBFLAG_A64(env->hflags, SVL) + 1;
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 93766649f7..22fd882368 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -44,6 +44,7 @@ typedef struct DisasContext {
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sme_excp_el; /* SME exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
+    int svl;         /* current streaming vector length in bytes */
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
     int vec_len;
     int vec_stride;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2e4e739969..d2886a123a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11352,7 +11352,13 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
-        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+        int sme_el = sme_exception_el(env, el);
+
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
+        if (sme_el == 0) {
+            /* Similarly, do not compute SVL if SME is disabled. */
+            DP_TBFLAG_A64(flags, SVL, sve_vqm1_for_el_sm(env, el, true));
+        }
         if (FIELD_EX64(env->svcr, SVCR, SM)) {
             DP_TBFLAG_A64(flags, PSTATE_SM, 1);
         }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c050ebe005..c86b97b1d4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14647,6 +14647,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
+    dc->svl = (EX_TBFLAG_A64(tb_flags, SVL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
-- 
2.34.1


