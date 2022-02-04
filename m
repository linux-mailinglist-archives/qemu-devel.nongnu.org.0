Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55174A9E8B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 19:01:49 +0100 (CET)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2u4-00085o-7k
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 13:01:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2UX-0000jx-MR; Fri, 04 Feb 2022 12:35:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2UT-000174-WE; Fri, 04 Feb 2022 12:35:25 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214H0FY0006848; 
 Fri, 4 Feb 2022 17:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FsiDgZKvwmkV/zoMMx2SW6mzm4xuaLUFsAzs/NrzgHI=;
 b=GHOTZ7GjKNdwUBljPX6vqSCw2T36zDKx4rq/2H8Qw7pqmQZjOxQp+/cmCKwuHovtOrVA
 ABNco/CIFqPR2Af3HgIBDDVkHA9Yg02/jGvehiVrU7HW8mwo0SmkwQVcdFSENk4a1pbK
 Ti4HnIkvNkOrw6uuE2E5N4c02IOjN+CD/N15Rq26R2MkjFo0mCVxUQyLjxi5Eb1Wq3q7
 aQbBGs3x5fYRTn1Trbrm+n3p5RyEWXdgK58dBtJkW9qn7k76hrDU2tyo7U/HHhzN/ZjJ
 NoqKOxXkRuQ0t0PknTPexo65pz4FdeKb5Boal8lb/U72hI8JHyX7jpZSt8odNR4nDNK/ 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx0tg3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:59 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214H0GF4017513;
 Fri, 4 Feb 2022 17:34:59 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx0tg3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:59 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214HRM77000654;
 Fri, 4 Feb 2022 17:34:58 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3e0r0xqb0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:58 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214HYv2e29753800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 17:34:57 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74E7BAE060;
 Fri,  4 Feb 2022 17:34:57 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42241AE067;
 Fri,  4 Feb 2022 17:34:55 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.79.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 17:34:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/10] target/ppc: 7xx: Program exception cleanup
Date: Fri,  4 Feb 2022 14:34:26 -0300
Message-Id: <20220204173430.1457358-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204173430.1457358-1-farosas@linux.ibm.com>
References: <20220204173430.1457358-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mu6HR0bv0sX8CJEojERQXjGGA3c19u0-
X-Proofpoint-ORIG-GUID: vxclIjBOuocs80lCrIP4xVTwWOMufsZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040097
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

There's no ESR in the 7xx.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5e2c2aa544..8f810f7de5 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -841,20 +841,16 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
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


