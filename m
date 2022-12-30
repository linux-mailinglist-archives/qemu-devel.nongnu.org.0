Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540BC659392
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2r9-00031g-Pl; Thu, 29 Dec 2022 19:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r7-00030h-L8
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:37 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r5-0002gz-Qg
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:37 -0500
Received: by mail-pj1-x102d.google.com with SMTP id fy4so20830718pjb.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtHTxOsR6ht0+9SPiWHuqeFVG+XUj4+DdhfsvFYW/Qc=;
 b=CuhoUqCNKff5g05AesnvhmC82N0vQzpitb3pRHJSXSO3hBBXvOP0eYYGv+HgpNfeCo
 xJ1lFKkSbb9ow8bmoV68dQ5UHXuKMxsBn0ZJTwwc2ZONESqIbfFxZmctSe8MvxYYb9x9
 waODVHF7gY/1PlcXEhY89PFnxMxHLgsvJUPh2QK1GbwQhtmPFdDfURfV3lAClK7tSOU8
 vthdwe54NsFGEyGFbpRryFMp5Wrk0JmnXKQ7EGtj0Y905AprkiMhR0WwlXhHw0Vs7r25
 qAvmyivXeAgvE/u7rAuHW7ZBaRxNuLlCI+WEPliiyCzFvIEB/pAN/oKBIsORsXGJ9um8
 Za/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vtHTxOsR6ht0+9SPiWHuqeFVG+XUj4+DdhfsvFYW/Qc=;
 b=vnzp33ofXBQ+IWxMk+5KZhGt6ghQ4kFCbtpvBh1q0PTuSVCIJjd0Ri952YCu+RMLVm
 F+Bti8mnhNAF6fWGoE3KjbeUyJbEJJwC4AOT3U3ELH5yOvm4cUh3QmYiny0sGnw7CsDT
 S+Qa9ssQtt3v+VaDcyNFT9J9kQzEtUB4Z8Pi2XHnRt3irvUuMJftWFO3yCabo3MKcV6X
 YzZLXvzDyUsfyIPqLlAsziebW3+EIK7rhV2xRoQDQHWtv4IjbGehA7p7x415LR/j3nKc
 a10AbVbTUVGejA3h34EjoJltxUcC1Qx4g6mKAYgkgbWsUUC2m2SWUDcfXfFqJItPAZI7
 CY3Q==
X-Gm-Message-State: AFqh2krZ8jslEGrsCeRq2/4dV/jxk/Ln8R/qzdSjmjvbD2ebVDawhWCd
 SbRaWh/q65Sn4aPjSPo2bQXJZzRJRw9Z7PZP
X-Google-Smtp-Source: AMrXdXsD4uenCT4WjV5ariakcogv6ryZqvKgWqJyE1X2iiMvqx+DzOUWLuVHkgAkkrHY3MCeUlqbKQ==
X-Received: by 2002:a17:903:443:b0:189:c7e3:275f with SMTP id
 iw3-20020a170903044300b00189c7e3275fmr31281668plb.38.1672358554257; 
 Thu, 29 Dec 2022 16:02:34 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 12/47] tcg: Tidy tcg_reg_alloc_op
Date: Thu, 29 Dec 2022 16:01:46 -0800
Message-Id: <20221230000221.2764875-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index db64799e03..215ddf2db5 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3607,7 +3607,8 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
     /* satisfy input constraints */
     for (k = 0; k < nb_iargs; k++) {
-        TCGRegSet i_preferred_regs, o_preferred_regs;
+        TCGRegSet i_preferred_regs;
+        bool allocate_new_reg;
 
         i = def->args_ct[nb_oargs + k].sort_index;
         arg = op->args[i];
@@ -3622,9 +3623,12 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
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
@@ -3633,30 +3637,23 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
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
@@ -3664,7 +3661,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
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


