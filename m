Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F6120B4B6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 17:36:08 +0200 (CEST)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joqOc-0004bd-W4
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 11:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq4X-00037b-CI
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:15:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq4S-0006eN-L4
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:15:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id g18so9902872wrm.2
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 08:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IZ1By0aBWZl6mdMkdU84BXCqvgEwyk0TS8TpL6POa6w=;
 b=qeEqBQEaXQBJ2uZjZ1xPkSsqE/CVTnYaX8o7FpaRzPxLacqSwKV53LTa2pi2Uzu3RD
 jwalYsgLz8uS5tdaCcGNdhopvtyQvbtNJ7H6bz1/OEz9XoswKOujmfTJAJK5ErR1FUCM
 AHZgg8/jP2oz4M5nAdIfpGM579HC5QBQg8dIBpNaaVNv1WGowckfRQcZVTHxESlDYHY1
 4U34fyNTbU62tGOT7/OJwd//ZUSROawCnTVF/EX8k0LpGHJqe/Iz/LBmI6/WMT/eR13l
 s9Nt3i1TxdDp68jP5uTOzLJPtC7GhmyYP1wFLGmuNYrcdEfOIV5V5+XOHIZVlHV8alUU
 cweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZ1By0aBWZl6mdMkdU84BXCqvgEwyk0TS8TpL6POa6w=;
 b=izpezek9lMDW1Uz4ra4QWUXQtqF6dY0GHK40oXbb4TeDcjw7PRd4TinxBMoZgdzZa1
 Pq3M/SzNO7wNigj5BGc8vK3Q3rXug6V/B5tqxe4f5mFif1V5ZuXKfdCHIXpNixCHVcG/
 7Fw8APtk+7tVGnAlWLQ0wD/1fWByx95fzivyJxUnmfoYJzRvi6uHKVf5KbdPvUj8MCRi
 u0ouensEyuejDWVsaVav2vx5yk9tH6rMUO3BIq+i1jztT637gvLARO9+dv9vd9LLF8b6
 CuWMc9/ApJKd7WWQdBpx/tTWkFR4X9CeEDnH+cZVUIWGyj8xWDI4jnquP73qXPhLS98h
 mYqg==
X-Gm-Message-State: AOAM532P1IoDEa9s2J9NvHnFbPbAjxLFNWxdxHclG9KI920mLYaVDSXP
 oRuVWN8bt2m5nDIVpNmvqz9bDp+ZrLpJnw==
X-Google-Smtp-Source: ABdhPJwjilBQ4+F4fbEB31VUQN6nXi4M+jq8PjqmdyaXQSrkjHqg3WDObPt//GYuikDrDnw1grfQTg==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr4493321wrq.357.1593184514848; 
 Fri, 26 Jun 2020 08:15:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w13sm37838852wrr.67.2020.06.26.08.15.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:15:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/57] target/arm: Use mte_checkN for sve unpredicated stores
Date: Fri, 26 Jun 2020 16:14:08 +0100
Message-Id: <20200626151424.30117-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626151424.30117-1-peter.maydell@linaro.org>
References: <20200626151424.30117-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200626033144.790098-30-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 61 +++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 11e0dfc2100..4a613ca6892 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4432,10 +4432,12 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     int len_remain = len % 8;
     int nparts = len / 8 + ctpop8(len_remain);
     int midx = get_mem_index(s);
-    TCGv_i64 addr, t0;
+    TCGv_i64 dirty_addr, clean_addr, t0;
 
-    addr = tcg_temp_new_i64();
-    t0 = tcg_temp_new_i64();
+    dirty_addr = tcg_temp_new_i64();
+    tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    tcg_temp_free_i64(dirty_addr);
 
     /* Note that unpredicated load/store of vector/predicate registers
      * are defined as a stream of bytes, which equates to little-endian
@@ -4448,33 +4450,35 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
     if (nparts <= 4) {
         int i;
 
+        t0 = tcg_temp_new_i64();
         for (i = 0; i < len_align; i += 8) {
             tcg_gen_ld_i64(t0, cpu_env, vofs + i);
-            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+            tcg_gen_addi_i64(clean_addr, cpu_reg_sp(s, rn), 8);
         }
+        tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr t2, i = tcg_const_local_ptr(0);
+        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+
+        /* Copy the clean address into a local temp, live across the loop. */
+        t0 = clean_addr;
+        clean_addr = tcg_temp_local_new_i64();
+        tcg_gen_mov_i64(clean_addr, t0);
+        tcg_temp_free_i64(t0);
 
         gen_set_label(loop);
 
-        t2 = tcg_temp_new_ptr();
-        tcg_gen_add_ptr(t2, cpu_env, i);
-        tcg_gen_ld_i64(t0, t2, vofs);
-
-        /* Minimize the number of local temps that must be re-read from
-         * the stack each iteration.  Instead, re-compute values other
-         * than the loop counter.
-         */
-        tcg_gen_addi_ptr(t2, i, imm);
-        tcg_gen_extu_ptr_i64(addr, t2);
-        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
-        tcg_temp_free_ptr(t2);
-
-        tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEQ);
-
+        t0 = tcg_temp_new_i64();
+        tp = tcg_temp_new_ptr();
+        tcg_gen_add_ptr(tp, cpu_env, i);
+        tcg_gen_ld_i64(t0, tp, vofs);
         tcg_gen_addi_ptr(i, i, 8);
+        tcg_temp_free_ptr(tp);
+
+        tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEQ);
+        tcg_gen_addi_i64(clean_addr, clean_addr, 8);
+        tcg_temp_free_i64(t0);
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
@@ -4482,29 +4486,30 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     /* Predicate register stores can be any multiple of 2.  */
     if (len_remain) {
+        t0 = tcg_temp_new_i64();
         tcg_gen_ld_i64(t0, cpu_env, vofs + len_align);
-        tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + len_align);
 
         switch (len_remain) {
         case 2:
         case 4:
         case 8:
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LE | ctz32(len_remain));
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx,
+                                MO_LE | ctz32(len_remain));
             break;
 
         case 6:
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUL);
-            tcg_gen_addi_i64(addr, addr, 4);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUL);
+            tcg_gen_addi_i64(clean_addr, clean_addr, 4);
             tcg_gen_shri_i64(t0, t0, 32);
-            tcg_gen_qemu_st_i64(t0, addr, midx, MO_LEUW);
+            tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUW);
             break;
 
         default:
             g_assert_not_reached();
         }
+        tcg_temp_free_i64(t0);
     }
-    tcg_temp_free_i64(addr);
-    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(clean_addr);
 }
 
 static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
-- 
2.20.1


