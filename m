Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061D362C29
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:01:18 +0200 (CEST)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYOj-0006vO-G7
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN5-00059V-GC
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:35 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN2-0005aQ-LV
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id w6so4825520pfc.8
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unKgkmmxr7goKYi3rp8VTPEkn4g0CMVgXa5W1kzSLnA=;
 b=eZCVj1PJtk+yFRxOos4AGGE+rvC4ryIdjJ36PaCx2bNm81V7TG7fYy5jB1zVRBVM3L
 fJKiKpfripfA+BsGUzSAMCij1t3sPJnbK2VkwgEVwycFyUdl0j7ouHfAoUK4ISbbKWDC
 uJE94Nrq6hvdvFwqsRVb5TYVKNMjWHN0HTa15iUtmsyLfbFrWhTIIrOUZc5UtiTM1T1I
 TEDkqmyiqjKM8RD9aZI2QsTPWS8wHohfth6M+f5AE+BQjnYrmRCxtMwHSp12jzN5f5a5
 s/XJa9ZhhfprvMVOIWwn3vKzKJj+iCIS22FNNuLbppCpJ3/4tvJHuaDYpxVXmYrMdHWZ
 gazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=unKgkmmxr7goKYi3rp8VTPEkn4g0CMVgXa5W1kzSLnA=;
 b=loe4oDtEL6GjzYck1Ov2laGkJ+8lPSnjqM1JS6D1Tb6hLNCE2yK4i++XK+GvoJwXFc
 mfHZdR2jlEd5JUSFnZqr7KitBpveHsGx1c1/iE+P7+OzujUrzv74mVPTxYjfy624CsUS
 h+xGrS5+cNBT9mWeDKPbCAAhSltsVE/5ykwBHv9HyfWZ4MoTXy5+yYjjMIbRAA5yrRzn
 qBA3IRX0CeHSC+l/FmL2qGoExfcE9CCps0BCW9fl39LSHtJEW1c7n09/fu6Q85cB4iDC
 +TqsJkxNCrR0xz7lLZij8L0l3/pmkJQcfQzEcxDLao5m/FpdF2utLO0qogmMWvibR7Cr
 dJsg==
X-Gm-Message-State: AOAM532nh4gentvRxYLiTIBm0ya16KEXssuABrdohQN1gtM0nnB5yDkP
 H7KjM8BPfb3u4yvBQrVRiflN37ymZLyKrg==
X-Google-Smtp-Source: ABdhPJwGMuYtoaO16hvh+BDAghQGHg4ZDTqMXH4BlauMc8v6/I3sUMvSurQ42tS0cNVUKNIsjvWM4w==
X-Received: by 2002:a63:70e:: with SMTP id 14mr1297073pgh.202.1618617571468;
 Fri, 16 Apr 2021 16:59:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/11] target/arm: Add isar_feature_{aa32, aa64,
 aa64_sve}_bf16
Date: Fri, 16 Apr 2021 16:59:18 -0700
Message-Id: <20210416235928.1631788-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that the SVE BFLOAT16 support does not require SVE2,
it is an independent extension.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 134dc65e34..38db20c721 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3783,6 +3783,11 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_bf16(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_isar6, ID_ISAR6, BF16) != 0;
+}
+
 static inline bool isar_feature_aa32_i8mm(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_isar6, ID_ISAR6, I8MM) != 0;
@@ -4112,6 +4117,11 @@ static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >= 2;
 }
 
+static inline bool isar_feature_aa64_bf16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) != 0;
+}
+
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
@@ -4256,6 +4266,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BFLOAT16) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
-- 
2.25.1


