Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C753C1F1C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:52:33 +0200 (CEST)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jRA-0005Mc-61
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iuM-0002cw-TD; Fri, 09 Jul 2021 01:18:39 -0400
Received: from ozlabs.org ([203.11.71.1]:56681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iu9-00025L-LX; Fri, 09 Jul 2021 01:18:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf5xLvz9t9b; Fri,  9 Jul 2021 15:17:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=0wVnwfa6ea8GVwzKdrAxx1mR1Zr6PkQYevmrq27QpMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UIjwMosAFUXh66AkgMfLpOUEs2OivXQNhG+0+nd2sfsxgkVi2lSlNIJdh5TvIEeyJ
 qtLIJ3w6VtpCzR4j0LlwpRdlmVadbxnaqtPzfxNBzm/KwPF7lhVFyxHVd0YiEIBZA8
 aLpBprUe7GDLScXM0EWk5QWXWrqhTTv33afoBg+g=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 29/33] ppc/pegasos2: Implement some RTAS functions with VOF
Date: Fri,  9 Jul 2021 15:17:24 +1000
Message-Id: <20210709051728.170203-30-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: aik@ozlabs.ru, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Linux uses RTAS functions to access PCI devices so we need to provide
these with VOF. Implement some of the most important functions to
allow booting Linux with VOF. With this the board is now usable
without a binary ROM image and we can enable it by default as other
boards.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20210708215113.B3F747456E3@zero.eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 default-configs/devices/ppc-softmmu.mak |   2 +-
 hw/ppc/pegasos2.c                       | 137 ++++++++++++++++++++++++
 2 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
index c2d41198cd..4535993d8d 100644
--- a/default-configs/devices/ppc-softmmu.mak
+++ b/default-configs/devices/ppc-softmmu.mak
@@ -14,7 +14,7 @@ CONFIG_SAM460EX=y
 CONFIG_MAC_OLDWORLD=y
 CONFIG_MAC_NEWWORLD=y
 
-CONFIG_PEGASOS2=n
+CONFIG_PEGASOS2=y
 
 # For PReP
 CONFIG_PREP=y
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index cf1dc53c83..9a6ae867e4 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -43,6 +43,7 @@
 #define PROM_SIZE     0x80000
 
 #define KVMPPC_HCALL_BASE    0xf000
+#define KVMPPC_H_RTAS        (KVMPPC_HCALL_BASE + 0x0)
 #define KVMPPC_H_VOF_CLIENT  (KVMPPC_HCALL_BASE + 0x5)
 
 #define H_SUCCESS     0
@@ -195,6 +196,30 @@ static void pegasos2_init(MachineState *machine)
     }
 }
 
+static uint32_t pegasos2_pci_config_read(AddressSpace *as, int bus,
+                                         uint32_t addr, uint32_t len)
+{
+    hwaddr pcicfg = (bus ? 0xf1000c78 : 0xf1000cf8);
+    uint32_t val = 0xffffffff;
+
+    stl_le_phys(as, pcicfg, addr | BIT(31));
+    switch (len) {
+    case 4:
+        val = ldl_le_phys(as, pcicfg + 4);
+        break;
+    case 2:
+        val = lduw_le_phys(as, pcicfg + 4);
+        break;
+    case 1:
+        val = ldub_phys(as, pcicfg + 4);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid length\n", __func__);
+        break;
+    }
+    return val;
+}
+
 static void pegasos2_pci_config_write(AddressSpace *as, int bus, uint32_t addr,
                                       uint32_t len, uint32_t val)
 {
@@ -304,6 +329,87 @@ static void pegasos2_machine_reset(MachineState *machine)
     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
 }
 
