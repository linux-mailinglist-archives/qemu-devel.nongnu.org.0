Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541C62D9286
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:17:28 +0100 (CET)
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogEh-0005iI-Bx
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwy-0005wC-6h; Sun, 13 Dec 2020 23:59:08 -0500
Received: from ozlabs.org ([203.11.71.1]:49183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwt-0004tn-LY; Sun, 13 Dec 2020 23:59:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfv2Kttz9sWt; Mon, 14 Dec 2020 15:58:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921895;
 bh=pcjBBUPDwioP0908GC4CNJoGjgvaGxW2KTfiNcpWvwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RiZG0uHSkKxsBQLEChz7pD4d111c3g/DIug/WQoPaV9XG5g4bGVFaHU1Aa7wZxP3v
 g/c3bH0dU4FIflC+0aGifV61V9126XxRzCKze4cY9r25L0kvBGssxwhIyzuFVebCgr
 ADI9j/MHPMg3BmjH77sDqi2Ayc2hOSdNTNP7qHI8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 27/30] spapr: Pass sPAPR machine state down to
 spapr_pci_switch_vga()
Date: Mon, 14 Dec 2020 15:58:04 +1100
Message-Id: <20201214045807.41003-28-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

This allows to drop a user of qdev_get_machine().

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201209170052.1431440-4-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c   | 7 ++++---
 hw/ppc/spapr_pci.c     | 3 +--
 include/hw/ppc/spapr.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 1d8e8e6a88..c0ea0bd579 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1351,6 +1351,7 @@ static target_ulong h_logical_dcbf(PowerPCCPU *cpu, SpaprMachineState *spapr,
 }
 
 static target_ulong h_set_mode_resource_le(PowerPCCPU *cpu,
+                                           SpaprMachineState *spapr,
                                            target_ulong mflags,
                                            target_ulong value1,
                                            target_ulong value2)
@@ -1365,12 +1366,12 @@ static target_ulong h_set_mode_resource_le(PowerPCCPU *cpu,
     switch (mflags) {
     case H_SET_MODE_ENDIAN_BIG:
         spapr_set_all_lpcrs(0, LPCR_ILE);
-        spapr_pci_switch_vga(true);
+        spapr_pci_switch_vga(spapr, true);
         return H_SUCCESS;
 
     case H_SET_MODE_ENDIAN_LITTLE:
         spapr_set_all_lpcrs(LPCR_ILE, LPCR_ILE);
-        spapr_pci_switch_vga(false);
+        spapr_pci_switch_vga(spapr, false);
         return H_SUCCESS;
     }
 
@@ -1411,7 +1412,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, SpaprMachineState *spapr,
 
     switch (resource) {
     case H_SET_MODE_RESOURCE_LE:
-        ret = h_set_mode_resource_le(cpu, args[0], args[2], args[3]);
+        ret = h_set_mode_resource_le(cpu, spapr, args[0], args[2], args[3]);
         break;
     case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
         ret = h_set_mode_resource_addr_trans_mode(cpu, args[0],
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index e946bd5055..cff76479c7 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2493,9 +2493,8 @@ static int spapr_switch_one_vga(DeviceState *dev, void *opaque)
     return 0;
 }
 
-void spapr_pci_switch_vga(bool big_endian)
+void spapr_pci_switch_vga(SpaprMachineState *spapr, bool big_endian)
 {
-    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
     SpaprPhbState *sphb;
 
     /*
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index b7ced9faeb..e0f10f252c 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -834,7 +834,7 @@ int spapr_dma_dt(void *fdt, int node_off, const char *propname,
                  uint32_t liobn, uint64_t window, uint32_t size);
 int spapr_tcet_dma_dt(void *fdt, int node_off, const char *propname,
                       SpaprTceTable *tcet);
-void spapr_pci_switch_vga(bool big_endian);
+void spapr_pci_switch_vga(SpaprMachineState *spapr, bool big_endian);
 void spapr_hotplug_req_add_by_index(SpaprDrc *drc);
 void spapr_hotplug_req_remove_by_index(SpaprDrc *drc);
 void spapr_hotplug_req_add_by_count(SpaprDrcType drc_type,
-- 
2.29.2


