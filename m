Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990FF480CE4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:57:20 +0100 (CET)
Received: from localhost ([::1]:43912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Ib1-0005GI-OP
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:57:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJk-0003yN-By; Tue, 28 Dec 2021 14:39:28 -0500
Received: from [2607:f8b0:4864:20::72e] (port=34345
 helo=mail-qk1-x72e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJP-00047U-0f; Tue, 28 Dec 2021 14:39:12 -0500
Received: by mail-qk1-x72e.google.com with SMTP id b85so18060948qkc.1;
 Tue, 28 Dec 2021 11:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PNhOzWP9PX7G1H2sftmFTSQjjRvS33WOhuhoOf1dM90=;
 b=ed30qr921Q9zhFsAL+1qaAuLeduthWaEZZNl2LPBVLKSrMIDpNmAYXfDQUJnQuwT/M
 68et+yfWU+829f+fn5tomFhMqkmTqGDuRnoT9xht79kthopVoEGbZMlvDhXjfIExrZ4V
 h28E23OG8veUbSGH4gze1kbv8GyY5y4nSSMaBDVmXl/YrH6SlWIB73X1MsGj4l45poKX
 /UTWZpycxQ1E+XaIqPvji/uWPyDzJBMxSH3m3R1XDLiId9sCcnWzrzkuGmmE3TEQvlCp
 woxj4YG1lMRlWM6Wxh0vAie+oSfvpVBMwiJ/ykWXT+KQXW6pn12p4/JybKkQ/jnpFtgJ
 CJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PNhOzWP9PX7G1H2sftmFTSQjjRvS33WOhuhoOf1dM90=;
 b=VXFEmYqiuaIaisW60mIuK6tPnF2zAAXLH2E9xDUrrXkVazCuwWL7m0yXh18LplT4Pk
 TDrz0bQ66a7qOI6HhFLRMmskpCNKPqysEwvX3Ce2/sOCjJE4prya4VrA98fqnfCDDx6m
 uiavSzU/Im4L9QHSRsfBVuIkfrcQXfM5bNJcXoSFHiLldZaTmcrf4hXLtko5jumOiKzW
 Alzj1OF6bnxntH5iDd/xTU5w70k/saTjc6DObD981OravbS6XoEcYv5SI6aSK1ZCK4Vt
 mUFaakWCPEBQ9+XZKOGFJoNUdYnWgK7Ve+26/v4njmm7aICsxgLY1Ki6faX973gLY0z0
 hMyw==
X-Gm-Message-State: AOAM531q2IZ63gJMBAEKt0D0YovZhZOK0KUQT3jmqdVOEwmXTrnhSPHP
 T+gOpnocHMM9u6XjZlW4d/0mmQTuhM4=
X-Google-Smtp-Source: ABdhPJxgosBN6bk/EZCPGR3F5eNrS+SdpfS700pcOwr8VH9dfLw4ycAescJ7Ny0hvIGYFCozlvfzeQ==
X-Received: by 2002:a05:620a:2942:: with SMTP id
 n2mr16500836qkp.340.1640720328504; 
 Tue, 28 Dec 2021 11:38:48 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:48 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/17] pnv_phb4.c: do not set 'root-bus' as bus name
Date: Tue, 28 Dec 2021 16:38:05 -0300
Message-Id: <20211228193806.1198496-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change has the same motivation as the one done for pnv-phb3-root-bus
buses previously. Defaulting every bus to 'root-bus' makes it impossible to attach
root ports to specific buses and it doesn't allow for custom bus
naming because we're ignoring the 'id' value when registering the root
bus.

After this patch, creating pnv-phb4 devices with 'id' being set will
result in the following qtree:

qemu-system-ppc64 -m 4G -machine powernv9,accel=tcg \
   -device pnv-phb4,chip-id=0,index=0,id=pcie.0 \
   -device pnv-phb4,chip-id=1,index=4,id=pcie.1

bus: main-system-bus
  type System
  dev: pnv-phb4, id "pcie.1"
    index = 4 (0x4)
    chip-id = 1 (0x1)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pcie.1
      type pnv-phb4-root-bus
  dev: pnv-phb4, id "pcie.0"
    index = 0 (0x0)
    chip-id = 0 (0x0)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pcie.0
      type pnv-phb4-root-bus

And without setting any ids:

qemu-system-ppc64 -m 4G -machine powernv9,accel=tcg \
   -device pnv-phb4,chip-id=0,index=0,id=pcie.0 \
   -device pnv-phb4,chip-id=1,index=4,id=pcie.1

bus: main-system-bus
  type System
  dev: pnv-phb4, id ""
    index = 4 (0x4)
    chip-id = 1 (0x1)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb4-root-bus.1
      type pnv-phb4-root-bus
  dev: pnv-phb4, id ""
    index = 0 (0x0)
    chip-id = 0 (0x0)
    version = 704374636546 (0xa400000002)
    device-id = 1217 (0x4c1)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb4-root-bus.0
      type pnv-phb4-root-bus

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 7b53c12b7c..982a61ebc0 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1354,7 +1354,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     memory_region_init(&phb->pci_mmio, OBJECT(phb), name,
                        PCI_MMIO_TOTAL_SIZE);
 
-    pci->bus = pci_register_root_bus(dev, "root-bus",
+    pci->bus = pci_register_root_bus(dev, dev->id,
                                      pnv_phb4_set_irq, pnv_phb4_map_irq, phb,
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB4_ROOT_BUS);
-- 
2.33.1


