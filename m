Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4A569377
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:40:45 +0200 (CEST)
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BpE-0001D8-El
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BM4-0000YM-9g; Wed, 06 Jul 2022 16:10:36 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BM0-0003Xh-58; Wed, 06 Jul 2022 16:10:34 -0400
Received: by mail-ua1-x934.google.com with SMTP id j6so4861410uae.5;
 Wed, 06 Jul 2022 13:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEu3jelEKOIzglJfgF5rdDjve00iQyTdqpxsLJ+7yQE=;
 b=Hg5FX6MpuYmwU5/NskAFXXOF+5TA3Pm+ZDfQAZ+rD9V6kTpEHnir0JuBp8J6NktkmX
 tg2rBAjelHCDahQ6dpma9pJbOm2/a8oJRIcv3n/4RsVcBSNa4T+Z2DfSCPgkA9K7VdiL
 amHSTPGx/22sHDRnxsa7tOwlouROMkg2WgrN7fJfA0CWL5gl4MhKoEgHOQgtBCAbdbMC
 VqhgFEOs8YOldMJkxXA+2YNvWajIzFIAyxAuQqJp8Ui4iRYoSsIYs/C4EoVHQO2+iX0E
 T2b24D3rh/Pv3me44Ud2gBXv4uk03w5UYcZiF6pKrbmfHO2k6KmazjqdIYm/rySYiu08
 lafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEu3jelEKOIzglJfgF5rdDjve00iQyTdqpxsLJ+7yQE=;
 b=H5td2hvYCRu1FYo0aa/xFD+KxPfW59dRFxmW3jf0p6BYDHvaF1ddk53/Nsn0LdMv1w
 texq2khevrNJnoGAP4eS9dhWrzslaYyDkv9+RFyU/lV2G8rqdcjyrcT+pjIlIR+DzN8Q
 QHDT8ZVPETOLGH9t1oXDAKv5+wB+GbmioumZuifsFbu/JK/cltkP2yHg4fVzBaLXEvXM
 5EiPI4EgAsq8mXHTTloaNirsxJR9w6sSPGUsqb2qC7xSpXJIxaPbLsI91pHbpfev8EDH
 BJNmvsQjWVOuUBDhN8mF5/4VioCEgbk9oh5nFHxidpe3ABgz9s3EIvbRxJtZpcueHffr
 wgDQ==
X-Gm-Message-State: AJIora/Wd0G7Qbfs76ibBLva3k32mOa4EgLvYiv4IcZuTq7Ywjj2Zse1
 h/FnyEMNZ38fi8zMJ7jL3lstohuYCrg=
X-Google-Smtp-Source: AGRyM1v8jp6Qq9HsRhdv8NScWKpNPgQm/l3JQSJYmb8+tNjZobtcV+x6fXt7LIP1/eaQAZhV6oMxAQ==
X-Received: by 2002:ab0:7341:0:b0:382:30b9:be20 with SMTP id
 k1-20020ab07341000000b0038230b9be20mr14096585uap.95.1657138230552; 
 Wed, 06 Jul 2022 13:10:30 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 20/34] ppc/spapr: Implement H_WATCHDOG
Date: Wed,  6 Jul 2022 17:09:32 -0300
Message-Id: <20220706200946.471114-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Alexey Kardashevskiy <aik@ozlabs.ru>

The new PAPR 2.12 defines a watchdog facility managed via the new
H_WATCHDOG hypercall.

This adds H_WATCHDOG support which a proposed driver for pseries uses:
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=303120

This was tested by running QEMU with a debug kernel and command line:
-append \
 "pseries-wdt.timeout=60 pseries-wdt.nowayout=1 pseries-wdt.action=2"

and running "echo V > /dev/watchdog0" inside the VM.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220622051008.1067464-1-aik@ozlabs.ru>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c               |   4 +
 hw/watchdog/meson.build      |   1 +
 hw/watchdog/spapr_watchdog.c | 274 +++++++++++++++++++++++++++++++++++
 hw/watchdog/trace-events     |   7 +
 include/hw/ppc/spapr.h       |  25 +++-
 5 files changed, 310 insertions(+), 1 deletion(-)
 create mode 100644 hw/watchdog/spapr_watchdog.c

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fd4942e881..9a5382d527 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -898,6 +898,8 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
         add_str(hypertas, "hcall-hpt-resize");
     }
 
+    add_str(hypertas, "hcall-watchdog");
+
     _FDT(fdt_setprop(fdt, rtas, "ibm,hypertas-functions",
                      hypertas->str, hypertas->len));
     g_string_free(hypertas, TRUE);
@@ -3051,6 +3053,8 @@ static void spapr_machine_init(MachineState *machine)
         spapr->vof->fw_size = fw_size; /* for claim() on itself */
         spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_client);
     }
