Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45926552371
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:02:45 +0200 (CEST)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LjY-0005FQ-8T
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZu-0005cZ-F3
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:46 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZs-0001NO-Qv
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:46 -0400
Received: by mail-pg1-x52a.google.com with SMTP id a14so1282766pgh.11
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GI+YlDQYkDB/N7mh7auOF6n5z7sxW3awZsRTI+xJ+O8=;
 b=Ui6Jv1VSNxw+TnwLYlwaSuTkhMfo67zUK/R/myq0tuXimgLuLEgDxZ37H3nc/nM9X3
 8eeogw77pGTjhLOuD7gqx1KtB3pePwHaD44qg4m6MdIuN9hUAlepIsEk+Vt6j4p/UhPk
 PccBPij1v5Q3Eg2tzuzQIAINlSFVeg0tXJ4eawbn6nnoGiZaDd76rWq+uFBij7X1dRcP
 glNy7Mk+cW6+OaWAYrHU62KJlSFmqGTu86lvSmP62uM7VD1aBfDLMt3+ioxe8fHFIJks
 kdh08mabEBMn9n6ss/PbcUB2pQm5KgwngI31G+208oKOc+wPhI6se37mKJnEzldEg9f2
 SbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GI+YlDQYkDB/N7mh7auOF6n5z7sxW3awZsRTI+xJ+O8=;
 b=egjX5BMRd7to0MDduaCNVaT2OmLwuFUJ9REcLuBEQnY5+1BPjtMBzd37iJMc3enp1M
 aAKKVObk1LD2PBMAkcCi0NhKd1AtFUqcR295v5IUjv4kkNSsMn8CZqDRwvnzvBFLQZcL
 nxJSRGR0Bg/7aVkNsYONeKlIV0Cxa0XaVYvf40+XPAjz5lkE5+yhBd6zmWkHwYV9Y6kg
 A9s4SIn3Uar6KbcOYWSrorPtUSVtE0EVBMWt1G+/xEzU+gR8A+GKtXKY5zixZEgR3c/x
 N8jmb8b+g8dgO9zVBulzEXEmWbH1cfB3Ims7GJMjc4wPGJkuG6EbhRIvOLgNF8ieo9SA
 DzhQ==
X-Gm-Message-State: AJIora++qlyahUWxEDOz0IV6NtyvsTAOIJt3qtJTsksU7nhmUVtqKQ7w
 3Q0zVPjj1UrtFSeEDbNpPaEUsQsI0O+y+Q==
X-Google-Smtp-Source: AGRyM1tt3F6mcClzIjDh7IMHdKO4A2oef7cUyczI5VABR/JdGdbKZ+7bAd9RyE5y8IIHIfWS7EtqNw==
X-Received: by 2002:a05:6a00:2185:b0:520:7276:6570 with SMTP id
 h5-20020a056a00218500b0052072766570mr25433927pfi.84.1655747563472; 
 Mon, 20 Jun 2022 10:52:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 08/51] target/arm: Add PSTATE.{SM,ZA} to TB flags
Date: Mon, 20 Jun 2022 10:51:52 -0700
Message-Id: <20220620175235.60881-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
index dec52c6c3b..05d369e690 100644
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
index c88c953325..93766649f7 100644
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
index bbd04fbd67..e06c054c3d 100644
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
index 8f609f46b6..5cf4a283ba 100644
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
2.34.1


