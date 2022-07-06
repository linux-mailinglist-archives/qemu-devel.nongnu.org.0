Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C85693BE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:00:00 +0200 (CEST)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9C7r-0002U1-Ot
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMD-0000fH-G1; Wed, 06 Jul 2022 16:10:49 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMB-0003bx-RZ; Wed, 06 Jul 2022 16:10:45 -0400
Received: by mail-ua1-x935.google.com with SMTP id r18so4022526uan.4;
 Wed, 06 Jul 2022 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kbI30UoSZjChVKo4IjsM6ffGAtBZvQCf6w6BMggdE2w=;
 b=g+Pw0QBeBogJxq9bStFoKBq6dyXP2Ie1uIqgeo5PxECdTiVR+UDXsYeEoI+rHgTATX
 pa19eFmWyKZ8NebOpCt44VvArPdSCNYknSYX2oz7N66T/HNuUTDb54Ol8mDdJdPxfsJK
 coaqFb/SSkfaCZ0oaRPMb71uEXTTS7vXFZEIj2Q+AE1avZuQkxd8mskVtSqtofEhzCr6
 rNlb96MAzJN5kDAYIcxZ+mq1RbLYvupLi1pVDt8bSDW84Zojr4xFP5Enrb63Na52Jtr9
 6lRw6a/cbwOL39Qr3c72u7SfpUjAVH/MqWwrjN/ioWPZNEQrwQOljxahU5s/YLTXJcuL
 +LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbI30UoSZjChVKo4IjsM6ffGAtBZvQCf6w6BMggdE2w=;
 b=h03Zj0YEmwUFdoflDqzDxKRce2BW3OHyA33FqxfL+U1kgpdSgY2uG+kV2xNwScWoBJ
 W2bZCzOadGn4hySp5LQvJsNz5j+iXK1uwRFEI9hMkyd5sWS2FBBzvMWfjgfmTcR2DviE
 XWFxCyZY5ZOYf4efiyJ/EIAFJIPXti0l+oe3OwRq0Ba4EBhcS7NCMChHOKgciYSYkNFm
 fwNiA3fEKPoey0+w3B0SieWllX4re/bx8FIi6aYihtkb6H+Y/o6Mr19EbZaKe6bJsJ1I
 aP9JtR5NkrUI8xGF103aJc8o1uqyBY/QOU5iKTV6Jl5zukqFXjCfMz97KAW2KQ0W2OsK
 X1EQ==
X-Gm-Message-State: AJIora9rptGuZdkmd4EeUqLZ9J0cq9EOTnDzMU3Kql3NEsu1uO5DES0I
 3IyeNbPaPrRiOt1EeuAfF/rBsSDidi0=
X-Google-Smtp-Source: AGRyM1uXN+EbMxIFxBCEHN6NAOX2sZCaNidUpXdKjr3LTTO4Y62T3QThdkNxFteJxlcrqOg4rckUoA==
X-Received: by 2002:ab0:36ba:0:b0:382:c076:d983 with SMTP id
 v26-20020ab036ba000000b00382c076d983mr6144719uat.40.1657138240287; 
 Wed, 06 Jul 2022 13:10:40 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 25/34] target/ppc: Move mffs[.] to decodetree
Date: Wed,  6 Jul 2022 17:09:37 -0300
Message-Id: <20220706200946.471114-26-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220629162904.105060-6-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode           |  4 ++++
 target/ppc/translate/fp-impl.c.inc | 35 +++++++++++++++---------------
 target/ppc/translate/fp-ops.c.inc  |  1 -
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6b68689357..7d219f000f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -100,6 +100,9 @@
 &X_tb           rt rb
 @X_tb           ...... rt:5 ..... rb:5 .......... .             &X_tb
 
+&X_t_rc         rt rc:bool
+@X_t_rc         ...... rt:5 ..... ..... .......... rc:1         &X_t_rc
+
 &X_tb_rc        rt rb rc:bool
 @X_tb_rc        ...... rt:5 ..... rb:5 .......... rc:1          &X_tb_rc
 
@@ -342,6 +345,7 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
 ### Move To/From FPSCR
 
+MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
 MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
 MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
 MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 4f4d57c611..d6231358f8 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -615,24 +615,6 @@ static void gen_mcrfs(DisasContext *ctx)
     tcg_temp_free_i64(tnew_fpscr);
 }
 
-/* mffs */
-static void gen_mffs(DisasContext *ctx)
-{
-    TCGv_i64 t0;
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
-    t0 = tcg_temp_new_i64();
-    gen_reset_fpstatus();
-    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
-    set_fpr(rD(ctx->opcode), t0);
-    if (unlikely(Rc(ctx->opcode))) {
-        gen_set_cr1_from_fpscr(ctx);
-    }
-    tcg_temp_free_i64(t0);
-}
-
 static TCGv_i64 place_from_fpscr(int rt, uint64_t mask)
 {
     TCGv_i64 fpscr = tcg_temp_new_i64();
@@ -660,6 +642,23 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
     tcg_temp_free_i64(fpscr_masked);
 }
 
+static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
+{
+    TCGv_i64 fpscr;
+
+    REQUIRE_FPU(ctx);
+
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, UINT64_MAX);
+    if (a->rc) {
+        gen_set_cr1_from_fpscr(ctx);
+    }
+
+    tcg_temp_free_i64(fpscr);
+
+    return true;
+}
+
 static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
 {
     TCGv_i64 fpscr;
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index f8c35124ae..1b65f5ab73 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -74,7 +74,6 @@ GEN_HANDLER_E(fcpsgn, 0x3F, 0x08, 0x00, 0x00000000, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(fmrgew, 0x3F, 0x06, 0x1E, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER_E(fmrgow, 0x3F, 0x06, 0x1A, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER(mcrfs, 0x3F, 0x00, 0x02, 0x0063F801, PPC_FLOAT),
-GEN_HANDLER_E_2(mffs, 0x3F, 0x07, 0x12, 0x00, 0x00000000, PPC_FLOAT, PPC_NONE),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsb1, 0x3F, 0x06, 0x01, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsf, 0x3F, 0x07, 0x16, 0x00000000, PPC_FLOAT),
-- 
2.36.1


