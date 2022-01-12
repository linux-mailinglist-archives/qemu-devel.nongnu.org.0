Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645448C44B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:59:53 +0100 (CET)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7dEF-0001kl-0S
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFH-0006z4-37; Wed, 12 Jan 2022 06:56:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9758
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFF-0007XN-Eg; Wed, 12 Jan 2022 06:56:50 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBaEAw004204; 
 Wed, 12 Jan 2022 11:56:16 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dht3ff4vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:15 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmHXE022857;
 Wed, 12 Jan 2022 11:56:14 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3df289h0un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuAh233554924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47FDB5207B;
 Wed, 12 Jan 2022 11:56:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 075035204E;
 Wed, 12 Jan 2022 11:56:09 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 47ED92201C6;
 Wed, 12 Jan 2022 12:56:09 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 11/34] target/ppc: Add HV support to
 ppc_interrupts_little_endian
Date: Wed, 12 Jan 2022 12:55:28 +0100
Message-Id: <20220112115551.987666-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TDjKeoZ-G1bLvPd69aGN8GGYK-vfcxL8
X-Proofpoint-ORIG-GUID: TDjKeoZ-G1bLvPd69aGN8GGYK-vfcxL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=677 phishscore=0
 spamscore=0 clxscore=1034 suspectscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

The ppc_interrupts_little_endian function could be used for interrupts
delivered in Hypervisor mode, so add support for powernv8 and powernv9
to it.

Also drop the comment because it is inaccurate, all CPUs that can run
little endian can have interrupts in little endian. The point is
whether they can take interrupts in an endianness different from
MSR_LE.

This change has no functional impact.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220107222601.4101511-5-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h         | 23 +++++++++++++++--------
 target/ppc/arch_dump.c   |  2 +-
 target/ppc/excp_helper.c |  2 +-
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f20d4ffa6d32..a6fc857ad4c2 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2728,20 +2728,27 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, i=
nt spr)
     return cpu->env.spr_cb[spr].name !=3D NULL;
 }
=20
-static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu)
+#if !defined(CONFIG_USER_ONLY)
+static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv=
)
 {
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env =3D &cpu->env;
+    bool ile =3D false;
+
+    if (hv && env->has_hv_mode) {
+        if (is_isa300(pcc)) {
+            ile =3D !!(env->spr[SPR_HID0] & HID0_POWER9_HILE);
+        } else {
+            ile =3D !!(env->spr[SPR_HID0] & HID0_HILE);
+        }
=20
-    /*
-     * Only models that have an LPCR and know about LPCR_ILE can do litt=
le
-     * endian.
-     */
-    if (pcc->lpcr_mask & LPCR_ILE) {
-        return !!(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
+    } else if (pcc->lpcr_mask & LPCR_ILE) {
+        ile =3D !!(env->spr[SPR_LPCR] & LPCR_ILE);
     }
=20
-    return false;
+    return ile;
 }
+#endif
=20
 void dump_mmu(CPUPPCState *env);
=20
diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index bb392f6d8885..12cde198a315 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -237,7 +237,7 @@ int cpu_get_dump_info(ArchDumpInfo *info,
     info->d_machine =3D PPC_ELF_MACHINE;
     info->d_class =3D ELFCLASS;
=20
-    if (ppc_interrupts_little_endian(cpu)) {
+    if (ppc_interrupts_little_endian(cpu, false)) {
         info->d_endian =3D ELFDATA2LSB;
     } else {
         info->d_endian =3D ELFDATA2MSB;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a52340ac0a46..3a430f23d6f3 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1070,7 +1070,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, t=
arget_ulong vector)
      */
     msr =3D (1ULL << MSR_ME);
     msr |=3D env->msr & (1ULL << MSR_SF);
-    if (ppc_interrupts_little_endian(cpu)) {
+    if (ppc_interrupts_little_endian(cpu, false)) {
         msr |=3D (1ULL << MSR_LE);
     }
=20
--=20
2.31.1


