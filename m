Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9C4CA3E8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:37:28 +0100 (CET)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNIN-00072f-DO
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:37:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqu-0000mn-RA; Wed, 02 Mar 2022 06:09:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqr-0001nL-UP; Wed, 02 Mar 2022 06:09:03 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228kiMm031009; 
 Wed, 2 Mar 2022 11:08:30 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5ccaqm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:30 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dUI022348;
 Wed, 2 Mar 2022 11:08:28 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8PAn42205492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF2AB4203F;
 Wed,  2 Mar 2022 11:08:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CB0842041;
 Wed,  2 Mar 2022 11:08:25 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:25 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D2E6B2201C1;
 Wed,  2 Mar 2022 12:08:24 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 26/87] target/ppc: implement vslq
Date: Wed,  2 Mar 2022 12:07:02 +0100
Message-Id: <20220302110803.849505-27-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _G7chZFGD6AZ7l5rh6s7OHN6q7QT5iKF
X-Proofpoint-GUID: _G7chZFGD6AZ7l5rh6s7OHN6q7QT5iKF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1034 bulkscore=0
 mlxlogscore=694 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-21-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 40 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 88baebe35e4c..379906550877 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -473,6 +473,7 @@ VSLB            000100 ..... ..... ..... 00100000100 =
   @VX
 VSLH            000100 ..... ..... ..... 00101000100    @VX
 VSLW            000100 ..... ..... ..... 00110000100    @VX
 VSLD            000100 ..... ..... ..... 10111000100    @VX
+VSLQ            000100 ..... ..... ..... 00100000101    @VX
=20
 VSRB            000100 ..... ..... ..... 01000000100    @VX
 VSRH            000100 ..... ..... ..... 01001000100    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 1b05b0b3a35e..49c722e8625c 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -834,6 +834,46 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_1=
6, tcg_gen_gvec_sarv);
 TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv=
);
 TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec=
_sarv);
=20
+static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
+{
+    TCGv_i64 hi, lo, t0, n, zero =3D tcg_constant_i64(0);
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    n =3D tcg_temp_new_i64();
+    hi =3D tcg_temp_new_i64();
+    lo =3D tcg_temp_new_i64();
+    t0 =3D tcg_temp_new_i64();
+
+    get_avr64(lo, a->vra, false);
+    get_avr64(hi, a->vra, true);
+
+    get_avr64(n, a->vrb, true);
+
+    tcg_gen_andi_i64(t0, n, 64);
+    tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, lo, hi);
+    tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, zero, lo);
+    tcg_gen_andi_i64(n, n, 0x3F);
+
+    tcg_gen_shl_i64(t0, lo, n);
+    set_avr64(a->vrt, t0, false);
+
+    tcg_gen_shl_i64(hi, hi, n);
+    tcg_gen_xori_i64(n, n, 63);
+    tcg_gen_shr_i64(lo, lo, n);
+    tcg_gen_shri_i64(lo, lo, 1);
+    tcg_gen_or_i64(hi, hi, lo);
+    set_avr64(a->vrt, hi, true);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(n);
+
+    return true;
+}
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               =
\
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     =
\
                                          TCGv_vec sat, TCGv_vec a,      =
\
--=20
2.34.1


