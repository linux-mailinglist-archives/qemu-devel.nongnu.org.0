Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8A239D00B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 18:41:22 +0200 (CEST)
Received: from localhost ([::1]:41756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpvpx-0005d7-H3
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 12:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpvlZ-00072j-V8; Sun, 06 Jun 2021 12:36:49 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:56224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lpvlV-0004Ri-Ry; Sun, 06 Jun 2021 12:36:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F0EF9746FDE;
 Sun,  6 Jun 2021 18:36:40 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B45B8746FCF; Sun,  6 Jun 2021 18:36:40 +0200 (CEST)
Message-Id: <f35a87c4d26ed93c3870d3c068edf35ae62037d2.1622994395.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1622994395.git.balaton@eik.bme.hu>
References: <cover.1622994395.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [RFC PATCH 5/5] ppc/pegasos2: Implement some RTAS functions with VOF
Date: Sun, 06 Jun 2021 17:46:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 10%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/ppc/pegasos2.c                       | 108 ++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 1 deletion(-)

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
index 91e5fa8fbe..cb2be27394 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -43,6 +43,7 @@
 #define PROM_SIZE     0x80000
 
 #define KVMPPC_HCALL_BASE    0xf000
+#define KVMPPC_H_RTAS        (KVMPPC_HCALL_BASE + 0x0)
 #define KVMPPC_H_VOF_CLIENT  (KVMPPC_HCALL_BASE + 0x5)
 
 /* Copied from SLOF, and 4K is definitely not enough for GRUB */
@@ -198,6 +199,30 @@ static void pegasos2_init(MachineState *machine)
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
@@ -307,6 +332,87 @@ static void pegasos2_machine_reset(MachineState *machine)
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
@@ -318,6 +424,8 @@ static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
     if (msr_pr) {
         qemu_log_mask(LOG_GUEST_ERROR, "Hypercall made with MSR[PR]=1\n");
         env->gpr[3] = H_PRIVILEGE;
+    } else if (env->gpr[3] == KVMPPC_H_RTAS) {
+        env->gpr[3] = pegasos2_rtas(cpu, pm, env->gpr[4]);
     } else if (env->gpr[3] == KVMPPC_H_VOF_CLIENT) {
         int ret = vof_client_call(MACHINE(pm), pm->vof, pm->fdt_blob,
                                   env->gpr[4]);
-- 
2.21.4


