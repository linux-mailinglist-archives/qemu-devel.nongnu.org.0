Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69244CA468
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:04:53 +0100 (CET)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNiu-0008AR-MJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr2-00012F-1o; Wed, 02 Mar 2022 06:09:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17122
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMr0-0001p5-G4; Wed, 02 Mar 2022 06:09:11 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AmYVV030462; 
 Wed, 2 Mar 2022 11:08:46 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75ercre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:45 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B33NE030118;
 Wed, 2 Mar 2022 11:08:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu95240-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8frT54460920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E00A5207A;
 Wed,  2 Mar 2022 11:08:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 03A6252077;
 Wed,  2 Mar 2022 11:08:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 45AFE220294;
 Wed,  2 Mar 2022 12:08:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 49/87] target/ppc: Move xs{max, min}[cj]dp to use do_helper_XX3
Date: Wed,  2 Mar 2022 12:07:25 +0100
Message-Id: <20220302110803.849505-50-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P34dZtDS4KpIJ0Wuhsdm-PLYz5NtvoDy
X-Proofpoint-GUID: P34dZtDS4KpIJ0Wuhsdm-PLYz5NtvoDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=710
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Also, fixes these instructions not being capitalized.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-44-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 |  8 ++++----
 target/ppc/fpu_helper.c             |  8 ++++----
 target/ppc/translate/vsx-impl.c.inc | 30 ++++-------------------------
 3 files changed, 12 insertions(+), 34 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 567488b28091..e37614f45b63 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -373,10 +373,10 @@ DEF_HELPER_4(xscmpoqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscmpuqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xsmaxdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xsmindp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xsmaxcdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xsmincdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xsmaxjdp, void, env, vsr, vsr, vsr)
-DEF_HELPER_4(xsminjdp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMAXCDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMINCDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMAXJDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMINJDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 4d67180bec74..4bfa1c428311 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2565,8 +2565,8 @@ void helper_##name(CPUPPCState *env,               =
                           \
     }                                                                   =
      \
 }                                                                       =
      \
=20
-VSX_MAX_MINC(xsmaxcdp, 1);
-VSX_MAX_MINC(xsmincdp, 0);
+VSX_MAX_MINC(XSMAXCDP, 1);
+VSX_MAX_MINC(XSMINCDP, 0);
=20
 #define VSX_MAX_MINJ(name, max)                                         =
      \
 void helper_##name(CPUPPCState *env,                                    =
      \
@@ -2620,8 +2620,8 @@ void helper_##name(CPUPPCState *env,               =
                           \
     }                                                                   =
      \
 }                                                                       =
      \
=20
-VSX_MAX_MINJ(xsmaxjdp, 1);
-VSX_MAX_MINJ(xsminjdp, 0);
+VSX_MAX_MINJ(XSMAXJDP, 1);
+VSX_MAX_MINJ(XSMINJDP, 0);
=20
 /*
  * VSX_CMP - VSX floating point compare
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index fca25c267b97..5273452d1370 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2610,32 +2610,10 @@ static bool do_helper_XX3(DisasContext *ctx, arg_=
XX3 *a,
 TRANS(XSCMPEQDP, do_helper_XX3, gen_helper_XSCMPEQDP)
 TRANS(XSCMPGEDP, do_helper_XX3, gen_helper_XSCMPGEDP)
 TRANS(XSCMPGTDP, do_helper_XX3, gen_helper_XSCMPGTDP)
-
-static bool do_xsmaxmincjdp(DisasContext *ctx, arg_XX3 *a,
-                            void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr,=
 TCGv_ptr))
-{
-    TCGv_ptr xt, xa, xb;
-
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-    REQUIRE_VSX(ctx);
-
-    xt =3D gen_vsr_ptr(a->xt);
-    xa =3D gen_vsr_ptr(a->xa);
-    xb =3D gen_vsr_ptr(a->xb);
-
-    helper(cpu_env, xt, xa, xb);
-
-    tcg_temp_free_ptr(xt);
-    tcg_temp_free_ptr(xa);
-    tcg_temp_free_ptr(xb);
-
-    return true;
-}
-
-TRANS(XSMAXCDP, do_xsmaxmincjdp, gen_helper_xsmaxcdp)
-TRANS(XSMINCDP, do_xsmaxmincjdp, gen_helper_xsmincdp)
-TRANS(XSMAXJDP, do_xsmaxmincjdp, gen_helper_xsmaxjdp)
-TRANS(XSMINJDP, do_xsmaxmincjdp, gen_helper_xsminjdp)
+TRANS(XSMAXCDP, do_helper_XX3, gen_helper_XSMAXCDP)
+TRANS(XSMINCDP, do_helper_XX3, gen_helper_XSMINCDP)
+TRANS(XSMAXJDP, do_helper_XX3, gen_helper_XSMAXJDP)
+TRANS(XSMINJDP, do_helper_XX3, gen_helper_XSMINJDP)
=20
 static bool do_helper_X(arg_X *a,
     void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
--=20
2.34.1


