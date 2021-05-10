Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41B378C5B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:39:46 +0200 (CEST)
Received: from localhost ([::1]:55962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5CL-00080E-EA
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z3-0005pB-Qt
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z2-0003Di-5h
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:01 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso11045369wmj.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iAZOHv3Mz91JXANOFYbo1E1cKSNrhKoMABMJmJt4HPc=;
 b=GN7cUI83kVTTGcYnMJwRU5hadMV9brTUVyiFwC9RFzeMqFUFGh9QdXcHMHGMukSeBB
 mhQw5jjMDgBTlUCu2SvX6uxXyOdHfWut0c5rfPUjBh7y+Y1mrx4JCYQ0FbLUIzOtfvUp
 xWonzjzMYGCJflhzonoc6KW4S/B/jwKzPeToE7P7MCT5TkK+T8A4nmMt50KU0tEAQOfr
 NTUKEdOrWyFFudu/oEMgBp3C+mI2lEwgvWeQCfTKaKlqtP4oMBxBR3U05G3yDNVmKH7j
 13MtCrSaRr1hmKpZMEL9+YrO89vvVp9IJVxpSFh1hsI5WJOQ+KWB65rOTSD7MxIV0zsf
 NGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iAZOHv3Mz91JXANOFYbo1E1cKSNrhKoMABMJmJt4HPc=;
 b=V7rxxubolDkcNgA2IfFu1DOC4AUr9m+YuhbM/086PTJuca8v26bYsHzmOFFDtH8Q4E
 vasrgb3l6xR907XJoj7XRpewplBZd/yiYRmnZerVnCVp7bZ4C1Z9r9XT92V7+BBv9cLG
 z4YdmymeY8terAPKYEovj7wpy32cS3UfO/l+yXf6W5D/AGjIsIfHAqA58IabXTBrBgJV
 k7Rpp8e5J195/Zpr5uL59Yy2HzMRlXtsESCQQGc8Q3tp5Ysie9+oXsI41/WzH/ZvsSil
 X0STAqbhtN+M6QckTgNJMayb/uwazf/SxQFlBB94c5aa20CI72D4cNbayrHccxfrN1wJ
 00tw==
X-Gm-Message-State: AOAM533h/k1eOcFc/1H3V59e20i62wZ1QvelC/0qSu9U4YtITcdjaBYP
 4NWBbmwe6zYVoEw9xJh+9VilnUh0KzHPqw==
X-Google-Smtp-Source: ABdhPJy4EKz/C94LDybTBgWSScev6ZCfPAo1NC8tFgSvw3oyoZ/jKtpTjjAh97KxfLudV8z5TojJFg==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr26309087wml.34.1620649558570; 
 Mon, 10 May 2021 05:25:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/26] target/arm: Move vfp_reg_ptr() to translate-neon.c.inc
Date: Mon, 10 May 2021 13:25:34 +0100
Message-Id: <20210510122548.28638-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function vfp_reg_ptr() is used only in translate-neon.c.inc;
move it there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210430132740.10391-10-peter.maydell@linaro.org
---
 target/arm/translate.c          | 7 -------
 target/arm/translate-neon.c.inc | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6aec494e81d..095b5c509e1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1215,13 +1215,6 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
     }
 }
 
-static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
-{
-    TCGv_ptr ret = tcg_temp_new_ptr();
-    tcg_gen_addi_ptr(ret, cpu_env, vfp_reg_offset(dp, reg));
-    return ret;
-}
-
 #define ARM_CP_RW_BIT   (1 << 20)
 
 /* Include the Neon decoder */
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index a02b8369a1d..73bf376ed32 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -60,6 +60,13 @@ static inline int neon_3same_fp_size(DisasContext *s, int x)
 #include "decode-neon-ls.c.inc"
 #include "decode-neon-shared.c.inc"
 
+static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
+{
+    TCGv_ptr ret = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ret, cpu_env, vfp_reg_offset(dp, reg));
+    return ret;
+}
+
 static void neon_load_element(TCGv_i32 var, int reg, int ele, MemOp mop)
 {
     long offset = neon_element_offset(reg, ele, mop & MO_SIZE);
-- 
2.20.1


