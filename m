Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8FE61136E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:45:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPeH-0002GK-VV; Fri, 28 Oct 2022 09:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPaz-0008Sl-Bk
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPan-0007sF-3b
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso3856603wmq.1
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Mt9EnEn6Ha0zSiDllAuOLDMPT9KKkIBQEDSf8mieluU=;
 b=ZfatHAtfqlrVceqfAPLrLqzdI/T6otqAPMQdIdUYZVeaqGzmF3OZfZ0HU2g6ak9VLk
 RBImHLmmnP6F5CkXpx68JqbkTFeGMtl3PVqD8RYMCJM4pRPutWZp/eB88sM/wC8vZwQ5
 3CuynWt3ueYx2g9kVN1TlyCbxT0upy4IL3SbnzuaQnr6Tb+/g3YUKUR5+SuiF1Rp7Eqe
 FDNLvng/Qd/pI9cWnT+QiPPyojF3STS/6kMvTYLvOBoF50REnpgBemeeNQxZW8GmX2Fd
 EMLQ18tK3srmjWNiluZc3j0u5l9D+QuTNJg7THaHTZpczjjZOs//2jLuB6HDd0TR5ACk
 BkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mt9EnEn6Ha0zSiDllAuOLDMPT9KKkIBQEDSf8mieluU=;
 b=yJdeeaMnw2jFMxOnkqOKcd68MgM7Og0fIhIpmASWiucLYMeZXRCpbKUbwkUXdxAxIp
 yWgzdG4OOyLEQCPjUYf/dcFNv0va4tpqLeSbhy3MMqDwrS4pmZIsFMJBakDgcOLtSnGP
 HZc4JcBx+BcDXWBpP3epFW8zMd6g2DOEbJ9VV5608E5DmWJwkcifZ7Or/ZNpBh3Y1SLr
 04lILYJaKfNwkuc4cVV3BXyFEs6x2NqHQnUGVwIwJMbE7o53IR8QJzTtPVxT14kaji5p
 udvqkMtx0Zf4EPiLycmc8VoLYepbWO0rf/JPhHIs0ZHR/Vw5BAUz1MGDwvbXxfKxruVb
 sy1g==
X-Gm-Message-State: ACrzQf2SAgJ3FqhPtHEA/+z6c/8v73FVr22EbkA7hULEenH+Mu6AH1Oy
 /bbie6RmuTdvitUsg/boOmzgjQ==
X-Google-Smtp-Source: AMsMyM5pmJztoER+TsYsl4+VPgCF3NrfEjzVeSV9z8TiT1SQfYg3WFilZ+4h12FZeBBdUNh7/sQoCw==
X-Received: by 2002:a1c:ac81:0:b0:3c6:e566:cc21 with SMTP id
 v123-20020a1cac81000000b003c6e566cc21mr9816670wme.0.1666964410538; 
 Fri, 28 Oct 2022 06:40:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/7] target/arm: Implement HCR_EL2.TTLBOS traps
Date: Fri, 28 Oct 2022 14:39:59 +0100
Message-Id: <20221028134002.730598-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028134002.730598-1-peter.maydell@linaro.org>
References: <20221028134002.730598-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For FEAT_EVT, the HCR_EL2.TTLBOS bit allows trapping on EL1
use of TLB maintenance instructions that operate on the
outer shareable domain:

TLBI VMALLE1OS, TLBI VAE1OS, TLBI ASIDE1OS,TLBI VAAE1OS,
TLBI VALE1OS, TLBI VAALE1OS, TLBI RVAE1OS, TLBI RVAAE1OS,
TLBI RVALE1OS, and TLBI RVAALE1OS.

(There are no AArch32 outer-shareable TLB maintenance ops.)

Implement the trapping.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dcd3af6e7d9..5baa06a0cec 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -373,6 +373,19 @@ static CPAccessResult access_ttlbis(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+#ifdef TARGET_AARCH64
+/* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBOS. */
+static CPAccessResult access_ttlbos(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    if (arm_current_el(env) == 1 &&
+        (arm_hcr_el2_eff(env) & (HCR_TTLB | HCR_TTLBOS))) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+#endif
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -6751,19 +6764,19 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 3,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 5,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 7,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
@@ -6850,27 +6863,27 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
 static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 1,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 3,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 5,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 7,
-      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
-- 
2.25.1


