Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB91B2DD365
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:58:26 +0100 (CET)
Received: from localhost ([::1]:60534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuja-0000m0-0G
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue4-0003bG-RD
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:44 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:42572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue0-0004zQ-Qf
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:44 -0500
Received: by mail-oi1-x230.google.com with SMTP id l200so32405956oig.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7smMUJ3GTwe/WfNNy/U+eGwwMqkpocbG1ZOKTJ5WLrw=;
 b=aihn+utz6fKF5JU3te3+cKyCh6ajzt5ghaeROUMI6UhGmdvtiq1iP+qPXNcFuBk4sE
 r1HSCZfSwMrwCLSSJ+qHZSu2bzO4uvg8lvjruwrZlJti8eRpSnll3T52YiUNTOUuTHCM
 D+bUCkFtUDuAIv7dxBkquwn1OG4PKv8R5h/GndiqS6uZOe6eKF6HTQNa6rtBM2Jy/zil
 0Zk6fCFggV4N+yBdnyFQXSQ/LZJn8/BKwMt7ZTJlim1xkEetdh80yGiGwkZ05FyWOWgu
 WwPslwm+K+2J6spcCN2/19IxeW1q6Gl5Y9tRq4ibT3axM8PUyUrGZO9fcRHHqCDpkuYN
 O30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7smMUJ3GTwe/WfNNy/U+eGwwMqkpocbG1ZOKTJ5WLrw=;
 b=GfiiRwTfIb4mmTTbvJn3/LS76Nx5W5I4tmAhbhIR7bVxzvItwiojGPxaf42ss6sbU7
 XAsmfJgV+opiOkkMmKbHi+YHTiOLMSP2HRIqYJCf4Gz7IU2JutaM0G/MR6TIk7HqGVbL
 oya1eddwVH0KqY/Udidhv6qZEannIWgHD8NFTPWh2Qs1++YLlqElDyNr/50S+S1+vc2E
 z/oW4pTqr7eDh5wYgeNbNFqX0ML3WGAzdcs9YGllIiP8muKBzLd3uUdBEu0+y/0KVVf/
 6fZYmhwfHUzLyTvlUtLMYw7w/fG/b51bdLXPH01HC9eZ4F19G9dRF6mlmloQYBRUZDbv
 2TMQ==
X-Gm-Message-State: AOAM530rw3+MMCyPbCT9QJl1wErg5a7OnQQOYKvUVGXNtZRvEnQI0sDT
 wutJ8tklbou9JBiOQHy8ji5T9AiOh5D5qyxr
X-Google-Smtp-Source: ABdhPJx3RS86MdOdbpYgJcZGiar9jK3bh9a1FQBm2J2sugZmjvoMzNFc4BveLWWN1yX8oRynFF5IDA==
X-Received: by 2002:aca:c1d6:: with SMTP id r205mr5002914oif.37.1608216758795; 
 Thu, 17 Dec 2020 06:52:38 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/23] tcg: Add tcg_reg_alloc_dup2
Date: Thu, 17 Dec 2020 08:52:11 -0600
Message-Id: <20201217145215.534637-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are several ways we can expand a vector dup of a 64-bit
element on a 32-bit host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8def2f99e6..09a82d444f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4030,6 +4030,98 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     }
 }
 
+static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
+{
+    const TCGLifeData arg_life = op->life;
+    TCGTemp *ots, *itsl, *itsh;
+    TCGType vtype = TCGOP_VECL(op) + TCG_TYPE_V64;
+
+    /* This opcode is only valid for 32-bit hosts, for 64-bit elements. */
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(TCGOP_VECE(op) == MO_64);
+
+    ots = arg_temp(op->args[0]);
+    itsl = arg_temp(op->args[1]);
+    itsh = arg_temp(op->args[2]);
+
+    /* ENV should not be modified.  */
+    tcg_debug_assert(!temp_readonly(ots));
+
+    /* Allocate the output register now.  */
+    if (ots->val_type != TEMP_VAL_REG) {
+        TCGRegSet allocated_regs = s->reserved_regs;
+        TCGRegSet dup_out_regs =
+            tcg_op_defs[INDEX_op_dup_vec].args_ct[0].regs;
+
+        /* Make sure to not spill the input registers. */
+        if (!IS_DEAD_ARG(1) && itsl->val_type == TEMP_VAL_REG) {
+            tcg_regset_set_reg(allocated_regs, itsl->reg);
+        }
+        if (!IS_DEAD_ARG(2) && itsh->val_type == TEMP_VAL_REG) {
+            tcg_regset_set_reg(allocated_regs, itsh->reg);
+        }
+
+        ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
+                                 op->output_pref[0], ots->indirect_base);
+        ots->val_type = TEMP_VAL_REG;
+        ots->mem_coherent = 0;
+        s->reg_to_temp[ots->reg] = ots;
+    }
+
+    /* Promote dup2 of immediates to dupi_vec. */
+    if (itsl->val_type == TEMP_VAL_CONST && itsh->val_type == TEMP_VAL_CONST) {
+        uint64_t val = deposit64(itsl->val, 32, 32, itsh->val);
+        MemOp vece = MO_64;
+
+        if (val == dup_const(MO_8, val)) {
+            vece = MO_8;
+        } else if (val == dup_const(MO_16, val)) {
+            vece = MO_16;
+        } else if (val == dup_const(MO_32, val)) {
+            vece = MO_32;
+        }
+
+        tcg_out_dupi_vec(s, vtype, vece, ots->reg, val);
+        goto done;
+    }
+
+    /* If the two inputs form one 64-bit value, try dupm_vec. */
+    if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
+        if (!itsl->mem_coherent) {
+            temp_sync(s, itsl, s->reserved_regs, 0, 0);
+        }
+        if (!itsh->mem_coherent) {
+            temp_sync(s, itsh, s->reserved_regs, 0, 0);
+        }
+#ifdef HOST_WORDS_BIGENDIAN
+        TCGTemp *its = itsh;
+#else
+        TCGTemp *its = itsl;
+#endif
+        if (tcg_out_dupm_vec(s, vtype, MO_64, ots->reg,
+                             its->mem_base->reg, its->mem_offset)) {
+            goto done;
+        }
+    }
+
+    /* Fall back to generic expansion. */
+    return false;
+
+ done:
+    if (IS_DEAD_ARG(1)) {
+        temp_dead(s, itsl);
+    }
+    if (IS_DEAD_ARG(2)) {
+        temp_dead(s, itsh);
+    }
+    if (NEED_SYNC_ARG(0)) {
+        temp_sync(s, ots, s->reserved_regs, 0, IS_DEAD_ARG(0));
+    } else if (IS_DEAD_ARG(0)) {
+        temp_dead(s, ots);
+    }
+    return true;
+}
+
 #ifdef TCG_TARGET_STACK_GROWSUP
 #define STACK_DIR(x) (-(x))
 #else
@@ -4442,6 +4534,11 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
         case INDEX_op_call:
             tcg_reg_alloc_call(s, op);
             break;
+        case INDEX_op_dup2_vec:
+            if (tcg_reg_alloc_dup2(s, op)) {
+                break;
+            }
+            /* fall through */
         default:
             /* Sanity check that we've not introduced any unhandled opcodes. */
             tcg_debug_assert(tcg_op_supported(opc));
-- 
2.25.1


