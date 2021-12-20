Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB347B369
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:06:05 +0100 (CET)
Received: from localhost ([::1]:37312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNz1-0005nD-Oq
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:06:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNG1-0002f3-Ms; Mon, 20 Dec 2021 13:19:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mzNG0-0006k4-2F; Mon, 20 Dec 2021 13:19:33 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKHAPBq029785; 
 Mon, 20 Dec 2021 18:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Q8GOAC5RpdMCQcaxSJFvSaUEui3vOUTP85nCqDD9wlE=;
 b=f5H/RDebq7qGJ+9UK8gqv7wbKMHKwV/srMCIeemDCfedtIaWlXqomTgOluIjmp2VOJ4x
 J3dFVgtl81o9w6g6kR16Y6cJN/nFNS6Kj+qOgDXX88EUBBRJwtVC+e9HdiXFdebPfMPb
 maMXmW0vrmfonunS4J0cOvQLRCY29Nsn+Do4WHgN9s3msaKnsOraEwJ153ENpU6kQveC
 H1hhXFJoOOI8PWiHw9VZ+OUvPw/x6f0p9bkTA5HbMdiBX8NoUglMf/eis7Hh4sHEXRAw
 e1jSLRjRMhpNnIOxezUzl04bShgWmLaveJxgoxcktLCxOiz5DCmzQ1qCnUGnUqvLswaL 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4e2ntr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:20 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKHZThG008760;
 Mon, 20 Dec 2021 18:19:20 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s4e2ntg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:19 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKIHuRa011746;
 Mon, 20 Dec 2021 18:19:18 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3d1799hwyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 18:19:18 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKIJIvs14352756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 18:19:18 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6C52C6061;
 Mon, 20 Dec 2021 18:19:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76CFCC6063;
 Mon, 20 Dec 2021 18:19:16 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.60.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 18:19:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 03/12] target/ppc: powerpc_excp: Move system call vectored
 code together
Date: Mon, 20 Dec 2021 15:18:54 -0300
Message-Id: <20211220181903.3456898-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Yuh6EiOE_nqhwRDDWUjfm5dWi-TWBKhI
X-Proofpoint-GUID: zRV--_Dg_PDdLtGSV_dnHH9qSUGCHAxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_08,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 mlxlogscore=726 clxscore=1015 mlxscore=0
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

Now that 'vector' is known before calling the interrupt-specific setup
code, we can move all of the scv setup into one place.

No functional change intended.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 14fd0213a0..7bdc1e8410 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -549,6 +549,11 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         env->nip += 4;
         new_msr |= env->msr & ((target_ulong)1 << MSR_EE);
         new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
+
+        vector += lev * 0x20;
+
+        env->lr = env->nip;
+        env->ctr = msr;
         break;
     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
     case POWERPC_EXCP_APU:       /* Auxiliary processor unavailable          */
@@ -862,14 +867,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 
         /* Save MSR */
         env->spr[srr1] = msr;
-
-#if defined(TARGET_PPC64)
-    } else {
-        vector += lev * 0x20;
-
-        env->lr = env->nip;
-        env->ctr = msr;
-#endif
     }
 
     /* This can update new_msr and vector if AIL applies */
-- 
2.33.1


