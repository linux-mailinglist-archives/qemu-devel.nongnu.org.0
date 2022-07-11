Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB146570602
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:43:43 +0200 (CEST)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAudS-0005o9-Vz
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvV-0006Z7-SN
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:18 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvR-0002pb-Lk
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id o8so3085856wms.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/RhdQJhnWDHCgh0k4clVqzvRti9Nt0LbFx159lSbzvk=;
 b=VJjAg4wx/p/h/PPmbx3PBM6VoRZwZ32EbVVBlfUMS/U4ZuciLWkmy+NHVLM/5sPYiq
 /JwLXvs4QKRtKKfR9gwAuwTT7YE0CYEsr0qRAytoMTcJciHBxs1CbNqNm+xTQ5fB7bfA
 RLK9Sywq7K3uMIYRYpRzIguBfuQPgMGs+PagIS/5itsD99s/CGUI7VE6t0Lm8KxPakqt
 eW2ueor+X5HLOJpJhLewvueVZ3el4ipbMosMfdCjN7N32rP8el/V/l1wvhdYe2An58hM
 gij/JacC3sB2d0RcnOTq0O6oIB9srW3Y97nv//460BTgmsvIEiWg0D2/pgFGSnI0F7WP
 W7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/RhdQJhnWDHCgh0k4clVqzvRti9Nt0LbFx159lSbzvk=;
 b=DPwnsdRunH0aORvuqOa7phY8FAcNID9YejdAviyN3nhj3jOzqmkrzIiuXrybNoBU0y
 ssm/o9f2g6Q/jRmiZM7804KHnegJAzepUaJS6M+hRLb/XyJBPNCm/IiNMhlCo/7y3JgU
 CXKHuvRqzfvFpaVMgyRP7iMtaTC0UEVxzZjKIgeX10TwL6usX0AbA05KaRaK+k8D85VT
 l/S31kwPI9XE9615dtrN32htPh5uPOvpABpQeMHLMgABay6xZ1qqAy4bcLb+2MYFM8WL
 uitD/sbLkTwgs/VGI6wPYsRLVc/Zyj2P1ElYBNrGpSoojTrhhf+PPfhZ+OajTkNvZSD2
 DtiA==
X-Gm-Message-State: AJIora8Y1h0Fw3MEu+nNYGB7+MrdI0+UuJuR5dFAOsStkTIrDFaaavmK
 Qfi9bU49kHdMdlkMoLYZZRNjRIdQOMmI5w==
X-Google-Smtp-Source: AGRyM1su7+QBssXT+sqal+2n2jMxJVS3XqW+Et61W8PMMcMSv8TESd+7A13Svia9v9WQ+9UGLyLObg==
X-Received: by 2002:a05:600c:4e4c:b0:3a0:53a2:48b5 with SMTP id
 e12-20020a05600c4e4c00b003a053a248b5mr15482318wmq.174.1657547883594; 
 Mon, 11 Jul 2022 06:58:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/45] target/arm: Mark LD1RO as non-streaming
Date: Mon, 11 Jul 2022 14:57:19 +0100
Message-Id: <20220711135750.765803-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sme-fa64.decode | 3 ---
 target/arm/translate-sve.c | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 2b5432bf856..47708ccc8da 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,6 +58,3 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --0- ---- ---- ---- ---- ----   # Load/store FP register (unscaled imm)
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
-
-FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
-FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5182ee4c068..96e934c1ea9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5062,6 +5062,7 @@ static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
     if (a->rm == 31) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
@@ -5076,6 +5077,7 @@ static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);
-- 
2.25.1


