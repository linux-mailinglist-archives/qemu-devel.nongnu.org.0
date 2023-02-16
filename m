Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D632698AF3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUe9-0007O2-1o; Wed, 15 Feb 2023 22:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe0-0007JK-EA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:13 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdw-00007S-5Y
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:10 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 w20-20020a17090a8a1400b00233d7314c1cso4433142pjn.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dkykD1onhYW4HMW3gM5JC5OMb89CFmlkMrHkTJXibCw=;
 b=faVvEc40B/Xsh+ofMEtcwOZGDNGp5A+Kf6UQJSXsd9p+fgPlJJepUZ7YtDpTN3RyqH
 8VKOOijRyMuRHVdvb1p0+t04xJqhY9LJ3cGejPe0PXelgUIZ6P/KlmLd9dtuw4uxP7oZ
 tGwQLVDOY7UBgXYvm+9ji4oVLV6LG+9LzS9M/xC8mcpBLnQMPRJer7J9u3/FEIDoPb6/
 UbXLcdEGmcIJuXe3y/z4hdsu/aRj6FXxBITuqV3X+WtiC2eHndrXQT2TM5UOSEEvg40R
 znlFu4PLYX6eug3wFUYXlwIIz+xWqJLylmHaJtOfIoB4LvXs5tpmOPaxE67UhOXVfKsn
 OoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dkykD1onhYW4HMW3gM5JC5OMb89CFmlkMrHkTJXibCw=;
 b=VHVYX5heDSVkZaofWkbviXjkB7gJkHVmWkV6oSe5oN2f5C28SlExzs3APYwc3xZrs9
 9vKnoOzEGBaM75jY2S2I4+Q4t/ZsAxBmDgIi67af/L4613WAHS/uTV30bcZVJQzeGeO2
 gHWYjgOErVFjRAW5OgIQkJXBkK5XfL3FvM7GxpyHoeywMheFFgCqlUhUefQ+JN9TBW3J
 KpNDJNQ1SxaiivrJUAeKpHT8IgJPjN29p+ELSw6uJUjXDxK7bYEJ2vkNCmOkvoIGybJ+
 YOxn1wn0GgkvMZH7+nvZQhNyRPSQuJa+9xgCYllI2/XBlN2DjwRDvv7sp/FFo0MIq9PA
 V48g==
X-Gm-Message-State: AO0yUKUshn9BE41QJp11drJIpiv/RGfdVvg696wA5Rf6W9jpDeo6YXdp
 mswYFaJ7sII3r83YIyk7rdhQou3DHOq/DxUl64E=
X-Google-Smtp-Source: AK7set/Izox9pk3Y4xP2P1569fxVf3F03eOShtRfthlNx12Y9gjxmz9RMoMfE8iA+Nm5GTfuEIiTuw==
X-Received: by 2002:a05:6a20:3ca6:b0:bc:50a6:5944 with SMTP id
 b38-20020a056a203ca600b000bc50a65944mr5416771pzj.38.1676516946636; 
 Wed, 15 Feb 2023 19:09:06 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 06/19] target/arm: Sink gen_mte_check1 into
 load/store_exclusive
Date: Wed, 15 Feb 2023 17:08:41 -1000
Message-Id: <20230216030854.1212208-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

No need to duplicate this check across multiple call sites.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 44 ++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b42e5848cc..cd86597172 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2514,11 +2514,16 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
  * races in multi-threaded linux-user and when MTTCG softmmu is
  * enabled.
  */
