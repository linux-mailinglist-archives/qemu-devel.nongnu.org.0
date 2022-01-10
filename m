Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A7489F2E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:26:47 +0100 (CET)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zNW-0002ZD-HG
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:26:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zDP-0000aC-Nh; Mon, 10 Jan 2022 13:16:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n6zDL-0002Wu-HX; Mon, 10 Jan 2022 13:16:18 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AH1CML027219; 
 Mon, 10 Jan 2022 18:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hNH2EvFoWoQOZF2y1UT52RDLSeogdZYSLiUq8KzUFas=;
 b=KWIm2f5oQELkGIhGWWI+vMmsw7zD5pschgLA/ik1jKFbpiVZFMGJRt6EfvO1jbPMxRA8
 Ydr0p5O+qE+fD52sWulGBTsI8I5mwl4qpKN1qa201gIgmczFPudZfYAlM5T0uib++61Z
 V+W6XvujZ1crAyYclc9wREH5ffwdZbDHMIQU9kkw3ffmiQ/E39Icu7Lpf9CzbZOR6ZnB
 YvbHP1PF8VfiZVvjs9976OD2I+G/4kDk1TD1LE/nD4Bi33KRdTyQALrM6ppZk/MN3go1
 immsGShb0F27qDEPhpT90NZNbfZWEdqjNVRhwmZrHmsoQywrO5PljhZebR1sEMFEhI8R dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfmpn0wqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:16:07 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AIG78d010139;
 Mon, 10 Jan 2022 18:16:07 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfmpn0wq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:16:07 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AI8Dft015333;
 Mon, 10 Jan 2022 18:16:06 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3df289jh30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:16:05 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AIG52j31916378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 18:16:05 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1756E7806E;
 Mon, 10 Jan 2022 18:16:05 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 557397806B;
 Mon, 10 Jan 2022 18:16:03 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.79.41])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 18:16:03 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] target/ppc: 405: Critical exceptions cleanup
Date: Mon, 10 Jan 2022 15:15:43 -0300
Message-Id: <20220110181546.4131853-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110181546.4131853-1-farosas@linux.ibm.com>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7Rcq70LLzfwQuqGwR6HRLuihJpruiBAV
X-Proofpoint-ORIG-GUID: Xw6VkIWh8ku5FuLWd3wPjAB5ohPE55wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_07,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=917
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In powerpc_excp_40x the Critical exception is now for 405 only, so we
can remove the BookE and G2 blocks.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 1d997c4d6b..fecf4d5a4e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -431,20 +431,8 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
 
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
-        case POWERPC_EXCP_G2:
-            break;
-        default:
-            goto excp_invalid;
-        }
+        srr0 = SPR_40x_SRR2;
+        srr1 = SPR_40x_SRR3;
         break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
         if (msr_me == 0) {
@@ -698,7 +686,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
                   powerpc_excp_name(excp));
         break;
     default:
-    excp_invalid:
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
         break;
     }
-- 
2.33.1


