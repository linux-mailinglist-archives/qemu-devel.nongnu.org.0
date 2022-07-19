Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3C57A4BA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:13:00 +0200 (CEST)
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqmH-0005Zp-IF
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqb4-0005GP-0o
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:22 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:55180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqb2-0002g6-3H
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:21 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JF4wjA030726;
 Tue, 19 Jul 2022 17:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=m3LE08ZMWE+mm5HFzuAYjObKI0Hqxb7+RCUFVeerQzY=;
 b=nRuy3H6bIDWjLvDu3Y35cNwI07/rUqaDMSRHh8egqDOxGAK3bGbGomLWXXmVL0fqIBK9
 oT5LyDEYz1vUz5G6Cjc9ayakD/J6ttrN5XF5n5w7bWN+w7bBurSYqCUSFTecXeLqSua9
 pPYBzNnQ1y5DhVEwtxKtbAG1H7X7PrQHvGpNz1Zh/xp7X2AAxF4AmJZtvgL9D8cRp9cc
 FJRihm8WwSaO5d5EWh8Ocxx5mhJYkOllcjN6mqfcv1rJHy0f9Vb5JmER95Ayg71npP6N
 Ru6FjJ8sbqKfwDh9LuY7B7Khi8P6g6Ly2gjlV+COXLLVdEcH2X9CXZFkgmqCODDsmmgG SQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkrc71sb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:07 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26JGgccB009824; Tue, 19 Jul 2022 17:01:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1ggpaw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:06 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JH0i56032177;
 Tue, 19 Jul 2022 17:01:05 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-221-30.vpn.oracle.com
 [10.175.221.30])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3hc1ggpaer-7; Tue, 19 Jul 2022 17:01:05 +0000
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
Subject: [PATCH v9 06/11] i386/pc: factor out cxl range start to helper
Date: Tue, 19 Jul 2022 18:00:09 +0100
Message-Id: <20220719170014.27028-7-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220719170014.27028-1-joao.m.martins@oracle.com>
References: <20220719170014.27028-1-joao.m.martins@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_05,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=988
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190072
X-Proofpoint-GUID: T4X2KQdXGlNl2X_6A3Ksqpm-n8w6s8TO
X-Proofpoint-ORIG-GUID: T4X2KQdXGlNl2X_6A3Ksqpm-n8w6s8TO
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

Factor out the calculation of the base address of the memory region.
It will be used later on for the cxl range end counterpart calculation
and as well in pc_memory_init() CXL memory region initialization, thus
avoiding duplication.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 3fc3e985086a..3fdcab4bb4f3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -825,6 +825,22 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
     return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 }
 
+static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    MachineState *machine = MACHINE(pcms);
+    hwaddr cxl_base;
+
+    if (pcmc->has_reserved_memory && machine->device_memory->base) {
+        cxl_base = machine->device_memory->base
+            + memory_region_size(&machine->device_memory->mr);
+    } else {
+        cxl_base = pc_above_4g_end(pcms);
+    }
+
+    return cxl_base;
+}
+
 static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
 {
     uint64_t start = 0;
@@ -946,13 +962,7 @@ void pc_memory_init(PCMachineState *pcms,
         MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
         hwaddr cxl_size = MiB;
 
-        if (pcmc->has_reserved_memory && machine->device_memory->base) {
-            cxl_base = machine->device_memory->base
-                + memory_region_size(&machine->device_memory->mr);
-        } else {
-            cxl_base = pc_above_4g_end(pcms);
-        }
-
+        cxl_base = pc_get_cxl_range_start(pcms);
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
-- 
2.17.2


