Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF08B43BDA5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:13:01 +0200 (CEST)
Received: from localhost ([::1]:56168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVcq-0005je-VA
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZl-0002hk-Sq
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:49 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZj-0001u6-Qv
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:49 -0400
Received: by mail-pj1-x102c.google.com with SMTP id np13so613645pjb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bT4qv4vEHBY6BlW0dUJLyD6oXjbPcXHkc7wIjavuU8I=;
 b=xXZtpuGJLptPyRCVhgnBaLY6YAOi55k5ougx3ANc0X2Kw5Zse6PmCzZLa62NZFZz9j
 8kmGvCdgiWKz0Nc4xLNP7i2fOhgZ1rjRHQT2l0uEl5UZSnug+mFlfwoLpppneHW8/0R5
 +yq82wi8TDPuvMLJH4qX8DpqSxsjLepN5RQN1cQrpa4VzKVQDxjUWHeDOo6uhJ1nD7mh
 ILxdKhHvIe+SvcKJrVh4KXrGOnhMzunyZrfEkWboXMPYoEwY5nnIxj9Wh6X9aBAeybNE
 JLfWHYtE1QHtkvjwQz8SmNHJ4q5ePU1rEPf5t/Y/2OTOdormdL9a/Ib+6Fu632MEgFTQ
 ru8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bT4qv4vEHBY6BlW0dUJLyD6oXjbPcXHkc7wIjavuU8I=;
 b=PumJGeSequ6U8W0M4VHoKv8NgV8WrkKmWkTrsMNSF0n3z9H+GvD1UdFiWEXJci5aUk
 h96pdrtR8vPdyDbb6Bwwh3ZUZhly+iKpH7Gia3kJhGMfZ7KP5JU3zkI38ZZucCMO6uOP
 A8ps83wrS1766xnL3vOVlJGVvWpilwPAqT56A0eRawUqe3WEgGtNaH7np3fR8FHJmdZE
 k9ND+vVnLZPYFzwc8FveB74ggJFccgX+EzUQx3dEv3d6ipSDRFjFRbDf4thx/ZilQC/J
 FWObGCk1VnUKHOcbN16L8RqUcaAHyl1CHSs9ZiBsreRLEHwvnv0T4q7LvIMp0K8jWprU
 ewvw==
X-Gm-Message-State: AOAM5307bEOuzs7yKgUJ0+N2/1gcqLqUKY5q2+2qzd7lyOlRXt8oJPl7
 CQRLZ3nipBI1rE5V5JdfFdMa9R87vAApBw==
X-Google-Smtp-Source: ABdhPJyYufFBAjhtqyPVGVjGL0I78kLosWUA0I3CizhmEZ+FlJBJBR7Jd/kLZfOTHyOwKLVamXenvg==
X-Received: by 2002:a17:902:7001:b0:13d:d5b7:d06e with SMTP id
 y1-20020a170902700100b0013dd5b7d06emr25014406plk.61.1635289786157; 
 Tue, 26 Oct 2021 16:09:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/51] tcg/optimize: Rename "mask" to "z_mask"
Date: Tue, 26 Oct 2021 16:08:53 -0700
Message-Id: <20211026230943.1225890-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for tracking different masks by renaming this one.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 142 +++++++++++++++++++++++++------------------------
 1 file changed, 72 insertions(+), 70 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c239c3bd07..148e360fc6 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -41,7 +41,7 @@ typedef struct TempOptInfo {
     TCGTemp *prev_copy;
     TCGTemp *next_copy;
     uint64_t val;
-    uint64_t mask;
+    uint64_t z_mask;  /* mask bit is 0 if and only if value bit is 0 */
 } TempOptInfo;
 
 static inline TempOptInfo *ts_info(TCGTemp *ts)
@@ -81,7 +81,7 @@ static void reset_ts(TCGTemp *ts)
     ti->next_copy = ts;
     ti->prev_copy = ts;
     ti->is_const = false;
