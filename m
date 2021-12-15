Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE44760A7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:25:59 +0100 (CET)
Received: from localhost ([::1]:57628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYyV-0006pe-0z
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:25:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXid-0005WN-Ok; Wed, 15 Dec 2021 12:05:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiZ-0004qu-Pk; Wed, 15 Dec 2021 12:05:30 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfauN012768; 
 Wed, 15 Dec 2021 17:04:55 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyjgfk6qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:55 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2cWD010794;
 Wed, 15 Dec 2021 17:04:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3cy7vvf1tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFH4pl637356016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 109E152057;
 Wed, 15 Dec 2021 17:04:51 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id C69A852065;
 Wed, 15 Dec 2021 17:04:50 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 04AAA220247;
 Wed, 15 Dec 2021 18:04:49 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 081/102] target/ppc: do not silence SNaN in xscvspdpn
Date: Wed, 15 Dec 2021 18:03:36 +0100
Message-Id: <20211215170357.321643-69-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7pbtsHq7ezSO3RZYhkh_lngDqzmLzqQ9
X-Proofpoint-ORIG-GUID: 7pbtsHq7ezSO3RZYhkh_lngDqzmLzqQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1034 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=827
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The non-signalling versions of VSX scalar convert to shorter/longer
precision insns doesn't silence SNaNs in the hardware. To better match
this behavior, use the non-arithmetic conversion of helper_todouble
instead of float32_to_float64. A test is added to prevent future
regressions.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
[ clg: Fixed spelling in commit log ]
Message-Id: <20211214144459.1086343-1-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c                 |  5 +---
 tests/tcg/ppc64le/non_signalling_xscv.c | 36 +++++++++++++++++++++++++
 tests/tcg/ppc64/Makefile.target         |  4 +--
 tests/tcg/ppc64le/Makefile.target       |  4 +--
 4 files changed, 41 insertions(+), 8 deletions(-)
 create mode 100644 tests/tcg/ppc64le/non_signalling_xscv.c

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 700c79156b06..e5c29b53b8b5 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2816,10 +2816,7 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64=
_t xb)
=20
 uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
 {
-    float_status tstat =3D env->fp_status;
-    set_float_exception_flags(0, &tstat);
-
-    return float32_to_float64(xb >> 32, &tstat);
+    return helper_todouble(xb >> 32);
 }
=20
 /*
diff --git a/tests/tcg/ppc64le/non_signalling_xscv.c b/tests/tcg/ppc64le/=
non_signalling_xscv.c
new file mode 100644
index 000000000000..77f07033335d
--- /dev/null
+++ b/tests/tcg/ppc64le/non_signalling_xscv.c
@@ -0,0 +1,36 @@
+#include <stdio.h>
+#include <stdint.h>
+#include <inttypes.h>
+#include <assert.h>
+
+#define TEST(INSN, B_HI, B_LO, T_HI, T_LO) \
+    do {                                                                =
\
+        __uint128_t t, b =3D B_HI;                                      =
  \
+        b <<=3D 64;                                                     =
  \
+        b |=3D B_LO;                                                    =
  \
+        asm(INSN " %x0, %x1\n\t"                                        =
\
+            : "=3Dwa" (t)                                               =
  \
+            : "wa" (b));                                                =
\
+        printf(INSN "(0x%016" PRIx64 "%016" PRIx64 ") =3D 0x%016" PRIx64=
  \
+               "%016" PRIx64 "\n", (uint64_t)(b >> 64), (uint64_t)b,    =
\
+               (uint64_t)(t >> 64), (uint64_t)t);                       =
\
+        assert((uint64_t)(t >> 64) =3D=3D T_HI && (uint64_t)t =3D=3D T_L=
O);     \
+    } while (0)
+
+int main(void)
+{
+#ifndef __SIZEOF_INT128__
+    puts("__uint128_t not available, skipping...\n");
+#else
+    /* SNaN shouldn't be silenced */
+    TEST("xscvspdpn", 0x7fbfffff00000000ULL, 0x0, 0x7ff7ffffe0000000ULL,=
 0x0);
+    TEST("xscvdpspn", 0x7ff7ffffffffffffULL, 0x0, 0x7fbfffff7fbfffffULL,=
 0x0);
+
+    /*
+     * SNaN inputs having no significant bits in the upper 23 bits of th=
e
+     * signifcand will return Infinity as the result.
+     */
+    TEST("xscvdpspn", 0x7ff000001fffffffULL, 0x0, 0x7f8000007f800000ULL,=
 0x0);
+#endif
+    return 0;
+}
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.t=
arget
index 8f4c7ac4ed7d..0368007028c9 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -6,9 +6,9 @@ VPATH +=3D $(SRC_PATH)/tests/tcg/ppc64
 VPATH +=3D $(SRC_PATH)/tests/tcg/ppc64le
=20
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
-PPC64_TESTS=3Dbcdsub
+PPC64_TESTS=3Dbcdsub non_signalling_xscv
 endif
-bcdsub: CFLAGS +=3D -mpower8-vector
+$(PPC64_TESTS): CFLAGS +=3D -mpower8-vector
=20
 PPC64_TESTS +=3D byte_reverse
 PPC64_TESTS +=3D mtfsf
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefi=
le.target
index e031f65adcb3..480ff0898d7e 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -5,9 +5,9 @@
 VPATH +=3D $(SRC_PATH)/tests/tcg/ppc64le
=20
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
-PPC64LE_TESTS=3Dbcdsub
+PPC64LE_TESTS=3Dbcdsub non_signalling_xscv
 endif
-bcdsub: CFLAGS +=3D -mpower8-vector
+$(PPC64LE_TESTS): CFLAGS +=3D -mpower8-vector
=20
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
 PPC64LE_TESTS +=3D byte_reverse
--=20
2.31.1


