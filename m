Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390B682C01
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:56:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDJ-0006vS-6y; Tue, 31 Jan 2023 06:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDG-0006pU-KY; Tue, 31 Jan 2023 06:54:10 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDE-0002QC-C3; Tue, 31 Jan 2023 06:54:10 -0500
Received: by mail-ed1-x52d.google.com with SMTP id be12so2874325edb.4;
 Tue, 31 Jan 2023 03:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jK+HqWAF0i2+Iqc7sL+yhGP1FjJWW4+T+puMuZ1qqd4=;
 b=UIsY2UnGhNtrQxN/UhbVwa8QS7eNS4t+LpQIbBEihswqTMe+WDWLDiPhkKEfYqKBJX
 TTY9G+TxS1dEjHzQhWC7fifyQ83qs88TkOkqnupWe7Byn1qhOjAa8TKsIWu7jAUw6mdY
 QRWjDzJNXvFV5vRbh3BhIFsO2Rcm0U797YgDUY97HwLUObf2C2grDBNbIwF+qdJ4QLQf
 xuVC3VMr1m/lBXjR+paYrxCehjOTObVjIrv3A8I+/6QUTFgxBJn7BlL04CgIohCMatPD
 8TH5sBpUpWSAnqO3Tx+qjTXWQprBnVDH685gNXxfCYw0YhMWJDuYj+B2P97nY68Z4phR
 l2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jK+HqWAF0i2+Iqc7sL+yhGP1FjJWW4+T+puMuZ1qqd4=;
 b=6UgbE5fczmKakQEKe8koh4kh2cO95xx5RDU8fOGuflfHYow5JmSYoUMd/bkJHF+bES
 p7DD4/lTHE9epYP1y4pRD1fYzPMPci3m8TQST7/y40k6OnTHHXXaw/6Ei6I1RS9M0eMd
 RovSy6WTlbwI7+6OAgM3ECFNQCcuDr2HdTgcScIqPujY9QVuzBA2ROuBJaM/pw4jhs0+
 l1pwryRRWELw42KEmhEv7bl38akW7osbF5XmN6a08UxhW0EpnragIxq/r4jdrPHwoM91
 4H0v/GWpvxz6ruAbObr8j9r1O680GikeDWXwXoN9I/rOgS5nwZWhE9Anobhe23V7MOZR
 eXuw==
X-Gm-Message-State: AO0yUKVdCTAnXnjYX0W47H6goed++3aJtThusUhYD/TUjB7PCjVIf/Ke
 pgMGXdGmHe8ithhjnIg1p6z7gIe642k=
X-Google-Smtp-Source: AK7set9xeJ9vw/ZG+t6WJpUZcCy/RqYQdr+LhNLqJT6IKzCrl/wuFh1wn4qgOuGTWvljwmSS9+0aKw==
X-Received: by 2002:a05:6402:1a5c:b0:4a0:8ea1:cce with SMTP id
 bf28-20020a0564021a5c00b004a08ea10ccemr27531815edb.25.1675166046150; 
 Tue, 31 Jan 2023 03:54:06 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:54:05 -0800 (PST)
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
Subject: [PATCH v2 15/20] hw/isa/lpc_ich9: Connect pm stuff to lpc internally
Date: Tue, 31 Jan 2023 12:53:21 +0100
Message-Id: <20230131115326.12454-16-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
index 27a1fe351d..2b34b88dc2 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -236,6 +236,8 @@ static void pc_q35_init(MachineState *machine)
     /* create ISA bus */
     lpc = pci_new_multifunction(PCI_DEVFN(ICH9_LPC_DEV, ICH9_LPC_FUNC), true,
                                 TYPE_ICH9_LPC_DEVICE);
+    qdev_prop_set_bit(DEVICE(lpc), "smm-enabled",
+                      x86_machine_is_smm_enabled(x86ms));
     pci_realize_and_unref(lpc, host_bus, &error_fatal);
 
     object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
@@ -289,9 +291,6 @@ static void pc_q35_init(MachineState *machine)
     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
                          0xff0104);
 
-    /* connect pm stuff to lpc */
-    ich9_lpc_pm_init(lpc, x86_machine_is_smm_enabled(x86ms));
-
     if (pcms->sata_enabled) {
         /* ahci and SATA device, for q35 1 ahci controller is built-in */
         ahci = pci_create_simple_multifunction(host_bus,
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 1b7e5585b3..7d21857d53 100644
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


