Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DC3702F9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:29:37 +0200 (CEST)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcahc-0008Ab-Ss
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmq-00054X-Nm
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:57 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007lr-9g
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:52 -0400
Received: by mail-pf1-x435.google.com with SMTP id i190so9682884pfc.12
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CXYlVo4thPOg47NozYtH3Ja8wzwpSJTG3c2FPfnTAhM=;
 b=Y3g0lfHVJqE7tAI0bXBuq28F6X/2rDpc+YYK3cLRFXAz0UYEKyp9q3cDt8ia3p21XP
 na1HC2IGnqfZ1lg1Q4/7qy/VJ9AMsX7CDNiPWHxnDMR/pYYkmnFSZXJgCSuH0oZGijUg
 4aScBZ0VjpW407+afjhMOCT4v8oCXjKFgd/tyss1Hf7AzoOqU+VKijfF5y/Z1yBd/xkZ
 97dXJ9PY/naVvQ43KOZ1v83g5VZfSWrnnAa9Yf1tkR//kZs9ixlPRmK8ioeZ1FpclkBX
 HehguYjH39dda/raZuvA+qao1gMvmFjbG0oNxKCe0j+TMYU5r6UAYGs9j66ePerrC5Ic
 1xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CXYlVo4thPOg47NozYtH3Ja8wzwpSJTG3c2FPfnTAhM=;
 b=A2iZ5B5Zn/JSbWqDtbDYqJdUWg1k07oTqa+y4BnKPD18VgJDsuifnR7NmMRGNU6n2E
 Z1fUhgzPEMbt1OCb1SreDGeWD/b/g78ldH4eMMKcI1oisfTDUvSx1/Dzwj3VZX41AzRm
 PDQi1CNyr+zqHVWqIE10Ceu+fJ5S4L/JxiLlZXTMjs23gkUmSfLE0iAx7TnRbk4/h8GM
 EbuRpD8iDKBAkLuRxHpqb6BxP9XQ1tBlEiyTA+0AnLOq4DM4S5ABJEoQqlYnhKRNnBd4
 RYuyCCEQkH2z+zuMFWQdOQTl5ljMY6v3zu2aroCq4nC1L7t8b6W9i65pyNzdYnOukwXh
 FOaA==
X-Gm-Message-State: AOAM530eMQ+Et/2v1V6ujMVbMOlkWaskgT1TvNbtD9k/m+ETSaunQiXI
 SgMPn52c+149HLRcnNYtxeDVeIqugwiuNA==
X-Google-Smtp-Source: ABdhPJxptwuJdrcszuv4EdhkxF6wqoGIlhUJ4X9xP3iADSCi9IMel+j2Z0U+mgIJ/UwWpNCzNm2DBg==
X-Received: by 2002:a62:d409:0:b029:27d:338:1cca with SMTP id
 a9-20020a62d4090000b029027d03381ccamr6739543pfh.25.1619814590459; 
 Fri, 30 Apr 2021 13:29:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 63/82] target/arm: Implement SVE2 crypto constructive
 binary operations
Date: Fri, 30 Apr 2021 13:25:51 -0700
Message-Id: <20210430202610.1136687-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 384c92eebb..c75601b221 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fb4d32691e..7a2770cb0c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1522,3 +1522,7 @@ AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
 AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
 AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
 SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
+
+# SVE2 crypto constructive binary operations
+SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
+RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fd4ec4a66b..5f2a2b1eb2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8121,3 +8121,19 @@ static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
 {
     return do_sm4(s, a, gen_helper_crypto_sm4e);
 }
+
+static bool trans_SM4EKEY(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sm4(s, a, gen_helper_crypto_sm4ekey);
+}
+
+static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
-- 
2.25.1


