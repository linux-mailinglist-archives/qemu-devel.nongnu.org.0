Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5054A8F7C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:04:20 +0100 (CET)
Received: from localhost ([::1]:52970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFjH9-0003hW-ES
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:04:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFiQx-0000Op-Rq; Thu, 03 Feb 2022 15:10:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFiQu-0005ss-G4; Thu, 03 Feb 2022 15:10:23 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213ItijU035080; 
 Thu, 3 Feb 2022 20:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ohc/GkYQAJjNbHABmneUyCjhsoVUR+YaMTrjfEYIpj4=;
 b=gXQp+2hNAwKW8rAHY+Fb6pgXfHm6xz2xRQIP0sFg6h8eVBq3RrQUcJEpVF7KlR959QX1
 7dhBjQaufOe7F41x9Yd79EvaOiOg6DzfURTa/wsNifW4ZGaR1GuH9JccwYnAum8i2ldw
 J1cQqUgH79GxB5ocsQ4ivBHTyqX0nsCQLknRcAkGc1lDkJ8kNHMzNuAstV/1ca/dk1mk
 FipKPO1p7axL5oEHgfnnF1zqW5j0DuEiH7VDiw6KW37WeK/TS93z1ZjnK/HsZADTFzlc
 aTsZWfcBOxNQp2yJLQEL4ahVHeIXLEoYWW+b51SzferixT4CwHFIXgFtkWSFIaafpfZ6 vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0b6cf755-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:14 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213JqZfD017663;
 Thu, 3 Feb 2022 20:10:13 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0b6cf74w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:13 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213K8ZJo021753;
 Thu, 3 Feb 2022 20:10:13 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3e0nkhr9gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 20:10:13 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213KACir18940230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 20:10:12 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61A33BE063;
 Thu,  3 Feb 2022 20:10:12 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2222BE05A;
 Thu,  3 Feb 2022 20:10:10 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 20:10:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] target/ppc: 6xx: Critical exception cleanup
Date: Thu,  3 Feb 2022 17:09:50 -0300
Message-Id: <20220203200957.1434641-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203200957.1434641-1-farosas@linux.ibm.com>
References: <20220203200957.1434641-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2S1gBp0RUXeAIi8_tGEIwtOWF1NvpPdd
X-Proofpoint-GUID: 37UFavJ-MG6_IME66Zm7jaoNMAubSAZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030120
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

This only applies to the G2s, the other 6xx CPUs will not have this
vector registered.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d855a275ca..e27e1c3c70 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -596,20 +596,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
 
     switch (excp) {
     case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
-        switch (excp_model) {
-        case POWERPC_EXCP_40x:
-            srr0 = SPR_40x_SRR2;
-            srr1 = SPR_40x_SRR3;
-            break;
-        case POWERPC_EXCP_BOOKE:
-            srr0 = SPR_BOOKE_CSRR0;
-            srr1 = SPR_BOOKE_CSRR1;
-            break;
-        case POWERPC_EXCP_6xx:
-            break;
-        default:
-            goto excp_invalid;
-        }
         break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
         if (msr_me == 0) {
@@ -836,7 +822,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
                   powerpc_excp_name(excp));
         break;
     default:
-    excp_invalid:
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
         break;
     }
-- 
2.34.1


