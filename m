Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BBF6E10C9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:15:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmyeP-0003OM-KF; Thu, 13 Apr 2023 11:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1pmyeN-0003Nc-U2; Thu, 13 Apr 2023 11:14:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1pmyeK-0006ro-MW; Thu, 13 Apr 2023 11:14:14 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33DEwSqt005329; Thu, 13 Apr 2023 15:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LanScZX1fnW0lRfaSmjd3DQN2TQ2S+Ey95eSL0Twurw=;
 b=VoZqAlf9g+fVt/R0eW0G/wJKhDgnkCmfkkgNJsopbC2YnZ1HvkLOHASiCGlJXESdttg7
 KvGQC+1CzTWegJSJWK1FGuyC8Qg5FC6+wXfTFLMltn4t8yBiQwzUZhBorzyQOr+gl6rk
 MB8C7GBGk5OvycnIAY/2nwmnWoKFNx9+V2CTBAiaURVx00rmBV3I3myr6KbpXyf72l4e
 lWBupOPFc6u6zL1lo3nGfN4ix3jB4PdjYRg0mCGSBEJaxjf1BvmFyJsbgITiNkBbvJuI
 jTtfqT5uKrxtJczFXuoxbSsD5BolPS5Z7j61j0pGy0XPc4sSbPjccwnlixS9UFidNnf7 CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxkym8t5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:14:03 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33DExdJO008743;
 Thu, 13 Apr 2023 15:14:03 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxkym8t4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:14:03 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33D3JBYG004875;
 Thu, 13 Apr 2023 15:14:01 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3pu0hq2kp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:14:01 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33DFDwqk61604104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Apr 2023 15:13:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B101A2004E;
 Thu, 13 Apr 2023 15:13:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 233B12004D;
 Thu, 13 Apr 2023 15:13:57 +0000 (GMT)
Received: from ltc-boston1.aus.stglabs.ibm.com (unknown [9.40.193.18])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 13 Apr 2023 15:13:56 +0000 (GMT)
Subject: [PATCH 2/2] tests: tcg: ppc64: Add tests for Vector Extract Mask
 Instructions
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: philmd@linaro.org, richard.henderson@linaro.org, danielhb413@gmail.com,
 lucas.araujo@eldorado.org.br, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-ppc@nongnu.org
Cc: john_platts@hotmail.com, sbhat@linux.ibm.com, qemu-devel@nongnu.org
Date: Thu, 13 Apr 2023 15:01:16 -0400
Message-ID: <168141246968.3026479.12755025628496245070.stgit@ltc-boston1.aus.stglabs.ibm.com>
In-Reply-To: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
References: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NP8nVZVjaafFMxJgpJQv2e4ivmelASQb
X-Proofpoint-GUID: c8GGCz-HjCQln4QFcXmBUa6svfJJ--l_
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_10,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=879 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130134
Received-SPF: pass client-ip=148.163.158.5; envelope-from=sbhat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_03_06=3.027,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
[1]: https://gitlab.com/qemu-project/qemu/-/issues/1536

Signed-off-by: John Platts <john_platts@hotmail.com>
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 tests/tcg/ppc64/Makefile.target |    6 ++++-
 tests/tcg/ppc64/vector.c        |   50 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/ppc64/vector.c

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index f081f1c683..4fd543ce28 100644
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
@@ -33,6 +33,10 @@ sha512-vector: sha512.c
 run-sha512-vector: QEMU_OPTS+=-cpu POWER10
 run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
 
+vector: CFLAGS += -mcpu=power10
+run-vector: QEMU_OPTS += -cpu POWER10
+run-plugin-vector-with-%: QEMU_OPTS += -cpu POWER10
+
 PPC64_TESTS += signal_save_restore_xer
 PPC64_TESTS += xxspltw
 
diff --git a/tests/tcg/ppc64/vector.c b/tests/tcg/ppc64/vector.c
new file mode 100644
index 0000000000..3cb2b88c87
--- /dev/null
+++ b/tests/tcg/ppc64/vector.c
@@ -0,0 +1,50 @@
+#include <assert.h>
+#include <stdint.h>
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
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+    assert(result_wi == 0b1101111111000011);
+#else
+    assert(result_wi == 0b1100001111111011);
+#endif
+
+    asm("vextracthm %0, %1" : "=r" (result_wi) : "v" (vbc_hi_src));
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+    assert(result_wi == 0b10010011);
+#else
+    assert(result_wi == 0b11001001);
+#endif
+
+    asm("vextractwm %0, %1" : "=r" (result_wi) : "v" (vbc_wi_src));
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+    assert(result_wi == 0b0011);
+#else
+    assert(result_wi == 0b1100);
+#endif
+
+    asm("vextractdm %0, %1" : "=r" (result_wi) : "v" (vbc_di_src));
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
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



