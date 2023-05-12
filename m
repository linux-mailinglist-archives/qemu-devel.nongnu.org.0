Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31619700A7A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:42:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxj-0007GT-3D; Fri, 12 May 2023 10:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxf-0007Bs-HV
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:35 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxN-0004kV-QC
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso37255165e9.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902476; x=1686494476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7akZCgLrkYKZD7/0pb1eqcMpMk4KlEV9ol5sKLINuho=;
 b=S4Bit7qzbXrjHGHTQyzbgMvLjId/Yfp3+3xhmGJkAAZt3e1JLcUPST27Zx5365U4B9
 TNVGgDwDUsRnt4BdKXNTWTadhJWvt6FYixZRGwO0aI7bYuZcVJeFMfqIWJHrUczxz38n
 ljEq2uidVHv+Yx23P+oppeZOg3T1ze2a/nadwchcGwWjW5fHhO+y8VmMX1+gcTGUnroq
 sXa9PBS8UMjVMO/Am8YsWaMAUpH5DVJgP1+zbXzyH2rNyVxoQhC+33aIf7a7ByroZDz/
 AI3QWUGaTaZjIsdPfBfXuoNIbudA/PUXIq1+H8Gyw50hzl7FRffWy95K67zq6lk+8lRO
 HNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902476; x=1686494476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7akZCgLrkYKZD7/0pb1eqcMpMk4KlEV9ol5sKLINuho=;
 b=kCJtCiUuBhKidiCzFyfIaWzqHUzXCoPa+8s3tpyWP3DL++aQP0XxxCHdsxJX8kUxi+
 ErdQmSeSeGxPQAi9VZYchN9rnyL7f7M9lslseJeJh4u96uYlVzYXvPGDd4EPNnik3nxo
 b4zYhkMz0XbArLbOplvZYQyb21Lms2o94Oe36qG97o/E4k3RLSHSNJapA4CmKXJkF6GQ
 eGYTw4jgtKm/iUDhdipm6c7+6LgAA5tOzfwgQ8UXvKHDZFfIW/XOWeHHvmljr0lsbHTJ
 n3NUUcjIoKS46RGiKULq/GHobMrxZEsnXoukobm/KbXl5wmrAuwsx4xikemxtg7pGis1
 4YvQ==
X-Gm-Message-State: AC+VfDwnlk2llF1sa11Be5k9vmGTL5rpEb1b1DmclfkSR2beZcT9lvJf
 /l37k9B7TqduC1KDpR2p0k1Ugw==
X-Google-Smtp-Source: ACHHUZ4wxGVQpqxP2aiafx2m8SO6zlZplUI+01yeQTNLF32dFNn40dJGzCwSnOFzrewL4IFnXTbx8g==
X-Received: by 2002:a7b:cb46:0:b0:3f1:82a1:122 with SMTP id
 v6-20020a7bcb46000000b003f182a10122mr17709755wmj.21.1683902476493; 
 Fri, 12 May 2023 07:41:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 17/20] target/arm: Convert BR, BLR, RET to decodetree
Date: Fri, 12 May 2023 15:41:03 +0100
Message-Id: <20230512144106.3608981-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Convert the simple (non-pointer-auth) BR, BLR and RET insns
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  5 ++++
 target/arm/tcg/translate-a64.c | 55 ++++++++++++++++++++++++++++++----
 2 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8514235a723..aa035f39558 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -19,6 +19,7 @@
 # This file is processed by scripts/decodetree.py
 #
 
+&r               rn
 &ri              rd imm
 &rri_sf          rd rn imm sf
 &i               imm
@@ -130,3 +131,7 @@ CBZ             . 011010 . ................... ..... @cbz
 TBZ             . 011011 . ..... .............. ..... @tbz
 
 B_cond          0101010 0 ................... 0 cond:4 imm=%imm19
+
+BR              1101011 0000 11111 000000 rn:5 00000 &r
+BLR             1101011 0001 11111 000000 rn:5 00000 &r
+RET             1101011 0010 11111 000000 rn:5 00000 &r
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 724dca8c579..853a01ac5be 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1388,6 +1388,53 @@ static bool trans_B_cond(DisasContext *s, arg_B_cond *a)
     return true;
 }
 
+static void set_btype_for_br(DisasContext *s, int rn)
+{
+    if (dc_isar_feature(aa64_bti, s)) {
+        /* BR to {x16,x17} or !guard -> 1, else 3.  */
+        set_btype(s, rn == 16 || rn == 17 || !s->guarded_page ? 1 : 3);
+    }
+}
+
+static void set_btype_for_blr(DisasContext *s)
+{
+    if (dc_isar_feature(aa64_bti, s)) {
+        /* BLR sets BTYPE to 2, regardless of source guarded page.  */
+        set_btype(s, 2);
+    }
+}
+
+static bool trans_BR(DisasContext *s, arg_r *a)
+{
+    gen_a64_set_pc(s, cpu_reg(s, a->rn));
+    set_btype_for_br(s, a->rn);
+    s->base.is_jmp = DISAS_JUMP;
+    return true;
+}
+
+static bool trans_BLR(DisasContext *s, arg_r *a)
+{
+    TCGv_i64 dst = cpu_reg(s, a->rn);
+    TCGv_i64 lr = cpu_reg(s, 30);
+    if (dst == lr) {
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        tcg_gen_mov_i64(tmp, dst);
+        dst = tmp;
+    }
+    gen_pc_plus_diff(s, lr, curr_insn_len(s));
+    gen_a64_set_pc(s, dst);
+    set_btype_for_blr(s);
+    s->base.is_jmp = DISAS_JUMP;
+    return true;
+}
+
+static bool trans_RET(DisasContext *s, arg_r *a)
+{
+    gen_a64_set_pc(s, cpu_reg(s, a->rn));
+    s->base.is_jmp = DISAS_JUMP;
+    return true;
+}
+
 /* HINT instruction group, including various allocated HINTs */
 static void handle_hint(DisasContext *s, uint32_t insn,
                         unsigned int op1, unsigned int op2, unsigned int crm)
@@ -2186,12 +2233,8 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         btype_mod = opc;
         switch (op3) {
         case 0:
-            /* BR, BLR, RET */
-            if (op4 != 0) {
-                goto do_unallocated;
-            }
-            dst = cpu_reg(s, rn);
-            break;
+            /* BR, BLR, RET : handled in decodetree */
+            goto do_unallocated;
 
         case 2:
         case 3:
-- 
2.34.1


