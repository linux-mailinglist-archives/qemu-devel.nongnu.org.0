Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9F5048B7
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:58:24 +0200 (CEST)
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9AF-0001Zr-N0
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x3-0000hB-DG
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:45 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x1-0003J3-2W
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:44 -0400
Received: by mail-pg1-x533.google.com with SMTP id s137so14959686pgs.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cn62Jvoq3Pb11WwsFWhBF5m4nITQmzUChokYzJD1Jq4=;
 b=eReMNyweJi6MfDh6wje3xHRDFoafz6DelGZ7BTElJiwX1MEN+afQ6vd1k0/ygxxcmH
 I1s06huv/JT0z+TtstYbh0GX1xX8NPOxDh5Eo6hE1u8oIp5wefixtEH0K1VGpVHQEsjD
 2U0LBaFsy9Ud6KIkhsuvStq1om78hlq/HGk8RQQ93GluZ4JlzUTOvB01T0SVuia7mzZV
 wMT7SaAaww5UE8V4FW0kLJU0Vga4gDiSxo2+8uACq5je6JTPsRCTAOSzT/BCabSDdD9g
 zIL+et9OUkR26jvckhb1UsV1Mg6qhfTJJs5fg4Llk3HUWHiNz38TDvOMw08lxbo2r+d5
 yXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cn62Jvoq3Pb11WwsFWhBF5m4nITQmzUChokYzJD1Jq4=;
 b=a4lZ76YK4CkbMMehU7wgK+i1IgNtmfwgA72R86nvWzlaykSW8rPeXX5FW0U2W5Kxtw
 dWkGtzfm46WbC4qFWSCj6AO7AebFktTK1VultlDdhgN4MVsnbeKRWpD4UHeVetd1xgI9
 GAVGItKjtOZzRWVqZsET36YWtoQM0r/Y87g+gLN+liqWYxA0sIMam7wCRWqhpXRyMjcu
 NyBVo3moGj13fxHd0pLtidBV6iG4DG8F0LV4g1JO8aRjcEODxKCTxSrM1E1ZCbo6OFof
 iR3mtliPRwoaxR5z9rbNYAEA3Nwwrs61Mh1v9Yg+zjGyquQktN3Hfok+4ZluND3lX/Is
 iXfQ==
X-Gm-Message-State: AOAM531caEK2tKWtNkPAzuJb+RZCMKdVbca3MiD7yL9QX2aYfoo/iD9V
 yCAC+ARVLnnrFs9gHCLV1KaWudPcIBXlyA==
X-Google-Smtp-Source: ABdhPJxesFE84CbAwHsk14MoGwdH69oHqJNQ34VgzOp7G6kkrkChdGeiEuMU//LRXA0ia8VvoSYRFQ==
X-Received: by 2002:a05:6a00:b94:b0:50a:5ff2:bb2a with SMTP id
 g20-20020a056a000b9400b0050a5ff2bb2amr5172146pfj.56.1650217481745; 
 Sun, 17 Apr 2022 10:44:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/60] target/arm: Simplify GEN_SHIFT in translate.c
Date: Sun, 17 Apr 2022 10:43:40 -0700
Message-Id: <20220417174426.711829-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of computing

    tmp1 = shift & 0xff;
    dest = (tmp1 > 0x1f ? 0 : value) << (tmp1 & 0x1f)

use

    tmpd = value << (shift & 0x1f);
    dest = shift & 0xe ? 0 : tmpd;

which has a flatter dependency tree.
Use tcg_constant_i32 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6b293f8279..57631c9fa1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -552,16 +552,14 @@ static void gen_sbc_CC(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
 #define GEN_SHIFT(name)                                               \
 static void gen_##name(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)       \
 {                                                                     \
-    TCGv_i32 tmp1, tmp2, tmp3;                                        \
-    tmp1 = tcg_temp_new_i32();                                        \
-    tcg_gen_andi_i32(tmp1, t1, 0xff);                                 \
-    tmp2 = tcg_const_i32(0);                                          \
-    tmp3 = tcg_const_i32(0x1f);                                       \
-    tcg_gen_movcond_i32(TCG_COND_GTU, tmp2, tmp1, tmp3, tmp2, t0);    \
-    tcg_temp_free_i32(tmp3);                                          \
-    tcg_gen_andi_i32(tmp1, tmp1, 0x1f);                               \
-    tcg_gen_##name##_i32(dest, tmp2, tmp1);                           \
-    tcg_temp_free_i32(tmp2);                                          \
+    TCGv_i32 tmpd = tcg_temp_new_i32();                               \
+    TCGv_i32 tmp1 = tcg_temp_new_i32();                               \
+    TCGv_i32 zero = tcg_constant_i32(0);                              \
+    tcg_gen_andi_i32(tmp1, t1, 0x1f);                                 \
+    tcg_gen_##name##_i32(tmpd, t0, tmp1);                             \
+    tcg_gen_andi_i32(tmp1, t1, 0xe0);                                 \
+    tcg_gen_movcond_i32(TCG_COND_NE, dest, tmp1, zero, zero, tmpd);   \
+    tcg_temp_free_i32(tmpd);                                          \
     tcg_temp_free_i32(tmp1);                                          \
 }
 GEN_SHIFT(shl)
-- 
2.25.1


