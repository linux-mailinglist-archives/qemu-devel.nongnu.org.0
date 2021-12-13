Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E19A472E6B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:02:28 +0100 (CET)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwluM-0008Ua-3p
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:02:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mwlV6-0006nC-FH; Mon, 13 Dec 2021 08:36:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mwlV3-0002JK-TQ; Mon, 13 Dec 2021 08:36:20 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BDCsZIG028263; 
 Mon, 13 Dec 2021 13:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=/q6nCMPmIySvnXp+CVKjvgQLQAQ9eeJJ3DmAuHEFkJw=;
 b=hcx8hfrhN1RtkNoMp3mGJb5Em5sdKrjijla2U9GWH5KKrkGQXF78zJXuhuX6nY6xaZr3
 4gshkLuxJkdadWzzaC4t2Sx+Qv4Y0780kbB0KHBDlMbS4guoG3jyg3pHpRlH0/lptVkm
 Xo7K/iuHn5v6gyGrTyGnk4+ozKzG8KtR4nUPPlA8VUv8dUWazYwf0Q1W9pY3Xuro6CAc
 5DjG2btAXc7OZrRTv+nlSJhhvRD0E0m7eY9ql+8tN7CZ31+S+yqQRR3vu52qlcU3LFze
 fcn/woOh11gOUvnxstaa0EsjTwI6a1iKaGyzCEOv/v1RdHZ2W1Yqm+7Xq4Ygv6xQubcz TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx2pcegsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 13:35:55 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BDCsk1r030210;
 Mon, 13 Dec 2021 13:35:55 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx2pcegs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 13:35:55 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BDDVBLp028392;
 Mon, 13 Dec 2021 13:35:54 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3cvkm9ng9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 13:35:54 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BDDZq2j55050606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 13:35:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4525AE086;
 Mon, 13 Dec 2021 13:35:52 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81C63AE067;
 Mon, 13 Dec 2021 13:35:49 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.152.7])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Dec 2021 13:35:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Fix e6500 boot
Date: Mon, 13 Dec 2021 10:35:42 -0300
Message-Id: <20211213133542.2608540-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nDmZ3COJ_4OfxFci6csMivJiZGZ5DGl-
X-Proofpoint-GUID: pAE0AsRFuGmftj7vrXWlbwpfylSGKz7A
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_04,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 mlxlogscore=981 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112130086
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mario@locati.it, danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When Altivec support was added to the e6500 kernel in 2012[1], the
QEMU code was not changed, so we don't register the VPU/VPUA
exceptions for the e6500:

  qemu: fatal: Raised an exception without defined vector 73

Note that the error message says 73, instead of 32, which is the IVOR
for VPU. This is because QEMU knows only knows about the VPU interrupt
for the 7400s. In theory, we should not be raising _that_ VPU
interrupt, but instead another one specific for the e6500.

We unfortunately cannot register e6500-specific VPU/VPUA interrupts
because the SPEU/EFPDI interrupts also use IVOR32/33. These are
present only in the e500v1/2 versions. From the user manual:

e500v1, e500v2: only SPEU/EFPDI/EFPRI
e500mc, e5500:  no SPEU/EFPDI/EFPRI/VPU/VPUA
e6500:          only VPU/VPUA

So I'm leaving IVOR32/33 as SPEU/EFPDI, but altering the dispatch code
to convert the VPU #73 to a #32 when we're in the e6500. Since the
handling for SPEU and VPU is the same this is the only change that's
needed. The EFPDI is not implemented and will cause an abort. I don't
think it worth it changing the error message to take VPUA into
consideration, so I'm not changing anything there.

This bug was discussed in the thread:
https://lists.gnu.org/archive/html/qemu-ppc/2021-06/msg00222.html

1- https://git.kernel.org/torvalds/c/cd66cc2ee52

Reported-by: <mario@locati.it>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c    |  6 ++++++
 target/ppc/excp_helper.c | 12 +++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6695985e9b..d8efcb24ed 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2273,8 +2273,14 @@ static void init_excp_e200(CPUPPCState *env, target_ulong ivpr_mask)
     env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00000000;
     env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00000000;
     env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00000000;
+    /*
+     * These two are the same IVOR as POWERPC_EXCP_VPU and
+     * POWERPC_EXCP_VPUA. We deal with that when dispatching at
+     * powerpc_excp().
+     */
     env->excp_vectors[POWERPC_EXCP_SPEU]     = 0x00000000;
     env->excp_vectors[POWERPC_EXCP_EFPDI]    = 0x00000000;
+
     env->excp_vectors[POWERPC_EXCP_EFPRI]    = 0x00000000;
     env->ivor_mask = 0x0000FFF7UL;
     env->ivpr_mask = ivpr_mask;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 17607adbe4..7bb170f440 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -344,6 +344,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         excp = POWERPC_EXCP_PROGRAM;
     }
 
+#ifdef TARGET_PPC64
+    /*
+     * SPEU and VPU share the same IVOR but they exist in different
+     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
+     */
+    if (excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
+        excp = POWERPC_EXCP_SPEU;
+    }
+#endif
+
     switch (excp) {
     case POWERPC_EXCP_NONE:
         /* Should never happen */
@@ -569,7 +579,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             cpu_abort(cs, "Debug exception triggered on unsupported model\n");
         }
         break;
-    case POWERPC_EXCP_SPEU:      /* SPE/embedded floating-point unavailable  */
+    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
         env->spr[SPR_BOOKE_ESR] = ESR_SPV;
         break;
     case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
-- 
2.33.1


