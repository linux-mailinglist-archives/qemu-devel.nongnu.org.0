Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED12F6617
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:39:54 +0100 (CET)
Received: from localhost ([::1]:58080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05f7-0004xI-Ty
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Md-0003Zt-Av
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:47 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05MZ-0000Om-8g
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:45 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 91so6394016wrj.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pWUCU4kJzg9XVeCgHF2BdaVL6/OkapcomEmccO/gqlo=;
 b=sTEh1Wx8Om51K1ZksomwlSxFcviGSkhuS0ozQVBfZuA/7Bi7nxqCMdTpDCVxbIE+eP
 GTRGskolnQfPXoWLRrwE4Ob9V2ea53nfAn+W+Ua/yJjUp5zCq5O3AmH3eBYnL28FDoF/
 AiOrdMnsBJrGKMBJATYP+JEQZsPdGZ1F5daY1kTUPAkHBjenpyxDwF6q2oZGNH42Q2OQ
 VajHp0TMo3HpXhYgm7s9R4tMK3xIXvQdRezS/h/6WJyPNsDnZWXtgdy80v97n7lo/OWa
 osiIY8ER+hhC9Q6FOrYaUE/ro6gbhjbdf6SzgoppTiXFP6UjKMUAx0h8nc7GkdzQOvkj
 5/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pWUCU4kJzg9XVeCgHF2BdaVL6/OkapcomEmccO/gqlo=;
 b=iF6AzQv5QDuVcIVDXW1z6suC2YWuVPnN52QXZYDAnpyFocc1bjTWFcQZVfdI8qMvbC
 IWnP/p8lhiN5mtJ+nfn5hXxuqHB5SgLNh3UQ3Me11yLp+8B/W/Spdrf8/7Cdtu+84I6e
 TxEgnI/a3MLC92zGYatKCbuCufwve9aExFR3x1ZnT7oK5vmio6o3YYsp2i43dzWQ+fye
 fN5upOQyyoohm7ORhKHcTehJoUjLxLyBHVl1na5zY1PKDRJ2zj2plmIQBzi/CokyK1HY
 SPT9fklRnj52/HJQOOZrxEYGoRXvzqXx/CyNj7YF6khTRNvSp2fgXyXTQq38Veg5NyUJ
 J/Kw==
X-Gm-Message-State: AOAM532zbBmM1CvFO1dVFypEgKEOsCt81VOZI54iVsXmPs8RrJ6PlQpa
 aqlQHdVNh15M+nvTDcgsce3wtn4RF7o=
X-Google-Smtp-Source: ABdhPJwBWMEm3scaQLYEPAebzVogb9F/1X0Kxf581WpLrpWq15WOb5V/bu4QwewxE++rl5jOb7hwmg==
X-Received: by 2002:adf:80d0:: with SMTP id 74mr8890944wrl.110.1610641240636; 
 Thu, 14 Jan 2021 08:20:40 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p8sm11339706wru.50.2021.01.14.08.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:20:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 32/69] target/mips: Declare generic FPU / Coprocessor
 functions in translate.h
Date: Thu, 14 Jan 2021 17:20:03 +0100
Message-Id: <20210114162016.2901557-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some FPU / Coprocessor translation functions / registers can be
used by ISA / ASE / extensions out of the big translate.c file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-15-f4bug@amsat.org>
---
 target/mips/translate.h | 12 ++++++++++++
 target/mips/translate.c | 24 ++++++++++++------------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 98cadffe4e5..a3f4a56750d 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -61,16 +61,28 @@ void check_insn(DisasContext *ctx, uint64_t flags);
 #ifdef TARGET_MIPS64
 void check_mips_64(DisasContext *ctx);
 #endif
+void check_cp0_enabled(DisasContext *ctx);
+void check_cp1_enabled(DisasContext *ctx);
+void check_cp1_64bitmode(DisasContext *ctx);
+void check_cp1_registers(DisasContext *ctx, int regs);
+void check_cop1x(DisasContext *ctx);
 
 void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
 void gen_move_low32(TCGv ret, TCGv_i64 arg);
 void gen_move_high32(TCGv ret, TCGv_i64 arg);
 void gen_load_gpr(TCGv t, int reg);
 void gen_store_gpr(TCGv t, int reg);
