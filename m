Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6372D9FC4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 20:00:00 +0100 (CET)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kot4h-00034Q-Gl
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskK-0000Kz-IT
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:59 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskJ-0007Um-64
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:56 -0500
Received: by mail-wr1-x441.google.com with SMTP id 91so17441510wrj.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4dvt8U31xdW0cLzHQK5e0FLr4aqxGweAhaJ4Nz2TOOo=;
 b=hi2tvYJlNB2vVj/lqp0JJjXfK3CvJ7mehCA1FtaoWdKDufzQvsDfSCVf3jyk8G49Cz
 tBmTbzbVW4TDuX1TeQNHmUecO955GzCKrjWUEL0F8iecc8tCZoTd9wga/fbi6FPB+80S
 wWBUTrf5ELxXImCwrAxTyHtCp4efMMyhES2VLGdoU/OvKx62LMXwZz15LVQe9a/MxLIu
 FK0t/mhdM0Q1eyABr50xUvdk2iaQOFUsl6lzMRsPeCx5JKd7Fwwyniob6p7mlrdSsWGb
 chLoIZT5Z0aOeqrVELzRwWtjNET5NEJtsMA370qsJuxxhJLbhS2J7hMqXZ3c6rJeWmHK
 0UBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4dvt8U31xdW0cLzHQK5e0FLr4aqxGweAhaJ4Nz2TOOo=;
 b=Tf9Qsh1TeeC813W6EQubdShJhKwIf9t6ac4IlrVA1D0TKXpTayI/m933JG9O7+7IEi
 zFiL4rH7N/oTzW70uBKYaxSeJCVDrbj2RQFqtLbHTneg/RaKfVI/1X+OQpmWumCj25cd
 ZNwFCiRgtqxiVZM6SIBKs5z1w08h0m4PeIcTr947Jb1QT1+zSnJejT5fWXv0ipFGkLp4
 6BkGED13Y9BRkI1PrZcyUk1Uqc0GcbJAe+qsx1d5IP31bYhZGYnuqYyARqgW3P45Cqas
 K/mC6/XI7gKLzU6QGshcZYzww4VPA6AVWT28kB135S3H+2btF3nUYF0YTCKzh4Y7bqUw
 w5ZA==
X-Gm-Message-State: AOAM533JyF1XHEnQOYPFDA4Eawd8wjxF8WtDudjwfrhFWNQj7vohB4Wo
 Lz6rBsSXf4ii0AKFi62deavLw4QDIZY=
X-Google-Smtp-Source: ABdhPJxUp2BskZWfBzm4IefQycmoihlnmFcsBXXeNIHnDPr0rau5I3Eek3v+shwfWtIwbQYSopXo1Q==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr8729982wrq.47.1607971133399; 
 Mon, 14 Dec 2020 10:38:53 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a14sm24486383wrn.3.2020.12.14.10.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/16] target/mips: Declare generic FPU functions in
 'translate.h'
Date: Mon, 14 Dec 2020 19:37:37 +0100
Message-Id: <20201214183739.500368-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some FPU translation functions / registers can be used by
ISA / ASE / extensions out of the big translate.c file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h |  7 +++++++
 target/mips/translate.c | 12 ++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 989d6c43207..a30fbf21ff9 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -59,12 +59,19 @@ void check_insn(DisasContext *ctx, uint64_t flags);
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
index 318642cbcfe..08ed542f4d4 100644
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


