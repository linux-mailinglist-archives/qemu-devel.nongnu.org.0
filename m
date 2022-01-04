Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F9483DB6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:10:10 +0100 (CET)
Received: from localhost ([::1]:60776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4etV-00011n-6M
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:10:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIV-0005qC-Eu; Tue, 04 Jan 2022 02:32:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18324
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIM-0008Ff-Jz; Tue, 04 Jan 2022 02:31:55 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2045IMrC002340; 
 Tue, 4 Jan 2022 07:31:39 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dcfyphukj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047OP89013413;
 Tue, 4 Jan 2022 07:31:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3dae7jq7gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:37 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2047VZpx47120646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:31:35 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14D7152052;
 Tue,  4 Jan 2022 07:31:35 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id D0CCF5204E;
 Tue,  4 Jan 2022 07:31:34 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 246D52201F1;
 Tue,  4 Jan 2022 08:31:34 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 17/26] target/ppc: do not silence snan in xscvspdpn
Date: Tue,  4 Jan 2022 08:31:12 +0100
Message-Id: <20220104073121.3784280-18-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0rZfqwFhPY08_VGoDTKxeHnArtS2uywy
X-Proofpoint-GUID: 0rZfqwFhPY08_VGoDTKxeHnArtS2uywy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1034
 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 impostorscore=0 mlxlogscore=795 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040049
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The non-signalling versions of VSX scalar convert to shorter/longer
precision insns doesn't silence SNaNs in the hardware. To better match
this behavior, use the non-arithmatic conversion of helper_todouble
instead of float32_to_float64. A test is added to prevent future
regressions.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211228120310.1957990-1-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/fpu_helper.c                 |  5 +---
 tests/tcg/ppc64le/non_signalling_xscv.c | 37 +++++++++++++++++++++++++
 tests/tcg/ppc64/Makefile.target         |  4 +--
 tests/tcg/ppc64le/Makefile.target       |  4 +--
 4 files changed, 42 insertions(+), 8 deletions(-)
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
index 000000000000..91e25cad4681
--- /dev/null
+++ b/tests/tcg/ppc64le/non_signalling_xscv.c
@@ -0,0 +1,37 @@
+#include <stdio.h>
+#include <stdint.h>
+#include <inttypes.h>
+#include <assert.h>
+
+#define TEST(INSN, B_HI, B_LO, T_HI, T_LO) \
+    do {                                                                =
\
+        uint64_t th, tl, bh =3D B_HI, bl =3D B_LO;                      =
    \
+        asm("mtvsrd 0, %2\n\t"                                          =
\
+            "mtvsrd 1, %3\n\t"                                          =
\
+            "xxmrghd 0, 0, 1\n\t"                                       =
\
+            INSN " 0, 0\n\t"                                            =
\
+            "mfvsrd %0, 0\n\t"                                          =
\
+            "xxswapd 0, 0\n\t"                                          =
\
+            "mfvsrd %1, 0\n\t"                                          =
\
+            : "=3Dr" (th), "=3Dr" (tl)                                  =
    \
+            : "r" (bh), "r" (bl)                                        =
\
+            : "vs0", "vs1");                                            =
\
+        printf(INSN "(0x%016" PRIx64 "%016" PRIx64 ") =3D 0x%016" PRIx64=
  \
+               "%016" PRIx64 "\n", bh, bl, th, tl);                     =
\
+        assert(th =3D=3D T_HI && tl =3D=3D T_LO);                       =
        \
+    } while (0)
+
+int main(void)
+{
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
+
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


