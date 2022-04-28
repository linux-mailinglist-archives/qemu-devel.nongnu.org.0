Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B525137B3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:05:25 +0200 (CEST)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5hs-0002rb-Vl
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ju-0005Yx-RO
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:40 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jo-0006Pw-V8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:37 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso5406149wme.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BSZfo8jRneEsZag+HVXAvkj5GFQ4I8x4TqSm9m7pToM=;
 b=qV+weeoaOyzBck04vNXhFOdiMd61ZiK+gAeb5kiGuvBrwIJNXSkdmct/K2K4/0V/wO
 a8WqraM3P+kEjawG7Ih8m5l4+INHOf59fp7WqzL8Q2Y/nwYwSdMciiaDiED5G4vucjf6
 skTyMBIJ5w1DmEln0qtu08XpXwBhkeDL+NbfnENunU4mc02KZ04RBZgEK8hxi5VhK/L+
 lg9QSto70V7LrmeQZlq6TPvai5LDgGiHNJf0L54eX2kkG3IRQ9GdfyJw8hkA0NQAOoDp
 gnyWudhIbo10+Gz0N0Cbclu3c9hJql+pEJAvaFpteyRA91unA7TBK4PFUGkwNlWT/UjD
 i0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BSZfo8jRneEsZag+HVXAvkj5GFQ4I8x4TqSm9m7pToM=;
 b=ht4J2AjcbzbsQ2uiymz1w4Csiqy5i1x1BfL0n66nZzl3q2twFRZ6Eyjlt/QXXFdYe4
 AHGh2q18pcmNcMEq3gB4XHyIOHVTnIyQVosmnA6Gyblf+elQKIdZHcT3XDphxjNnsI24
 xte2896VMod1XG3BESuU098blEu4i43s12ELcjMtVYuNrqd9uKDtL/Cb3YTWwdQoOAQP
 m6ngWPHUfUKs8RlWo53gGaujflRlJN56V0qQ5/mUd2cw5GzQugtvhVCL6BK3s6UR+Hsz
 VR6sv/NZBo11UgA5gNmTqBRSpUleqbCuyLVGPmzG19b+56xL/XZXTst0f3nVpJ/sQqIU
 z4ew==
X-Gm-Message-State: AOAM532tfUZ9ECSNSfLkJE0bLgvZ8Kd9FAk+m+e8kCGr1c0lxwRkSK3I
 qy3LmlJS7MhMIBa7x0KpWoqBZ9LcaV2fsQ==
X-Google-Smtp-Source: ABdhPJy2deWD578kK2GUH1PkVGk38O6n1vf+ri2xcKM+QRcvPAdQ8np1abQBQCFRxaGAI9LEnR3J/Q==
X-Received: by 2002:a7b:c0cb:0:b0:38e:bac7:3c40 with SMTP id
 s11-20020a7bc0cb000000b0038ebac73c40mr31727922wmh.6.1651156831248; 
 Thu, 28 Apr 2022 07:40:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/54] target/arm: Use tcg_constant for v7m MRS, MSR
Date: Thu, 28 Apr 2022 15:39:34 +0100
Message-Id: <20220428143958.2451229-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Message-id: 20220426163043.100432-31-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cc540f2b47f..b604a820c00 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6369,8 +6369,8 @@ static bool trans_MRS_v7m(DisasContext *s, arg_MRS_v7m *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
-    tmp = tcg_const_i32(a->sysm);
-    gen_helper_v7m_mrs(tmp, cpu_env, tmp);
+    tmp = tcg_temp_new_i32();
+    gen_helper_v7m_mrs(tmp, cpu_env, tcg_constant_i32(a->sysm));
     store_reg(s, a->rd, tmp);
     return true;
 }
@@ -6382,10 +6382,9 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
-    addr = tcg_const_i32((a->mask << 10) | a->sysm);
+    addr = tcg_constant_i32((a->mask << 10) | a->sysm);
     reg = load_reg(s, a->rn);
     gen_helper_v7m_msr(cpu_env, addr, reg);
-    tcg_temp_free_i32(addr);
     tcg_temp_free_i32(reg);
     /* If we wrote to CONTROL, the EL might have changed */
     gen_rebuild_hflags(s, true);
-- 
2.25.1


