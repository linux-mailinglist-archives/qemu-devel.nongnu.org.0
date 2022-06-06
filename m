Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF3153F2AF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:45:00 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMP5-0006oS-NY
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwT-0001kD-PC
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:27 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwP-0003zT-4u
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:24 -0400
Received: by mail-pf1-x430.google.com with SMTP id g205so13912606pfb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2QqbKzAwr9vjS4vmaM7pFsZLapi/ItG1evQoSB6fco=;
 b=MKXRZ54jgOkKGBldYc5otUOkeJFjrz8Hq8ec/kHabA3W/Tzd8v2/SfYfoNkuFmTAm7
 E13YTwhf/OoeLxpdTEg74NUDgOC2swMIJaoJOYAfjXOAOBf8Qcnrhjmg7Skt3IAHu51H
 7E4WggneYML3HhHLdMSYWS+y/KyhRzLnDA7X8NltAk8gXtvpPzofl5Opop8NF7/7IKvC
 9uvvce1prNJfmImd57Fi4kYpsx4XFkL95cbIDcmzBSgcvieIgrwbGth3cZXU4Tzhtmwc
 rgL1sy7lic+wEDHZevJOUZeYYhixKISil38xpniBW+F1O5Tuu+NW7KaBJSjpXIkV6uBm
 GdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O2QqbKzAwr9vjS4vmaM7pFsZLapi/ItG1evQoSB6fco=;
 b=zppO4jWRwvx2lxxxfQOC3XLtaCJ7m9XL7eaGyyu2B0n2PvXbUaXG6+WUXk7weKowU0
 ek875f1yW6sV0MhjsuoMCLdBwxvZOx1+GQ32ymRuQ1CF94WA+x/l1wCRTfxXSiKE0iut
 RsmqzrqE64VTEnOyRdD9DqdLeddeC1v8auWhqAR1AYMsY32xdFsogKKuIt8u/guOMLg8
 lKXBl3nbKo8FoijyBeZA3STJcF8caAKthHhW9P1wdsG+QAQ5U3taYiDxfHnQ/VHdfxlf
 x3ja316EQlyr+WXQUDfVY/m9tNnfA/PFgoP8wGh+D6pbcW7us/EdL6FmK1218C/rufEe
 Kg8A==
X-Gm-Message-State: AOAM530KmBoIOuM/1b6/FExqHuuSNYoB8q2VfC1wKyYcJHcOFx8oBEfl
 rd4hfcI4tYTq7lvsiwbF/CjmfJ0NUv1OSA==
X-Google-Smtp-Source: ABdhPJwSsRRbvVdKDb1HrVPTQS7+kSDhw7FrrqvADBDtglYRPIqVFB+JFj6RGhM9R2K/NaJZwbpvCg==
X-Received: by 2002:a63:8241:0:b0:3fc:aa22:7f3e with SMTP id
 w62-20020a638241000000b003fcaa227f3emr23689890pgd.2.1654557318806; 
 Mon, 06 Jun 2022 16:15:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 29/43] target/loongarch: Add timer related instructions support.
Date: Mon,  6 Jun 2022 16:14:36 -0700
Message-Id: <20220606231450.448443-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

This includes:
-RDTIME{L/H}.W
-RDTIME.D

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-30-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                     |  2 ++
 target/loongarch/insns.decode                 |  3 ++
 target/loongarch/disas.c                      |  3 ++
 target/loongarch/op_helper.c                  | 13 ++++++++
 target/loongarch/translate.c                  |  2 ++
 target/loongarch/insn_trans/trans_extra.c.inc | 33 +++++++++++++++++++
 6 files changed, 56 insertions(+)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 626fc32e1e..85c11a60d4 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -93,6 +93,8 @@ DEF_HELPER_2(frint_d, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
 
+DEF_HELPER_1(rdtime_d, i64, env)
+
 /* CSRs helper */
 DEF_HELPER_1(csrrd_pgd, i64, env)
 DEF_HELPER_1(csrrd_tval, i64, env)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index ebd3d505fb..3fdc6e148c 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -309,6 +309,9 @@ break           0000 00000010 10100 ...............      @i15
 syscall         0000 00000010 10110 ...............      @i15
 asrtle_d        0000 00000000 00010 ..... ..... 00000    @rr_jk
 asrtgt_d        0000 00000000 00011 ..... ..... 00000    @rr_jk
+rdtimel_w       0000 00000000 00000 11000 ..... .....    @rr
+rdtimeh_w       0000 00000000 00000 11001 ..... .....    @rr
+rdtime_d        0000 00000000 00000 11010 ..... .....    @rr
 cpucfg          0000 00000000 00000 11011 ..... .....    @rr
 
 #
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 9d790b172c..858dfcc53a 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -352,6 +352,9 @@ INSN(bitrev_w,     rr)
 INSN(bitrev_d,     rr)
 INSN(ext_w_h,      rr)
 INSN(ext_w_b,      rr)
+INSN(rdtimel_w,    rr)
+INSN(rdtimeh_w,    rr)
+INSN(rdtime_d,     rr)
 INSN(cpucfg,       rr)
 INSN(asrtle_d,     rr_jk)
 INSN(asrtgt_d,     rr_jk)
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index a9ba72d5b2..d87049851f 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -84,6 +84,19 @@ target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
     return rj > 21 ? 0 : env->cpucfg[rj];
 }
 
+uint64_t helper_rdtime_d(CPULoongArchState *env)
+{
+    uint64_t plv;
+    LoongArchCPU *cpu = env_archcpu(env);
+
+    plv = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+    if (extract64(env->CSR_MISC, R_CSR_MISC_DRDTL_SHIFT + plv, 1)) {
+        do_raise_exception(env, EXCCODE_IPE, GETPC());
+    }
+
+    return cpu_loongarch_get_constant_timer_counter(cpu);
+}
+
 void helper_ertn(CPULoongArchState *env)
 {
     uint64_t csr_pplv, csr_pie;
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 0f098924a3..c9afd11420 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -25,6 +25,8 @@ static TCGv cpu_lladdr, cpu_llval;
 TCGv_i32 cpu_fcsr0;
 TCGv_i64 cpu_fpr[32];
 
+#include "exec/gen-icount.h"
+
 #define DISAS_STOP        DISAS_TARGET_0
 #define DISAS_EXIT        DISAS_TARGET_1
 #define DISAS_EXIT_UPDATE DISAS_TARGET_2
diff --git a/target/loongarch/insn_trans/trans_extra.c.inc b/target/loongarch/insn_trans/trans_extra.c.inc
index 549f75a867..ad713cd61e 100644
--- a/target/loongarch/insn_trans/trans_extra.c.inc
+++ b/target/loongarch/insn_trans/trans_extra.c.inc
@@ -33,6 +33,39 @@ static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
     return true;
 }
 
+static bool gen_rdtime(DisasContext *ctx, arg_rr *a,
+                       bool word, bool high)
+{
+    TCGv dst1 = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv dst2 = gpr_dst(ctx, a->rj, EXT_NONE);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_rdtime_d(dst1, cpu_env);
+    if (word) {
+        tcg_gen_sextract_tl(dst1, dst1, high ? 32 : 0, 32);
+    }
+    tcg_gen_ld_i64(dst2, cpu_env, offsetof(CPULoongArchState, CSR_TID));
+
+    return true;
+}
+
+static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
+{
+    return gen_rdtime(ctx, a, 1, 0);
+}
+
+static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
+{
+    return gen_rdtime(ctx, a, 1, 1);
+}
+
+static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
+{
+    return gen_rdtime(ctx, a, 0, 0);
+}
+
 static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
-- 
2.34.1


