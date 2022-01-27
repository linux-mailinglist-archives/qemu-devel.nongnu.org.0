Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135A649EC69
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 21:23:01 +0100 (CET)
Received: from localhost ([::1]:36706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBIJ-0006dI-Tb
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 15:23:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB85-0006ov-AQ; Thu, 27 Jan 2022 15:12:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6156
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB82-0007B1-2K; Thu, 27 Jan 2022 15:12:25 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RJt1bs017255; 
 Thu, 27 Jan 2022 20:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bQ1mi3Y78IwBqi5MSVOSHQ2h6vd7kJPaA88um9lSINo=;
 b=gntfmhgG7kwgZDjQdsZumuuQZue5vckqiqnn8ZVFsEg+PWs53qQdFN4R/CPKz2dK8Q2d
 bJpTFmlqd5VZF8XCpFtaHXyquE2cmkDYJFFr34IexojbDHK68do86l16rRffkwVPThZ6
 ETPST6rX1EKxpaOvcQm7bT4mVAr4wE9xl3JxMQVhdjQjsYd1ZweyQfyFZlf7On7vvnAx
 238HPOUpA2IhkcX6FSsSUVh1msAQS64t4IbPtu3QZDK6A5CN/qR2BS/J0walZ9r7tmeo
 hw+zYA1ZhQGRC+iJTrWGlJaAk+hJ2geEX+JafZVAR2fAQLTMoEZs9vgZPcSO/gy+vV6Y yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3duumcgybm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:42 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RJu0wb020052;
 Thu, 27 Jan 2022 20:11:42 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3duumcgyb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:42 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RK7uHD021235;
 Thu, 27 Jan 2022 20:11:41 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3dr9jcvrmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:41 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20RKBeX040108344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 20:11:40 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1334112062;
 Thu, 27 Jan 2022 20:11:39 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E81A112067;
 Thu, 27 Jan 2022 20:11:37 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.129.51])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 20:11:36 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] target/ppc: 74xx: External interrupt cleanup
Date: Thu, 27 Jan 2022 17:11:12 -0300
Message-Id: <20220127201116.1154733-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127201116.1154733-1-farosas@linux.ibm.com>
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9ocFhAUaxyOz7H1DK8dsbsA-lDljBEwC
X-Proofpoint-ORIG-GUID: 5Vk9G_owMs_U6Y4_fl_MV2Hu5oe2dFr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201270116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 74xx don't have MSR_HV so all the LPES0 logic can be removed.

Also remove the BookE IRQ code.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 0d8c66b98f..b9a1d7ae7e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -555,7 +555,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
-    int excp_model = env->excp_model;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev = -1;
 
@@ -625,44 +624,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
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


