Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9392484AC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 14:24:08 +0200 (CEST)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k80et-0007D4-Oj
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 08:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k80dK-0005Vd-9S
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 08:22:30 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32601
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k80dH-0001vU-Vv
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 08:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597753347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qn04Di7tvbtKIz9MJGPqrUlOrLzEgKmR4HtPUXPcPNw=;
 b=EJsRnh/l5l3jlpMeY2MQb88ZWSfPzdWcGalEEAcsobTdavX4Hp32OxT6pNINaPqvZGeUSH
 Esd9WNT5+CxyqZIY1Th8Tz15AmY3ROBb23a6Y/iBQKr+XyFonVgLy0J2iwf9VQ/sg3sut2
 bK6OOq5AkcJswL6w0N8yy2lw5xRzJUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-vVAYN413Ox-8Hwd0Pnhhug-1; Tue, 18 Aug 2020 08:22:25 -0400
X-MC-Unique: vVAYN413Ox-8Hwd0Pnhhug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C88D1007464;
 Tue, 18 Aug 2020 12:22:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3235882D;
 Tue, 18 Aug 2020 12:22:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] x68: acpi: trigger SMI before sending hotplug Notify
 event to OSPM
Date: Tue, 18 Aug 2020 08:22:07 -0400
Message-Id: <20200818122208.1243901-7-imammedo@redhat.com>
In-Reply-To: <20200818122208.1243901-1-imammedo@redhat.com>
References: <20200818122208.1243901-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:16:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: boris.ostrovsky@oracle.com, lersek@redhat.com, aaron.young@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case firmware has negotiated CPU hotplug SMI feature, generate
AML to describe SMI IO port region and send SMI to firmware
on each CPU hotplug SCI in case new CPUs were hotplugged.

Since new CPUs can be hotplugged while CPU_SCAN_METHOD is running
we can't send SMI before new CPUs are fetched from QEMU as it
could cause sending Notify to a CPU that firmware hasn't seen yet.
So fetch new CPUs into local cache first and then send SMI and
after that sends Notify events to cached CPUs. This should ensure
that Notify is sent only to CPUs which were processed by firmware
first.
Any CPUs that were hotplugged after caching will be processed
by the next CPU_SCAN_METHOD, when pending SCI is handled.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
 - clear insert event after firmware has returned
   control from SMI. (Laszlo Ersek <lersek@redhat.com>)
v1:
 - make sure that Notify is sent only to CPUs seen by FW
 - (Laszlo Ersek <lersek@redhat.com>)
    - use macro instead of x-smi-negotiated-features
    - style fixes
    - reserve whole SMI block (0xB2, 0xB3)
