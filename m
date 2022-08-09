Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F142E58D225
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 04:52:37 +0200 (CEST)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLFMD-0001Jo-2F
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 22:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLFKb-0006z0-Bk
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 22:50:57 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLFKZ-0001rT-Ht
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 22:50:57 -0400
Received: by mail-pf1-x434.google.com with SMTP id k14so7647260pfh.0
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 19:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fthpOYJLv3rrp4OYuzGxexwLs/3g8fu6HNxkY88KU+g=;
 b=lCXWLFb+SMZF6skT5+YJjzoRNoMAfbxS7iR+9BHt0mp90GRpnjD59BhJpZPFd3Y08y
 ciY3D94ujF/UJB139tjkMuE/4qMrf5ux4vLm9fkZyl9e+gWkWeKnBWcIMTbhzTHQuTy/
 J60eu1FmkH1HIHZmPYvdnNzroiU5y/V5DwwWhrLeVwIzvk9wSCJkZBABzsuBBLOKVK4x
 SOIogC4yHO4X+Ldawq+hE2cPOdv3939YQZF/Kc4gGpKTyC7YhdwOuRnfnKMoroWzh2mp
 QUT4ajJfZ+UitOP0t1WPb8kfemlxWhPmvDn8JrybhxQxY9+tlCWKtXnrCBduoGR2PWrL
 DM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fthpOYJLv3rrp4OYuzGxexwLs/3g8fu6HNxkY88KU+g=;
 b=YJN4aJ7tBsL8JP7tRy3M7n1jm3SBjN2LFcgw1JPPxdei4/efZBMOOrrUO0Nvf1xaS3
 KJ+8WfZD9K64fvzHcZ0Zbx6eyeMvCBMOabyusU1pWh9FJg/yanFAIchugYm3eWjjlbt7
 uiOmcWjmDDz7dJm81MEbXWk9UXvjpWm76joeEkRnQAuIyGqHyPmjyN3UtbNlUcq7PIwD
 j3xHBsiS01isGe4JkaW6z/djN48M+RwoGXbhG7+eNrZqDlwwZ1SP0X68V8EzBX7p/Phy
 WtmGDFSK4wr3CIog93f6ibEd7BKUw5G1f8z6880TaqmZUkbszrL8lUNexVDOudGya3dX
 Iyfw==
X-Gm-Message-State: ACgBeo2LgKoOgs4bOwAXjblvofvuWtWSbNkS7eESY6K9qZDZaFOTz5nc
 dVwDwG/i6c20czxEDKSGol1qTsaZ4980Bw==
X-Google-Smtp-Source: AA6agR5dVxxpANovECwCECSgL6fjg5z7wsyLmBKyQSffMQboah9cESGiixIOkEZtQfPQrnPLfKipOg==
X-Received: by 2002:a05:6a00:1c87:b0:52d:cf00:84de with SMTP id
 y7-20020a056a001c8700b0052dcf0084demr21491261pfw.38.1660013454231; 
 Mon, 08 Aug 2022 19:50:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:8c1b:1e6f:caf3:a217])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902710300b0016be834d54asm1298148pll.306.2022.08.08.19.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 19:50:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Qi Hu <huqi@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>
Subject: [PULL 1/1] target/loongarch: Remove cpu_fcsr0
Date: Mon,  8 Aug 2022 19:50:50 -0700
Message-Id: <20220809025050.781846-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809025050.781846-1-richard.henderson@linaro.org>
References: <20220809025050.781846-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

All of the fpu operations are defined with TCG_CALL_NO_WG, but they
all modify FCSR0.  The most efficient way to fix this is to remove
cpu_fcsr0, and instead use explicit load and store operations for the
two instructions that manipulate that value.

Acked-by: Qi Hu <huqi@loongson.cn>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Reported-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                    |  2 +-
 target/loongarch/fpu_helper.c                |  4 +--
 target/loongarch/translate.c                 |  3 --
 tests/tcg/loongarch64/test_fcsr.c            | 15 +++++++++
 target/loongarch/insn_trans/trans_fmov.c.inc | 33 ++++++++++----------
 tests/tcg/loongarch64/Makefile.target        |  1 +
 6 files changed, 36 insertions(+), 22 deletions(-)
 create mode 100644 tests/tcg/loongarch64/test_fcsr.c

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index cbbe008f32..9c01823a26 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -91,7 +91,7 @@ DEF_HELPER_2(ftint_w_d, i64, env, i64)
 DEF_HELPER_2(frint_s, i64, env, i64)
 DEF_HELPER_2(frint_d, i64, env, i64)
 
-DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_1(set_rounding_mode, TCG_CALL_NO_RWG, void, env)
 
 DEF_HELPER_1(rdtime_d, i64, env)
 
diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index bd76529219..4b9637210a 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -872,8 +872,8 @@ uint64_t helper_ftint_w_d(CPULoongArchState *env, uint64_t fj)
     return fd;
 }
 
