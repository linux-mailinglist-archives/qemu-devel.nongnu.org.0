Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6B49CFFA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:48:22 +0100 (CET)
Received: from localhost ([::1]:58554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClT2-0007so-Uy
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:48:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nClNX-0004uC-Gd; Wed, 26 Jan 2022 11:42:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nClNV-0005AG-2e; Wed, 26 Jan 2022 11:42:39 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QGNex4004449; 
 Wed, 26 Jan 2022 16:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1LQ1hBdQSyeg6Kzwgm5QsXUbwY1HpoJSnEgh0YK7uHU=;
 b=Oy5Sq4Cd/YKPMzwxpjQEmbX8IXPckGVbiTMnokkmy5iizy1C+8U6gii3+gkU3KiV/2Le
 1PwfadKY7ppjco6/MKjXVZU5K7ERTSBqgDg7YPWLuHhDATg5H7v/1kflkv21Oremc/h+
 yzx7ToW3OuhF2i+UUgsKxYOj4OxmLNBvmfRO9JViHMgyvjvCe/lWGk9aGaJZHSELDR2+
 pj76Xpc4Lja4yh1UCaxBeYk6ZGOOopaJEI67gr4WO/aDmTQWRKzariG0ZgZ2jz//MeAv
 vBYhSbJr/rLtl886LJqOUMG+Il93RvPLS9krFii3Nh2tQakyz+x/O/0lD8KclW3YWheD yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du89maw92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 16:42:28 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20QGOQX0009744;
 Wed, 26 Jan 2022 16:42:28 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3du89maw8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 16:42:28 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20QGaX76008379;
 Wed, 26 Jan 2022 16:42:27 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3dr9jawujf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 16:42:27 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20QGgQH926214822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:42:26 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E69437805F;
 Wed, 26 Jan 2022 16:42:25 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39C647805C;
 Wed, 26 Jan 2022 16:42:24 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.99.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 26 Jan 2022 16:42:23 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] target/ppc: 74xx: Set SRRs directly in exception code
Date: Wed, 26 Jan 2022 13:42:00 -0300
Message-Id: <20220126164200.1048677-9-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126164200.1048677-1-farosas@linux.ibm.com>
References: <20220126164200.1048677-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vh2LT-VO1hsgZAM-pPoi_0AQUotKXHnR
X-Proofpoint-ORIG-GUID: AHlnqs3icKV66okfVGggEK1AXdb2Vbg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_06,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=625
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260103
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
Cc: mark.cave-ayland@ilande.co.uk, danielhb413@gmail.com, qemu-ppc@nongnu.org,
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
index 9d4ee7f928..087257462a 100644
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
@@ -709,10 +704,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
             cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
                       "no HV support\n", excp);
         }
-        if (srr0 == SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                      "no HV support\n", excp);
-        }
     }
 
     /*
@@ -724,10 +715,10 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
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


