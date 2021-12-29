Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14764815A4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 18:09:50 +0100 (CET)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2cSU-0006wH-0x
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 12:09:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2cHT-0003xQ-IM; Wed, 29 Dec 2021 11:58:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51788
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n2cHR-00048k-V4; Wed, 29 Dec 2021 11:58:27 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BTDHPbY028043; 
 Wed, 29 Dec 2021 16:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=YzNqrL1z2xBPKWRVsxW6JPeiohsbg2QMMvZk+pWGBjk=;
 b=HKf2Fl2iRq+BsNGmYoht6r1d8vRPjTUK0RlRbaR0i8m9RLqB8c2VCXbcb8RTQTUTCGCa
 ZUHBnrH9ytiaPKC6UVnBBUJ36RKXUQWnkYZ/+1FpPRcY7O7Qu/riDvbkyQoudOxHS9X4
 jfpemXazU5N+jWZxfjU+neYbySzaghUwzbpk58ssixiYtIpHkxRJSF2s3uizyN7aOxnS
 ULWkLpou9DZ54WUugbifUFjehTk+JN3uEzleiNx+x0wolQc/5ikiSXDPcNJHqDYQv0Wd
 pwqcYjA7oDxPGyxDroQzDoWHfptKaF4y8vgrQBdrdhVrlwa4DLKkD0kBSLI2MhbD518H dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d84jm0fv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:12 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BTGWhPw005315;
 Wed, 29 Dec 2021 16:58:11 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d84jm0fux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:11 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGuwWT029324;
 Wed, 29 Dec 2021 16:58:10 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3d5txc3fwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:58:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BTGwAk18323804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Dec 2021 16:58:10 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00D36AC059;
 Wed, 29 Dec 2021 16:58:10 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD542AC05E;
 Wed, 29 Dec 2021 16:58:07 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.90.107])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Dec 2021 16:58:07 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] target/ppc: powerpc_excp: Move system call vectored
 code together
Date: Wed, 29 Dec 2021 13:57:50 -0300
Message-Id: <20211229165751.3774248-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211229165751.3774248-1-farosas@linux.ibm.com>
References: <20211229165751.3774248-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aBqo5lCmgNBv_WqHL558RZr8OHWICQNM
X-Proofpoint-ORIG-GUID: MQAH48JOwXXSyHiGus2SUEA4Ob8ex1FE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-29_06,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=852 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112290088
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

Now that 'vector' is known before calling the interrupt-specific setup
code, we can move all of the scv setup into one place.

No functional change intended.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 1fe20b4806..811f6be0a0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -550,6 +550,11 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
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
@@ -863,14 +868,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 
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