+void gen_load_fpr32(DisasContext *ctx, TCGv_i32 t, int reg);
+void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
+void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg);
+void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
+int get_fp_bit(int cc);
 
 void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0, TCGv arg1);
 
 extern TCGv cpu_gpr[32], cpu_PC;
+extern TCGv_i32 fpu_fcr0, fpu_fcr31;
+extern TCGv_i64 fpu_f64[32];
 extern TCGv bcond;
 
 #define LOG_DISAS(...)                                                        \
diff --git a/target/mips/translate.c b/target/mips/translate.c
index d7767215050..9b822344a2e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2492,8 +2492,8 @@ static TCGv cpu_dspctrl, btarget;
 TCGv bcond;
 static TCGv cpu_lladdr, cpu_llval;
 static TCGv_i32 hflags;
-static TCGv_i32 fpu_fcr0, fpu_fcr31;
-static TCGv_i64 fpu_f64[32];
+TCGv_i32 fpu_fcr0, fpu_fcr31;
+TCGv_i64 fpu_f64[32];
 static TCGv_i64 msa_wr_d[64];
 
 #if defined(TARGET_MIPS64)
@@ -2768,7 +2768,7 @@ void gen_reserved_instruction(DisasContext *ctx)
 }
 
 /* Floating point register moves. */
-static void gen_load_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
+void gen_load_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
 {
     if (ctx->hflags & MIPS_HFLAG_FRE) {
         generate_exception(ctx, EXCP_RI);
@@ -2776,7 +2776,7 @@ static void gen_load_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
     tcg_gen_extrl_i64_i32(t, fpu_f64[reg]);
 }
 
-static void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
+void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
 {
     TCGv_i64 t64;
     if (ctx->hflags & MIPS_HFLAG_FRE) {
@@ -2809,7 +2809,7 @@ static void gen_store_fpr32h(DisasContext *ctx, TCGv_i32 t, int reg)
     }
 }
 
-static void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
+void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
 {
     if (ctx->hflags & MIPS_HFLAG_F64) {
         tcg_gen_mov_i64(t, fpu_f64[reg]);
@@ -2818,7 +2818,7 @@ static void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
     }
 }
 
-static void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
+void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
 {
     if (ctx->hflags & MIPS_HFLAG_F64) {
         tcg_gen_mov_i64(fpu_f64[reg], t);
@@ -2832,7 +2832,7 @@ static void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
     }
 }
 
-static inline int get_fp_bit(int cc)
+int get_fp_bit(int cc)
 {
     if (cc) {
         return 24 + cc;
@@ -2899,14 +2899,14 @@ void gen_move_high32(TCGv ret, TCGv_i64 arg)
 #endif
 }
 
-static inline void check_cp0_enabled(DisasContext *ctx)
+void check_cp0_enabled(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0))) {
         generate_exception_end(ctx, EXCP_CpU);
     }
 }
 
-static inline void check_cp1_enabled(DisasContext *ctx)
+void check_cp1_enabled(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_FPU))) {
         generate_exception_err(ctx, EXCP_CpU, 1);
@@ -2918,7 +2918,7 @@ static inline void check_cp1_enabled(DisasContext *ctx)
  * This is associated with the nabla symbol in the MIPS32 and MIPS64
  * opcode tables.
  */
-static inline void check_cop1x(DisasContext *ctx)
+void check_cop1x(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_COP1X))) {
         gen_reserved_instruction(ctx);
@@ -2929,7 +2929,7 @@ static inline void check_cop1x(DisasContext *ctx)
  * Verify that the processor is running with 64-bit floating-point
  * operations enabled.
  */
-static inline void check_cp1_64bitmode(DisasContext *ctx)
+void check_cp1_64bitmode(DisasContext *ctx)
 {
     if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | MIPS_HFLAG_COP1X))) {
         gen_reserved_instruction(ctx);
@@ -2947,7 +2947,7 @@ static inline void check_cp1_64bitmode(DisasContext *ctx)
  * Multiple 64 bit wide registers can be checked by calling
  * gen_op_cp1_registers(freg1 | freg2 | ... | fregN);
  */
-static inline void check_cp1_registers(DisasContext *ctx, int regs)
+void check_cp1_registers(DisasContext *ctx, int regs)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_F64) && (regs & 1))) {
         gen_reserved_instruction(ctx);
-- 
2.26.2


