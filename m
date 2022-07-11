Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6637757057C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:23:36 +0200 (CEST)
Received: from localhost ([::1]:58670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuJz-00061a-Gs
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtve-0006cZ-EY
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvV-0002ng-BZ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id h17so7182447wrx.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xJStjhVhh8lM0KlESTH9cBr5cEkP8jOBDsIB6MUlD9s=;
 b=HHVnnJSlx6xN1zGM4glZYgv1m5yq5EiqJ2ZMVyy8R0cYoYi51gPvg0Da4UcPWUJ6N4
 3AqPa7MfST3004KSu2IcBkPVpfw9Vmz8LEM2OqrnvKEBDCUGed5PgXaANbTJxvzWrDnC
 c26d0lDxoSVfDbKm8ShkYa2u00ND+3JZtsnWtldiYu5+3VFmPLH8Bg2j2ZF0WVx0Y23n
 5hjCC0m/17bG+jQeh8TM4gMLYlCREZRbqlPvm5gNNWJTvyNK7KL2bx0obH6kLPI5mM+B
 0FIdwsg0jSB6neIveOc63mZqHvPpIdkRIMmvkSIYRBEkghUlgySSQm8xQes+cPSL284P
 NFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJStjhVhh8lM0KlESTH9cBr5cEkP8jOBDsIB6MUlD9s=;
 b=JNt9olDRDouGafj1eeCunTIIf168pTJmVobz4dXXNxVjjREMgZc8D8C+B4nkI1jX3+
 LqYjvL7WMVrc/Jdzkzz4cBvTtPuG1vv/CD8auyYR81KAHbGalj8hWJmC9i01UNlwgmty
 EkiJTFfMLyg9is0CeccgkctQrbrvDK5qFT+19YQZXL39MryJB7V200/+JFKzZukOdCaz
 aJE/PCLIyK0EqY7ktsxmyOZ0hbtSVkiM4oR+Ls7+F4v6+FqYiyUUD6XUdBHdxGmJZ3Ot
 L41mA9FAWrVhTt/LB5UPIdvL2LrJ0zrvMaGmabK8ai8OAdeOXt+olo6xhOdxU0xDOJMg
 czWg==
X-Gm-Message-State: AJIora+R46Z1+ODbYLGbWNZG2ZGAqnoj0jDeczx+AxQtGbFpz91wcE0L
 XD7bet+w9qC73e6AKaKODYNZL3Y1sHWU1A==
X-Google-Smtp-Source: AGRyM1vD0vqGuzTk/lzSmsN7bFK96RRbLQ3stwCWAW5Dq5Hq+QEjhunqfMdWYSOUBT641s3c61WQeg==
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id
 y9-20020a5d6149000000b0021d6ba76095mr16721785wrt.680.1657547895716; 
 Mon, 11 Jul 2022 06:58:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/45] target/arm: Implement PSEL
Date: Mon, 11 Jul 2022 14:57:33 +0100
Message-Id: <20220711135750.765803-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-29-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      | 20 +++++++++++++
 target/arm/translate-sve.c | 57 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 95af08c139f..966803cbb78 100644
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
index fd1a1736374..24ffb69a2af 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7419,3 +7419,60 @@ static bool do_BFMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sel)
 
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
2.25.1


