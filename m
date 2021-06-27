Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DA03B5469
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 18:43:17 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxXsK-0000vX-Kp
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 12:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxXoV-0002Ev-Ue; Sun, 27 Jun 2021 12:39:21 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:54243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lxXoM-0007mw-E8; Sun, 27 Jun 2021 12:39:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 01643746396;
 Sun, 27 Jun 2021 18:39:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 57F637457EF; Sun, 27 Jun 2021 18:39:07 +0200 (CEST)
Message-Id: <b4bf314d4edca0dd31f2859543601f815ed56187.1624811233.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1624811233.git.balaton@eik.bme.hu>
References: <cover.1624811233.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/4] ppc/pegasos2: Implement some RTAS functions with VOF
Date: Sun, 27 Jun 2021 18:27:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux uses RTAS functions to access PCI devices so we need to provide
these with VOF. Implement some of the most important functions to
allow booting Linux with VOF. With this the board is now usable
without a binary ROM image and we can enable it by default as other
boards.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 default-configs/devices/ppc-softmmu.mak |   2 +-
 hw/ppc/pegasos2.c                       | 131 ++++++++++++++++++++++++
 2 files changed, 132 insertions(+), 1 deletion(-)

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
index f1741a4512..d482806edd 100644
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
@@ -687,6 +795,29 @@ static void *build_fdt(MachineState *machine, int *fdt_size)
     qemu_fdt_setprop_string(fdt, "/failsafe", "device_type", "serial");
     qemu_fdt_setprop_string(fdt, "/failsafe", "name", "failsafe");
 
+    qemu_fdt_add_subnode(fdt, "/rtas");
+    qemu_fdt_setprop_cell(fdt, "/rtas", "system-reboot", 20);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "hibernate", 19);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "suspend", 18);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "power-off", 17);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "set-indicator", 11);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "display-character", 10);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "write-pci-config", 9);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "read-pci-config", 8);
+    /* Pegasos2 firmware misspells check-exception and guests use that */
+    qemu_fdt_setprop_cell(fdt, "/rtas", "check-execption", 7);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "event-scan", 6);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "set-time-of-day", 4);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "get-time-of-day", 3);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-store", 2);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "nvram-fetch", 1);
+    qemu_fdt_setprop_cell(fdt, "/rtas", "restart-rtas", 0);
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
2.21.4


