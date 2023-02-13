Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC54694E02
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:32:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfh-00087B-Qc; Mon, 13 Feb 2023 12:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfb-00084r-IZ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:17 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfY-0005P7-Cv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:15 -0500
Received: by mail-ej1-x629.google.com with SMTP id sb24so9763079ejb.8
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUEabPiKS1nzMr3CTC+5qhFJDRFizzS1WojL6re5JSk=;
 b=hrbHKeeIfq6DW1Rhktr1w6gJNrjwCE5OT1YzVYDK/MV99aNZQHN31VB8L8fjRo8qVa
 IddTZi71sczvg1En3AtyF+itVM7FSr2e88lNWLJxNKMVnMPt1sJcgbykIEtMOCjNjdCH
 WWxqOzbonDkBosAuwLG/4IEyOjEuvHwUTXiU2Wdi7VwcCZXhRNQHCWgNfe0c9KMmOcr7
 VQC/SFCrB61/j39zZh6FxQgMsGM3nxpithSvQ+zRfxSlpvNCIqZAnM5ynJZ9wd+FhokS
 DIDbwrEtrPS/dnw3rJhHH3L1zUMJiXrdOO1AjSLWm5ctiDDqhm7Lt6cCb/X3RHX8VUm2
 1EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUEabPiKS1nzMr3CTC+5qhFJDRFizzS1WojL6re5JSk=;
 b=z1PqPdEUrBHqGyNFOLNghWutE/oOcqcaOoKN3HeeekyeBDRtuDlLkO51L8ZIeOXOjO
 SicpFceNxu52iR1KBtbAY6ZLMngS39hEwdKyHxRObzCZGYePBVAt0N+8lvKtDnm0+ZYC
 YGy4q5LTSkxaVM+FdpqbnFpFL1e2gt47srZvhU2UsglvpPp8lN35ut5ZgevuZCXITvHz
 0pyrNg7+LhlL58/NHX9Tnnsf22M4r5TO1yxaHWiFI0Th46+YeJt9J38jHySDDP5aZKE6
 HVrpEBdhUVop8ubQQu8RdrhF79PdaEEFtpHw35uyD9ak7M+RiTLEfnvpV8Z5etWfdyqr
 pJHg==
X-Gm-Message-State: AO0yUKULhM8ln0SOUuumyouU3IFUyyteOUCC5CV7+VhQ8LmbwABwP/cZ
 dSLeTtrdIVSc0nLHJsJ/HSQtrWPHtpA=
X-Google-Smtp-Source: AK7set9xin4u0U/+nP6wSa8u6zgPgmucyDc5fSYdI2drNNT7UBQaOtx/PssilhZATuEs88wBvDumWA==
X-Received: by 2002:a17:906:4f83:b0:87a:542e:53b4 with SMTP id
 o3-20020a1709064f8300b0087a542e53b4mr26002882eju.64.1676309463205; 
 Mon, 13 Feb 2023 09:31:03 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:02 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 03/12] hw/isa/lpc_ich9: Eliminate ICH9LPCState::isa_bus
Date: Mon, 13 Feb 2023 18:30:24 +0100
Message-Id: <20230213173033.98762-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
index 8fac0e57bc..4af8474f31 100644
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
@@ -266,12 +265,11 @@ static void pc_q35_init(MachineState *machine)
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
index 54a8839cd2..71f7c18a2e 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -710,8 +710,6 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     memory_region_init_io(&lpc->rcrb_mem, OBJECT(d), &rcrb_mmio_ops, lpc,
                           "lpc-rcrb-mmio", ICH9_CC_SIZE);
 
-    lpc->isa_bus = isa_bus;
-
     ich9_cc_init(lpc);
     apm_init(d, &lpc->apm, ich9_apm_ctrl_changed, lpc);
 
@@ -818,8 +816,7 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *field;
-    ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
-    BusState *bus = BUS(s->isa_bus);
+    BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
     Aml *sb_scope = aml_scope("\\_SB");
 
     /* ICH9 PCI to ISA irq remapping */
-- 
2.39.1


