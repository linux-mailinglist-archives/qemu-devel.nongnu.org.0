Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F05EBF89
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:16:42 +0200 (CEST)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7dp-0007Rd-14
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7aB-0000wC-R9
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a8-0002Wi-JZ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:55 -0400
Received: by mail-wr1-x429.google.com with SMTP id x18so14203881wrm.7
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gCpSGaH9k9PWhr0Z9u8fR2+dVNRNKa0vVi8uRr2Kuvg=;
 b=Psu97blzdsnye9goX9eqqYWBeEpeId+OBpZCTlEAIV73WaOzcKpUHfrXZ4rZEoFyE2
 EWlWHVNrR8fQAK75vFldmJlYYhkP8OnLvJNSShB2YfLelX0MHjcxe5SXF+whVEjnmbUG
 bRzlFh9TB7lZvlE5jsotXr0+K2IbUW8oj533VcqPPQeLKdcANaBj5uWRNwZG34JfQsui
 ikLcJzKBcgw34gAfgqiwMiHrSlcusOjqiZ1UIvnQ98W/zJ8pg1uEr8kub5hMk29YuPtb
 tXQk+KxNTOvaYBEJw4ilE1BY6vYOW6EjP/YzgWAMJXIGz8KMmQiSw/FOCvlMbjC4u3Wc
 lOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gCpSGaH9k9PWhr0Z9u8fR2+dVNRNKa0vVi8uRr2Kuvg=;
 b=mjfODUJ1pymaAhvl7IXCVJ5kjMmk3PvGPpZXpNwhQaSdhAPG+6bi+4M3pjacsbz9AJ
 5zjC0vf0wC40GLy2yRWzgJSvtE3Efq+95JsDCJI8Kqs0pYU5SfQzP6W7AP3VpqD0vL8z
 QPSi27ogYtmoFskOdecp0EUPZ4vBOXxsxeFsagq5gL7M2zfftjmr35gDVq7WwWQetmzg
 V5FDBFsGqWr+clKaFG/6pVxnDt3D81d893Y+djFI9GmyFYy5ZQOw+HzsNluNJNNwbj1l
 ruKS23ixERRptn9SgjqfupqqqYKxdAbrVA8NkhrN6sta/RdjH2b0ZyL0oXVJs94SMjc4
 C7BQ==
X-Gm-Message-State: ACrzQf3JTQfo7F2pbYuJp94VntGAZjkcUT+S5/EkafDFaRu4QllsxFzJ
 g7Ro6uXFkFPKCrNLFXd7HFNEug==
X-Google-Smtp-Source: AMsMyM4Eiihp8N9aBK8MUGW3ECfRyXK9aKJ8lBRIXzDRL8ezGSXRpFV63U4g+z7AYefYCgL3aIHeuA==
X-Received: by 2002:a05:6000:15c5:b0:22a:49c2:4c58 with SMTP id
 y5-20020a05600015c500b0022a49c24c58mr15991749wry.362.1664273571139; 
 Tue, 27 Sep 2022 03:12:51 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:50 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 7/8] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
Date: Tue, 27 Sep 2022 11:03:48 +0100
Message-Id: <20220927100347.176606-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2de16f6324..5e16d54bbb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1372,14 +1372,15 @@ static void create_smmu(const VirtMachineState *vms,
 
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
2.37.3


