Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917795765BA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:23:59 +0200 (CEST)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCP2k-00063g-PY
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oCOwI-00016z-W5
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:17:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oCOwG-0005eE-Nl
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:17:18 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FGQOcM024328;
 Fri, 15 Jul 2022 17:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=hq5mJURNPywV3PpDv35HVSjIBFNdwdX9ZcaGHJwDSZE=;
 b=w29QE6LCAQW0RlP6lfIP00Hch6xfD4sQR8BQgJGzJpcGTqlNJtSjUx6yHwnkEU23eGLQ
 ZM3FZOIzHlx6Ri10YDcQHyVfa225Am9s4sFmTTskdzKDWx2YlcyVUVATFA9w3aNclPUo
 Z9YOtKgOPgfc05W01P25Y1gCYzdn5gCWTnUi08SY4GCca/K2yXNbr38ZcGMdVAVIKcA/
 D16BblpDoKXdpc2deEA/Wlm95QKRIECYeGPdSVJbuZEKCAU97aa4AEntTk+/O3CEPcPl
 iE/dyXAz5zO/IXnJI2RDXjEgeqbcxt3amQGjigifOFsmHw4f40iM12Hhj7gSnyjaZc+W Nw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h727ss41e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 17:17:06 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26FHBhnH039686; Fri, 15 Jul 2022 17:17:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h7047u02y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 17:17:05 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 26FHGjM5013789;
 Fri, 15 Jul 2022 17:17:05 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-181-254.vpn.oracle.com
 [10.175.181.254])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h7047tyn7-6; Fri, 15 Jul 2022 17:17:05 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v8 05/11] i386/pc: factor out cxl range end to helper
Date: Fri, 15 Jul 2022 18:16:22 +0100
Message-Id: <20220715171628.21437-6-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220715171628.21437-1-joao.m.martins@oracle.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
X-Proofpoint-ORIG-GUID: BFIqLF93EtBLFlP4pJnGauA_jwHZJLfk
X-Proofpoint-GUID: BFIqLF93EtBLFlP4pJnGauA_jwHZJLfk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Move calculation of CXL memory region end to separate helper.

This is in preparation to a future change that removes CXL range
dependency on the CXL memory region, with the goal of allowing
pc_pci_hole64_start() to be called before any memory region are
initialized.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 216e38da938e..1f42f194d7b7 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,6 +825,25 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
     return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 }
 
+static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
+{
+    uint64_t start = 0;
+
+    if (pcms->cxl_devices_state.host_mr.addr) {
+        start = pcms->cxl_devices_state.host_mr.addr +
+            memory_region_size(&pcms->cxl_devices_state.host_mr);
+        if (pcms->cxl_devices_state.fixed_windows) {
+            GList *it;
+            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
+                CXLFixedWindow *fw = it->data;
+                start = fw->mr.addr + memory_region_size(&fw->mr);
+            }
+        }
+    }
+
+    return start;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -1022,16 +1041,8 @@ uint64_t pc_pci_hole64_start(void)
     MachineState *ms = MACHINE(pcms);
     uint64_t hole64_start = 0;
 
-    if (pcms->cxl_devices_state.host_mr.addr) {
-        hole64_start = pcms->cxl_devices_state.host_mr.addr +
-            memory_region_size(&pcms->cxl_devices_state.host_mr);
-        if (pcms->cxl_devices_state.fixed_windows) {
-            GList *it;
-            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
-                CXLFixedWindow *fw = it->data;
-                hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
-            }
-        }
+    if (pcms->cxl_devices_state.is_enabled) {
+        hole64_start = pc_get_cxl_range_end(pcms);
     } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
         hole64_start = ms->device_memory->base;
         if (!pcmc->broken_reserved_end) {
-- 
2.17.2


