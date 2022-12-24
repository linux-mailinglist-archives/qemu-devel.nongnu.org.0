Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8227655BEE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:13:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP1-0002mQ-DF; Sat, 24 Dec 2022 18:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOk-0002O8-9D
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:51 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOi-0006L5-2e
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:49 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 u4-20020a17090a518400b00223f7eba2c4so7980518pjh.5
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7stba5MTNOn1+WsG6fk76btOm9hVHehrjjbFHXB3kBc=;
 b=ysibz+0g/fOp5XTJCMciuWFXemxX2UceDlm3dL7N26FaCVK+WeETlarc6Gztx6H9+j
 MuGAxvhaGe85a4qo28mkh81i3s6bnQ9ybQOFxylavoLMUiVmP72LnZ2Nr3lHGPmem9qV
 1X5zBOYftBXMVOlD7zAlk11amcQhKel1bGOb3JHgup6UimAvkKS0RQkWm2XdzJY0J+IS
 vzAt4hlobqqa7DbiE0Ka60bhx0xWiqE65kBBEbe8lUNEVIu1uK+DKUsPRIB3PQKLBCRm
 pETgeto6kY6Z8/DYGn55v4szbmJusDtzC0OHZkGpsHH77PcNnKvCXqgkzsAt/IE5b/OD
 RR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7stba5MTNOn1+WsG6fk76btOm9hVHehrjjbFHXB3kBc=;
 b=ngNdnPw0tWHra1wNI3ErWQixxg2GPhIB9Hkl80czF35sZ//dIqLXLFS7h3zkfloC96
 YmsMMOr09ft5r+9bopqbGyAbgcsyaHm+FPbFUTyMOu5+a4L6IJ6xGcHlZIdO4GhNNz62
 FC8S/Q7OUIJHfaKsefPyBf5ehPSkTo36ahgLiBhlLuO44HY4K/aOJXkYuqaWG+5oDJxb
 xpyMmOtfDWuO78sC367OuxU23FdPxgNv9dJotjdTKTA9OsTuoNkoVc02RQrGjvlaJ6Dn
 NcqetVy+dnzPOp6Yw47OXFkTFise3MD3v5fJxRi7Hy5y+byhSnEBW1Z/JuAApgmbVgTR
 Sufw==
X-Gm-Message-State: AFqh2ko4jrS8x3y+hd4cz45sGJ8M8PcMiTDMvERo/gkG18yB/Y79OzU8
 eGVzXVsRnldf/N3vHI+0IupK9nrgKNhzfoez
X-Google-Smtp-Source: AMrXdXv4oYPJ+PVCDrAgl6S6Tg/Hsf+qUB/muhGCRanEXLMLF/bVvihKQ6Wmz1awX8XEZcKcgzBuLQ==
X-Received: by 2002:a17:902:e543:b0:189:a6b4:91ed with SMTP id
 n3-20020a170902e54300b00189a6b491edmr21479545plf.17.1671926266243; 
 Sat, 24 Dec 2022 15:57:46 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 25/43] tcg: Allocate TCGTemp pairs in host memory order
Date: Sat, 24 Dec 2022 15:57:02 -0800
Message-Id: <20221224235720.842093-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Allocate the first of a pair at the lower address, and the
second of a pair at the higher address.  This will make it
easier to find the beginning of the larger memory block.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  4 ++--
 tcg/tcg.c          | 58 ++++++++++++++++++++++------------------------
 2 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index a9ea27f67a..2c06b5116a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -62,11 +62,11 @@ static inline unsigned tcg_call_flags(TCGOp *op)
 #if TCG_TARGET_REG_BITS == 32
 static inline TCGv_i32 TCGV_LOW(TCGv_i64 t)
 {
-    return temp_tcgv_i32(tcgv_i64_temp(t));
+    return temp_tcgv_i32(tcgv_i64_temp(t) + HOST_BIG_ENDIAN);
 }
 static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
 {
-    return temp_tcgv_i32(tcgv_i64_temp(t) + 1);
+    return temp_tcgv_i32(tcgv_i64_temp(t) + !HOST_BIG_ENDIAN);
 }
 #else
 extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 36a33a122c..dbf4e864eb 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -887,10 +887,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
     TCGContext *s = tcg_ctx;
     TCGTemp *base_ts = tcgv_ptr_temp(base);
     TCGTemp *ts = tcg_global_alloc(s);
