Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FC44B8E5D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:42:32 +0100 (CET)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNNv-0000D5-NB
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:42:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN73-0001bn-5J; Wed, 16 Feb 2022 11:25:05 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6y-0001DB-UB; Wed, 16 Feb 2022 11:25:04 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GFbJp4024964; 
 Wed, 16 Feb 2022 16:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=83Y/oUWG0/7IqlBnzIltE+NyziWW6aSTsGgbnFc42aY=;
 b=OV5eofipTBv3uxT45cm3srx+Zyr0csnGZhVHAjU2/K2/MxaAI5uw+Xr859ogQ1TxMRlj
 /fMJnU6KEuv5QhQb3IwFZz3loFgY40pPbj5cZS81U/GADzbunWleWSumwDcPU6ac6DQD
 5WaanwagdFMV5Q2VnD2n+Ap6uF5GKtky7ky9JWELX+sbD4xVBmdTW7LIWkWgWyvmZGKV
 R/a5KcdKAzpf23LdH1JHDKnhZKAD8ueCns9uoZ+SHcSEnfqQ83j5MFZlTZlzqoFHvByn
 P66v6gNCQ1m+X/P3xD38bz8tWDLAMGHfyBWqBYzgKCTLTkTSVnEAGykOVWwrj5WD9wUm QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e912ce9kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:54 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GFeZuu003224;
 Wed, 16 Feb 2022 16:24:53 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e912ce9kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:53 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCaQJ009722;
 Wed, 16 Feb 2022 16:24:52 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 3e64hbksv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGOpgI33292682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:24:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CB7A78070;
 Wed, 16 Feb 2022 16:24:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEB0C78066;
 Wed, 16 Feb 2022 16:24:49 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:24:49 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/27] target/ppc: cpu_init: Decouple 74xx SPR registration
 from 7xx
Date: Wed, 16 Feb 2022 13:24:08 -0300
Message-Id: <20220216162426.1885923-10-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oAF6rZx4IKGaRm4_N5TgU9zEi-2usZSW
X-Proofpoint-GUID: tmngkann_VlE8JqAhtaYsaEmUWG_ote1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

We're considering these two to be from different CPU families, so
duplicate some code to keep them separate.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
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


