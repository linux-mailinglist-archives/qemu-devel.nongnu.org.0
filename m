Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8954838BB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:13:02 +0100 (CET)
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VZd-00051Y-AD
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:13:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VV5-0004s4-QP; Mon, 03 Jan 2022 17:08:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VV4-000228-Av; Mon, 03 Jan 2022 17:08:19 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203LJMtc001451; 
 Mon, 3 Jan 2022 22:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zYZ3xbYCwXe7kX1jvdgVrXhRLY6jTgxNcBk6p0KjME4=;
 b=Hhx9G4VNMupiHHuar7eoUqUcTBOnSoP67cNp9y1juzWsaLoTBAAVI+rRql2sNNP557WJ
 phueJfH6IHewtxKhXL+Vzf16hirlPmg/38J04RpShwC7Dt2sij+yeNazDvhTlnutvSjM
 uoPOZHugmDQrCQHBTKJ+X544vtq9DtN2YSfyh0ULnblIoP5CPiOnMlJFzQ7A47wU1adV
 PaeOz/kpYPq3QkLRNRVEAG5AqZ2SVl9OwqEsKV0ivXJz2YfPDYegkYcuqet62C80wsCc
 aBt7UoVrckfbTTliFmxTq5OKXGD8hm3+QuGZtkZeVXdY7a5nxKW1PK0xJC9FeWnZ0nvh 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc8xyrgac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:12 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203M0JUb018802;
 Mon, 3 Jan 2022 22:08:12 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc8xyrga6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:12 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203LwUJ9001137;
 Mon, 3 Jan 2022 22:08:11 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3daekar3x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:11 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M8AEP17040090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:08:10 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6800878064;
 Mon,  3 Jan 2022 22:08:10 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AABC47805F;
 Mon,  3 Jan 2022 22:08:08 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:08:08 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] target/ppc: powerpc_excp: Move AIL under a Book3s block
Date: Mon,  3 Jan 2022 19:07:45 -0300
Message-Id: <20220103220746.3916246-9-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103220746.3916246-1-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h-FY3kCC6MlV4n5HmQ499ghxU6h8u_JR
X-Proofpoint-ORIG-GUID: d75dyzO1VwATPjAxyA4YTUQQcAFWjfv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_09,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030148
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

AIL only applies for Book3s CPUs, so move it along with ILE. This
moves ILE further down in the file because the AIL function can alter
vector so we cannot move it up.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d7e087f2f6..a4787c3ae2 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -766,14 +766,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
         }
     }
 
-    /*
-     * We preserve MSR_LE, but some CPUs can take interrupts in a
-     * different endianness.
-     */
-    if (excp_model >= POWERPC_EXCP_970) {
-        ppc_excp_toggle_ile(cpu, &new_msr);
-    }
-
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_BOOKE) {
         if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
@@ -799,8 +791,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
         env->spr[srr1] = msr;
     }
 
-    /* This can update new_msr and vector if AIL applies */
-    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+    if (excp_model >= POWERPC_EXCP_970) {
+        /*
+         * We preserve MSR_LE, but some CPUs can take interrupts in a
+         * different endianness.
+         */
+        ppc_excp_toggle_ile(cpu, &new_msr);
+
+        /* This can update new_msr and vector if AIL applies */
+        ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+    }
 
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
-- 
2.33.1


