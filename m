Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E554A8F47
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:44:21 +0100 (CET)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFixp-0000wN-1C
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFiRV-0000XC-DX; Thu, 03 Feb 2022 15:10:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFiRA-000636-7M; Thu, 03 Feb 2022 15:10:56 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213JbWQO026939; 
 Thu, 3 Feb 2022 20:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=psEJO5jzseEh8Ltgj1I2+/Wwcd7rDxVOB6EQpIt80Kk=;
 b=KpiDwT2SKS5OWR8Aabh6lmwwxA5PWNRRRwkDq/x2f5haRWGnfoJUcZCyTV7JyXSTfxXI
 IzDifOwbiAP0eO/tEYvdi2Ne2OLjMyeXX8uQl+K7qawOEJldAaDgna48OCJ9Bz65/w8V
 pkJLCGI3YwRxqvEojoppo3GnBgWw1hsamWQwsCSK2oJCjSbXK3EBD6EMjLrTrCcI2dZ3
 tDdeKJ7GedbqzoJde8zxTfhgzgyVhJMnGMgFxHCGwihxlvTrCUGP1mCvu1j8NK5RQ0Ip
 63dP5lgkiAWjEluQ/bcpBLSlyG83odisZ7Tk50ehkIBpVtq4dATeml3DHXo4nv+zH1QE 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e09h0hb5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:21 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213JQQXL023714;
 Thu, 3 Feb 2022 20:10:20 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e09h0hb54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:20 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213K8rUp030952;
 Thu, 3 Feb 2022 20:10:19 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3dvw7cn0ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213KAIha35258640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 20:10:18 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31580BE051;
 Thu,  3 Feb 2022 20:10:18 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 916FBBE054;
 Thu,  3 Feb 2022 20:10:16 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 20:10:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] target/ppc: 6xx: Program exception cleanup
Date: Thu,  3 Feb 2022 17:09:53 -0300
Message-Id: <20220203200957.1434641-8-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203200957.1434641-1-farosas@linux.ibm.com>
References: <20220203200957.1434641-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V1rHLsq2T8REnqLIPH20zL7Hx60Oj-jG
X-Proofpoint-GUID: 4KXaiii2-XZlhQYpf3HId-ilLncTbxDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030120
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no ESR in the 6xx CPUs.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a008115e5f..a195288dda 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -651,20 +651,16 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
              * precise in the MSR.
              */
             msr |= 0x00100000;
-            env->spr[SPR_BOOKE_ESR] = ESR_FP;
             break;
         case POWERPC_EXCP_INVAL:
             trace_ppc_excp_inval(env->nip);
             msr |= 0x00080000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PIL;
             break;
         case POWERPC_EXCP_PRIV:
             msr |= 0x00040000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PPR;
             break;
         case POWERPC_EXCP_TRAP:
             msr |= 0x00020000;
-            env->spr[SPR_BOOKE_ESR] = ESR_PTR;
             break;
         default:
             /* Should never occur */
-- 
2.34.1


