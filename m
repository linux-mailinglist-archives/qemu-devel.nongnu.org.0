Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9306F4718
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 17:26:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrtJ-0003gv-He; Tue, 02 May 2023 11:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1ptrtG-0003gS-61
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:26:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1ptrtB-0007iW-DG
 for qemu-devel@nongnu.org; Tue, 02 May 2023 11:26:05 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342F9w8S001789; Tue, 2 May 2023 15:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=45c00sBq3mgnErMYNjdtI+Y/R6K3KhTdEd4bqU3Uvz8=;
 b=kSAsntMdHEpsS3Ffgkvpn0BhCBOJsQ5vboq06J6Z4C0kHiEbZvTzATlU5xsbV0ZWm0sF
 CuVM9xiHUMM9QmF5RUrtIdlCYdqUet8IGBEdYRvhOg/+/LQ0KgYkRfuUlkEniMckkFbD
 JA+pSuSUW4ziQPK4Kb9Hf9LWumalUQBr1kcMHqZuOxx5Ya5e04hEHCaUrX7GvvVBE3in
 4rW7XTqKJzRXDC+mAekxv5kyZMH0QJ6ubEPaX8YTcYmDAy9ZdRIbTvEXcrkDjh1m/qPX
 DzyoSBFeOSYunBfdnOcIaBwVZ07epQ7pkDzZF5rK42VEfFjqS8QTLm6dphZal+/BYg+W aQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qb4aat3yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 15:25:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3421vwMH021473;
 Tue, 2 May 2023 15:25:36 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q8tv6sp5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 15:25:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 342FPXI824248706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 May 2023 15:25:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1162520040;
 Tue,  2 May 2023 15:25:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF49D20043;
 Tue,  2 May 2023 15:25:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.209.189])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  2 May 2023 15:25:31 +0000 (GMT)
Subject: [PATCH] softfloat: Fix the incorrect computation in float32_exp2()
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: aurelien@aurel32.net, peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, vaibhav@linux.ibm.com, sbhat@linux.ibm.com
Date: Tue, 02 May 2023 20:55:30 +0530
Message-ID: <168304110865.537992.13059030916325018670.stgit@localhost.localdomain>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WMS9fO-n4mKOzX1MQPMvaTrFtjAgp9cq
X-Proofpoint-ORIG-GUID: WMS9fO-n4mKOzX1MQPMvaTrFtjAgp9cq
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2305020128
Received-SPF: pass client-ip=148.163.158.5; envelope-from=sbhat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The float32_exp2() is computing wrong exponent of 2.
For example, with the following set of values {0.1, 2.0, 2.0, -1.0},
the expected output would be {1.071773, 4.000000, 4.000000, 0.500000}.
Instead, the function is computing {1.119102, 3.382044, 3.382044, -0.191022}

Looking at the code, the float32_exp2() attempts to do this

                  2     3     4     5           n
  x        x     x     x     x     x           x
 e  = 1 + --- + --- + --- + --- + --- + ... + --- + ...
           1!    2!    3!    4!    5!          n!

But because of the 'typo'/bug it ends up doing

 x        x     x     x     x     x           x
e  = 1 + --- + --- + --- + --- + --- + ... + --- + ...
          1!    2!    3!    4!    5!          n!

This is because instead of the xnp which holds the numerator,
parts_muladd is using the xp which is just 'x'. The commit '572c4d862ff2'
refactored this function, and it seems mistakenly using xp instead of xnp.

The patches fixes this possible typo.

Fixes: 572c4d862ff2 "softfloat: Convert float32_exp2 to FloatParts"
Partially-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1623
Reported-By: Luca Barbato (https://gitlab.com/lu-zero)
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhat@linux.ibm.com>
---
 fpu/softfloat.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c7454c3eb1a..108f9cb224a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5135,7 +5135,7 @@ float32 float32_exp2(float32 a, float_status *status)
     float64_unpack_canonical(&rp, float64_one, status);
     for (i = 0 ; i < 15 ; i++) {
         float64_unpack_canonical(&tp, float32_exp2_coefficients[i], status);
-        rp = *parts_muladd(&tp, &xp, &rp, 0, status);
+        rp = *parts_muladd(&tp, &xnp, &rp, 0, status);
         xnp = *parts_mul(&xnp, &xp, status);
     }




