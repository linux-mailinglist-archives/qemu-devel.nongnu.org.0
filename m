Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E22A5BF13D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:33:18 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamjt-0001Hw-AQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8V-0001OY-Fk; Tue, 20 Sep 2022 15:42:29 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:43836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8T-0001q4-Jv; Tue, 20 Sep 2022 15:42:27 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1279948d93dso5789988fac.10; 
 Tue, 20 Sep 2022 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cIm0iX/01W0IFcvkpqSu1GuYAH0ASrSOWof0vccjIyk=;
 b=oDhACRCOPd8I63+H/DTWiYKWcZdndIkOzc/qSbBCaVuzjJTz+XUa7nju50vqPafGhf
 4eIn+3CB4uMAaHjH6BDQ9SZWsmI0TJ1IcIWXIOZXJO2ka0HznZRPNLyqAnntisdjimDy
 rkrgBIKMm4MhTPJe67dt5QsCpAWRvFRaBzwGRElNpKeN37OPwcttJrkzc+mk3SDTO9zW
 RLOKO48ItUGHwZewQKe97fxtXY9UAGeC8xnOxkNWEHQ/qqERvmm7fO1D6u8qZ/7mQVbk
 SqmBafT77at+h5lA1eS9R9oY/cQ1J5evpd47EJWB80zLKzcBqgM8D9MTspAqKggvCLDS
 VQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cIm0iX/01W0IFcvkpqSu1GuYAH0ASrSOWof0vccjIyk=;
 b=jIP5YHS8LuDh1R7rKg4rC7Ed27ZsgJ/yGa3TSKmkdNWcVSedJ8sT+Inqf0m1CdcB1d
 n0JTR18kySBLcsQTBRcn1Yh+4/XfMLx+4kcm86PFQXleLo7dJcKJk3BYbATCtxGslB9B
 kUY36+1IrXhfwRuMVRWaXScreXky30qyifJTTTrGPfZdswUHBO/ZQkuMg2fOXl8DM7oa
 Id73LwOTebrz5k3xPtMXe7R2Tpmxqbb8yz8WUukruiAw7ZL4hA29jaViGMr6hvnH+pUC
 4VhjcmjUosL8PmLGZ9vuO7OxI824bUFR+ilgoOZgMjOrfZdN3BUjnaFXZxn6AnEXKEDK
 BDNg==
X-Gm-Message-State: ACrzQf32peXAU7F9Gum2Jy8SHA1E9iI8rYZEFo3IMZiUQy2JISJSUBUc
 Qp+DJXNL/DoSrySF+bDlM67lWjviYt8=
X-Google-Smtp-Source: AMsMyM5pv+BE26g32U3XVc3fzHEpULPPGqBjUQGZ7JinxxkLyqbdPQGrwfr9IPk96+EFkjLZx1WTfw==
X-Received: by 2002:a05:6870:828f:b0:126:19ae:68d9 with SMTP id
 q15-20020a056870828f00b0012619ae68d9mr3074251oae.116.1663702943650; 
 Tue, 20 Sep 2022 12:42:23 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 05/17] target/ppc: Move fsqrts to decodetree
Date: Tue, 20 Sep 2022 16:41:50 -0300
Message-Id: <20220920194202.82615-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220905123746.54659-3-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode           |  1 +
 target/ppc/translate/fp-impl.c.inc | 23 +----------------------
 target/ppc/translate/fp-ops.c.inc  |  1 -
 3 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 33aa27bd4f..a5249ee32c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -369,6 +369,7 @@ STFDUX          011111 ..... ...... .... 1011110111 -   @X
 ### Floating-Point Arithmetic Instructions
 
 FSQRT           111111 ..... ----- ..... ----- 10110 .  @A_tb
+FSQRTS          111011 ..... ----- ..... ----- 10110 .  @A_tb
 
 ### Floating-Point Select Instruction
 
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index e8359af005..7a90c0e350 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -281,28 +281,7 @@ static bool do_helper_fsqrt(DisasContext *ctx, arg_A_tb *a,
 }
 
 TRANS(FSQRT, do_helper_fsqrt, gen_helper_fsqrt);
-
-static void gen_fsqrts(DisasContext *ctx)
-{
-    TCGv_i64 t0;
-    TCGv_i64 t1;
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
-    t0 = tcg_temp_new_i64();
-    t1 = tcg_temp_new_i64();
-    gen_reset_fpstatus();
-    get_fpr(t0, rB(ctx->opcode));
-    gen_helper_fsqrts(t1, cpu_env, t0);
-    set_fpr(rD(ctx->opcode), t1);
-    gen_compute_fprf_float64(t1);
-    if (unlikely(Rc(ctx->opcode) != 0)) {
-        gen_set_cr1_from_fpscr(ctx);
-    }
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
-}
+TRANS(FSQRTS, do_helper_fsqrt, gen_helper_fsqrts);
 
 /***                     Floating-Point multiply-and-add                   ***/
 /* fmadd - fmadds */
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 38759f5939..d4c6c4bed1 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -62,7 +62,6 @@ GEN_HANDLER_E(stfdepx, 0x1F, 0x1F, 0x16, 0x00000001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER_E(stfdpx, 0x1F, 0x17, 0x1C, 0x00200001, PPC_NONE, PPC2_ISA205),
 
 GEN_HANDLER(frsqrtes, 0x3B, 0x1A, 0xFF, 0x001F07C0, PPC_FLOAT_FRSQRTES),
-GEN_HANDLER(fsqrts, 0x3B, 0x16, 0xFF, 0x001F07C0, PPC_FLOAT_FSQRT),
 GEN_HANDLER(fcmpo, 0x3F, 0x00, 0x01, 0x00600001, PPC_FLOAT),
 GEN_HANDLER(fcmpu, 0x3F, 0x00, 0x00, 0x00600001, PPC_FLOAT),
 GEN_HANDLER(fabs, 0x3F, 0x08, 0x08, 0x001F0000, PPC_FLOAT),
-- 
2.37.3


