Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB55477FFF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:24:52 +0100 (CET)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxzBD-0002eE-15
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLs-0003lq-Hf; Thu, 16 Dec 2021 15:27:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLo-0007Ta-Na; Thu, 16 Dec 2021 15:27:44 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGInErn038697; 
 Thu, 16 Dec 2021 20:27:11 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cymkwfktq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:11 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDXwi026891;
 Thu, 16 Dec 2021 20:27:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3cy77pj81n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKR6kv29491708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D0E1AE055;
 Thu, 16 Dec 2021 20:27:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CAE7AE045;
 Thu, 16 Dec 2021 20:27:06 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:05 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5288E220238;
 Thu, 16 Dec 2021 21:27:05 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 075/101] target/ppc: Fix xs{max, min}[cj]dp to use VSX registers
Date: Thu, 16 Dec 2021 21:25:48 +0100
Message-Id: <20211216202614.414266-76-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BRV8qDdLTvPFaG4HEn8aMCH5On_jTBqZ
X-Proofpoint-ORIG-GUID: BRV8qDdLTvPFaG4HEn8aMCH5On_jTBqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1034 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=460 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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

PPC instruction xsmaxcdp, xsmincdp, xsmaxjdp, and xsminjdp are using
vector registers when they should be using VSX ones. This happens
because the instructions are using GEN_VSX_HELPER_R3, which adds 32
to the register numbers, effectively making them vector registers.

This patch fixes it by changing these instructions to use
GEN_VSX_HELPER_X3.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Victor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20211213120958.24443-2-victor.colombo@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h                 | 8 ++++----
 target/ppc/fpu_helper.c             | 4 ++--
 target/ppc/translate/vsx-impl.c.inc | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 72b2c70ac1fc..fb946dc97420 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -403,10 +403,10 @@ DEF_HELPER_4(xscmpoqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscmpuqp, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xsmaxdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xsmindp, void, env, vsr, vsr, vsr)
-DEF_HELPER_5(xsmaxcdp, void, env, i32, vsr, vsr, vsr)
-DEF_HELPER_5(xsmincdp, void, env, i32, vsr, vsr, vsr)
-DEF_HELPER_5(xsmaxjdp, void, env, i32, vsr, vsr, vsr)
-DEF_HELPER_5(xsminjdp, void, env, i32, vsr, vsr, vsr)
+DEF_HELPER_4(xsmaxcdp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(xsmincdp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(xsmaxjdp, void, env, vsr, vsr, vsr)
+DEF_HELPER_4(xsminjdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 1e9a16154036..d144f21dc04f 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2495,7 +2495,7 @@ VSX_MAX_MIN(xvmindp, minnum, 2, float64, VsrD(i))
 VSX_MAX_MIN(xvminsp, minnum, 4, float32, VsrW(i))
=20
 #define VSX_MAX_MINC(name, max)                                         =
      \
-void helper_##name(CPUPPCState *env, uint32_t opcode,                   =
      \
+void helper_##name(CPUPPCState *env,                                    =
      \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)         =
      \
 {                                                                       =
      \
     ppc_vsr_t t =3D *xt;                                                =
        \
@@ -2530,7 +2530,7 @@ VSX_MAX_MINC(xsmaxcdp, 1);
 VSX_MAX_MINC(xsmincdp, 0);
=20
 #define VSX_MAX_MINJ(name, max)                                         =
      \
-void helper_##name(CPUPPCState *env, uint32_t opcode,                   =
      \
+void helper_##name(CPUPPCState *env,                                    =
      \
                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)         =
      \
 {                                                                       =
      \
     ppc_vsr_t t =3D *xt;                                                =
        \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
index c0e38060b455..02df75339ed2 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1098,10 +1098,10 @@ GEN_VSX_HELPER_R2_AB(xscmpoqp, 0x04, 0x04, 0, PPC=
2_VSX)
 GEN_VSX_HELPER_R2_AB(xscmpuqp, 0x04, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmaxdp, 0x00, 0x14, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xsmindp, 0x00, 0x15, 0, PPC2_VSX)
-GEN_VSX_HELPER_R3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
-GEN_VSX_HELPER_R3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
-GEN_VSX_HELPER_R3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
-GEN_VSX_HELPER_R3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
+GEN_VSX_HELPER_X3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
+GEN_VSX_HELPER_X3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
+GEN_VSX_HELPER_X3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
+GEN_VSX_HELPER_X3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvdpsp, 0x12, 0x10, 0, PPC2_VSX)
 GEN_VSX_HELPER_R2(xscvdpqp, 0x04, 0x1A, 0x16, PPC2_ISA300)
--=20
2.31.1