-    int indirect_reg = 0, bigendian = 0;
-#if HOST_BIG_ENDIAN
-    bigendian = 1;
-#endif
+    int indirect_reg = 0;
 
     switch (base_ts->kind) {
     case TEMP_FIXED:
@@ -916,7 +913,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts->indirect_reg = indirect_reg;
         ts->mem_allocated = 1;
         ts->mem_base = base_ts;
-        ts->mem_offset = offset + bigendian * 4;
+        ts->mem_offset = offset;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_0");
         ts->name = strdup(buf);
@@ -927,7 +924,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts2->indirect_reg = indirect_reg;
         ts2->mem_allocated = 1;
         ts2->mem_base = base_ts;
-        ts2->mem_offset = offset + (1 - bigendian) * 4;
+        ts2->mem_offset = offset + 4;
         ts2->temp_subindex = 1;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_1");
@@ -1073,37 +1070,43 @@ TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
 
     ts = g_hash_table_lookup(h, &val);
     if (ts == NULL) {
+        int64_t *val_ptr;
+
         ts = tcg_temp_alloc(s);
 
         if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
             TCGTemp *ts2 = tcg_temp_alloc(s);
 
+            tcg_debug_assert(ts2 == ts + 1);
+
             ts->base_type = TCG_TYPE_I64;
             ts->type = TCG_TYPE_I32;
             ts->kind = TEMP_CONST;
             ts->temp_allocated = 1;
-            /*
-             * Retain the full value of the 64-bit constant in the low
-             * part, so that the hash table works.  Actual uses will
-             * truncate the value to the low part.
-             */
-            ts->val = val;
 
-            tcg_debug_assert(ts2 == ts + 1);
             ts2->base_type = TCG_TYPE_I64;
             ts2->type = TCG_TYPE_I32;
             ts2->kind = TEMP_CONST;
             ts2->temp_allocated = 1;
             ts2->temp_subindex = 1;
-            ts2->val = val >> 32;
+
+            /*
+             * Retain the full value of the 64-bit constant in the low
+             * part, so that the hash table works.  Actual uses will
+             * truncate the value to the low part.
+             */
+            ts[HOST_BIG_ENDIAN].val = val;
+            ts[!HOST_BIG_ENDIAN].val = val >> 32;
+            val_ptr = &ts[HOST_BIG_ENDIAN].val;
         } else {
             ts->base_type = type;
             ts->type = type;
             ts->kind = TEMP_CONST;
             ts->temp_allocated = 1;
             ts->val = val;
+            val_ptr = &ts->val;
         }
-        g_hash_table_insert(h, &ts->val, ts);
+        g_hash_table_insert(h, val_ptr, ts);
     }
 
     return ts;
@@ -1515,13 +1518,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     pi = 0;
     if (ret != NULL) {
         if (TCG_TARGET_REG_BITS < 64 && (typemask & 6) == dh_typecode_i64) {
-#if HOST_BIG_ENDIAN
-            op->args[pi++] = temp_arg(ret + 1);
-            op->args[pi++] = temp_arg(ret);
-#else
             op->args[pi++] = temp_arg(ret);
             op->args[pi++] = temp_arg(ret + 1);
-#endif
             nb_rets = 2;
         } else {
             op->args[pi++] = temp_arg(ret);
@@ -1555,8 +1553,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         }
 
         if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
-            op->args[pi++] = temp_arg(args[i] + HOST_BIG_ENDIAN);
-            op->args[pi++] = temp_arg(args[i] + !HOST_BIG_ENDIAN);
+            op->args[pi++] = temp_arg(args[i]);
+            op->args[pi++] = temp_arg(args[i] + 1);
             real_args += 2;
             continue;
         }
@@ -4074,14 +4072,14 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
     }
 
     /* If the two inputs form one 64-bit value, try dupm_vec. */
-    if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
-        temp_sync(s, itsl, s->reserved_regs, 0, 0);
-        temp_sync(s, itsh, s->reserved_regs, 0, 0);
-#if HOST_BIG_ENDIAN
-        TCGTemp *its = itsh;
-#else
-        TCGTemp *its = itsl;
-#endif
+    if (itsl->temp_subindex == HOST_BIG_ENDIAN &&
+        itsh->temp_subindex == !HOST_BIG_ENDIAN &&
+        itsl == itsh + (HOST_BIG_ENDIAN ? 1 : -1)) {
+        TCGTemp *its = itsl - HOST_BIG_ENDIAN;
+
+        temp_sync(s, its + 0, s->reserved_regs, 0, 0);
+        temp_sync(s, its + 1, s->reserved_regs, 0, 0);
+
         if (tcg_out_dupm_vec(s, vtype, MO_64, ots->reg,
                              its->mem_base->reg, its->mem_offset)) {
             goto done;
-- 
2.34.1


