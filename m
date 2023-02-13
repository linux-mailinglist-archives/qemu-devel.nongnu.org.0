Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02748694E1B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfh-00087C-Ut; Mon, 13 Feb 2023 12:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfa-00084f-7W
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:14 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfW-0005Pi-FI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:13 -0500
Received: by mail-ej1-x630.google.com with SMTP id lu11so33748868ejb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7QGZE7TtQnYK90iN8/7q50ZxZ1Yw3q9go392CrOw1Q=;
 b=WK8M9OM6Lw33i4+Z0ji9vYVI5dMWUo3jpnLo1rSejIzY0em9nj9+vqnIRytH12XDoR
 cwNnBM8FMskYPNFmOBzuP4zSJ28TG6X302kBuvq+lYBfR3GijXevkRIXeChkmumwO8TW
 RByvcJpb8u0zfSD36ISovUxpTyc3LC5ZhiHFyyGt/r49zPLNFOzwSlymFnp7s9I+vfmB
 9Dcqt6OcnWufozhdPfg5SXR7Zqi5DEhmbg30oCYgB9UXBpAl8vydEaFoJ0+2ICiU/blz
 0Hp31tCVWqh7li4ENn8LkdPLJVgIoCKA+DzoNtiaLW1RaIvZeA3Tx9ac71ZyoLqbQNk9
 JOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7QGZE7TtQnYK90iN8/7q50ZxZ1Yw3q9go392CrOw1Q=;
 b=pO//ErCVCdmavXaxHyCyOPwcVf957btETAvws6VUrKFrTTXr/jCPLSv2nTkdi0T6fq
 aUPNJ/HovlGaSZLwOP/13KZ7xoJR/ImSdBTm4Qq00ETWj7/PGhzTUXQ+rPKMcFlE6AHV
 1ScKZlWsiN14V30DV/a9PnqpCfh1/3vx/InUVT7BJ9QB5p5lnpjd23XY7JZgNbLq6SR4
 6MJMMk9bGG37/GR9BoTVhSo0ORWFVu/b4mcvAQVybDvgk5Wc1YsUUNd2Egj3A+Ki+Gt9
 tuPbYQwlNBu+yl41zl2J3iGbp57g1EpnHAvxewlql/h287BoojgheIQ1vuaFz+5fgT09
 hPMQ==
X-Gm-Message-State: AO0yUKWrZGfAEqPULZJMHVmm+IvFjroIVWPPCKFybDFx+fUbZZKqwOC8
 Wse0zhWnwNvdKAvOLVOecVsdOezJ/vs=
X-Google-Smtp-Source: AK7set89CDgrB4wPVduqq1HW74f47/7jwiiCa3bvHkX+K3hktFzWVEhYGdSG3ZbjPU1+7M+UYQBhpA==
X-Received: by 2002:a17:906:704f:b0:878:955e:b4a4 with SMTP id
 r15-20020a170906704f00b00878955eb4a4mr24743645ejj.33.1676309468022; 
 Mon, 13 Feb 2023 09:31:08 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:07 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 07/12] hw/isa/lpc_ich9: Connect pm stuff to lpc internally
Date: Mon, 13 Feb 2023 18:30:28 +0100
Message-Id: <20230213173033.98762-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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

Make TYPE_ICH9_LPC_DEVICE more self-contained by moving the call to
ich9_lpc_pm_init() from board code to its realize function. In order
to propagate x86_machine_is_smm_enabled(), introduce an "smm-enabled"
property like we have in piix4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/acpi/ich9.h | 6 ++----
 include/hw/i386/ich9.h | 2 --
 hw/acpi/ich9.c         | 8 ++------
 hw/i386/pc_q35.c       | 5 ++---
 hw/isa/lpc_ich9.c      | 8 +++++---
 5 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index d41866a229..57a542c4b8 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -64,7 +64,7 @@ typedef struct ICH9LPCPMRegs {
     uint8_t disable_s3;
     uint8_t disable_s4;
     uint8_t s4_val;
-    uint8_t smm_enabled;
+    bool smm_enabled;
     bool smm_compat;
     bool enable_tco;
     TCOIORegs tco_regs;
@@ -72,9 +72,7 @@ typedef struct ICH9LPCPMRegs {
 
 #define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
 
-void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
-                  bool smm_enabled,
-                  qemu_irq sci_irq);
+void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm, qemu_irq sci_irq);
 
 void ich9_pm_iospace_update(ICH9LPCPMRegs *pm, uint32_t pm_io_base);
 extern const VMStateDescription vmstate_ich9_pm;
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 52ea116f44..433c8942c9 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -8,8 +8,6 @@
 #include "hw/acpi/ich9.h"
 #include "qom/object.h"
 
