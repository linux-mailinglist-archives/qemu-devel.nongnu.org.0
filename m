Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F484481584
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 18:03:17 +0100 (CET)
Received: from localhost ([::1]:35184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2cM7-0006A8-Vr
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 12:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2cHK-0003gR-5a; Wed, 29 Dec 2021 11:58:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2cHI-00045r-Di; Wed, 29 Dec 2021 11:58:17 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGDZlF012808; 
 Wed, 29 Dec 2021 16:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=nA41Y0utFfoa1ol857Nyt3ticEI9LoCNQTJYxEUoMXg=;
 b=ekn8B9htKtfUujBDbUv2eNnjh3QBuJrWEgIwyUZcj+NN7ycDTgGHLW9g27Y38aeeZDvO
 mBmFHQ5eDGITvV4mF1ae2emyFmcWnBYwDO3DZwDMjOitRYvJPaZ6RSjd0R7Med9XAltD
 4xuda3jEBgIOkWJopjmQ+KkLwu7txGq3NWDCup8XBdE55QievpUo8mKiDL8zeYVRduNM
 5UIkuY7HTB1TkU597W7FrbLQdV+aos0COwojOEXlGWBbbdNpHq5OVWYVpJgtREeFaM6p
 nMunGAx7P5cAKOJs/WrE6cvG/lPccIP7ml4xgFEZnuthqmeu0ot55RnFFnQg39+6RQWo mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7uscu9kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:04 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BTGdFkM005200;
 Wed, 29 Dec 2021 16:58:03 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7uscu9kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:03 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGvf8a023142;
 Wed, 29 Dec 2021 16:58:03 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3d5txbbeaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:02 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BTGw2Hh26607902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Dec 2021 16:58:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3109AC05E;
 Wed, 29 Dec 2021 16:58:01 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F22BAAC059;
 Wed, 29 Dec 2021 16:57:59 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.90.107])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Dec 2021 16:57:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] target/ppc: powerpc_excp: Set alternate SRRs directly
Date: Wed, 29 Dec 2021 13:57:47 -0300
Message-Id: <20211229165751.3774248-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211229165751.3774248-1-farosas@linux.ibm.com>
References: <20211229165751.3774248-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0fKaukr_RMBpxqlff6QwmPmVnK0SZ7vP
X-Proofpoint-ORIG-GUID: rhIwO_Q-_8nlKFGkjf_HZzLQd15fFadQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-29_06,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=771
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112290088
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are currently only two interrupts that use alternate SRRs, so
let them write to them directly during the setup code.

No functional change intended.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f90e616aac..8b9c6bc5a8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -298,7 +298,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, asrr0, asrr1, lev = -1;
+    int srr0, srr1, lev = -1;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
                   " => %08x (%02x)\n", env->nip, excp, env->error_code);
@@ -319,8 +319,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     /* target registers */
     srr0 = SPR_SRR0;
     srr1 = SPR_SRR1;
-    asrr0 = -1;
-    asrr1 = -1;
 
     /*
      * check for special resume at 0x100 from doze/nap/sleep/winkle on
@@ -410,8 +408,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             /* FIXME: choose one or the other based on CPU type */
             srr0 = SPR_BOOKE_MCSRR0;
             srr1 = SPR_BOOKE_MCSRR1;
-            asrr0 = SPR_BOOKE_CSRR0;
-            asrr1 = SPR_BOOKE_CSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] = env->nip;
+            env->spr[SPR_BOOKE_CSRR1] = msr;
             break;
         default:
             break;
@@ -570,8 +569,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             /* FIXME: choose one or the other based on CPU type */
             srr0 = SPR_BOOKE_DSRR0;
             srr1 = SPR_BOOKE_DSRR1;
-            asrr0 = SPR_BOOKE_CSRR0;
-            asrr1 = SPR_BOOKE_CSRR1;
+
+            env->spr[SPR_BOOKE_CSRR0] = env->nip;
+            env->spr[SPR_BOOKE_CSRR1] = msr;
+
             /* DBSR already modified by caller */
         } else {
             cpu_abort(cs, "Debug exception triggered on unsupported model\n");
@@ -838,14 +839,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 
     vector |= env->excp_prefix;
 
-    /* If any alternate SRR register are defined, duplicate saved values */
-    if (asrr0 != -1) {
-        env->spr[asrr0] = env->nip;
-    }
-    if (asrr1 != -1) {
-        env->spr[asrr1] = msr;
-    }
-
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_BOOKE) {
         if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
-- 
2.33.1


