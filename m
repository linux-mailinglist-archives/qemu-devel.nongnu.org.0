Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C92EE934
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:51:43 +0100 (CET)
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe86-0005e3-Tg
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdiz-0001LY-0C
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:45 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdix-0005iW-Ek
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id v14so6365884wml.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRsQWA6DviCLjfaBDg1WbGaXrnSa2ioMMoOlaaR//h8=;
 b=o0OBpaG8YioPmnh4pCi8uEIllIPToQK4Y/ZurcH7/jBgzM0iX59PpRROfAX9KSm9Qv
 y1M/po13UpDx0ukSBaTIFxHYx4VHSUOnpOezCQWu3EYtKGgUVDXSvNIKYeSmL+QOqnJ3
 H3LDJGFF/dNekLL+AvkIY3R91mTDJTumFY9rCML71mGVTSCTUkRJh+qP8r3Y1PO7DNwe
 +vVhhyT1Goj5s5FDV6ldmMGa/D7ylClNjaujOItzpFp/UtcLBZrmMSInI5/Tm27RIoiW
 qOJaAURMH/V8wGZ1oYMX4RaTnB5af38vnwNyLA0iYwxXzmtjAbdKRecF63ma5xT19Ny3
 7LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QRsQWA6DviCLjfaBDg1WbGaXrnSa2ioMMoOlaaR//h8=;
 b=dPNi27gjpBRqF1BlXWb9otgEfxyvCgp9mVt7hDdXB1ho0HT0XEH9LrnWfzsipAHKzD
 zY1yZNQpAD66cGpyzmmQrj0ui2jm+DA2jOnliUsZH2xHzKC6lyQbNorFHFFmuYTB14aA
 q/JD+92NbEEOMryviaC9cb6LHbiXlc4lMJaSoIfkpCXS+oUEduoHD1ogWGvTxv591vJC
 iqF5H+t4nOzJMy3ldTpOCds4Q5YemtHCboENTpnlLAr4rD3hSPkTnmnN8Tt1vmb6LibZ
 hQtrWNsMFc73EnPRqHWBwFqr9P3a7rAobOpsatmBXvbxw/QXf3Yn33jfRIu4CvQrfwEF
 YzSA==
X-Gm-Message-State: AOAM532Qlx82DYNdKRF04LImYtiGQUaL+mjYJ3dTTtJ8T6gAuIoI+jdA
 qKN/DrqPTeSOPy0ll/8bosVWx005624=
X-Google-Smtp-Source: ABdhPJzGmA4+ysp4m5XSrF57IUOYG8Bi+WA1SU7PAOx6p4FBWbHHquxLpd7/0eknqJS8F6BCz/U/mA==
X-Received: by 2002:a1c:65d4:: with SMTP id z203mr509895wmb.65.1610058342032; 
 Thu, 07 Jan 2021 14:25:42 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id z15sm10584113wrv.67.2021.01.07.14.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/66] target/mips: Declare generic FPU functions in
 'translate.h'
Date: Thu,  7 Jan 2021 23:22:19 +0100
Message-Id: <20210107222253.20382-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some FPU translation functions / registers can be used by
ISA / ASE / extensions out of the big translate.c file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-15-f4bug@amsat.org>
---
 target/mips/translate.h |  7 +++++++
 target/mips/translate.c | 12 ++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 5f744c63374..4c30a328e4b 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -60,12 +60,19 @@ void check_insn(DisasContext *ctx, uint64_t flags);
 #ifdef TARGET_MIPS64
 void check_mips_64(DisasContext *ctx);
 #endif
+void check_cp1_enabled(DisasContext *ctx);
 
 void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
 void gen_load_gpr(TCGv t, int reg);
 void gen_store_gpr(TCGv t, int reg);
 
+void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
+void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
+int get_fp_bit(int cc);
+
 extern TCGv cpu_gpr[32], cpu_PC;
+extern TCGv_i32 fpu_fcr0, fpu_fcr31;
+extern TCGv_i64 fpu_f64[32];
 extern TCGv bcond;
 
 #define LOG_DISAS(...)                                                        \
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 7c20ed33df7..610fba61de4 100644
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
@@ -2907,7 +2907,7 @@ static inline void check_cp0_enabled(DisasContext *ctx)
     }
 }
 
-static inline void check_cp1_enabled(DisasContext *ctx)
+void check_cp1_enabled(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_FPU))) {
         generate_exception_err(ctx, EXCP_CpU, 1);
-- 
2.26.2


