Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED584CA3F8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:41:24 +0100 (CET)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNMB-0004Wv-5W
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:41:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqx-0000pV-6Q; Wed, 02 Mar 2022 06:09:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqs-0001nS-G9; Wed, 02 Mar 2022 06:09:06 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AOHgo032539; 
 Wed, 2 Mar 2022 11:08:32 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej4h3kqkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:31 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2gtu022356;
 Wed, 2 Mar 2022 11:08:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu9efja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8RfC40960390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0ABAA407C;
 Wed,  2 Mar 2022 11:08:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DA2CA4069;
 Wed,  2 Mar 2022 11:08:27 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:27 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C32F4220294;
 Wed,  2 Mar 2022 12:08:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 29/87] target/ppc: move vrl[bhwd] to decodetree
Date: Wed,  2 Mar 2022 12:07:05 +0100
Message-Id: <20220302110803.849505-30-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 13SBlW_vYQ2gdJY6aJe7IkXeO39lM_0j
X-Proofpoint-GUID: 13SBlW_vYQ2gdJY6aJe7IkXeO39lM_0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1034 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=853 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Message-Id: <20220225210936.1749575-24-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  5 +++++
 target/ppc/translate/vmx-impl.c.inc | 13 +++++--------
 target/ppc/translate/vmx-ops.c.inc  |  6 ++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 7a9fc1dffa38..d918e2d0f29f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -487,6 +487,11 @@ VSRAW           000100 ..... ..... ..... 01110000100=
    @VX
 VSRAD           000100 ..... ..... ..... 01111000100    @VX
 VSRAQ           000100 ..... ..... ..... 01100000101    @VX
=20
+VRLB            000100 ..... ..... ..... 00000000100    @VX
+VRLH            000100 ..... ..... ..... 00001000100    @VX
+VRLW            000100 ..... ..... ..... 00010000100    @VX
+VRLD            000100 ..... ..... ..... 00011000100    @VX
+
 ## Vector Integer Arithmetic Instructions
=20
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index 27ed87fcd6db..f24b78d42efc 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -834,6 +834,11 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_1=
6, tcg_gen_gvec_sarv);
 TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv=
);
 TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec=
_sarv);
=20
+TRANS_FLAGS(ALTIVEC, VRLB, do_vector_gvec3_VX, MO_8, tcg_gen_gvec_rotlv)
+TRANS_FLAGS(ALTIVEC, VRLH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_rotlv=
)
+TRANS_FLAGS(ALTIVEC, VRLW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_rotlv=
)
+TRANS_FLAGS2(ALTIVEC_207, VRLD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_=
rotlv)
+
 static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool righ=
t,
                                  bool alg)
 {
@@ -970,16 +975,8 @@ GEN_VXFORM3(vsubeuqm, 31, 0);
 GEN_VXFORM3(vsubecuq, 31, 0);
 GEN_VXFORM_DUAL(vsubeuqm, PPC_NONE, PPC2_ALTIVEC_207, \
             vsubecuq, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXFORM_V(vrlb, MO_8, tcg_gen_gvec_rotlv, 2, 0);
-GEN_VXFORM_V(vrlh, MO_16, tcg_gen_gvec_rotlv, 2, 1);
-GEN_VXFORM_V(vrlw, MO_32, tcg_gen_gvec_rotlv, 2, 2);
 GEN_VXFORM(vrlwmi, 2, 2);
-GEN_VXFORM_DUAL(vrlw, PPC_ALTIVEC, PPC_NONE, \
-                vrlwmi, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_V(vrld, MO_64, tcg_gen_gvec_rotlv, 2, 3);
 GEN_VXFORM(vrldmi, 2, 3);
-GEN_VXFORM_DUAL(vrld, PPC_NONE, PPC2_ALTIVEC_207, \
-                vrldmi, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_TRANS(vsl, 2, 7);
 GEN_VXFORM(vrldnm, 2, 7);
 GEN_VXFORM_DUAL(vsl, PPC_ALTIVEC, PPC_NONE, \
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vm=
x-ops.c.inc
index 878bce92c6a4..a7acea3ca78e 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -133,10 +133,8 @@ GEN_VXFORM_DUAL(vaddeuqm, vaddecuq, 30, 0xFF, PPC_NO=
NE, PPC2_ALTIVEC_207),
 GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300)=
,
 GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300=
),
 GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207=
),
-GEN_VXFORM(vrlb, 2, 0),
-GEN_VXFORM(vrlh, 2, 1),
-GEN_VXFORM_DUAL(vrlw, vrlwmi, 2, 2, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_DUAL(vrld, vrldmi, 2, 3, PPC_NONE, PPC2_ALTIVEC_207),
+GEN_VXFORM_300(vrlwmi, 2, 2),
+GEN_VXFORM_300(vrldmi, 2, 3),
 GEN_VXFORM_DUAL(vsl, vrldnm, 2, 7, PPC_ALTIVEC, PPC_NONE),
 GEN_VXFORM(vsr, 2, 11),
 GEN_VXFORM(vpkuhum, 7, 0),
--=20
2.34.1


