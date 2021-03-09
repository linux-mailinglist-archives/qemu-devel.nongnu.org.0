Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5FE332DF6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:14:03 +0100 (CET)
Received: from localhost ([::1]:50294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgrq-0007DH-Oz
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf88-0000VZ-H6
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:44 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:35881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7t-0002qg-D1
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:44 -0500
Received: by mail-oi1-x22b.google.com with SMTP id o22so5786296oic.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7HUMIRolyiVf+4bR2Asr5i8Un4DIvsL9C7fcAzpPAA=;
 b=yLcMPzIjEcBtO4Qlig/bEO7aFwlHLnVgs1hFqivL9FZq++JyfV7SGfT0KvcGFKA1Tl
 b03X+idNPu/1Mqt9acHuXvQ5Uums+rawTWNcklg5DwK9eqQ/duwOpQYPgP1Du2YmKY2e
 VfxPOW5ByPad3OtBcF/BcuR6j2RBpP2MkCOm2RfOEex3n3YPcLBJ2iyH14eimTkKJMK5
 lXL3lSFyAQnR9hFHKDJ3iAZ7sQmf5Cup49QDmnGoglA8JM9SR8yL5ySnxlyYzfgFJgxn
 8Auei4AjoA4C47hdHr8lFUIxccTRhGxm9QtnB4fRXlgq3YjYekQyGbdTh0sos39qz7T7
 WZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7HUMIRolyiVf+4bR2Asr5i8Un4DIvsL9C7fcAzpPAA=;
 b=sThjcBtADWRAADqSdDXlVlQaV3IMg6nDHCX/kmRUMcS2Y4iilSDEt1C9mU7wtYQt6H
 Bark9EEDMvVmUE7ed245Q964tTK55AUZdWxBtKEE8EYEEECrWwTTwThWrJwADzfvF/r9
 gb8z6nfvo7qrmdzKUpM+YMEn/nyPCcEJukpjBru0ACgP14zrT9rQqRC691JgucUKDwD6
 pOqVIlxtKqzVKhjLW0Gs1auZGwqpcCWzAjSYEtsV8zgLHl4ZsUPiSA01kStTr+mtmy6f
 1bbX7wVGPx92tsBltCstw7Gp4Qd9Efzn6u7ngEzprtATm/E5flSI2x6YSe4H4hH63uJN
 9khQ==
X-Gm-Message-State: AOAM530PcCfWt04q4kykcGSuRQSe305t7Pkzecq8B8QmJTxu3OzCjGjK
 UiuUt8OwzdgEza1kCaxbncKFDGY4oSehoq47
X-Google-Smtp-Source: ABdhPJwNXk9pQO3JjjcynYAqGbb613NAJ/RiAbpE9T/QmSbksnbFEGCod3s8INAvHgfHXgbbvXFIHA==
X-Received: by 2002:aca:a9c7:: with SMTP id s190mr3511345oie.19.1615306947449; 
 Tue, 09 Mar 2021 08:22:27 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 65/78] target/arm: Implement SVE2 crypto destructive binary
 operations
Date: Tue,  9 Mar 2021 08:20:28 -0800
Message-Id: <20210309162041.23124-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8c84bfb62b..8c482f229b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4213,6 +4213,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_i8mm(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b161334e93..bbb1dbd990 100644
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
@@ -1557,3 +1559,8 @@ STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
 # SVE2 crypto unary operations
 # AESMC and AESIMC
 AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
+
+# SVE2 crypto destructive binary operations
+AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
+AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
+SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f61e6ff6ea..14360b2b08 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8134,3 +8134,41 @@ static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
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
2.25.1


