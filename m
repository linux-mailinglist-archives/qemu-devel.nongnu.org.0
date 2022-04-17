Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CA55048F3
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:36:15 +0200 (CEST)
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9kr-0006AT-ML
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xO-0001YP-VP
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:07 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xL-0003TI-OZ
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id k14so14987299pga.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHPYNe1DqPRag9orJ+BvIVcsXKhWsdyBbed7JfVXS9Y=;
 b=v3ifIdMXFqxZJbts6cFfjOHvY7Q27JcEX/6KmdKmxur1sReuVOSq0IKVlQWM1hbcJT
 LMAKoVVOMy5ONsRHL9GdfIEc/TnSQtgK1exhU5jXL6LuM9ApH2Kw4N92Jc0JIR1twpIF
 mml99lA89i5+vBeg6lDV4cp4JCzyNZpw25UaoGmVll/KByXyn98BUMGCFPyXDOsvsCgH
 GLqPu5Czsws/mQB0K4Dcmx+0i7oVNt6tGImbmJZFpwRvOpdx2/US54AtFvpJNZMO9Ocw
 vpy1Sxt8blAv+kDMIRM1chNkPGWKKK251eIvrJ1VcoVGOZ7cn6tsQCpqnx3Ng15059Mo
 QoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHPYNe1DqPRag9orJ+BvIVcsXKhWsdyBbed7JfVXS9Y=;
 b=Mu7xleGfUCkHdxK54wwOnamMvY03KlzZxtFzqkxEXpEg7LDdz12a7uWuG7VlNGB8V2
 P+PcA0L7+WltNs/Hit6ABwEeD4jOLrTpXt+36I9k/CipisZEW2CP7JTboLH5f1Nd6Tm3
 yofrhbh94C1WzH6rLrwAnKP6kIdSCSk3/URaHGlTA91lvfDOruaL7zvZrxzJnvaIVHtW
 6PcqN+8/fScuHssIdFQGBRrGuEPWqP3X2tVKEgzDfN8ktPuMkLGnh5HJC8g09EYZtxE8
 aPLbIQ0UoShDQ5opDCTrQZGz8AP6EmdfXUGKu617LKXkq4xbldwWfIjjeGFq6CQscoSX
 YvhQ==
X-Gm-Message-State: AOAM531nPqh9Jb/xBF4AuhOMyt/FS2GRb6HgsKSpzQJ49gGjDsVh2l5m
 7HmSMKgEeT+vYG4C775BGPDdgXaJI4D99w==
X-Google-Smtp-Source: ABdhPJwBJipdVokwOOSTf9iilJ586iJ71NVbGbwZGvFlZp9nfD+nd32AtQQ5MBp29kOi9YV/hsO+Jw==
X-Received: by 2002:a63:602:0:b0:3a1:ec9d:1533 with SMTP id
 2-20020a630602000000b003a1ec9d1533mr7035496pgg.470.1650217502402; 
 Sun, 17 Apr 2022 10:45:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:45:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 38/60] target/arm: Add isar predicates for FEAT_Debugv8p2
Date: Sun, 17 Apr 2022 10:44:04 -0700
Message-Id: <20220417174426.711829-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 76c0dd37cd..20bf70545e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3703,6 +3703,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4009,6 +4014,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
+}
+
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
@@ -4092,6 +4102,11 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
     return isar_feature_aa64_tts2uxn(id) || isar_feature_aa32_tts2uxn(id);
 }
 
+static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1


