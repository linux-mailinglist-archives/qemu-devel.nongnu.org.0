Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC886F8AD3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:26:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vR-0000iT-1l; Fri, 05 May 2023 17:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vA-0000cL-I2
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v8-0004OS-Rq
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:56 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so15906535e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321893; x=1685913893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjEbOkYEfaAbJuhH9vdQBxzxPZocmNlfqwwgZV5jixE=;
 b=D2fWycMlUcVt7T+cMw7HWLKWlV5M+MTKwt5eUBLJG5jI+OW0PK1I+2V5vxVxGK2Yf9
 jITcXwKwAtv/cGQl1bzJXE1rqEdwmaHhwQBYSQhzopS/MNvOHQcFOC0LNGTB9dR0o0lw
 U4d5N1PB1w1sJZC4EQUZWi/xTL99yEgGmCYPxaBz6XI4t0Gj/O/q87aqqF/UhfLE9L0I
 e0LAgBcwhB2kLfB1jMNWjyXkxCJRplnjyjKOryB616PyfbfkStQy01OojmT8MnZidaFw
 X2N4T2AZhJPEck8KL/sRzuHezx3YQdurA6jyS9/bFC/5AgqNx/f5yX07F8rMCmWVDvcf
 I3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321893; x=1685913893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjEbOkYEfaAbJuhH9vdQBxzxPZocmNlfqwwgZV5jixE=;
 b=baL3rkCMOZtRO4cO8rLJI7eDRLnbFsRgX1xvw4z1DYjdOpMb5N5Rr6sYoSw4NDXVDT
 GoSY0iQRcsZJpMPrI1UzB0av0QZeDeIIyLZJJQN3g2WNYqHZSzH5FTcyJNwnmDMT+uMO
 zowcH+xqX+Nbgu1jVb77ipyTT7ezDrK4xAqz99ousRCv+q5PuBoO2x/UPSBy2zvICrGJ
 pxRRFp+58a8Y7ITr+OU9mKylhkr2FxFxhsaMhBmZgouB3JPzQbwDCvlnvGBKf7WfzZeu
 sdPDLpmRrQbd0udHPPdZta0qhgxn8r5TpsA3pD6eMXk7ohQQ7QUrBTfpu2xi60ezKFLp
 u5MA==
X-Gm-Message-State: AC+VfDwAYCmUrJ9eo8cNObtjNIB5HpHRvY/eJJEsb38eoAJdAiZOWLzy
 ttOJBF+YwAn6QHOiMpU6B89FVhvVNsWW2f/d6GyBPQ==
X-Google-Smtp-Source: ACHHUZ4+OLS+Ep+cuvrJuFfnx9F8kCCUWQAp0FXP0ArT/xbNSQKqlkE1gLInDJ12jzlkpkKIzLDt3A==
X-Received: by 2002:a7b:c8d9:0:b0:3f2:5be3:cd67 with SMTP id
 f25-20020a7bc8d9000000b003f25be3cd67mr1983578wml.18.1683321893542; 
 Fri, 05 May 2023 14:24:53 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>
Subject: [PULL 08/42] target/sparc: Finish conversion to tcg_gen_qemu_{ld,
 st}_*
