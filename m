Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47B04A9E58
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:51:28 +0100 (CET)
Received: from localhost ([::1]:41090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2k3-0007QC-Tz
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:51:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2UW-0000jU-4O; Fri, 04 Feb 2022 12:35:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11960
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2UR-000161-CS; Fri, 04 Feb 2022 12:35:22 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214FTCAb000870; 
 Fri, 4 Feb 2022 17:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=b8O3maDFTW+i5MxJtSl7zO81Ra+E75WCJdrcGKl/1zo=;
 b=Tf4tPXhG/E0Pc6euh6ATGf7EtgJ8CL7Zd4fiR42wu6KEstnOpkUaZQu+8PzRmi64r09M
 EAO0WXHexeBHTruiHdmLHy4eVGiq+GXUlq8isOYMFmaRYGo20ZpKixgY5g9UeJSBOQnT
 wfvSbOnTvFAYITq32nVmE2eCb3tlmvPrPyAJe6G7iTH08zIgDrxuq47isDtj1ivgusVk
 GcfXrNKpiLAXq191r27d3NEI2fhBal3CG+Q+rNfPix5FR56M8EJ5Pfd8zlV7watCXEbL
 Vw8f4mHrr/cIlUcpj2Jy9l/f13A5BWjXP+3MQ7CJP4r5ePj13/gGwLK7+aD7nXL3X0Wp Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qxg2x2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:56 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214H9Aka016071;
 Fri, 4 Feb 2022 17:34:56 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qxg2x20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:56 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214HSwvh031815;
 Fri, 4 Feb 2022 17:34:55 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3e0r0ru31n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:34:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214HYsN223921002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 17:34:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DDD2AE06B;
 Fri,  4 Feb 2022 17:34:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C0FAAE060;
 Fri,  4 Feb 2022 17:34:52 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.79.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 17:34:51 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/10] target/ppc: 7xx: External interrupt cleanup
Date: Fri,  4 Feb 2022 14:34:25 -0300
Message-Id: <20220204173430.1457358-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204173430.1457358-1-farosas@linux.ibm.com>
References: <20220204173430.1457358-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fspG01M0FZviMQYnOm2wyGIOo5eTmC5h
X-Proofpoint-ORIG-GUID: TWkyh29kcFvne7VttCC7vhnPE2iNVBvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=976 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

There is no MSR_HV in the 7xx so remove the LPES0 handling.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 4996b96616..5e2c2aa544 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -815,44 +815,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
         msr |= env->error_code;
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                           */
-    {
-        bool lpes0;
-
-        cs = CPU(cpu);
-
-        /*
-         * Exception targeting modifiers
-         *
-         * LPES0 is supported on POWER7/8/9
-         * LPES1 is not supported (old iSeries mode)
-         *
-         * On anything else, we behave as if LPES0 is 1
-         * (externals don't alter MSR:HV)
-         */
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
-        }
-
-        if (!lpes0) {
-            new_msr |= (target_ulong)MSR_HVB;
-            new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
-            srr0 = SPR_HSRR0;
-            srr1 = SPR_HSRR1;
-        }
-        if (env->mpic_proxy) {
-            /* IACK the IRQ on delivery */
-            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
-        }
         break;
-    }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
         /* Get rS/rD and rA from faulting opcode */
         /*
-- 
2.34.1


