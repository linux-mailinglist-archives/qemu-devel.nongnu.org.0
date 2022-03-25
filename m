Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5D4E7AF8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:14:37 +0100 (CET)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsCa-0002G9-9X
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:14:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXs9f-00056R-CU; Fri, 25 Mar 2022 18:11:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXs9d-0003PP-Ky; Fri, 25 Mar 2022 18:11:35 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PJEK1a015285; 
 Fri, 25 Mar 2022 22:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=U+rBL7L7Qxd3n+oQz6F9zh4Ey6CI1mnHSwMmsHJkTgM=;
 b=HS3yxw6DARvHESrnz8gqQhNdYIGbSGFQnZ5hCBmTzrGG98upLlJnqsmfQytA5xF0rizk
 Blqr0lqdtWY1XzaTedHQuR9BJllJ6Bnq3l0XUAT8SG8Y0QjGtl0RkeLjQYxNZYedUokh
 b1tdqkW3RVDapqvKiABdJnsySiS9tQu4bxhve8QFQcz/1kvtnejB861dPQguQOkzg/2z
 mFGDgSwaKqOvbnLgl285esLZ7bpQKbq28klFVZCrXMjcEOwhd07fL7Z/18Ghvb75GKeq
 pfVFc4+eQ3J2CuTIDup2fjo5kmxIA48ekfGVVg/n9U9bXra8M+w8b94fFYCagPazYqYf BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0qkndn0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:11:27 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22PMBQLD006869;
 Fri, 25 Mar 2022 22:11:26 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0qkndn09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:11:26 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22PM7a8F019924;
 Fri, 25 Mar 2022 22:11:25 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3ew6t9pfex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:11:25 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PMBOtR23331236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 22:11:24 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01F2BAC05E;
 Fri, 25 Mar 2022 22:11:24 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E11CAC059;
 Fri, 25 Mar 2022 22:11:21 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.77.145.9]) by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 25 Mar 2022 22:11:21 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] spapr: Move nested KVM hypercalls under a TCG only
 config.
Date: Fri, 25 Mar 2022 19:11:13 -0300
Message-Id: <20220325221113.255834-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325221113.255834-1-farosas@linux.ibm.com>
References: <20220325221113.255834-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ikXuCV9jPnif3YgVGZWCcw67hWIAOJn5
X-Proofpoint-GUID: 4HpDYRKaf3bi2MbqRgqwLfMk6IVtpgBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_07,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250122
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

These are the spapr virtual hypervisor implementation of the nested
KVM API. They only make sense when running with TCG.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 hw/ppc/spapr_hcall.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 08b50590a8..9244aa3ad8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1473,7 +1473,7 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
     return H_FUNCTION;
 }
 
-/* TCG only */
+#ifdef CONFIG_TCG
 #define PRTS_MASK      0x1f
 
 static target_ulong h_set_ptbl(PowerPCCPU *cpu,
@@ -1800,18 +1800,35 @@ out_restore_l1:
     spapr_cpu->nested_host_state = NULL;
 }
 
-#ifdef CONFIG_TCG
+static void hypercall_register_nested(void)
+{
+    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
+    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
+    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
+    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
+}
+
 static void hypercall_register_softmmu(void)
 {
     /* DO NOTHING */
 }
 #else
+void spapr_exit_nested(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+
 static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
                             target_ulong opcode, target_ulong *args)
 {
     g_assert_not_reached();
 }
 
+static void hypercall_register_nested(void)
+{
+    /* DO NOTHING */
+}
+
 static void hypercall_register_softmmu(void)
 {
     /* hcall-pft */
@@ -1881,10 +1898,7 @@ static void hypercall_register_types(void)
 
     spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
 
-    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
-    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
-    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
-    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
+    hypercall_register_nested();
 }
 
 type_init(hypercall_register_types)
-- 
2.35.1


