Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DF0501957
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 18:58:47 +0200 (CEST)
Received: from localhost ([::1]:41040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf2nu-0001aQ-Fu
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 12:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iU-0002hp-59
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iO-00047q-93
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649955183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtfRDbss55GendRj5Y2j6p0OpwSZU+pyRYEZeJtl7Io=;
 b=CxJQ+dheHJHDOx7lLVWq5WBB918TBlNnBA3XqbManMC80FsSnM/So60DOziEvnzZrR69bv
 x5deK9hNpvZl6VpxPGhUtoAWamm3TJwdoRNLYvStHNtuwu8i0Fe4votmr1tltGLTMO6mGK
 EfUOoHNUYjCVwjCRYQPwjupthSnDLy8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-JdeJzsBLMBOfMk_crq84Zw-1; Thu, 14 Apr 2022 12:53:02 -0400
X-MC-Unique: JdeJzsBLMBOfMk_crq84Zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B28C03C13A09
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ADB7145831F
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 1/5] machine: use QAPI struct for boot configuration
Date: Thu, 14 Apr 2022 12:52:56 -0400
Message-Id: <20220414165300.555321-2-pbonzini@redhat.com>
In-Reply-To: <20220414165300.555321-1-pbonzini@redhat.com>
References: <20220414165300.555321-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

As part of converting -boot to a property with a QAPI type, define
the struct and use it throughout QEMU to access boot configuration.
machine_boot_parse takes care of doing the QemuOpts->QAPI conversion by
hand, for now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/nseries.c        |  2 +-
 hw/core/machine.c       | 68 +++++++++++++++++++++++++++++++++++++++--
 hw/hppa/machine.c       |  6 ++--
 hw/i386/pc.c            |  2 +-
 hw/nvram/fw_cfg.c       | 27 +++++-----------
 hw/ppc/mac_newworld.c   |  2 +-
 hw/ppc/mac_oldworld.c   |  2 +-
 hw/ppc/prep.c           |  2 +-
 hw/ppc/spapr.c          |  4 +--
 hw/s390x/ipl.c          | 20 ++++--------
 hw/sparc/sun4m.c        |  4 +--
 hw/sparc64/sun4u.c      |  4 +--
 include/hw/boards.h     |  4 +--
 include/sysemu/sysemu.h |  2 --
 qapi/machine.json       | 30 ++++++++++++++++++
 softmmu/bootdevice.c    |  3 +-
 softmmu/globals.c       |  2 --
 softmmu/vl.c            | 25 +--------------
 18 files changed, 127 insertions(+), 82 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 9c1cafae86..692c94ceb4 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1365,7 +1365,7 @@ static void n8x0_init(MachineState *machine,
     }
 
     if (option_rom[0].name &&
-        (machine->boot_order[0] == 'n' || !machine->kernel_filename)) {
+        (machine->boot_config.order[0] == 'n' || !machine->kernel_filename)) {
         uint8_t *nolo_tags = g_new(uint8_t, 0x10000);
         /* No, wait, better start at the ROM.  */
         s->mpu->cpu->env.regs[15] = OMAP2_Q2_BASE + 0x400000;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1e23fdc14b..dc059cfab5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -771,6 +771,68 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     machine_parse_smp_config(ms, config, errp);
 }
 
