Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72212591062
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:53:17 +0200 (CEST)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTE3-0006N3-HC
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6e-0000ND-RH
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6d-0002PT-3J
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:36 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 az6-20020a05600c600600b003a530cebbe3so434612wmb.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 04:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=Ce+a9h2NdhVEtI5y5oWvwzc5i/EiA02fVrOU8Twutdg=;
 b=sIO8QMx/VkbIxT5PXGC23PKhsjbavkbcWKMCaGffVa0gcNPYNvZdSTyVTqnQj1pRp5
 omN2OCXFOAZ8u2EmEy2GVkFo6HG525KwidnTa72Kl7/JFFJhhP6hYpGr4PSgVwPqqqak
 XDUlfV7XTJyuusPcbj4W09gr2JYDPQ1jeIka2PUjH3VogDu6KCR26hOLkqXRyVtkwrmt
 lSpB3ZlliZrkpdlaJ4FHvBrvRSanrdyUeFBTT9mlLbHZy2Rn5B8gvq3VTtG/5v5wnC5W
 B5C+DUN2gOZlhEeixnnm72HSrHe5Ux/gLE44SQIypTgi5RsjyR4+REpeqO/TK45ZDPE9
 6l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=Ce+a9h2NdhVEtI5y5oWvwzc5i/EiA02fVrOU8Twutdg=;
 b=SFZ/su0rOK1z8HD7U404+APUvdsvUAonx6FjQXi051PM6hKkkhzpI1nNnF0qYTQ4CL
 ErbpkKnfXGy85ZDmqrWvZw+L2U9a42/Ex8EMnVoQW7QIEUxvryaJYGKZKyM+Ebkwo39R
 kytR4FvOhM2iE4AThEdDiFT4/V6701XXDtUPBHKKtkxledL4Tm7AGpYzMBFiTsXakKhA
 sym8vJ/PC/JU9Mir/aXhoAIOduj+rhdRj85Tg1xPBp2EXxdyhkgosIFeqvz6rSOtPPXb
 s5BF8X99i5UmGWF0zYmwo5Ku/p78zrtqe8hx5uBjNCH845qdh80nxpQ5zYQy+fzsZgJb
 yyww==
X-Gm-Message-State: ACgBeo1/rAnO27CZlGqG+nHT+OUvlDX2vRl8d2oZhpPmIM15TauIBOPP
 BurOVfanijW/y5pLWhPZ9dP6ANf9biUWpA==
X-Google-Smtp-Source: AA6agR4hgzziYjFMP3OQrM0HRlgFwqykggkpqh2GKJCjiZ1XOoAx1AIOXQYv9e8h2yul1u7rYaQJFg==
X-Received: by 2002:a05:600c:4ec9:b0:3a5:a567:137f with SMTP id
 g9-20020a05600c4ec900b003a5a567137fmr8728228wmq.46.1660304733742; 
 Fri, 12 Aug 2022 04:45:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b003a5418245b9sm11257797wms.19.2022.08.12.04.45.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 04:45:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] hw/arm/virt-acpi-build: Present the GICR structure
 properly for GICv4
Date: Fri, 12 Aug 2022 12:45:26 +0100
Message-Id: <20220812114527.1336370-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812114527.1336370-1-peter.maydell@linaro.org>
References: <20220812114527.1336370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Zenghui Yu <yuzenghui@huawei.com>

With the introduction of the new TCG GICv4, build_madt() is badly broken
as we do not present any GIC Redistributor structure in MADT for GICv4
guests, so that they have no idea about where the Redistributor
register frames are. This fixes a Linux guest crash at boot time with
ACPI enabled and '-machine gic-version=4'.

While at it, let's convert the remaining hard coded gic_version into
enumeration VIRT_GIC_VERSION_2 for consistency.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Message-id: 20220812022018.1069-1-yuzenghui@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt-acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 449fab00805..9b3aee01bf8 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -732,7 +732,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
                                              PPI(VIRTUAL_PMU_IRQ) : 0;
 
-        if (vms->gic_version == 2) {
+        if (vms->gic_version == VIRT_GIC_VERSION_2) {
             physical_base_address = memmap[VIRT_GIC_CPU].base;
             gicv = memmap[VIRT_GIC_VCPU].base;
             gich = memmap[VIRT_GIC_HYP].base;
@@ -762,7 +762,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
     }
 
-    if (vms->gic_version == 3) {
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
         build_append_gicr(table_data, memmap[VIRT_GIC_REDIST].base,
                                       memmap[VIRT_GIC_REDIST].size);
         if (virt_gicv3_redist_region_count(vms) == 2) {
-- 
2.25.1


