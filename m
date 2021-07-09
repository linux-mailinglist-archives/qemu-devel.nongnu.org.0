Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E63C2505
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:32:30 +0200 (CEST)
Received: from localhost ([::1]:45724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qcH-0002A0-Pc
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1qZK-0007IN-KX; Fri, 09 Jul 2021 09:29:26 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1qZH-0002A1-UG; Fri, 09 Jul 2021 09:29:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 858847462DB;
 Fri,  9 Jul 2021 15:29:20 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6544E7457EF; Fri,  9 Jul 2021 15:29:20 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] ppc/pegasos2: Allow setprop in VOF
Date: Fri, 09 Jul 2021 15:19:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Message-Id: <20210709132920.6544E7457EF@zero.eik.bme.hu>
X-Spam-Probability: 8%
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

Linux needs setprop to fix up the device tree, otherwise it's not
finding devices and cannot boot. Since recent VOF change now we need
to add a callback to allow this which is what this patch does.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/pegasos2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 5c4e2ae8bf..f25816082c 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -443,10 +443,17 @@ static target_ulong vhyp_encode_hpt_for_kvm_pr(PPCVirtualHypervisor *vhyp)
     return POWERPC_CPU(current_cpu)->env.spr[SPR_SDR1];
 }
 
+static bool pegasos2_setprop(MachineState *ms, const char *path,
+                             const char *propname, void *val, int vallen)
+{
+    return true;
+}
+
 static void pegasos2_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     PPCVirtualHypervisorClass *vhc = PPC_VIRTUAL_HYPERVISOR_CLASS(oc);
+    VofMachineIfClass *vmc = VOF_MACHINE_CLASS(oc);
 
     mc->desc = "Genesi/bPlan Pegasos II";
     mc->init = pegasos2_init;
@@ -462,6 +469,8 @@ static void pegasos2_machine_class_init(ObjectClass *oc, void *data)
     vhc->cpu_exec_enter = vhyp_nop;
     vhc->cpu_exec_exit = vhyp_nop;
     vhc->encode_hpt_for_kvm_pr = vhyp_encode_hpt_for_kvm_pr;
+
+    vmc->setprop = pegasos2_setprop;
 }
 
 static const TypeInfo pegasos2_machine_info = {
@@ -471,6 +480,7 @@ static const TypeInfo pegasos2_machine_info = {
     .instance_size = sizeof(Pegasos2MachineState),
     .interfaces = (InterfaceInfo[]) {
         { TYPE_PPC_VIRTUAL_HYPERVISOR },
+        { TYPE_VOF_MACHINE_IF },
         { }
     },
 };
-- 
2.21.4


