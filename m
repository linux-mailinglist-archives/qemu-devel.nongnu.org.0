Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED524CA4A8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:19:02 +0100 (CET)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNwc-0000Ap-0B
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:19:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrC-0001NP-UV; Wed, 02 Mar 2022 06:09:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrA-0001s5-U7; Wed, 02 Mar 2022 06:09:22 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229Y5mm002455; 
 Wed, 2 Mar 2022 11:08:48 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej38v5eeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:47 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2dUL022348;
 Wed, 2 Mar 2022 11:08:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8g9i51446156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CABA4C040;
 Wed,  2 Mar 2022 11:08:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AAE24C044;
 Wed,  2 Mar 2022 11:08:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A15BE220294;
 Wed,  2 Mar 2022 12:08:41 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 51/87] target/ppc: Implement xs{max,min}cqp
Date: Wed,  2 Mar 2022 12:07:27 +0100
Message-Id: <20220302110803.849505-52-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4A-TLyvp5oXWbeRZ2KP-861hKwmWGyge
X-Proofpoint-GUID: 4A-TLyvp5oXWbeRZ2KP-861hKwmWGyge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1034 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=542 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Peter Maydell <peter.maydell@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-46-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 | 2 ++
 target/ppc/insn32.decode            | 3 +++
 target/ppc/fpu_helper.c             | 2 ++
 target/ppc/translate/vsx-impl.c.inc | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index e37614f45b63..0ca28555f2d9 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -377,6 +377,8 @@ DEF_HELPER_4(XSMAXCDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSMINCDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSMAXJDP, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(XSMINJDP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMAXCQP, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(XSMINCQP, void, env, vsr, vsr, vsr)
 DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6fbb2d188f51..126cadadb8b0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -664,6 +664,9 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ...=
   @XX3
 XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
 XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
 XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+XSMAXCQP        111111 ..... ..... ..... 1010100100 -   @X
+XSMINCQP        111111 ..... ..... ..... 1011100100 -   @X
+
 XSCMPEQDP       111100 ..... ..... ..... 00000011 ...   @XX3
 XSCMPGEDP       111100 ..... ..... ..... 00010011 ...   @XX3
 XSCMPGTDP       111100 ..... ..... ..... 00001011 ...   @XX3
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 0aaf529ac8d0..714400731611 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2560,6 +2560,8 @@ void helper_##name(CPUPPCState *env,               =
                           \
=20
 VSX_MAX_MINC(XSMAXCDP, true, float64, VsrD(0));
 VSX_MAX_MINC(XSMINCDP, false, float64, VsrD(0));
+VSX_MAX_MINC(XSMAXCQP, true, float128, f128);
+VSX_MAX_MINC(XSMINCQP, false, float128, f128);
=20
 #define VSX_MAX_MINJ(name, max)                                         =
      \
 void helper_##name(CPUPPCState *env,                                    =
      \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index 5273452d1370..3b0c8bf3ca07 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2645,6 +2645,8 @@ static bool do_xscmpqp(DisasContext *ctx, arg_X *a,
 TRANS(XSCMPEQQP, do_xscmpqp, gen_helper_XSCMPEQQP)
 TRANS(XSCMPGEQP, do_xscmpqp, gen_helper_XSCMPGEQP)
 TRANS(XSCMPGTQP, do_xscmpqp, gen_helper_XSCMPGTQP)
+TRANS(XSMAXCQP, do_xscmpqp, gen_helper_XSMAXCQP)
+TRANS(XSMINCQP, do_xscmpqp, gen_helper_XSMINCQP)
=20
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
--=20
2.34.1


