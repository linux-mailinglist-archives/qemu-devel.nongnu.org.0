Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1606B6A2801
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:00:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQ1-0000u9-1B; Sat, 25 Feb 2023 04:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPk-0000bw-HD
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:23 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPi-00055R-Hx
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:20 -0500
Received: by mail-pj1-x102a.google.com with SMTP id l1so1414026pjt.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EN6i3124GbzuDzAfWYCmS/x0Jquz/HN39rL+uzxBiIE=;
 b=X6ssmHrd7M+qcCGy7SFLWbO321UeEApegMbFrVSYus7iWozpDBVSOH0tQYq0o47/FO
 glZmR0Wl1rXpqCPxL+5wHK47FycFLc9fyBu65uDhS1oKwJsqKDxeobNxXTnptzv3QjaP
 31OHMXprht1t6C7Vnb3Eg+7MHkr2jhJfFiiPt+OmShje3pW8UruA6NkKOilEYxU0gDR4
 sQ5Fo6fx36twV4Bh1j4xnbZcWoEtoWQExYyZH/snTcTEtFGYfTbFiXy4ZwzZMnlqLruY
 wfWdycNMTYCcR4pQGf6UlBvqUNEsJPD9+B/UGSwm1+uYinA1gSnwoUhe4hMYDh1qwCuZ
 Uirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EN6i3124GbzuDzAfWYCmS/x0Jquz/HN39rL+uzxBiIE=;
 b=2smCnr5IliBCvp+zjL89XMhlcvU9/6kyuFErsQHR3uOfUXLyGT6iZp7bEuymRJP1HM
 p+PtBML7ECiG5YKtKQgsnM0uTGePUxhciOPtTKTFABFSEUjaWSUzj6MhMgFxNjbyHBCN
 2Xp1ovvqAl8+HZxtpdRRVkHchVpqT0rCQln5jmGnKPYwcRbyBvmtndNGF9jRWONwWNmx
 O/pXuf3kNwYi1iWHYgb8+n1KQhW5gMgLRj999ArOGiErqRcASRfCuwjJeY94XDGvVshQ
 WJKsRW1rZeZJfeENhCRuWfxNTB5BSkFZqCoGZ/OrHiegr78fVKaf+OLwZ34YVDCAXQXs
 ONFA==
X-Gm-Message-State: AO0yUKURIEIDZsD3GklUNnvWhdtdHi4l4xmp0yKpK9+BcG3SXafTqjyI
 t9/NN60Wigk54xDlcBqvIo2lqjC00//IesqUYt0=
X-Google-Smtp-Source: AK7set//L4TJ0S7xi+3mDmBXldwH36RcUZuxY+nkH+AH5yia9o40SneyZPEg5CsyvQ43mJpd+M4p9w==
X-Received: by 2002:a17:902:76c9:b0:19c:a6d6:7d25 with SMTP id
 j9-20020a17090276c900b0019ca6d67d25mr11051503plt.37.1677315617177; 
 Sat, 25 Feb 2023 01:00:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v3 19/30] target/arm: Drop copies in gen_sve_{ldr,str}
Date: Fri, 24 Feb 2023 22:59:34 -1000
Message-Id: <20230225085945.1798188-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since we now get TEMP_TB temporaries by default, we no longer
need to make copies across these loops.  These were the only
uses of new_tmp_a64_local(), so remove that as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 -
 target/arm/translate-a64.c |  6 ------
 target/arm/translate-sve.c | 32 --------------------------------
 3 files changed, 39 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index ad3762d1ac..ca24c39dbe 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -19,7 +19,6 @@
 #define TARGET_ARM_TRANSLATE_A64_H
 
 TCGv_i64 new_tmp_a64(DisasContext *s);
-TCGv_i64 new_tmp_a64_local(DisasContext *s);
 TCGv_i64 new_tmp_a64_zero(DisasContext *s);
 TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 67e9c4ee79..9da5010fe1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -436,12 +436,6 @@ TCGv_i64 new_tmp_a64(DisasContext *s)
     return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_new_i64();
 }
 
-TCGv_i64 new_tmp_a64_local(DisasContext *s)
-{
-    assert(s->tmp_a64_count < TMP_A64_MAX);
-    return s->tmp_a64[s->tmp_a64_count++] = tcg_temp_local_new_i64();
-}
-
 TCGv_i64 new_tmp_a64_zero(DisasContext *s)
 {
     TCGv_i64 t = new_tmp_a64(s);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 621a2abb22..02150d93e8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4344,17 +4344,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
 
-        /* Copy the clean address into a local temp, live across the loop. */
-        t0 = clean_addr;
-        clean_addr = new_tmp_a64_local(s);
-        tcg_gen_mov_i64(clean_addr, t0);
-
-        if (base != cpu_env) {
-            TCGv_ptr b = tcg_temp_local_new_ptr();
-            tcg_gen_mov_ptr(b, base);
-            base = b;
-        }
-
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4370,11 +4359,6 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
-
-        if (base != cpu_env) {
-            tcg_temp_free_ptr(base);
-            assert(len_remain == 0);
-        }
     }
 
     /*
@@ -4445,17 +4429,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         TCGLabel *loop = gen_new_label();
         TCGv_ptr tp, i = tcg_const_local_ptr(0);
 
-        /* Copy the clean address into a local temp, live across the loop. */
-        t0 = clean_addr;
-        clean_addr = new_tmp_a64_local(s);
-        tcg_gen_mov_i64(clean_addr, t0);
-
-        if (base != cpu_env) {
-            TCGv_ptr b = tcg_temp_local_new_ptr();
-            tcg_gen_mov_ptr(b, base);
-            base = b;
-        }
-
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4471,11 +4444,6 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
 
         tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
         tcg_temp_free_ptr(i);
-
-        if (base != cpu_env) {
-            tcg_temp_free_ptr(base);
-            assert(len_remain == 0);
-        }
     }
 
     /* Predicate register stores can be any multiple of 2.  */
-- 
2.34.1


