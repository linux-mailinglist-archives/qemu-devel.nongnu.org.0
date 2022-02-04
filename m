Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68934A9DE1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:42:43 +0100 (CET)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2bX-0003qI-P0
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:42:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2UW-0000jT-5U; Fri, 04 Feb 2022 12:35:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65522
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nG2US-00016O-R6; Fri, 04 Feb 2022 12:35:23 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 214H6PwY011613; 
 Fri, 4 Feb 2022 17:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Kk8yWESsbt3qdtpwzc37jeW70Mk9iwzLlwzU3OEl8hg=;
 b=Pd3+rn1gmM0cSuy8ykUBMc2AeQKh8l1Rknts8Laf67ya5Aqs9IzxnIDji+4IohGPQSHR
 cgS4ICba5jAF9FVFANsAA9Ygz/pItEhGCnDNd+tuBboFz8FsKFfe7rrydyIr5n53oPJj
 1rjz3HsK0yZn1kmnq332ei5YoFWX7pja+12Gl0TLxjvDxvNM3pRQTMEYvgfinWC8EEKp
 WV+kV8Fwyaz8KvjPKSskmRshZv85P5QqmEvgvZ0Z0sbcMSIRGpKVB0VJHM90X0spMKFY
 NqM2KYFK8hCnDXwUnVydM3r3inWt+Zy3thK8oM/nE2oW+PKD2q9NwBUFGPoapuMH73+3 oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qxg2x49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:35:02 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 214H0F1J021750;
 Fri, 4 Feb 2022 17:35:01 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qxg2x3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:35:01 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214HSdqD003409;
 Fri, 4 Feb 2022 17:35:01 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3e0r0kydae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 17:35:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214HZ0jR26804514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 17:35:00 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BC2EAE060;
 Fri,  4 Feb 2022 17:35:00 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 208D3AE06A;
 Fri,  4 Feb 2022 17:34:58 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.79.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 17:34:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/10] target/ppc: 7xx: System Call exception cleanup
Date: Fri,  4 Feb 2022 14:34:27 -0300
Message-Id: <20220204173430.1457358-8-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204173430.1457358-1-farosas@linux.ibm.com>
References: <20220204173430.1457358-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ayl3gkQLs_PdINbJCyxxUMAscbqYr4a1
X-Proofpoint-ORIG-GUID: 6OEAEk4uYhnD8puS7e2TJVxFqNoQ3eFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=940 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0
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

Remove the BookE code and add a comment explaining why we need to keep
hypercall support even though this CPU does not have a hypervisor
mode.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 8f810f7de5..14a4eea9d6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -747,7 +747,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     CPUPPCState *env = &cpu->env;
     int excp_model = env->excp_model;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, lev = -1;
+    int srr0, srr1;
 
     if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -860,9 +860,10 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
         }
         break;
     case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
-        lev = env->error_code;
+    {
+        int lev = env->error_code;
 
-        if ((lev == 1) && cpu->vhyp) {
+        if (lev == 1 && cpu->vhyp) {
             dump_hcall(env);
         } else {
             dump_syscall(env);
@@ -874,17 +875,21 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
          */
         env->nip += 4;
 
-        /* "PAPR mode" built-in hypercall emulation */
-        if ((lev == 1) && cpu->vhyp) {
+        /*
+         * The Virtual Open Firmware (VOF) relies on the 'sc 1'
+         * instruction to communicate with QEMU. The pegasos2 machine
+         * uses VOF and the 7xx CPUs, so although the 7xx don't have
+         * HV mode, we need to keep hypercall support.
+         */
+        if (lev == 1 && cpu->vhyp) {
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


