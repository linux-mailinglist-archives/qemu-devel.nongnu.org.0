Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8160F6593C2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2r7-0002zr-3p; Thu, 29 Dec 2022 19:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r2-0002xL-Qo
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:33 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2qz-0002fL-K6
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:32 -0500
Received: by mail-pl1-x633.google.com with SMTP id b2so20356168pld.7
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6tqpC+7m8/ICgyOyiYZ2RwX4BgqdHMMEgREVC9PV0w=;
 b=pcpBQUP9msqHHX2nnKvyi14sk/x1tkuompJzWhZhV5/folRce6yvLZZfCbVIuwbLM8
 eKipgL5YdDzxIAtn+ICALh1zcF7mCT4TzhxYv8oGu4/FMn7WDMn9/zBqSin9j0DaPAtA
 5+iD+CwI/7/CY0F1HfE0SvZW3oxSvfNWTjqsk3P1foCSNcoiCCVzdDSWBPiBw/VnwZk8
 20q8O4ZKVZ4simRfe97F7P+9tmeUOL6s3Jt7ztSbe1LNNYAW4q9pNa6vAXxtsJfaGxt3
 RGOfDgESNiyYZM25m8n2UXwpHOX6tO+BbfMu9q81sMFEVHa9NsQVeDyqk2Gkagdc6knW
 /pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6tqpC+7m8/ICgyOyiYZ2RwX4BgqdHMMEgREVC9PV0w=;
 b=Xv6/CBghCdL3/lx9v+8De3yA8xynuDSwptzoyHBBbsfEB+s0QMDNHxmFJTeVaocHfV
 rLzkClk922g+R1mxTnjuoFm59bcwUxo2x+jYKsTR7iODy8p3pHh4VpxhrbbIeJ/vYKP7
 gdf7SkH584LhL0+tUn6rlj0cEJE+9B5/CI7/gQWlSIsr4mNRlmhau2rjb9OsjXRbzNrj
 xOPGM5xjdGrNmjFC0hPSZCDQShgC+RIm0DqmAOIXBaBXMWly9pXydS8Hh4q781olgfBK
 iIQ3IAd8qVM2vN1RDAuxt5xtbsTYhlRk7HFcfKoErvtQirVvPfevNX1m3vx5msVT7aLN
 wpxg==
X-Gm-Message-State: AFqh2kraJgXE/iRggt6Rf8nokA7TGvV1VUlY7u3eppZSvJmGUGlbDmee
 5726krds/MJWPv1ZuqTRGUeyZ2Zlqpp4lzsX
X-Google-Smtp-Source: AMrXdXtugW6YwgqvLg7UuwAPvkBoJB+LIiBO9eHF4DAkpMf9F+X6fS2dgCHBO7RagW8mlu2m64QC6Q==
X-Received: by 2002:a17:902:ce10:b0:189:af28:fd8d with SMTP id
 k16-20020a170902ce1000b00189af28fd8dmr38649549plg.1.1672358546843; 
 Thu, 29 Dec 2022 16:02:26 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/47] tcg: Cleanup trailing whitespace
Date: Thu, 29 Dec 2022 16:01:38 -0800
Message-Id: <20221230000221.2764875-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


