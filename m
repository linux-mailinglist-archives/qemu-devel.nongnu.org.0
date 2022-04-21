Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F9C50A502
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:07:22 +0200 (CEST)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZKz-0000Ns-5G
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd8-0005iL-Pz
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:07 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd7-00079c-6O
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:22:02 -0400
Received: by mail-il1-x131.google.com with SMTP id d4so3252221iln.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=McaygJMouDzWBJn6CkHLQqjRYeidbiNno6j41gqLVPI=;
 b=pD4YwCUNwDWqISSeKEJXxGtRVyG8ipjfVEhxHkO5WMM2DUAVzrPtCtqn2vLaRw48ZC
 w9pAuCyt53mEHxDw68yl4CllObBaI+Vo5HkP8TP2+36EtgbMjEJ4gkzkw2bwM1k1G1rv
 9lQLrIJKXC3bTj3uOfynNXkQR7MoeJi4ZPOfhRZK3/R6BT1X0f1gAR5YTq9iTVkUo7rZ
 H0UrhEMPZeE5BX8HBobZ253gDDr4IIUmkugIZ4kyHCyrdZg3/4ZdSDtm/dr6H6sJ9QNz
 PS/x+7Dc4kt0+bEIPI9yhgt87vJAtc+NmXNnUKZ80NyBqlBcK3vy3nZpNp4xLUrX6nTi
 1erQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=McaygJMouDzWBJn6CkHLQqjRYeidbiNno6j41gqLVPI=;
 b=Z7o5NphDHMrmZAIla9LFFjmyASkURKNmosgtilz0aPPb7k+2rkRaixa+zWaGg8TC8D
 NN6BMqgX1jEACclqBILtoqunfy6QLRY2Qs1F+Mft336om4iPDEj4tipRncGqqb8iunqn
 QB8yg6qx61tlvFNyjE9vZ+FPnn2A+9cACCd0J+K4n0syLSQR4qjx42eOwK16RZkb9CcA
 /3syWeUTykphq2W/SyDijpghQl9JKPT+OfPilYYPbJ4jsWHCnmzrpEt01Cen7tuUy4Tm
 KBN2svZQDuZWeynuyEdJ2o+Bpsk9I2e+hkafoAtwmjT4EYrMllM+EnvKR6zgcYrzp60q
 lQ7A==
X-Gm-Message-State: AOAM530AYlvf2KzP1of2BXmANG6Ye6TpYJJTXN81iA1o/hyFmBq6yBu4
 TdPs+1da9UPTjqjvayyh0ODp+hgxt7HWkw==
X-Google-Smtp-Source: ABdhPJynTgyo7nbjFXyTwkmi+4sOpkSS6rXYmQL18nX7AWGFGD2rD3ZhHs40KXBdlAJKraD/MtvOsg==
X-Received: by 2002:a05:6e02:1348:b0:2ca:b398:1144 with SMTP id
 k8-20020a056e02134800b002cab3981144mr77383ilr.163.1650554520189; 
 Thu, 21 Apr 2022 08:22:00 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 55/64] target/nios2: Update helper_eret for shadow registers
Date: Thu, 21 Apr 2022 08:17:26 -0700
Message-Id: <20220421151735.31996-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When CRS = 0, we restore from estatus; otherwise from sstatus.
Update for the new CRS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h       |  1 +
 target/nios2/op_helper.c | 10 +++++++---
 target/nios2/translate.c | 13 ++++++++-----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index d4d97a159e..c2fedead54 100644
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
index a3164f5356..94040102f4 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -73,14 +73,18 @@ void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
     }
 
     /*
-     * Both estatus and bstatus have no constraints on write;
+     * None of estatus, bstatus, or sstatus have constraints on write;
      * do not allow reserved fields in status to be set.
-     * TODO: more than this is required for shadow registers.
+     * When shadow registers are enabled, eret *does* restore CRS.
+     * Rather than testing eic_present to decide, mask CRS out of
+     * the set of readonly fields.
      */
-    new_status &= cpu->cr_state[CR_STATUS].writable;
+    new_status &= cpu->cr_state[CR_STATUS].writable |
+                  (cpu->cr_state[CR_STATUS].readonly & R_CR_STATUS_CRS_MASK);
 
     env->ctrl[CR_STATUS] = new_status;
     env->pc = new_pc;
+    nios2_update_crs(env);
     cpu_loop_exit(cs);
 }
 
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index fdcc2154f2..29cb610aca 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -491,11 +491,14 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    TCGv tmp = tcg_temp_new();
-    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
-    gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
-    tcg_temp_free(tmp);
-
+    if (FIELD_EX32(dc->tb_flags, TBFLAGS, CRS0)) {
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
2.34.1


