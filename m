Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35F57A48C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:05:11 +0200 (CEST)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDqek-0002Y2-Qy
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqbM-0005K9-5t
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDqb6-0002hj-Eu
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:01:26 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JGpHvR017914;
 Tue, 19 Jul 2022 17:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=QMNe8ckb12GEwHvHx5t8fcVVzc8ilxAjIE96wJm3nAE=;
 b=hZRT4dAjDjj3Q+9ENr40YiM/Vs1OCxytefjMODgntoPwQnfeNJT5osxoiQP2gHZHrLCr
 3cUksiglcNW6QDqMPpXugJdoqpOwzZn1P8UjJp8J6sWiqAw90YaaGy8Uy0hhbttM1K4d
 8Wk/XGp/0bH/A9HS78LJpvPADw8VPaeJJNjRbE50enG0Ec8N44Oy83hUYUStfUDdwIVn
 KmyIaKdO8qh1w3JH1Cgw5CEekBOeiPFBTrPGzagepacp/54ZQ7DTn/9NpTuBzrifTuuf
 Nuw8C/AQDDMfcZcpAzH1QNCW9xmdVihNyoFu1+r1nirbdGS0IA2/cDEOp5u731SkBFg6 Zg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkx0y7pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:10 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26JGpZ5D009997; Tue, 19 Jul 2022 17:01:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1ggpays-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:01:09 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JH0i58032177;
 Tue, 19 Jul 2022 17:01:09 GMT
Received: from paddy.uk.oracle.com (dhcp-10-175-221-30.vpn.oracle.com
 [10.175.221.30])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3hc1ggpaer-8; Tue, 19 Jul 2022 17:01:08 +0000
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
Subject: [PATCH v9 07/11] i386/pc: handle unitialized mr in
 pc_get_cxl_range_end()
Date: Tue, 19 Jul 2022 18:00:10 +0100
Message-Id: <20220719170014.27028-8-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220719170014.27028-1-joao.m.martins@oracle.com>
References: <20220719170014.27028-1-joao.m.martins@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_05,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=671
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190072
X-Proofpoint-GUID: pYZ2xSSi-n5qMcMNpEBG6OQQ9rn3bLdO
X-Proofpoint-ORIG-GUID: pYZ2xSSi-n5qMcMNpEBG6OQQ9rn3bLdO
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

Remove pc_get_cxl_range_end() dependency on the CXL memory region,
and replace with one that does not require the CXL host_mr to determine
the start of CXL start.

This in preparation to allow pc_pci_hole64_start() to be called early
in pc_memory_init(), handle CXL memory region end when its underlying
memory region isn't yet initialized.

Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/pc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 3fdcab4bb4f3..c654be6cf0bd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -843,17 +843,15 @@ static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
 
 static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
 {
-    uint64_t start = 0;
+    uint64_t start = pc_get_cxl_range_start(pcms) + MiB;
 
-    if (pcms->cxl_devices_state.host_mr.addr) {
-        start = pcms->cxl_devices_state.host_mr.addr +
-            memory_region_size(&pcms->cxl_devices_state.host_mr);
-        if (pcms->cxl_devices_state.fixed_windows) {
-            GList *it;
-            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
-                CXLFixedWindow *fw = it->data;
-                start = fw->mr.addr + memory_region_size(&fw->mr);
-            }
+    if (pcms->cxl_devices_state.fixed_windows) {
+        GList *it;
+
+        start = ROUND_UP(start, 256 * MiB);
+        for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
+            CXLFixedWindow *fw = it->data;
+            start += fw->size;
         }
     }
 
-- 
2.17.2


