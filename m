Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C6E4DCC4F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:23:01 +0100 (CET)
Received: from localhost ([::1]:58412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtq0-0000bV-Pe
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:23:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nUtoP-0006oh-To; Thu, 17 Mar 2022 13:21:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nUtoO-0004eL-5n; Thu, 17 Mar 2022 13:21:21 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22HGA3E9011387; 
 Thu, 17 Mar 2022 17:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GJrGWI7I+GAyRp+1vEn636/1WU2vv1cXczrZH665wBI=;
 b=Db3XRXWc96L1nQAff1aGKVdezujMkb+/XCzHbJLLjq02yVaDnWvwl+9GHjfhdhmg18On
 xfkDVXfLRbQxORaeyv5RrtAKOsbQETpP6GTfA+q14XoBckw5QDC9mFLsLK+qyvAAIEX7
 Nu7GFixdERWmNKi7BMDRnDvnRUnRIND9XG6zHn2sAHW00GmiVR3TQA1TIJmUNSCEf43Z
 68Sm+VDyYFOPlVCq97WvK610mSzB66n2WWVYWp1/w1FbnvOurZagsAPRkMTUASWSyJp9
 HZSDmCt1lyNfk/mDwZ1aB0DLQG7TGw4+1ySQQhNZo9SxuNCuksKnYqIa/7ZDYvikNFJv Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s4gyn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:08 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22HGAu9U014745;
 Thu, 17 Mar 2022 17:21:08 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s4gyme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:08 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22HHI6lX031071;
 Thu, 17 Mar 2022 17:21:07 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3etaj7aec3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22HHL61L48234894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 17:21:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA52DAC05F;
 Thu, 17 Mar 2022 17:21:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21BB9AC059;
 Thu, 17 Mar 2022 17:21:03 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.55.207])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Mar 2022 17:21:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] spapr: Move hypercall_register_softmmu
Date: Thu, 17 Mar 2022 14:20:48 -0300
Message-Id: <20220317172049.2681740-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317172049.2681740-1-farosas@linux.ibm.com>
References: <20220317172049.2681740-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QfNsRvOhdj3CoLgS1U4A7JykO2X-bsZv
X-Proofpoint-GUID: X7UWyyW8ReEyjhWADcg5GpmuCFVYKMNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=894 suspectscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
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

Need to move this because next patch will add calls to the functions
that are below it.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 hw/ppc/spapr_hcall.c | 50 ++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 119baa1d2d..c0bfc4bc9c 100644
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
 
@@ -1833,6 +1808,31 @@ out_restore_l1:
     spapr_cpu->nested_host_state = NULL;
 }
 
+#ifndef CONFIG_TCG
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
+#else
+static void hypercall_register_softmmu(void)
+{
+    /* DO NOTHING */
+}
+#endif
+
 static void hypercall_register_types(void)
 {
     hypercall_register_softmmu();
-- 
2.34.1


