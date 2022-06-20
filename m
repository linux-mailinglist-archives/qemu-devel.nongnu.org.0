Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843A5523CB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:23:46 +0200 (CEST)
Received: from localhost ([::1]:38168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3M3s-0001kA-Pj
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaN-0006OQ-RZ
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:18 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaF-0001YR-DX
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:53:11 -0400
Received: by mail-pg1-x535.google.com with SMTP id r66so4938866pgr.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asM1RIMMm/LbRASBkWsCTEFIsFdYgesXksTZnMcbxew=;
 b=y4wlzDSIpcGi3qvm9dGFpTc99byPIXeEWItFwXZZ06vVCxOA2hJ6W+e8DperVgPXqB
 zA28Y4+A7h9afixfCsLlOb5wTUOBeLiBfuqPld8MSOn02ziyTPIVrggZnt6Yk82A5r0j
 VoGh4T+6d0Y70EEoGTRrvUbeQ3QHG5+2/3e+36vfVGDVgS9kPant87IiteNqs4Cxd/v5
 VycHq1PsintFQ5BsuJpCBEI9/Q86zzqkQdipJfWYYqvPUeRjkYh9SGJqrsRbnS0KGafz
 A+X22zVwJBpYgl9q7LQfbwPx1gqxfj3NyeJTU8VZoMnOOBNL+fXdgZHPEBlbIjH8259v
 Fesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asM1RIMMm/LbRASBkWsCTEFIsFdYgesXksTZnMcbxew=;
 b=u5x9nJuzaI0oqtXsgvAZw3G/VXXLLMFuZVnN37FPacQPKjVEkhtJzazCJE5S4h2GkL
 CjvLNJ727eHca5t2vw8AbGrW0LpoHQ36PmZNMaFuxcVcuYbqecueXyUYKR4+gA4XvGTJ
 A0ZUR9LWZHczrNwSpMK5CvKI48qYqjGOO7griUpEi2yuphama6WWqYV7iN/vf/l3Epwb
 LexkGefKNPHAeBKUmQ1n6yU+CTFlOqkaY6dEoxw2RnN85JtRPmbK+WZ6TAUDNp2WBfQy
 uivZXUUEePy+/DpKkc/+TX7ZoKQ539hR8XXzpfaRU/3BrnXMHARymjwcym3tYK7Fbu+B
 tOOw==
X-Gm-Message-State: AJIora+xBwFjvt6p3eteY+lVue6QhQ9IrVz3W4Qynqq8apPs581gM3mx
 c7cSOIyY4icLoVfO915KTtXkgBtLgB5onQ==
X-Google-Smtp-Source: AGRyM1tNPQsPmNCtvngjYS+4Q20lLM15fhyWnMo/43zHlyC+IrkuISV/SxxqZr1bvpyASbkpwsGlbg==
X-Received: by 2002:a05:6a00:1690:b0:517:cc9e:3e2d with SMTP id
 k16-20020a056a00169000b00517cc9e3e2dmr25980545pfc.0.1655747585663; 
 Mon, 20 Jun 2022 10:53:05 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 34/51] target/arm: Implement PSEL
Date: Mon, 20 Jun 2022 10:52:18 -0700
Message-Id: <20220620175235.60881-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 20 +++++++++++++
 target/arm/translate-sve.c | 57 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bbdaac6ac7..bf561c270a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1674,3 +1674,23 @@ BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 
 ### SVE2 floating-point bfloat16 dot-product (indexed)
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
+
+### SVE broadcast predicate element
+
+&psel           esz pd pn pm rv imm
+%psel_rv        16:2 !function=plus_12
+%psel_imm_b     22:2 19:2
+%psel_imm_h     22:2 20:1
+%psel_imm_s     22:2
+%psel_imm_d     23:1
+@psel           ........ .. . ... .. .. pn:4 . pm:4 . pd:4  \
+                &psel rv=%psel_rv
+
+PSEL            00100101 .. 1 ..1 .. 01 .... 0 .... 0 ....  \
+                @psel esz=0 imm=%psel_imm_b
+PSEL            00100101 .. 1 .10 .. 01 .... 0 .... 0 ....  \
+                @psel esz=1 imm=%psel_imm_h
+PSEL            00100101 .. 1 100 .. 01 .... 0 .... 0 ....  \
+                @psel esz=2 imm=%psel_imm_s
+PSEL            00100101 .1 1 000 .. 01 .... 0 .... 0 ....  \
+                @psel esz=3 imm=%psel_imm_d
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index adf0cd3e68..58d0894e15 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7379,3 +7379,60 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 
 TRANS_FEAT(BFMLALB_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, false)
 TRANS_FEAT(BFMLALT_zzxw, aa64_sve_bf16, do_BFMLAL_zzxw, a, true)
+
+static bool trans_PSEL(DisasContext *s, arg_psel *a)
+{
+    int vl = vec_full_reg_size(s);
+    int pl = pred_gvec_reg_size(s);
+    int elements = vl >> a->esz;
+    TCGv_i64 tmp, didx, dbit;
+    TCGv_ptr ptr;
+
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i64();
+    dbit = tcg_temp_new_i64();
+    didx = tcg_temp_new_i64();
+    ptr = tcg_temp_new_ptr();
+
+    /* Compute the predicate element. */
+    tcg_gen_addi_i64(tmp, cpu_reg(s, a->rv), a->imm);
+    if (is_power_of_2(elements)) {
+        tcg_gen_andi_i64(tmp, tmp, elements - 1);
+    } else {
+        tcg_gen_remu_i64(tmp, tmp, tcg_constant_i64(elements));
+    }
+
+    /* Extract the predicate byte and bit indices. */
+    tcg_gen_shli_i64(tmp, tmp, a->esz);
+    tcg_gen_andi_i64(dbit, tmp, 7);
+    tcg_gen_shri_i64(didx, tmp, 3);
+    if (HOST_BIG_ENDIAN) {
+        tcg_gen_xori_i64(didx, didx, 7);
+    }
+
+    /* Load the predicate word. */
+    tcg_gen_trunc_i64_ptr(ptr, didx);
+    tcg_gen_add_ptr(ptr, ptr, cpu_env);
+    tcg_gen_ld8u_i64(tmp, ptr, pred_full_reg_offset(s, a->pm));
+
+    /* Extract the predicate bit and replicate to MO_64. */
+    tcg_gen_shr_i64(tmp, tmp, dbit);
+    tcg_gen_andi_i64(tmp, tmp, 1);
+    tcg_gen_neg_i64(tmp, tmp);
+
+    /* Apply to either copy the source, or write zeros. */
+    tcg_gen_gvec_ands(MO_64, pred_full_reg_offset(s, a->pd),
+                      pred_full_reg_offset(s, a->pn), tmp, pl, pl);
+
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(dbit);
+    tcg_temp_free_i64(didx);
+    tcg_temp_free_ptr(ptr);
+    return true;
+}
-- 
2.34.1


