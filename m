Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930034CE467
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:08:50 +0100 (CET)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSHJ-00071s-Dl
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:08:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9V-0001W5-7v; Sat, 05 Mar 2022 06:00:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43262
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9T-000316-Le; Sat, 05 Mar 2022 06:00:44 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2259HkOj019184; 
 Sat, 5 Mar 2022 11:00:23 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3em53u90ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:23 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 225As18R029053;
 Sat, 5 Mar 2022 11:00:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3eky4j0n9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 225B0Jwv54526292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Mar 2022 11:00:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 042A6A4055;
 Sat,  5 Mar 2022 11:00:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADB34A4040;
 Sat,  5 Mar 2022 11:00:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  5 Mar 2022 11:00:18 +0000 (GMT)
Received: from yukon.home (unknown [9.171.13.194])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DA53122027F;
 Sat,  5 Mar 2022 12:00:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 02/13] tests/tcg/ppc64le: use inline asm instead of
 __builtin_mtfsf
Date: Sat,  5 Mar 2022 11:59:59 +0100
Message-Id: <20220305110010.1283654-3-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305110010.1283654-1-clg@kaod.org>
References: <20220305110010.1283654-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J3CZboN8XL1StI2AHkUdCbSUCw1USy24
X-Proofpoint-GUID: J3CZboN8XL1StI2AHkUdCbSUCw1USy24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-05_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=455
 spamscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1034
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203050057
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

LLVM/Clang does not support __builtin_mtfsf.

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220304165417.1981159-2-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/tcg/ppc64le/mtfsf.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tests/tcg/ppc64le/mtfsf.c b/tests/tcg/ppc64le/mtfsf.c
index b3d31f3637d9..bed5b1afa40e 100644
--- a/tests/tcg/ppc64le/mtfsf.c
+++ b/tests/tcg/ppc64le/mtfsf.c
@@ -1,8 +1,12 @@
 #include <stdlib.h>
+#include <stdint.h>
 #include <assert.h>
 #include <signal.h>
 #include <sys/prctl.h>
=20
+#define MTFSF(FLM, FRB) asm volatile ("mtfsf %0, %1" :: "i" (FLM), "f" (=
FRB))
+#define MFFS(FRT) asm("mffs %0" : "=3Df" (FRT))
+
 #define FPSCR_VE     7  /* Floating-point invalid operation exception en=
able */
 #define FPSCR_VXSOFT 10 /* Floating-point invalid operation exception (s=
oft) */
 #define FPSCR_FI     17 /* Floating-point fraction inexact              =
     */
@@ -21,10 +25,7 @@ void sigfpe_handler(int sig, siginfo_t *si, void *ucon=
text)
=20
 int main(void)
 {
-    union {
-        double d;
-        long long ll;
-    } fpscr;
+    uint64_t fpscr;
=20
     struct sigaction sa =3D {
         .sa_sigaction =3D sigfpe_handler,
@@ -40,10 +41,9 @@ int main(void)
     prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);
=20
     /* First test if the FI bit is being set correctly */
-    fpscr.ll =3D FP_FI;
-    __builtin_mtfsf(0b11111111, fpscr.d);
-    fpscr.d =3D __builtin_mffs();
-    assert((fpscr.ll & FP_FI) !=3D 0);
+    MTFSF(0b11111111, FP_FI);
+    MFFS(fpscr);
+    assert((fpscr & FP_FI) !=3D 0);
=20
     /* Then test if the deferred exception is being called correctly */
     sigaction(SIGFPE, &sa, NULL);
@@ -54,8 +54,7 @@ int main(void)
      * But if a different exception is chosen si_code check should
      * change accordingly.
      */
-    fpscr.ll =3D FP_VE | FP_VXSOFT;
-    __builtin_mtfsf(0b11111111, fpscr.d);
+    MTFSF(0b11111111, FP_VE | FP_VXSOFT);
=20
     return 1;
 }
--=20
2.34.1


