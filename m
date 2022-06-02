Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1028753C0DC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:37:31 +0200 (CEST)
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtRZ-0005kX-4P
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwshB-0005Bs-4M
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh8-0000FO-3c
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so5871690pjb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vIa3IKSRhaxqBOPG/jC3fFgT7YknLf0taajsFi5iMbc=;
 b=CxkQgTgDspiCl6evqzvPC5yvHEv0VHs/h01QaGsfqfhxlD4VVrRyTad1kbeuDLI53m
 9MRIx1YDMIBs6ua6wXZi8TA2e6BdvTYAt1FabKkug8VC1EM8NfHL28F87O64ukcMJ6zw
 cAwWi9e2dAIc7nzazVeDcBzpUZnBAut/OCXES2ewALjVzGIFl3wkLrf3IkK6IlFNRr3w
 wGp21w+bt/2QojUKt0jVYRa3erloOEZujl27LxtX4dU5hyT2gruUo82uyX08ihyO03mq
 gXIjnFrrqWiFmUhz/4WK4hxJw7SUuWwKpDqc2HDNTauMF62oTTLr/M19bI8wS5pzZLw8
 Ywog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vIa3IKSRhaxqBOPG/jC3fFgT7YknLf0taajsFi5iMbc=;
 b=3TQE1Duh/qQe54aX5ePCqtXV2CEeUcCkOJK8b2Snus7ZXC+AkUDcGUYXIgTAy0CYoV
 XrTpLObfenwm+8qpFdk18kEPB559tfETTrA48EsDN3dEEdht+vB8Cs7axUHJPutk8eHw
 41D9pRFYb7GXpT8NVgtWqvFZsDYSRGdvKmiF4TlcjzITgbT9B9SOJqVPn1pO8rhalmsf
 S7iNCqi4ZSRhXmORWTGWcEGRCYco65yNcbeVKaazx56eL/6XSKGXtIAgCVzYaZPfpKp2
 VNKTgNXr7IZC2y7B2PqFAT2WaNSGH8vFPhU8XaJfFFtb8y9ZZwBRDGypV5Ud1VqoFCXl
 KPwg==
X-Gm-Message-State: AOAM530EWrMUZxdWTlbt2vQyFteBy85DzF3c7ws5ABqfbhPJ91tn/abQ
 JfSYyCYm+lq9tZh2M1cfnb0g0EyaUwNnCg==
X-Google-Smtp-Source: ABdhPJxf9x3DC/GAbMPopAD3M7cnSE7Be+7M3wfvDxQel2FJMnufSzY1aof7SPmrRuUJglx/DN8IJQ==
X-Received: by 2002:a17:90b:1d08:b0:1e3:2a4f:6935 with SMTP id
 on8-20020a17090b1d0800b001e32a4f6935mr20021139pjb.174.1654206568670; 
 Thu, 02 Jun 2022 14:49:28 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 39/71] target/arm: Add SVL to TB flags
Date: Thu,  2 Jun 2022 14:48:21 -0700
Message-Id: <20220602214853.496211-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

We need SVL separate from VL for RDSVL at al, as well as
ZA storage loads and stores, which do not require PSTATE.SM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 12 ++++++++++++
 target/arm/translate.h     |  1 +
 target/arm/helper.c        |  8 +++++++-
 target/arm/translate-a64.c |  1 +
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e41a75a3a3..0c32c3afaa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3292,6 +3292,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
 FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
 FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
+FIELD(TBFLAG_A64, SVL, 24, 4)
 
 /*
  * Helpers for using the above.
@@ -3337,6 +3338,17 @@ static inline int sve_vq_cached(CPUARMState *env)
     return EX_TBFLAG_A64(env->hflags, VL) + 1;
 }
 
+/**
+ * sme_vq_cached
+ * @env: the cpu context
+ *
+ * Return the SVL cached within env->hflags, in units of quadwords.
+ */
+static inline int sme_vq_cached(CPUARMState *env)
+{
+    return EX_TBFLAG_A64(env->hflags, SVL) + 1;
+}
+
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/translate.h b/target/arm/translate.h
index fbd6713572..1330281f8b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -44,6 +44,7 @@ typedef struct DisasContext {
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sme_excp_el; /* SME exception EL or 0 if enabled */
     int vl;          /* current vector length in bytes */
+    int svl;         /* current streaming vector length in bytes */
     /* Flag indicating that exceptions from secure mode are routed to EL3. */
     bool secure_routed_to_el3;
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cb78d2354a..c9db12d524 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13874,7 +13874,13 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
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
index 40f2e53983..b1d2840819 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14652,6 +14652,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
+    dc->svl = (EX_TBFLAG_A64(tb_flags, SVL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
-- 
2.34.1


