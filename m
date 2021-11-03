Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B92444471
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:13:33 +0100 (CET)
Received: from localhost ([::1]:35030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHxE-0001aK-Sg
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHou-0003Er-Db
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHos-0000Vo-D9
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id b71so2227574wmd.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h9p/+sNJF4UoADiuc/UNzSuF6N6VVZml17lGfFKsmQU=;
 b=FP7s6KJ378RfnbtzesYf34Bwf1bloSyHrqZHMEdV+0jfeQ80njWGbIgQL1mGu7yvG1
 DT1TtKwYOKLA74VZWmMmXpHtZi3apO3LZrliSBF9Uo7FPdVEv/9MSthvZnCJOz0BjD5Q
 qbAmYPNG8FyxIoqdxMKHsMDiOi/4AQ+MY99Be6m+YLjAB/mrmXICVcVbZOmKHlojxyui
 4cPC0F9S3rdT5Znmp7N3SclHaNmYi+zeUJHyMHVvQD0iWamuyS2BUdlBWb1RnHi76GDJ
 Gf8a6hDfoHDBvOW1PiHE0+MHlJdBs6FrX0oG+OhCNO4zoGSsdYIAlCceO56CafjZ9i4R
 weMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h9p/+sNJF4UoADiuc/UNzSuF6N6VVZml17lGfFKsmQU=;
 b=cbCeEbjrVZ9ZUGgGNomUN/etf/EDTfL1xs5rA/lPVg3CmIA1aD0X+BIbviQwDl0qlx
 6NpY0XwftFNEBwfz+AFdN65nvV68eRv8o1v7DnqJiW6WeJQoaqF2+LA9FAF3Day36+bT
 QIYa4fD4c8BFtq+VqlEAPDmFrrKgeuFyQgWcs5TjviHiyBBbEDKs2htlFkklWUCxVNky
 hiV2DdQX07dJsTwtZ0n9XuD4W6m5hEJCHog0b8CQna2TF9AeXZn/pdKRUPDCYEI5w0Hx
 lD20xA6yvtXWyGvMSo3F+hKClGF0sRyVt7CYlt3n6OdM5/iSfsvSLGoaCKFSrQeoXJGX
 ldoQ==
X-Gm-Message-State: AOAM531jNJozUHaCiY9K9D0PJbv1qjOXBWPkVEDeWvz2QUT3VrO7EHM8
 KziyPS7h48gQX+Y0Ja80NckiUDMdMMc=
X-Google-Smtp-Source: ABdhPJzev8QselrK0dGt3zDRNOLK+2JbFr1olVds2zMH869DJbBYs6PqXBCmQNet/1JPrY5txMETBQ==
X-Received: by 2002:a1c:48e:: with SMTP id 136mr16109495wme.21.1635951893001; 
 Wed, 03 Nov 2021 08:04:53 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/27] target/i386: move linuxboot_dma_enabled to
 X86MachineState