Date: Fri,  5 May 2023 22:24:13 +0100
Message-Id: <20230505212447.374546-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert away from the old interface with the implicit
MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20230502135741.1158035-8-richard.henderson@linaro.org>
---
 target/sparc/translate.c | 43 ++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 137bdc5159..bc71e44e66 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5179,15 +5179,18 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 switch (xop) {
                 case 0x0:       /* ld, V9 lduw, load unsigned word */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_ld32u(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
+                                       dc->mem_idx, MO_TEUL);
                     break;
                 case 0x1:       /* ldub, load unsigned byte */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_ld8u(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
+                                       dc->mem_idx, MO_UB);
                     break;
                 case 0x2:       /* lduh, load unsigned halfword */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_ld16u(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
+                                       dc->mem_idx, MO_TEUW);
                     break;
                 case 0x3:       /* ldd, load double word */
                     if (rd & 1)
@@ -5197,7 +5200,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 
                         gen_address_mask(dc, cpu_addr);
                         t64 = tcg_temp_new_i64();
-                        tcg_gen_qemu_ld64(t64, cpu_addr, dc->mem_idx);
+                        tcg_gen_qemu_ld_i64(t64, cpu_addr,
+                                            dc->mem_idx, MO_TEUQ);
                         tcg_gen_trunc_i64_tl(cpu_val, t64);
                         tcg_gen_ext32u_tl(cpu_val, cpu_val);
                         gen_store_gpr(dc, rd + 1, cpu_val);
@@ -5208,11 +5212,12 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                     break;
                 case 0x9:       /* ldsb, load signed byte */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_ld8s(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr, dc->mem_idx, MO_SB);
                     break;
                 case 0xa:       /* ldsh, load signed halfword */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_ld16s(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
+                                       dc->mem_idx, MO_TESW);
                     break;
                 case 0xd:       /* ldstub */
                     gen_ldstub(dc, cpu_val, cpu_addr, dc->mem_idx);
@@ -5266,11 +5271,13 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 #ifdef TARGET_SPARC64
                 case 0x08: /* V9 ldsw */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_ld32s(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
+                                       dc->mem_idx, MO_TESL);
                     break;
                 case 0x0b: /* V9 ldx */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_ld64(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
+                                       dc->mem_idx, MO_TEUQ);
                     break;
                 case 0x18: /* V9 ldswa */
                     gen_ld_asi(dc, cpu_val, cpu_addr, insn, MO_TESL);
@@ -5369,15 +5376,17 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                 switch (xop) {
                 case 0x4: /* st, store word */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_st32(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_st_tl(cpu_val, cpu_addr,
+                                       dc->mem_idx, MO_TEUL);
                     break;
                 case 0x5: /* stb, store byte */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_st8(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_st_tl(cpu_val, cpu_addr, dc->mem_idx, MO_UB);
                     break;
                 case 0x6: /* sth, store halfword */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_st16(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_st_tl(cpu_val, cpu_addr,
+                                       dc->mem_idx, MO_TEUW);
                     break;
                 case 0x7: /* std, store double word */
                     if (rd & 1)
@@ -5390,7 +5399,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         lo = gen_load_gpr(dc, rd + 1);
                         t64 = tcg_temp_new_i64();
                         tcg_gen_concat_tl_i64(t64, lo, cpu_val);
-                        tcg_gen_qemu_st64(t64, cpu_addr, dc->mem_idx);
+                        tcg_gen_qemu_st_i64(t64, cpu_addr,
+                                            dc->mem_idx, MO_TEUQ);
                     }
                     break;
 #if !defined(CONFIG_USER_ONLY) || defined(TARGET_SPARC64)
@@ -5413,7 +5423,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 #ifdef TARGET_SPARC64
                 case 0x0e: /* V9 stx */
                     gen_address_mask(dc, cpu_addr);
-                    tcg_gen_qemu_st64(cpu_val, cpu_addr, dc->mem_idx);
+                    tcg_gen_qemu_st_tl(cpu_val, cpu_addr,
+                                       dc->mem_idx, MO_TEUQ);
                     break;
                 case 0x1e: /* V9 stxa */
                     gen_st_asi(dc, cpu_val, cpu_addr, insn, MO_TEUQ);
@@ -5438,11 +5449,13 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
 #ifdef TARGET_SPARC64
                         gen_address_mask(dc, cpu_addr);
                         if (rd == 1) {
-                            tcg_gen_qemu_st64(cpu_fsr, cpu_addr, dc->mem_idx);
+                            tcg_gen_qemu_st_tl(cpu_fsr, cpu_addr,
+                                               dc->mem_idx, MO_TEUQ);
                             break;
                         }
 #endif
-                        tcg_gen_qemu_st32(cpu_fsr, cpu_addr, dc->mem_idx);
+                        tcg_gen_qemu_st_tl(cpu_fsr, cpu_addr,
+                                           dc->mem_idx, MO_TEUL);
                     }
                     break;
                 case 0x26:
-- 
2.34.1


