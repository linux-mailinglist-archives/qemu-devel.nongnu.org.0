Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130024405BD
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:22:31 +0200 (CEST)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbCg-00059F-5D
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb9G-0001X8-Oj; Fri, 29 Oct 2021 19:18:58 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb9B-0006iW-QC; Fri, 29 Oct 2021 19:18:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d3so19118048wrh.8;
 Fri, 29 Oct 2021 16:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=swq+ujz87mpmAn8eQLeFpgy6KxnzzsPRpEtfSs0XAHY=;
 b=hBLWTMcI9nGwK869dA11CYAtPpX7tsO3zpRct5cSs1OAGg4mI9sPnC7hiOv15E8+0P
 YpEGuMk4+7mMyGTXCWxQEDZlVPeoachUvsIcc5eRPQyxAU6QeW3Ie51MjLgTuaa9e/cl
 B+3apkTZG9JVkg3Gl/NbgXiL9yot5MZjnVlD6LCZ+Bn08Vx1DXO8pl+j2vGAGHlKInE7
 FfyjnuH+Z9AEl7ozyt07sXw9Fiu2k9PSHFlW0RzPxJakRN9JkpiM56bZmc4lh0wZRNFl
 owQcymVFrpZwY4FdEi12x8KtknEADMzaSKfGOtSUs7VfCNuhYLh9tropkN18kRqpaj55
 hb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=swq+ujz87mpmAn8eQLeFpgy6KxnzzsPRpEtfSs0XAHY=;
 b=dSRmK8UEWnRLSIcgxYitkz03r4pN7VpsbVxb02weZRXX0wlyo7InfV4iN0JCC3pNM3
 SYs+Wmm4T0zcw9LIK6naX5tF5YA+Qx6vjojN40QWR5ISjkzezmtP/TJjLTITCNeLyqVk
 oGUnQ6JaOMSmingrnyFeNTB87d6wZc/37R89YbodVYnpNyE6TNd6nEO+CT73R8zmMUyG
 JeSWal+XayFnOo9IGW8w1Og3sHICDPy22pqOTO8cQTw0xTRlWgV58a9T9D5pVBAWkINo
 Ro0z5XxnNB8f9LrNT1aFsc5zi/VO8bPBP1CRtaOiIcetWgVZWifDWUsuX9wh7WmJLicW
 sAEQ==
X-Gm-Message-State: AOAM532Df3GZA9vhwANIyIR6pno9Y5KHaxqScCxPPD5PpWwQlAI9UzG4
 5pwa4nEy36Eoftdi3MesAFLeXdjvDl4=
X-Google-Smtp-Source: ABdhPJxCl3XpP87KaeIVEvRLEHoA72YYpRjrhrob7D/Ucv602WXdrEeEPaHhToi/vsY39ImcqsEuiw==
X-Received: by 2002:a7b:c5d9:: with SMTP id n25mr23034500wmk.139.1635549531585; 
 Fri, 29 Oct 2021 16:18:51 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m31sm6100870wms.25.2021.10.29.16.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:18:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] target/arm: Use the constant variant of
 store_cpu_field() when possible
Date: Sat, 30 Oct 2021 01:18:32 +0200
Message-Id: <20211029231834.2476117-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029231834.2476117-1-f4bug@amsat.org>
References: <20211029231834.2476117-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using a constant variable, we can replace the store_cpu_field()
call by store_cpu_field_constant() which avoid using TCG temporaries.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 083a6d6ed77..52ba562c96b 100644
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
2.31.1