+
+    spapr_watchdog_init(spapr);
 }
 
 #define DEFAULT_KVM_TYPE "auto"
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
index 054c403dea..8974b5cf4c 100644
--- a/hw/watchdog/meson.build
+++ b/hw/watchdog/meson.build
@@ -6,3 +6,4 @@ softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
+specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_watchdog.c'))
diff --git a/hw/watchdog/spapr_watchdog.c b/hw/watchdog/spapr_watchdog.c
new file mode 100644
index 0000000000..55ff1f03c1
--- /dev/null
+++ b/hw/watchdog/spapr_watchdog.c
@@ -0,0 +1,274 @@
+/*
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "target/ppc/cpu.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+#include "hw/ppc/spapr.h"
+
+#define FIELD_BE(reg, field, start, len) \
+    FIELD(reg, field, 64 - (start + len), len)
+
+/*
+ * Bits 47: "leaveOtherWatchdogsRunningOnTimeout", specified on
+ * the "Start watchdog" operation,
+ * 0 - stop out-standing watchdogs on timeout,
+ * 1 - leave outstanding watchdogs running on timeout
+ */
+FIELD_BE(PSERIES_WDTF, LEAVE_OTHER, 47, 1)
+
+/*    Bits 48-55: "operation" */
+FIELD_BE(PSERIES_WDTF, OP, 48, 8)
+#define PSERIES_WDTF_OP_START           0x1
+#define PSERIES_WDTF_OP_STOP            0x2
+#define PSERIES_WDTF_OP_QUERY           0x3
+#define PSERIES_WDTF_OP_QUERY_LPM       0x4
+
+/*    Bits 56-63: "timeoutAction" */
+FIELD_BE(PSERIES_WDTF, ACTION, 56, 8)
+#define PSERIES_WDTF_ACTION_HARD_POWER_OFF  0x1
+#define PSERIES_WDTF_ACTION_HARD_RESTART    0x2
+#define PSERIES_WDTF_ACTION_DUMP_RESTART    0x3
+
+FIELD_BE(PSERIES_WDTF, RESERVED, 0, 47)
+
+/* Special watchdogNumber for the "stop all watchdogs" operation */
+#define PSERIES_WDT_STOP_ALL            ((uint64_t)~0)
+
+/*
+ * For the "Query watchdog capabilities" operation, a uint64 structure
+ * defined as:
+ * Bits 0-15: The minimum supported timeout in milliseconds
+ * Bits 16-31: The number of watchdogs supported
+ * Bits 32-63: Reserved
+ */
+FIELD_BE(PSERIES_WDTQ, MIN_TIMEOUT, 0, 16)
+FIELD_BE(PSERIES_WDTQ, NUM, 16, 16)
+
+/*
+ * For the "Query watchdog LPM requirement" operation:
+ * 1 = The given "watchdogNumber" must be stopped prior to suspending
+ * 2 = The given "watchdogNumber" does not have to be stopped prior to
+ * suspending
+ */
+#define PSERIES_WDTQL_STOPPED               1
+#define PSERIES_WDTQL_QUERY_NOT_STOPPED     2
+
+#define WDT_MIN_TIMEOUT 1 /* 1ms */
+
+static target_ulong watchdog_stop(unsigned watchdogNumber, SpaprWatchdog *w)
+{
+    target_ulong ret = H_NOOP;
+
+    if (timer_pending(&w->timer)) {
+        timer_del(&w->timer);
+        ret = H_SUCCESS;
+    }
+    trace_spapr_watchdog_stop(watchdogNumber, ret);
+
+    return ret;
+}
+
+static target_ulong watchdog_stop_all(SpaprMachineState *spapr)
+{
+    target_ulong ret = H_NOOP;
+    int i;
+
+    for (i = 1; i <= ARRAY_SIZE(spapr->wds); ++i) {
+        target_ulong r = watchdog_stop(i, &spapr->wds[i - 1]);
+
+        if (r != H_NOOP && r != H_SUCCESS) {
+            ret = r;
+        }
+    }
+
+    return ret;
+}
+
+static void watchdog_expired(void *pw)
+{
+    SpaprWatchdog *w = pw;
+    CPUState *cs;
+    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+    unsigned num = w - spapr->wds;
+
+    g_assert(num < ARRAY_SIZE(spapr->wds));
+    trace_spapr_watchdog_expired(num, w->action);
+    switch (w->action) {
+    case PSERIES_WDTF_ACTION_HARD_POWER_OFF:
+        qemu_system_vmstop_request(RUN_STATE_SHUTDOWN);
+        break;
+    case PSERIES_WDTF_ACTION_HARD_RESTART:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        break;
+    case PSERIES_WDTF_ACTION_DUMP_RESTART:
+        CPU_FOREACH(cs) {
+            async_run_on_cpu(cs, spapr_do_system_reset_on_cpu, RUN_ON_CPU_NULL);
+        }
+        break;
+    }
+    if (!w->leave_others) {
+        watchdog_stop_all(spapr);
+    }
+}
+
+static target_ulong h_watchdog(PowerPCCPU *cpu,
+                               SpaprMachineState *spapr,
+                               target_ulong opcode, target_ulong *args)
+{
+    target_ulong ret = H_SUCCESS;
+    target_ulong flags = args[0];
+    target_ulong watchdogNumber = args[1]; /* 1-Based per PAPR */
+    target_ulong timeoutInMs = args[2];
+    unsigned operation = FIELD_EX64(flags, PSERIES_WDTF, OP);
+    unsigned timeoutAction = FIELD_EX64(flags, PSERIES_WDTF, ACTION);
+    SpaprWatchdog *w;
+
+    if (FIELD_EX64(flags, PSERIES_WDTF, RESERVED)) {
+        return H_PARAMETER;
+    }
+
+    switch (operation) {
+    case PSERIES_WDTF_OP_START:
+        if (watchdogNumber > ARRAY_SIZE(spapr->wds)) {
+            return H_P2;
+        }
+        if (timeoutInMs <= WDT_MIN_TIMEOUT) {
+            return H_P3;
+        }
+
+        w = &spapr->wds[watchdogNumber - 1];
+        switch (timeoutAction) {
+        case PSERIES_WDTF_ACTION_HARD_POWER_OFF:
+        case PSERIES_WDTF_ACTION_HARD_RESTART:
+        case PSERIES_WDTF_ACTION_DUMP_RESTART:
+            w->action = timeoutAction;
+            break;
+        default:
+            return H_PARAMETER;
+        }
+        w->leave_others = FIELD_EX64(flags, PSERIES_WDTF, LEAVE_OTHER);
+        timer_mod(&w->timer,
+                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + timeoutInMs);
+        trace_spapr_watchdog_start(flags, watchdogNumber, timeoutInMs);
+        break;
+    case PSERIES_WDTF_OP_STOP:
+        if (watchdogNumber == PSERIES_WDT_STOP_ALL) {
+            ret = watchdog_stop_all(spapr);
+        } else if (watchdogNumber <= ARRAY_SIZE(spapr->wds)) {
+            ret = watchdog_stop(watchdogNumber,
+                                &spapr->wds[watchdogNumber - 1]);
+        } else {
+            return H_P2;
+        }
+        break;
+    case PSERIES_WDTF_OP_QUERY:
+        args[0] = FIELD_DP64(0, PSERIES_WDTQ, MIN_TIMEOUT, WDT_MIN_TIMEOUT);
+        args[0] = FIELD_DP64(args[0], PSERIES_WDTQ, NUM,
+                             ARRAY_SIZE(spapr->wds));
+        trace_spapr_watchdog_query(args[0]);
+        break;
+    case PSERIES_WDTF_OP_QUERY_LPM:
+        if (watchdogNumber > ARRAY_SIZE(spapr->wds)) {
+            return H_P2;
+        }
+        args[0] = PSERIES_WDTQL_QUERY_NOT_STOPPED;
+        trace_spapr_watchdog_query_lpm(args[0]);
+        break;
+    default:
+        return H_PARAMETER;
+    }
+
+    return ret;
+}
+
+void spapr_watchdog_init(SpaprMachineState *spapr)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(spapr->wds); ++i) {
+        char name[16];
+        SpaprWatchdog *w = &spapr->wds[i];
+
+        snprintf(name, sizeof(name) - 1, "wdt%d", i + 1);
+        object_initialize_child_with_props(OBJECT(spapr), name, w,
+                                           sizeof(SpaprWatchdog),
+                                           TYPE_SPAPR_WDT,
+                                           &error_fatal, NULL);
+        qdev_realize(DEVICE(w), NULL, &error_fatal);
+    }
+}
+
+static bool watchdog_needed(void *opaque)
+{
+    SpaprWatchdog *w = opaque;
+
+    return timer_pending(&w->timer);
+}
+
+static const VMStateDescription vmstate_wdt = {
+    .name = "spapr_watchdog",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = watchdog_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER(timer, SpaprWatchdog),
+        VMSTATE_UINT8(action, SpaprWatchdog),
+        VMSTATE_UINT8(leave_others, SpaprWatchdog),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void spapr_wdt_realize(DeviceState *dev, Error **errp)
+{
+    SpaprWatchdog *w = SPAPR_WDT(dev);
+    Object *o = OBJECT(dev);
+
+    timer_init_ms(&w->timer, QEMU_CLOCK_VIRTUAL, watchdog_expired, w);
+
+    object_property_add_uint64_ptr(o, "expire",
+                                   (uint64_t *)&w->timer.expire_time,
+                                   OBJ_PROP_FLAG_READ);
+    object_property_add_uint8_ptr(o, "action", &w->action, OBJ_PROP_FLAG_READ);
+    object_property_add_uint8_ptr(o, "leaveOtherWatchdogsRunningOnTimeout",
+                                  &w->leave_others, OBJ_PROP_FLAG_READ);
+}
+
+static void spapr_wdt_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = spapr_wdt_realize;
+    dc->vmsd = &vmstate_wdt;
+    dc->user_creatable = false;
+}
+
+static const TypeInfo spapr_wdt_info = {
+    .name          = TYPE_SPAPR_WDT,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(SpaprWatchdog),
+    .class_init    = spapr_wdt_class_init,
+};
+
+static void spapr_watchdog_register_types(void)
+{
+    spapr_register_hypercall(H_WATCHDOG, h_watchdog);
+    type_register_static(&spapr_wdt_info);
+}
+
+type_init(spapr_watchdog_register_types)
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index e7523e22aa..89ccbcfdfd 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -9,3 +9,10 @@ cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %" PRIu32
 # wdt-aspeed.c
 aspeed_wdt_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
 aspeed_wdt_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
