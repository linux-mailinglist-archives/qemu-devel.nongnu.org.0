Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96044D4714
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:36:07 +0100 (CET)
Received: from localhost ([::1]:34712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSI1W-0006kD-Kl
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:36:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0p-0002Wo-LO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:23 -0500
Received: from [2607:f8b0:4864:20::1033] (port=56259
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0n-0008TK-LN
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:18 -0500
Received: by mail-pj1-x1033.google.com with SMTP id e3so4819678pjm.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVyC4ASoKbDoWqWtQ6it33/tXOmFXiabY9tyAWzkgHg=;
 b=G8JdJh/mnLXGyv0MmsQUXsBl2mSG8XRFkAfJkovZ7cMY5SO2XK1KepvXOvx/qw6xaV
 H/i1LoUqECvKwAomO8Sq7L5nDRmPYL6AoUeYwwxqAbR4a944LtZZNEA5HCqMJrhVV7TY
 g7l1V22dox1xdc9hgRZYmlwj8ZtlYTc7VFeMrdGV9hKdZOT57yrI4jaCTOV/hk3+WO88
 bFYnBAAFpYvNez9Cb00nUyzjEsArwyOFgEh6cJXfVJRkpZAhBcsQh8sQgvvuuGSJ4mHb
 99vkcEKCNETxJwaNxytiuW1SKTTIkt5rrcMuaymXLYVzw1t22LUGOKBzgQVdi68GAowU
 c4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVyC4ASoKbDoWqWtQ6it33/tXOmFXiabY9tyAWzkgHg=;
 b=mi2Oat6Q7j8o1058hVA5hN5TGcTvkgLnW8dG5zPYyoibB6kgiV2MFE9CItkG9zqPtk
 DYYDHUojEqZhAqjdh8Pett9WM1tLNwJWuN8De+dqPPHEQM9Use8xN7V+9o6VGRBLEjbK
 wCJdtgzpl/gPVklHHFpiPbojJ3y7rrI+7SPcf5yiTEjwaOstmqnhuj5byUZp4hwydSCu
 0oBYHSkVx5OTG73YEv2At1OC2uUKs1SKikyzbraDC1wqMChvNkRsaQUT166BIPn9mrpF
 4oy1hvpDHihUJ7OIyaXg4q/qeaAYjGB2fRbqW071ajQjPmDyXVhka8xL4tgE00M9x6XZ
 cj3g==
X-Gm-Message-State: AOAM53198l37cePNd8L/8s4aFlGdCToBREXV5C48Q8099zaET4Vbl3WB
 d+tidbS1kc+qfCB59eNxOxuEsgSKwJwFHA==
X-Google-Smtp-Source: ABdhPJxe2zcTHqR0bKax9nosSGaydRuKATmH9dyXwsKCVJmkwjP1zDv66n2o/mJyuj7Sy7ZBD0Nf9g==
X-Received: by 2002:a17:90a:a78f:b0:1bc:8042:9330 with SMTP id
 f15-20020a17090aa78f00b001bc80429330mr15339983pjq.229.1646911876397; 
 Thu, 10 Mar 2022 03:31:16 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004f75cf1ab6csm6011246pfv.206.2022.03.10.03.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:31:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 43/48] target/nios2: Update helper_eret for shadow registers
Date: Thu, 10 Mar 2022 03:27:20 -0800
Message-Id: <20220310112725.570053-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When CRS = 0, we restore from estatus; otherwise from sstatus.
Update for the new CRS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/op_helper.c |  3 ++-
 target/nios2/translate.c | 13 ++++++++-----
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 26d4dcfe12..62a73c7b32 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -82,6 +82,7 @@ enum {
     R_FP     = 28,
     R_EA     = 29,
     R_BA     = 30,
+    R_SSTATUS = 30,
     R_RA     = 31,
 };
 
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index e5e70268da..2eac957f68 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -73,7 +73,7 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
     }
 
     /*
-     * Both estatus and bstatus have no constraints on write;
+     * None of estatus, bstatus, or sstatus have constraints on write;
      * do not allow reserved fields in status to be set.
      */
     new_status &= (cpu->cr_state[CR_STATUS].writable |
@@ -81,6 +81,7 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
 
     env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
+    nios2_update_crs(env);
     cpu_loop_exit(cs);
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 2b2f528e00..7a25c864e2 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -435,11 +435,14 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    TCGv tmp = tcg_temp_new();
-    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
-    gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
-    tcg_temp_free(tmp);
-
+    if (dc->crs0) {
+        TCGv tmp = tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
+        gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
+        tcg_temp_free(tmp);
+    } else {
+        gen_helper_eret(cpu_env, load_gpr(dc, R_SSTATUS), load_gpr(dc, R_EA));
+    }
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
-- 
2.25.1


