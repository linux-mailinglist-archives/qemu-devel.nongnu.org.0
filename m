Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF9B655BE6
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOT-0002HP-2i; Sat, 24 Dec 2022 18:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOR-0002HC-Hs
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:31 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOO-0006Gi-A3
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so30451pjk.3
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6tqpC+7m8/ICgyOyiYZ2RwX4BgqdHMMEgREVC9PV0w=;
 b=I36TYGYxTvgSZdrSUFurkxQasG5VTpIjH2PB5LPR/ER6R8TPZxBGvcvMffH3PCojLV
 HcRmoo9rIPaefzh1XuaoxGlCYsfwWnA6nORMaELt6m/Jj7hGp4qc0eXU+7+dy48Be1R/
 HSOUu52EUlS671mT2fESzIEQzfBOVFurohdOH/7Yr2bWqmIgMPb46svqeE6PXeE8V3dU
 nHZeDHouZlprjxbe9gvnk9Yo4Xl97gzunM3T99E4aWl+QBkM1AOQSzZ+UzE2toTnELjA
 E2NlHp988bTKddAkFILZxsfNuEcizAOCJrhxuNeTDQOx60Fc2wN3tnrtGxzizCWvyxks
 kYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6tqpC+7m8/ICgyOyiYZ2RwX4BgqdHMMEgREVC9PV0w=;
 b=r4oMsTjhQ2o0zW76xbgT+5HVEyn8LyOTrHcQTT0BwmoO+scQQOg1POph5IV+d2rfPv
 6P6TwTMgQ0FklfDVoJV1XlXnkk5H8gDO7RePA8jwMgK0p6NbDmSbwBqlO28aA+rEs22+
 ML/eWVCgUVLd3U3pAYeQk8qes6ZQ/haOHa/eSs+SPHRVGy1nmHaoTQmXAMrx8wQ1O4k2
 sLFNH5vYGo8U/IJuCP8P3puWNQsBG4qq4LifzKv5zpz4ONtmCuKfFtWrJkBpBBna5Sba
 Q5A/lavcYc94BNdoAoXFQrXl46+jQ/0aF8Pb7Jt5a0rjNIL5lCx/5ljC0M/by7B3E7sY
 TVgQ==
X-Gm-Message-State: AFqh2kpQNxrVT9rB9aW85pPlwBFpjdOWHxS8Pf6z/V3Xo4Lpy+YshOop
 EqwHe0isPJOavNGhvv3ZrXax0Q1WDPjYQrSO
X-Google-Smtp-Source: AMrXdXvEQQAs8AGLsn7DM4muKRgC1LpPAVE5C2raTThWks08B3EULLbG6rX50fz4bEF3ouQ/9BpwpQ==
X-Received: by 2002:a17:903:442:b0:191:2c85:1371 with SMTP id
 iw2-20020a170903044200b001912c851371mr12269136plb.18.1671926246120; 
 Sat, 24 Dec 2022 15:57:26 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 04/43] tcg: Cleanup trailing whitespace
