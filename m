Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DD15BF111
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:29:46 +0200 (CEST)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamgT-0003sj-OW
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8U-0001NZ-2V; Tue, 20 Sep 2022 15:42:26 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:43693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8S-0001px-E0; Tue, 20 Sep 2022 15:42:25 -0400
Received: by mail-oi1-x22f.google.com with SMTP id t62so5073296oie.10;
 Tue, 20 Sep 2022 12:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=usmNpbWpmyR8w3liB9InDmW57/S3wqfMyh9vapZzAgA=;
 b=H9YVznZ4j12oMCi60hSNSpK9lzYj5vxs0jjRC1O9mzl5wKiX+sRUbnkIzbxLbVFS/I
 yQegkyAJgTZkrwb+VZNWNNPrtkXs3pX9Ywad786Vmh5de8Yvhx8Ocm2DAmmOl4fAaQlQ
 DaJ927Qmgr5nVfqs02v6QNuF2LwVuoEu2mPbWX2SUsObb0ZUyaWbvXQaYLUhyZs1kI+D
 XtT7w3HK92lJ9Qr80kRCQImZoEg3+UrHxcJRhZSlfT2WW2mpPUPp0QEgj8qJ04933czX
 elnqxnPS+HwTJUS+IPvgGKL9sIw4YshGycMlLkgwWWHl5CqigTTtN1S/WUh8rdICmnli
 EjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=usmNpbWpmyR8w3liB9InDmW57/S3wqfMyh9vapZzAgA=;
 b=p+f3QaFhLfurkLIpnRcL1RqxoN16CHCgVb2YOu3fWOLEsipwirvzKt+AsuFOswboK9
 A4jX/iiDzFwlYCR5LcG2/PxHs1baShGgkdN6d+6gl7CDKP7bNZeGrMd3IivKC1jc1M5c
 TATZk3sWVtH/I4xO58sMinCgtYSxR2yv+P7B4cFeKTVEZqhCOEW1cENEdB0UPB6vKjy7
 MSCiTT8sVF6vUWUDZE3E9UrdAGVlc/Wp6Ri6qHuaT6yzU5VQPAJLJOorz7aF0IeM2VvJ
 WoBVE9qZMudZT2/RbCWvOFmjDI/ynw2BrMQLEl0JwRkYrJzpDbhW1sVuNrFB0xUzDnHJ
 VJhw==
X-Gm-Message-State: ACrzQf35jGuoZNivJF1oholbKJm/dWfeKF92PsTvmmt6hDzsjVQet+kf
 lEaa5X6z+dc/f/HCotzx8IFjBBcTJKA=
X-Google-Smtp-Source: AMsMyM4/acE61zyd2HU1janyAzES4/cty6a1svN4Yr1fBBRjdVAaTZ7N4I9dWRheWcVU3dyHPPd0bQ==
X-Received: by 2002:a05:6808:308c:b0:34f:9433:dca6 with SMTP id
 bl12-20020a056808308c00b0034f9433dca6mr2313350oib.255.1663702940733; 
 Tue, 20 Sep 2022 12:42:20 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 04/17] target/ppc: Move fsqrt to decodetree
Date: Tue, 20 Sep 2022 16:41:49 -0300
Message-Id: <20220920194202.82615-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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
Message-Id: <20220905123746.54659-2-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode           |  7 +++++++
 target/ppc/translate/fp-impl.c.inc | 29 +++++++++++++++++------------
 target/ppc/translate/fp-ops.c.inc  |  1 -
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index da08960fca..33aa27bd4f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -20,6 +20,9 @@
 &A              frt fra frb frc rc:bool
 @A              ...... frt:5 fra:5 frb:5 frc:5 ..... rc:1       &A
 
+&A_tb           frt frb rc:bool
+@A_tb           ...... frt:5 ..... frb:5 ..... ..... rc:1       &A_tb
+
 &D              rt ra si:int64_t
 @D              ...... rt:5 ra:5 si:s16                         &D
 
@@ -363,6 +366,10 @@ STFDU           110111 ..... ...... ...............     @D
 STFDX           011111 ..... ...... .... 1011010111 -   @X
 STFDUX          011111 ..... ...... .... 1011110111 -   @X
 
+### Floating-Point Arithmetic Instructions
+
+FSQRT           111111 ..... ----- ..... ----- 10110 .  @A_tb
+
 ### Floating-Point Select Instruction
 
 FSEL            111111 ..... ..... ..... ..... 10111 .  @A
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 0e893eafa7..e8359af005 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -254,29 +254,34 @@ static bool trans_FSEL(DisasContext *ctx, arg_A *a)
 GEN_FLOAT_AB(sub, 0x14, 0x000007C0, 1, PPC_FLOAT);
 /* Optional: */
 
-/* fsqrt */
-static void gen_fsqrt(DisasContext *ctx)
+static bool do_helper_fsqrt(DisasContext *ctx, arg_A_tb *a,
+                            void (*helper)(TCGv_i64, TCGv_ptr, TCGv_i64))
 {
-    TCGv_i64 t0;
-    TCGv_i64 t1;
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
+    TCGv_i64 t0, t1;
+
+    REQUIRE_INSNS_FLAGS(ctx, FLOAT_FSQRT);
+    REQUIRE_FPU(ctx);
+
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
+
     gen_reset_fpstatus();
-    get_fpr(t0, rB(ctx->opcode));
-    gen_helper_fsqrt(t1, cpu_env, t0);
-    set_fpr(rD(ctx->opcode), t1);
+    get_fpr(t0, a->frb);
+    helper(t1, cpu_env, t0);
+    set_fpr(a->frt, t1);
     gen_compute_fprf_float64(t1);
-    if (unlikely(Rc(ctx->opcode) != 0)) {
+    if (unlikely(a->rc != 0)) {
         gen_set_cr1_from_fpscr(ctx);
     }
+
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(t1);
+
+    return true;
 }
 
+TRANS(FSQRT, do_helper_fsqrt, gen_helper_fsqrt);
+
 static void gen_fsqrts(DisasContext *ctx)
 {
     TCGv_i64 t0;
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 1b65f5ab73..38759f5939 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -62,7 +62,6 @@ GEN_HANDLER_E(stfdepx, 0x1F, 0x1F, 0x16, 0x00000001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER_E(stfdpx, 0x1F, 0x17, 0x1C, 0x00200001, PPC_NONE, PPC2_ISA205),
 
 GEN_HANDLER(frsqrtes, 0x3B, 0x1A, 0xFF, 0x001F07C0, PPC_FLOAT_FRSQRTES),
-GEN_HANDLER(fsqrt, 0x3F, 0x16, 0xFF, 0x001F07C0, PPC_FLOAT_FSQRT),
 GEN_HANDLER(fsqrts, 0x3B, 0x16, 0xFF, 0x001F07C0, PPC_FLOAT_FSQRT),
 GEN_HANDLER(fcmpo, 0x3F, 0x00, 0x01, 0x00600001, PPC_FLOAT),
 GEN_HANDLER(fcmpu, 0x3F, 0x00, 0x00, 0x00600001, PPC_FLOAT),
-- 
2.37.3


