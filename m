Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7364F42EC2C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:25:34 +0200 (CEST)
Received: from localhost ([::1]:47976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIWz-0001xB-Fa
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxA-0007zE-2D
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHx7-0003Gk-FB
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:31 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6742993pjb.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GisI5wY8z30Qm/LJNT9XoKRsVSP6ppfib8kxj0F8nE=;
 b=CRGMoHRoolF/zUf9KCr/QKxhBTPAYQyCxh061HHg52XROxnxnfGcQ4sd8nZI7TIyA7
 JBk2DfXJNFkcRvEeDnEuaHraIiHcWNdYn+xSHCV72VlpxA4XrrqIPreisA9yLaybZkOy
 GCojKK/pfvEkaFTUO30JyWvmAkJqNiB8Rkob86OanrOvXL5wLWQdc4YviVtwJF2uDtzO
 EzPEShd8lX6YAgBD6Wp8FZJuW35txSSYlyymdOr+dAaNyjITqZImUg6ykqooCpAcfC22
 hyuA/rzpx+t/Xx0n8bewk1ezu+Jw6Jq/d7lkkHri4hTi9nDhXQSLzq4/wKbSxZuBLSBp
 x8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GisI5wY8z30Qm/LJNT9XoKRsVSP6ppfib8kxj0F8nE=;
 b=E21dx7+yj/7HWBCeqbndyqFhyN1o0iUOzZ3urK7v4SWvDF10ma+ll5cf7959qRC/K4
 vc2k75EuqEAMEmPPD09Xgum1CerDJNB46WuGKyzdDRFvluxFXimWHvCqTf+H+QnzBLZ3
 1P1yVnNv0AkRWF2ZIh6k1OieqWrEo+Ee1Y342k7ujtO2u1ydjG9t98+39KYDSt5DHop5
 pnVtQFIOwc0oW7P0DfOUa+lGQwPIgm+NLc6z5t1EJfSrgleyU2cTZMeHukDptbFZpRbR
 Oj4A6+hkdhLhRXngDrr/r9Aj+oVborxoz7ZApsUNcUIq+gu75C57VqCAQlQ1PVOt1iDu
 mDUQ==
X-Gm-Message-State: AOAM530wPDxf4bhEtBG4HuB0RsWfhHV6WFYgUQKBe8ER9GhmAi/mVtYj
 X53p1QYu6wpTRf/sgTjizOZLGbVC6W91YnFg
X-Google-Smtp-Source: ABdhPJx5iv6JZCwCRtioyZWuyGxiaxnQ5M9wy+SSErpucO2kHtwOWvp9Oq7vccvBzTBJFxP1qhea4A==
X-Received: by 2002:a17:90a:9d81:: with SMTP id
 k1mr26530775pjp.153.1634284108097; 
 Fri, 15 Oct 2021 00:48:28 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:27 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 26/78] target/riscv: rvv-1.0: take fractional LMUL into
 vector max elements calculation
Date: Fri, 15 Oct 2021 15:45:33 +0800
Message-Id: <20211015074627.3957162-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
calculation for RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 43 ++++++++++++++++++-------
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++-
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f958e2f3c0d..9b2af4e4d0e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -407,18 +407,27 @@ FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
 /*
- * A simplification for VLMAX
- * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
- * = (VLEN << LMUL) / (8 << SEW)
- * = (VLEN << LMUL) >> (SEW + 3)
- * = VLEN >> (SEW + 3 - LMUL)
+ * Encode LMUL to lmul as follows:
+ *     LMUL    vlmul    lmul
+ *      1       000       0
+ *      2       001       1
+ *      4       010       2
+ *      8       011       3
+ *      -       100       -
+ *     1/8      101      -3
+ *     1/4      110      -2
+ *     1/2      111      -1
+ *
+ * then, we can calculate VLMAX = vlen >> (vsew + 3 - lmul)
+ * e.g. vlen = 256 bits, SEW = 16, LMUL = 1/8
+ *      => VLMAX = vlen >> (1 + 3 - (-3))
+ *               = 256 >> 7
+ *               = 2
  */
 static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 {
-    uint8_t sew, lmul;
-
-    sew = FIELD_EX64(vtype, VTYPE, VSEW);
-    lmul = FIELD_EX64(vtype, VTYPE, VLMUL);
+    uint8_t sew = FIELD_EX64(vtype, VTYPE, VSEW);
+    int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
     return cpu->cfg.vlen >> (sew + 3 - lmul);
 }
 
@@ -431,12 +440,22 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *cs_base = 0;
 
     if (riscv_has_ext(env, RVV)) {
+        /*
+         * If env->vl equals to VLMAX, we can use generic vector operation
+         * expanders (GVEC) to accerlate the vector operations.
+         * However, as LMUL could be a fractional number. The maximum
+         * vector size can be operated might be less than 8 bytes,
+         * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
+         * only when maxsz >= 8 bytes.
+         */
         uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
-        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
+        uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
+        uint32_t maxsz = vlmax << sew;
+        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl)
+                           && (maxsz >= 8);
         flags = FIELD_DP32(flags, TB_FLAGS, VILL,
                     FIELD_EX64(env->vtype, VTYPE, VILL));
-        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
-                    FIELD_EX64(env->vtype, VTYPE, VSEW));
+        flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
         flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
                     FIELD_EX64(env->vtype, VTYPE, VLMUL));
         flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 118591ddda2..3ba74cdc403 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1049,7 +1049,17 @@ GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
 /*
  *** Vector Integer Arithmetic Instructions
  */
-#define MAXSZ(s) (s->vlen >> (3 - s->lmul))
+
+/*
+ * MAXSZ returns the maximum vector size can be operated in bytes,
+ * which is used in GVEC IR when vl_eq_vlmax flag is set to true
+ * to accerlate vector operation.
+ */
+static inline uint32_t MAXSZ(DisasContext *s)
+{
+    int scale = s->lmul - 3;
+    return scale < 0 ? s->vlen >> -scale : s->vlen << scale;
+}
 
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
 {
-- 
2.25.1