+enum pegasos2_rtas_tokens {
+    RTAS_RESTART_RTAS = 0,
+    RTAS_NVRAM_FETCH = 1,
+    RTAS_NVRAM_STORE = 2,
+    RTAS_GET_TIME_OF_DAY = 3,
+    RTAS_SET_TIME_OF_DAY = 4,
+    RTAS_EVENT_SCAN = 6,
+    RTAS_CHECK_EXCEPTION = 7,
+    RTAS_READ_PCI_CONFIG = 8,
+    RTAS_WRITE_PCI_CONFIG = 9,
+    RTAS_DISPLAY_CHARACTER = 10,
+    RTAS_SET_INDICATOR = 11,
+    RTAS_POWER_OFF = 17,
+    RTAS_SUSPEND = 18,
+    RTAS_HIBERNATE = 19,
+    RTAS_SYSTEM_REBOOT = 20,
+};
+
+static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pegasos2MachineState *pm,
+                                  target_ulong args_real)
+{
+    AddressSpace *as = CPU(cpu)->as;
+    uint32_t token = ldl_be_phys(as, args_real);
+    uint32_t nargs = ldl_be_phys(as, args_real + 4);
+    uint32_t nrets = ldl_be_phys(as, args_real + 8);
+    uint32_t args = args_real + 12;
+    uint32_t rets = args_real + 12 + nargs * 4;
+
+    if (nrets < 1) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Too few return values in RTAS call\n");
+        return H_PARAMETER;
+    }
+    switch (token) {
+    case RTAS_READ_PCI_CONFIG:
+    {
+        uint32_t addr, len, val;
+
+        if (nargs != 2 || nrets != 2) {
+            stl_be_phys(as, rets, -1);
+            return H_PARAMETER;
+        }
+        addr = ldl_be_phys(as, args);
+        len = ldl_be_phys(as, args + 4);
+        val = pegasos2_pci_config_read(as, !(addr >> 24),
+                                       addr & 0x0fffffff, len);
+        stl_be_phys(as, rets, 0);
+        stl_be_phys(as, rets + 4, val);
+        return H_SUCCESS;
+    }
+    case RTAS_WRITE_PCI_CONFIG:
+    {
+        uint32_t addr, len, val;
+
+        if (nargs != 3 || nrets != 1) {
+            stl_be_phys(as, rets, -1);
+            return H_PARAMETER;
+        }
+        addr = ldl_be_phys(as, args);
+        len = ldl_be_phys(as, args + 4);
+        val = ldl_be_phys(as, args + 8);
+        pegasos2_pci_config_write(as, !(addr >> 24),
+                                  addr & 0x0fffffff, len, val);
+        stl_be_phys(as, rets, 0);
+        return H_SUCCESS;
+    }
+    case RTAS_DISPLAY_CHARACTER:
+        if (nargs != 1 || nrets != 1) {
+            stl_be_phys(as, rets, -1);
+            return H_PARAMETER;
+        }
+        qemu_log_mask(LOG_UNIMP, "%c", ldl_be_phys(as, args));
+        stl_be_phys(as, rets, 0);
+        return H_SUCCESS;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unknown RTAS token %u (args=%u, rets=%u)\n",
+                      token, nargs, nrets);
+        stl_be_phys(as, rets, 0);
+        return H_SUCCESS;
+    }
+}
+
 static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
 {
     Pegasos2MachineState *pm = PEGASOS2_MACHINE(vhyp);
@@ -315,6 +421,8 @@ static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
     if (msr_pr) {
         qemu_log_mask(LOG_GUEST_ERROR, "Hypercall made with MSR[PR]=1\n");
         env->gpr[3] = H_PRIVILEGE;
+    } else if (env->gpr[3] == KVMPPC_H_RTAS) {
+        env->gpr[3] = pegasos2_rtas(cpu, pm, env->gpr[4]);
     } else if (env->gpr[3] == KVMPPC_H_VOF_CLIENT) {
         int ret = vof_client_call(MACHINE(pm), pm->vof, pm->fdt_blob,
                                   env->gpr[4]);
@@ -687,6 +795,35 @@ static void *build_fdt(MachineState *machine, int *fdt_size)
     qemu_fdt_setprop_string(fdt, "/failsafe", "device_type", "serial");
     qemu_fdt_setprop_string(fdt, "/failsafe", "name", "failsafe");
 
+    qemu_fdt_add_subnode(fdt, "/rtas");
+    qemu_fdt_setprop_cell(fdt, "/rtas", "system-reboot", RTAS_SYSTEM_REBOOT);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "hibernate", RTAS_HIBERNATE);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "suspend", RTAS_SUSPEND);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "power-off", RTAS_POWER_OFF);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "set-indicator", RTAS_SET_INDICATOR);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "display-character",
+                          RTAS_DISPLAY_CHARACTER);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "write-pci-config",
+                          RTAS_WRITE_PCI_CONFIG);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "read-pci-config",
+                          RTAS_READ_PCI_CONFIG);
+    /* Pegasos2 firmware misspells check-exception and guests use that */
+    qemu_fdt_setprop_cell(fdt, "/rtas", "check-execption",
+                          RTAS_CHECK_EXCEPTION);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "event-scan", RTAS_EVENT_SCAN);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "set-time-of-day",
+                          RTAS_SET_TIME_OF_DAY);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "get-time-of-day",
+                          RTAS_GET_TIME_OF_DAY);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-store", RTAS_NVRAM_STORE);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-fetch", RTAS_NVRAM_FETCH);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "restart-rtas", RTAS_RESTART_RTAS);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-error-log-max", 0);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-event-scan-rate", 0);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-display-device", 0);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-size", 20);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "rtas-version", 1);
+
     /* cpus */
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "#cpus", 1);
-- 
2.31.1


