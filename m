Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25EC6254D6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:02:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfE-00064r-G4; Fri, 11 Nov 2022 02:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOf5-00063u-J9
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:15 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOf3-0007We-VX
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:15 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k7so3625242pll.6
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YoRGWSyVwaDhXOkYnUdohylcDpSat7ggSbobPWN00CY=;
 b=THrAA1z9LolC0Oj4hDqhX96ux2dnx2y8ZMbCYsmLhJ3w30J0VogMHNdMguNB19o89T
 Vmids42Sok93D8/MVW50WEMDxHGdIwe8YxyM1JT4x0my5NBPTyM3C6cF7T4ISUuIFwLN
 8/DZ4NFbdtsq1C+sp03RaqEmaaBWidusCRpMA+LV5Zy5Tez1qG6HkyiqeoCV06NEJQHy
 OyqMOdWG50Dk4k2S4ujd5jeIaR78AdwLsr7oa3V0sMmaTwLy54tw7OoMSdAtnFyMeXJK
 VuBuirkYDzlQnyBjmx6Rm9QLUVBWyxU5KMVAEZivtUeavqQIPmJmL387NKW2wYGazu7y
 GDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoRGWSyVwaDhXOkYnUdohylcDpSat7ggSbobPWN00CY=;
 b=J6WDpUuXNVsir48q7strodt2ZGMOA/kRbDvJGTvBpED7A+xeIkWhIphXQ9zTXGjCyU
 5l1ALmVyBN3qYfDoRXDrnL7g6OGamTrnuQh+WjSKkluOqOrpj/0X1Uhwz7MezJvIXfj+
 2ST4tjJgBMbTPA8OhIJ5JGp3pOGUNl8shhf4igeYBAmxmW4Xxi+bwS70wgJuDR7pFDj7
 0GBH7zQKMedilxPQNNc/swQ+YAeKRk2icBBYnu92SuJpF5kWGac1A5DWWX1qvhcfz1YH
 /sujuKSaflRs8kjHH9rmBVVDkqfEm6khBkVs4iS/bjOfXHd1UFnRKX7ok9Ipi+dbAu5w
 wVCg==
X-Gm-Message-State: ANoB5pnfAi3sX2lzR6nksYAx9YGlyPZcDCAxjKObSVqK/tkssNEo7bAk
 sX0e/8n0VT6hWpYzbQR9Ep/uodduyn8vZXq+
X-Google-Smtp-Source: AA0mqf6ZXlUzTVQISS5yCJ8YUOCCg0xKio01dRaSZ43soZOhvt1PQXjSilETao3W2El4AdHwAsiyhA==
X-Received: by 2002:a17:902:d145:b0:181:b25e:e7bc with SMTP id
 t5-20020a170902d14500b00181b25ee7bcmr1524109plt.46.1668152472389; 
 Thu, 10 Nov 2022 23:41:12 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v3 02/45] tcg: Tidy tcg_reg_alloc_op
Date: Fri, 11 Nov 2022 17:40:18 +1000
Message-Id: <20221111074101.2069454-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
index 436fcf6ebd..c68fa1d564 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3606,7 +3606,8 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
 
     /* satisfy input constraints */ 
     for (k = 0; k < nb_iargs; k++) {
-        TCGRegSet i_preferred_regs, o_preferred_regs;
+        TCGRegSet i_preferred_regs;
+        bool allocate_new_reg;
 
         i = def->args_ct[nb_oargs + k].sort_index;
         arg = op->args[i];
@@ -3621,9 +3622,12 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
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
@@ -3632,30 +3636,23 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
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
@@ -3663,7 +3660,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
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


