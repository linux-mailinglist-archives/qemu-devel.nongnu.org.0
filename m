Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F284435D7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:40:52 +0100 (CET)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyiJ-0004nZ-MP
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTR-0005kw-6d
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:29 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:36827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTO-0004E2-RO
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:28 -0400
Received: by mail-qk1-x733.google.com with SMTP id i9so19990326qki.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c0LVKpqK5ZdwRcDR8+puDfp4OkQJywpu1yKfC81QITE=;
 b=m/ouuqdXtss4rsg58+7HV77K/xg9i/gjZdeTBN/m+EV84AEeB9fgcl5l2h0XE3xy1V
 mRnxTg7e5jHpF4I4IYXO1TvlEWeL9R6Y7xEubMUE94MTE7m0jRLytDPO5vH6TvlR3N33
 em4j3rS0ImjDMUCqPxKImSKY9QrG2yoiERJBfT5FMv22Xp9UZBPsfGSegWTpp7J/EQAR
 wND2mVlqUYIHIenvixDhqlHNdf/vVlr59Ykvy5+0BSjdzUEhSB9GyUfpov1SoY8yuOpr
 H4Pt0hiHetEItYJ9mPte8XH3gmJde6+rWUlpk+KeSVgCg7MHytokrv/f7F5T5AC0OoM9
 M/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c0LVKpqK5ZdwRcDR8+puDfp4OkQJywpu1yKfC81QITE=;
 b=AY55KEdSXqk9I9EQWFRo8shOna65BT/agvk/jgyN41QVLNlRZ4TztiLDHEQ34lT3Dy
 8rDet8dzmwdOkLoNblCE1CC11WECn6Hs6o0tJcyki9O6KsDyYeKEV7n/69IBflmsSybj
 vK9xbO6042cPZg9rLLR5kdIYtFIAXdYuArsFBruJV/JHQMZAQ/9AVRSTmbsxF1rIcVS3
 CVv1V/HPh48V6IO0TxeGSC3I1Q0QIymnb6oreinpp1MYHRomhkkR/eE01YfLPqfTZCbH
 tJnxhMRSOJKFiz2c+91CLhBv5ZHIheqJl6BEMWxQg5P29+GJ4SWPz6VxdvZuFcSQE9nD
 v9Sw==
X-Gm-Message-State: AOAM532tRO3wyJbN+ZXK5j2CLko27faYiUQfyB8b6e5+Nu4t6PJJXSPQ
 sJRBNXBcoESBoyPsyXh4lq+8uxnuXVclTQ==
X-Google-Smtp-Source: ABdhPJzE4dz0B72dHfTll8DRk9Nz+LJNBozMH0Dz+13nEh37DyQ3xccMf7TASqIQfviixhQeHIEzNQ==
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr15017233qkb.436.1635877525919; 
 Tue, 02 Nov 2021 11:25:25 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/12] target/arm: Use the constant variant of
 store_cpu_field() when possible
Date: Tue,  2 Nov 2021 14:25:15 -0400
Message-Id: <20211102182519.320319-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
References: <20211102182519.320319-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When using a constant variable, we can replace the store_cpu_field()
call by store_cpu_field_constant() which avoid using TCG temporaries.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029231834.2476117-4-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 083a6d6ed7..52ba562c96 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -364,8 +364,7 @@ void clear_eci_state(DisasContext *s)
      * multiple insn executes.
      */
     if (s->eci) {
-        TCGv_i32 tmp = tcg_const_i32(0);
-        store_cpu_field(tmp, condexec_bits);
+        store_cpu_field_constant(0, condexec_bits);
         s->eci = 0;
     }
 }
@@ -740,9 +739,8 @@ void gen_set_condexec(DisasContext *s)
 {
     if (s->condexec_mask) {
         uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, val);
-        store_cpu_field(tmp, condexec_bits);
+
+        store_cpu_field_constant(val, condexec_bits);
     }
 }
 
@@ -8362,8 +8360,6 @@ static bool trans_BL(DisasContext *s, arg_i *a)
 
 static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 {
-    TCGv_i32 tmp;
-
     /*
      * BLX <imm> would be useless on M-profile; the encoding space
      * is used for other insns from v8.1M onward, and UNDEFs before that.
@@ -8377,8 +8373,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
         return false;
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
-    tmp = tcg_const_i32(!s->thumb);
-    store_cpu_field(tmp, thumb);
+    store_cpu_field_constant(!s->thumb, thumb);
     gen_jmp(s, (read_pc(s) & ~3) + a->imm);
     return true;
 }
@@ -8677,7 +8672,6 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
      * doesn't cache branch information, all we need to do is reset
      * FPSCR.LTPSIZE to 4.
      */
-    TCGv_i32 ltpsize;
 
     if (!dc_isar_feature(aa32_lob, s) ||
         !dc_isar_feature(aa32_mve, s)) {
@@ -8688,8 +8682,7 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
         return true;
     }
 
-    ltpsize = tcg_const_i32(4);
-    store_cpu_field(ltpsize, v7m.ltpsize);
+    store_cpu_field_constant(4, v7m.ltpsize);
     return true;
 }
 
@@ -9487,9 +9480,7 @@ static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
     /* Reset the conditional execution bits immediately. This avoids
        complications trying to do it at the end of the block.  */
     if (dc->condexec_mask || dc->condexec_cond) {
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, 0);
-        store_cpu_field(tmp, condexec_bits);
+        store_cpu_field_constant(0, condexec_bits);
     }
 }
 
-- 
2.25.1


