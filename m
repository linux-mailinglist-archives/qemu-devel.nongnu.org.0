Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D11498AAB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:07:06 +0100 (CET)
Received: from localhost ([::1]:54056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC4gC-0003cC-VW
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:07:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4My-0003p3-6C; Mon, 24 Jan 2022 13:47:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1158
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4Mw-0005N1-K6; Mon, 24 Jan 2022 13:47:11 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OHBaEx017549; 
 Mon, 24 Jan 2022 18:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UaHG7bJqwR8qgEWlUt1GpwPVoW/oERyCrbb/TwYm1sY=;
 b=tMbzx8pvxGttZQYU1RILJL1LahlUdb+HAqdH65iOD35k38V1ERpE5NrUlgomr8pP/Bp9
 d8L//64c8dkg1mMcQEj0OMmA8DlNZuEnak1NASqZ7TSBktv4YCGAYd0cqopbvIM1+805
 udvz5ksN+O+KGjyTPqxFxHz8a2Q9tS+tVHA0FQUVoxPg2UYe3W9E5hfqv7mDiYi5ybtk
 U7XYMHWOAiVeJ9aCT2rqn79uhiuKolSFz3o3YN2XBthBvlVKkdsORUw58Yk2BHrWCRhU
 2afEG2MSVnrDXicsVJrMY50ZOm89l60aG077O8X6ILTHKfrn528mUw+NqCRwBLQCIt2L Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w22wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:59 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OIUt9a003613;
 Mon, 24 Jan 2022 18:46:58 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w22wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:58 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OIbV9O031820;
 Mon, 24 Jan 2022 18:46:27 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3dr9ja5j4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 18:46:27 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OIkQDr46727486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 18:46:26 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A378AE063;
 Mon, 24 Jan 2022 18:46:26 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07530AE05C;
 Mon, 24 Jan 2022 18:46:24 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.24.67])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 18:46:23 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] target/ppc: books: Program exception cleanup
Date: Mon, 24 Jan 2022 15:46:05 -0300
Message-Id: <20220124184605.999353-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124184605.999353-1-farosas@linux.ibm.com>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kClcYpxNgV8Ib7oPR7OleefLvIjw8zSQ
X-Proofpoint-ORIG-GUID: 8LwVYMgzCWMyVjCif9mXNOuavnZv8oCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240121
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

Remove setting of BookE registers.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 67faec3775..d1cce76e75 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -688,20 +688,16 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
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


