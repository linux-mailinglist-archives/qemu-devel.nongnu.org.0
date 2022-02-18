Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E5B4BB748
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:52:34 +0100 (CET)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0sL-0001Pi-QA
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:52:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fQ-00011W-8Z; Fri, 18 Feb 2022 05:39:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47362
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fN-0005ff-3T; Fri, 18 Feb 2022 05:39:11 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I8b76H022383; 
 Fri, 18 Feb 2022 10:38:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea55jp8et-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:40 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21IARkK0008331;
 Fri, 18 Feb 2022 10:38:39 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea55jp8e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbtiw011081;
 Fri, 18 Feb 2022 10:38:37 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645khcdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21IAS7Us37683556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:28:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58645A4072;
 Fri, 18 Feb 2022 10:38:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D22BA4064;
 Fri, 18 Feb 2022 10:38:35 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:35 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3B101220294;
 Fri, 18 Feb 2022 11:38:34 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 07/39] target/ppc: add vhyp addressing mode helper for radix MMU
Date: Fri, 18 Feb 2022 11:37:55 +0100
Message-Id: <20220218103827.682032-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MAxv23r2sy4P8AkKksUVOXHLSOwy-8eW
X-Proofpoint-ORIG-GUID: zkqlDk4zoFBPXfvcbg_7OIWWfufD1Px3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=958
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 clxscore=1034
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202180067
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

The radix on vhyp MMU uses a single-level radix table walk, with the
partition scope mapping provided by the flat QEMU machine memory.

A subsequent change will use the two-level radix walk on vhyp in some
situations, so provide a helper which can abstract that logic.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20220216102545.1808018-5-npiggin@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-radix64.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 274494903244..04690b64828f 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -354,6 +354,17 @@ static int ppc_radix64_partition_scoped_xlate(PowerP=
CCPU *cpu,
     return 0;
 }
=20
+/*
+ * The spapr vhc has a flat partition scope provided by qemu memory.
+ */
+static bool vhyp_flat_addressing(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        return true;
+    }
+    return false;
+}
+
 static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
                                             MMUAccessType access_type,
                                             vaddr eaddr, uint64_t pid,
@@ -385,7 +396,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
     }
     prtbe_addr =3D (pate.dw1 & PATE1_R_PRTB) + offset;
=20
-    if (cpu->vhyp) {
+    if (vhyp_flat_addressing(cpu)) {
         prtbe0 =3D ldq_phys(cs->as, prtbe_addr);
     } else {
         /*
@@ -411,7 +422,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCP=
U *cpu,
     *g_page_size =3D PRTBE_R_GET_RTS(prtbe0);
     base_addr =3D prtbe0 & PRTBE_R_RPDB;
     nls =3D prtbe0 & PRTBE_R_RPDS;
-    if (msr_hv || cpu->vhyp) {
+    if (msr_hv || vhyp_flat_addressing(cpu)) {
         /*
          * Can treat process table addresses as real addresses
          */
@@ -515,7 +526,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, v=
addr eaddr,
     relocation =3D !mmuidx_real(mmu_idx);
=20
     /* HV or virtual hypervisor Real Mode Access */
-    if (!relocation && (mmuidx_hv(mmu_idx) || cpu->vhyp)) {
+    if (!relocation && (mmuidx_hv(mmu_idx) || vhyp_flat_addressing(cpu))=
) {
         /* In real mode top 4 effective addr bits (mostly) ignored */
         *raddr =3D eaddr & 0x0FFFFFFFFFFFFFFFULL;
=20
@@ -594,7 +605,7 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, v=
addr eaddr,
         g_raddr =3D eaddr & R_EADDR_MASK;
     }
=20
-    if (cpu->vhyp) {
+    if (vhyp_flat_addressing(cpu)) {
         *raddr =3D g_raddr;
     } else {
         /*
--=20
2.34.1