-static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
-                               TCGv_i64 addr, int size, bool is_pair)
+static void gen_load_exclusive(DisasContext *s, int rt, int rt2, int rn,
+                               int size, bool is_pair)
 {
     int idx = get_mem_index(s);
     MemOp memop = s->be_data;
+    TCGv_i64 dirty_addr, clean_addr;
+
+    s->is_ldex = true;
+    dirty_addr = cpu_reg_sp(s, rn);
+    clean_addr = gen_mte_check1(s, dirty_addr, false, rn != 31, size);
 
     g_assert(size <= 3);
     if (is_pair) {
@@ -2526,7 +2531,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         if (size == 2) {
             /* The pair must be single-copy atomic for the doubleword.  */
             memop |= MO_64 | MO_ALIGN;
-            tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
+            tcg_gen_qemu_ld_i64(cpu_exclusive_val, clean_addr, idx, memop);
             if (s->be_data == MO_LE) {
                 tcg_gen_extract_i64(cpu_reg(s, rt), cpu_exclusive_val, 0, 32);
                 tcg_gen_extract_i64(cpu_reg(s, rt2), cpu_exclusive_val, 32, 32);
@@ -2544,7 +2549,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
             TCGv_i128 t16 = tcg_temp_new_i128();
 
             memop |= MO_128 | MO_ALIGN_16 | MO_ATMAX_8;
-            tcg_gen_qemu_ld_i128(t16, addr, idx, memop);
+            tcg_gen_qemu_ld_i128(t16, clean_addr, idx, memop);
 
             tcg_gen_extr_i128_i64(cpu_exclusive_val, cpu_exclusive_high, t16);
             tcg_temp_free_i128(t16);
@@ -2559,14 +2564,14 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         }
     } else {
         memop |= size | MO_ALIGN;
-        tcg_gen_qemu_ld_i64(cpu_exclusive_val, addr, idx, memop);
+        tcg_gen_qemu_ld_i64(cpu_exclusive_val, clean_addr, idx, memop);
         tcg_gen_mov_i64(cpu_reg(s, rt), cpu_exclusive_val);
     }
-    tcg_gen_mov_i64(cpu_exclusive_addr, addr);
+    tcg_gen_mov_i64(cpu_exclusive_addr, clean_addr);
 }
 
 static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
-                                TCGv_i64 addr, int size, int is_pair)
+                                int rn, int size, int is_pair)
 {
     /* if (env->exclusive_addr == addr && env->exclusive_val == [addr]
      *     && (!is_pair || env->exclusive_high == [addr + datasize])) {
@@ -2582,9 +2587,12 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
      */
     TCGLabel *fail_label = gen_new_label();
     TCGLabel *done_label = gen_new_label();
-    TCGv_i64 tmp;
+    TCGv_i64 tmp, dirty_addr, clean_addr;
 
-    tcg_gen_brcond_i64(TCG_COND_NE, addr, cpu_exclusive_addr, fail_label);
+    dirty_addr = cpu_reg_sp(s, rn);
+    clean_addr = gen_mte_check1(s, dirty_addr, true, rn != 31, size);
+
+    tcg_gen_brcond_i64(TCG_COND_NE, clean_addr, cpu_exclusive_addr, fail_label);
 
     tmp = tcg_temp_new_i64();
     if (is_pair) {
@@ -2774,9 +2782,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
         }
-        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    true, rn != 31, size);
-        gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, false);
+        gen_store_exclusive(s, rs, rt, rt2, rn, size, false);
         return;
 
     case 0x4: /* LDXR */
@@ -2784,10 +2790,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (rn == 31) {
             gen_check_sp_alignment(s);
         }
-        clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                    false, rn != 31, size);
-        s->is_ldex = true;
-        gen_load_exclusive(s, rt, rt2, clean_addr, size, false);
+        gen_load_exclusive(s, rt, rt2, rn, size, false);
         if (is_lasr) {
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
         }
@@ -2839,9 +2842,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
             }
-            clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                        true, rn != 31, size);
-            gen_store_exclusive(s, rs, rt, rt2, clean_addr, size, true);
+            gen_store_exclusive(s, rs, rt, rt2, rn, size, true);
             return;
         }
         if (rt2 == 31
@@ -2858,10 +2859,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
             if (rn == 31) {
                 gen_check_sp_alignment(s);
             }
-            clean_addr = gen_mte_check1(s, cpu_reg_sp(s, rn),
-                                        false, rn != 31, size);
-            s->is_ldex = true;
-            gen_load_exclusive(s, rt, rt2, clean_addr, size, true);
+            gen_load_exclusive(s, rt, rt2, rn, size, true);
             if (is_lasr) {
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
             }
-- 
2.34.1


