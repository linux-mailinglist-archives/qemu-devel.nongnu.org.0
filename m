Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FDD6593D1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:25:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sP-0003tg-HB; Thu, 29 Dec 2022 19:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rX-00039L-1N
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rR-0002g0-UW
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:02 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso24359135pjp.4
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h02fHLgGdkElnqLtU641SqBxa4HCL3+Zlk8MhIy4nmY=;
 b=riueenV0BXRuRBtr59nSfBLagDfRF5zklEY5dP5wDfoRd4KO6z/XK9vAt6FeGzNBZE
 JmcDWEj8ZD54RXeQ7/BChZ20+LN6A3hg9k9DDffE/VnjIlUsGsFqCYl7YIit3TxRv5Hw
 RLrMTNOuwM1xGPmcfs/Ln/Va/UALrQAkuYpZxxF81CBDca1M1Lv8Kp5DzPVBfn6XhRkQ
 TtLkZabh2kHHEuP4zHcklqBTipUBt/YY83IhtrP1RL462FhzZ9iNArRsojzJLxP0RaK/
 rGBxd0s2H+QTKtAPWXsoZ05C7eSABorWj5Kw2xxyna+7COq1QVkByoo20Hk99+1XaY6N
 Gp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h02fHLgGdkElnqLtU641SqBxa4HCL3+Zlk8MhIy4nmY=;
 b=CkfUhJr6Wttu6wgy96Z/MeQ7hDJpCYqs39G/ymc02NJoU7ChhGqrQmiJQqUBwYPfq8
 rI0XRpHpgHNFNJe95nfrmev1BGb10zNOOAUb1UR7NWC+zgX+RaeCqD3USnAGSGi9RZjb
 iLIg0Ic25URWtrstOnmNnN0sSbA5lwP8r3EH1/eyhq+9M83tX9ktqO8lgBnNCUntwhDK
 upkUjWuBCMGdsCaZegVFmsdKO+LGBYrcgKTewvIC9Q8z9F2ecHmpIeL26sEtyT/dZphv
 mlrvI2RnMx9RL/JRCuwtAo+pENMZb/uI/ps9GfSLJb9uQzIR4Cqx7QUd8euHbMNZBZb/
 GgxQ==
X-Gm-Message-State: AFqh2ko++1obajCswc7XlDU9Zfed9Eflo1FIQw8LY4tcsHbGGWBXKeUg
 F5T0DWLSc22K3/yGu6xH3rW/XYvkXbtqwDSa
X-Google-Smtp-Source: AMrXdXs8O8RHQHar+z2QC2JIOQQNftggiMsVWgwgmAIPA2F+DCPTY7F2lFvM9xotrDKzl3F32vVlQA==
X-Received: by 2002:a17:902:e04b:b0:192:6b23:e38b with SMTP id
 x11-20020a170902e04b00b001926b23e38bmr20618490plx.24.1672358565934; 
 Thu, 29 Dec 2022 16:02:45 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 25/47] tcg: Allocate TCGTemp pairs in host memory order
Date: Thu, 29 Dec 2022 16:01:59 -0800
Message-Id: <20221230000221.2764875-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
index 28ab174f1b..c830b3756d 100644
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
@@ -4077,14 +4075,14 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
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


