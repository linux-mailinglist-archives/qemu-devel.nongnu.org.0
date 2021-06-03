Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF72839A59E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:18:46 +0200 (CEST)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq3R-0007SX-SK
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopks-0000vw-GS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkq-00078z-OG
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h8so6355561wrz.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VDBN3NMYfdiVq5Oflec7BhDX1CHc12wtHAjxegZUl9g=;
 b=C0mbUOgoqoGUpNEBTOx+1RBYD9Q3tPxMjprzaBHH0E9njvYbS+UJeyElc962eZEnBa
 QPp0KiMDqCIbCI+/DEw2CmHr2bHsgLSPbv/4neKee0jyh4zVDIeWLCGAWEnSQ1oE68RI
 O+En8wC3qv8y/6/dRIvqKUXYOQygo3vu4HU+8W/VIgFKt0ixBPlOFDfwvcU/ujcvA+ux
 cWSYCMnSQbLwaYif4AFolT23y5iwBlPdwlNHQc2nHJt1ws9Mp2eSPO0lxfb2XpG08yuG
 fZPuHSpYgswTkLrslL13GbT0anpCi103gACQgtyeWqSCkkbIgggm40sj2fo7KsBLZpu4
 RUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VDBN3NMYfdiVq5Oflec7BhDX1CHc12wtHAjxegZUl9g=;
 b=J4h5DwGjaezxnV75znR+k1xasmW6V6Aafwl+RMdlmUjzhDEHTS/XDfDNIeZUD/PW2m
 0eH5NwH+KoXF8uH47kREknY7+Q0zvZOKYhf2G6bojh++krYLEGZ4s7yYczBjxnuAOvXf
 KgqPW+QQcQWKgzTedPyEn1VKJO74h8Lj1Iw//0eeDzNc+yG59j13bUBHlW+BWxP1eg/O
 g19uPTkO0JYGOL19GvK3TDtHlcnjLZPHrvj/AXOHujvr2MIPkRXFLQCBUZzrhXcBgp7e
 O/wwEd3/rL75BDVCcocDURRN5gczHmvsMUTRIpXOggiZfeUeE2hN3IzimebiJIpdAnfE
 EX9A==
X-Gm-Message-State: AOAM5302wWe7Q4VUzV4yksLURv5+KdtktZ/WheXsZwiycHiXR6H95KRB
 1OHk8NITEKd2XXWwbUcaJeFxpTmp2re9V2Np
X-Google-Smtp-Source: ABdhPJywwoK1zTWc52yaUgLoNdhDvw7ewgfQBivi/l/aE10Cf0XMVlL+vdcZx9XYLeVJs7A5N/SHTA==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr682358wrq.132.1622735971507;
 Thu, 03 Jun 2021 08:59:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/45] target/arm: Enable BFloat16 extensions
Date: Thu,  3 Jun 2021 16:58:46 +0100
Message-Id: <20210603155904.26021-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Disable BF16 again for !have_neon and !have_vfp during realize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525225817.400336-13-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c     | 3 +++
 target/arm/cpu64.c   | 3 +++
 target/arm/cpu_tcg.c | 1 +
 3 files changed, 7 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9ad6f5911b6..9cddfd6a442 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1473,6 +1473,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.mvfr0;
@@ -1513,6 +1514,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         t = cpu->isar.id_aa64isar1;
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 0);
         t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
         cpu->isar.id_aa64isar1 = t;
 
@@ -1528,6 +1530,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, DP, 0);
         u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
         u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
         cpu->isar.id_isar6 = u;
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d561dc7accc..1c23187d1a5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -661,6 +661,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
         t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
@@ -708,6 +709,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
         t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
@@ -731,6 +733,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         u = FIELD_DP32(u, ID_ISAR6, SB, 1);
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
         u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = u;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 2e0e508f0e9..d2d97115ea1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
         t = FIELD_DP32(t, ID_ISAR6, SB, 1);
         t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
         t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = t;
 
-- 
2.20.1


