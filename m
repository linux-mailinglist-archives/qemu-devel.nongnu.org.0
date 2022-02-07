Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE6F4AC92C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:08:15 +0100 (CET)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH9My-0005of-Kh
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nH8nA-0003of-Iw; Mon, 07 Feb 2022 13:31:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nH8n2-0001Gm-7c; Mon, 07 Feb 2022 13:31:11 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217IQ5Zb000494; 
 Mon, 7 Feb 2022 18:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=n9wNZT22e8ELs/2Jjawe+ZRX/JhjdFFDOnwCrYT2cuM=;
 b=M36H4QlENcdo9V6KQSrpheikQyWR6EffVCHqElNlXrZ0qzZ/5z41Q9z0rTazJHg0jXvu
 BvCbHhmyozMGiMjItin0sZW58b75gvg0ynKnAkj2ArCWLj4rC6hfXAvJzMna3yNe0hP9
 Ko+lXovPTvVR8NykqQGgPCxyeGXRxrf7t7qNEFL5apQyTp/O2YG6oENs5b71YTg9fZQw
 V6OXfwNiS5NFRtmMPvT+JzxMN1eIccm+k9UkWGigjX0tG7y4cwa32ttK295B2Rq5Nt4s
 UlUzjNrDFb7Qun0B91tWv/LQYEFLia3GbywuNWk7plAv19qon6llc+g8MdzoYjjOkB6c 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e2319bpgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:50 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 217IRDfX013185;
 Mon, 7 Feb 2022 18:30:50 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e2319bpg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:49 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217I7MI1007742;
 Mon, 7 Feb 2022 18:30:49 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3e1gvakuvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:49 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217IUlXf21102898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 18:30:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B42A7BE068;
 Mon,  7 Feb 2022 18:30:47 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 308F9BE04F;
 Mon,  7 Feb 2022 18:30:46 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.16.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 18:30:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/ppc: powerpc_excp: Move common code to the caller
 function
Date: Mon,  7 Feb 2022 15:30:34 -0300
Message-Id: <20220207183036.1507882-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207183036.1507882-1-farosas@linux.ibm.com>
References: <20220207183036.1507882-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: q53cSpXa3-4QVyjY5QQC0McFZrBUemfN
X-Proofpoint-GUID: JPwYIqtroMGOKQbon0QxPkQ6sf4EzS6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=906 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202070111
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Make the cpu-specific powerpc_excp_* functions a bit simpler by moving
the bounds check and logging to powerpc_excp.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 57 +++++++---------------------------------
 1 file changed, 9 insertions(+), 48 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c6646503aa..206314aaa2 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -396,14 +396,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
     target_ulong msr, new_msr, vector;
     int srr0, srr1;
 
-    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
 
@@ -554,14 +546,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
 
-    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
 
@@ -746,14 +730,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
 
-    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
 
@@ -926,14 +902,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
 
-    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
 
@@ -1121,14 +1089,6 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     target_ulong msr, new_msr, vector;
     int srr0, srr1;
 
-    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
-                  excp, env->error_code);
-
     msr = env->msr;
 
     /*
@@ -1348,14 +1308,6 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     target_ulong msr, new_msr, vector;
     int srr0, srr1, lev = -1;
 
-    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
-        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
-                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
-                  excp, env->error_code);
-
     /* new srr1 value excluding must-be-zero bits */
     msr = env->msr & ~0x783f0000ULL;
 
@@ -1642,8 +1594,17 @@ static inline void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 
 static void powerpc_excp(PowerPCCPU *cpu, int excp)
 {
+    CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
+    if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
+        cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
+    }
+
+    qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
+                  " => %s (%d) error=%02x\n", env->nip, powerpc_excp_name(excp),
+                  excp, env->error_code);
+
     switch (env->excp_model) {
     case POWERPC_EXCP_40x:
         powerpc_excp_40x(cpu, excp);
-- 
2.34.1


