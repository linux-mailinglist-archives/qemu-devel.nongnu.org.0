Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F237483D3B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 08:52:58 +0100 (CET)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ecq-0000nx-UA
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 02:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIR-0005q0-HH; Tue, 04 Jan 2022 02:31:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11714
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4eIO-0008Cj-3Y; Tue, 04 Jan 2022 02:31:50 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2043DV7M001443; 
 Tue, 4 Jan 2022 07:31:32 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dce55ue3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:32 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2047OX4x031719;
 Tue, 4 Jan 2022 07:31:30 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3dbywxcwh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 07:31:30 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2047VR5N44761370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 07:31:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8329652059;
 Tue,  4 Jan 2022 07:31:27 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 49DDE52052;
 Tue,  4 Jan 2022 07:31:27 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A3383220144;
 Tue,  4 Jan 2022 08:31:26 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 06/26] target/ppc: Improve logging in Radix MMU
Date: Tue,  4 Jan 2022 08:31:01 +0100
Message-Id: <20220104073121.3784280-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104073121.3784280-1-clg@kaod.org>
References: <20220104073121.3784280-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JdDVT12ZwsIfYr5lHiYlBYY4o7rpaeOh
X-Proofpoint-GUID: JdDVT12ZwsIfYr5lHiYlBYY4o7rpaeOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_04,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1034 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=643 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) KHOP_HELO_FCRDNS=0.399,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211222071002.1568894-1-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu-radix64.c | 55 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 5b0e62e676dc..d10ae001d7c9 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -97,12 +97,22 @@ static void ppc_radix64_raise_segi(PowerPCCPU *cpu, M=
MUAccessType access_type,
     env->error_code =3D 0;
 }
=20
+static inline const char *access_str(MMUAccessType access_type)
+{
+    return access_type =3D=3D MMU_DATA_LOAD ? "reading" :
+        (access_type =3D=3D MMU_DATA_STORE ? "writing" : "execute");
+}
+
 static void ppc_radix64_raise_si(PowerPCCPU *cpu, MMUAccessType access_t=
ype,
                                  vaddr eaddr, uint32_t cause)
 {
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
=20
+    qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx" cause %08x\n"=
,
+                  __func__, access_str(access_type),
+                  eaddr, cause);
+
     switch (access_type) {
     case MMU_INST_FETCH:
         /* Instruction Storage Interrupt */
@@ -130,6 +140,11 @@ static void ppc_radix64_raise_hsi(PowerPCCPU *cpu, M=
MUAccessType access_type,
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
=20
+    qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx" 0x%"
+                  HWADDR_PRIx" cause %08x\n",
+                  __func__, access_str(access_type),
+                  eaddr, g_raddr, cause);
+
     switch (access_type) {
     case MMU_INST_FETCH:
         /* H Instruction Storage Interrupt */
@@ -306,6 +321,15 @@ static int ppc_radix64_partition_scoped_xlate(PowerP=
CCPU *cpu,
     hwaddr pte_addr;
     uint64_t pte;
=20
+    qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx
+                  " mmu_idx %u (prot %c%c%c) 0x%"HWADDR_PRIx"\n",
+                  __func__, access_str(access_type),
+                  eaddr, mmu_idx,
+                  *h_prot & PAGE_READ ? 'r' : '-',
+                  *h_prot & PAGE_WRITE ? 'w' : '-',
+                  *h_prot & PAGE_EXEC ? 'x' : '-',
+                  g_raddr);
+
     *h_page_size =3D PRTBE_R_GET_RTS(pate.dw0);
     /* No valid pte or access denied due to protection */
     if (ppc_radix64_walk_tree(CPU(cpu)->as, g_raddr, pate.dw0 & PRTBE_R_=
RPDB,
@@ -343,6 +367,11 @@ static int ppc_radix64_process_scoped_xlate(PowerPCC=
PU *cpu,
     hwaddr h_raddr, pte_addr;
     int ret;
=20
+    qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx
+                  " mmu_idx %u pid %"PRIu64"\n",
+                  __func__, access_str(access_type),
+                  eaddr, mmu_idx, pid);
+
     /* Index Process Table by PID to Find Corresponding Process Table En=
try */
     offset =3D pid * sizeof(struct prtb_entry);
     size =3D 1ULL << ((pate.dw1 & PATE1_R_PRTS) + 12);
@@ -468,9 +497,10 @@ static int ppc_radix64_process_scoped_xlate(PowerPCC=
PU *cpu,
  *              | =3D On        | Process Scoped |    Scoped     |
  *              +-------------+----------------+---------------+
  */
-bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType acces=
s_type,
-                       hwaddr *raddr, int *psizep, int *protp, int mmu_i=
dx,
-                       bool guest_visible)
+static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
+                                   MMUAccessType access_type, hwaddr *ra=
ddr,
+                                   int *psizep, int *protp, int mmu_idx,
+                                   bool guest_visible)
 {
     CPUPPCState *env =3D &cpu->env;
     uint64_t lpid, pid;
@@ -588,3 +618,22 @@ bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,=
 MMUAccessType access_type,
=20
     return true;
 }
+
+bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType acces=
s_type,
+                       hwaddr *raddrp, int *psizep, int *protp, int mmu_=
idx,
+                       bool guest_visible)
+{
+    bool ret =3D ppc_radix64_xlate_impl(cpu, eaddr, access_type, raddrp,
+                                      psizep, protp, mmu_idx, guest_visi=
ble);
+
+    qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx
+                  " mmu_idx %u (prot %c%c%c) -> 0x%"HWADDR_PRIx"\n",
+                  __func__, access_str(access_type),
+                  eaddr, mmu_idx,
+                  *protp & PAGE_READ ? 'r' : '-',
+                  *protp & PAGE_WRITE ? 'w' : '-',
+                  *protp & PAGE_EXEC ? 'x' : '-',
+                  *raddrp);
+
+    return ret;
+}
--=20
2.31.1


