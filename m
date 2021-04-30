Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFBE3702F5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:27:23 +0200 (CEST)
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcafS-0005AB-IK
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZml-00052O-OA
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:51 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007lC-3a
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:51 -0400
Received: by mail-pg1-x530.google.com with SMTP id j189so3168366pgd.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0UnzIflfhV5UCyvLXEO7jKi/iiKGyKifImpfUPcU4RQ=;
 b=lprJ4MxayrxOS8rkpbcJCGkOpgHj6lkqyLTESyBf/sQGH6UG3EI1DT8IQBlMls81Gp
 EwCDOkg1V6E5NkJdndOIKyqCXF1TPG0G95reOVqstxEHQa9QU5yhetzR+L3JRtk55A0S
 Cl3yQG7WqffMPxmIBaqJ6NSFR47bj2fqzVt5VzSC/ibmshz0QSTL4FWn6dSMumv20sN0
 KnIIpiMNcfpygb09/NRWTlctAwoVtjSHeHfKMJwg6SHMGFvG9Od8Bi1E8I6xlKwG6d72
 MAyLU/kx9EIVyOLRzTDEoJ0UuIyc2oO38tU0xgUE/n8hYxchCQsFspJ/5hJjmlGibQm7
 UnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0UnzIflfhV5UCyvLXEO7jKi/iiKGyKifImpfUPcU4RQ=;
 b=fDv62Dr4RXaDTsrp1W/6R8p+F/p049bfR4dV4fwHcaM6YUwaTd+rj6IV0gWDgH67nv
 +KXtkSybdMpV2AlJAToM5huohHQwd/aNgvlIIPvmwN/yghANI3tvKLR3Rl9UQvU6O/wV
 IlrX7oZGwGiA6AS7AP1cqIRQ2EyI1e6IkusjDHIlI7h9ztfF0toXb5x8a3bg0ro1iYX8
 MZO1552zsEBeORkRLeG+WnP5nq5pTbmvvf+cVXYqNJfYiXA5HB1959Jo0PaX9OT+f0F6
 kfx5CW81r1EMiIrK/U1r+A+Irc2aE8I9fjb8SU2ww/p4EfGdFVjGt7Vb8U8gdrMXO14j
 joHw==
X-Gm-Message-State: AOAM530NTyEmTCpMVb/D9yD4ELaoA/giHAzjSY45nAVrFQ41RB5FSjUT
 nfPRPI+id7h1bs1awxM6FL0Ex3/mRoOYbw==
X-Google-Smtp-Source: ABdhPJw2SVkpwtZnInYBBRPDQmUFFrBHMtEDNCJsX4dy8LebRaWjG4lWdJDcBTwhCHbLEIhoJepFFw==
X-Received: by 2002:a62:2c46:0:b029:245:6391:b631 with SMTP id
 s67-20020a622c460000b02902456391b631mr6353204pfs.67.1619814589929; 
 Fri, 30 Apr 2021 13:29:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 62/82] target/arm: Implement SVE2 crypto destructive binary
 operations
Date: Fri, 30 Apr 2021 13:25:50 -0700
Message-Id: <20210430202610.1136687-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
index 0a41142d35..384c92eebb 100644
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
index 5219b93abd..fd4ec4a66b 100644
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


