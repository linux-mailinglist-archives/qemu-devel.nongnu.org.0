Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848B60D1CA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:46:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyL-0005La-7T; Tue, 25 Oct 2022 12:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyE-00057c-0q
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:06 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMy6-0001OT-Pz
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:05 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so8679904wmb.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=utmGtkV3MP5DXSAZKoAvE/klwIkMKDQpq8pKnbZX+nE=;
 b=XcW1UDKPRnvCBmc7Mk5XxmBOXNMjn744zGtLPL/6j4EBwPy7XAfb11ouBsWDJuzc6r
 R4m1bfVjwWG6wZGt0lD/nrWbXR6FpiRn0eXgloFrzdH3zC8siR4mXUqQfowL+7tkh9ir
 r76QkEjVQQDuuG8k1e8wLKUqjaaJmMnXlyUWjQvmP0juIFTaasBeWEs6XrVnDXqrxJYm
 x2UvbXVeRzaR3VEdX7dYgUP0Jkvqy415is2dv4xe4XtX4ZjbDp6se5uAan0g0tkOY9wU
 r5o2+V0IFsrfJcMVVlBzio3f5GOfFZUmQbOAMgw5CxkhOff98nw95RdlSV979oxKivOM
 5QTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=utmGtkV3MP5DXSAZKoAvE/klwIkMKDQpq8pKnbZX+nE=;
 b=GXtoVePMh0qMX51axMa06rWoJ/EYSJGWPjK+HUL0bpO5Af6l1IaNrr6BTn+3fIaIS6
 fDVOF1w5JMkAnoHUIGZ4+1uREt/T+olGg1A4dS+i1H9dAUm/1FXoEpGHHd9b3JckMvWW
 I055cED+9pcgoQnKSLB+Bi4dh2IcvJCiqfvbO20dT73M8HlZNHg2woGhrmUdA8RJjVF9
 458hDVs/U/IC2+VZBXHebVVv3DrUHmkQ2xqlYqTWPLw/YrdOOGck8y/OxtId7Tkx/+BC
 SGVGOyGEEJrF1yxC/eHAe2NseibTwhn+z8ji3RhylOSoYRLfO1ZHN9nnVyjdG8G4s3tz
 lMxg==
X-Gm-Message-State: ACrzQf0H+M8iJXs3xQI/12bAWNOaru6Rur8o4H35EmrWv4SBiW0K8jOt
 3jx6m2BJ78S2enxzsFnU8Q8sJ4ZexVOXFg==
X-Google-Smtp-Source: AMsMyM7FryKkY5UpnspV2IsIf38vG80h3QmNfDJKPExs/z6obzBnz5uiaMMNGBHVcSODTiYdekzNcw==
X-Received: by 2002:a05:600c:3384:b0:3c6:f25a:96e9 with SMTP id
 o4-20020a05600c338400b003c6f25a96e9mr34935482wmp.112.1666715997213; 
 Tue, 25 Oct 2022 09:39:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.39.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:39:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/30] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
Date: Tue, 25 Oct 2022 17:39:24 +0100
Message-Id: <20221025163952.4131046-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The "PCI Bus Binding to: IEEE Std 1275-1994" defines the compatible
string for a PCIe bus or endpoint as "pci<vendorid>,<deviceid>" or
similar. Since the initial binding for PCI virtio-iommu didn't follow
this rule, it was modified to accept both strings and ensure backward
compatibility. Also, the unit-name for the node should be
"device,function".

Fix corresponding dt-validate and dtc warnings:

  pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
  pcie@10000000: Unevaluated properties are not allowed (... 'virtio_iommu@16' were unexpected)
  From schema: linux/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
  virtio_iommu@16: compatible: 'oneOf' conditional failed, one must be fixed:
        ['virtio,pci-iommu'] is too short
        'pci1af4,1057' was expected
  From schema: dtschema/schemas/pci/pci-bus.yaml

  Warning (pci_device_reg): /pcie@10000000/virtio_iommu@16: PCI unit address format error, expected "2,0"

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cda9defe8f0..b8713508561 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1371,14 +1371,15 @@ static void create_smmu(const VirtMachineState *vms,
 
 static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
 {
-    const char compat[] = "virtio,pci-iommu";
+    const char compat[] = "virtio,pci-iommu\0pci1af4,1057";
     uint16_t bdf = vms->virtio_iommu_bdf;
     MachineState *ms = MACHINE(vms);
     char *node;
 
     vms->iommu_phandle = qemu_fdt_alloc_phandle(ms->fdt);
 
-    node = g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename, bdf);
+    node = g_strdup_printf("%s/virtio_iommu@%x,%x", vms->pciehb_nodename,
+                           PCI_SLOT(bdf), PCI_FUNC(bdf));
     qemu_fdt_add_subnode(ms->fdt, node);
     qemu_fdt_setprop(ms->fdt, node, "compatible", compat, sizeof(compat));
     qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg",
-- 
2.25.1


