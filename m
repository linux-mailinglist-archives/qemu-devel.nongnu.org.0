Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F45FBC8B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 22:57:59 +0200 (CEST)
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiMK7-0002Qx-1M
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 16:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9u-0004lb-Ao
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:47:26 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:58104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=aME8=2M=zx2c4.com=Jason@kernel.org>)
 id 1oiM9s-0001S1-3q
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 16:47:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 460A9612D1;
 Tue, 11 Oct 2022 20:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423B7C433C1;
 Tue, 11 Oct 2022 20:47:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="XsZfjS1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665521241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzOW5TORUEbI3IpylSGG8LeABwZDx04m25u7oHXpcTg=;
 b=XsZfjS1Yu6npX1mIK41hNxfc6WZyYHJypXEhGmCYMxUAPxqlRH//P33HMuqzh2dVuKAy44
 k3SXYiLPlzWLMb59J19M/HuNC4Y+UTLn0QpZqAluAShjsaKDqybS5VASIXAlf6fa1bRjBx
 1609unIYCcSqYj7j3cy0Hh3csk4P6E4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0115cae2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 11 Oct 2022 20:47:21 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2 7/8] reset: allow registering handlers that aren't called
 by snapshot loading
Date: Tue, 11 Oct 2022 14:46:44 -0600
Message-Id: <20221011204645.1160916-8-Jason@zx2c4.com>
In-Reply-To: <20221011204645.1160916-1-Jason@zx2c4.com>
References: <20221011204645.1160916-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=aME8=2M=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Snapshot loading only expects to call deterministic handlers, not
non-deterministic ones. So introduce a way of registering handlers that
won't be called when reseting for snapshots.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/arm/aspeed.c            |  4 ++--
 hw/arm/mps2-tz.c           |  4 ++--
 hw/core/reset.c            | 15 ++++++++++++++-
 hw/hppa/machine.c          |  4 ++--
 hw/i386/microvm.c          |  4 ++--
 hw/i386/pc.c               |  6 +++---
 hw/ppc/pegasos2.c          |  4 ++--
 hw/ppc/pnv.c               |  4 ++--
 hw/ppc/spapr.c             |  4 ++--
 hw/s390x/s390-virtio-ccw.c |  4 ++--
 include/hw/boards.h        |  2 +-
 include/sysemu/reset.h     |  5 ++++-
 migration/savevm.c         |  2 +-
 qapi/run-state.json        |  4 +++-
 softmmu/runstate.c         |  4 ++--
 15 files changed, 44 insertions(+), 26 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bc3ecdb619..69cadb1c37 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1349,12 +1349,12 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 }
 
-static void fby35_reset(MachineState *state)
+static void fby35_reset(MachineState *state, ShutdownCause reason)
 {
     AspeedMachineState *bmc = ASPEED_MACHINE(state);
     AspeedGPIOState *gpio = &bmc->soc.gpio;
 
-    qemu_devices_reset();
+    qemu_devices_reset(reason);
 
     /* Board ID: 7 (Class-1, 4 slots) */
     object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 394192b9b2..284c09c91d 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1239,7 +1239,7 @@ static void mps2_set_remap(Object *obj, const char *value, Error **errp)
     }
 }
 
-static void mps2_machine_reset(MachineState *machine)
+static void mps2_machine_reset(MachineState *machine, ShutdownCause reason)
 {
     MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
 
@@ -1249,7 +1249,7 @@ static void mps2_machine_reset(MachineState *machine)
      * reset see the correct mapping.
      */
     remap_memory(mms, mms->remap);
-    qemu_devices_reset();
+    qemu_devices_reset(reason);
 }
 
 static void mps2tz_class_init(ObjectClass *oc, void *data)
diff --git a/hw/core/reset.c b/hw/core/reset.c
index 36be82c491..bcf323d6dd 100644
--- a/hw/core/reset.c
+++ b/hw/core/reset.c
@@ -33,6 +33,7 @@ typedef struct QEMUResetEntry {
     QTAILQ_ENTRY(QEMUResetEntry) entry;
     QEMUResetHandler *func;
     void *opaque;
+    bool skip_on_snapshot_load;
 } QEMUResetEntry;
 
 static QTAILQ_HEAD(, QEMUResetEntry) reset_handlers =
@@ -47,6 +48,16 @@ void qemu_register_reset(QEMUResetHandler *func, void *opaque)
     QTAILQ_INSERT_TAIL(&reset_handlers, re, entry);
 }
 
