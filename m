Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE138B35A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:36:25 +0200 (CEST)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkim-0007mF-OU
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbO-0007ns-Uf
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbM-0000dy-5h
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id a4so18143059wrr.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DnbJwhTPFVUYyLIk68eWKoH+oBvtevWOvwYTKcV4l1s=;
 b=L4DnhIB3svIofXAgpA318UFWOvnhwsrRI0h1TdkUhsRL3HiQrI70S/wvTslhiD8XGn
 c049/S7gDtBVKsonySz209zRJzE6VeMbLh2UHfbGkjp+zvH6Y9Rcrh4zngZRIs+T95FR
 AovXAagxmolPrGQpph0F6JUCCHC3GqCCnKAbsx15eIy0INi8XrH4AjSqtfwOsnjEpVf6
 P3FgnK+I2n+BeNgMGhB6sT5dHILTmITXlz3jleuJv6xEq7wCBPbyo5FuC1ZhZ31viPvU
 UX5W4g3En/SHEA4vVm6zLzW1cFtxanCJVrsiOdVXmGXZG7yJegfPcAKGgz0KicoMRyAs
 1jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DnbJwhTPFVUYyLIk68eWKoH+oBvtevWOvwYTKcV4l1s=;
 b=uVRLvWI1nAayWrtgRzWOufZf3VVktzTr24LQdWTmSt8+ZeF9SBbk8+iFag/jDA4i30
 1OkQYMbDzpE/XC2ymDj7fccrUTJcOYTk2zParI4XPQhDHyDHo+e+woJATEqQe7QJFCZQ
 lgWHEtJce4yE9ebiW6ytkvM7ekDemXTvuxR9Kqpog2yEDJdAsT4QzZ/jKILnbDBfbE2y
 sYZBJWLWne7UMca8/ud9GMtIUQ/AsTAvHS0qly6vC/tD3doxaTk4ODbnRNsNb8ewPUKL
 IRjGCbOeSWP2XwQRzq9yEcGWKnVOI4zxYU8hKAyLVGB7CRqCUEdzypwdn4kDSqpE1ElU
 bECA==
X-Gm-Message-State: AOAM5337LtFlCl6blgNIXbriBh0LyYaSUqHxO8dTO+zO8smzNhDz45lu
 l3sOvC6T0WNgJh1xaLlBmUzq2TSBNoc1Xp2x
X-Google-Smtp-Source: ABdhPJww6k6I5pIwp1Cg5W+qBZampPU2mIR3bso5c0u6WcqYf11LzeVllz5RXfj1bxwGt4oMfRTG1Q==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr4763696wrs.303.1621524522868; 
 Thu, 20 May 2021 08:28:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/9] target/arm: Add isar feature check functions for MVE
Date: Thu, 20 May 2021 16:28:32 +0100
Message-Id: <20210520152840.24453-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 target/arm/cpu.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 616b3932534..d037f5530fc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3801,6 +3801,28 @@ static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
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