-void helper_set_rounding_mode(CPULoongArchState *env, uint32_t fcsr0)
+void helper_set_rounding_mode(CPULoongArchState *env)
 {
-    set_float_rounding_mode(ieee_rm[(fcsr0 >> FCSR0_RM) & 0x3],
+    set_float_rounding_mode(ieee_rm[(env->fcsr0 >> FCSR0_RM) & 0x3],
                             &env->fp_status);
 }
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index c9afd11420..51ba291430 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -22,7 +22,6 @@
 /* Global register indices */
 TCGv cpu_gpr[32], cpu_pc;
 static TCGv cpu_lladdr, cpu_llval;
-TCGv_i32 cpu_fcsr0;
 TCGv_i64 cpu_fpr[32];
 
 #include "exec/gen-icount.h"
@@ -266,8 +265,6 @@ void loongarch_translate_init(void)
     }
 
     cpu_pc = tcg_global_mem_new(cpu_env, offsetof(CPULoongArchState, pc), "pc");
-    cpu_fcsr0 = tcg_global_mem_new_i32(cpu_env,
-                    offsetof(CPULoongArchState, fcsr0), "fcsr0");
     cpu_lladdr = tcg_global_mem_new(cpu_env,
                     offsetof(CPULoongArchState, lladdr), "lladdr");
     cpu_llval = tcg_global_mem_new(cpu_env,
diff --git a/tests/tcg/loongarch64/test_fcsr.c b/tests/tcg/loongarch64/test_fcsr.c
new file mode 100644
index 0000000000..ad3609eb99
--- /dev/null
+++ b/tests/tcg/loongarch64/test_fcsr.c
@@ -0,0 +1,15 @@
+#include <assert.h>
+
+int main()
+{
+    unsigned fcsr;
+
+    asm("movgr2fcsr $r0,$r0\n\t"
+        "movgr2fr.d $f0,$r0\n\t"
+        "fdiv.d     $f0,$f0,$f0\n\t"
+        "movfcsr2gr %0,$r0"
+        : "=r"(fcsr) : : "f0");
+
+    assert(fcsr & (16 << 16)); /* Invalid */
+    return 0;
+}
diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
index 24753d4568..5537e3dd35 100644
--- a/target/loongarch/insn_trans/trans_fmov.c.inc
+++ b/target/loongarch/insn_trans/trans_fmov.c.inc
@@ -60,38 +60,39 @@ static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
     TCGv Rj = gpr_src(ctx, a->rj, EXT_NONE);
 
     if (mask == UINT32_MAX) {
-        tcg_gen_extrl_i64_i32(cpu_fcsr0, Rj);
+        tcg_gen_st32_i64(Rj, cpu_env, offsetof(CPULoongArchState, fcsr0));
     } else {
+        TCGv_i32 fcsr0 = tcg_temp_new_i32();
         TCGv_i32 temp = tcg_temp_new_i32();
 
+        tcg_gen_ld_i32(fcsr0, cpu_env, offsetof(CPULoongArchState, fcsr0));
         tcg_gen_extrl_i64_i32(temp, Rj);
         tcg_gen_andi_i32(temp, temp, mask);
-        tcg_gen_andi_i32(cpu_fcsr0, cpu_fcsr0, ~mask);
-        tcg_gen_or_i32(cpu_fcsr0, cpu_fcsr0, temp);
+        tcg_gen_andi_i32(fcsr0, fcsr0, ~mask);
+        tcg_gen_or_i32(fcsr0, fcsr0, temp);
+        tcg_gen_st_i32(fcsr0, cpu_env, offsetof(CPULoongArchState, fcsr0));
+
         tcg_temp_free_i32(temp);
-
-        /*
-         * Install the new rounding mode to fpu_status, if changed.
-         * Note that FCSR3 is exactly the rounding mode field.
-         */
-        if (mask != FCSR0_M3) {
-            return true;
-        }
+        tcg_temp_free_i32(fcsr0);
     }
-    gen_helper_set_rounding_mode(cpu_env, cpu_fcsr0);
 
+    /*
+     * Install the new rounding mode to fpu_status, if changed.
+     * Note that FCSR3 is exactly the rounding mode field.
+     */
+    if (mask & FCSR0_M3) {
+        gen_helper_set_rounding_mode(cpu_env);
+    }
     return true;
 }
 
 static bool trans_movfcsr2gr(DisasContext *ctx, arg_movfcsr2gr *a)
 {
-    TCGv_i32 temp = tcg_temp_new_i32();
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
 
-    tcg_gen_andi_i32(temp, cpu_fcsr0, fcsr_mask[a->fcsrs]);
-    tcg_gen_ext_i32_i64(dest, temp);
+    tcg_gen_ld32u_i64(dest, cpu_env, offsetof(CPULoongArchState, fcsr0));
+    tcg_gen_andi_i64(dest, dest, fcsr_mask[a->fcsrs]);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free_i32(temp);
 
     return true;
 }
diff --git a/tests/tcg/loongarch64/Makefile.target b/tests/tcg/loongarch64/Makefile.target
index 0115de78ef..00030a1026 100644
--- a/tests/tcg/loongarch64/Makefile.target
+++ b/tests/tcg/loongarch64/Makefile.target
@@ -15,5 +15,6 @@ LOONGARCH64_TESTS  += test_div
 LOONGARCH64_TESTS  += test_fclass
 LOONGARCH64_TESTS  += test_fpcom
 LOONGARCH64_TESTS  += test_pcadd
+LOONGARCH64_TESTS  += test_fcsr
 
 TESTS += $(LOONGARCH64_TESTS)
-- 
2.34.1


