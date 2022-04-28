Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F9F51374E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:50:46 +0200 (CEST)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5Th-0004gV-VT
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JY-0005AY-LL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JX-0006Ev-0W
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id v12so7060266wrv.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=amJ1wAQFFeMkaEoQ+Syu7vcVWtMApQ5amALa28nj+ss=;
 b=zkfeXwDBsfYaPv8+McK/TKqt01VJZefy15cuHrta4VBtSYUDe9UwgBQn1LXCaduYhr
 MqxRAIg9N3BgDdo57rUy9YRBmhRBnZPHVgfw56S0ibbsglSHDfWgky0LPJm9+1pB2YGs
 b11c3xuMrsD+R85BzoUCvxQEyNlsvaGddmdyAwCv7gcl1fqALsAPN0W9tbLXB2IVaz4A
 M+9YSwGzuWAjWsc+jFVDwDLOpz8GTSYW+/nEh53fuFnAEif4dkGbI9PMGJkl3+sfP+V6
 OPWgrRgqA0dtv11nrWTOJ7nBu1IOexJeuaXLKxCDcgEr8Sw5uyvv9dRHTapLabxtRjcU
 +B3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=amJ1wAQFFeMkaEoQ+Syu7vcVWtMApQ5amALa28nj+ss=;
 b=nK3PODzOpbhR6vg3toapjYgxIAnycP3LgKO7QDhZIOvbodq0DKYe4Ydql0tpEnaBhQ
 4CuCeF7RNN9YLK/9rUahCHEzV47epyfJmi6O46YETohN2ALDKo9vKPwDAwq3bwrG0bgO
 4Hs8QyO21vNvf+3rsA5bvaZA5CoeZsZ0m00gNQawT/hg4xiHoujdjLujFNiuI8QHdh21
 KWOZGpwyLBa1RsrshL7boaMoHWZGVwM93j1PngG8VWzsrA566fQddHj3DiivJpPFbWZw
 J7IId+VArxm5BY/RHcll81Z0oDNHvq2lmfYt/EGjpm6cTW4wzpbx6zSrbu/fd3sOhZDY
 3Pcg==
X-Gm-Message-State: AOAM532ALNqOzai8RDM2rSVYKCUU02sk5h6X5ikNm3IFiywXleMnFPqE
 AAefME9E9aZyhfVkbF6mPhOnP032SauPMQ==
X-Google-Smtp-Source: ABdhPJzVjGOKPIALZWTSHG9TMvBMOIfWv17aFMSDJwwBvUuzUwCOLAnI6mkLzLj+FSM70ojKgWV3Ew==
X-Received: by 2002:a5d:4e92:0:b0:20a:cafc:ebf1 with SMTP id
 e18-20020a5d4e92000000b0020acafcebf1mr24599957wru.17.1651156813725; 
 Thu, 28 Apr 2022 07:40:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/54] target/arm: Use tcg_constant in disas_add_sum_imm*
Date: Thu, 28 Apr 2022 15:39:15 +0100
Message-Id: <20220428143958.2451229-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-12-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4cdc869d522..6c88772eb32 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4178,13 +4178,12 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
             tcg_gen_addi_i64(tcg_result, tcg_rn, imm);
         }
     } else {
-        TCGv_i64 tcg_imm = tcg_const_i64(imm);
+        TCGv_i64 tcg_imm = tcg_constant_i64(imm);
         if (sub_op) {
             gen_sub_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
         } else {
             gen_add_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
         }
-        tcg_temp_free_i64(tcg_imm);
     }
 
     if (is_64bit) {
@@ -4232,12 +4231,9 @@ static void disas_add_sub_imm_with_tags(DisasContext *s, uint32_t insn)
     tcg_rd = cpu_reg_sp(s, rd);
 
     if (s->ata) {
-        TCGv_i32 offset = tcg_const_i32(imm);
-        TCGv_i32 tag_offset = tcg_const_i32(uimm4);
-
-        gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn, offset, tag_offset);
-        tcg_temp_free_i32(tag_offset);
-        tcg_temp_free_i32(offset);
+        gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn,
+                           tcg_constant_i32(imm),
+                           tcg_constant_i32(uimm4));
     } else {
         tcg_gen_addi_i64(tcg_rd, tcg_rn, imm);
         gen_address_with_allocation_tag0(tcg_rd, tcg_rd);
-- 
2.25.1


