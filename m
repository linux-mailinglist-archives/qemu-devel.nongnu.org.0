Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607E6A43EB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe82-0004Gk-4C; Mon, 27 Feb 2023 09:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7u-00048g-1R
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7r-0008F6-Np
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id p16so4296553wmq.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UXJl03FgLvsXYxtIMzGoPuJqJdkFHpVg6pSW+aXq01k=;
 b=OBaOOdlvy80OLGrNxkLVXzBHKFFyLUeelYGYx5k5lvM2Chpmb6sSL8gOcxrXJUNI7U
 iyT6vLpK4g6HSATm8zzFZzVpH4j1OkvUGtNshAB8DSOFAXWF8fTcrVw4f6fH9l+p1LqR
 2zF4lc5WVlCJbs0gWtG9j2y2J+QgTSiv2bkvX9qPR3nAB9xl419VmAk61jChe/u7afQw
 Sjlt4MHyq1iodwgunmhxJ2vmSqIsDaHFzmBx1TvCuF4lvG3Nk2N6OQF9CzMMTtcf18vw
 AUaMsmRqgjuwcBYUl7dBNTcsjMG1Kk5OkCSKn+hI6+Pz5dXlPJ2NL9PD83tBUe/YwPZC
 86xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UXJl03FgLvsXYxtIMzGoPuJqJdkFHpVg6pSW+aXq01k=;
 b=3Vin0RAbD5GNoowESKv16gd6EaAeLSVe9Q+YkK3KOhpDw1oXvKW10m17wBT9SdHGth
 IrVQPDtcOKPDf9JipaNj3zC2DtTIZ5c6+RzztpN8XJV+wvpY1IJrEn4KPTE3VeSl2HEY
 ryXNigcHoWwEhqSR7t0SEF5y13xa8cu8OdxuLB1AYefHd9C3qvL8VdpBpX60EO3YIMPR
 hu+D+eJl1GpXqhJlmy0Z19unGq10yBj7AjW3J5IBk/N0TyNOYEJheXHo7PFdIwjFOnFv
 RbZee+BNfalTO5YiYj1CpJjViq+3pkqgi0ehPmS1YmoAJ19KrwMd8ryPCNoit4WaXV/X
 3R8w==
X-Gm-Message-State: AO0yUKVsIyBdoUhRgWG4cywAL8MtcYhI436weDm2k5UtgaHfefQuSilN
 61+hxlZqf3SK3zPelbD513QffwCwHLnmb1bv
X-Google-Smtp-Source: AK7set+MaD6iDZ/ydEocNQCNV8qSeyJkNQ/i4cqi6V7izBWXr6MlmXY1z4e/qhvd7bSno/rfTL73QQ==
X-Received: by 2002:a05:600c:170a:b0:3eb:37ce:4c3d with SMTP id
 c10-20020a05600c170a00b003eb37ce4c3dmr5387715wmn.38.1677506710067; 
 Mon, 27 Feb 2023 06:05:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b003dc1d668866sm12800648wmi.10.2023.02.27.06.05.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:05:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 042/126] hw/isa/lpc_ich9: Eliminate ICH9LPCState::isa_bus
Date: Mon, 27 Feb 2023 15:00:49 +0100
Message-Id: <20230227140213.35084-33-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Bernhard Beschow <shentey@gmail.com>

By using qdev_get_child_bus() we can eliminate ICH9LPCState::isa_bus and
spare the ich9_lpc variable in pc_q35, too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-4-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_q35.c       | 4 +---
 hw/isa/lpc_ich9.c      | 5 +----
 include/hw/i386/ich9.h | 3 ---
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 5dfaeeed5f..5e3f7c7e86 100644
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
@@ -265,12 +264,11 @@ static void pc_q35_init(MachineState *machine)
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
 
-- 
2.38.1


