Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6387E47B344
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:54:29 +0100 (CET)
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNno-0007SR-Dy
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNFv-0002GC-3j; Mon, 20 Dec 2021 13:19:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNFt-0006hO-85; Mon, 20 Dec 2021 13:19:26 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKGjJBT029724; 
 Mon, 20 Dec 2021 18:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MBaI6jL64OdNT0oUQwYQInrDNvJFooTTbui+6Yr8NkE=;
 b=hF9oBS5c4aYdgG8njlBooZX512e+YU8WXnSAH2QFh5croh2C4tsZY9ESzFw8vJ0+k4wT
 mmWNsjq2UWAkbxuSmGL1gqLTCgAXmeCrlcogQfxL4z5aBn6opJvtxVkbOzpNuB5xl9Lr
 T/jY/XIK3cMkUOvSH2TDyP+vEgnAENhGg520c5KqWCHg/4MjjjgyYwGSkp6cBC80o9yl
 h4wZ15rQlgiVcbQK9W6TxNVdyvP1dtDjpVkw2QGiVklAyQH8j35BCwtY8Y093y7/cp2c
 y6hJtVWONSuuQBnn7JpqOiyN+dHAMpOpp5dwpgLHxD1pr0M3y7My0h+3t8WLfgGFiNqN rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4e2nt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:18 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKIFWU0007316;
 Mon, 20 Dec 2021 18:19:18 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4e2nsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:18 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIE7Ta014694;
 Mon, 20 Dec 2021 18:19:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 3d179a2116-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:16 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJGZD33423850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:16 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A88EC6062;
 Mon, 20 Dec 2021 18:19:16 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83C91C6055;
 Mon, 20 Dec 2021 18:19:14 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:14 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 02/12] target/ppc: powerpc_excp: Set vector earlier
Date: Mon, 20 Dec 2021 15:18:53 -0300
Message-Id: <20211220181903.3456898-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VWFaBSPmVpFr-qcNcT2w9YbMnJahNvCk
X-Proofpoint-GUID: emhG-Y7sh1dKrWDVBpCHNj32EkHAmfga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 mlxlogscore=775 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200101
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

None of the interrupt setup code touches 'vector', so we can move it
earlier in the function. This will allow us to later move the System
Call Vectored setup that is on the top level into the
POWERPC_EXCP_SYSCALL_VECTORED code block.

This patch also moves the verification for when 'excp' does not have
an address associated with it. We now bail a little earlier when that
is the case. This should not cause any visible effects.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 8b9c6bc5a8..14fd0213a0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -352,6 +352,14 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     }
 #endif
 
+    vector = env->excp_vectors[excp];
+    if (vector == (target_ulong)-1ULL) {
+        cpu_abort(cs, "Raised an exception without defined vector %d\n",
+                  excp);
+    }
+
+    vector |= env->excp_prefix;
+
     switch (excp) {
     case POWERPC_EXCP_NONE:
         /* Should never happen */
@@ -831,14 +839,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     }
 #endif
 
-    vector = env->excp_vectors[excp];
-    if (vector == (target_ulong)-1ULL) {
-        cpu_abort(cs, "Raised an exception without defined vector %d\n",
-                  excp);
-    }
-
-    vector |= env->excp_prefix;
-
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_BOOKE) {
         if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
-- 
2.33.1