+
+# spapr_watchdog.c
+spapr_watchdog_start(uint64_t flags, uint64_t num, uint64_t timeout) "Flags 0x%" PRIx64 " num=%" PRId64 " %" PRIu64 "ms"
+spapr_watchdog_stop(uint64_t num, uint64_t ret) "num=%" PRIu64 " ret=%" PRId64
+spapr_watchdog_query(uint64_t caps) "caps=0x%" PRIx64
+spapr_watchdog_query_lpm(uint64_t caps) "caps=0x%" PRIx64
+spapr_watchdog_expired(uint64_t num, unsigned action) "num=%" PRIu64 " action=%u"
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 4ba2b27b8c..530d739b1d 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -164,6 +164,21 @@ struct SpaprMachineClass {
     SpaprIrq *irq;
 };
 
+#define WDT_MAX_WATCHDOGS       4      /* Maximum number of watchdog devices */
+
+#define TYPE_SPAPR_WDT "spapr-wdt"
+OBJECT_DECLARE_SIMPLE_TYPE(SpaprWatchdog, SPAPR_WDT)
+
+typedef struct SpaprWatchdog {
+    /*< private >*/
+    DeviceState parent_obj;
+    /*< public >*/
+
+    QEMUTimer timer;
+    uint8_t action;         /* One of PSERIES_WDTF_ACTION_xxx */
+    uint8_t leave_others;   /* leaveOtherWatchdogsRunningOnTimeout */
+} SpaprWatchdog;
+
 /**
  * SpaprMachineState:
  */