+void qemu_register_reset_nosnapshotload(QEMUResetHandler *func, void *opaque)
+{
+    QEMUResetEntry *re = g_new0(QEMUResetEntry, 1);
+
+    re->func = func;
+    re->opaque = opaque;
+    re->skip_on_snapshot_load = true;
+    QTAILQ_INSERT_TAIL(&reset_handlers, re, entry);
+}
+
 void qemu_unregister_reset(QEMUResetHandler *func, void *opaque)
 {
     QEMUResetEntry *re;
@@ -60,12 +71,14 @@ void qemu_unregister_reset(QEMUResetHandler *func, void *opaque)
     }
 }
 
-void qemu_devices_reset(void)
+void qemu_devices_reset(ShutdownCause reason)
 {
     QEMUResetEntry *re, *nre;
 
     /* reset all devices */
     QTAILQ_FOREACH_SAFE(re, &reset_handlers, entry, nre) {
+        if (reason == SHUTDOWN_CAUSE_SNAPSHOT_LOAD && re->skip_on_snapshot_load)
+            continue;
         re->func(re->opaque);
     }
 }
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index e53d5f0fa7..19ea7c2c66 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -411,12 +411,12 @@ static void machine_hppa_init(MachineState *machine)
     cpu[0]->env.gr[19] = FW_CFG_IO_BASE;
 }
 
-static void hppa_machine_reset(MachineState *ms)
+static void hppa_machine_reset(MachineState *ms, ShutdownCause reason)
 {
     unsigned int smp_cpus = ms->smp.cpus;
     int i;
 
-    qemu_devices_reset();
+    qemu_devices_reset(reason);
 
     /* Start all CPUs at the firmware entry point.
      *  Monarch CPU will initialize firmware, secondary CPUs
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 7fe8cce03e..860cfa00f5 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -467,7 +467,7 @@ static void microvm_machine_state_init(MachineState *machine)
     microvm_devices_init(mms);
 }
 
-static void microvm_machine_reset(MachineState *machine)
+static void microvm_machine_reset(MachineState *machine, ShutdownCause reason)
 {
     MicrovmMachineState *mms = MICROVM_MACHINE(machine);
     CPUState *cs;
@@ -480,7 +480,7 @@ static void microvm_machine_reset(MachineState *machine)
         mms->kernel_cmdline_fixed = true;
     }
 
-    qemu_devices_reset();
+    qemu_devices_reset(reason);
 
     CPU_FOREACH(cs) {
         cpu = X86_CPU(cs);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 566accf7e6..66a0245a65 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1846,12 +1846,12 @@ static void pc_machine_initfn(Object *obj)
     cxl_machine_init(obj, &pcms->cxl_devices_state);
 }
 
-static void pc_machine_reset(MachineState *machine)
+static void pc_machine_reset(MachineState *machine, ShutdownCause reason)
 {
     CPUState *cs;
     X86CPU *cpu;
 
-    qemu_devices_reset();
+    qemu_devices_reset(reason);
 
     /* Reset APIC after devices have been reset to cancel
      * any changes that qemu_devices_reset() might have done.
@@ -1868,7 +1868,7 @@ static void pc_machine_reset(MachineState *machine)
 static void pc_machine_wakeup(MachineState *machine)
 {
     cpu_synchronize_all_states();
-    pc_machine_reset(machine);
+    pc_machine_reset(machine, SHUTDOWN_CAUSE_NONE);
     cpu_synchronize_all_post_reset();
 }
 
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..919d5008ea 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -248,14 +248,14 @@ static void pegasos2_pci_config_write(Pegasos2MachineState *pm, int bus,
     pegasos2_mv_reg_write(pm, pcicfg + 4, len, val);
 }
 
-static void pegasos2_machine_reset(MachineState *machine)
+static void pegasos2_machine_reset(MachineState *machine, ShutdownCause reason)
 {
     Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
     void *fdt;
     uint64_t d[2];
     int sz;
 
-    qemu_devices_reset();
+    qemu_devices_reset(reason);
     if (!pm->vof) {
         return; /* Firmware should set up machine so nothing to do */
     }
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 78e00afb9b..358a64b397 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -643,13 +643,13 @@ static void pnv_powerdown_notify(Notifier *n, void *opaque)
     }
 }
 
