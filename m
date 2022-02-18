Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C92A4BB7E8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:17:14 +0100 (CET)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1GD-0004JD-MG
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:17:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fq-0001CJ-RF; Fri, 18 Feb 2022 05:39:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fg-0005hN-RW; Fri, 18 Feb 2022 05:39:33 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IAMLj6016894; 
 Fri, 18 Feb 2022 10:38:49 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea9n68cp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:48 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAcNlk020511;
 Fri, 18 Feb 2022 10:38:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3e64ha6prs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:46 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAciWq38928708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAFE452051;
 Fri, 18 Feb 2022 10:38:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id A86FB52050;
 Fri, 18 Feb 2022 10:38:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 036062201F1;
 Fri, 18 Feb 2022 11:38:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 20/39] target/ppc: cpu_init: Decouple G2 SPR registration from
 755
Date: Fri, 18 Feb 2022 11:38:08 +0100
Message-Id: <20220218103827.682032-21-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LsZgutJfkH8wie0F8uw3_OQA6atgt1Xl
X-Proofpoint-GUID: LsZgutJfkH8wie0F8uw3_OQA6atgt1Xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 clxscore=1034 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=865 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
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
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

We're considering these two to be in different CPU families (6xx and
7xx), so keep their SPR registration separate.

The code was copied into register_G2_sprs and the common function was
renamed to apply only to the 755.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-9-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu_init.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 38bcc6b6072e..36d6377a51d2 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -466,8 +466,7 @@ static void register_6xx_7xx_soft_tlb(CPUPPCState *en=
v, int nb_tlbs, int nb_ways
 #endif
 }
=20
-/* SPR common to MPC755 and G2 */
-static void register_G2_755_sprs(CPUPPCState *env)
+static void register_755_sprs(CPUPPCState *env)
 {
     /* SGPRs */
     spr_register(env, SPR_SPRG4, "SPRG4",
@@ -783,6 +782,23 @@ static void register_G2_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
=20
+    /* SGPRs */
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
 }
=20
 static void register_74xx_sprs(CPUPPCState *env)
@@ -2848,7 +2864,6 @@ static void init_proc_G2(CPUPPCState *env)
 {
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
-    register_G2_755_sprs(env);
     register_G2_sprs(env);
=20
     /* Memory management */
@@ -4470,7 +4485,7 @@ static void init_proc_745(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    register_G2_755_sprs(env);
+    register_755_sprs(env);
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
@@ -4543,7 +4558,7 @@ static void init_proc_755(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    register_G2_755_sprs(env);
+    register_755_sprs(env);
     /* L2 cache control */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
--=20
2.34.1


