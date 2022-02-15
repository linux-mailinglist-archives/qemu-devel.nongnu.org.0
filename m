Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74B94B7A33
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:07:54 +0100 (CET)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5zF-00009z-PH
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5b2-0004Cu-FW; Tue, 15 Feb 2022 16:42:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5az-0002cZ-Mn; Tue, 15 Feb 2022 16:42:52 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FLdSFr035122; 
 Tue, 15 Feb 2022 21:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u0CFVPH2hYRZt96HdmAyWptjT34BKyibSxSNy6+XDN4=;
 b=c9Z3FMDKBpZTPzHB62xfO+g4G56voHcz3/C5kctEU1MtB7AyFPFmomSrkmcBbcNj3bZe
 kVl+IVPdsxDWrU9UG+KUgmlsUbj4qW/EjILrhHmnsyn1Hws36PIJgcCgRWFA9oUXGGLH
 nSvGv5ugSKI7kLpwQWDf/Y/pkwG8yFLjtnmf8FuecDTVaiD9Zj9LdU6K3WGwCTVLvB0a
 PWstHrBaUkBcDbJiB5KIoUMZWPstoSgYf3Sn6L2iqZk5FrlSDST3HzFgijQvC9bQrJwa
 FZv5PU16JOPbdWYTXso7mTaFndl7cUG+TWTZkKDAQ4Y82cgyFIOkhOWPXL+kqhoPcwjd HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e8c9udg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:42 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLP6gi040227;
 Tue, 15 Feb 2022 21:42:42 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8e8c9ud6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:42 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLNqC2030888;
 Tue, 15 Feb 2022 21:42:41 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3e64hc2u1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLgd2N29884774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:39 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0B0CBE053;
 Tue, 15 Feb 2022 21:42:39 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5130CBE054;
 Tue, 15 Feb 2022 21:42:38 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/27] target/ppc: cpu_init: Rename register_ne_601_sprs
Date: Tue, 15 Feb 2022 18:41:43 -0300
Message-Id: <20220215214148.1848266-23-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bhgfVOnmt4bU5JwGiie-Teuy-Pl6RPqs
X-Proofpoint-GUID: NrOJIQ17zFbwqvgsYuTgQdQVTXXWMe5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150122
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

The important part of this function is that it applies to non-embedded
CPUs, not that it also applies to the 601. We removed support for the
601 anyway, so rename this function.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 3e687d0301..621812d079 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -241,8 +241,7 @@ static void register_generic_sprs(PowerPCCPU *cpu)
                  0x00000000);
 }
 
-/* SPR common to all non-embedded PowerPC, including 601 */
-static void register_ne_601_sprs(CPUPPCState *env)
+static void register_non_embedded_sprs(CPUPPCState *env)
 {
     /* Exception processing */
     spr_register_kvm(env, SPR_DSISR, "DSISR",
@@ -3022,7 +3021,7 @@ POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
 
 static void init_proc_G2(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_G2_sprs(env);
 
@@ -3732,7 +3731,7 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
 /* Non-embedded PowerPC                                                      */
 static void init_proc_603(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_603_sprs(env);
 
@@ -3872,7 +3871,7 @@ POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
 
 static void init_proc_604(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_604_sprs(env);
 
@@ -3971,7 +3970,7 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
 
 static void init_proc_740(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
     /* Thermal management */
@@ -4027,7 +4026,7 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
 
 static void init_proc_750(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
 
@@ -4092,7 +4091,7 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
 
 static void init_proc_750cl(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
 
@@ -4277,7 +4276,7 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
 
 static void init_proc_750cx(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
 
@@ -4345,7 +4344,7 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
 
 static void init_proc_750fx(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
 
@@ -4417,7 +4416,7 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
 
 static void init_proc_750gx(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
 
@@ -4489,7 +4488,7 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
 
 static void init_proc_745(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
     register_755_sprs(env);
@@ -4593,7 +4592,7 @@ POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
 
 static void init_proc_7400(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4665,7 +4664,7 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
 
 static void init_proc_7410(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4744,7 +4743,7 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
 
 static void init_proc_7440(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4844,7 +4843,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
 
 static void init_proc_7450(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -4966,7 +4965,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
 
 static void init_proc_7445(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5095,7 +5094,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
 
 static void init_proc_7455(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5226,7 +5225,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
 
 static void init_proc_7457(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -5377,7 +5376,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
 
 static void init_proc_e600(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_sdr1_sprs(env);
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
@@ -6200,7 +6199,7 @@ static void init_tcg_pmu_power8(CPUPPCState *env)
 
 static void init_proc_book3s_common(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
+    register_non_embedded_sprs(env);
     register_usprg3_sprs(env);
     register_book3s_altivec_sprs(env);
     register_book3s_pmu_sup_sprs(env);
-- 
2.34.1


