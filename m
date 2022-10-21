Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC84607167
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:49:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmm9-0008FF-H2
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:49:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHp-0003NH-Qt
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHL-0003Cn-CH
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:15 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHJ-0005nF-Hu
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:15 -0400
Received: by mail-oi1-x235.google.com with SMTP id l5so2285992oif.7
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EHwHeycEZKxhFMLIOg3z57g+gF1F+0x/Q8WmhqVPueE=;
 b=sS4kO2CEQGwTftcR6KEwzs2iQZ2S1ynFvV97+lAU51z/5KvMR4lJWlKk7weZD366fq
 sUQv9S5cVSMVxTo3xfA5jLEVrKhNWslhAeEB5TfYSyKkTM7KxHK3dAyFpxONbfIpB89R
 WkQFTNZQXuJLm8GnpppWictLC9ZcOmmObH/5O1E4jy3/nHYd6Tv59ynperg7CW8FTvn7
 8TSujxQewWpFsyaRYlyZBXs/8R8CfnxPDPEf6+osiMBSK37rNtPKYba2JUvfIV+hoVwL
 W7iPElkAtFSU+6XCTQxOLdfA8IZRdlXwKEs9hGhCdUqcjNCG2R1y7vClweOk19RCW6D6
 etGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHwHeycEZKxhFMLIOg3z57g+gF1F+0x/Q8WmhqVPueE=;
 b=41gWq+d6fJbLUP55Keh/QQFGDFDwYJKjU/HMHlvg+JJ+KXAX/79Q6TfugTkWyqCbOY
 To4WFVKFvzD1x+yQRcduRRl4JRnF03S6XBKSo4xu11G1JkGjIuICw9+wolAOJmjYGuXl
 66OnYfkSEGhks/QZ0YiBwkMFAi2TbcVBr4luHQkanMMrZg84Iv2pelYIrEGe5E1JjXn9
 fzheYKd3zLW20tZ+d+KoltqepyrbUM4GTlBqKTF2Jh5q927Fe9ELBl64h2A70VqXkLwg
 sGlrGi/pFYw1pnXj9Z3Mg15UOjg3yofHvOHD5vt/1t5kaikX+z8V3CF1F+9XvPeZkYiZ
 Qe0A==
X-Gm-Message-State: ACrzQf3EnSdPh0I9n/+JkVaQYUI7shAfqBq35xJ8IfZKcfBmXl47hZ+B
 t54RSJMJ1uCz2as4HrU09Eenf24zWao/Z7ND
X-Google-Smtp-Source: AMsMyM64iR5zEmwIdU5eCzjN40F1h6q5FH8ug6K+Zq8MUF1MU2uurVlYvPK4aZWue4oM1ZN0FSqSzw==
X-Received: by 2002:a17:90b:1a88:b0:20d:8df0:ac63 with SMTP id
 ng8-20020a17090b1a8800b0020d8df0ac63mr52197225pjb.206.1666336621209; 
 Fri, 21 Oct 2022 00:17:01 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/36] tcg: Allocate TCGTemp pairs in host memory order
Date: Fri, 21 Oct 2022 17:15:26 +1000
Message-Id: <20221021071549.2398137-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
index 9fd58e46b9..73d8b33b06 100644
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


