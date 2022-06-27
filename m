Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD5B55B92C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:37:09 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5m7A-00012U-Od
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltK-0002Jc-6s
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltH-0004st-SM
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id i1so7844312wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5wziFx4VrUkDL3R6unNxwrzbYVixhlidQEgVavCRMsE=;
 b=n/J6yPinG1LqfWCQtbOnNPM/nUCvRgKDHEm2ii0BHR45ChdudLgloKFUSxeF8Cwjsj
 0H4yhQHPj8tg6/7+UE8/LnZFXkeOJVodu+bCAMKhPDDGDN9rd7B7D+vNqXKHwpH440zN
 XHeSyWvz0O34H0uQWePQ4H66BK6yUGoP9bKwO8szcGQcU5QUGWJDyup+DZT09vyrhxFJ
 FzieaupHyItmCoCvBonGJh5io8BzEC9PlRRF4z0nFCBJyb0Z0k5mvw6pl4dPyP0HfDYV
 CVGgz1rQx70wLB4I1WKyokfvTBHjbLkG6KVNchRPXT7oCvbz1TPARaJC9wHM9a7D78Cd
 VGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wziFx4VrUkDL3R6unNxwrzbYVixhlidQEgVavCRMsE=;
 b=aqgKeAb578YE1XAKooCZOouHv66SWWCwkugf3iwdFm93a0nvHiSTU61JUvEE793IBO
 tvhGjseNeeZcoz/Lt/UdhAKgoaFrFW3CX3JoALojswPC/Au7ko4jnnvEV46nDZRtH7Dj
 qPophT33F4ZGLgEu2qFeTON0mjRBxW/tWy+1Dz469eaZEY7ltnYDsDUytV74C5seRK6w
 aCjOr+txre+98BAj5WtT/ARKgcbIp5kV9KuN6l3P1bohcXrtIB5MXDvKxL3mLe9zZzLk
 fknAqrgqV2EVdiOLBeyzwwWYr5itHBqAbXbZf6tX9j5JsTAo4XGAlFTw5JXg2MzXBf/2
 Jn8w==
X-Gm-Message-State: AJIora/kf/vV8EQyPQLGQVhqlqEkivagqdOULNCElfW7hpmHbdjaCD6k
 sBnS6pJq6ndsa7PF4VmvPDvpyQN9ikOOSw==
X-Google-Smtp-Source: AGRyM1uyeYLxJZlCB65Cuua+befZvH/lqQhQiTOpoZyp+MBzRs7CUXXW6Jp+8I7i240IwZ/LwJM/iQ==
X-Received: by 2002:adf:f245:0:b0:21b:c705:8b1 with SMTP id
 b5-20020adff245000000b0021bc70508b1mr6764332wrp.282.1656325366522; 
 Mon, 27 Jun 2022 03:22:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/25] target/arm: Add PSTATE.{SM,ZA} to TB flags
Date: Mon, 27 Jun 2022 11:22:22 +0100
Message-Id: <20220627102236.3097629-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

These are required to determine if various insns
are allowed to issue.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 2 ++
 target/arm/translate.h     | 4 ++++
 target/arm/helper.c        | 4 ++++
 target/arm/translate-a64.c | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dec52c6c3b9..05d369e690a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3160,6 +3160,8 @@ FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
+FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
+FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index c88c9533253..93766649f7f 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -97,6 +97,10 @@ typedef struct DisasContext {
     bool align_mem;
     /* True if PSTATE.IL is set */
     bool pstate_il;
+    /* True if PSTATE.SM is set. */
+    bool pstate_sm;
+    /* True if PSTATE.ZA is set. */
+    bool pstate_za;
     /* True if MVE insns are definitely not predicated by VPR or LTPSIZE */
     bool mve_no_pred;
     /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bbd04fbd67b..e06c054c3d7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11335,6 +11335,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
         DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
+        if (FIELD_EX64(env->svcr, SVCR, SM)) {
+            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
+        }
+        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
     }
 
     sctlr = regime_sctlr(env, stage1);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8f609f46b6a..5cf4a283bac 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14630,6 +14630,8 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->ata = EX_TBFLAG_A64(tb_flags, ATA);
     dc->mte_active[0] = EX_TBFLAG_A64(tb_flags, MTE_ACTIVE);
     dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
+    dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
+    dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.25.1


