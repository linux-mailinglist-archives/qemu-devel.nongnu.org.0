Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB506F6482
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 07:43:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puRkU-0002xT-Ix; Thu, 04 May 2023 01:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1puRkR-0002qK-DK; Thu, 04 May 2023 01:43:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1puRkM-0002Rr-PS; Thu, 04 May 2023 01:43:23 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3445gADn011714; Thu, 4 May 2023 05:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cxrWhhwSSh/Wx/Mp58VihiZdNoDIpbyu0CnsKPiPLXQ=;
 b=Tmk4mgcm1gCuZN3B+jDrwRefAIChGjRIX7e923MNReQVpEc2IYOG0PgJf+bjqzk6jQar
 OGZagaTDEDPHH3PtDQfHTZM9fBYFyKSGfnbKN2kBw9xwXe0ksZVhp03RBYL30RYc3+PJ
 YuIuEN0HTRBwB288uC/32zm/f5q2dQiI2SOUOrLltuXUJ5RktSdfRGNTL4gzVWg4cNf+
 MgHOun104p/R4/4zYFzcJlJLAkotgBOsFRInQ9KLTBy2qJj/artFT224ttF5/mjJqQvO
 zxPPU9FobRSQRZ6eXVPYRzPuvTWgy6DHr+UWPIdXn73vkLddXBRbqiYdi2eLnq8GfPLG fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc6sjr0p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:43:00 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3445h0kB014824;
 Thu, 4 May 2023 05:43:00 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc6sjr0n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:43:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3441YkJd011990;
 Thu, 4 May 2023 05:42:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3q8tv6tmtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:42:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3445gtW539059844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 May 2023 05:42:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5591F20043;
 Thu,  4 May 2023 05:42:55 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B263620049;
 Thu,  4 May 2023 05:42:53 +0000 (GMT)
Received: from ltc-boston1.aus.stglabs.ibm.com (unknown [9.40.193.18])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  4 May 2023 05:42:53 +0000 (GMT)
Subject: [PATCH v2 2/2] tests: tcg: ppc64: Add tests for Vector Extract Mask
 Instructions
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: philmd@linaro.org, richard.henderson@linaro.org, danielhb413@gmail.com,
 lucas.araujo@eldorado.org.br, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-ppc@nongnu.org
Cc: john_platts@hotmail.com, sbhat@linux.ibm.com, qemu-devel@nongnu.org
Date: Thu, 04 May 2023 05:36:04 -0400
Message-ID: <168319294881.1159309.17060400720026083557.stgit@ltc-boston1.aus.stglabs.ibm.com>
In-Reply-To: <168319291781.1159309.7376486961333644798.stgit@ltc-boston1.aus.stglabs.ibm.com>
References: <168319291781.1159309.7376486961333644798.stgit@ltc-boston1.aus.stglabs.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i-6kkXWGRpxNB13rGcr7todo6MJUvZYs
X-Proofpoint-GUID: PlC4n1SqwV1K8zZUdjS0BKHguik0enhG
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_02,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=950 spamscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305040046
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_03_06=3.027,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add test for vextractbm, vextractwm, vextractdm and vextractqm
instructions. Test works for both qemu-ppc64 and qemu-ppc64le.

Based on the test case written by John Platts posted at [1]

References:
[1] - https://gitlab.com/qemu-project/qemu/-/issues/1536

Signed-off-by: John Platts <john_platts@hotmail.com>
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
---
 tests/tcg/ppc64/Makefile.target |    5 +++-
 tests/tcg/ppc64/vector.c        |   51 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/ppc64/vector.c

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 6d47d3cae6..b084963b9a 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -20,7 +20,7 @@ PPC64_TESTS += mtfsf
 PPC64_TESTS += mffsce
 
 ifneq ($(CROSS_CC_HAS_POWER10),)
-PPC64_TESTS += byte_reverse sha512-vector
+PPC64_TESTS += byte_reverse sha512-vector vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
@@ -31,6 +31,9 @@ sha512-vector: sha512.c
 
 run-sha512-vector: QEMU_OPTS+=-cpu POWER10
 
+vector: CFLAGS += -mcpu=power10 -I$(SRC_PATH)/include
+run-vector: QEMU_OPTS += -cpu POWER10
+
 PPC64_TESTS += signal_save_restore_xer
 PPC64_TESTS += xxspltw
 
diff --git a/tests/tcg/ppc64/vector.c b/tests/tcg/ppc64/vector.c
new file mode 100644
index 0000000000..cbf4ae9332
--- /dev/null
+++ b/tests/tcg/ppc64/vector.c
@@ -0,0 +1,51 @@
+#include <assert.h>
+#include <stdint.h>
+#include "qemu/compiler.h"
+
+int main(void)
+{
+    unsigned int result_wi;
+    vector unsigned char vbc_bi_src = { 0xFF, 0xFF, 0, 0xFF, 0xFF, 0xFF,
+                                        0xFF, 0xFF, 0xFF, 0xFF, 0, 0, 0,
+                                        0, 0xFF, 0xFF};
+    vector unsigned short vbc_hi_src = { 0xFFFF, 0, 0, 0xFFFF,
+                                         0, 0, 0xFFFF, 0xFFFF};
+    vector unsigned int vbc_wi_src = {0, 0, 0xFFFFFFFF, 0xFFFFFFFF};
+    vector unsigned long long vbc_di_src = {0xFFFFFFFFFFFFFFFF, 0};
+    vector __uint128_t vbc_qi_src;
+
+    asm("vextractbm %0, %1" : "=r" (result_wi) : "v" (vbc_bi_src));
+#if HOST_BIG_ENDIAN
+    assert(result_wi == 0b1101111111000011);
+#else
+    assert(result_wi == 0b1100001111111011);
+#endif
+
+    asm("vextracthm %0, %1" : "=r" (result_wi) : "v" (vbc_hi_src));
+#if HOST_BIG_ENDIAN
+    assert(result_wi == 0b10010011);
+#else
+    assert(result_wi == 0b11001001);
+#endif
+
+    asm("vextractwm %0, %1" : "=r" (result_wi) : "v" (vbc_wi_src));
+#if HOST_BIG_ENDIAN
+    assert(result_wi == 0b0011);
+#else
+    assert(result_wi == 0b1100);
+#endif
+
+    asm("vextractdm %0, %1" : "=r" (result_wi) : "v" (vbc_di_src));
+#if HOST_BIG_ENDIAN
+    assert(result_wi == 0b10);
+#else
+    assert(result_wi == 0b01);
+#endif
+
+    vbc_qi_src[0] = 0x1;
+    vbc_qi_src[0] = vbc_qi_src[0] << 127;
+    asm("vextractqm %0, %1" : "=r" (result_wi) : "v" (vbc_qi_src));
+    assert(result_wi == 0b1);
+
+    return 0;
+}



