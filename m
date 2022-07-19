Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065157A4A2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:09:47 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqjB-0008TF-US
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqb0-0005Cm-43
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:18 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqax-0002fE-9t
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:17 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JF4wj7030726;
 Tue, 19 Jul 2022 17:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=ixN0oPpoS+BsioWh9j1I9yIvREwF2/BAEzfPmo0kQ74=;
 b=2lrBiVG7vr6akADrfRsCzxLkRh6MGO9LlZjqQHnXZpzGkTEe69Awf1jGw1jE+DihFFya
 hBv5fXaTcTNKMpt1tczDBh6xMOmepTpfY7JXfrd/Tl52Ml63gyMphEsZTzej9HuHKBM1
 zQQYjCm5E8zXkhJPqLdEoxJdSVu22eQn/5Ls+f4QLADPiUh9JmmUBIG8lhpZHM9kk85V
 ZGogpL90mNx3CVkaBwbi3sY73Ti49to+RRMssagVd3PBe5masryGjHAWwPcIzx4Nwqph
 8CNtEUdVTGiqdB60ZaB0uRe3aRk87SJHj8OOfcHbL77fNzBO1wUUfWxyePS/1tJuNPnL AA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkrc71s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:03 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26JGMwPY009844; Tue, 19 Jul 2022 17:01:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1ggpau2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:02 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JH0i54032177;
 Tue, 19 Jul 2022 17:01:01 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-221-30.vpn.oracle.com
 [10.175.221.30])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3hc1ggpaer-6; Tue, 19 Jul 2022 17:01:01 +0000
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
Subject: [PATCH v9 05/11] i386/pc: factor out cxl range end to helper
Date: Tue, 19 Jul 2022 18:00:08 +0100
Message-Id: <20220719170014.27028-6-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220719170014.27028-1-joao.m.martins@oracle.com>
References: <20220719170014.27028-1-joao.m.martins@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_05,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=703
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190072
X-Proofpoint-GUID: WZSnWbRTpRxKL2P4L0jo_Npx_AtFKV00
X-Proofpoint-ORIG-GUID: WZSnWbRTpRxKL2P4L0jo_Npx_AtFKV00
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6c898a86cb89..3fc3e985086a 100644
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
@@ -1020,16 +1039,8 @@ uint64_t pc_pci_hole64_start(void)
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


