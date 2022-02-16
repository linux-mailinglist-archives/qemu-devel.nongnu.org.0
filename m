Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BFE4B8E9B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:54:56 +0100 (CET)
Received: from localhost ([::1]:44318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNZv-0006cv-A7
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:54:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7n-0003Hz-Gt; Wed, 16 Feb 2022 11:25:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7l-0001Ym-5U; Wed, 16 Feb 2022 11:25:50 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGHM2f021467; 
 Wed, 16 Feb 2022 16:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+Ae9dAr0LuU2wBowymQ6kafpjbu5mCUpYQs5s8ldHAs=;
 b=q0kjRDUmMrkBPP47nv5SYuCLjXQOic580Hb3KdT+cZ7K+cN4z5eXZDwhpr/CzYJ2eBml
 zrcrjdv/N9sU5q+OH4J9MtM2ZAUOO3hTe+aK2okxRuKNXy+nhNboC3hwl7ajsG3IwK/u
 z7vjwQreYS+vOUinKgy3Msmxcn9i/vifgCL7wF8n/vGbbKkrrV3V41X+NgI6U7QlFrKE
 0toE291xFyi+r5L7orjNAHyEqj1N/W6HGCqD1xu9JLSbH1IPsvQ5IY9BCM7BS/W8sPKt
 zMoz4kLj+zutgYNUfPfQ81KKn1Hvx/MoiqKCRRryL9RNaurRna6SR8xCFLkXJ+ZyWGcK kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94nj842a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:17 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGIoTV023227;
 Wed, 16 Feb 2022 16:25:17 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94nj841w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:17 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCKeZ027199;
 Wed, 16 Feb 2022 16:25:15 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3e64hbkq9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:15 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGPE9034800058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:25:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E94578068;
 Wed, 16 Feb 2022 16:25:14 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 257D77806B;
 Wed, 16 Feb 2022 16:25:13 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:25:12 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/27] target/ppc: cpu_init: Rename register_ne_601_sprs
Date: Wed, 16 Feb 2022 13:24:20 -0300
Message-Id: <20220216162426.1885923-22-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I4LQhIoVYVy9NkofPOL9vjysM8B_y73w
X-Proofpoint-ORIG-GUID: OtKoOyCS2kEF6ipDXvmp4iSlzamQlEEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160095
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6827160278..f464ad64fd 100644
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
     register_745_sprs(env);
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


