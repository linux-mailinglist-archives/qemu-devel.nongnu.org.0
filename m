Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5022498A14
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:02:08 +0100 (CET)
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC4bP-0005wj-SQ
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:02:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4MR-0003cr-5X; Mon, 24 Jan 2022 13:46:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4MP-0005Kj-CZ; Mon, 24 Jan 2022 13:46:38 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OI1opT015859; 
 Mon, 24 Jan 2022 18:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=or3/ci/+kjI9/GIK8/kNoNq8Ri/RHAOwZ8MWrv+AIhE=;
 b=JgK/z63FMiNG5qnZHmmmcc9kbZdZ7V9z0TRxesJRgpwIR22zOwU3289NYU3D3ke7s87y
 xgcjDRMTnCKYsvmtN33WsH7cQNVwdzZYg2yjI238ynVlv/na5EYvjQ6Z6nfbu6oEXDH6
 k66zTynNsiDGQvfKW9qRaRUSibHN8RGJUuVOP3PkiA6fWxNf5IvIgGV2A5vu7Q71m/AO
 RzgcyVZigXA1gdsT1e+aL1h+6yYnpX5GQ09pA7MANF7yl+o/wOyKsk2bYr4JqdyqdchS
 6KUgxHEJh+wp5e7MfuxUr1cXD45yHJUVs6aZSKcqd8rq27rBM9bZb+gY8xlciEPEyrEu 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsxnxn0hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:26 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OI0Dio016173;
 Mon, 24 Jan 2022 18:46:25 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsxnxn0ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:25 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OIbKpf005759;
 Mon, 24 Jan 2022 18:46:24 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3dr9j9vnjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:24 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OIkNAP34537920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 18:46:23 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62BBAAE063;
 Mon, 24 Jan 2022 18:46:23 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59E34AE05C;
 Mon, 24 Jan 2022 18:46:21 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.24.67])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 18:46:21 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/ppc: books: External interrupt cleanup
Date: Mon, 24 Jan 2022 15:46:04 -0300
Message-Id: <20220124184605.999353-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124184605.999353-1-farosas@linux.ibm.com>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rWYJZ0tVolamT1gbrBnBOddICVT0B2u9
X-Proofpoint-GUID: NUhmwzmTrahcDqXHvjcBxD_aL8S1TR6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240121
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since this is now BookS only, we can simplify the code a bit and check
has_hv_mode instead of enumerating the exception models. LPES0 does
not make sense if there is no MSR_HV.

Note that QEMU does not support HV mode on 970 and POWER5+ so we don't
set MSR_HV in msr_mask.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e5f09e1984..67faec3775 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -644,39 +644,23 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     {
         bool lpes0;
 
-        cs = CPU(cpu);
-
         /*
-         * Exception targeting modifiers
-         *
-         * LPES0 is supported on POWER7/8/9
-         * LPES1 is not supported (old iSeries mode)
-         *
-         * On anything else, we behave as if LPES0 is 1
-         * (externals don't alter MSR:HV)
+         * LPES0 is only taken into consideration if we support HV
+         * mode for this CPU.
          */
-#if defined(TARGET_PPC64)
-        if (excp_model == POWERPC_EXCP_POWER7 ||
-            excp_model == POWERPC_EXCP_POWER8 ||
-            excp_model == POWERPC_EXCP_POWER9 ||
-            excp_model == POWERPC_EXCP_POWER10) {
-            lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
-        } else
-#endif /* defined(TARGET_PPC64) */
-        {
-            lpes0 = true;
+        if (!env->has_hv_mode) {
+            break;
         }
 
+        lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
+
         if (!lpes0) {
             new_msr |= (target_ulong)MSR_HVB;
             new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
             srr0 = SPR_HSRR0;
             srr1 = SPR_HSRR1;
         }
-        if (env->mpic_proxy) {
-            /* IACK the IRQ on delivery */
-            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
-        }
+
         break;
     }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-- 
2.34.1