-    ti->mask = -1;
+    ti->z_mask = -1;
 }
 
 static void reset_temp(TCGArg arg)
@@ -111,14 +111,14 @@ static void init_ts_info(TCGTempSet *temps_used, TCGTemp *ts)
     if (ts->kind == TEMP_CONST) {
         ti->is_const = true;
         ti->val = ts->val;
-        ti->mask = ts->val;
+        ti->z_mask = ts->val;
         if (TCG_TARGET_REG_BITS > 32 && ts->type == TCG_TYPE_I32) {
             /* High bits of a 32-bit quantity are garbage.  */
-            ti->mask |= ~0xffffffffull;
+            ti->z_mask |= ~0xffffffffull;
         }
     } else {
         ti->is_const = false;
-        ti->mask = -1;
+        ti->z_mask = -1;
     }
 }
 
@@ -186,7 +186,7 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     const TCGOpDef *def;
     TempOptInfo *di;
     TempOptInfo *si;
-    uint64_t mask;
+    uint64_t z_mask;
     TCGOpcode new_op;
 
     if (ts_are_copies(dst_ts, src_ts)) {
@@ -210,12 +210,12 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     op->args[0] = dst;
     op->args[1] = src;
 
-    mask = si->mask;
+    z_mask = si->z_mask;
     if (TCG_TARGET_REG_BITS > 32 && new_op == INDEX_op_mov_i32) {
         /* High bits of the destination are now garbage.  */
-        mask |= ~0xffffffffull;
+        z_mask |= ~0xffffffffull;
     }
-    di->mask = mask;
+    di->z_mask = z_mask;
 
     if (src_ts->type == dst_ts->type) {
         TempOptInfo *ni = ts_info(si->next_copy);
@@ -621,7 +621,7 @@ void tcg_optimize(TCGContext *s)
     }
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
-        uint64_t mask, partmask, affected, tmp;
+        uint64_t z_mask, partmask, affected, tmp;
         int nb_oargs, nb_iargs;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def = &tcg_op_defs[opc];
@@ -855,170 +855,172 @@ void tcg_optimize(TCGContext *s)
 
         /* Simplify using known-zero bits. Currently only ops with a single
            output argument is supported. */
-        mask = -1;
+        z_mask = -1;
         affected = -1;
         switch (opc) {
         CASE_OP_32_64(ext8s):
-            if ((arg_info(op->args[1])->mask & 0x80) != 0) {
+            if ((arg_info(op->args[1])->z_mask & 0x80) != 0) {
                 break;
             }
             QEMU_FALLTHROUGH;
         CASE_OP_32_64(ext8u):
-            mask = 0xff;
+            z_mask = 0xff;
             goto and_const;
         CASE_OP_32_64(ext16s):
-            if ((arg_info(op->args[1])->mask & 0x8000) != 0) {
+            if ((arg_info(op->args[1])->z_mask & 0x8000) != 0) {
                 break;
             }
             QEMU_FALLTHROUGH;
         CASE_OP_32_64(ext16u):
-            mask = 0xffff;
+            z_mask = 0xffff;
             goto and_const;
         case INDEX_op_ext32s_i64:
-            if ((arg_info(op->args[1])->mask & 0x80000000) != 0) {
+            if ((arg_info(op->args[1])->z_mask & 0x80000000) != 0) {
                 break;
             }
             QEMU_FALLTHROUGH;
         case INDEX_op_ext32u_i64:
-            mask = 0xffffffffU;
+            z_mask = 0xffffffffU;
             goto and_const;
 
         CASE_OP_32_64(and):
-            mask = arg_info(op->args[2])->mask;
+            z_mask = arg_info(op->args[2])->z_mask;
             if (arg_is_const(op->args[2])) {
         and_const:
-                affected = arg_info(op->args[1])->mask & ~mask;
+                affected = arg_info(op->args[1])->z_mask & ~z_mask;
             }
-            mask = arg_info(op->args[1])->mask & mask;
+            z_mask = arg_info(op->args[1])->z_mask & z_mask;
             break;
 
         case INDEX_op_ext_i32_i64:
-            if ((arg_info(op->args[1])->mask & 0x80000000) != 0) {
+            if ((arg_info(op->args[1])->z_mask & 0x80000000) != 0) {
                 break;
             }
             QEMU_FALLTHROUGH;
         case INDEX_op_extu_i32_i64:
             /* We do not compute affected as it is a size changing op.  */
-            mask = (uint32_t)arg_info(op->args[1])->mask;
+            z_mask = (uint32_t)arg_info(op->args[1])->z_mask;
             break;
 
         CASE_OP_32_64(andc):
             /* Known-zeros does not imply known-ones.  Therefore unless
                op->args[2] is constant, we can't infer anything from it.  */
             if (arg_is_const(op->args[2])) {
-                mask = ~arg_info(op->args[2])->mask;
+                z_mask = ~arg_info(op->args[2])->z_mask;
                 goto and_const;
             }
             /* But we certainly know nothing outside args[1] may be set. */
-            mask = arg_info(op->args[1])->mask;
+            z_mask = arg_info(op->args[1])->z_mask;
             break;
 
         case INDEX_op_sar_i32:
             if (arg_is_const(op->args[2])) {
                 tmp = arg_info(op->args[2])->val & 31;
-                mask = (int32_t)arg_info(op->args[1])->mask >> tmp;
+                z_mask = (int32_t)arg_info(op->args[1])->z_mask >> tmp;
             }
             break;
         case INDEX_op_sar_i64:
             if (arg_is_const(op->args[2])) {
                 tmp = arg_info(op->args[2])->val & 63;
-                mask = (int64_t)arg_info(op->args[1])->mask >> tmp;
+                z_mask = (int64_t)arg_info(op->args[1])->z_mask >> tmp;
             }
             break;
 
         case INDEX_op_shr_i32:
             if (arg_is_const(op->args[2])) {
                 tmp = arg_info(op->args[2])->val & 31;
-                mask = (uint32_t)arg_info(op->args[1])->mask >> tmp;
+                z_mask = (uint32_t)arg_info(op->args[1])->z_mask >> tmp;
             }
             break;
         case INDEX_op_shr_i64:
             if (arg_is_const(op->args[2])) {
                 tmp = arg_info(op->args[2])->val & 63;
-                mask = (uint64_t)arg_info(op->args[1])->mask >> tmp;
+                z_mask = (uint64_t)arg_info(op->args[1])->z_mask >> tmp;
             }
             break;
 
         case INDEX_op_extrl_i64_i32:
-            mask = (uint32_t)arg_info(op->args[1])->mask;
+            z_mask = (uint32_t)arg_info(op->args[1])->z_mask;
             break;
         case INDEX_op_extrh_i64_i32:
-            mask = (uint64_t)arg_info(op->args[1])->mask >> 32;
+            z_mask = (uint64_t)arg_info(op->args[1])->z_mask >> 32;
             break;
 
         CASE_OP_32_64(shl):
             if (arg_is_const(op->args[2])) {
                 tmp = arg_info(op->args[2])->val & (TCG_TARGET_REG_BITS - 1);
-                mask = arg_info(op->args[1])->mask << tmp;
+                z_mask = arg_info(op->args[1])->z_mask << tmp;
             }
             break;
 
         CASE_OP_32_64(neg):
             /* Set to 1 all bits to the left of the rightmost.  */
-            mask = -(arg_info(op->args[1])->mask
-                     & -arg_info(op->args[1])->mask);
+            z_mask = -(arg_info(op->args[1])->z_mask
+                       & -arg_info(op->args[1])->z_mask);
             break;
 
         CASE_OP_32_64(deposit):
-            mask = deposit64(arg_info(op->args[1])->mask,
-                             op->args[3], op->args[4],
-                             arg_info(op->args[2])->mask);
+            z_mask = deposit64(arg_info(op->args[1])->z_mask,
+                               op->args[3], op->args[4],
+                               arg_info(op->args[2])->z_mask);
             break;
 
         CASE_OP_32_64(extract):
-            mask = extract64(arg_info(op->args[1])->mask,
-                             op->args[2], op->args[3]);
+            z_mask = extract64(arg_info(op->args[1])->z_mask,
+                               op->args[2], op->args[3]);
             if (op->args[2] == 0) {
-                affected = arg_info(op->args[1])->mask & ~mask;
+                affected = arg_info(op->args[1])->z_mask & ~z_mask;
             }
             break;
         CASE_OP_32_64(sextract):
-            mask = sextract64(arg_info(op->args[1])->mask,
-                              op->args[2], op->args[3]);
-            if (op->args[2] == 0 && (tcg_target_long)mask >= 0) {
-                affected = arg_info(op->args[1])->mask & ~mask;
+            z_mask = sextract64(arg_info(op->args[1])->z_mask,
+                                op->args[2], op->args[3]);
+            if (op->args[2] == 0 && (tcg_target_long)z_mask >= 0) {
+                affected = arg_info(op->args[1])->z_mask & ~z_mask;
             }
             break;
 
         CASE_OP_32_64(or):
         CASE_OP_32_64(xor):
-            mask = arg_info(op->args[1])->mask | arg_info(op->args[2])->mask;
+            z_mask = arg_info(op->args[1])->z_mask
+                   | arg_info(op->args[2])->z_mask;
             break;
 
         case INDEX_op_clz_i32:
         case INDEX_op_ctz_i32:
-            mask = arg_info(op->args[2])->mask | 31;
+            z_mask = arg_info(op->args[2])->z_mask | 31;
             break;
 
         case INDEX_op_clz_i64:
         case INDEX_op_ctz_i64:
-            mask = arg_info(op->args[2])->mask | 63;
+            z_mask = arg_info(op->args[2])->z_mask | 63;
             break;
 
         case INDEX_op_ctpop_i32:
-            mask = 32 | 31;
+            z_mask = 32 | 31;
             break;
         case INDEX_op_ctpop_i64:
-            mask = 64 | 63;
+            z_mask = 64 | 63;
             break;
 
         CASE_OP_32_64(setcond):
         case INDEX_op_setcond2_i32:
-            mask = 1;
+            z_mask = 1;
             break;
 
         CASE_OP_32_64(movcond):
-            mask = arg_info(op->args[3])->mask | arg_info(op->args[4])->mask;
+            z_mask = arg_info(op->args[3])->z_mask
+                   | arg_info(op->args[4])->z_mask;
             break;
 
         CASE_OP_32_64(ld8u):
-            mask = 0xff;
+            z_mask = 0xff;
             break;
         CASE_OP_32_64(ld16u):
-            mask = 0xffff;
+            z_mask = 0xffff;
             break;
         case INDEX_op_ld32u_i64:
-            mask = 0xffffffffu;
+            z_mask = 0xffffffffu;
             break;
 
         CASE_OP_32_64(qemu_ld):
@@ -1026,43 +1028,43 @@ void tcg_optimize(TCGContext *s)
                 MemOpIdx oi = op->args[nb_oargs + nb_iargs];
                 MemOp mop = get_memop(oi);
                 if (!(mop & MO_SIGN)) {
-                    mask = (2ULL << ((8 << (mop & MO_SIZE)) - 1)) - 1;
+                    z_mask = (2ULL << ((8 << (mop & MO_SIZE)) - 1)) - 1;
                 }
             }
             break;
 
         CASE_OP_32_64(bswap16):
-            mask = arg_info(op->args[1])->mask;
-            if (mask <= 0xffff) {
+            z_mask = arg_info(op->args[1])->z_mask;
+            if (z_mask <= 0xffff) {
                 op->args[2] |= TCG_BSWAP_IZ;
             }
-            mask = bswap16(mask);
+            z_mask = bswap16(z_mask);
             switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
             case TCG_BSWAP_OZ:
                 break;
             case TCG_BSWAP_OS:
-                mask = (int16_t)mask;
+                z_mask = (int16_t)z_mask;
                 break;
             default: /* undefined high bits */
-                mask |= MAKE_64BIT_MASK(16, 48);
+                z_mask |= MAKE_64BIT_MASK(16, 48);
                 break;
             }
             break;
 
         case INDEX_op_bswap32_i64:
-            mask = arg_info(op->args[1])->mask;
-            if (mask <= 0xffffffffu) {
+            z_mask = arg_info(op->args[1])->z_mask;
+            if (z_mask <= 0xffffffffu) {
                 op->args[2] |= TCG_BSWAP_IZ;
             }
-            mask = bswap32(mask);
+            z_mask = bswap32(z_mask);
             switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
             case TCG_BSWAP_OZ:
                 break;
             case TCG_BSWAP_OS:
-                mask = (int32_t)mask;
+                z_mask = (int32_t)z_mask;
                 break;
             default: /* undefined high bits */
-                mask |= MAKE_64BIT_MASK(32, 32);
+                z_mask |= MAKE_64BIT_MASK(32, 32);
                 break;
             }
             break;
@@ -1074,9 +1076,9 @@ void tcg_optimize(TCGContext *s)
         /* 32-bit ops generate 32-bit results.  For the result is zero test
            below, we can ignore high bits, but for further optimizations we
            need to record that the high bits contain garbage.  */
-        partmask = mask;
+        partmask = z_mask;
         if (!(def->flags & TCG_OPF_64BIT)) {
-            mask |= ~(tcg_target_ulong)0xffffffffu;
+            z_mask |= ~(tcg_target_ulong)0xffffffffu;
             partmask &= 0xffffffffu;
             affected &= 0xffffffffu;
         }
@@ -1472,7 +1474,7 @@ void tcg_optimize(TCGContext *s)
                    vs the high word of the input.  */
             do_setcond_high:
                 reset_temp(op->args[0]);
-                arg_info(op->args[0])->mask = 1;
+                arg_info(op->args[0])->z_mask = 1;
                 op->opc = INDEX_op_setcond_i32;
                 op->args[1] = op->args[2];
                 op->args[2] = op->args[4];
@@ -1498,7 +1500,7 @@ void tcg_optimize(TCGContext *s)
                 }
             do_setcond_low:
                 reset_temp(op->args[0]);
-                arg_info(op->args[0])->mask = 1;
+                arg_info(op->args[0])->z_mask = 1;
                 op->opc = INDEX_op_setcond_i32;
                 op->args[2] = op->args[3];
                 op->args[3] = op->args[5];
@@ -1543,7 +1545,7 @@ void tcg_optimize(TCGContext *s)
             /* Default case: we know nothing about operation (or were unable
                to compute the operation result) so no propagation is done.
                We trash everything if the operation is the end of a basic
-               block, otherwise we only trash the output args.  "mask" is
+               block, otherwise we only trash the output args.  "z_mask" is
                the non-zero bits mask for the first output arg.  */
             if (def->flags & TCG_OPF_BB_END) {
                 memset(&temps_used, 0, sizeof(temps_used));
@@ -1554,7 +1556,7 @@ void tcg_optimize(TCGContext *s)
                     /* Save the corresponding known-zero bits mask for the
                        first output argument (only one supported so far). */
                     if (i == 0) {
-                        arg_info(op->args[i])->mask = mask;
+                        arg_info(op->args[i])->z_mask = z_mask;
                     }
                 }
             }
-- 
2.25.1


