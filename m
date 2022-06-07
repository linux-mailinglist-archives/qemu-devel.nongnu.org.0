Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E9C541632
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:48:00 +0200 (CEST)
Received: from localhost ([::1]:49484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyg7L-0008P3-Ml
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftV-0008Ko-OI
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:41 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftO-0007E1-Dl
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:41 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so16421711pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M1sbAH5tRNSXz726zBKA/xbfSYLMnAozHgakia7Z6MI=;
 b=AB8uvFJvtBQk/PgO6FfArxUDSyHcqMAjV2jXZqWJO+ZlEQFElFqWO7D000kQXfo+lt
 GQFpLyIRc67RAZEWROZ8Y9t+9GxkA3kitSEHtsDxJexOKDqwJI2e8QJkOTrQkhhUyRHJ
 AwDMiS45JyC4Hin+essfF/4LBNkAahGcQf+WAFkE34UisVu2/9NTg4YGNFe8eFFrRpu0
 ALbh7Anld1gYZLgayEhiIL+3dWkuR38gHJmqg34Fz6UlsM3rwDIinBZf/MewaUgPqh6y
 7N3uJZsfg0YFoylG2VfBd2RoDTuJwTf5WLIi7fHGXbVTSKXUyi9MNt8f0tR2KR1FTPd/
 XPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M1sbAH5tRNSXz726zBKA/xbfSYLMnAozHgakia7Z6MI=;
 b=iutuImQ7N7FZ9nlhpAFGRGOcmKgRwMy7hqjK8EosjKaVqCQiU6mvZ3Pk9zRye18KlR
 qxDIrKys0/FFu7iuYxive9df0LOEByrpSXGFFDJP2QAGQDNzg7j4w94t0PytL4CRYo6B
 yuis4tRFn41Lnj/ewo6xSv7q6DCgJbN4HkOv5rDx5SpK70j3LgxD7A+9x37CM5u+80gM
 EAJ/WZfF8x+UG19Rut1Qtxuu7lzKEznDUgJm8Gg1p2B/xBbrxBy+5tttuXtqnZ3bGurS
 Y8uNpldI/0kU4PG4IzpNgZN/ZUYVWPe3TZLAc+TxHKnnnObhGZwYi4b6DGUtzG1pJJr7
 QcLg==
X-Gm-Message-State: AOAM531VWrWNTPavesZ0hrBCU38mcldbKg+0+lfch0e2r4msBMuXly5r
 Ecidd+eTETNhF1byRXGy2UJribBYJIGO0Q==
X-Google-Smtp-Source: ABdhPJywuT4D3m/4DwAb9DmJCD+Ca+X5DXoYUP3exkE2fLl5+WQ/LH3JBKvbhYcx7aqWOPLYe8FAsQ==
X-Received: by 2002:a17:903:283:b0:163:be9d:483a with SMTP id
 j3-20020a170903028300b00163be9d483amr30124663plr.166.1654634013608; 
 Tue, 07 Jun 2022 13:33:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 28/71] target/arm: Add PSTATE.{SM,ZA} to TB flags
Date: Tue,  7 Jun 2022 13:32:23 -0700
Message-Id: <20220607203306.657998-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These are required to determine if various insns
are allowed to issue.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 2 ++
 target/arm/translate.h     | 4 ++++
 target/arm/helper.c        | 4 ++++
 target/arm/translate-a64.c | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2f43b00843..b48a80dab7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3284,6 +3284,8 @@ FIELD(TBFLAG_A64, TCMA, 16, 2)
 FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
 FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
+FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
+FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index a492e4217b..fbd6713572 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -101,6 +101,10 @@ typedef struct DisasContext {
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
index e7e94213b1..bec7e47b78 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13857,6 +13857,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
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
index f51d80d816..fdc035ad9a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14635,6 +14635,8 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->ata = EX_TBFLAG_A64(tb_flags, ATA);
     dc->mte_active[0] = EX_TBFLAG_A64(tb_flags, MTE_ACTIVE);
     dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
+    dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
+    dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.34.1


