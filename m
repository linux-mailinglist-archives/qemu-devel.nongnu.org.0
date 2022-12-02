Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D0D64000A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:53:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymW-0002bX-S8; Fri, 02 Dec 2022 00:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymU-0002ZY-Ui
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:14 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymP-0003Kw-QS
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:14 -0500
Received: by mail-pg1-x52b.google.com with SMTP id h193so3533552pgc.10
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lxi9DTfFj2qgvAqFqwJIvarJrKnBnh8wZADTUj+Uab8=;
 b=m2b13KI5xJtq7q7/FTZlMEEiw5jitbsjjhJdAWlRqnbUoEBLLGFXKYgNVojTmfL/MR
 DAki53ec4Xbo920QfRFrucovPk/mz/xthOzFGLPQM9hJFferiN5M8PJOhL49Rj6HrYrX
 RFV+gLnCdtHIitdFz8AI8/z0H6qy38yV8ZkqZoAUE1x5MgbKa4GO+ervQy8AcgOFbklZ
 vfKHIqOr0Rs5SBbpCjYq3YTOguMxa+i3RCkS/Vcw3KHtxhsiqLoon45DTZN09R5UODjt
 irrzjZu9wVhbM+2gVTdQTDJ51ljLiLYWO/G0OPa4MfY2sis5LnY1fCSs76PX16br50fH
 lxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxi9DTfFj2qgvAqFqwJIvarJrKnBnh8wZADTUj+Uab8=;
 b=cUMUS+Ld9g3fqJEfAEbjLva2qw7iGE5c+dJnXouWD1NOzPwJ5OyPJNGtQaZP118wT+
 2V2jKw19dzshg1L0P4tQRppbqTtfJFcRxaKl8VfwyYR9lVpaAEbmWrvfz5EjLD8Q2MPR
 cCCxQRnUllLQOxC5tNEm3D5xInmOz3z+Pell5YaR725Jl2PM45tceJVy+8ARN3aVsUdW
 u++DgL3wNG54BmyqRNBlBkDg10rKBSmzE07vb9LO/X9zdj9ewHCaML/PS06IG9ipnseU
 4YmSw+Sa+N4/KEFW0nsj3nCYt5X2GcdubvwyLLBXBPVk9wHn1jgjBElYQgKOVpCVImi/
 MaMA==
X-Gm-Message-State: ANoB5pkP+G11fu8i7tVVcxYPCvDyiAW9fCpWIZrL9/vDvs3qgle7k3o4
 kUxOAtVn+aS4BJ4IHUpBhnXeAUaroYt8gxNC
X-Google-Smtp-Source: AA0mqf7Ra25czpvdEPJ0WX3iRiisI5Nxq1sAVAIz0c3wS+80lPO/LTP49aU4w6HfJ5lenZcqLayGqg==
X-Received: by 2002:a63:5958:0:b0:478:5a63:b45b with SMTP id
 j24-20020a635958000000b004785a63b45bmr5915004pgm.410.1669959608297; 
 Thu, 01 Dec 2022 21:40:08 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 08/34] tcg: Tidy tcg_reg_alloc_op
Date: Thu,  1 Dec 2022 21:39:32 -0800
Message-Id: <20221202053958.223890-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Replace goto allocate_in_reg with a boolean.
Remove o_preferred_regs which isn't used, except to copy.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 45 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cfcf959894..3532de3715 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3560,7 +3560,8 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
     /* satisfy input constraints */
     for (k = 0; k < nb_iargs; k++) {
-        TCGRegSet i_preferred_regs, o_preferred_regs;
+        TCGRegSet i_preferred_regs;
+        bool allocate_new_reg;
 
         i = def->args_ct[nb_oargs + k].sort_index;
         arg = op->args[i];
@@ -3575,9 +3576,12 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             continue;
         }
 
-        i_preferred_regs = o_preferred_regs = 0;
+        reg = ts->reg;
+        i_preferred_regs = 0;
+        allocate_new_reg = false;
+
         if (arg_ct->ialias) {
-            o_preferred_regs = op->output_pref[arg_ct->alias_index];
+            i_preferred_regs = op->output_pref[arg_ct->alias_index];
 
             /*
              * If the input is readonly, then it cannot also be an
@@ -3586,30 +3590,23 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
              * register and move it.
              */
             if (temp_readonly(ts) || !IS_DEAD_ARG(i)) {
-                goto allocate_in_reg;
+                allocate_new_reg = true;
+            } else if (ts->val_type == TEMP_VAL_REG) {
+                /*
+                 * Check if the current register has already been
+                 * allocated for another input.
+                 */
+                allocate_new_reg = tcg_regset_test_reg(i_allocated_regs, reg);
             }
-
-            /*
-             * Check if the current register has already been allocated
-             * for another input aliased to an output.
-             */
-            if (ts->val_type == TEMP_VAL_REG) {
-                reg = ts->reg;
-                for (int k2 = 0; k2 < k; k2++) {
-                    int i2 = def->args_ct[nb_oargs + k2].sort_index;
-                    if (def->args_ct[i2].ialias && reg == new_args[i2]) {
-                        goto allocate_in_reg;
-                    }
-                }
-            }
-            i_preferred_regs = o_preferred_regs;
         }
 
-        temp_load(s, ts, arg_ct->regs, i_allocated_regs, i_preferred_regs);
-        reg = ts->reg;
+        if (!allocate_new_reg) {
+            temp_load(s, ts, arg_ct->regs, i_allocated_regs, i_preferred_regs);
+            reg = ts->reg;
+            allocate_new_reg = !tcg_regset_test_reg(arg_ct->regs, reg);
+        }
 
-        if (!tcg_regset_test_reg(arg_ct->regs, reg)) {
- allocate_in_reg:
+        if (allocate_new_reg) {
             /*
              * Allocate a new register matching the constraint
              * and move the temporary register into it.
@@ -3617,7 +3614,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
             temp_load(s, ts, tcg_target_available_regs[ts->type],
                       i_allocated_regs, 0);
             reg = tcg_reg_alloc(s, arg_ct->regs, i_allocated_regs,
-                                o_preferred_regs, ts->indirect_base);
+                                i_preferred_regs, ts->indirect_base);
             if (!tcg_out_mov(s, ts->type, reg, ts->reg)) {
                 /*
                  * Cross register class move not supported.  Sync the
-- 
2.34.1


