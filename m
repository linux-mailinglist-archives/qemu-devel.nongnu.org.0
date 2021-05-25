Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791E3906B3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:31:27 +0200 (CEST)
Received: from localhost ([::1]:35512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZxm-00012x-G4
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYf2-0003BD-4Q
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:08:00 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYez-0007AK-Ta
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d11so32605026wrw.8
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ldYUMoBoRAEcPpF/oGdWl0F21Jg3CLMOfmSPo+FKpCc=;
 b=sBe23PgiQItcT59cO2dWsJ2F7uYXdV4MW88aNjLe14wSOacuszg1RhO1nQ+Dcx4IqN
 hNVFssXXxwx6TJ/DJE1ceMqoiBqFWlo3GZXXdu8Hu238ey2bh9mHeYWYbQN0oZ036+Nx
 ZgrRcw3mUUjh2ALqbL4HWnGovlbTyAyyCTxqdtdkVnEM4e9wXA6a8LpGX+8eGad0Cxzf
 mLoibhZ50JFoFqLhDzT4tWkIxGw3qOA5FiWSeUhymPfXWVRxJSg6cGaCRO1PE1mGOAMM
 LzePGDqhlNC2JGL3IE1rNBN7n8609ZcX5yZ+EYFWLLHNELbF0gKM22aeKdY/CyXPndYW
 jSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ldYUMoBoRAEcPpF/oGdWl0F21Jg3CLMOfmSPo+FKpCc=;
 b=qaQ1S5Mv+nftI9yPhRDqxiWEgnw+NndqMfnGO4wxOTXLHWgoJ4w8buH65GNEbczGTb
 SA5/qLsxpxjGtANhLqW4iYAfJzcHTM5v1vtK9J2J0eQLAjoYsf44QEXABrvxkCqLo+5u
 uSdlF/t2idmlBaWmrmzU6RTnOnvo1CNuCK6ISHY7vVh8zfF+aaXlZlSqt3pyWkRQOkxn
 7FRgi6/OZjPW6TIPLA2XDksSd3wOHK7WCTTaLAeDWgTCFlxlomurlCnkMV6W94Skqp29
 8YSdpPkNZZp2/BRtB+sk5OdJT1vYPU+lUMQficF6Voev/YNsdkhIsNEiPDpWLwbOERef
 fRzg==
X-Gm-Message-State: AOAM530L8ohrum483/GqM81rGLL0bU2sbNv9qUitpP9c1Ks3RxW1kDUy
 NehICJdBJLV06cS8QbBriQCnd2tujvjCIQGK
X-Google-Smtp-Source: ABdhPJxbYgQl3EMnHbtzJCzCn+llXOJYv+qdW1CSjjL2NIiPXasRpgeWe8cpSodqv/IJJYu9qhoiTg==
X-Received: by 2002:a5d:5150:: with SMTP id u16mr13322279wrt.360.1621955275036; 
 Tue, 25 May 2021 08:07:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 114/114] target/arm: Enable SVE2 and related extensions
Date: Tue, 25 May 2021 16:07:36 +0100
Message-Id: <20210525150736.32695-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Disable I8MM again for !have_neon during realize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-93-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c     |  2 ++
 target/arm/cpu64.c   | 13 +++++++++++++
 target/arm/cpu_tcg.c |  1 +
 3 files changed, 16 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4eb0d2f85c4..7aeb4b13816 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1503,6 +1503,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         t = cpu->isar.id_aa64isar1;
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
@@ -1517,6 +1518,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, DP, 0);
         u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
         cpu->isar.id_isar6 = u;
 
         if (!arm_feature(env, ARM_FEATURE_M)) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f42803ecaf1..d561dc7accc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -663,6 +663,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
@@ -703,6 +704,17 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
+        t = cpu->isar.id_aa64zfr0;
+        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+        cpu->isar.id_aa64zfr0 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
@@ -719,6 +731,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         u = FIELD_DP32(u, ID_ISAR6, SB, 1);
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.id_pfr0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 046e476f65f..d3458335ed9 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
         t = FIELD_DP32(t, ID_ISAR6, SB, 1);
         t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = t;
 
         t = cpu->isar.mvfr1;
-- 
2.20.1


