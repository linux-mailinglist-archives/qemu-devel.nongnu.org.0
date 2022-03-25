Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338E34E7AF9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:16:13 +0100 (CET)
Received: from localhost ([::1]:38794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsE8-0007Ia-9j
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:16:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXs9b-0004rZ-Mz; Fri, 25 Mar 2022 18:11:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33876
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXs9Z-0003Ny-Js; Fri, 25 Mar 2022 18:11:31 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PJ21hV023772; 
 Fri, 25 Mar 2022 22:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dzHv9m598TPkyN7OwGbgVhkppky0FaZzmhktFRF2zbk=;
 b=qmAKFwFvJwAHHoTAtrXGZkwEcAOy3ONbQODIR+MrOSHok073sgM/Y//Q6+SPt1M5j22z
 6eDCIxtbQhUS1rAyYAx5UBRA1oKoALsyWuTA2+fa+G/S6CeqDsGcyab4gWHwkuCFSKO/
 MUs77Y4a1WoNUAqDi/tpMHJpFjrlK4QGQeb0w2xlGB+FGa68b+VsPp9ep+Y/b/hyYaui
 +fvUcm/bjWZlRmVQzE9fLLEghsMhrzXcb3ohY8QUdyXJpm7rU0bCzW+tEv6n6VFGlUiN
 j6g/br6INcxQNfCQRz4nCjXZHJ8FM8DpwQ1q9t90TPc4+AdxpITGvnUGo/KvrVsywOCQ Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0q5p80wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:11:23 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22PM3fim004811;
 Fri, 25 Mar 2022 22:11:22 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0q5p80wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:11:22 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22PM8TDG005005;
 Fri, 25 Mar 2022 22:11:22 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 3exd3k4vmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:11:22 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PMBL6423462316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 22:11:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 064EBAC059;
 Fri, 25 Mar 2022 22:11:21 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B765BAC069;
 Fri, 25 Mar 2022 22:11:18 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.77.145.9]) by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 25 Mar 2022 22:11:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] spapr: Move hypercall_register_softmmu
Date: Fri, 25 Mar 2022 19:11:12 -0300
Message-Id: <20220325221113.255834-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325221113.255834-1-farosas@linux.ibm.com>
References: <20220325221113.255834-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zM45qa2SzEDwOt3BwwK0k-q669wHe8oJ
X-Proofpoint-GUID: QqIQ5ohiPVTOjZMNwRTFdsw9fr0M7Ts2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_07,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250122
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm moving this because next patch will add more code under the ifdef
and it will be cleaner if we keep them together.

Also switch the ifdef branches to make it more convenient to add code
under CONFIG_TCG in the next patch.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 hw/ppc/spapr_hcall.c | 50 ++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f008290787..08b50590a8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1473,31 +1473,6 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
     return H_FUNCTION;
 }
 
-#ifndef CONFIG_TCG
-static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
-                            target_ulong opcode, target_ulong *args)
-{
-    g_assert_not_reached();
-}
-
-static void hypercall_register_softmmu(void)
-{
-    /* hcall-pft */
-    spapr_register_hypercall(H_ENTER, h_softmmu);
-    spapr_register_hypercall(H_REMOVE, h_softmmu);
-    spapr_register_hypercall(H_PROTECT, h_softmmu);
-    spapr_register_hypercall(H_READ, h_softmmu);
-
-    /* hcall-bulk */
-    spapr_register_hypercall(H_BULK_REMOVE, h_softmmu);
-}
-#else
-static void hypercall_register_softmmu(void)
-{
-    /* DO NOTHING */
-}
-#endif
-
 /* TCG only */
 #define PRTS_MASK      0x1f
 
@@ -1825,6 +1800,31 @@ out_restore_l1:
     spapr_cpu->nested_host_state = NULL;
 }
 
+#ifdef CONFIG_TCG
+static void hypercall_register_softmmu(void)
+{
+    /* DO NOTHING */
+}
+#else
+static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                            target_ulong opcode, target_ulong *args)
+{
+    g_assert_not_reached();
+}
+
+static void hypercall_register_softmmu(void)
+{
+    /* hcall-pft */
+    spapr_register_hypercall(H_ENTER, h_softmmu);
+    spapr_register_hypercall(H_REMOVE, h_softmmu);
+    spapr_register_hypercall(H_PROTECT, h_softmmu);
+    spapr_register_hypercall(H_READ, h_softmmu);
+
+    /* hcall-bulk */
+    spapr_register_hypercall(H_BULK_REMOVE, h_softmmu);
+}
+#endif
+
 static void hypercall_register_types(void)
 {
     hypercall_register_softmmu();
-- 
2.35.1