+void machine_boot_parse(MachineState *ms, QemuOpts *opts, Error **errp)
+{
+    MachineClass *machine_class = MACHINE_GET_CLASS(ms);
+    const char *s;
+    ERRP_GUARD();
+
+    ms->boot_config = (BootConfiguration) {
+        .has_order = true,
+        .order = (char *)machine_class->default_boot_order,
+        .has_strict = true,
+        .strict = false,
+    };
+    if (!opts) {
+        return;
+    }
+
+    s = qemu_opt_get(opts, "order");
+    if (s) {
+        validate_bootdevices(s, errp);
+        if (*errp) {
+            return;
+        }
+        ms->boot_config.order = (char *)s;
+    }
+
+    s = qemu_opt_get(opts, "once");
+    if (s) {
+        validate_bootdevices(s, errp);
+        if (*errp) {
+            return;
+        }
+        ms->boot_config.has_once = true;
+        ms->boot_config.once = (char *)s;
+    }
+
+    s = qemu_opt_get(opts, "splash");
+    if (s) {
+        ms->boot_config.has_splash = true;
+        ms->boot_config.splash = (char *)s;
+    }
+
+    s = qemu_opt_get(opts, "splash-time");
+    if (s) {
+        ms->boot_config.has_splash_time = true;
+        ms->boot_config.splash_time = qemu_opt_get_number(opts, "splash-time", -1);
+    }
+
+    s = qemu_opt_get(opts, "reboot-timeout");
+    if (s) {
+        ms->boot_config.has_reboot_timeout = true;
+        ms->boot_config.reboot_timeout = qemu_opt_get_number(opts, "reboot-timeout", -1);
+    }
+
+    s = qemu_opt_get(opts, "menu");
+    if (s) {
+        ms->boot_config.has_menu = true;
+        ms->boot_config.menu = qemu_opt_get_bool(opts, "menu", false);
+    }
+
+    ms->boot_config.strict = qemu_opt_get_bool(opts, "strict", false);
+}
+
 static void machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1210,9 +1272,9 @@ void qdev_machine_creation_done(void)
 {
     cpu_synchronize_all_post_init();
 
-    if (current_machine->boot_once) {
-        qemu_boot_set(current_machine->boot_once, &error_fatal);
-        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_order));
+    if (current_machine->boot_config.has_once) {
+        qemu_boot_set(current_machine->boot_config.once, &error_fatal);
+        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_config.order));
     }
 
     /*
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 98b30e0395..716a831464 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -116,7 +116,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
     fw_cfg_add_file(fw_cfg, "/etc/power-button-addr",
                     g_memdup(&val, sizeof(val)), sizeof(val));
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, ms->boot_order[0]);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, ms->boot_config.order[0]);
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
 
     return fw_cfg;
@@ -309,8 +309,8 @@ static void machine_hppa_init(MachineState *machine)
          * mode (kernel_entry=1), and to boot from CD (gr[24]='d')
          * or hard disc * (gr[24]='c').
          */
