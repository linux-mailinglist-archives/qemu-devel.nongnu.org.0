Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346094760B8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:28:31 +0100 (CET)
Received: from localhost ([::1]:37480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ0w-0003na-9R
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:28:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXig-0005Xd-70; Wed, 15 Dec 2021 12:05:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7798
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiP-0004mt-3E; Wed, 15 Dec 2021 12:05:32 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfa9J020485; 
 Wed, 15 Dec 2021 17:04:52 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyhyk436t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:51 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3UTA013453;
 Wed, 15 Dec 2021 17:04:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3cy7sjf30g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4lRj21692758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63CFAAE053;
 Wed, 15 Dec 2021 17:04:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FBC8AE059;
 Wed, 15 Dec 2021 17:04:47 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:47 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4443B220295;
 Wed, 15 Dec 2021 18:04:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 076/102] target/ppc: Move xs{max,min}[cj]dp to decodetree
Date: Wed, 15 Dec 2021 18:03:31 +0100
Message-Id: <20211215170357.321643-64-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZBW-zCpZzuPlqKf9FYPgz-Kz44q5IU55
X-Proofpoint-ORIG-GUID: ZBW-zCpZzuPlqKf9FYPgz-Kz44q5IU55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 mlxlogscore=784 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Victor Colombo <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Colombo <victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Victor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20211213120958.24443-3-victor.colombo@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            | 17 +++++++++++++---
 target/ppc/translate/vsx-impl.c.inc | 30 +++++++++++++++++++++++++----
 target/ppc/translate/vsx-ops.c.inc  |  4 ----
 3 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f68931f4f374..97b2476ce61b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -130,10 +130,14 @@
 &X_vrt_frbp     vrt frbp
 @X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_f=
rbp frbp=3D%x_frbp
=20
+%xx_xt          0:1 21:5
+%xx_xb          1:1 11:5
+%xx_xa          2:1 16:5
 &XX2            xt xb uim:uint8_t
-%xx2_xt         0:1 21:5
-%xx2_xb         1:1 11:5
-@XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=3D=
%xx2_xt xb=3D%xx2_xb
+@XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=3D=
%xx_xt xb=3D%xx_xb
+
+&XX3            xt xa xb
+@XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=3D=
%xx_xt xa=3D%xx_xa xb=3D%xx_xb
=20
 &Z22_bf_fra     bf fra dm
 @Z22_bf_fra     ...... bf:3 .. fra:5 dm:6 ......... .           &Z22_bf_=
fra
@@ -455,3 +459,10 @@ XXSPLTW         111100 ..... ---.. ..... 010100100 .=
 .  @XX2
 ## VSX Vector Load Special Value Instruction
=20
 LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
+
+## VSX Comparison Instructions
+
+XSMAXCDP        111100 ..... ..... ..... 10000000 ...   @XX3
+XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
+XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
+XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 02df75339ed2..e2447750ddec 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1098,10 +1098,6 @@ GEN_VSX_HELPER_R2_AB(xscmpoqp, 0x04, 0x04, 0, PPC2=
_VSX)
 GEN_VSX_HELPER_R2_AB(xscmpuqp, 0x04, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmaxdp, 0x00, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmindp, 0x00, 0x15, 0, PPC2_VSX)
-GEN_VSX_HELPER_X3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
-GEN_VSX_HELPER_X3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdpsp, 0x12, 0x10, 0, PPC2_VSX)
 GEN_VSX_HELPER_R2(xscvdpqp, 0x04, 0x1A, 0x16, PPC2_ISA300)
@@ -2185,6 +2181,32 @@ TRANS(XXBLENDVH, do_xxblendv, MO_16)
 TRANS(XXBLENDVW, do_xxblendv, MO_32)
 TRANS(XXBLENDVD, do_xxblendv, MO_64)
=20
+static bool do_xsmaxmincjdp(DisasContext *ctx, arg_XX3 *a,
+                            void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr,=
 TCGv_ptr))
+{
+    TCGv_ptr xt, xa, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    xt =3D gen_vsr_ptr(a->xt);
+    xa =3D gen_vsr_ptr(a->xa);
+    xb =3D gen_vsr_ptr(a->xb);
+
+    helper(cpu_env, xt, xa, xb);
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xa);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
+
+TRANS(XSMAXCDP, do_xsmaxmincjdp, gen_helper_xsmaxcdp)
+TRANS(XSMINCDP, do_xsmaxmincjdp, gen_helper_xsmincdp)
+TRANS(XSMAXJDP, do_xsmaxmincjdp, gen_helper_xsmaxjdp)
+TRANS(XSMINJDP, do_xsmaxmincjdp, gen_helper_xsminjdp)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vs=
x-ops.c.inc
index 152d1e5c3bfb..f980bc1bae47 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -207,10 +207,6 @@ GEN_VSX_XFORM_300(xscmpoqp, 0x04, 0x04, 0x00600001),
 GEN_VSX_XFORM_300(xscmpuqp, 0x04, 0x14, 0x00600001),
 GEN_XX3FORM(xsmaxdp, 0x00, 0x14, PPC2_VSX),
 GEN_XX3FORM(xsmindp, 0x00, 0x15, PPC2_VSX),
-GEN_XX3FORM(xsmaxcdp, 0x00, 0x10, PPC2_ISA300),
-GEN_XX3FORM(xsmincdp, 0x00, 0x11, PPC2_ISA300),
-GEN_XX3FORM(xsmaxjdp, 0x00, 0x12, PPC2_ISA300),
-GEN_XX3FORM(xsminjdp, 0x00, 0x13, PPC2_ISA300),
 GEN_XX2FORM_EO(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300),
 GEN_XX2FORM(xscvdpsp, 0x12, 0x10, PPC2_VSX),
 GEN_XX2FORM(xscvdpspn, 0x16, 0x10, PPC2_VSX207),
--=20
2.31.1


