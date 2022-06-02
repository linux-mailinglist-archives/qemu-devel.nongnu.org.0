Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA8153C0C6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:24:37 +0200 (CEST)
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtF6-0002C2-Kz
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsk9-0001IO-31
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:37 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsk6-0000s0-0D
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:36 -0400
Received: by mail-pj1-x1035.google.com with SMTP id gd1so6030225pjb.2
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kOf3bIlPmmzxnCo3oo6dl2Yq5IfQQ5VBzpADjTzwQdM=;
 b=YdFphnRlGHxBWuiWUjrcCe6DV8Kydbww5mcgMeo3Iy0bLrf7SA5ffCA/dyeEttwrfQ
 8G/5aM0IykSrgtpBYdFpyxVFLJhR0ONq9jCbHgZ5RfMUB17veC+g3CntOOA6EdDX+Zev
 N1dSuq15jA8IdlEJKh2Tf2mUZgRXruOvWgnAQnRfAa5UnMFAFAsPqA6TKWTvqzgOU78r
 hpNVj4x4e15sAXNMo2H407FEpFTPByUT3ToUoFv787iXJBTCEfO6egfTDFY2oVmpElJT
 lz5gGq5ah1XLAp+e+f9SCFHGDYZ8YC4KPD+NI/GjZvMtLD4sikuR9u7PiCwaGIBm2rOX
 PJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kOf3bIlPmmzxnCo3oo6dl2Yq5IfQQ5VBzpADjTzwQdM=;
 b=OX1Q4aKaiHwTrvxGlMeuQ1sO3ueL55oEBfHcJffhFjL78kaKhujzCIRXf0vMpBq0jo
 yrUljsWYU/yHdO52uSNzEMbwaolUQ3XJq/r3mgk/dO7maE8jkuPg0o7rg1eNvC0FJF6O
 WEJfUf2WAOsUMD91V7kwfxyZVR25sApsH2wwM9KSqK0/BvPeXP/nQh7mzYfFjDftIdPI
 5kqOQs+jPg3mAJDSLpKQDblm7TIyHv26QIYsIJnSQYwBm5w5CzUcG7M7VpAEz+WOHhqG
 /KXKxG77JXKpiRFZAh7EbWGPxNDpjoQZBeE/CJjD6BVIh5m0eSOVRNqxwlGdc674wh6f
 Escg==
X-Gm-Message-State: AOAM530K3cBFYC977dDYhL0qIXrbLg/oeAhRwhw41a4sTSt7pGzfIc5P
 bCYpugETvhz8/pMy2JRogDqTZXn792HvJQ==
X-Google-Smtp-Source: ABdhPJyoI9WdFiLkKoY5UL6t9FTFB95sffVS3Tf08uyWgqG3MZhb02SxciKfSbOYpeAEU+iTHGHiog==
X-Received: by 2002:a17:90b:1a81:b0:1e0:3314:2447 with SMTP id
 ng1-20020a17090b1a8100b001e033142447mr41781599pjb.121.1654206752672; 
 Thu, 02 Jun 2022 14:52:32 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 43/71] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
Date: Thu,  2 Jun 2022 14:48:25 -0700
Message-Id: <20220602214853.496211-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

These SME instructions are nominally within the SVE decode space,
so we add them to sve.decode and translate-sve.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 +
 target/arm/sve.decode      |  5 ++++-
 target/arm/translate-a64.c | 15 +++++++++++++++
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
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
-- 
2.34.1


