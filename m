Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7284B7A31
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:06:44 +0100 (CET)
Received: from localhost ([::1]:55166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5y7-0004gf-Op
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:06:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5b1-00049e-7v; Tue, 15 Feb 2022 16:42:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5ay-0002bj-FO; Tue, 15 Feb 2022 16:42:50 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FLNdKO029466; 
 Tue, 15 Feb 2022 21:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=k/6ZwTyFTGlK0plkg+OIl5dC+w/zswjLEdYnQHEdtB8=;
 b=s0lWeThznTg5vlqYXzNSXwqgUGIYSQA1Kfy7xkGvVip0PvnvJ4T894THLnpLQ9Kqa+Fi
 da+A55oGRY5vdsAlba5YY7HROkqolLP9gcAR6/nrXlRf9Nmr+oEOHTCBov/t2jSEG70N
 gGxBDBQWLG2TmXALLD7gAXnu4eqqj8tiEerY7ivNVWHRyRilMRYetEfyDedau2IhW0Xs
 YGl3cXHnCFO668joOJHeGagXrto78lsn8vNH3mpWm0D1+/k7LdZCFTJXYNV3muVqtr8U
 1LMRX8Uf8XYnRNdU2VUCtu4cjSCQjHohZSti3yFhvHklZQpCeZvAadhrGsOQnm5nfIex VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8m2409ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:36 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLX1CV022836;
 Tue, 15 Feb 2022 21:42:35 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8m2409c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:35 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLNQUU003714;
 Tue, 15 Feb 2022 21:42:34 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3e877fhbe2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:34 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLgX6n23200150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:33 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A16EDBE051;
 Tue, 15 Feb 2022 21:42:33 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CC90BE053;
 Tue, 15 Feb 2022 21:42:32 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:31 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/27] target/ppc: cpu_init: Reuse init_proc_604 for the 604e
Date: Tue, 15 Feb 2022 18:41:40 -0300
Message-Id: <20220215214148.1848266-20-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nU3o5FIl2StTuqIz3kFVaBuKosa5Phgk
X-Proofpoint-ORIG-GUID: T71FrpIC5ndXlHo8byNsRk_Zj6UO_B9q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=910 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
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

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 8fbd205699..32f99373dc 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -3926,18 +3926,8 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
 
 static void init_proc_604E(CPUPPCState *env)
 {
-    register_ne_601_sprs(env);
-    register_sdr1_sprs(env);
-    register_604_sprs(env);
+    init_proc_604(env);
     register_604e_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    init_excp_604(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
 }
 
 POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
-- 
2.34.1