@@ -264,6 +279,8 @@ struct SpaprMachineState {
     uint32_t FORM2_assoc_array[NUMA_NODES_MAX_NUM][FORM2_NUMA_ASSOC_SIZE];
 
     Error *fwnmi_migration_blocker;
+
+    SpaprWatchdog wds[WDT_MAX_WATCHDOGS];
 };
 
 #define H_SUCCESS         0
@@ -344,6 +361,7 @@ struct SpaprMachineState {
 #define H_P7              -60
 #define H_P8              -61
 #define H_P9              -62
+#define H_NOOP            -63
 #define H_UNSUPPORTED     -67
 #define H_OVERLAP         -68
 #define H_UNSUPPORTED_FLAG -256
@@ -564,8 +582,9 @@ struct SpaprMachineState {
 #define H_SCM_HEALTH            0x400
 #define H_RPT_INVALIDATE        0x448
 #define H_SCM_FLUSH             0x44C
+#define H_WATCHDOG              0x45C
 
-#define MAX_HCALL_OPCODE        H_SCM_FLUSH
+#define MAX_HCALL_OPCODE        H_WATCHDOG
 
 /* The hcalls above are standardized in PAPR and implemented by pHyp
  * as well.
@@ -1028,6 +1047,7 @@ extern const VMStateDescription vmstate_spapr_cap_large_decr;
 extern const VMStateDescription vmstate_spapr_cap_ccf_assist;
 extern const VMStateDescription vmstate_spapr_cap_fwnmi;
 extern const VMStateDescription vmstate_spapr_cap_rpt_invalidate;
+extern const VMStateDescription vmstate_spapr_wdt;
 
 static inline uint8_t spapr_get_cap(SpaprMachineState *spapr, int cap)
 {
@@ -1064,4 +1084,7 @@ target_ulong spapr_vof_client_architecture_support(MachineState *ms,
                                                    target_ulong ovec_addr);
 void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
 
+/* H_WATCHDOG */
+void spapr_watchdog_init(SpaprMachineState *spapr);
+
 #endif /* HW_SPAPR_H */
-- 
2.36.1


