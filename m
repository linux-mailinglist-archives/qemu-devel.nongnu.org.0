Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EEF50B5EC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:11:08 +0200 (CEST)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrBr-000102-TB
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9t-0004fO-Sk
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9s-0002e9-7m
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id t6so6882787wra.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EjeZtA3tZWg+aDhUloJoLuwvQBqCQPUULzcGK3wHquE=;
 b=CXs5SrNZLUu29Ysw4+S58yi4ltUAKYGZIS/E5z6NwVuDOM3hdf7A9KQQocUA1KiYGp
 TYOKdPQBg0AzaOTlmEeeHxcmlwbP4pQFDG+fyqVmdVP/Agi8KzOFHIEs3R2woywcC7tc
 7YSEynFjMXGemp/TGB2D8yQqyBM1275tr+LZlZax7ha0p5kyEsRF4T4VFJ/U4Jzz3pfS
 tcS1O12myO+9WD1h5gS+7eKcG9BneDLcoFp+dk1RUxcb2cldjE09Mg2sazB8kRooE6ya
 8MjXzqqWe0Sg7lyw7G5ulgXdxn28Qc5dBxRHJzgLU6tDsBNCOGTUM7kmAT3Vdh1WcwuT
 k0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjeZtA3tZWg+aDhUloJoLuwvQBqCQPUULzcGK3wHquE=;
 b=RF8QjrqCP2+zhvOs4FVliRVT+9sIVylBrTLEaiDryzAkK1rvbPInHiPUWI0cYcw+Sm
 5ylDfCiBVaNMAUymHZRfSie/lt53DI9KQFPYyEWYM4eLnbF/SkCNs+g+uZ+8m4OiDbaH
 1smOWHM440gV83QVNIpiKo2Ukz+Jo4MXN+DXV3hH6NmU0EOLMxGHGEfTwQpTI+gZHHaL
 dyJpERli4QmQlzp7J/WJwNHf/4IsFLxitVF4KQv9RJ7ZIaHhmOoYvxcff8W3nmV89j4V
 7kbvZ9tN/7pqVtHqbYHme4uGUtaBkak/e+1xiNmuz67HPpQRuY8Qsn1BN1TBNxtJE2MO
 efeA==
X-Gm-Message-State: AOAM533lkKRB2tyg3nAzlUHGL7LEGvErXCe7Q3WvSPeNmWNYi6FiYL7K
 BicHGC/p03qPKdB0tlFj57qNR5hsxnllLg==
X-Google-Smtp-Source: ABdhPJx72i4a+TkROljt0Wb4EPTOxVPldT83vTV1A2cQq05Pr/zkDNK3n6FSwwK/f5JTd2he/4yZ9A==
X-Received: by 2002:adf:db8b:0:b0:207:9a90:3819 with SMTP id
 u11-20020adfdb8b000000b002079a903819mr3133255wri.617.1650621898411; 
 Fri, 22 Apr 2022 03:04:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/61] hw/intc/arm_gicv3_cpuif: Don't recalculate maintenance
 irq unnecessarily
Date: Fri, 22 Apr 2022 11:03:57 +0100
Message-Id: <20220422100432.2288247-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The maintenance interrupt state depends only on:
 * ICH_HCR_EL2
 * ICH_LR<n>_EL2
 * ICH_VMCR_EL2 fields VENG0 and VENG1

Now we have a separate function that updates only the vIRQ and vFIQ
lines, use that in places that only change state that affects vIRQ
and vFIQ but not the maintenance interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-27-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_cpuif.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index f11863ff613..d627ddac90f 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -543,7 +543,7 @@ static void icv_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
 
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
     return;
 }
 
@@ -588,7 +588,7 @@ static void icv_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     write_vbpr(cs, grp, value);
 
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
 static uint64_t icv_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -615,7 +615,7 @@ static void icv_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     cs->ich_vmcr_el2 = deposit64(cs->ich_vmcr_el2, ICH_VMCR_EL2_VPMR_SHIFT,
                                  ICH_VMCR_EL2_VPMR_LENGTH, value);
 
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
 static uint64_t icv_igrpen_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -682,7 +682,7 @@ static void icv_ctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     cs->ich_vmcr_el2 = deposit64(cs->ich_vmcr_el2, ICH_VMCR_EL2_VEOIM_SHIFT,
                                  1, value & ICC_CTLR_EL1_EOIMODE ? 1 : 0);
 
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
 static uint64_t icv_rpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -2452,7 +2452,7 @@ static void ich_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_ich_ap_write(ri->crm & 1, regno, gicv3_redist_affid(cs), value);
 
     cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
 static uint64_t ich_hcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.25.1