Date: Wed,  3 Nov 2021 16:04:22 +0100
Message-Id: <20211103150442.387121-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This removes a parameter from x86_load_linux, and will avoid code
duplication between the linux and multiboot cases once multiboot
starts to support DMA.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/microvm.c     | 5 ++++-
 hw/i386/pc.c          | 5 ++---
 hw/i386/pc_piix.c     | 3 ++-
 hw/i386/pc_q35.c      | 3 ++-
 hw/i386/x86.c         | 5 +++--
 include/hw/i386/pc.h  | 3 ---
 include/hw/i386/x86.h | 5 +++--
 7 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index f257ec5a0b..837bafb64a 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -331,7 +331,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     rom_set_fw(fw_cfg);
 
     if (machine->kernel_filename != NULL) {
-        x86_load_linux(x86ms, fw_cfg, 0, true, true);
+        x86_load_linux(x86ms, fw_cfg, 0, true);
     }
 
     if (mms->option_roms) {
@@ -667,6 +667,7 @@ static void microvm_machine_initfn(Object *obj)
 
 static void microvm_class_init(ObjectClass *oc, void *data)
 {
+    X86MachineClass *x86mc = X86_MACHINE_CLASS(oc);
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
@@ -697,6 +698,8 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = microvm_device_unplug_request_cb;
     hc->unplug = microvm_device_unplug_cb;
 
+    x86mc->fwcfg_dma_enabled = true;
+
     object_class_property_add(oc, MICROVM_MACHINE_PIC, "OnOffAuto",
                               microvm_machine_get_pic,
                               microvm_machine_set_pic,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 86223acfd3..d203db7845 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -775,7 +775,7 @@ void xen_load_linux(PCMachineState *pcms)
     rom_set_fw(fw_cfg);
 
     x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                   pcmc->pvh_enabled, pcmc->linuxboot_dma_enabled);
+                   pcmc->pvh_enabled);
     for (i = 0; i < nb_option_roms; i++) {
         assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
                !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
@@ -927,7 +927,7 @@ void pc_memory_init(PCMachineState *pcms,
 
     if (linux_boot) {
         x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                       pcmc->pvh_enabled, pcmc->linuxboot_dma_enabled);
+                       pcmc->pvh_enabled);
     }
 
     for (i = 0; i < nb_option_roms; i++) {
@@ -1664,7 +1664,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
      * to be used at the moment, 32K should be enough for a while.  */
     pcmc->acpi_data_size = 0x20000 + 0x8000;
-    pcmc->linuxboot_dma_enabled = true;
     pcmc->pvh_enabled = true;
     pcmc->kvmclock_create_always = true;
     assert(!mc->get_hotplug_handler);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6ad0d763c5..223dd3e05d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -620,11 +620,12 @@ DEFINE_I440FX_MACHINE(v2_7, "pc-i440fx-2.7", NULL,
 
 static void pc_i440fx_2_6_machine_options(MachineClass *m)
 {
+    X86MachineClass *x86mc = X86_MACHINE_CLASS(m);
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_i440fx_2_7_machine_options(m);
     pcmc->legacy_cpu_hotplug = true;
-    pcmc->linuxboot_dma_enabled = false;
+    x86mc->fwcfg_dma_enabled = false;
     compat_props_add(m->compat_props, hw_compat_2_6, hw_compat_2_6_len);
     compat_props_add(m->compat_props, pc_compat_2_6, pc_compat_2_6_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index fcc6e4eb2b..797e09500b 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -573,11 +573,12 @@ DEFINE_Q35_MACHINE(v2_7, "pc-q35-2.7", NULL,
 
 static void pc_q35_2_6_machine_options(MachineClass *m)
 {
+    X86MachineClass *x86mc = X86_MACHINE_CLASS(m);
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_q35_2_7_machine_options(m);
     pcmc->legacy_cpu_hotplug = true;
-    pcmc->linuxboot_dma_enabled = false;
+    x86mc->fwcfg_dma_enabled = false;
     compat_props_add(m->compat_props, hw_compat_2_6, hw_compat_2_6_len);
     compat_props_add(m->compat_props, pc_compat_2_6, pc_compat_2_6_len);
 }
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 76de7e2265..a34498fe16 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -764,9 +764,9 @@ static bool load_elfboot(const char *kernel_filename,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled,
-                    bool linuxboot_dma_enabled)
+                    bool pvh_enabled)
 {
+    bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
     uint16_t protocol;
     int setup_size, kernel_size, cmdline_size;
     int dtb_size, setup_data_offset;
@@ -1332,6 +1332,7 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
     x86mc->compat_apic_id_mode = false;
     x86mc->save_tsc_khz = true;
+    x86mc->fwcfg_dma_enabled = true;
     nc->nmi_monitor_handler = x86_nmi;
 
     object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 11426e26dc..9162aded21 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -116,9 +116,6 @@ struct PCMachineClass {
     /* generate legacy CPU hotplug AML */
     bool legacy_cpu_hotplug;
 
-    /* use DMA capable linuxboot option rom */
-    bool linuxboot_dma_enabled;
-
     /* use PVH to load kernels that support this feature */
     bool pvh_enabled;
 
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 23267a3674..bb1cfb8896 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -38,6 +38,8 @@ struct X86MachineClass {
     bool save_tsc_khz;
     /* Enables contiguous-apic-ID mode */
     bool compat_apic_id_mode;
+    /* use DMA capable linuxboot option rom */
+    bool fwcfg_dma_enabled;
 };
 
 struct X86MachineState {
@@ -120,8 +122,7 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
-                    bool pvh_enabled,
-                    bool linuxboot_dma_enabled);
+                    bool pvh_enabled);
 
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
-- 
2.31.1



