Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D134AC8A4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:35:49 +0100 (CET)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8rc-0007IJ-Q0
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:35:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nH8nd-0004CO-FZ; Mon, 07 Feb 2022 13:31:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nH8n9-0001H2-4C; Mon, 07 Feb 2022 13:31:21 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217IQ5rv028641; 
 Mon, 7 Feb 2022 18:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9kDeuGYsnoluMg49wMeuIk7UBzBb9LwZdObiFddE/iQ=;
 b=ajPJLh/EtRmftSHqXnPh7i7xO/UyShXgxx7P+PEUNj8azoED0ovW8PhKw54HF5rIfTgK
 56HLH9GfNNAuXKQPMzLZ2gH6MxP15KEOWHGHc55yxgXBbox6Mf9vKwodX3TkSmtZ9fI1
 5bMUP5SxgFM6u520E/JRLNI/BcT+bsONevkuE1PCH+B1tcebFnmCgk43au10FBNWvfAn
 435PVPAEF96LvsS9PEzGtMtT9w93GhvXOKf/q9lxxN6wlOT7ZhX/d78NIUZwJT7RhGDM
 6hcVxCEVJkv2PnPT5rC34wWboXLg5UWbw7ExZ0JqBx+otfdGOTQbB29Z0UQtVvkXVKLz nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e236eujut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:53 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 217IQ64J028763;
 Mon, 7 Feb 2022 18:30:52 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e236eujuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:52 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217I7f5c018441;
 Mon, 7 Feb 2022 18:30:52 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3e1gvabab2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:52 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217IUpei35062220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 18:30:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81F2DBE05A;
 Mon,  7 Feb 2022 18:30:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16134BE051;
 Mon,  7 Feb 2022 18:30:50 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.16.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 18:30:49 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/ppc: books: Remove excp_model argument from
 ppc_excp_apply_ail
Date: Mon,  7 Feb 2022 15:30:36 -0300
Message-Id: <20220207183036.1507882-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207183036.1507882-1-farosas@linux.ibm.com>
References: <20220207183036.1507882-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W85swWByRtm3Mc3i5vQqEoZz6-DUixv1
X-Proofpoint-GUID: 2H0G-cRCqR8vWmT5hssoIihqJpWx0u4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202070111
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't really need to check for exception model while applying
AIL. We can check the lpcr_mask for the presence of
LPCR_AIL/LPCR_HAIL.

This removes one more instance of passing the exception model ID
around.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 861b7fc24d..116398f36a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -262,11 +262,10 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
  * | a         | h          | 11          | 1       | 1           | h   |
  * +--------------------------------------------------------------------+
  */
-static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
-                                      target_ulong msr,
-                                      target_ulong *new_msr,
-                                      target_ulong *vector)
+static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp, target_ulong msr,
+                               target_ulong *new_msr, target_ulong *vector)
 {
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &cpu->env;
     bool mmu_all_on = ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
     bool hv_escalation = !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
@@ -279,8 +278,13 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
         return;
     }
 
-    if (excp_model == POWERPC_EXCP_POWER8 ||
-        excp_model == POWERPC_EXCP_POWER9) {
+    if (!(pcc->lpcr_mask & LPCR_AIL)) {
+        /* This CPU does not have AIL */
+        return;
+    }
+
+    /* P8 & P9 */
+    if (!(pcc->lpcr_mask & LPCR_HAIL)) {
         if (!mmu_all_on) {
             /* AIL only works if MSR[IR] and MSR[DR] are both enabled. */
             return;
@@ -303,7 +307,8 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
             return;
         }
 
-    } else if (excp_model == POWERPC_EXCP_POWER10) {
+    /* P10 and up */
+    } else {
         if (!mmu_all_on && !hv_escalation) {
             /*
              * AIL works for HV interrupts even with guest MSR[IR/DR] disabled.
@@ -328,9 +333,6 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
             /* AIL=1 and AIL=2 are reserved, treat them like AIL=0 */
             return;
         }
-    } else {
-        /* Other processors do not support AIL */
-        return;
     }
 
     /*
@@ -1258,7 +1260,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
-    int excp_model = env->excp_model;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev = -1;
 
@@ -1529,7 +1530,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     }
 
     /* This can update new_msr and vector if AIL applies */
-    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+    ppc_excp_apply_ail(cpu, excp, msr, &new_msr, &vector);
 
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
-- 
2.34.1


