Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6849EC75
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 21:27:11 +0100 (CET)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBMM-0005Cb-Uq
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 15:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB84-0006or-6F; Thu, 27 Jan 2022 15:12:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB7y-0007Bk-Qc; Thu, 27 Jan 2022 15:12:23 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RJt2w2020666; 
 Thu, 27 Jan 2022 20:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wr95AGwqw34piS/yGZdtZ1vTBdgXjuC4P1FSAcjPBF8=;
 b=VznpPTzU0FkkJb9CUMUV4iYf4VbqOHQkmM+WYDWRgd8/8FyZW2duZ5jep84M7L0ehp0a
 GciKDoTUYC2D8SuEbaBSpNd2TJZSRz8MvF0nDz2/hRgokzMp3ij6++AFVebPfil1NF9Z
 eYqqJ6N/uC9VeGIt9uA2egoUVbhwVqQX1U05VluuzUQwcZwQlx+IBU95KY/JHD3fZza1
 U4kiAm6atXZkZDIkF9lIImckAoszDBjxf0vjos5epWmkuQ4GLauEBCuSIYYS2NmsM83Y
 V7X7DHdMqOjvQGi+T1V0WcfQUfE+erBp9pau2c4jXngN6I37I+NJcglEK8cY8jed0G6y OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv1bw133w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:57 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RJtv4u024084;
 Thu, 27 Jan 2022 20:11:56 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv1bw133q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:56 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RK7utx021255;
 Thu, 27 Jan 2022 20:11:55 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3dr9jcvrse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:55 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20RKBsGg15663590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 20:11:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10BC2112063;
 Thu, 27 Jan 2022 20:11:54 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39010112062;
 Thu, 27 Jan 2022 20:11:51 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.129.51])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 20:11:50 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] target/ppc: 74xx: Set SRRs directly in exception code
Date: Thu, 27 Jan 2022 17:11:16 -0300
Message-Id: <20220127201116.1154733-9-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127201116.1154733-1-farosas@linux.ibm.com>
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TSntuC7jDxGtHEwaRQTW2TZbtsmOtgCE
X-Proofpoint-GUID: 6PvULGVyK3qbB2rx4Ix4dUc7fcNZ6sOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=576 spamscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

The 74xx does not have alternate/hypervisor Save and Restore
Registers, so we can set SRR0 and SRR1 directly.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b7921c0956..4e6bb87b70 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -556,7 +556,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1;
 
     if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -575,10 +574,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
      */
     new_msr = env->msr & ((target_ulong)1 << MSR_ME);
 
-    /* target registers */
-    srr0 = SPR_SRR0;
-    srr1 = SPR_SRR1;
-
     /*
      * Hypervisor emulation assistance interrupt only exists on server
      * arch 2.05 server or later.
@@ -731,10 +726,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
             cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
                       "no HV support\n", excp);
         }
-        if (srr0 == SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                      "no HV support\n", excp);
-        }
     }
 
     /*
@@ -746,10 +737,10 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     }
 
     /* Save PC */
-    env->spr[srr0] = env->nip;
+    env->spr[SPR_SRR0] = env->nip;
 
     /* Save MSR */
-    env->spr[srr1] = msr;
+    env->spr[SPR_SRR1] = msr;
 
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
-- 
2.34.1


