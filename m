Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A44489FCC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:03:52 +0100 (CET)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zxO-0007At-VR
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:03:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n6ztH-0002Sq-Nd; Mon, 10 Jan 2022 13:59:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n6ztF-0001LM-KE; Mon, 10 Jan 2022 13:59:35 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AIJLnP001282; 
 Mon, 10 Jan 2022 18:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3nKCmzHncenrsgbKcYeuOY5+9bjLsmEARZ/X6EXpccw=;
 b=YNZXvKWNsAbHMcantgz4+bO41jtnYayFvM7XeykB+m2HBhrA5mgpFr3uAlRqxMuRaD9a
 WWwmpmrMdRVNImAsnlQXgLGiASMtobwfRXTvi3LH9u52u6tDMeBvLVsf0Hp1jYF86088
 tNLI8g0zLfVBQR4C3EzktXrqt6LAbc6GNyJyr45ppH20jiVsaKwh2VI9DRkyLqn5MmTW
 zllIHMzR9EkF+WMmalYmu4B4cBzedju7p38wgTFyHB7UWtHzRSjuH9N3YoTUPiksWtfS
 ekzwb6qRAElFk3EkhfKwbd9JviGJIHDsGHTJgI8KFDcE/UxsEciMWiGmDxUkp54VtHQn 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm3vsx58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:59:27 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AIeXZg025506;
 Mon, 10 Jan 2022 18:59:26 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm3vsx48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:59:26 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AIqFep008816;
 Mon, 10 Jan 2022 18:59:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3df288xyd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 18:59:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AIxKsE27656474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 18:59:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83295A4054;
 Mon, 10 Jan 2022 18:59:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1712AA4064;
 Mon, 10 Jan 2022 18:59:20 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 18:59:19 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH] target/s390x: Fix 32-bit shifts
Date: Mon, 10 Jan 2022 19:59:18 +0100
Message-Id: <20220110185918.219154-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YlnW_EPa8ViY68-TdQey78If9lln2lnh
X-Proofpoint-GUID: lOyymvTDBLsGmFFvzdzfGNf_N1pQAW0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_07,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100126
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both 32- and 64-bit shifts use lowest 6 address bits. The current code
special-cases 32-bit shifts to use only 5 bits, which is not correct.

Fix by merging sh32 and sh64.

Fixes: cbe24bfa91d2 ("target-s390: Convert SHIFT, ROTATE SINGLE")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/insn-data.def  | 36 ++++++++++++++++-----------------
 target/s390x/tcg/translate.c    | 10 ++-------
 tests/tcg/s390x/Makefile.target |  1 +
 tests/tcg/s390x/sll.c           | 25 +++++++++++++++++++++++
 4 files changed, 46 insertions(+), 26 deletions(-)
 create mode 100644 tests/tcg/s390x/sll.c

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index f0af458aee..348a15be72 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -747,8 +747,8 @@
     C(0xb9e1, POPCNT,  RRE,   PC,  0, r2_o, r1, 0, popcnt, nz64)
 
 /* ROTATE LEFT SINGLE LOGICAL */
-    C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh32, new, r1_32, rll32, 0)
-    C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh64, r1, 0, rll64, 0)
+    C(0xeb1d, RLL,     RSY_a, Z,   r3_o, sh, new, r1_32, rll32, 0)
+    C(0xeb1c, RLLG,    RSY_a, Z,   r3_o, sh, r1, 0, rll64, 0)
 
 /* ROTATE THEN INSERT SELECTED BITS */
     C(0xec55, RISBG,   RIE_f, GIE, 0, r2, r1, 0, risbg, s64)
@@ -784,29 +784,29 @@
     C(0x0400, SPM,     RR_a,  Z,   r1, 0, 0, 0, spm, 0)
 
 /* SHIFT LEFT SINGLE */
-    D(0x8b00, SLA,     RS_a,  Z,   r1, sh32, new, r1_32, sla, 0, 31)
-    D(0xebdd, SLAK,    RSY_a, DO,  r3, sh32, new, r1_32, sla, 0, 31)
-    D(0xeb0b, SLAG,    RSY_a, Z,   r3, sh64, r1, 0, sla, 0, 63)
+    D(0x8b00, SLA,     RS_a,  Z,   r1, sh, new, r1_32, sla, 0, 31)
+    D(0xebdd, SLAK,    RSY_a, DO,  r3, sh, new, r1_32, sla, 0, 31)
+    D(0xeb0b, SLAG,    RSY_a, Z,   r3, sh, r1, 0, sla, 0, 63)
 /* SHIFT LEFT SINGLE LOGICAL */
