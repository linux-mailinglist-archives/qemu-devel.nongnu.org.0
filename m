Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CEE4DCC54
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:24:46 +0100 (CET)
Received: from localhost ([::1]:35018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtrh-0003rd-Ug
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:24:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nUtoU-0006z6-Dc; Thu, 17 Mar 2022 13:21:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nUtoS-0004fW-GS; Thu, 17 Mar 2022 13:21:25 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22HGA5WI010432; 
 Thu, 17 Mar 2022 17:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IRPNTCpkssU3uxpa7SYC5Q9Tvy1hDFzsSzze9QTGFhs=;
 b=X/eVOafhHz8iF2bbEk23EhLnCnH9J63evmK+L4XJGXiyTVDRwlEbphG+rzfoqveDp7wi
 J0j76Cro7Bc+AlKFX4tZtctap3UuLGiECiMORpvVPM1Bp4jpRG47oq9c31NicC6oEAdY
 dZ1fy0GV2gXZKRuBVZDTSlvLhMNrPpbdJxk0bBHYkblfyNF58mYrXGJ0DoRH08v6Vk0p
 6DWQKqFoRJLRbakAZeJ1LXeeoI+AoTz2KFIgUKHmTqw+jDbl+/3+D5J2PxyvoDQNuzek
 HlAr29FRPBYOyPQ/XSTVEcpg8J3e78mq2iEBtTbiYQQEJBrr7ZhnVxlosyqiFsj58tnI TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3euwuhphf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:12 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22HHEaGS001979;
 Thu, 17 Mar 2022 17:21:11 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3euwuhpheg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:11 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22HHJGtZ005101;
 Thu, 17 Mar 2022 17:21:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3erk59vwsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:11 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22HHL9bp29360582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 17:21:10 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4DA4AC064;
 Thu, 17 Mar 2022 17:21:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDE73AC05E;
 Thu, 17 Mar 2022 17:21:06 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.55.207])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Mar 2022 17:21:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] spapr: Move nested KVM hypercalls under a TCG only config.
Date: Thu, 17 Mar 2022 14:20:49 -0300
Message-Id: <20220317172049.2681740-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317172049.2681740-1-farosas@linux.ibm.com>
References: <20220317172049.2681740-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Cebi8BH5yxYRSoFKjdM9y11w13YGs8gB
X-Proofpoint-GUID: sBcex_pzcogz9U3TyoqPze93GlwqVE27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

These are the spapr virtual hypervisor implementation of the nested
KVM API. They only make sense when running with TCG.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 hw/ppc/spapr_hcall.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index c0bfc4bc9c..f2c802c155 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -2,6 +2,7 @@
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "sysemu/hw_accel.h"
+#include "sysemu/tcg.h"
 #include "sysemu/runstate.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
@@ -1473,7 +1474,8 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
     return H_FUNCTION;
 }
 
-/* TCG only */
+#ifdef CONFIG_TCG
+
 #define PRTS_MASK      0x1f
 
 static target_ulong h_set_ptbl(PowerPCCPU *cpu,
@@ -1807,6 +1809,12 @@ out_restore_l1:
     g_free(spapr_cpu->nested_host_state);
     spapr_cpu->nested_host_state = NULL;
 }
+#else
+void spapr_exit_nested(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+#endif
 
 #ifndef CONFIG_TCG
 static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
@@ -1829,7 +1837,10 @@ static void hypercall_register_softmmu(void)
 #else
 static void hypercall_register_softmmu(void)
 {
-    /* DO NOTHING */
+    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
+    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
+    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
+    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
 }
 #endif
 
@@ -1888,11 +1899,6 @@ static void hypercall_register_types(void)
     spapr_register_hypercall(KVMPPC_H_CAS, h_client_architecture_support);
 
     spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
-
-    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
-    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
-    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
-    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
 }
 
 type_init(hypercall_register_types)
-- 
2.34.1


