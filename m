Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF851378A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:58:17 +0200 (CEST)
Received: from localhost ([::1]:49420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5ay-0007JB-U4
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JQ-00051q-42
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JO-0006CH-FV
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e2so7081006wrh.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TToOuQ00Opv88KW2xx2NAPX9wVF7lWH1d++1SoemDaM=;
 b=Rx7twn9sY5TvYgAGIE1bwamKqLQMepvZtdhK56iXJweHPdteBGFW5ffF6zQbkEpz6/
 jFGgb2n3ptWnZbiuiki3acY1RNhhpnmRNDL7ulmYDfhv+7HXdl8tj0eGl+6+EI4kGAbP
 /pkrs1rcG1UO9PUs9PJle+V+fOcX/wCUb1qADIK7Mz2oSBsA/m5LZ+0F/VMAPA9fHLB+
 T+Cg82PpPqXP802hksT4Y3MNbnr6FJQy3wl1EewpGvYAp7fBR2gyO2zzKe2MV6HhU+/Z
 UDxkDnZupwMUo70gZadPsMf64jcfGrSOIxC9LDM/UffRcpbgoS0o58w+Ug0vRFikGoBX
 sRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TToOuQ00Opv88KW2xx2NAPX9wVF7lWH1d++1SoemDaM=;
 b=jadKNwBSv4A4fjmnj72QeaiOTRhmBdbmFVr5eL0p2d0NUSod3Ix8eRpKPUCNzWAfJj
 ld9JbZTg1fj3psnvFj7azD/ThNmpdjs7ZLObi64PuNSUPsHk/YNH2IOlP9K2gI33M10/
 VoKobtAulKpEcO9mvyeq4LgY7KFHzmKIDH4XLPdkGVnzkw5mv2sna04L5ojKg5vkHxLm
 KKKuzy2lfeo1HItG//RVe0XAzQeyFbU9v9IgzUKPUPr0OiSn6cWBVgofiSMrdJEabOXG
 +GVNXrxUMqp0CG3rcF2YMCh1ZcRIjFmVZGAL0kjm4sImayWgLNK2A5rAE2yFPkAQBHKN
 o2tQ==
X-Gm-Message-State: AOAM533ggcTYLtm6Y5Ggp1mosE1N3TWfkLxuUsfytlwTYX8w7+cRiBIv
 MxBdmJfHMzc0jgA0R4Ef9ULtzVYYFHJwXg==
X-Google-Smtp-Source: ABdhPJwLcopbo5ueeU1c6qTiIfRtU0Q/VQfHwdE6tY3Bm5D3omVKPCxp7m+uFII0JF5vCXC2y+Vx3A==
X-Received: by 2002:a05:6000:1814:b0:20a:cb21:8781 with SMTP id
 m20-20020a056000181400b0020acb218781mr24883929wrh.488.1651156805037; 
 Thu, 28 Apr 2022 07:40:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/54] target/arm: Use tcg_constant in gen_adc_CC
Date: Thu, 28 Apr 2022 15:39:08 +0100
Message-Id: <20220428143958.2451229-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Note that tmp was doing double-duty as zero
and then later as a temporary in its own right.
Split the use of 0 to a new variable 'zero'.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b0b5e8b26d2..5c0fd897d6c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -814,15 +814,15 @@ static void gen_adc(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
 static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
 {
     if (sf) {
-        TCGv_i64 result, cf_64, vf_64, tmp;
-        result = tcg_temp_new_i64();
-        cf_64 = tcg_temp_new_i64();
-        vf_64 = tcg_temp_new_i64();
-        tmp = tcg_const_i64(0);
+        TCGv_i64 result = tcg_temp_new_i64();
+        TCGv_i64 cf_64 = tcg_temp_new_i64();
+        TCGv_i64 vf_64 = tcg_temp_new_i64();
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        TCGv_i64 zero = tcg_constant_i64(0);
 
         tcg_gen_extu_i32_i64(cf_64, cpu_CF);
-        tcg_gen_add2_i64(result, cf_64, t0, tmp, cf_64, tmp);
-        tcg_gen_add2_i64(result, cf_64, result, cf_64, t1, tmp);
+        tcg_gen_add2_i64(result, cf_64, t0, zero, cf_64, zero);
+        tcg_gen_add2_i64(result, cf_64, result, cf_64, t1, zero);
         tcg_gen_extrl_i64_i32(cpu_CF, cf_64);
         gen_set_NZ64(result);
 
@@ -838,15 +838,15 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
         tcg_temp_free_i64(cf_64);
         tcg_temp_free_i64(result);
     } else {
-        TCGv_i32 t0_32, t1_32, tmp;
-        t0_32 = tcg_temp_new_i32();
-        t1_32 = tcg_temp_new_i32();
-        tmp = tcg_const_i32(0);
+        TCGv_i32 t0_32 = tcg_temp_new_i32();
+        TCGv_i32 t1_32 = tcg_temp_new_i32();
+        TCGv_i32 tmp = tcg_temp_new_i32();
+        TCGv_i32 zero = tcg_constant_i32(0);
 
         tcg_gen_extrl_i64_i32(t0_32, t0);
         tcg_gen_extrl_i64_i32(t1_32, t1);
-        tcg_gen_add2_i32(cpu_NF, cpu_CF, t0_32, tmp, cpu_CF, tmp);
-        tcg_gen_add2_i32(cpu_NF, cpu_CF, cpu_NF, cpu_CF, t1_32, tmp);
+        tcg_gen_add2_i32(cpu_NF, cpu_CF, t0_32, zero, cpu_CF, zero);
+        tcg_gen_add2_i32(cpu_NF, cpu_CF, cpu_NF, cpu_CF, t1_32, zero);
 
         tcg_gen_mov_i32(cpu_ZF, cpu_NF);
         tcg_gen_xor_i32(cpu_VF, cpu_NF, t0_32);
-- 
2.25.1


