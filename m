Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9D44EDD45
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:36:21 +0200 (CEST)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwqS-0005sQ-Td
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:36:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZwfl-0003rW-0e; Thu, 31 Mar 2022 11:25:17 -0400
Received: from [187.72.171.209] (port=51585 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZwfd-0004ne-Kk; Thu, 31 Mar 2022 11:25:15 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 31 Mar 2022 12:24:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 31F18800F41;
 Thu, 31 Mar 2022 11:58:43 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 2/5] ppc/pnv: Activate support for the Processor
 Attention instruction
Date: Thu, 31 Mar 2022 11:58:10 -0300
Message-Id: <20220331145813.21719-3-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
References: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Mar 2022 15:24:02.0687 (UTC)
 FILETIME=[5A2AA8F0:01D84513]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 hw/ppc/pnv_core.c         | 6 ++++++
 include/hw/ppc/pnv_core.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
index 19e8eb885f..eb59b44a6c 100644
--- a/hw/ppc/pnv_core.c
+++ b/hw/ppc/pnv_core.c
@@ -46,6 +46,7 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(pc->chip);
+    PnvCoreClass *pcorec = PNV_CORE_GET_CLASS(pc);
 
     cpu_reset(cs);
 
@@ -57,6 +58,8 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
     env->nip = 0x10;
     env->msr |= MSR_HVB; /* Hypervisor mode */
     env->spr[SPR_HRMOR] = pc->hrmor;
+    env->spr[SPR_HID0] |= pcorec->attn;
+
     hreg_compute_hflags(env);
 
     pcc->intc_reset(pc->chip, cpu);
@@ -300,6 +303,7 @@ static void pnv_core_power8_class_init(ObjectClass *oc, void *data)
     PnvCoreClass *pcc = PNV_CORE_CLASS(oc);
 
     pcc->xscom_ops = &pnv_core_power8_xscom_ops;
+    pcc->attn = HID0_ATTN;
 }
 
 static void pnv_core_power9_class_init(ObjectClass *oc, void *data)
@@ -307,6 +311,7 @@ static void pnv_core_power9_class_init(ObjectClass *oc, void *data)
     PnvCoreClass *pcc = PNV_CORE_CLASS(oc);
 
     pcc->xscom_ops = &pnv_core_power9_xscom_ops;
+    pcc->attn = HID0_POWER9_ATTN;
 }
 
 static void pnv_core_power10_class_init(ObjectClass *oc, void *data)
@@ -315,6 +320,7 @@ static void pnv_core_power10_class_init(ObjectClass *oc, void *data)
 
     /* TODO: Use the P9 XSCOMs for now on P10 */
     pcc->xscom_ops = &pnv_core_power9_xscom_ops;
+    pcc->attn = HID0_POWER9_ATTN;
 }
 
 static void pnv_core_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index c22eab2e1f..04e1fec1f3 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -47,6 +47,7 @@ struct PnvCoreClass {
     DeviceClass parent_class;
 
     const MemoryRegionOps *xscom_ops;
+    uint64_t attn;
 };
 
 #define PNV_CORE_TYPE_SUFFIX "-" TYPE_PNV_CORE
-- 
2.25.1