Date: Sat, 24 Dec 2022 15:56:41 -0800
Message-Id: <20221224235720.842093-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Remove whitespace at end of line, plus one place this also
highlights some missing braces.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                | 33 +++++++++++++++++----------------
 tcg/ppc/tcg-target.c.inc |  2 +-
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 436fcf6ebd..db64799e03 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -496,7 +496,7 @@ void *tcg_malloc_internal(TCGContext *s, int size)
 {
     TCGPool *p;
     int pool_size;
-    
+
     if (size > TCG_POOL_CHUNK_SIZE) {
         /* big malloc: insert a new pool (XXX: could optimize) */
         p = g_malloc(sizeof(TCGPool) + size);
@@ -517,10 +517,11 @@ void *tcg_malloc_internal(TCGContext *s, int size)
                 p = g_malloc(sizeof(TCGPool) + pool_size);
                 p->size = pool_size;
                 p->next = NULL;
-                if (s->pool_current) 
+                if (s->pool_current) {
                     s->pool_current->next = p;
-                else
+                } else {
                     s->pool_first = p;
+                }
             } else {
                 p = p->next;
             }
@@ -2949,8 +2950,8 @@ static void dump_regs(TCGContext *s)
 
     for(i = 0; i < TCG_TARGET_NB_REGS; i++) {
         if (s->reg_to_temp[i] != NULL) {
-            printf("%s: %s\n", 
-                   tcg_target_reg_names[i], 
+            printf("%s: %s\n",
+                   tcg_target_reg_names[i],
                    tcg_get_arg_str_ptr(s, buf, sizeof(buf), s->reg_to_temp[i]));
         }
     }
@@ -2967,7 +2968,7 @@ static void check_regs(TCGContext *s)
         ts = s->reg_to_temp[reg];
         if (ts != NULL) {
             if (ts->val_type != TEMP_VAL_REG || ts->reg != reg) {
-                printf("Inconsistency for register %s:\n", 
+                printf("Inconsistency for register %s:\n",
                        tcg_target_reg_names[reg]);
                 goto fail;
             }
@@ -3597,14 +3598,14 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     nb_iargs = def->nb_iargs;
 
     /* copy constants */
-    memcpy(new_args + nb_oargs + nb_iargs, 
+    memcpy(new_args + nb_oargs + nb_iargs,
            op->args + nb_oargs + nb_iargs,
            sizeof(TCGArg) * def->nb_cargs);
 
     i_allocated_regs = s->reserved_regs;
     o_allocated_regs = s->reserved_regs;
 
-    /* satisfy input constraints */ 
+    /* satisfy input constraints */
     for (k = 0; k < nb_iargs; k++) {
         TCGRegSet i_preferred_regs, o_preferred_regs;
 
@@ -3678,7 +3679,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         const_args[i] = 0;
         tcg_regset_set_reg(i_allocated_regs, reg);
     }
-    
+
     /* mark dead temporaries and free the associated registers */
     for (i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
         if (IS_DEAD_ARG(i)) {
@@ -3692,7 +3693,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         tcg_reg_alloc_bb_end(s, i_allocated_regs);
     } else {
         if (def->flags & TCG_OPF_CALL_CLOBBER) {
-            /* XXX: permit generic clobber register list ? */ 
+            /* XXX: permit generic clobber register list ? */
             for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
                 if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
                     tcg_reg_free(s, i, i_allocated_regs);
@@ -3704,7 +3705,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
                an exception. */
             sync_globals(s, i_allocated_regs);
         }
-        
+
         /* satisfy the output constraints */
         for(k = 0; k < nb_oargs; k++) {
             i = def->args_ct[k].sort_index;
@@ -3889,7 +3890,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 
     /* assign stack slots first */
     call_stack_size = (nb_iargs - nb_regs) * sizeof(tcg_target_long);
-    call_stack_size = (call_stack_size + TCG_TARGET_STACK_ALIGN - 1) & 
+    call_stack_size = (call_stack_size + TCG_TARGET_STACK_ALIGN - 1) &
         ~(TCG_TARGET_STACK_ALIGN - 1);
     allocate_args = (call_stack_size > TCG_STATIC_CALL_ARGS_SIZE);
     if (allocate_args) {
@@ -3914,7 +3915,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         stack_offset += sizeof(tcg_target_long);
 #endif
     }
-    
+
     /* assign input registers */
     allocated_regs = s->reserved_regs;
     for (i = 0; i < nb_regs; i++) {
@@ -3947,14 +3948,14 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
             tcg_regset_set_reg(allocated_regs, reg);
         }
     }
-    
+
     /* mark dead temporaries and free the associated registers */
     for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
         if (IS_DEAD_ARG(i)) {
             temp_dead(s, arg_temp(op->args[i]));
         }
     }
-    
+
     /* clobber call registers */
     for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
         if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
@@ -4395,7 +4396,7 @@ void tcg_dump_info(GString *buf)
                            (double)s->code_out_len / tb_div_count);
     g_string_append_printf(buf, "avg search data/TB  %0.1f\n",
                            (double)s->search_out_len / tb_div_count);
-    
+
     g_string_append_printf(buf, "cycles/op           %0.1f\n",
                            s->op_count ? (double)tot / s->op_count : 0);
     g_string_append_printf(buf, "cycles/in byte      %0.1f\n",
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e3dba47697..9e34df94ba 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -42,7 +42,7 @@
 # else
 #  error "Unknown ABI"
 # endif
-#endif 
+#endif
 
 #ifdef _CALL_SYSV
 # define TCG_TARGET_CALL_ALIGN_ARGS   1
-- 
2.34.1


