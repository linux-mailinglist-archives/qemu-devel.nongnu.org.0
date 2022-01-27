Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B2F49EC6B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 21:24:06 +0100 (CET)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBJN-0008EG-HU
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 15:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB85-0006ou-3t; Thu, 27 Jan 2022 15:12:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDB82-0007Bq-4D; Thu, 27 Jan 2022 15:12:24 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RK6P4u017223; 
 Thu, 27 Jan 2022 20:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PDqb9LIhDCW0cFp8Z2M7WKJOE75vtkDlgEIfDS12tQI=;
 b=X4zGisBIhw/yb17MsVr4Lh5Kd4P9pYcCQtOhOpCvueUjRU3S5MKYcPuUlc8WFYSW4YJF
 UvYQQiTOcWjdj3T7nWXkAMbL8egtMazNCgwVUVMDN0YrC47rfBgMX7h6ehDC/JoMCeav
 tlxBBav7YOTIVMQTilK3RHMR2fARUdf2NnGnzDS70mawePuiD/zF1YYUDenTLTAiwBRP
 nmlOfrDZ9mo9FFCP5i68iI30DtOfthUdPhgxxRQxDHqyBAZFIqbIyzObqNHq2JAAm2k7
 f+pZEKgg22853ZMspMtvACKJ3vBlGYoGTbOtQJrXiJs0gzYBoJ9saEYMviNpVq47gIzm 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv0f9t742-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:50 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RK8k1E024687;
 Thu, 27 Jan 2022 20:11:49 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv0f9t73p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:49 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RK7xQS021780;
 Thu, 27 Jan 2022 20:11:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3dr9jbjy3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 20:11:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20RKBlq437421368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 20:11:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FB43112063;
 Thu, 27 Jan 2022 20:11:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26EA6112062;
 Thu, 27 Jan 2022 20:11:44 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.129.51])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jan 2022 20:11:43 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] target/ppc: 74xx: System Call exception cleanup
Date: Thu, 27 Jan 2022 17:11:14 -0300
Message-Id: <20220127201116.1154733-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127201116.1154733-1-farosas@linux.ibm.com>
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oD0AAwHqcIZb8rpDrXYd8MJwDAt_X3Xs
X-Proofpoint-ORIG-GUID: chgcdm3p15KHWrchDcbqq15ywrCcVXvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=883 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270116
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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

Remove the BookE code and add a comment explaining why we need to keep
hypercall support even though this CPU does not have a hypervisor
mode.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index bb17b65dc0..396e25ed35 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -556,7 +556,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, lev = -1;
+    int srr0, srr1;
 
     if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -669,7 +669,8 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
         }
         break;
     case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
-        lev = env->error_code;
+    {
+        int lev = env->error_code;
 
         if ((lev == 1) && cpu->vhyp) {
             dump_hcall(env);
@@ -683,17 +684,21 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
          */
         env->nip += 4;
 
-        /* "PAPR mode" built-in hypercall emulation */
+        /*
+         * The Virtual Open Firmware (VOF) relies on the 'sc 1'
+         * instruction to communicate with QEMU. The pegasos2 machine
+         * uses VOF and the 74xx CPUs, so although the 74xx don't have
+         * HV mode, we need to keep hypercall support.
+         */
         if ((lev == 1) && cpu->vhyp) {
             PPCVirtualHypervisorClass *vhc =
                 PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
             vhc->hypercall(cpu->vhyp, cpu);
             return;
         }
-        if (lev == 1) {
-            new_msr |= (target_ulong)MSR_HVB;
-        }
+
         break;
+    }
     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
         break;
-- 
2.34.1