v0:
 - s/aml_string/aml_eisaid/
   /fixes Windows BSOD, on nonsense value/ (Laszlo Ersek <lersek@redhat.com>)
 - put SMI device under PCI0 like the rest of hotplug IO port
 - do not generate SMI AML if CPU hotplug SMI feature hasn't been negotiated

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/cpu.h  |  1 +
 include/hw/i386/ich9.h |  2 ++
 hw/acpi/cpu.c          | 80 +++++++++++++++++++++++++++++++++++++++---
 hw/i386/acpi-build.c   | 35 +++++++++++++++++-
 hw/isa/lpc_ich9.c      |  3 ++
 5 files changed, 115 insertions(+), 6 deletions(-)

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 62f0278ba2..0eeedaa491 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -50,6 +50,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
 typedef struct CPUHotplugFeatures {
     bool acpi_1_compatible;
     bool has_legacy_cphp;
+    const char *smi_path;
 } CPUHotplugFeatures;
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index d1bb3f7bf0..0f43ef2481 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -245,6 +245,8 @@ typedef struct ICH9LPCState {
 #define ICH9_SMB_HST_D1                         0x06
 #define ICH9_SMB_HOST_BLOCK_DB                  0x07
 
+#define ICH9_LPC_SMI_NEGOTIATED_FEAT_PROP "x-smi-negotiated-features"
+
 /* bit positions used in fw_cfg SMI feature negotiation */
 #define ICH9_LPC_SMI_F_BROADCAST_BIT            0
 #define ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT          1
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 3d6a500fb7..4864c3b396 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -14,6 +14,8 @@
 #define ACPI_CPU_CMD_DATA_OFFSET_RW 8
 #define ACPI_CPU_CMD_DATA2_OFFSET_R 0
 
+#define OVMF_CPUHP_SMI_CMD 4
+
 enum {
     CPHP_GET_NEXT_CPU_WITH_EVENT_CMD = 0,
     CPHP_OST_EVENT_CMD = 1,
@@ -321,6 +323,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_NOTIFY_METHOD "CTFY"
 #define CPU_EJECT_METHOD  "CEJ0"
 #define CPU_OST_METHOD    "COST"
+#define CPU_ADDED_LIST    "CNEW"
 
 #define CPU_ENABLED       "CPEN"
 #define CPU_SELECTOR      "CSEL"
@@ -471,21 +474,61 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
             Aml *dev_chk = aml_int(1);
             Aml *eject_req = aml_int(3);
             Aml *next_cpu_cmd = aml_int(CPHP_GET_NEXT_CPU_WITH_EVENT_CMD);
+            Aml *num_added_cpus = aml_local(1);
+            Aml *cpu_idx = aml_local(2);
+            Aml *uid = aml_local(3);
+            Aml *new_cpus = aml_name(CPU_ADDED_LIST);
 
             aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
+
+            /* use named package as old Windows don't support it in local var */
+            if (arch_ids->len <= 256) {
+                /*
+                 * For compatibility with Windows Server 2008 (max 256 cpus),
+                 * use ACPI1.0 PackageOp which can cache max 255 elements.
+                 * Which is fine for 256 CPUs VM. Max 255 can be hotplugged,
+                 * sice at least one CPU must be already present.
+                 */
+                aml_append(method, aml_name_decl(CPU_ADDED_LIST,
+                    aml_package(arch_ids->len)));
+            } else {
+                aml_append(method, aml_name_decl(CPU_ADDED_LIST,
+                    aml_varpackage(arch_ids->len)));
+            }
+
+            aml_append(method, aml_store(zero, num_added_cpus));
             aml_append(method, aml_store(one, has_event));
-            while_ctx = aml_while(aml_equal(has_event, one));
+            /* start scan from the 1st CPU */
+            aml_append(method, aml_store(zero, uid));
+            while_ctx = aml_while(aml_land(aml_equal(has_event, one),
+                                  aml_lless(uid, aml_int(arch_ids->len))));
             {
                  /* clear loop exit condition, ins_evt/rm_evt checks
                   * will set it to 1 while next_cpu_cmd returns a CPU
                   * with events */
                  aml_append(while_ctx, aml_store(zero, has_event));
+
+                 aml_append(while_ctx, aml_store(uid, cpu_selector));
                  aml_append(while_ctx, aml_store(next_cpu_cmd, cpu_cmd));
+
+                 /*
+                  * wrap around case, scan is complete, exit loop.
+                  * It happens since events are not cleared in scan loop,
+                  * so next_cpu_cmd continues to find already processed CPUs.
+                  */
+                 ifctx = aml_if(aml_lless(cpu_data, uid));
+                 {
+                     aml_append(ifctx, aml_break());
+                 }
+                 aml_append(while_ctx, ifctx);
+
+                 aml_append(while_ctx, aml_store(cpu_data, uid));
                  ifctx = aml_if(aml_equal(ins_evt, one));
                  {
-                     aml_append(ifctx,
-                         aml_call2(CPU_NOTIFY_METHOD, cpu_data, dev_chk));
-                     aml_append(ifctx, aml_store(one, ins_evt));
+                     /* cache added CPUs to Notify/Wakeup later */
+                     aml_append(ifctx, aml_store(uid,
+                         aml_index(new_cpus, num_added_cpus)));
+                     aml_append(ifctx, aml_increment(num_added_cpus));
                      aml_append(ifctx, aml_store(one, has_event));
                  }
                  aml_append(while_ctx, ifctx);
@@ -493,14 +536,41 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                  ifctx = aml_if(aml_equal(rm_evt, one));
                  {
                      aml_append(ifctx,
-                         aml_call2(CPU_NOTIFY_METHOD, cpu_data, eject_req));
+                         aml_call2(CPU_NOTIFY_METHOD, uid, eject_req));
                      aml_append(ifctx, aml_store(one, rm_evt));
                      aml_append(ifctx, aml_store(one, has_event));
                  }
                  aml_append(else_ctx, ifctx);
                  aml_append(while_ctx, else_ctx);
+                 aml_append(while_ctx, aml_increment(uid));
+            }
+            aml_append(method, while_ctx);
+
+            /*
+             * in case FW negotiated ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT,
+             * make upcall to FW, so it can pull in new CPUs before
+             * OS is notified and wakes them up
+             */
+            if (opts.smi_path) {
+                ifctx = aml_if(aml_lnot(aml_equal(num_added_cpus, zero)));
+                {
+                    aml_append(ifctx, aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
+                        aml_name("%s", opts.smi_path)));
+                }
+                aml_append(method, ifctx);
+            }
+
+            /* Notify OSPM about new CPUs and clear insert events */
+            aml_append(method, aml_store(zero, cpu_idx));
+            while_ctx = aml_while(aml_lless(cpu_idx, num_added_cpus));
+            {
+                aml_append(while_ctx, aml_call2(CPU_NOTIFY_METHOD,
+                    aml_derefof(aml_index(new_cpus, cpu_idx)), dev_chk));
+                aml_append(while_ctx, aml_store(one, ins_evt));
+                aml_append(while_ctx, aml_increment(cpu_idx));
             }
             aml_append(method, while_ctx);
