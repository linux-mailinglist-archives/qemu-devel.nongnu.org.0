Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73904CE45B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:03:27 +0100 (CET)
Received: from localhost ([::1]:32866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSC6-00059i-Kh
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:03:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9X-0001bX-0L; Sat, 05 Mar 2022 06:00:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9U-00031Y-PG; Sat, 05 Mar 2022 06:00:46 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2255HaKf028815; 
 Sat, 5 Mar 2022 11:00:26 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3em1k7kh1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:26 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 225Arruv004685;
 Sat, 5 Mar 2022 11:00:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3ekyg90mcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 225B0LPX56492508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Mar 2022 11:00:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22ACDA4062;
 Sat,  5 Mar 2022 11:00:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3FECA4060;
 Sat,  5 Mar 2022 11:00:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  5 Mar 2022 11:00:20 +0000 (GMT)
Received: from yukon.home (unknown [9.171.13.194])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1B5612203EC;
 Sat,  5 Mar 2022 12:00:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 05/13] tests/tcg/ppc64le: emit bcdsub with .long when needed
Date: Sat,  5 Mar 2022 12:00:02 +0100
Message-Id: <20220305110010.1283654-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305110010.1283654-1-clg@kaod.org>
References: <20220305110010.1283654-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G8Vm45Cm_3vLsioUohU2o_tTtLn_mpLQ
X-Proofpoint-ORIG-GUID: G8Vm45Cm_3vLsioUohU2o_tTtLn_mpLQ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-05_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=902 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 clxscore=1034 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203050057
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

Based on GCC docs[1], we use the '-mpower8-vector' flag at config-time
to detect the toolchain support to the bcdsub instruction. LLVM/Clang
supports this flag since version 3.6[2], but the instruction and related
builtins were only added in LLVM 14[3]. In the absence of other means to
detect this support at config-time, we resort to __has_builtin to
identify the presence of __builtin_bcdsub at compile-time. If the
builtin is not available, the instruction is emitted with a ".long".

[1] https://gcc.gnu.org/onlinedocs/gcc-8.3.0/gcc/PowerPC-AltiVec_002fVSX-Bu=
ilt-in-Functions.html
[2] https://github.com/llvm/llvm-project/commit/59eb767e11d4ffefb5f55409524=
e5c8416b2b0db
[3] https://github.com/llvm/llvm-project/commit/c933c2eb334660c131f4afc9d19=
4fafb0cec0423

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220304165417.1981159-5-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/tcg/ppc64le/bcdsub.c | 73 ++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64le/bcdsub.c
index 12da19b78ef3..87c8c44a4493 100644
--- a/tests/tcg/ppc64le/bcdsub.c
+++ b/tests/tcg/ppc64le/bcdsub.c
@@ -9,37 +9,48 @@
 #define CRF_SO  (1 << 0)
 #define UNDEF   0
=20
-/*
- * Use GPR pairs to load the VSR values and place the resulting VSR and CR=
6 in
- * th, tl, and cr. Note that we avoid newer instructions (e.g., mtvsrdd/mf=
vsrld)
- * so we can run this test on POWER8 machines.
- */
-#define BCDSUB(AH, AL, BH, BL, PS)                          \
-    asm ("mtvsrd 32, %3\n\t"                                \
-         "mtvsrd 33, %4\n\t"                                \
-         "xxmrghd 32, 32, 33\n\t"                           \
-         "mtvsrd 33, %5\n\t"                                \
-         "mtvsrd 34, %6\n\t"                                \
-         "xxmrghd 33, 33, 34\n\t"                           \
-         "bcdsub. 0, 0, 1, %7\n\t"                          \
-         "mfocrf %0, 0b10\n\t"                              \
-         "mfvsrd %1, 32\n\t"                                \
-         "xxswapd 32, 32\n\t"                               \
-         "mfvsrd %2, 32\n\t"                                \
-         : "=3Dr" (cr), "=3Dr" (th), "=3Dr" (tl)                  \
-         : "r" (AH), "r" (AL), "r" (BH), "r" (BL), "i" (PS) \
-         : "v0", "v1", "v2");
-
-#define TEST(AH, AL, BH, BL, PS, TH, TL, CR6)   \
-    do {                                        \
-        int cr =3D 0;                             \
-        uint64_t th, tl;                        \
-        BCDSUB(AH, AL, BH, BL, PS);             \
-        if (TH !=3D UNDEF || TL !=3D UNDEF) {       \
-            assert(tl =3D=3D TL);                   \
-            assert(th =3D=3D TH);                   \
-        }                                       \
-        assert((cr >> 4) =3D=3D CR6);               \
+#ifdef __has_builtin
+#if !__has_builtin(__builtin_bcdsub)
+#define NO_BUILTIN_BCDSUB
+#endif
+#endif
+
+#ifdef NO_BUILTIN_BCDSUB
+#define BCDSUB(T, A, B, PS) \
+    ".long 4 << 26 | (" #T ") << 21 | (" #A ") << 16 | (" #B ") << 11"  \
+    " | 1 << 10 | (" #PS ") << 9 | 65\n\t"
+#else
+#define BCDSUB(T, A, B, PS) "bcdsub. " #T ", " #A ", " #B ", " #PS "\n\t"
+#endif
+
+#define TEST(AH, AL, BH, BL, PS, TH, TL, CR6)                             =
     \
+    do {                                                                  =
     \
+        int cr =3D 0;                                                     =
       \
+        uint64_t th, tl;                                                  =
     \
+        /*                                                                =
     \
+         * Use GPR pairs to load the VSR values and place the resulting VS=
R and\
+         * CR6 in th, tl, and cr. Note that we avoid newer instructions (e=
.g., \
+         * mtvsrdd/mfvsrld) so we can run this test on POWER8 machines.   =
     \
+         */                                                               =
     \
+        asm ("mtvsrd 32, %3\n\t"                                          =
     \
+             "mtvsrd 33, %4\n\t"                                          =
     \
+             "xxmrghd 32, 32, 33\n\t"                                     =
     \
+             "mtvsrd 33, %5\n\t"                                          =
     \
+             "mtvsrd 34, %6\n\t"                                          =
     \
+             "xxmrghd 33, 33, 34\n\t"                                     =
     \
+             BCDSUB(0, 0, 1, PS)                                          =
     \
+             "mfocrf %0, 0b10\n\t"                                        =
     \
+             "mfvsrd %1, 32\n\t"                                          =
     \
+             "xxswapd 32, 32\n\t"                                         =
     \
+             "mfvsrd %2, 32\n\t"                                          =
     \
+             : "=3Dr" (cr), "=3Dr" (th), "=3Dr" (tl)                      =
           \
+             : "r" (AH), "r" (AL), "r" (BH), "r" (BL)                     =
     \
+             : "v0", "v1", "v2");                                         =
     \
+        if (TH !=3D UNDEF || TL !=3D UNDEF) {                             =
         \
+            assert(tl =3D=3D TL);                                         =
         \
+            assert(th =3D=3D TH);                                         =
         \
+        }                                                                 =
     \
+        assert((cr >> 4) =3D=3D CR6);                                     =
         \
     } while (0)
=20
 /*
--=20
2.34.1