-static void pnv_reset(MachineState *machine)
+static void pnv_reset(MachineState *machine, ShutdownCause reason)
 {
     PnvMachineState *pnv = PNV_MACHINE(machine);
     IPMIBmc *bmc;
     void *fdt;
 
-    qemu_devices_reset();
+    qemu_devices_reset(reason);
 
     /*
      * The machine should provide by default an internal BMC simulator.
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8bbaf4f8a4..6377e4cdb5 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1623,7 +1623,7 @@ void spapr_check_mmu_mode(bool guest_radix)
     }
 }
 
-static void spapr_machine_reset(MachineState *machine)
+static void spapr_machine_reset(MachineState *machine, ShutdownCause reason)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
     PowerPCCPU *first_ppc_cpu;
@@ -1649,7 +1649,7 @@ static void spapr_machine_reset(MachineState *machine)
         spapr_setup_hpt(spapr);
     }
 
-    qemu_devices_reset();
+    qemu_devices_reset(reason);
 
     spapr_ovec_cleanup(spapr->ov5_cas);
     spapr->ov5_cas = spapr_ovec_new();
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 03855c7231..8017acb1d5 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -405,7 +405,7 @@ static void s390_pv_prepare_reset(S390CcwMachineState *ms)
     s390_pv_prep_reset();
 }
 
-static void s390_machine_reset(MachineState *machine)
+static void s390_machine_reset(MachineState *machine, ShutdownCause reason)
 {
     S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
     enum s390_reset reset_type;
@@ -427,7 +427,7 @@ static void s390_machine_reset(MachineState *machine)
             s390_machine_unprotect(ms);
         }
 
-        qemu_devices_reset();
+        qemu_devices_reset(reason);
         s390_crypto_reset();
 
         /* configure and start the ipl CPU only */
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 311ed17e18..90f1dd3aeb 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -231,7 +231,7 @@ struct MachineClass {
     const char *deprecation_reason;
 
     void (*init)(MachineState *state);
-    void (*reset)(MachineState *state);
+    void (*reset)(MachineState *state, ShutdownCause reason);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
 
diff --git a/include/sysemu/reset.h b/include/sysemu/reset.h
index 0b0d6d7598..609e4d50c2 100644
--- a/include/sysemu/reset.h
+++ b/include/sysemu/reset.h
@@ -1,10 +1,13 @@
 #ifndef QEMU_SYSEMU_RESET_H
 #define QEMU_SYSEMU_RESET_H
 
+#include "qapi/qapi-events-run-state.h"
+
 typedef void QEMUResetHandler(void *opaque);
 
 void qemu_register_reset(QEMUResetHandler *func, void *opaque);
+void qemu_register_reset_nosnapshotload(QEMUResetHandler *func, void *opaque);
 void qemu_unregister_reset(QEMUResetHandler *func, void *opaque);
-void qemu_devices_reset(void);
+void qemu_devices_reset(ShutdownCause reason);
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index 48e85c052c..a0cdb714f7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3058,7 +3058,7 @@ bool load_snapshot(const char *name, const char *vmstate,
         goto err_drain;
     }
 
-    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
+    qemu_system_reset(SHUTDOWN_CAUSE_SNAPSHOT_LOAD);
     mis->from_src_file = f;
 
     if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
diff --git a/qapi/run-state.json b/qapi/run-state.json
index 9273ea6516..74ed0ac93c 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -86,12 +86,14 @@
 #                   ignores --no-reboot. This is useful for sanitizing
 #                   hypercalls on s390 that are used during kexec/kdump/boot
 #
+# @snapshot-load: A snapshot is being loaded by the record & replay subsystem.
+#
 ##
 { 'enum': 'ShutdownCause',
   # Beware, shutdown_caused_by_guest() depends on enumeration order
   'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
             'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
-            'guest-panic', 'subsystem-reset'] }
+            'guest-panic', 'subsystem-reset', 'snapshot-load'] }
 
 ##
 # @StatusInfo:
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 1e68680b9d..03e1ee3a8a 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -441,9 +441,9 @@ void qemu_system_reset(ShutdownCause reason)
     cpu_synchronize_all_states();
 
     if (mc && mc->reset) {
-        mc->reset(current_machine);
+        mc->reset(current_machine, reason);
     } else {
-        qemu_devices_reset();
+        qemu_devices_reset(reason);
     }
     if (reason && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
         qapi_event_send_reset(shutdown_caused_by_guest(reason), reason);
-- 
2.37.3


