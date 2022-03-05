Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920C4CE45A
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:03:18 +0100 (CET)
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSBw-0004cw-Ut
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9X-0001cF-7v; Sat, 05 Mar 2022 06:00:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9V-00031d-72; Sat, 05 Mar 2022 06:00:46 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2258GKUK000679; 
 Sat, 5 Mar 2022 11:00:31 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3em474sn0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:30 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 225AsFwh010004;
 Sat, 5 Mar 2022 11:00:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3ekyg8rm62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 225AnN5534930994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Mar 2022 10:49:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E75342045;
 Sat,  5 Mar 2022 11:00:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 659344204F;
 Sat,  5 Mar 2022 11:00:25 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  5 Mar 2022 11:00:25 +0000 (GMT)
Received: from yukon.home (unknown [9.171.13.194])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9FF622203EC;
 Sat,  5 Mar 2022 12:00:24 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 11/13] target/ppc: split XXGENPCV macros for readability
Date: Sat,  5 Mar 2022 12:00:08 +0100
Message-Id: <20220305110010.1283654-12-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305110010.1283654-1-clg@kaod.org>
References: <20220305110010.1283654-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -DZ-9Vwy11Zx3wrMDGhw64D8f-x49rxq
X-Proofpoint-ORIG-GUID: -DZ-9Vwy11Zx3wrMDGhw64D8f-x49rxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-05_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 mlxlogscore=744 suspectscore=0 bulkscore=0 clxscore=1034 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203050057
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

Fixes: b090f4f1e3c9 ("target/ppc: Implement xxgenpcv[bhwd]m instruction")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220304175156.2012315-6-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/int_helper.c             | 28 +++++++++---
 target/ppc/translate/vsx-impl.c.inc | 71 +++++++++++++++--------------
 2 files changed, 57 insertions(+), 42 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index b2b17bb1ca5e..492f34c4992b 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1072,7 +1072,7 @@ void helper_VPERMR(ppc_avr_t *r, ppc_avr_t *a, ppc_=
avr_t *b, ppc_avr_t *c)
     *r =3D result;
 }
=20
-#define XXGENPCV(NAME, SZ) \
+#define XXGENPCV_BE_EXP(NAME, SZ) \
 void glue(helper_, glue(NAME, _be_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
 {                                                                   \
     ppc_vsr_t tmp;                                                  \
@@ -1093,8 +1093,9 @@ void glue(helper_, glue(NAME, _be_exp))(ppc_vsr_t *=
t, ppc_vsr_t *b) \
     }                                                               \
                                                                     \
     *t =3D tmp;                                                       \
-}                                                                   \
-                                                                    \
+}
+
+#define XXGENPCV_BE_COMP(NAME, SZ) \
 void glue(helper_, glue(NAME, _be_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
 {                                                                   \
     ppc_vsr_t tmp =3D { .u64 =3D { 0, 0 } };                            =
\
@@ -1111,8 +1112,9 @@ void glue(helper_, glue(NAME, _be_comp))(ppc_vsr_t =
*t, ppc_vsr_t *b)\
     }                                                               \
                                                                     \
     *t =3D tmp;                                                       \
-}                                                                   \
-                                                                    \
+}
+
+#define XXGENPCV_LE_EXP(NAME, SZ) \
 void glue(helper_, glue(NAME, _le_exp))(ppc_vsr_t *t, ppc_vsr_t *b) \
 {                                                                   \
     ppc_vsr_t tmp;                                                  \
@@ -1135,8 +1137,9 @@ void glue(helper_, glue(NAME, _le_exp))(ppc_vsr_t *=
t, ppc_vsr_t *b) \
     }                                                               \
                                                                     \
     *t =3D tmp;                                                       \
-}                                                                   \
-                                                                    \
+}
+
+#define XXGENPCV_LE_COMP(NAME, SZ) \
 void glue(helper_, glue(NAME, _le_comp))(ppc_vsr_t *t, ppc_vsr_t *b)\
 {                                                                   \
     ppc_vsr_t tmp =3D { .u64 =3D { 0, 0 } };                            =
\
@@ -1157,10 +1160,21 @@ void glue(helper_, glue(NAME, _le_comp))(ppc_vsr_=
t *t, ppc_vsr_t *b)\
     *t =3D tmp;                                                       \
 }
