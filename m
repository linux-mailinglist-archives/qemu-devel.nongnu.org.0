Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A2390665
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:16:12 +0200 (CEST)
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZj1-0004ql-Ka
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYcD-0004sS-PP
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc7-00052B-Tt
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:03 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so6461663wme.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sf7w4dUgQCEgvAkHKBvhJGaU8oCzqeT8uluo47tv6LM=;
 b=xVnyiYbuQgy0O+5l4PbGEx9kqKLD5UKAlogSUH7INk7Bpv3F9+4SC87q4VTkB2H3UE
 Zvvqyz/NTjSLAQnsPxBghDhKs3tyqKAPnYu5GICdgeKkJ/DhqWkU97cB3k0t0uzdJg3r
 HmXSevbRp3u2oBkLKcCy9+KihUXxemrTN2Cs0E57HRf0Gof9gwglJ4UFgYwhgXvDldD5
 TaHtIFguAHQKcU2lstOx9r4Z36wbp+Eb+rE9r7Y3GEfMKJskx6GWyovzSmeCiqL8s3E9
 8T1HJo7/wf2GRb8Zzyt8RbRe27C9P2eMQM5mUpBGRtUa2tpALmSI5tLYDR3NVHXGFR8g
 sPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sf7w4dUgQCEgvAkHKBvhJGaU8oCzqeT8uluo47tv6LM=;
 b=CDChXOAv7WYctwl6fCJYW1xCwrnRI5jPQ6XpTIsyMbvOr50OZCpDdgiB++q1HaPOxq
 WyNmGrJ8ODEBMB+gjOykNrIfJixD+ttJT6Bf5ICIKsuuGKzWugtFDVh3Oct/52LM+Py4
 xhVyhO7T3DUySPPb1en8m6aHIpaZ2A/IsIiR+UA6e6ofdz/2+nDJXVTZ+li+Dhzz94Xq
 adcO6HpQdp6CxNZyuH1Bt0ASXoMuW20uh3GQsxvTUoiPZORlSxumQJfKyptfIsxXlTiw
 4F24IegMq73dOGEDuHG+3RllnGneC1anqjVBasSNpkPPb6rrE1cZ1xn7bKEnsXZaKFyz
 zDrQ==
X-Gm-Message-State: AOAM530UStxCWzyEq802+Sq/PbGe/qTQsmC6oKzbpgYtM3zJjGcAIcTI
 N7/2ODw+o2G+MUUEoMy29jYzT4NrIAW4JvH5
X-Google-Smtp-Source: ABdhPJzQRI3I/9n7eoH4WB420wf2ANgafG1ZuBzmpeeVsVnOAWWJ2j96+fkndC30mty499gfWrR2Yg==
X-Received: by 2002:a1c:9dc6:: with SMTP id g189mr4344303wme.59.1621955096259; 
 Tue, 25 May 2021 08:04:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 091/114] target/arm: Implement SVE2 crypto destructive binary
 operations
Date: Tue, 25 May 2021 16:03:01 +0100
Message-Id: <20210525150324.32370-92-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-70-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dcdde85f866..e808e6ba408 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4256,6 +4256,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
+}
+
 static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a9cf3bea3e6..46ebb5e2f8b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -118,6 +118,8 @@
 @pd_pn_pm       ........ esz:2 .. rm:4 ....... rn:4 . rd:4      &rrr_esz
 @rdn_rm         ........ esz:2 ...... ...... rm:5 rd:5 \
                 &rrr_esz rn=%reg_movprfx
+@rdn_rm_e0      ........ .. ...... ...... rm:5 rd:5 \
+                &rrr_esz rn=%reg_movprfx esz=0
 @rdn_sh_i8u     ........ esz:2 ...... ...... ..... rd:5 \
                 &rri_esz rn=%reg_movprfx imm=%sh8_i8u
 @rdn_i8u        ........ esz:2 ...... ... imm:8 rd:5 \
@@ -1564,3 +1566,8 @@ STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
 # SVE2 crypto unary operations
 # AESMC and AESIMC
 AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
+
+# SVE2 crypto destructive binary operations
+AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
+AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
+SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 79b49915492..3b977b24625 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8159,3 +8159,41 @@ static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
     }
     return true;
 }
+
+static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
+{
+    if (!dc_isar_feature(aa64_sve2_aes, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzz(s, gen_helper_crypto_aese,
+                         a->rd, a->rn, a->rm, decrypt);
+    }
+    return true;
+}
+
+static bool trans_AESE(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_aese(s, a, false);
+}
+
+static bool trans_AESD(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_aese(s, a, true);
+}
+
+static bool do_sm4(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2_sm4, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
+    }
+    return true;
+}
+
+static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sm4(s, a, gen_helper_crypto_sm4e);
+}
-- 
2.20.1


