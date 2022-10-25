Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD260D1D9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:47:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzR-0006n0-7F; Tue, 25 Oct 2022 12:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyt-0006al-HM
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:51 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMya-0001bS-Bo
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a14so19285849wru.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dHUGzacVw5sdIuMhwKh9xLJWJQ68t/gsEeLTMKidbqg=;
 b=bE12J3Wsj3falnPtKRbFo6XTBswa2KsNcISsWYw8V9IyBx/oquhf+IFPoDwFcA59Bd
 uAVHu1tr4zkD8rao9jZsVYK7bGCnwlwFnBvhP00TAl+MwGi0NGpa9LW09V1uDjaB+npA
 oeVsHS88AdCoHkCuMzyjVr2KQ089wiLHerLB7OpuFmtDnBrsLpfma1lpZEAlDv0vuP5F
 jWw9pVO5s2A+J1W8Lz3e9ghu6dHUgPc5ws0I9N9eSROzpX88QGi3/AQCuW36gZxGMeOo
 uPO7HgTsAi9yrFnkhhlm84eKiY4XoYIrg5QrjXqLB6HFiBECUxgfq4L4wi8iNzpM77JZ
 P7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dHUGzacVw5sdIuMhwKh9xLJWJQ68t/gsEeLTMKidbqg=;
 b=L85hv9YDekQvZXsV+NBROqtzb65M24yjSGy4OPzdqKeWW0wR/t7yCgtzW5r9VIv63/
 +1jrp7Q4QnuPNhVNIw9gQp6/xmAEGMVaEOnoSyyKlZMsYfp8k9dRCtCQLTz7NAcNpO/l
 Rskx0FIHbV0ShxIzj9s0kw6RfRKGQJmXfR2uoOLHa3vC/IbhLp3QZe04K3xWGXQz8AC7
 jMR1FivrUg4zezbF/zzX/nG+9vUUbC3B+GDJFSSeSJDDDKcYbOQQRJ7wJPH6SndgVz/l
 gtB044gKrgBE8vfMD4sq4LUZ/JzaQv0wXWVMELD9ChEm2yXbxmlbvbeFBFXKt/Dsbxin
 RuSg==
X-Gm-Message-State: ACrzQf26bdp6Y3e+UmzdMThLbcoi704S24qHFPYfZR0eElMUPvE/ghrv
 JXrR06Vbx4UR1pw2SctSjw2IFeoCiWtI4Q==
X-Google-Smtp-Source: AMsMyM60PxsBT+jxPjJZOVRPBFFefm/S8GFr0o2hysBLH+ZcTrZICqbo9jQ3nSDdoEgLX0cy0DVnNA==
X-Received: by 2002:a05:6000:170a:b0:22e:bd9c:2630 with SMTP id
 n10-20020a056000170a00b0022ebd9c2630mr26894645wrc.655.1666716019744; 
 Tue, 25 Oct 2022 09:40:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/30] reset: allow registering handlers that aren't called by
 snapshot loading
