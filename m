Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5560716C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:50:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmn6-0001Wt-Ra
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:50:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmH2-00037P-5v
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGg-0002vr-Im
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:37 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGe-0005bl-QR
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:34 -0400
Received: by mail-pj1-x1030.google.com with SMTP id pq16so1686309pjb.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0N2X3V1riRQReX4ltI4ULsG1O5wdgfurbMkc7ES3gzU=;
 b=HRqEdCtiFfzrYtv4NLUFj4DMapt93Xyto+5bjCiyFgCepO6/G4f7JpWjsCp+EJjFTj
 +fAAnZhJoQinghYcieigcMyuT3yNueTX2g/88Cu43aRraJKjQciS4jS5Gxu9NMYjdXQy
 /VUpjJnA8/ddcyCxX8EUnYMJHYGOHlvnBfvJVDo6x9E7FXIzrcqccvrMB8SmSq7XVhq5
 /nY5HMsLJ0rDECv4Dhm+Y/I7S8LWQnN2PrUHGOYY3niZuvr3qr02Wdb3DDXIBy7TtJev
 RAumzHONZSFGoyCM7g40yTMy75Q3W1SZ7qXFJCViQJM77pZvVQMMeKqhf0Q5qmM2Ukd+
 dcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0N2X3V1riRQReX4ltI4ULsG1O5wdgfurbMkc7ES3gzU=;
 b=sV0/hkPJOitKnepS3BCeUET1GyKRTDfJIlrEalQHrw9S5gbVx0EduaTtkF8jeq2WHz
 cj0IBHpTJsChuYba2GXHYTGAmS8xMgpRb5exTPKAudaeX2Kyt9LosonCzmpDqQwrpfuR
 OQALJb5cf2Rq/fJdhlqXphp2tY8oCizVTZWrVyDmFGHxTQ1rN5jTbgLWMZfN3bYyVTdT
 s/oXH6M3DA4YR/CirDmsL5AxZk91T/M9VelZbQU67gOv0ywPfqHZdAeW/1/vU66KJAwG
 d7gmokKMXOxIGEYHZS89CaCsrQGenUYAcaRcZZBBsgtVOQOnYg4XQIAD4ussxcNnaPrM
 5p1A==
X-Gm-Message-State: ACrzQf35PtplM0WrUjYAMG9/KqxT1S4szwtqaEmBmD/P4AUfYUrqpvgx
 erwpUw3zA8LsvLPc1UtAEu/ObZ7ah+1qeWxw
X-Google-Smtp-Source: AMsMyM7uM0kiMvzsz1s07Gx7WR8xFygdsCw6Du0UixvMR0T7PHr4nnaC9heODnqcikDcFu+S2H91IA==
X-Received: by 2002:a17:90a:e387:b0:211:2d90:675 with SMTP id
 b7-20020a17090ae38700b002112d900675mr10149073pjz.66.1666336591367; 
 Fri, 21 Oct 2022 00:16:31 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/36] tcg: Tidy tcg_reg_alloc_op
Date: Fri, 21 Oct 2022 17:15:15 +1000
Message-Id: <20221021071549.2398137-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace goto allocate_in_reg with a boolean.
Remove o_preferred_regs which isn't used, except to copy.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 45 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c9e664ee31..660d5eb098 100644
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


