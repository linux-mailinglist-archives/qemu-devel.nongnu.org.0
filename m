Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEAA5B88A2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:52:49 +0200 (CEST)
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRsm-0001tH-4t
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwW-0000GH-9y
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:36 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwM-0008Vr-CY
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:36 -0400
Received: by mail-wm1-x32e.google.com with SMTP id l8so6026766wmi.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PzQ7HFDyU7lDe3IC5gWQsNSOhu4RpaCEIUnJKd3sdMI=;
 b=IfD5jf+tzB6R6bqd2UFwtYFZjFYQkp0AmOT381SsBqkBw/tSflxVW9HP8djT+mXxVc
 edrklaiMuXjlTjsxac8I1rht8TuX9dUIdQrg81/GB10lcq9u7H/OA9vy+z3lPbgNouyF
 3+K1FVTrCBlAgbfhQueWonrhq3rVkThnv3APakNL+vjUXKMR7wGVWGhdBerF0li8lBNm
 5shUos06flX6R1RD+dIfAs/w1muQtN0e8++gDhsfjsdH/PYJixP4+2ZGtqvWxEtgT3QO
 8Zg/Mb3GkNRfDdiG6gt4kfBdU9oo9NQ0XdprJKyCZqRuBeozG0rjr0y/o23O3j/PcAkA
 XBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PzQ7HFDyU7lDe3IC5gWQsNSOhu4RpaCEIUnJKd3sdMI=;
 b=7V6hz+0BGwHVCokhwkU98bSo5TUx8oQHlqMp85ZiMgjGtTfRYHeTEVto1p5EGpLgl1
 fdGHB/2wQwxKKu7NA71R/EAqO6OEt+ZgXjnjfiRAhaSePMZwOkHVPUPEQ3y6CE0upL6O
 u/ncrMr97a/1Gx60xNzIc7VMpnSXfJ50+GDy0NH24EmJolWXdRun93baKIAzsNiQa5sa
 ubDZ1XzmAaNe00xX9hb3xragncGgLlfpKRoMQQgvRR5EqF3+h5dHMyPF/BMDTni8/XhD
 oh6AuZaKJ0T0gVU2l1B45tJLAO+eG/K0DQ0L2jw1h9X0EyT2+ONfdHD3Or58nVpDZMiZ
 tW4Q==
X-Gm-Message-State: ACgBeo3Db+vwYcbBwwKiWG60CAQoomkG/qD3c0J03MW0hYbPHYSrzmxE
 Ss0ssoOUSVQ2YoBqwugC4kPurzO780/6trgQ
X-Google-Smtp-Source: AA6agR7ceuQiqsTRKLfuLO19SN+wVUjgIKyWQdST1NAeGotSh4EDoux1Cyyi5s01spKI4suh2K93Nw==
X-Received: by 2002:a1c:c91a:0:b0:3a6:38bf:2c36 with SMTP id
 f26-20020a1cc91a000000b003a638bf2c36mr2858336wmb.38.1663156345005; 
 Wed, 14 Sep 2022 04:52:25 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/20] target/arm: Implement ID_DFR1
Date: Wed, 14 Sep 2022 12:52:03 +0100
Message-Id: <20220914115217.117532-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In Armv8.6, a new AArch32 ID register ID_DFR1 is defined; implement
it. We don't have any CPUs with features that they need to advertise
here yet, but plumbing in the ID register gives it the right name
when debugging and will help in future when we do add a CPU that
has non-zero ID_DFR1 fields.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-5-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 target/arm/kvm64.c  | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fcc5927587..fa24ce9f96 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -983,6 +983,7 @@ struct ArchCPU {
         uint32_t mvfr1;
         uint32_t mvfr2;
         uint32_t id_dfr0;
+        uint32_t id_dfr1;
         uint32_t dbgdidr;
         uint32_t dbgdevid;
         uint32_t dbgdevid1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0737851925..7ff03f1a4b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7581,11 +7581,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_pfr2 },
-            { .name = "RES_0_C0_C3_5", .state = ARM_CP_STATE_BOTH,
+            { .name = "ID_DFR1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_dfr1 },
             { .name = "ID_MMFR5", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 2d737c443e..1197253d12 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -643,6 +643,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 4));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr1,
+                              ARM64_SYS_REG(3, 0, 0, 3, 5));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr5,
                               ARM64_SYS_REG(3, 0, 0, 3, 6));
 
-- 
2.34.1