=20
+#define XXGENPCV(NAME, SZ) \
+    XXGENPCV_BE_EXP(NAME, SZ)  \
+    XXGENPCV_BE_COMP(NAME, SZ) \
+    XXGENPCV_LE_EXP(NAME, SZ)  \
+    XXGENPCV_LE_COMP(NAME, SZ) \
+
 XXGENPCV(XXGENPCVBM, 1)
 XXGENPCV(XXGENPCVHM, 2)
 XXGENPCV(XXGENPCVWM, 4)
 XXGENPCV(XXGENPCVDM, 8)
+
+#undef XXGENPCV_BE_EXP
+#undef XXGENPCV_BE_COMP
+#undef XXGENPCV_LE_EXP
+#undef XXGENPCV_LE_COMP
 #undef XXGENPCV
=20
 #if defined(HOST_WORDS_BIGENDIAN)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 2ffeab5287e9..48a97b2d7e70 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1204,43 +1204,44 @@ static bool trans_XXPERMX(DisasContext *ctx, arg_=
8RR_XX4_uim3 *a)
     return true;
 }
=20
-#define XXGENPCV(NAME) \
-static bool trans_##NAME(DisasContext *ctx, arg_X_imm5 *a)  \
-{                                                           \
-    TCGv_ptr xt, vrb;                                       \
-                                                            \
-    REQUIRE_INSNS_FLAGS2(ctx, ISA310);                      \
-    REQUIRE_VSX(ctx);                                       \
-                                                            \
-    if (a->imm & ~0x3) {                                    \
-        gen_invalid(ctx);                                   \
-        return true;                                        \
-    }                                                       \
-                                                            \
-    xt =3D gen_vsr_ptr(a->xt);                                \
-    vrb =3D gen_avr_ptr(a->vrb);                              \
-                                                            \
-    switch (a->imm) {                                       \
-    case 0b00000: /* Big-Endian expansion */                \
-        glue(gen_helper_, glue(NAME, _be_exp))(xt, vrb);    \
-        break;                                              \
-    case 0b00001: /* Big-Endian compression */              \
-        glue(gen_helper_, glue(NAME, _be_comp))(xt, vrb);   \
-        break;                                              \
-    case 0b00010: /* Little-Endian expansion */             \
-        glue(gen_helper_, glue(NAME, _le_exp))(xt, vrb);    \
-        break;                                              \
-    case 0b00011: /* Little-Endian compression */           \
-        glue(gen_helper_, glue(NAME, _le_comp))(xt, vrb);   \
-        break;                                              \
-    }                                                       \
-                                                            \
-    tcg_temp_free_ptr(xt);                                  \
-    tcg_temp_free_ptr(vrb);                                 \
-                                                            \
-    return true;                                            \
+typedef void (*xxgenpcv_genfn)(TCGv_ptr, TCGv_ptr);
+
+static bool do_xxgenpcv(DisasContext *ctx, arg_X_imm5 *a,
+                        const xxgenpcv_genfn fn[4])
+{
+    TCGv_ptr xt, vrb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    if (a->imm & ~0x3) {
+        gen_invalid(ctx);
+        return true;
+    }
+
+    xt =3D gen_vsr_ptr(a->xt);
+    vrb =3D gen_avr_ptr(a->vrb);
+
+    fn[a->imm](xt, vrb);
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(vrb);
+
+    return true;
 }
=20
+#define XXGENPCV(NAME) \
+    static bool trans_##NAME(DisasContext *ctx, arg_X_imm5 *a)  \
+    {                                                           \
+        static const xxgenpcv_genfn fn[4] =3D {                   \
+            gen_helper_##NAME##_be_exp,                         \
+            gen_helper_##NAME##_be_comp,                        \
+            gen_helper_##NAME##_le_exp,                         \
+            gen_helper_##NAME##_le_comp,                        \
+        };                                                      \
+        return do_xxgenpcv(ctx, a, fn);                         \
+    }
+
 XXGENPCV(XXGENPCVBM)
 XXGENPCV(XXGENPCVHM)
 XXGENPCV(XXGENPCVWM)
--=20
2.34.1


