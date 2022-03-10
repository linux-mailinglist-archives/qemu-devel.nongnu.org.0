Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141564D45F0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:41:37 +0100 (CET)
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHAl-0004m7-Qm
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:41:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxi-0006EL-2q
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:06 -0500
Received: from [2607:f8b0:4864:20::102b] (port=33653
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxg-00081A-4K
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:05 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso6400303pjc.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ryxSDJJrKjueVH0OEsU0bn5y9v3EMgUpEWxAYhSIfi0=;
 b=ZZviliMdA7iS9Uc5FMCSioqYhTyyTd8R7dbXt3Q3LXy7YzbF8GWjTw8hrFX1dTPDcG
 qPPY6evnzpt0tnZIQ2ABrnmCERRGora9dtIvXCD+4RZtvGdfAH9VFTqCGIo9MyikxW4f
 ufarYiBKyYCCcgZM/sd0sOmMCnh7BUfucYrHsJHhvOppxRvSMEo4GBZs9XbVlMBrAbWR
 f9Zie1av6XRQ3Rzlun1UKKlfnZrzUde5aRXjHGt6IZ9JvqyJwV7hNtu09u1681ixpZtl
 39Nlr/dlVoIefqlPaIcplMM160M1HSqzSk9i72HsejtqKeMxTvEKQerr6iVAHhVJgOGU
 26CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ryxSDJJrKjueVH0OEsU0bn5y9v3EMgUpEWxAYhSIfi0=;
 b=z41Tg099BVuii6URjjDRm7mdp6CtFQ2E5UpXo0lPTZ4MN1or0P09W10NFdPSNIYXa2
 E2FvfTHBD9DLsUUDesaekq2/EOx3IlfIrpI54lqgqrHOM+tx7F02vGCL5HMO3eOn/bX8
 l9AqyRb/kDkM0rUm2xtBwHyohAFeoVhfij49h6+jiDFibHzOx+k6Xq/oVlTfb00WV4zU
 0BBn3LSQ14ccsjMb+RH0hM2nS6E87E+0ADnMKqgfTPhpCK8em5vlg1v5Q9967kXcQ5M8
 OZyxivGvg0f78PJeepzYGvQPIYzZLn0jqQsJM7PY8VsLUGxkBXX2DwMHV5JGfbFaBwfd
 LPjA==
X-Gm-Message-State: AOAM533VqfH/ahiEIoEoY38nnzL3QmuAXLj50WZJC64S9D4z1HaHKCQT
 u0YqVEyFPPzfN4hLSyCnEpGceQ0ggW27Pw==
X-Google-Smtp-Source: ABdhPJwlq3SslQZBg6+i2f7cxAPlpVX4fD7xEe8Iu3ENrGo3A4NjnAMo/DDn2Wn7EazDp2tbnTxiaQ==
X-Received: by 2002:a17:90a:6543:b0:1b9:1dce:a23d with SMTP id
 f3-20020a17090a654300b001b91dcea23dmr4416244pjs.243.1646911682793; 
 Thu, 10 Mar 2022 03:28:02 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:28:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 31/48] target/nios2: Use tcg_constant_tl
Date: Thu, 10 Mar 2022 03:27:08 -0800
Message-Id: <20220310112725.570053-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Replace current uses of tcg_const_tl, and remove the frees.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index c8fb05a9cb..4ad47bb966 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -99,7 +99,6 @@
 
 typedef struct DisasContext {
     DisasContextBase  base;
-    TCGv_i32          zero;
     target_ulong      pc;
     int               mem_idx;
     const ControlRegState *cr_state;
@@ -125,31 +124,20 @@ static uint8_t get_opxcode(uint32_t code)
     return instr.opx;
 }
 
-static TCGv load_zero(DisasContext *dc)
+static TCGv load_gpr(DisasContext *dc, unsigned reg)
 {
-    if (!dc->zero) {
-        dc->zero = tcg_const_i32(0);
-    }
-    return dc->zero;
-}
-
-static TCGv load_gpr(DisasContext *dc, uint8_t reg)
-{
-    if (likely(reg != R_ZERO)) {
-        return cpu_R[reg];
-    } else {
-        return load_zero(dc);
+    assert(reg < NUM_GP_REGS);
+    if (unlikely(reg == R_ZERO)) {
+        return tcg_constant_tl(0);
     }
+    return cpu_R[reg];
 }
 
 static void t_gen_helper_raise_exception(DisasContext *dc,
                                          uint32_t index)
 {
-    TCGv_i32 tmp = tcg_const_i32(index);
-
     tcg_gen_movi_tl(cpu_pc, dc->pc);
-    gen_helper_raise_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(index));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -876,14 +864,8 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         return;
     }
 
-    dc->zero = NULL;
-
     instr = &i_type_instructions[op];
     instr->handler(dc, code, instr->flags);
-
-    if (dc->zero) {
-        tcg_temp_free(dc->zero);
-    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.25.1


