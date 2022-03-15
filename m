Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F74D9512
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:16:33 +0100 (CET)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1Q0-0004tG-Ro
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:16:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0rM-0004Rd-97; Tue, 15 Mar 2022 02:40:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0rK-0008Mm-Do; Tue, 15 Mar 2022 02:40:43 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22F6IU6j014762; 
 Tue, 15 Mar 2022 06:40:28 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etndurbj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:40:28 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22F6Xbwq027964;
 Tue, 15 Mar 2022 06:40:25 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3erk58n0dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:40:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22F6SwCQ30998856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 06:28:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4C5DA4D05;
 Tue, 15 Mar 2022 06:38:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85EF7A4CFC;
 Tue, 15 Mar 2022 06:37:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 06:37:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C5E5D2202F6;
 Tue, 15 Mar 2022 07:37:47 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 16/20] target/ppc: fix xxspltw for big endian hosts
Date: Tue, 15 Mar 2022 07:37:32 +0100
Message-Id: <20220315063736.592808-17-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315063736.592808-1-clg@kaod.org>
References: <20220315063736.592808-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: da5rTeU65AOTNEJ-njMZ5vsVFKKKY9qL
X-Proofpoint-GUID: da5rTeU65AOTNEJ-njMZ5vsVFKKKY9qL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=812 lowpriorityscore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150042
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Fix a typo in the host endianness macro and add a simple test to detect
regressions.

Fixes: 9bb0048ec6f8 ("target/ppc: convert xxspltw to vector operations")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220310172047.61094-1-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/tcg/ppc64le/xxspltw.c         | 46 +++++++++++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc |  2 +-
 tests/tcg/ppc64/Makefile.target     |  1 +
 tests/tcg/ppc64le/Makefile.target   |  1 +
 4 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/ppc64le/xxspltw.c

diff --git a/tests/tcg/ppc64le/xxspltw.c b/tests/tcg/ppc64le/xxspltw.c
new file mode 100644
index 000000000000..4cff78bfdc8d
--- /dev/null
+++ b/tests/tcg/ppc64le/xxspltw.c
@@ -0,0 +1,46 @@
+#include <stdio.h>
+#include <stdint.h>
+#include <inttypes.h>
+#include <assert.h>
+
+#define WORD_A 0xAAAAAAAAUL
+#define WORD_B 0xBBBBBBBBUL
+#define WORD_C 0xCCCCCCCCUL
+#define WORD_D 0xDDDDDDDDUL
+
+#define DWORD_HI (WORD_A << 32 | WORD_B)
+#define DWORD_LO (WORD_C << 32 | WORD_D)
+
+#define TEST(HI, LO, UIM, RES) \
+    do {                                                        \
+        union {                                                 \
+            uint64_t u;                                         \
+            double f;                                           \
+        } h =3D { .u =3D HI }, l =3D { .u =3D LO };                     =
\
+        /*                                                      \
+         * Use a pair of FPRs to load the VSR avoiding insns    \
+         * newer than xxswapd.                                  \
+         */                                                     \
+        asm("xxmrghd 32, %0, %1\n\t"                            \
+            "xxspltw 32, 32, %2\n\t"                            \
+            "xxmrghd %0, 32, %0\n\t"                            \
+            "xxswapd 32, 32\n\t"                                \
+            "xxmrghd %1, 32, %1\n\t"                            \
+            : "+f" (h.f), "+f" (l.f)                            \
+            : "i" (UIM)                                         \
+            : "v0");                                            \
+        printf("xxspltw(0x%016" PRIx64 "%016" PRIx64 ", %d) =3D"  \
+               " %016" PRIx64 "%016" PRIx64 "\n", HI, LO, UIM,  \
+               h.u, l.u);                                       \
+        assert(h.u =3D=3D (RES));                                   \
+        assert(l.u =3D=3D (RES));                                   \
+    } while (0)
+
+int main(void)
+{
+    TEST(DWORD_HI, DWORD_LO, 0, WORD_A << 32 | WORD_A);
+    TEST(DWORD_HI, DWORD_LO, 1, WORD_B << 32 | WORD_B);
+    TEST(DWORD_HI, DWORD_LO, 2, WORD_C << 32 | WORD_C);
+    TEST(DWORD_HI, DWORD_LO, 3, WORD_D << 32 | WORD_D);
+    return 0;
+}
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 48a97b2d7e70..e67fbf2bb8ed 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1552,7 +1552,7 @@ static bool trans_XXSPLTW(DisasContext *ctx, arg_XX=
2_uim2 *a)
     tofs =3D vsr_full_offset(a->xt);
     bofs =3D vsr_full_offset(a->xb);
     bofs +=3D a->uim << MO_32;
-#ifndef HOST_WORDS_BIG_ENDIAN
+#ifndef HOST_WORDS_BIGENDIAN
     bofs ^=3D 8 | 4;
 #endif
=20
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.t=
arget
index c9498053dfea..8197c288a7ba 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -27,5 +27,6 @@ run-sha512-vector: QEMU_OPTS+=3D-cpu POWER10
 run-plugin-sha512-vector-with-%: QEMU_OPTS+=3D-cpu POWER10
=20
 PPC64_TESTS +=3D signal_save_restore_xer
+PPC64_TESTS +=3D xxspltw
=20
 TESTS +=3D $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefi=
le.target
index 12d85e946b0c..9624bb1e9cee 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -25,5 +25,6 @@ run-plugin-sha512-vector-with-%: QEMU_OPTS+=3D-cpu POWE=
R10
=20
 PPC64LE_TESTS +=3D mtfsf
 PPC64LE_TESTS +=3D signal_save_restore_xer
+PPC64LE_TESTS +=3D xxspltw
=20
 TESTS +=3D $(PPC64LE_TESTS)
--=20
2.34.1


