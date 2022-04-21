Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F250A499
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:46:00 +0200 (CEST)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ0J-0001mt-92
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZM-0007LJ-CK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:08 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZJ-0006Hi-U9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:08 -0400
Received: by mail-pj1-x1029.google.com with SMTP id bx5so5229930pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=stZs9CHJn94yh2l+cnWESSw+xIK34yKkeqdg+D+eDiQ=;
 b=zC+EODet26SXMUe6YWR8YKjkf8O7WDzDsKfccg/42M+4mrQgnVd277H8si3h48i0IT
 pjaX/AbVqZuPORw1r6WdrdGFpBMoN0dcmTuDYC+sFwsi4AVu4XPMzVp+2ljH3TSPvJLz
 G97x9bEfUnh0Wgk+86I1MHENy2/B1NkTz/hIECqy6DutOqUkGbA/flnKsZ0INFgO8JZz
 rSVuHM033wr/jE67NZE6hTRPQOO/UdV+fJvtDOrxT1WnHttHP6Tzum6tNTftFS99uMRF
 nPIqt0EfYPNrkFkwFVLJo1FmFeqAUw/sApPUfWf3ozN/ZV7ntoqX76/LmSY9jusFi9+Q
 k8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=stZs9CHJn94yh2l+cnWESSw+xIK34yKkeqdg+D+eDiQ=;
 b=gw5gMIdP7NuAXTPk8yyYsRirBlegljLF5DsCxLirE2wS5u414OP703JcwADo8NWdWz
 3gBQyD/ZvM2PCZLn2ehUmFx8wjNX/ds+8TdK9rmjVl4um2uBR3+TjCJWDIBxl6iOeK6N
 Gzx4gf199tnic2a52XrLlIJnVEXvb3zl74YLHobljYx5dTx6e1fVXpi18+9wf4emo8Xq
 ejuWEEvSToMYHvYz/KZNNI0g/EIuaB9IQGlzKfh9Zt0YVgYLAQbvEBRMu63DU/CSB7WH
 sh0jr0A7oU1PBFnQXB6erZUNcgRTdNUmixfwnj8Cq2C/6TFZM0NG/AIVZ8QzwQhwvAW5
 hXRA==
X-Gm-Message-State: AOAM530VVAbTDzNAOX4B+NfvQ0Ne4cnb3JUruICesaT4iEGfxS5DBg1v
 QKop14rzfN1pKsso0xSbgnbXf+MGvpF88Q==
X-Google-Smtp-Source: ABdhPJzdZm+kTGVtr7PQQg6+RySc07F1uvWpFsT2NQvNkqJWMfGVFw41pp89adVdIcaPaG7eLuPIUQ==
X-Received: by 2002:a17:902:bb8d:b0:156:51a1:3f5a with SMTP id
 m13-20020a170902bb8d00b0015651a13f5amr26001932pls.65.1650554284631; 
 Thu, 21 Apr 2022 08:18:04 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/64] target/nios2: Split out helper for eret instruction
Date: Thu, 21 Apr 2022 08:16:48 -0700
Message-Id: <20220421151735.31996-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

The implementation of eret will become much more complex
with the introduction of shadow registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
[rth: Split out of a larger patch for shadow register sets.
      Directly exit to the cpu loop from the helper.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.h    |  1 +
 target/nios2/op_helper.c |  9 +++++++++
 target/nios2/translate.c | 10 ++++++----
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index a44ecfdf7a..525b6b685b 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -21,6 +21,7 @@
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
+DEF_HELPER_3(eret, noreturn, env, i32, i32)
 DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
 DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
 DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index caa885f7b4..ee5ad8b23f 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -30,3 +30,12 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
     cs->exception_index = index;
     cpu_loop_exit(cs);
 }
+
+#ifndef CONFIG_USER_ONLY
+void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
+{
+    env->regs[CR_STATUS] = new_status;
+    env->pc = new_pc;
+    cpu_loop_exit(env_cpu(env));
+}
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 226bd9e30b..53699ee088 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -391,10 +391,12 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
         return;
     }
 
-    tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
-    tcg_gen_mov_tl(cpu_pc, cpu_R[R_EA]);
-
-    dc->base.is_jmp = DISAS_JUMP;
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    gen_helper_eret(cpu_env, cpu_R[CR_ESTATUS], cpu_R[R_EA]);
+    dc->base.is_jmp = DISAS_NORETURN;
+#endif
 }
 
 /* PC <- ra */
-- 
2.34.1


