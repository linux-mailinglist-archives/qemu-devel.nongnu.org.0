Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A094CA33A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:18:08 +0100 (CET)
Received: from localhost ([::1]:53894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMzf-0007Cg-S1
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqH-0008IS-Hm; Wed, 02 Mar 2022 06:08:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18012
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqF-0001hC-Np; Wed, 02 Mar 2022 06:08:25 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AtTkb001554; 
 Wed, 2 Mar 2022 11:08:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej51mb54b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2ftR022128;
 Wed, 2 Mar 2022 11:08:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu9efhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8CTq48890164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96C6F4C046;
 Wed,  2 Mar 2022 11:08:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BA744C04E;
 Wed,  2 Mar 2022 11:08:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 72514220294;
 Wed,  2 Mar 2022 12:08:11 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 07/87] target/ppc: Introduce TRANS*FLAGS macros
Date: Wed,  2 Mar 2022 12:06:43 +0100
Message-Id: <20220302110803.849505-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CoCCZLx3amwptisPafz4XL6Ww2ogr-HR
X-Proofpoint-ORIG-GUID: CoCCZLx3amwptisPafz4XL6Ww2ogr-HR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxlogscore=778
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

New macros that add FLAGS and FLAGS2 checking were added for
both TRANS and TRANS64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
[ferst: - TRANS_FLAGS2 instead of TRANS_FLAGS_E
        - Use the new macros in load/store vector insns ]
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-2-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/translate.c              | 19 +++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 37 ++++++++++-------------------
 2 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ecc5a104e049..b46a11386eee 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6604,10 +6604,29 @@ static int times_16(DisasContext *ctx, int x)
 #define TRANS(NAME, FUNC, ...) \
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
     { return FUNC(ctx, a, __VA_ARGS__); }
+#define TRANS_FLAGS(FLAGS, NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    {                                                          \
+        REQUIRE_INSNS_FLAGS(ctx, FLAGS);                       \
+        return FUNC(ctx, a, __VA_ARGS__);                      \
+    }
+#define TRANS_FLAGS2(FLAGS2, NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    {                                                          \
+        REQUIRE_INSNS_FLAGS2(ctx, FLAGS2);                     \
+        return FUNC(ctx, a, __VA_ARGS__);                      \
+    }
=20
 #define TRANS64(NAME, FUNC, ...) \
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
     { REQUIRE_64BIT(ctx); return FUNC(ctx, a, __VA_ARGS__); }
+#define TRANS64_FLAGS2(FLAGS2, NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    {                                                          \
+        REQUIRE_64BIT(ctx);                                    \
+        REQUIRE_INSNS_FLAGS2(ctx, FLAGS2);                     \
+        return FUNC(ctx, a, __VA_ARGS__);                      \
+    }
=20
 /* TODO: More TRANS* helpers for extra insn_flags checks. */
=20
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 128968b5e7a8..e8a4ba0cfa60 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2072,12 +2072,6 @@ static bool do_lstxv(DisasContext *ctx, int ra, TC=
Gv displ,
=20
 static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store, bool pai=
red)
 {
-    if (paired) {
-        REQUIRE_INSNS_FLAGS2(ctx, ISA310);
-    } else {
-        REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-    }
-
     if (paired || a->rt >=3D 32) {
         REQUIRE_VSX(ctx);
     } else {
@@ -2091,7 +2085,6 @@ static bool do_lstxv_PLS_D(DisasContext *ctx, arg_P=
LS_D *a,
                            bool store, bool paired)
 {
     arg_D d;
-    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
     REQUIRE_VSX(ctx);
=20
     if (!resolve_PLS_D(ctx, &d, a)) {
@@ -2103,12 +2096,6 @@ static bool do_lstxv_PLS_D(DisasContext *ctx, arg_=
PLS_D *a,
=20
 static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store, bool pai=
red)
 {
-    if (paired) {
-        REQUIRE_INSNS_FLAGS2(ctx, ISA310);
-    } else {
-        REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-    }
-
     if (paired || a->rt >=3D 32) {
         REQUIRE_VSX(ctx);
     } else {
@@ -2118,18 +2105,18 @@ static bool do_lstxv_X(DisasContext *ctx, arg_X *=
a, bool store, bool paired)
     return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store, paired);
 }
=20
-TRANS(STXV, do_lstxv_D, true, false)
-TRANS(LXV, do_lstxv_D, false, false)
-TRANS(STXVP, do_lstxv_D, true, true)
-TRANS(LXVP, do_lstxv_D, false, true)
-TRANS(STXVX, do_lstxv_X, true, false)
-TRANS(LXVX, do_lstxv_X, false, false)
-TRANS(STXVPX, do_lstxv_X, true, true)
-TRANS(LXVPX, do_lstxv_X, false, true)
-TRANS64(PSTXV, do_lstxv_PLS_D, true, false)
-TRANS64(PLXV, do_lstxv_PLS_D, false, false)
-TRANS64(PSTXVP, do_lstxv_PLS_D, true, true)
-TRANS64(PLXVP, do_lstxv_PLS_D, false, true)
+TRANS_FLAGS2(ISA300, STXV, do_lstxv_D, true, false)
+TRANS_FLAGS2(ISA300, LXV, do_lstxv_D, false, false)
+TRANS_FLAGS2(ISA310, STXVP, do_lstxv_D, true, true)
+TRANS_FLAGS2(ISA310, LXVP, do_lstxv_D, false, true)
+TRANS_FLAGS2(ISA300, STXVX, do_lstxv_X, true, false)
+TRANS_FLAGS2(ISA300, LXVX, do_lstxv_X, false, false)
+TRANS_FLAGS2(ISA310, STXVPX, do_lstxv_X, true, true)
+TRANS_FLAGS2(ISA310, LXVPX, do_lstxv_X, false, true)
+TRANS64_FLAGS2(ISA310, PSTXV, do_lstxv_PLS_D, true, false)
+TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false, false)
+TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
+TRANS64_FLAGS2(ISA310, PLXVP, do_lstxv_PLS_D, false, true)
=20
 static void gen_xxblendv_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv=
_vec b,
                              TCGv_vec c)
--=20
2.34.1


