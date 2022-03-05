Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB06B4CE463
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:07:11 +0100 (CET)
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQSFi-0003S9-SD
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9V-0001WQ-An; Sat, 05 Mar 2022 06:00:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQS9T-000310-DQ; Sat, 05 Mar 2022 06:00:45 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2259kj17009768; 
 Sat, 5 Mar 2022 11:00:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3em5hf8qrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:28 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 225B0PQD010362;
 Sat, 5 Mar 2022 11:00:28 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3em5hf8qqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:27 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 225Arsrk022896;
 Sat, 5 Mar 2022 11:00:25 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3ekyg90qbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 05 Mar 2022 11:00:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 225B0MCo53215540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 5 Mar 2022 11:00:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFBD8AE045;
 Sat,  5 Mar 2022 11:00:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77C88AE04D;
 Sat,  5 Mar 2022 11:00:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  5 Mar 2022 11:00:22 +0000 (GMT)
Received: from yukon.home (unknown [9.171.13.194])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 832A72203EC;
 Sat,  5 Mar 2022 12:00:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 07/13] target/ppc: Fix vmul[eo]* instructions marked 2.07
Date: Sat,  5 Mar 2022 12:00:04 +0100
Message-Id: <20220305110010.1283654-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220305110010.1283654-1-clg@kaod.org>
References: <20220305110010.1283654-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BrVsER2Qq02w8NHLfRlmzAIUOPNYs2c7
X-Proofpoint-ORIG-GUID: S6PYcPjfyqEc8Uj9mYh9OiJsMZFDhono
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-05_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 adultscore=0 clxscore=1034 phishscore=0 mlxlogscore=518
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
 Fabiano Rosas <farosas@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Some ISA v2.03 Vector Multiply instructions marked to be ISA v2.07 only.
This patch fixes it.

Fixes: 80eca687c851 ("target/ppc: moved vector even and odd multiplicatio=
n to decodetree")
Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220304175156.2012315-2-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/translate/vmx-impl.c.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
index f91bee839d94..c5d02d13fe52 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3141,14 +3141,14 @@ static bool trans_VMULLD(DisasContext *ctx, arg_V=
X *a)
     return true;
 }
=20
-TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)
-TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
-TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
-TRANS_FLAGS2(ALTIVEC_207, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
-TRANS_FLAGS2(ALTIVEC_207, VMULESH, do_vx_helper, gen_helper_VMULESH)
-TRANS_FLAGS2(ALTIVEC_207, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
-TRANS_FLAGS2(ALTIVEC_207, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
-TRANS_FLAGS2(ALTIVEC_207, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
+TRANS_FLAGS(ALTIVEC, VMULESB, do_vx_helper, gen_helper_VMULESB)
+TRANS_FLAGS(ALTIVEC, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
+TRANS_FLAGS(ALTIVEC, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
+TRANS_FLAGS(ALTIVEC, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
+TRANS_FLAGS(ALTIVEC, VMULESH, do_vx_helper, gen_helper_VMULESH)
+TRANS_FLAGS(ALTIVEC, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
+TRANS_FLAGS(ALTIVEC, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
+TRANS_FLAGS(ALTIVEC, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
 TRANS_FLAGS2(ALTIVEC_207, VMULESW, do_vx_helper, gen_helper_VMULESW)
 TRANS_FLAGS2(ALTIVEC_207, VMULOSW, do_vx_helper, gen_helper_VMULOSW)
 TRANS_FLAGS2(ALTIVEC_207, VMULEUW, do_vx_helper, gen_helper_VMULEUW)
--=20
2.34.1