-    C(0x8900, SLL,     RS_a,  Z,   r1_o, sh32, new, r1_32, sll, 0)
-    C(0xebdf, SLLK,    RSY_a, DO,  r3_o, sh32, new, r1_32, sll, 0)
-    C(0xeb0d, SLLG,    RSY_a, Z,   r3_o, sh64, r1, 0, sll, 0)
+    C(0x8900, SLL,     RS_a,  Z,   r1_o, sh, new, r1_32, sll, 0)
+    C(0xebdf, SLLK,    RSY_a, DO,  r3_o, sh, new, r1_32, sll, 0)
+    C(0xeb0d, SLLG,    RSY_a, Z,   r3_o, sh, r1, 0, sll, 0)
 /* SHIFT RIGHT SINGLE */
-    C(0x8a00, SRA,     RS_a,  Z,   r1_32s, sh32, new, r1_32, sra, s32)
-    C(0xebdc, SRAK,    RSY_a, DO,  r3_32s, sh32, new, r1_32, sra, s32)
-    C(0xeb0a, SRAG,    RSY_a, Z,   r3_o, sh64, r1, 0, sra, s64)
+    C(0x8a00, SRA,     RS_a,  Z,   r1_32s, sh, new, r1_32, sra, s32)
+    C(0xebdc, SRAK,    RSY_a, DO,  r3_32s, sh, new, r1_32, sra, s32)
+    C(0xeb0a, SRAG,    RSY_a, Z,   r3_o, sh, r1, 0, sra, s64)
 /* SHIFT RIGHT SINGLE LOGICAL */
-    C(0x8800, SRL,     RS_a,  Z,   r1_32u, sh32, new, r1_32, srl, 0)
-    C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh32, new, r1_32, srl, 0)
-    C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh64, r1, 0, srl, 0)
+    C(0x8800, SRL,     RS_a,  Z,   r1_32u, sh, new, r1_32, srl, 0)
+    C(0xebde, SRLK,    RSY_a, DO,  r3_32u, sh, new, r1_32, srl, 0)
+    C(0xeb0c, SRLG,    RSY_a, Z,   r3_o, sh, r1, 0, srl, 0)
 /* SHIFT LEFT DOUBLE */
-    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sla, 0, 31)
+    D(0x8f00, SLDA,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sla, 0, 31)
 /* SHIFT LEFT DOUBLE LOGICAL */
-    C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sll, 0)
+    C(0x8d00, SLDL,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sll, 0)
 /* SHIFT RIGHT DOUBLE */
-    C(0x8e00, SRDA,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, sra, s64)
+    C(0x8e00, SRDA,    RS_a,  Z,   r1_D32, sh, new, r1_D32, sra, s64)
 /* SHIFT RIGHT DOUBLE LOGICAL */
-    C(0x8c00, SRDL,    RS_a,  Z,   r1_D32, sh64, new, r1_D32, srl, 0)
+    C(0x8c00, SRDL,    RS_a,  Z,   r1_D32, sh, new, r1_D32, srl, 0)
 
 /* SQUARE ROOT */
     F(0xb314, SQEBR,   RRE,   Z,   0, e2, new, e1, sqeb, 0, IF_BFP)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f180853e7a..89e14b8f29 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5922,17 +5922,11 @@ static void in2_ri2(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in2_ri2 0
 
-static void in2_sh32(DisasContext *s, DisasOps *o)
-{
-    help_l2_shift(s, o, 31);
-}
-#define SPEC_in2_sh32 0
-
-static void in2_sh64(DisasContext *s, DisasOps *o)
+static void in2_sh(DisasContext *s, DisasOps *o)
 {
     help_l2_shift(s, o, 63);
 }
-#define SPEC_in2_sh64 0
+#define SPEC_in2_sh 0
 
 static void in2_m2_8u(DisasContext *s, DisasOps *o)
 {
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index cc64dd32d2..4212bab014 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -9,6 +9,7 @@ TESTS+=exrl-trtr
 TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
+TESTS+=sll
 TESTS+=trap
 TESTS+=signals-s390x
 
diff --git a/tests/tcg/s390x/sll.c b/tests/tcg/s390x/sll.c
new file mode 100644
index 0000000000..aba2a94676
--- /dev/null
+++ b/tests/tcg/s390x/sll.c
@@ -0,0 +1,25 @@
+#include <stdint.h>
+#include <unistd.h>
+
+int main(void)
+{
+    uint64_t op1 = 0xb90281a3105939dfull;
+    uint64_t op2 = 0xb5e4df7e082e4c5eull;
+    uint64_t cc = 0xffffffffffffffffull;
+
+    asm("sll\t%[op1],0xd04(%[op2])"
+        "\n\tipm\t%[cc]"
+        : [op1] "+r" (op1),
+          [cc] "+r" (cc)
+        : [op2] "r" (op2)
+        : "cc");
+    if (op1 != 0xb90281a300000000ull) {
+        write(1, "bad result\n", 11);
+        return 1;
+    }
+    if (cc != 0xffffffff10ffffffull) {
+        write(1, "bad cc\n", 7);
+        return 1;
+    }
+    return 0;
+}
-- 
2.31.1


