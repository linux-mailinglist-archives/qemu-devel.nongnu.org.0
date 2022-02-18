Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C423C4BB715
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:42:07 +0100 (CET)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0iE-0004w0-PJ
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:42:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fM-00010s-QP; Fri, 18 Feb 2022 05:39:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18588
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0ex-0005f6-26; Fri, 18 Feb 2022 05:38:47 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IAc8mW023525; 
 Fri, 18 Feb 2022 10:38:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea8py1by5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:40 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21IAcUPA024419;
 Fri, 18 Feb 2022 10:38:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea8py1bxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAbskL011050;
 Fri, 18 Feb 2022 10:38:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645khcdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcaPI46137820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBFE2A4075;
 Fri, 18 Feb 2022 10:38:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B01BEA4064;
 Fri, 18 Feb 2022 10:38:35 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:35 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0EA3F2201F1;
 Fri, 18 Feb 2022 11:38:34 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 08/39] target/ppc: make vhyp get_pate method take lpid and
 return success
Date: Fri, 18 Feb 2022 11:37:56 +0100
Message-Id: <20220218103827.682032-9-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SHU_RrnAJC-qs8oEC5JczOfLHv7XzXTn
X-Proofpoint-GUID: VBvN86cBazsyRLMvAh8G8SybPEAWY_1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 mlxscore=0 mlxlogscore=768 priorityscore=1501 clxscore=1034 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180067
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

In prepartion for implementing a full partition table option for
vhyp, update the get_pate method to take an lpid and return a
success/fail indicator.

The spapr implementation currently just asserts lpid is always 0
and always return success.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[ clg: checkpatch fixes ]
Message-Id: <20220216102545.1808018-6-npiggin@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h         | 3 ++-
 hw/ppc/spapr.c           | 7 ++++++-
 target/ppc/mmu-radix64.c | 8 +++++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 555c6b924576..c79ae74f10de 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1320,7 +1320,8 @@ struct PPCVirtualHypervisorClass {
                         hwaddr ptex, int n);
     void (*hpte_set_c)(PPCVirtualHypervisor *vhyp, hwaddr ptex, uint64_t=
 pte1);
     void (*hpte_set_r)(PPCVirtualHypervisor *vhyp, hwaddr ptex, uint64_t=
 pte1);
-    void (*get_pate)(PPCVirtualHypervisor *vhyp, ppc_v3_pate_t *entry);
+    bool (*get_pate)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
+                     target_ulong lpid, ppc_v3_pate_t *entry);
     target_ulong (*encode_hpt_for_kvm_pr)(PPCVirtualHypervisor *vhyp);
     void (*cpu_exec_enter)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
     void (*cpu_exec_exit)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 92639856635a..4fdff12a9625 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1309,13 +1309,18 @@ void spapr_set_all_lpcrs(target_ulong value, targ=
et_ulong mask)
     }
 }
=20
-static void spapr_get_pate(PPCVirtualHypervisor *vhyp, ppc_v3_pate_t *en=
try)
+static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
+                           target_ulong lpid, ppc_v3_pate_t *entry)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(vhyp);
=20
+    assert(lpid =3D=3D 0);
+
     /* Copy PATE1:GR into PATE0:HR */
     entry->dw0 =3D spapr->patb_entry & PATE0_HR;
     entry->dw1 =3D spapr->patb_entry;
+
+    return true;
 }
=20
 #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) * 2))
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 04690b64828f..9c557c6de97a 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -563,7 +563,13 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, =
vaddr eaddr,
     if (cpu->vhyp) {
         PPCVirtualHypervisorClass *vhc;
         vhc =3D PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
-        vhc->get_pate(cpu->vhyp, &pate);
+        if (!vhc->get_pate(cpu->vhyp, cpu, lpid, &pate)) {
+            if (guest_visible) {
+                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr,
+                                      DSISR_R_BADCONFIG);
+            }
+            return false;
+        }
     } else {
         if (!ppc64_v3_get_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
--=20
2.34.1


