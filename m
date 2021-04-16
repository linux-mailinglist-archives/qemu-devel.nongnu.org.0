Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B81362A9C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:53:43 +0200 (CEST)
Received: from localhost ([::1]:49534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWPG-0008IW-MN
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdh-0006CX-7t
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:33 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001k5-EA
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso15261616pjh.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qO7nX/keqWMY4kFJdwer6bjckmqvkxXLwxerKkDKNvA=;
 b=NbSJgHjwQselsNtZ3gvP6mjDDx8hz9ihxjcRidOFkO4fVfARuAWzVG+hYzIMoXc1ts
 NYWDl8+CHob4iYLQQxr58EhxpJKqJd//BoXPki0xysXwIdGoCQ3hqXuIMM/g1pjs7ihR
 ky137UiGqeZUvqnNaqNIolx+IGQtLcvw1gLilNKOXyPzB/BOUEG8UhknR3wcE+xO8f6q
 fMR5cS6hEPCyj8bn3e30wDmQcugxn8t2HXuQtw2gAORzDRzLrIGjsiZLfXT6uAntJp49
 KPOyJKK5nWl7/Em3KTC2yy5GFS4rsF6d0Z4MRAEwJ1UryVsZS8qkx5mv7o6R60LwJMf0
 WPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qO7nX/keqWMY4kFJdwer6bjckmqvkxXLwxerKkDKNvA=;
 b=Qk0JsCccsxAj94pSVJotHTzboYoDDH12Xkn7EeVtGSsusfPBI06VImJOPCTFxhDF+q
 eUECLQJe1IST2s/OATgyWsMwMFFHruNAnjDvzUNQvAKKAJvVQQgGnWnHRHugRQpI/pOt
 +gjsxKjPRo9zsT3S+MI7VTsGI1S4h92x5xRJBwZQX0SR/+9x3Sov2JacUlGcsX3nxcsA
 FrKAVYvPZmJ0sSRBFzWt1KPvRv1HRdKmq/1RpgxfafMFBzACcKCeeaGNc8FgNmKFyJFe
 R1tmg3J3U+1YXaz/zgIaR/Wy13cDspLjJ0KVDIg/txOTbY9m5QlQWMOvKzyT86tda0oh
 9WnA==
X-Gm-Message-State: AOAM5339MYW5WSqK6bM/vV8Z96X665S1WtePGcQ57Pi1mFrigq1bP1y7
 Z1/79HRYGQOmzGB+iZxx5noJD66m+/VdIQ==
X-Google-Smtp-Source: ABdhPJzhbGUjcQkt2XrjHcdfakkbLR0Yk7HbEqQDsAyUDOJrPqHE6Kab7m4hr9sZLYZnbTinRj6XAg==
X-Received: by 2002:a17:90a:1990:: with SMTP id
 16mr4970193pji.172.1618607052898; 
 Fri, 16 Apr 2021 14:04:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 62/81] target/arm: Implement SVE2 crypto destructive binary
 operations
Date: Fri, 16 Apr 2021 14:02:21 -0700
Message-Id: <20210416210240.1591291-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 132ac5d8ec..904f5da290 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
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
index 6ab13b2f78..fb4d32691e 100644
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
@@ -1515,3 +1517,8 @@ STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
 # SVE2 crypto unary operations
 # AESMC and AESIMC
 AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
+
+# SVE2 crypto destructive binary operations
+AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
+AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
+SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4213411caa..681bbc6174 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8083,3 +8083,41 @@ static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
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


