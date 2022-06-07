Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC654172F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:00:47 +0200 (CEST)
Received: from localhost ([::1]:45978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygJi-00016Z-Py
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftL-0007qL-Vg
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:32 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftF-0007Be-HW
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:31 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i1so15790395plg.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCpGQKdd2ynKIQl2a0URRju+a15a7A+73f9CXKIasy0=;
 b=ASO0zUIQjhNW22emiswodrWo5M2+wvQ32cU72N+sB0R+EXPSYmf9iyrEZ1j4lO7zrG
 7VLCvwaW0R746e4jh0X+/Kuefl2YHH2um8PcyYjIit8pjU4TXm/eYnAk7EqZgkDHC+1i
 i4Qhe5ibgZVRavhmlLfZXsYCG9FVjreVfGqmsvyTpSMj5vA+n96+xTTNIXQ3104ItWiC
 x7ZBN0Sjj3y42hqP1y7qNJxHSGsCZa/Lxv1o4ZlGK+O2rPFK7VBjSwSguHR0hHtynoSR
 uKUBkfwG2o+IXh2oInEoR+81htisDBdMU3637n4OtBAvlFZ4HMfAY+PXuh3tV8Pe4HFn
 UZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCpGQKdd2ynKIQl2a0URRju+a15a7A+73f9CXKIasy0=;
 b=spiAHgCO4jFmbu4FmbjWAWJfI+Cb8f9on+x89uCXBEphJE6nP8IQ0bIWVF8qjfYo+U
 KxSsPgqB4fH+u7Npy3TEPV0tugE13ZaWJWKWr7316sqpVMZNDmJFAHtwNo2HJf7qNwUk
 gQtoHENcbLdskv/T3xV5RcgxXh5H/rRglU1gk8fYxBtyFl+/eGPZSp6QBzHGHbrn+0jH
 n1ohLCzs4d6/5lW4lDcLnFmRtYLeWNxvjPI3LR2mlvvvSAVJU4n0DC8s1AVyhcmRNoF0
 MCCBI1LxcpID4SUsKGEeTCvbsF93pW8vsIB6olZVAFDSjiUnlGfSleptPrRk/dkWR7xO
 fOnA==
X-Gm-Message-State: AOAM531kB/7sPkUdW+gltRa57uJT/SwrnzQBu0wImHuRFp6S1R/DujWj
 s/wm86s77nj3POuBcGyfW9TuqWdW5MFHLQ==
X-Google-Smtp-Source: ABdhPJwLQnm3byrQCNnq/soLfAjbyOWxnGk3m/QLuSxbQq0QahD7+T9i3sT0hIJkdnmTbcNfNKgl8A==
X-Received: by 2002:a17:90a:e7d2:b0:1e8:97ac:da0b with SMTP id
 kb18-20020a17090ae7d200b001e897acda0bmr8213127pjb.242.1654634004747; 
 Tue, 07 Jun 2022 13:33:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 19/71] target/arm: Add isar_feature_aa64_sme
Date: Tue,  7 Jun 2022 13:32:14 -0700
Message-Id: <20220607203306.657998-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

This will be used for implementing FEAT_SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2cc28f9e59..ce89ef5dc2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4043,6 +4043,11 @@ static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
 }
 
+static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
+}
+
 static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
-- 
2.34.1