+
             aml_append(method, aml_release(ctrl_lock));
         }
         aml_append(cpus_dev, method);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b7bcbbbb2a..2291c050ba 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -95,6 +95,7 @@ typedef struct AcpiPmInfo {
     bool s3_disabled;
     bool s4_disabled;
     bool pcihp_bridge_en;
+    bool smi_on_cpuhp;
     uint8_t s4_val;
     AcpiFadtData fadt;
     uint16_t cpu_hp_io_base;
@@ -194,6 +195,7 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
     pm->cpu_hp_io_base = 0;
     pm->pcihp_io_base = 0;
     pm->pcihp_io_len = 0;
+    pm->smi_on_cpuhp = false;
 
     assert(obj);
     init_common_fadt_data(machine, obj, &pm->fadt);
@@ -207,12 +209,16 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
             object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
     }
     if (lpc) {
+        uint64_t smi_features = object_property_get_uint(lpc,
+            ICH9_LPC_SMI_NEGOTIATED_FEAT_PROP, NULL);
         struct AcpiGenericAddress r = { .space_id = AML_AS_SYSTEM_IO,
             .bit_width = 8, .address = ICH9_RST_CNT_IOPORT };
         pm->fadt.reset_reg = r;
         pm->fadt.reset_val = 0xf;
         pm->fadt.flags |= 1 << ACPI_FADT_F_RESET_REG_SUP;
         pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
+        pm->smi_on_cpuhp =
+            !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT));
     }
 
     /* The above need not be conditional on machine type because the reset port
@@ -1515,6 +1521,32 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_UID", aml_int(1)));
         aml_append(dev, build_q35_osc_method());
         aml_append(sb_scope, dev);
+
+        if (pm->smi_on_cpuhp) {
+            /* reserve SMI block resources, IO ports 0xB2, 0xB3 */
+            dev = aml_device("PCI0.SMI0");
+            aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A06")));
+            aml_append(dev, aml_name_decl("_UID", aml_string("SMI resources")));
+            crs = aml_resource_template();
+            aml_append(crs,
+                aml_io(
+                       AML_DECODE16,
+                       ACPI_PORT_SMI_CMD,
+                       ACPI_PORT_SMI_CMD,
+                       1,
+                       2)
+            );
+            aml_append(dev, aml_name_decl("_CRS", crs));
+            aml_append(dev, aml_operation_region("SMIR", AML_SYSTEM_IO,
+                aml_int(ACPI_PORT_SMI_CMD), 2));
+            field = aml_field("SMIR", AML_BYTE_ACC, AML_NOLOCK,
+                              AML_WRITE_AS_ZEROS);
+            aml_append(field, aml_named_field("SMIC", 8));
+            aml_append(field, aml_reserved_field(8));
+            aml_append(dev, field);
+            aml_append(sb_scope, dev);
+        }
+
         aml_append(dsdt, sb_scope);
 
         build_hpet_aml(dsdt);
@@ -1530,7 +1562,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_legacy_cpu_hotplug_aml(dsdt, machine, pm->cpu_hp_io_base);
     } else {
         CPUHotplugFeatures opts = {
-            .acpi_1_compatible = true, .has_legacy_cphp = true
+            .acpi_1_compatible = true, .has_legacy_cphp = true,
+            .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
         };
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
                        "\\_SB.PCI0", "\\_GPE._E02");
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 19f32bed3e..8124d20338 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -647,6 +647,9 @@ static void ich9_lpc_initfn(Object *obj)
                                   &acpi_enable_cmd, OBJ_PROP_FLAG_READ);
     object_property_add_uint8_ptr(OBJECT(lpc), ACPI_PM_PROP_ACPI_DISABLE_CMD,
                                   &acpi_disable_cmd, OBJ_PROP_FLAG_READ);
+    object_property_add_uint64_ptr(obj, ICH9_LPC_SMI_NEGOTIATED_FEAT_PROP,
+                                   &lpc->smi_negotiated_features,
+                                   OBJ_PROP_FLAG_READ);
 
     ich9_pm_add_properties(obj, &lpc->pm);
 }
-- 
2.26.2


