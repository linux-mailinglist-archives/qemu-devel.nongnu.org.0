Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECA839A537
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:02:06 +0200 (CEST)
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopnJ-0003M1-0X
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkU-0007fk-MQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:10 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkS-0006ju-TH
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:10 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o2-20020a05600c4fc2b029019a0a8f959dso4008728wmq.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uDfokmVezSAHwLgnVmTXn57igOgF6mkmm4tytSe1MNo=;
 b=IT84UwMpdZp41moSF472dvDgsCPwwVwZUBDq5BiaDJfO8EyFOdF/4u3xlvTbRZVwsi
 MLhm3r5JcbhqKLLnohHoNPxEy6rvCpyQ+wQ4rY5gZVFtPFD6F1WiTyqDdK9GDONXC+K1
 AueY8brRX76LAZwszanhYiyKF0jMlxtYSm8qouOZcwJaE8qX0DwVfxXfxCG/PvH6o4Rp
 2xwLo619OSFs0N0uZPa0XBC1CS9M/4VdqDMXJO3mf7JZZuRn5ROIq1jJVcRBBt0j/Fx2
 IEJ7Y+0cumARzIWES++tgWQodc6LTjOJg1PD/V+ZkrU0fXpIfRln+Y44d5Rhz0vCglNX
 ycTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uDfokmVezSAHwLgnVmTXn57igOgF6mkmm4tytSe1MNo=;
 b=BbJWJyuC+v3qnsBTTjyx8MQDdYS27LhEI7gko53N/ogtpS7Flyc6HhiV9GFqqNYQjP
 9r+BaqIJ9/hkI7L5A+8hgelBj6uqppINqOMq3Y/yiAiUs5IAkGeJ0N1FNjTTvjfzupgd
 kqsgy+XZjezHb3K+atICNLsbvFmCbHHJXFfqxIATB3uQYoKrgYKBaK9qsFbRZXrMNfVq
 Cb80wbG/scdhraK3lzwATDBAKUU21aJ0NX1BMT8EYEzmS00MJJG1kLzuD/4xvl3K1fMm
 xk41TEmd7UcTa3NAn/hYku6q88kkA9Zppeg8KvomklhyimqxZ6h78d0IdiZ0qQ8xJzAr
 lOxw==
X-Gm-Message-State: AOAM533pKTjsWRnYQdPwyJ1c/OyKoH4jPQ8ix9ECGT5PeAdfO6Brh+eK
 PVba/vA8x5daM0Rfl1+Fo7Lnzle/6Cc+mUFA
X-Google-Smtp-Source: ABdhPJyW/UdRNMCgvuwoPX19zam1F5GqyXOxaRhUSF+neI3h/4YB73EYFnlvywpVXKwo+5HRxHbYmw==
X-Received: by 2002:a05:600c:3647:: with SMTP id
 y7mr10934890wmq.149.1622735947480; 
 Thu, 03 Jun 2021 08:59:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/45] target/arm: Add isar feature check functions for MVE
Date: Thu,  3 Jun 2021 16:58:20 +0100
Message-Id: <20210603155904.26021-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Add the isar feature check functions we will need for v8.1M MVE:
 * a check for MVE present: this corresponds to the pseudocode's
   CheckDecodeFaults(ExtType_Mve)
 * a check for the optional floating-point part of MVE: this
   corresponds to CheckDecodeFaults(ExtType_MveFp)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210520152840.24453-2-peter.maydell@linaro.org
---
 target/arm/cpu.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 04f8be35bf0..f1bd7d787cd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3817,6 +3817,28 @@ static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
     }
 }
 
+static inline bool isar_feature_aa32_mve(const ARMISARegisters *id)
+{
+    /*
+     * Return true if MVE is supported (either integer or floating point).
+     * We must check for M-profile as the MVFR1 field means something
+     * else for A-profile.
+     */
+    return isar_feature_aa32_mprofile(id) &&
+        FIELD_EX32(id->mvfr1, MVFR1, MVE) > 0;
+}
+
+static inline bool isar_feature_aa32_mve_fp(const ARMISARegisters *id)
+{
+    /*
+     * Return true if MVE is supported (either integer or floating point).
+     * We must check for M-profile as the MVFR1 field means something
+     * else for A-profile.
+     */
+    return isar_feature_aa32_mprofile(id) &&
+        FIELD_EX32(id->mvfr1, MVFR1, MVE) >= 2;
+}
+
 static inline bool isar_feature_aa32_vfp_simd(const ARMISARegisters *id)
 {
     /*
-- 
2.20.1


