Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF89B625555
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:31:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfn-0006PZ-DN; Fri, 11 Nov 2022 02:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfT-00068t-Ed
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:39 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfR-0007vX-MB
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:39 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so7067281pjs.4
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gE52zlaTPttNRny+uxuw2pEYfjL4jf4kiCaqy2SgrWY=;
 b=a5ISbABuYbkfByqD3p6teKxGXhZwMuuHAjRKwfPhQDXzKLRo6lv32SZLB7eExe1neQ
 oOooezQO+PeBHXmuqo1twpdJ6BEn8bKblXaRhPtWNfgBhRBeIcT5khKbExNn8BnmI6mj
 TDXB4RpiQluiZS6gnZQhLZq9qRBlxDxh+NNvhT+/OKbUF0l/tuMNkLBjzUOWz34nBVwu
 wog9qZnePE0tJOKfjlYcMS/jrdC1KGRn3yAhL34r0400dNTSZB9C3nVNldHAEFeJyMyy
 NIAXnyPA949G1i4ALcr2JpGShOcVna/UMY61qleNiwYCezi03mP7EnDfD1EnHKB66YEf
 i8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gE52zlaTPttNRny+uxuw2pEYfjL4jf4kiCaqy2SgrWY=;
 b=CdS+z9SXcTeljcr9SIYB/tmOgjQaO2e5V7YuaJR0ftQDb5eA1vO5HpWTEBzX12HomT
 QzsUiN+UeWBeU/BAEjAt5G/fYn3wfdy4MDCWDTDCxgm+W1i9ce3ydUR13z/FWCvvhhR3
 MgbEu92lcRJxl5oWVXxmA4fNgE4pVlloy4MIA66lWqTdT9m1BNB0+9q6ibJX/u0f1ACf
 Ewm13qWJt7u/rHubuWVDp/7kyzsKsRi8q0ycuuaLnskAqr1oMEcd2aaLY/6rmryNtvvP
 11I6kJJusNdrz87mgJVB4QwW6O/bsarvcp8gjqVsyUZBDRBxsh1RH2uKEJ08f2kEH0Cb
 PyRg==
X-Gm-Message-State: ANoB5pnF66NsNDQNmn7lv5LT87OKDf0Pv7upPOd6G2YJHdn0c+G7CGtE
 K23x1DxQ09Q2+6gysiVFtuC0kCXRf8f2hBkZ
X-Google-Smtp-Source: AA0mqf6QtlvJMVfWBEysp1Vq5Kp8TyUdgH3LE62ia1xszjUQ+Ng13dRkcH+8Hk4FrVKyn+wCR3R+DQ==
X-Received: by 2002:a17:902:6b05:b0:186:e568:3442 with SMTP id
 o5-20020a1709026b0500b00186e5683442mr1416384plk.56.1668152496206; 
 Thu, 10 Nov 2022 23:41:36 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 12/45] tcg: Allocate TCGTemp pairs in host memory
 order
Date: Fri, 11 Nov 2022 17:40:28 +1000
Message-Id: <20221111074101.2069454-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
index 583677a1c4..f9315d00fc 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -886,10 +886,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
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
@@ -915,7 +912,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts->indirect_reg = indirect_reg;
         ts->mem_allocated = 1;
         ts->mem_base = base_ts;
-        ts->mem_offset = offset + bigendian * 4;
+        ts->mem_offset = offset;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_0");
         ts->name = strdup(buf);
@@ -926,7 +923,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
         ts2->indirect_reg = indirect_reg;
         ts2->mem_allocated = 1;
         ts2->mem_base = base_ts;
-        ts2->mem_offset = offset + (1 - bigendian) * 4;
+        ts2->mem_offset = offset + 4;
         ts2->temp_subindex = 1;
         pstrcpy(buf, sizeof(buf), name);
         pstrcat(buf, sizeof(buf), "_1");
@@ -1072,37 +1069,43 @@ TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
 
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
@@ -1514,13 +1517,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
@@ -1554,8 +1552,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         }
 
         if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
-            op->args[pi++] = temp_arg(args[i] + HOST_BIG_ENDIAN);
-            op->args[pi++] = temp_arg(args[i] + !HOST_BIG_ENDIAN);
+            op->args[pi++] = temp_arg(args[i]);
+            op->args[pi++] = temp_arg(args[i] + 1);
             real_args += 2;
             continue;
         }
@@ -4116,14 +4114,14 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
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


