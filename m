Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057F682BE8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDC-0006h4-BP; Tue, 31 Jan 2023 06:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDA-0006Zx-9m; Tue, 31 Jan 2023 06:54:04 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD8-0002Oh-JS; Tue, 31 Jan 2023 06:54:04 -0500
Received: by mail-ej1-x62f.google.com with SMTP id p26so29611410ejx.13;
 Tue, 31 Jan 2023 03:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvdYUWMM+UZxFmN1oPZ6vShFoUpMnto+10azUGQSHiM=;
 b=QB00bgW6+YKn6n6lCJMsIZf2UsttOSdBXT5fDGP1fWUj+HZ0li53EMOPA2KzVHJp/u
 GFEPUb/k7wlNpK1dh8n/XEvraWpcoFFCBV1sIM3bcDOKgD9MzmuvqqN0vZ48AQ0ZVYsq
 WGgNvRyD/4+O1QjpoaVHta8lo8pfcmjTe5EoVzQOCWtrpi3CA0bBY8WQKFDOF55rEMSd
 2FvgE4/Y1mB+aUCeeywKGMhDD9D7MYDkQk+IwiX9DZzqUBdImXhAynLXyxwTqw3Xaq7z
 bc5g2Yr7YsErtdjgEgOo4nQErYss1l84jl+7u6LxaYhd8Ad7EYk7goTf7BhMRERlN0sJ
 3rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gvdYUWMM+UZxFmN1oPZ6vShFoUpMnto+10azUGQSHiM=;
 b=LzJmREDtPlFF36V6nnTi6/HiOnwHYv4dizH5r9jx3eQ5DiOBjbeYhviLdVTMUdZNW5
 bAKKbfFJLxlIzA8FNa+oKLcYqBtLChhfI5w4ikj4u6AKlQMYswVAh6JVxRNsOTQaxufM
 sJaKNU5kpH1RnkZ48vDlemLrbTBBH5pH/yiLVOgyFusvvQPW4VRV63Ti9WV+d/2I4rcO
 KjgIGNv4MJjXQPSXyKNmNPiyhJzQDQgMxgohbziiIokCxdfZPc+qkm46CL3HcL+GyEfN
 8PshbW9Y5cRFu45U6Sh8iLiPGdQ1O7cGNF0jbAevWfj+IUICyaBgusNU6pqzfeyDiPR+
 AkFg==
X-Gm-Message-State: AO0yUKX2/WnWZByDolWWwhHcapSt9tSZGhINDU4UNKyfGfdywWzUssYq
 ULYC1KOonOzRlTUX5NOQdkMlkvn7jJU=
X-Google-Smtp-Source: AK7set+fWEik5Uzle//P3JHOv1ogGXTy+Vf61wCwOsM8CKcm2WuZdiowtplAbjEYecCGC60XZx1Y6w==
X-Received: by 2002:a17:906:4dc7:b0:882:7e27:ea6d with SMTP id
 f7-20020a1709064dc700b008827e27ea6dmr15160420ejw.27.1675166040541; 
 Tue, 31 Jan 2023 03:54:00 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:54:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 10/20] hw/isa/lpc_ich9: Eliminate ICH9LPCState::isa_bus
Date: Tue, 31 Jan 2023 12:53:16 +0100
Message-Id: <20230131115326.12454-11-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

By using qdev_get_child_bus() we can eliminate ICH9LPCState::isa_bus and
spare the ich9_lpc variable in pc_q35, too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/ich9.h | 3 ---
 hw/i386/pc_q35.c       | 4 +---
 hw/isa/lpc_ich9.c      | 5 +----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 921e4c7ef6..05464f6965 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -1,7 +1,6 @@
 #ifndef HW_ICH9_H
 #define HW_ICH9_H
 
-#include "hw/isa/isa.h"
 #include "hw/sysbus.h"
 #include "hw/i386/pc.h"
 #include "hw/isa/apm.h"
@@ -64,8 +63,6 @@ struct ICH9LPCState {
                                        * triggers feature lockdown */
     uint64_t smi_negotiated_features; /* guest-invisible, host endian */
 
-    /* isa bus */
-    ISABus *isa_bus;
     MemoryRegion rcrb_mem; /* root complex register block */
     Notifier machine_ready;
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 83e4fb7868..a4d5c89409 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -132,7 +132,6 @@ static void pc_q35_init(MachineState *machine)
     GSIState *gsi_state;
     ISABus *isa_bus;
     int i;
-    ICH9LPCState *ich9_lpc;
     PCIDevice *ahci;
     ram_addr_t lowmem;
     DriveInfo *hd[MAX_SATA_PORTS];
@@ -262,12 +261,11 @@ static void pc_q35_init(MachineState *machine)
     /* irq lines */
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
-    ich9_lpc = ICH9_LPC_DEVICE(lpc);
     lpc_dev = DEVICE(lpc);
     for (i = 0; i < GSI_NUM_PINS; i++) {
         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gsi[i]);
     }
-    isa_bus = ich9_lpc->isa_bus;
+    isa_bus = ISA_BUS(qdev_get_child_bus(lpc_dev, "isa.0"));
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index b444faacd2..9ab966ef88 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -710,8 +710,6 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     memory_region_init_io(&lpc->rcrb_mem, OBJECT(d), &rcrb_mmio_ops, lpc,
                           "lpc-rcrb-mmio", ICH9_CC_SIZE);
 
-    lpc->isa_bus = isa_bus;
-
     ich9_cc_init(lpc);
     apm_init(d, &lpc->apm, ich9_apm_ctrl_changed, lpc);
 
@@ -819,8 +817,7 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *field;
     BusChild *kid;
-    ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
-    BusState *bus = BUS(s->isa_bus);
+    BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
     Aml *sb_scope = aml_scope("\\_SB");
 
     /* ICH9 PCI to ISA irq remapping */
-- 
2.39.1


