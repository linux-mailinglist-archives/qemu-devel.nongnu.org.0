Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DF4477DA9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:33:12 +0100 (CET)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxR8-0002dA-NQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:33:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKo-000187-7I; Thu, 16 Dec 2021 15:26:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKm-0007GP-H9; Thu, 16 Dec 2021 15:26:37 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJvnju012423; 
 Thu, 16 Dec 2021 20:26:25 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyq8v3qe2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:25 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCp46012709;
 Thu, 16 Dec 2021 20:26:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3cy7k3j3vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BGKQL6m46661924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AB2C42042;
 Thu, 16 Dec 2021 20:26:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECA054203F;
 Thu, 16 Dec 2021 20:26:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:26:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3D5A3220238;
 Thu, 16 Dec 2021 21:26:20 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 005/101] target/ppc: ppc_store_fpscr doesn't update bits 0 to
 28 and 52
Date: Thu, 16 Dec 2021 21:24:38 +0100
Message-Id: <20211216202614.414266-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hX6jrq8-OOPoIbWeYf32wdFnzBNs3kiY
X-Proofpoint-GUID: hX6jrq8-OOPoIbWeYf32wdFnzBNs3kiY
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 bulkscore=0 mlxlogscore=806 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

This commit fixes the difference reported in the bug in the reserved
bit 52, it does this by adding this bit to the mask of bits to not be
directly altered in the ppc_store_fpscr function (the hardware used to
compare to QEMU was a Power9).

The bits 0 to 27 were also added to the mask, as they are marked as
reserved in the PowerISA and bit 28 is a reserved extension of the DRN
field (bits 29:31) but can't be set using mtfsfi, while the other DRN
bits may be set using mtfsfi instruction, so bit 28 was also added to
the mask.

Although this is a difference reported in the bug, since it's a reserved
bit it may be a "don't care" case, as put in the bug report. Looking at
the ISA it doesn't explicitly mention this bit can't be set, like it
does for FEX and VX, so I'm unsure if this is necessary.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20211201163808.440385-4-lucas.araujo@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h | 4 ++++
 target/ppc/cpu.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e946da5f3a8c..441d3dce194c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -759,6 +759,10 @@ enum {
                           FP_VXZDZ  | FP_VXIMZ  | FP_VXVC   | FP_VXSOFT | \
                           FP_VXSQRT | FP_VXCVI)
=20
+/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
+#define FPSCR_MTFS_MASK (~(MAKE_64BIT_MASK(36, 28) | PPC_BIT(28) |        \
+                           FP_FEX | FP_VX | PPC_BIT(52)))
+
 /*************************************************************************=
****/
 /* Vector status and control register */
 #define VSCR_NJ         16 /* Vector non-java */
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index f933d9f2bd84..d7b42bae52d6 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -112,7 +112,7 @@ static inline void fpscr_set_rounding_mode(CPUPPCState =
*env)
=20
 void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
 {
-    val &=3D ~(FP_VX | FP_FEX);
+    val &=3D FPSCR_MTFS_MASK;
     if (val & FPSCR_IX) {
         val |=3D FP_VX;
     }
--=20
2.31.1