-        kernel_entry = boot_menu ? 1 : 0;
-        cpu[0]->env.gr[24] = machine->boot_order[0];
+        kernel_entry = machine->boot_config.has_menu ? machine->boot_config.menu : 0;
+        cpu[0]->env.gr[24] = machine->boot_config.order[0];
     }
 
     /* We jump to the firmware entry routine and pass the
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fd55fc725c..ca191dff2b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -672,7 +672,7 @@ void pc_cmos_init(PCMachineState *pcms,
     object_property_set_link(OBJECT(pcms), "rtc_state", OBJECT(s),
                              &error_abort);
 
-    set_boot_dev(s, MACHINE(pcms)->boot_order, &error_fatal);
+    set_boot_dev(s, MACHINE(pcms)->boot_config.order, &error_fatal);
 
     val = 0;
     val |= 0x02; /* FPU is there */
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index e5f3c98184..fb91f9e047 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -179,21 +179,13 @@ error:
 
 static void fw_cfg_bootsplash(FWCfgState *s)
 {
-    const char *boot_splash_filename = NULL;
-    const char *boot_splash_time = NULL;
     char *filename, *file_data;
     gsize file_size;
     int file_type;
 
-    /* get user configuration */
-    QemuOptsList *plist = qemu_find_opts("boot-opts");
-    QemuOpts *opts = QTAILQ_FIRST(&plist->head);
-    boot_splash_filename = qemu_opt_get(opts, "splash");
-    boot_splash_time = qemu_opt_get(opts, "splash-time");
-
     /* insert splash time if user configurated */
-    if (boot_splash_time) {
-        int64_t bst_val = qemu_opt_get_number(opts, "splash-time", -1);
+    if (current_machine->boot_config.has_splash_time) {
+        int64_t bst_val = current_machine->boot_config.splash_time;
         uint16_t bst_le16;
 
         /* validate the input */
@@ -209,7 +201,8 @@ static void fw_cfg_bootsplash(FWCfgState *s)
     }
 
     /* insert splash file if user configurated */
-    if (boot_splash_filename) {
+    if (current_machine->boot_config.has_splash) {
+        const char *boot_splash_filename = current_machine->boot_config.splash;
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, boot_splash_filename);
         if (filename == NULL) {
             error_report("failed to find file '%s'", boot_splash_filename);
@@ -239,17 +232,11 @@ static void fw_cfg_bootsplash(FWCfgState *s)
 
 static void fw_cfg_reboot(FWCfgState *s)
 {
-    const char *reboot_timeout = NULL;
     uint64_t rt_val = -1;
     uint32_t rt_le32;
 
-    /* get user configuration */
-    QemuOptsList *plist = qemu_find_opts("boot-opts");
-    QemuOpts *opts = QTAILQ_FIRST(&plist->head);
-    reboot_timeout = qemu_opt_get(opts, "reboot-timeout");
-
-    if (reboot_timeout) {
-        rt_val = qemu_opt_get_number(opts, "reboot-timeout", -1);
+    if (current_machine->boot_config.has_reboot_timeout) {
+        rt_val = current_machine->boot_config.reboot_timeout;
 
         /* validate the input */
         if (rt_val > 0xffff && rt_val != (uint64_t)-1) {
@@ -1134,7 +1121,7 @@ static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
     fw_cfg_add_bytes(s, FW_CFG_SIGNATURE, (char *)"QEMU", 4);
     fw_cfg_add_bytes(s, FW_CFG_UUID, &qemu_uuid, 16);
     fw_cfg_add_i16(s, FW_CFG_NOGRAPHIC, (uint16_t)!machine->enable_graphics);
-    fw_cfg_add_i16(s, FW_CFG_BOOT_MENU, (uint16_t)boot_menu);
+    fw_cfg_add_i16(s, FW_CFG_BOOT_MENU, (uint16_t)(machine->boot_config.has_menu && machine->boot_config.menu));
     fw_cfg_bootsplash(s);
     fw_cfg_reboot(s);
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 4bddb529c2..f9b2cc50ad 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -112,7 +112,7 @@ static void ppc_core99_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
-    const char *boot_device = machine->boot_order;
+    const char *boot_device = machine->boot_config.order;
     Core99MachineState *core99_machine = CORE99_MACHINE(machine);
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 7016979a7c..fd0aebeaf3 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -83,7 +83,7 @@ static void ppc_heathrow_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
     const char *bios_name = machine->firmware ?: PROM_FILENAME;
-    const char *boot_device = machine->boot_order;
+    const char *boot_device = machine->boot_config.order;
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index bf622aa38f..a1cd4505cc 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -381,7 +381,7 @@ static void ibm_40p_init(MachineState *machine)
         }
         boot_device = 'm';
     } else {
-        boot_device = machine->boot_order[0];
+        boot_device = machine->boot_config.order[0];
     }
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a4372ba189..4bb694ca3a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1045,8 +1045,8 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
                 _FDT(fdt_setprop(fdt, chosen, "qemu,boot-kernel-le", NULL, 0));
             }
         }
-        if (boot_menu) {
-            _FDT((fdt_setprop_cell(fdt, chosen, "qemu,boot-menu", boot_menu)));
+        if (machine->boot_config.has_menu && machine->boot_config.menu) {
+            _FDT((fdt_setprop_cell(fdt, chosen, "qemu,boot-menu", true)));
         }
         _FDT(fdt_setprop_cell(fdt, chosen, "qemu,graphic-width", graphic_width));
         _FDT(fdt_setprop_cell(fdt, chosen, "qemu,graphic-height", graphic_height));
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index eb7fc4c4ae..e4d567c915 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -288,13 +288,10 @@ static Property s390_ipl_properties[] = {
 
 static void s390_ipl_set_boot_menu(S390IPLState *ipl)
 {
-    QemuOptsList *plist = qemu_find_opts("boot-opts");
-    QemuOpts *opts = QTAILQ_FIRST(&plist->head);
-    const char *tmp;
     unsigned long splash_time = 0;
 
     if (!get_boot_device(0)) {
-        if (boot_menu) {
+        if (current_machine->boot_config.has_menu && current_machine->boot_config.menu) {
             error_report("boot menu requires a bootindex to be specified for "
                          "the IPL device");
         }
@@ -304,7 +301,7 @@ static void s390_ipl_set_boot_menu(S390IPLState *ipl)
     switch (ipl->iplb.pbt) {
     case S390_IPL_TYPE_CCW:
         /* In the absence of -boot menu, use zipl parameters */
-        if (!qemu_opt_get(opts, "menu")) {
+        if (!current_machine->boot_config.has_menu) {
             ipl->qipl.qipl_flags |= QIPL_FLAG_BM_OPTS_ZIPL;
             return;
         }
@@ -312,26 +309,21 @@ static void s390_ipl_set_boot_menu(S390IPLState *ipl)
     case S390_IPL_TYPE_QEMU_SCSI:
         break;
     default:
-        if (boot_menu) {
+        if (current_machine->boot_config.has_menu && current_machine->boot_config.menu) {
             error_report("boot menu is not supported for this device type");
         }
         return;
     }
 
-    if (!boot_menu) {
+    if (!current_machine->boot_config.has_menu || !current_machine->boot_config.menu) {
         return;
     }
 
     ipl->qipl.qipl_flags |= QIPL_FLAG_BM_OPTS_CMD;
 
-    tmp = qemu_opt_get(opts, "splash-time");
-
-    if (tmp && qemu_strtoul(tmp, NULL, 10, &splash_time)) {
-        error_report("splash-time is invalid, forcing it to 0");
-        ipl->qipl.boot_menu_timeout = 0;
-        return;
+    if (current_machine->boot_config.has_splash_time) {
+        splash_time = current_machine->boot_config.splash_time;
     }
-
     if (splash_time > 0xffffffff) {
         error_report("splash-time is too large, forcing it to max value");
         ipl->qipl.boot_menu_timeout = 0xffffffff;
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 7f3a7c0027..fb58e19e4b 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1049,7 +1049,7 @@ static void sun4m_hw_init(MachineState *machine)
                                     machine->ram_size, &initrd_size);
 
     nvram_init(nvram, (uint8_t *)&nd->macaddr, machine->kernel_cmdline,
-               machine->boot_order, machine->ram_size, kernel_size,
+               machine->boot_config.order, machine->ram_size, kernel_size,
                graphic_width, graphic_height, graphic_depth,
                hwdef->nvram_machine_id, "Sun4m");
 
@@ -1090,7 +1090,7 @@ static void sun4m_hw_init(MachineState *machine)
     }
     fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, INITRD_LOAD_ADDR);
     fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, machine->boot_order[0]);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, machine->boot_config.order[0]);
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
 }
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index cda7df36e3..0d578534c5 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -695,7 +695,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
                                     &kernel_addr, &kernel_entry);
 
     sun4u_NVRAM_set_params(nvram, NVRAM_SIZE, "Sun4u", machine->ram_size,
-                           machine->boot_order,
+                           machine->boot_config.order,
                            kernel_addr, kernel_size,
                            machine->kernel_cmdline,
                            initrd_addr, initrd_size,
@@ -727,7 +727,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     }
     fw_cfg_add_i64(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
     fw_cfg_add_i64(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, machine->boot_order[0]);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, machine->boot_config.order[0]);
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_SPARC64_WIDTH, graphic_width);
     fw_cfg_add_i16(fw_cfg, FW_CFG_SPARC64_HEIGHT, graphic_height);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index c92ac8815c..4b4e8d6991 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -26,6 +26,7 @@ OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
 extern MachineState *current_machine;
 
 void machine_run_board_init(MachineState *machine);
+void machine_boot_parse(MachineState *ms, QemuOpts *opts, Error **errp);
 bool machine_usb(MachineState *machine);
 int machine_phandle_start(MachineState *machine);
 bool machine_dump_guest_core(MachineState *machine);
@@ -350,8 +351,7 @@ struct MachineState {
     ram_addr_t ram_size;
     ram_addr_t maxram_size;
     uint64_t   ram_slots;
-    const char *boot_order;
-    const char *boot_once;
+    BootConfiguration boot_config;
     char *kernel_filename;
     char *kernel_cmdline;
     char *initrd_filename;
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index b9421e03ff..d73de54836 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -43,8 +43,6 @@ extern int alt_grab;
 extern int ctrl_grab;
 extern int graphic_rotate;
 extern int old_param;
-extern int boot_menu;
-extern bool boot_strict;
 extern uint8_t *boot_splash_filedata;
 extern bool enable_mlock;
 extern bool enable_cpu_pm;
diff --git a/qapi/machine.json b/qapi/machine.json
index d25a481ce4..fb06f02ed1 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1393,6 +1393,36 @@
   'data': { 'device': 'str', 'msg': 'str' },
   'features': ['deprecated'] }
 
+##
+# @BootConfiguration:
+#
+# Schema for virtual machine boot configuration.
+#
+# @order: Boot order (a=floppy, c=hard disk, d=CD-ROM, n=network)
+#
+# @once: Boot order to apply on first boot
+#
+# @menu: Whether to show a boot menu
+#
+# @splash: The name of the file to be passed to the firmware as logo picture, if @menu is true.
+#
+# @splash-time: How long to show the logo picture, in milliseconds
+#
+# @reboot-timeout: Timeout before guest reboots after boot fails
+#
+# @strict: Whether to attempt booting from devices not included in the boot order
+#
+# Since: 6.1
+##
+{ 'struct': 'BootConfiguration', 'data': {
+     '*order': 'str',
+     '*once': 'str',
+     '*menu': 'bool',
+     '*splash': 'str',
+     '*splash-time': 'int',
+     '*reboot-timeout': 'int',
+     '*strict': 'bool' } }
+
 ##
 # @SMPConfiguration:
 #
diff --git a/softmmu/bootdevice.c b/softmmu/bootdevice.c
index c0713bfa9f..2106f1026f 100644
--- a/softmmu/bootdevice.c
+++ b/softmmu/bootdevice.c
@@ -268,7 +268,8 @@ char *get_boot_devices_list(size_t *size)
 
     *size = total;
 
-    if (boot_strict && *size > 0) {
+    if (current_machine->boot_config.has_strict &&
+        current_machine->boot_config.strict && *size > 0) {
         list[total-1] = '\n';
         list = g_realloc(list, total + 5);
         memcpy(&list[total], "HALT", 5);
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 3ebd718e35..24b360fba9 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -53,8 +53,6 @@ int alt_grab;
 int ctrl_grab;
 unsigned int nb_prom_envs;
 const char *prom_envs[MAX_PROM_ENVS];
-int boot_menu;
-bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
 int icount_align_option;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6f646531a0..5759df3664 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1878,9 +1878,6 @@ static bool object_create_early(const char *type)
 
 static void qemu_apply_machine_options(QDict *qdict)
 {
-    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
-    const char *boot_order = NULL;
-    const char *boot_once = NULL;
     QemuOpts *opts;
 
     object_set_properties_from_keyval(OBJECT(current_machine), qdict, false, &error_fatal);
@@ -1889,27 +1886,7 @@ static void qemu_apply_machine_options(QDict *qdict)
     current_machine->ram_slots = ram_slots;
 
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
-    if (opts) {
-        boot_order = qemu_opt_get(opts, "order");
-        if (boot_order) {
-            validate_bootdevices(boot_order, &error_fatal);
-        }
-
-        boot_once = qemu_opt_get(opts, "once");
-        if (boot_once) {
-            validate_bootdevices(boot_once, &error_fatal);
-        }
-
-        boot_menu = qemu_opt_get_bool(opts, "menu", boot_menu);
-        boot_strict = qemu_opt_get_bool(opts, "strict", false);
-    }
-
-    if (!boot_order) {
-        boot_order = machine_class->default_boot_order;
-    }
-
-    current_machine->boot_order = boot_order;
-    current_machine->boot_once = boot_once;
+    machine_boot_parse(current_machine, opts, &error_fatal);
 
     if (semihosting_enabled() && !semihosting_get_argc()) {
         /* fall back to the -kernel/-append */
-- 
2.31.1



