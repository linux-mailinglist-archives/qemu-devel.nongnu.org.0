Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3068B69F316
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 12:01:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUms9-0003d5-4h; Wed, 22 Feb 2023 06:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUms6-0003cS-Mx
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:01:14 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUms4-0005z5-Rt
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:01:14 -0500
Received: by mail-wr1-x434.google.com with SMTP id bt28so641478wrb.8
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 03:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xiwl0gjObTgeiqnT15KNexvhdvPurA6KRo7TnVjuB+Y=;
 b=YOsdK5jR9kV3Yl94pljXXkQo+dgUvN/8ILJstmTvGQe62fcixX9V0oXiilRNdsfmGo
 uCdygdEOGYByQZCoQ1vKaMgXgYjDaChBPiLDGnwl6JQ1Hsj5oak3lIK3n1ghJJj3uK7A
 1B3QI5+7RVuR7iwKwKupV9+Hvnqd4+P6xpzVolyU1XbaaF8pS+tna14ZiBlLKj/DSjym
 GZbV5WXQn44bxxR1X2xN1PdGlwJYW7GeRcRmqLyeRu1sV3nYvdXeldEfUS+O0QY9Uo6b
 xvXrD/ERu8AX+PPa6pTW4TafbXVcTVqwsJynFqTaY7kDnEgrWVtsDJvAFUV3WC0Og/W0
 V6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xiwl0gjObTgeiqnT15KNexvhdvPurA6KRo7TnVjuB+Y=;
 b=KBp/NlRA2gpqwhzkv1uZG1IpRL6HeYuv9upX8GI/oQqpp+KC3vtTCSLqXgFObOM+aA
 M8uA7lXhUE9Acs/+FwPjXhHgI+PlTBH/k81eOBCey/WOiL61tmP83H8TL+6UKvADTg+8
 XSxdnDA4yyegWSTsK+3YxLKOAYum4EFIhhBfMpenmDWnqf0VtbNdK6K4gT99iifVQqcr
 k8lP97JTNIzdBuyAwdaotyBufVkR0Ku3c/T//1pm4hENACHweNagjG2QzigOS2LhB+7r
 HkcRI9dyCir1Tm5kTYZX8DbTZSCDScCDB0NyXtBxu3CBzLiX3wqXZcP0rk3xhCWSxZkz
 8oZg==
X-Gm-Message-State: AO0yUKUlXAG72jjzjntfC3GCWxE1iMw7Ry5uZJRXW1alQAg0EZFLpbtB
 r7gu2l41Wvqdk7Az8xAHKVZ7Bg==
X-Google-Smtp-Source: AK7set9Wj1lg3dkV+QxxK9rec/0Lhc95J5q8V77EsPekWkrs5XP9QCCKH4RZw065WWe53V1kDdBqOw==
X-Received: by 2002:a5d:500f:0:b0:2c5:58b9:d76e with SMTP id
 e15-20020a5d500f000000b002c558b9d76emr7278719wrt.40.1677063669568; 
 Wed, 22 Feb 2023 03:01:09 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a5d4305000000b002c559405a1csm8290661wrq.20.2023.02.22.03.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 03:01:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D295E1FFB7;
 Wed, 22 Feb 2023 11:01:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] target/arm: properly document FEAT_CRC32
Date: Wed, 22 Feb 2023 11:01:04 +0000
Message-Id: <20230222110104.3996971-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a mandatory feature for Armv8.1 architectures but we don't
state the feature clearly in our emulation list. While checking verify
our cortex-a76 model matches up with the current TRM by breaking out
the long form isar into a more modern readable FIELD_DP code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
 target/arm/cpu_tcg.c          |  2 +-
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 2062d71261..2c4fde5eef 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -14,6 +14,7 @@ the following architecture extensions:
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CRC32 (CRC32 instruction)
 - FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da1..12e1a532ab 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
 static void aarch64_a76_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+    uint32_t u;
 
     cpu->dtb_compatible = "arm,cortex-a76";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->ctr = 0x8444C004;
     cpu->dcz_blocksize = 4;
     cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+
+    /* per r4p1 of the Cryptographic Extension TRM */
+    t = cpu->isar.id_aa64isar0;
+    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
+    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
+    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
+    cpu->isar.id_aa64isar0 = t;
+
     cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
     cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
@@ -942,7 +955,17 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->isar.id_isar2 = 0x21232042;
     cpu->isar.id_isar3 = 0x01112131;
     cpu->isar.id_isar4 = 0x00010142;
-    cpu->isar.id_isar5 = 0x01011121;
+
+    /* per r4p1 of the Cryptographic Extension TRM */
+    u = cpu->isar.id_isar5;
+    u = FIELD_DP32(t, ID_ISAR5, SEVL, 1);
+    u = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
+    u = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
+    u = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
+    u = FIELD_DP32(t, ID_ISAR5, CRC32, 1);        /* FEAT_CRC32 */
+    u = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
+    cpu->isar.id_isar5 = u;
+
     cpu->isar.id_isar6 = 0x00000010;
     cpu->isar.id_mmfr0 = 0x10201105;
     cpu->isar.id_mmfr1 = 0x40000000;
@@ -1167,7 +1190,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
     t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
     t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);     /* FEAT_SHA3 */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index df0c45e523..961d2fd9ba 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -34,7 +34,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
     t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
     t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
-    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);        /* FEAT_CRC32 */
     t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
     t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
     cpu->isar.id_isar5 = t;
-- 
2.39.1