-void ich9_lpc_pm_init(PCIDevice *pci_lpc, bool smm_enabled);
-
 void ich9_generate_smi(void);
 
 #define ICH9_CC_SIZE (16 * 1024) /* 16KB. Chipset configuration registers */
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index a93c470e9d..54bb3d83b3 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -291,9 +291,7 @@ static void pm_powerdown_req(Notifier *n, void *opaque)
     acpi_pm1_evt_power_down(&pm->acpi_regs);
 }
 
-void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
-                  bool smm_enabled,
-                  qemu_irq sci_irq)
+void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm, qemu_irq sci_irq)
 {
     memory_region_init(&pm->io, OBJECT(lpc_pci), "ich9-pm", ICH9_PMIO_SIZE);
     memory_region_set_enabled(&pm->io, false);
@@ -303,7 +301,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
     acpi_pm_tmr_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
     acpi_pm1_evt_init(&pm->acpi_regs, ich9_pm_update_sci_fn, &pm->io);
     acpi_pm1_cnt_init(&pm->acpi_regs, &pm->io, pm->disable_s3, pm->disable_s4,
-                      pm->s4_val, !pm->smm_compat && !smm_enabled);
+                      pm->s4_val, !pm->smm_compat && !pm->smm_enabled);
 
     acpi_gpe_init(&pm->acpi_regs, ICH9_PMIO_GPE0_LEN);
     memory_region_init_io(&pm->io_gpe, OBJECT(lpc_pci), &ich9_gpe_ops, pm,
@@ -314,8 +312,6 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
                           "acpi-smi", 8);
     memory_region_add_subregion(&pm->io, ICH9_PMIO_SMI_EN, &pm->io_smi);
 
-    pm->smm_enabled = smm_enabled;
-
     if (pm->enable_tco) {
         acpi_pm_tco_init(&pm->tco_regs, &pm->io);
     }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index dbd2160d4e..f13b516f2e 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -238,6 +238,8 @@ static void pc_q35_init(MachineState *machine)
     /* create ISA bus */
     lpc = pci_new_multifunction(PCI_DEVFN(ICH9_LPC_DEV, ICH9_LPC_FUNC), true,
                                 TYPE_ICH9_LPC_DEVICE);
+    qdev_prop_set_bit(DEVICE(lpc), "smm-enabled",
+                      x86_machine_is_smm_enabled(x86ms));
     pci_realize_and_unref(lpc, host_bus, &error_fatal);
 
     object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
@@ -292,9 +294,6 @@ static void pc_q35_init(MachineState *machine)
     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
                          0xff0104);
 
-    /* connect pm stuff to lpc */
-    ich9_lpc_pm_init(lpc, x86_machine_is_smm_enabled(x86ms));
-
     if (pcms->sata_enabled) {
         /* ahci and SATA device, for q35 1 ahci controller is built-in */
         ahci = pci_create_simple_multifunction(host_bus,
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 71f7c18a2e..c5060d145f 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -407,14 +407,13 @@ static void smi_features_ok_callback(void *opaque)
     lpc->smi_features_ok = 1;
 }
 
-void ich9_lpc_pm_init(PCIDevice *lpc_pci, bool smm_enabled)
+static void ich9_lpc_pm_init(ICH9LPCState *lpc)
 {
-    ICH9LPCState *lpc = ICH9_LPC_DEVICE(lpc_pci);
     qemu_irq sci_irq;
     FWCfgState *fw_cfg = fw_cfg_find();
 
     sci_irq = qemu_allocate_irq(ich9_set_sci, lpc, 0);
-    ich9_pm_init(lpc_pci, &lpc->pm, smm_enabled, sci_irq);
+    ich9_pm_init(PCI_DEVICE(lpc), &lpc->pm, sci_irq);
 
     if (lpc->smi_host_features && fw_cfg) {
         uint64_t host_features_le;
@@ -731,6 +730,8 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     pci_bus_irqs(pci_bus, ich9_lpc_set_irq, d, ICH9_LPC_NB_PIRQS);
     pci_bus_map_irqs(pci_bus, ich9_lpc_map_irq);
     pci_bus_set_route_irq_fn(pci_bus, ich9_route_intx_pin_to_irq);
+
+    ich9_lpc_pm_init(lpc);
 }
 
 static bool ich9_rst_cnt_needed(void *opaque)
@@ -797,6 +798,7 @@ static const VMStateDescription vmstate_ich9_lpc = {
 static Property ich9_lpc_properties[] = {
     DEFINE_PROP_BOOL("noreboot", ICH9LPCState, pin_strap.spkr_hi, false),
     DEFINE_PROP_BOOL("smm-compat", ICH9LPCState, pm.smm_compat, false),
+    DEFINE_PROP_BOOL("smm-enabled", ICH9LPCState, pm.smm_enabled, false),
     DEFINE_PROP_BIT64("x-smi-broadcast", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_BROADCAST_BIT, true),
     DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
-- 
2.39.1