Date: Tue, 25 Oct 2022 17:39:43 +0100
Message-Id: <20221025163952.4131046-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Snapshot loading only expects to call deterministic handlers, not
non-deterministic ones. So introduce a way of registering handlers that
won't be called when reseting for snapshots.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-id: 20221025004327.568476-2-Jason@zx2c4.com
[PMM: updated json doc comment with Markus' text; fixed
 checkpatch style nit]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qapi/run-state.json        |  6 +++++-
 include/hw/boards.h        |  2 +-
 include/sysemu/reset.h     |  5 ++++-
 hw/arm/aspeed.c            |  4 ++--
 hw/arm/mps2-tz.c           |  4 ++--
 hw/core/reset.c            | 17 ++++++++++++++++-
 hw/hppa/machine.c          |  4 ++--
 hw/i386/microvm.c          |  4 ++--
 hw/i386/pc.c               |  6 +++---
 hw/ppc/pegasos2.c          |  4 ++--
 hw/ppc/pnv.c               |  4 ++--
 hw/ppc/spapr.c             |  4 ++--
 hw/s390x/s390-virtio-ccw.c |  4 ++--
 migration/savevm.c         |  2 +-
 softmmu/runstate.c         | 11 ++++++++---
 15 files changed, 54 insertions(+), 27 deletions(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 49989d30e6b..419c188dd1a 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -86,12 +86,16 @@
 #                   ignores --no-reboot. This is useful for sanitizing
 #                   hypercalls on s390 that are used during kexec/kdump/boot
 #
+# @snapshot-load: A snapshot is being loaded by the record & replay
+#                 subsystem. This value is used only within QEMU.  It
+#                 doesn't occur in QMP. (since 7.2)
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
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 311ed17e18c..90f1dd3aeb7 100644
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
index 0b0d6d7598c..609e4d50c26 100644
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
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bc3ecdb6199..69cadb1c37c 100644
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
index 394192b9b20..284c09c91d3 100644
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
index 36be82c491a..d3263b613e6 100644
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
@@ -60,12 +71,16 @@ void qemu_unregister_reset(QEMUResetHandler *func, void *opaque)
     }
 }
 
-void qemu_devices_reset(void)
+void qemu_devices_reset(ShutdownCause reason)
 {
     QEMUResetEntry *re, *nre;
 
     /* reset all devices */
     QTAILQ_FOREACH_SAFE(re, &reset_handlers, entry, nre) {
+        if (reason == SHUTDOWN_CAUSE_SNAPSHOT_LOAD &&
+            re->skip_on_snapshot_load) {
+            continue;
+        }
         re->func(re->opaque);
     }
 }
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index e53d5f0fa74..19ea7c2c663 100644
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
index 52f9aa9d8cc..ffd18841007 100644
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
index 768982ae9a0..3e86083db31 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1847,12 +1847,12 @@ static void pc_machine_initfn(Object *obj)
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
@@ -1867,7 +1867,7 @@ static void pc_machine_reset(MachineState *machine)
 static void pc_machine_wakeup(MachineState *machine)
 {
     cpu_synchronize_all_states();
-    pc_machine_reset(machine);
+    pc_machine_reset(machine, SHUTDOWN_CAUSE_NONE);
     cpu_synchronize_all_post_reset();
 }
 
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index ecf682b1482..bb4d008ba94 100644
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
index 40bb573d1ac..3d01e26f845 100644
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
index f79ac85ca1f..66b414d2e9b 100644
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
index 03855c72318..8017acb1d51 100644
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
diff --git a/migration/savevm.c b/migration/savevm.c
index 48e85c052c2..a0cdb714f74 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3058,7 +3058,7 @@ bool load_snapshot(const char *name, const char *vmstate,
         goto err_drain;
     }
 
-    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
+    qemu_system_reset(SHUTDOWN_CAUSE_SNAPSHOT_LOAD);
     mis->from_src_file = f;
 
     if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 1e68680b9d7..3dd83d5e5d8 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -441,11 +441,16 @@ void qemu_system_reset(ShutdownCause reason)
     cpu_synchronize_all_states();
 
     if (mc && mc->reset) {
-        mc->reset(current_machine);
+        mc->reset(current_machine, reason);
     } else {
-        qemu_devices_reset();
+        qemu_devices_reset(reason);
     }
-    if (reason && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
+    switch (reason) {
+    case SHUTDOWN_CAUSE_NONE:
+    case SHUTDOWN_CAUSE_SUBSYSTEM_RESET:
+    case SHUTDOWN_CAUSE_SNAPSHOT_LOAD:
+        break;
+    default:
         qapi_event_send_reset(shutdown_caused_by_guest(reason), reason);
     }
     cpu_synchronize_all_post_reset();
-- 
2.25.1


