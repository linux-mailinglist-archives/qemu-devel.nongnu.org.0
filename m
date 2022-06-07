Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF095418B7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:14:55 +0200 (CEST)
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygXO-000205-G4
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwd-0006PQ-BI
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:55 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwX-0008Ds-TI
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:36:55 -0400
Received: by mail-pg1-x52a.google.com with SMTP id e66so16938652pgc.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LaAdc3vpJrtjbCOAPYhIA7+KAdo0UJCuCASVQA/g2u8=;
 b=yhzCWaiGDUjbUwdP980NYnh2pu/2tn+NrOw5E7jA3aRdEnf7ZGHqKM7MyYnaNKLwsL
 nwiMsJh3wgfuPDBorOTwMYNpK1BLJDja23gzYpsMnJDfSYl5WrYt2hCdRtMpzVLGoySP
 TlZ/CQXhD0o+s1iedjh8d7s14X7qqkkhg12QgLICgztqY22SA3yWXhpsn/oAmNE/ngh2
 D4AYzI+K4OjtM3zGMvH5GPuO4L8z/Kqq7uF+DgxA1MiKeg4GSYbPsQW4Ur6Uz4F3NA0h
 sGWfnqFuHW4Oxs4BEJWyXtV9wcfRFy/02TLWN/1GY3a+bvzIh7FDeGgQrCKW/44LUyCe
 W9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LaAdc3vpJrtjbCOAPYhIA7+KAdo0UJCuCASVQA/g2u8=;
 b=OolG3bfJkdiAhsXqsHNpXScqp+BuEtioz3/OqHgLpJ3FflHpHtRK6qtjczE+Ek12Bm
 bXi6xCLuDG/XrEZ+pUsn5csjw3bq+fhTG4yT/rZYFBpoFYF6NNO0RhW0JVrttOFAxnCW
 1A4zZTqq3LAG4WZ7GyElzpX1Cqe3eq6ARfYudvcTh3hZyMdRgBx3Q84geKRsno9ThzO2
 PHXKKioygDFMGrjimrASrL65Ah+J+0E2KFwdvmYHfdDfjpiwJz/L9d9lN0JcRb4wTvcn
 wkE6++il8SjSMrCCfZUs1EqxTNRxLAFXAic76J9Z1RUVpGELhI+oGGKHoEXVLCku77Lw
 dtJw==
X-Gm-Message-State: AOAM5320Ecid9wK78hGENpS/a6I7JkNKrt2LAuYkTPXI+DL/0TCdCfE1
 ZXgzJtegYjG90l85qdiUoDiBVCuXDDtxvQ==
X-Google-Smtp-Source: ABdhPJyGNGJLWjtpQt6VWEH0GDt4QPdBW0YygNs9OGuzEy6gJ7TJbZi4KRSzgdRBTorPSL6E6RSiiQ==
X-Received: by 2002:a63:1666:0:b0:3fd:a62f:94a6 with SMTP id
 38-20020a631666000000b003fda62f94a6mr12034615pgw.360.1654634207584; 
 Tue, 07 Jun 2022 13:36:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 43/71] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
Date: Tue,  7 Jun 2022 13:32:38 -0700
Message-Id: <20220607203306.657998-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

These SME instructions are nominally within the SVE decode space,
so we add them to sve.decode and translate-sve.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 +
 target/arm/translate-a64.c | 15 +++++++++++++++
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  5 ++++-
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 789b6e8e78..6bd1b2eb4b 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -29,6 +29,7 @@ void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+bool sme_enabled_check(DisasContext *s);
 TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 029c0a917c..222f93d42d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1216,6 +1216,21 @@ static bool sme_access_check(DisasContext *s)
     return true;
 }
 
+/* Note that this function corresponds to CheckSMEEnabled. */
+bool sme_enabled_check(DisasContext *s)
+{
+    /*
+     * Note that unlike sve_excp_el, we have not constrained sme_excp_el
+     * to be zero when fp_excp_el has priority.  This is because we need
+     * sme_excp_el by itself for cpregs access checks.
+     */
+    if (!s->fp_excp_el || s->sme_excp_el < s->fp_excp_el) {
+        s->fp_access_checked = true;
+        return sme_access_check(s);
+    }
+    return fp_access_check_only(s);
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 62b5f3040c..13bdd027a5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1286,6 +1286,19 @@ static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
     return true;
 }
 
+static bool trans_ADDSVL(DisasContext *s, arg_ADDSVL *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s)) {
+        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * s->svl);
+    }
+    return true;
+}
+
 static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
 {
     if (!dc_isar_feature(aa64_sve, s)) {
@@ -1299,6 +1312,19 @@ static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
     return true;
 }
 
+static bool trans_ADDSPL(DisasContext *s, arg_ADDSPL *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s)) {
+        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * (s->svl / 8));
+    }
+    return true;
+}
+
 static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
 {
     if (!dc_isar_feature(aa64_sve, s)) {
@@ -1311,6 +1337,18 @@ static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
     return true;
 }
 
+static bool trans_RDSVL(DisasContext *s, arg_RDSVL *a)
+{
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (sme_enabled_check(s)) {
+        TCGv_i64 reg = cpu_reg(s, a->rd);
+        tcg_gen_movi_i64(reg, a->imm * s->svl);
+    }
+    return true;
+}
+
 /*
  *** SVE Compute Vector Address Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a54feb2f61..bbdaac6ac7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -449,14 +449,17 @@ INDEX_ri        00000100 esz:2 1 imm:s5 010001 rn:5 rd:5
 # SVE index generation (register start, register increment)
 INDEX_rr        00000100 .. 1 ..... 010011 ..... .....          @rd_rn_rm
 
-### SVE Stack Allocation Group
+### SVE / Streaming SVE Stack Allocation Group
 
 # SVE stack frame adjustment
 ADDVL           00000100 001 ..... 01010 ...... .....           @rd_rn_i6
+ADDSVL          00000100 001 ..... 01011 ...... .....           @rd_rn_i6
 ADDPL           00000100 011 ..... 01010 ...... .....           @rd_rn_i6
+ADDSPL          00000100 011 ..... 01011 ...... .....           @rd_rn_i6
 
 # SVE stack frame size
 RDVL            00000100 101 11111 01010 imm:s6 rd:5
+RDSVL           00000100 101 11111 01011 imm:s6 rd:5
 
 ### SVE Bitwise Shift - Unpredicated Group
 
-- 
2.34.1


