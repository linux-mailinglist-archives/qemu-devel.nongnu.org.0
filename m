Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715356830C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:12:24 +0200 (CEST)
Received: from localhost ([::1]:33364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9155-0001xo-MR
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LG-0006Af-CH
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:05 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90LE-0000Mi-O1
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:02 -0400
Received: by mail-pl1-x632.google.com with SMTP id n10so13097341plp.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KwsMd3cs1kMRtBrVlO0pZElFPRsZqBMQRBB6JbUzQes=;
 b=iawU5/781n0h5P5w3Yci6+x3JiCI3jh+kUDROHXJOtZvmUGroIVHe/efdLxuYyq+sD
 3k8Xg2biWNQNDy8r80Nn0dP80nHlV141tdkiE2/oQOWBLY3fpVvIvjYyIyPqa0TpXx2/
 L+aqzkO868m1895MZ2qcETVVQ6Vvq1Ii7vUyafqkap/LQ8vlVdBcoNV/wTJmz6iDDUxt
 51eldjHyC9l8NkMOfaKujKKs1xEq71WQfhcoY4+BZQw152wbLNk+QbtNJ2/Np8MMsm2v
 t4oJ1dPvfgouGnpbCIbNtJ56YQ5ThPHQd9YOWIQKzFrDKQH5PWuUR8HzAskz+ZxkegHO
 i5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KwsMd3cs1kMRtBrVlO0pZElFPRsZqBMQRBB6JbUzQes=;
 b=p5yIx9s2yEk+uuo8wbM9UWOEXVCFnhnSKLMkrF9eTolAjxgynUlSDxDz0HaG4R6WAP
 JF3YV4bPqa1PfRw0A290iFnYoPNENHyrjPWVDKNkfACg80Nvri3uPXLtMRJR8Fwzhbqz
 AsfLVGYlqg9FQSKCTJS53IkeAheJcRwXO5mBc2k1hG2q35yn4x+vKtdQyenXbUYLLRfS
 awpuHvVcCbsyoa3MzDH10xi22Iekv/jM+TKkgodADdsH9p5z1Z6iRZjdQDPctapIXU2U
 pc8FTql11BE1crqwshD5r8FKokyZGTGtvJKolh/nA1ZSRvzs4YoSHXvqDzNEjs0+YoYc
 nCMA==
X-Gm-Message-State: AJIora9jrUwVS2+pdOl5ps5iXbgJwi5jEljeBFfm8G2hcIrL/T/1er8v
 RFBp0Tc5ACYWfyitkrB4gMbRwL5dsfU9DXCa
X-Google-Smtp-Source: AGRyM1vegIyVkd0pAwyoH3vJFQYH7yLDoZjReyaFHQ95nMgeQE9LvHUadpfS6YHcIVump8TUX7I0lA==
X-Received: by 2002:a17:90b:1b07:b0:1ec:c617:a314 with SMTP id
 nu7-20020a17090b1b0700b001ecc617a314mr45944585pjb.214.1657095899881; 
 Wed, 06 Jul 2022 01:24:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 17/45] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
Date: Wed,  6 Jul 2022 13:53:43 +0530
Message-Id: <20220706082411.1664825-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Add streaming_{vec,pred}_reg_size.
---
 target/arm/translate-a64.h | 12 ++++++++++++
 target/arm/sve.decode      |  5 ++++-
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 02fb95e019..099d3d11d6 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -128,6 +128,12 @@ static inline int vec_full_reg_size(DisasContext *s)
     return s->vl;
 }
 
+/* Return the byte size of the vector register, SVL / 8. */
+static inline int streaming_vec_reg_size(DisasContext *s)
+{
+    return s->svl;
+}
+
 /*
  * Return the offset info CPUARMState of the predicate vector register Pn.
  * Note for this purpose, FFR is P16.
@@ -143,6 +149,12 @@ static inline int pred_full_reg_size(DisasContext *s)
     return s->vl >> 3;
 }
 
+/* Return the byte size of the predicate register, SVL / 64.  */
+static inline int streaming_pred_reg_size(DisasContext *s)
+{
+    return s->svl >> 3;
+}
+
 /*
  * Round up the size of a register to a size allowed by
  * the tcg vector infrastructure.  Any operation which uses this
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 908643d7d9..95af08c139 100644
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
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 96e934c1ea..95016e49e9 100644
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
+        tcg_gen_addi_i64(rd, rn, a->imm * streaming_vec_reg_size(s));
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
+        tcg_gen_addi_i64(rd, rn, a->imm * streaming_pred_reg_size(s));
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
+        tcg_gen_movi_i64(reg, a->imm * streaming_vec_reg_size(s));
+    }
+    return true;
+}
+
 /*
  *** SVE Compute Vector Address Group
  */
-- 
2.34.1


