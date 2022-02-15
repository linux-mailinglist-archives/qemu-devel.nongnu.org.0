Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B304B7A06
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:54:11 +0100 (CET)
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5ly-00033E-4p
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5ae-0003dL-3k; Tue, 15 Feb 2022 16:42:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5ab-0002Vy-60; Tue, 15 Feb 2022 16:42:26 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FKDYl9014684; 
 Tue, 15 Feb 2022 21:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rRR7NnJ4wb8x7sVDv0R2ZbuF3DULiq8WUZ1NuI71194=;
 b=UVUeEWebpHiaayP6J3LyDtOVHdWiC2lxqY5pQyxjlTlHJNryV5jQrE4ZbZNSZdNhiw+U
 M3ENC2P7v/WUeV/OuucwCKDatCQAWmuUVfyMPHiv0R25Hza4AGfB131Ssze4NsGTSW4K
 lJMbPA7cH11y6Bn8w0bLqO3CY2W9C1Wk2GOD6qF0Azi15CuEQ2nI8h1vxHFVn7i8cP+K
 3PuUAiDQWdE1wkpbo5X5+cskF+r/YJL690xf4acMP692eDqlOhYDuwlRrxBynG5G2nCZ
 9CKVCqiRgS9fkgVBgwkg4Xw4svk8+xy3/yliSTaby0/Kf9lkg8/jngfSu0UxcLANz8JI ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8k1aa4fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:18 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLgIIb029851;
 Tue, 15 Feb 2022 21:42:18 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8k1aa4fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:18 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLMWmb000363;
 Tue, 15 Feb 2022 21:42:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3e64hbjuhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:16 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLgFI326870204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:15 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AEA1BE053;
 Tue, 15 Feb 2022 21:42:15 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C18CBE058;
 Tue, 15 Feb 2022 21:42:13 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:13 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/27] target/ppc: cpu_init: Decouple 74xx SPR registration
 from 7xx
Date: Tue, 15 Feb 2022 18:41:30 -0300
Message-Id: <20220215214148.1848266-10-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tWDZ2epdO2zMxr5qNC1Sn3ekya8rYI_A
X-Proofpoint-ORIG-GUID: ToxjzFcLGme9byY7LyVFRL1kH5HeVyk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=951 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150122
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

We're considering these two to be from different CPU families, so
duplicate some code to keep them separate.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 107 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 91 insertions(+), 16 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6a367f2bbc..79cd14d49c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -803,6 +803,97 @@ static void register_G2_sprs(CPUPPCState *env)
 
 static void register_74xx_sprs(CPUPPCState *env)
 {
+    /* Breakpoints */
+    spr_register_kvm(env, SPR_DABR, "DABR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DABR, 0x00000000);
+
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Cache management */
+    spr_register(env, SPR_ICTC, "ICTC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Performance monitors */
+    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC1, "PMC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC2, "PMC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC3, "PMC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC4, "PMC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_SIAR, "SIAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UMMCR0, "UMMCR0",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UMMCR1, "UMMCR1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC1, "UPMC1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC2, "UPMC2",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC3, "UPMC3",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC4, "UPMC4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_USIAR, "USIAR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* External access control */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
     /* Processor identification */
     spr_register(env, SPR_PIR, "PIR",
                  SPR_NOACCESS, SPR_NOACCESS,
@@ -4644,8 +4735,6 @@ static void init_proc_7400(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
 
@@ -4718,8 +4807,6 @@ static void init_proc_7410(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
 
@@ -4799,8 +4886,6 @@ static void init_proc_7440(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
 
@@ -4901,8 +4986,6 @@ static void init_proc_7450(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* Level 3 cache control */
@@ -5025,8 +5108,6 @@ static void init_proc_7445(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* LDSTCR */
@@ -5156,8 +5237,6 @@ static void init_proc_7455(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* Level 3 cache control */
@@ -5289,8 +5368,6 @@ static void init_proc_7457(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* Level 3 cache control */
@@ -5442,8 +5519,6 @@ static void init_proc_e600(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
 
-- 
2.34.1


