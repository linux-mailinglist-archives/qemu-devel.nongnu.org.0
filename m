Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A1599A70
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 13:12:18 +0200 (CEST)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOzvF-0008Dq-Fm
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 07:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkP-0002DZ-79
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:07 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkJ-0001Qn-2H
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so850216wmk.3
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=D9s+L5yVb1BMeJ0aqDKJfJ1DqXUabclfNuvxPJ/OZKY=;
 b=PDe/8g05I8TMQT04pgN/A3wmwfrLSaX2mCBCyikdzy/VLmdQXSQ692hqL8mZGFD+j/
 URsQFRh4qykhw5MY1f/yLskh75MaVqzUBF2hmgCLpnlBW3LpZzBcYsCixeGqEFfhjGqM
 G48VNHxADoG35DeSwqgIZns1yBz/5Aw+KXP1A0MvElnjW9+3BpOD16+Q7thYPoZHN9gA
 dMm5ezNSytaArVkgRT7SEVg50DabZk49DMMbUBPHI1yo7bEoCNZPmm3KmtcBx5zaiHVd
 /y+dC4YDKKSLCRLcDuJNae0nXvBf02l/9K2DREbNIS33N6FkUKPZNwXEXYtnL45Z0sqV
 62FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=D9s+L5yVb1BMeJ0aqDKJfJ1DqXUabclfNuvxPJ/OZKY=;
 b=rVWs/h4bqQIz3uR7PfjZAfHjVo9JJFyWSi57Xkrf2r8p/KBo7G2er/5YDcmxtXrLPH
 SxsGVtBlZnEy+o1LAKOPIsiN76LwS8hRAg6gbMkQWGoWg7aqzsKhzXHpP7maPIErLcRb
 tmcXuUtoRwjJ4yFAOJjvMpbKRlWA5tlY4OQUajP83SJOHalYlLhv9nRkBhn/1c50bd2g
 tDFeQy5RLzbvKkX+isi/sx256qvMaSfvtZt6TCCwh0MV9WktSiS7plOpU0+6JxDbTtha
 SD+TWAW+TE5dSDj0f0kfRsAadWghuPCqh4KKhjj2fsi267VmDLSFc4Tw5FgMRqlK6Bnm
 GLxQ==
X-Gm-Message-State: ACgBeo2khyAsl+OhyFH9hBLB5g3jh42L/5Z+X9/PM9i5NSw56RncWNZs
 23F4uNUmQ0i7/pUQ3fgEfUJczQ==
X-Google-Smtp-Source: AA6agR4giTHeR4W52KOkumwu6/FENRngcuH5fmPOScjHP90lhlF39PxC0TtrT/YMojmkgzxvKyq8gQ==
X-Received: by 2002:a05:600c:490:b0:3a5:a6aa:bf2f with SMTP id
 d16-20020a05600c049000b003a5a6aabf2fmr7602020wme.17.1660906857521; 
 Fri, 19 Aug 2022 04:00:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/arm: Implement ID_DFR1
Date: Fri, 19 Aug 2022 12:00:50 +0100
Message-Id: <20220819110052.2942289-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

In Armv8.6, a new AArch32 ID register ID_DFR1 is defined; implement
it. We don't have any CPUs with features that they need to advertise
here yet, but plumbing in the ID register gives it the right name
when debugging and will help in future when we do add a CPU that
has non-zero ID_DFR1 fields.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 target/arm/kvm64.c  | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fcc5927587e..fa24ce9f96b 100644
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
index 07378519259..7ff03f1a4ba 100644
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
index 2d737c443eb..1197253d12f 100644
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
2.25.1


