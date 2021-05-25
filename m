Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AB390CA7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 01:02:44 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llg4R-0002mL-9X
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 19:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0Q-0002Xy-QL
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:34 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0D-0004mi-AQ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 18:58:34 -0400
Received: by mail-pf1-x431.google.com with SMTP id f22so16404575pfn.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 15:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bLZEVg63JaCjb9TWm4+laNRS99dgK9U+MbZ27NccEw=;
 b=TRb5zPZWkDydE5beewV/dSXXZDQXwFZ3e2LtR0n9k7trovaBOMyP8QaSywK/JPXU9j
 T2uXJZOLu8XJKwheNXmL7+Aj/IN+H85BnLsA2Zl9S7hR9J6rxbzKJ3cOD43KED5opHpn
 8a+4UDrr18tPwySL79pAsePR4MAjg0INEFwR0SPen43MNjxxEHNluhcZTzLVPbEXgbx9
 xKIinkP7px5aSMen3UyN+FnG2bQOHg3yOqdkG7akHsZGLKfH03XoNuRw6CRiVX0OE7BV
 T/+wdKHo1PODD0vX/CQBT7m2/6xh5xBiTLKrIOopvoJ7KeDVnhvuo2Xzkw1wRe6Ya/NX
 hcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8bLZEVg63JaCjb9TWm4+laNRS99dgK9U+MbZ27NccEw=;
 b=jTF+UrL5YQVDXh7V3HHgB5W3Bi+GUL9MoCsLIPOAgxpfHlfC7B2XAk8eJdWXUXEoGv
 IHQmtBgkUarysQs0G7p/0dvTC+4vTIrydJ3EdD9DM0+yP4iihHTQVSdIFjvAXJmDoJXL
 zeDeQ0vq7GIC3uWnEeNzaPd1Co2KQj01X5m0CUw5SLee+ng4IwWLeBclWlAMoph4HOX+
 30E5WOFAkzUupDwsr93pOmke4LzbyS0QSKvsX9G1wGIVO1AxmHHgXuuX8i3/aM8jd2D5
 sLIs+rbAxcmrpn+4uoO18Lm7rV6mXSa+lb+mOIzUCZusQVXvArosz7apWDK7ad13iBKf
 LPVw==
X-Gm-Message-State: AOAM531C0iF5OOjSePjRbKPH5gV/jssR6UdmUbzOhhhDVxmEW/ZkX5a1
 CILOiNxGuUZIiOBmB0JYuTTriEOZTyhUFQ==
X-Google-Smtp-Source: ABdhPJxfPFKVOXLPbVEBZiw5q3cTTI02TpZhuctSEdpU94QJbvGOn/Tvlbsf6GkhVh4zUKr6IFS1+A==
X-Received: by 2002:a62:60c2:0:b029:2cb:70a7:a8ce with SMTP id
 u185-20020a6260c20000b02902cb70a7a8cemr32545879pfb.77.1621983499252; 
 Tue, 25 May 2021 15:58:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] target/arm: Add isar_feature_{aa32, aa64,
 aa64_sve}_bf16
Date: Tue, 25 May 2021 15:58:06 -0700
Message-Id: <20210525225817.400336-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that the SVE BFLOAT16 support does not require SVE2,
it is an independent extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 04f8be35bf..d68275b15e 100644
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
@@ -4122,6 +4127,11 @@ static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
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
@@ -4266,6 +4276,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
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


