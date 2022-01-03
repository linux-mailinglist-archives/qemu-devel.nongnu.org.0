Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91AD482E97
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 08:00:58 +0100 (CET)
Received: from localhost ([::1]:42042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4HKz-0004Df-LV
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 02:00:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gw2-00026J-PX; Mon, 03 Jan 2022 01:35:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gvz-000802-AN; Mon, 03 Jan 2022 01:35:10 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2034maXl015700; 
 Mon, 3 Jan 2022 06:34:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dbteqhqs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2036Xgx6021564;
 Mon, 3 Jan 2022 06:34:48 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3daek986yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:48 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2036Yk4R20513084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 06:34:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DA6652069;
 Mon,  3 Jan 2022 06:34:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id CFDD652054;
 Mon,  3 Jan 2022 06:34:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4894D22017E;
 Mon,  3 Jan 2022 07:34:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] ppc/ppc405: Activate MMU logs
Date: Mon,  3 Jan 2022 07:34:36 +0100
Message-Id: <20220103063441.3424853-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220103063441.3424853-1-clg@kaod.org>
References: <20220103063441.3424853-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FwBpWdYG11wWa842vJeL4yurnYGha_5E
X-Proofpoint-GUID: FwBpWdYG11wWa842vJeL4yurnYGha_5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_02,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1034
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201030044
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no need to deactivate MMU logging at compile time. Remove all
use of defines. Only keep DUMP_PAGE_TABLES for another series since
page tables could be dumped from the monitor.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211222064025.1541490-4-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu_common.c | 164 +++++++++++++++++++---------------------
 target/ppc/mmu_helper.c |  97 +++++++++++-------------
 2 files changed, 122 insertions(+), 139 deletions(-)

diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 4e278365ca55..91270c1f17eb 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -34,29 +34,7 @@
 #include "mmu-book3s-v3.h"
 #include "mmu-radix64.h"
=20
-/* #define DEBUG_MMU */
-/* #define DEBUG_BATS */
-/* #define DEBUG_SOFTWARE_TLB */
 /* #define DUMP_PAGE_TABLES */
-/* #define FLUSH_ALL_TLBS */
-
-#ifdef DEBUG_MMU
-#  define LOG_MMU_STATE(cpu) log_cpu_state_mask(CPU_LOG_MMU, (cpu), 0)
-#else
-#  define LOG_MMU_STATE(cpu) do { } while (0)
-#endif
-
-#ifdef DEBUG_SOFTWARE_TLB
-#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
-#else
-#  define LOG_SWTLB(...) do { } while (0)
-#endif
-
-#ifdef DEBUG_BATS
-#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
-#else
-#  define LOG_BATS(...) do { } while (0)
-#endif
=20
 void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
 {
@@ -231,18 +209,20 @@ static int ppc6xx_tlb_check(CPUPPCState *env, mmu_c=
tx_t *ctx,
         tlb =3D &env->tlb.tlb6[nr];
         /* This test "emulates" the PTE index match for hardware TLBs */
         if ((eaddr & TARGET_PAGE_MASK) !=3D tlb->EPN) {
-            LOG_SWTLB("TLB %d/%d %s [" TARGET_FMT_lx " " TARGET_FMT_lx
-                      "] <> " TARGET_FMT_lx "\n", nr, env->nb_tlb,
-                      pte_is_valid(tlb->pte0) ? "valid" : "inval",
-                      tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE, eaddr);
+            qemu_log_mask(CPU_LOG_MMU, "TLB %d/%d %s [" TARGET_FMT_lx
+                          " " TARGET_FMT_lx "] <> " TARGET_FMT_lx "\n",
+                          nr, env->nb_tlb,
+                          pte_is_valid(tlb->pte0) ? "valid" : "inval",
+                          tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE, eaddr);
             continue;
         }
-        LOG_SWTLB("TLB %d/%d %s " TARGET_FMT_lx " <> " TARGET_FMT_lx " "
-                  TARGET_FMT_lx " %c %c\n", nr, env->nb_tlb,
-                  pte_is_valid(tlb->pte0) ? "valid" : "inval",
-                  tlb->EPN, eaddr, tlb->pte1,
-                  access_type =3D=3D MMU_DATA_STORE ? 'S' : 'L',
-                  access_type =3D=3D MMU_INST_FETCH ? 'I' : 'D');
+        qemu_log_mask(CPU_LOG_MMU, "TLB %d/%d %s " TARGET_FMT_lx " <> "
+                      TARGET_FMT_lx " " TARGET_FMT_lx " %c %c\n",
+                      nr, env->nb_tlb,
+                      pte_is_valid(tlb->pte0) ? "valid" : "inval",
+                      tlb->EPN, eaddr, tlb->pte1,
+                      access_type =3D=3D MMU_DATA_STORE ? 'S' : 'L',
+                      access_type =3D=3D MMU_INST_FETCH ? 'I' : 'D');
         switch (ppc6xx_tlb_pte_check(ctx, tlb->pte0, tlb->pte1,
                                      0, access_type)) {
         case -3:
@@ -272,8 +252,9 @@ static int ppc6xx_tlb_check(CPUPPCState *env, mmu_ctx=
_t *ctx,
     }
     if (best !=3D -1) {
     done:
-        LOG_SWTLB("found TLB at addr " TARGET_FMT_plx " prot=3D%01x ret=3D=
%d\n",
-                  ctx->raddr & TARGET_PAGE_MASK, ctx->prot, ret);
+        qemu_log_mask(CPU_LOG_MMU, "found TLB at addr " TARGET_FMT_plx
+                      " prot=3D%01x ret=3D%d\n",
+                      ctx->raddr & TARGET_PAGE_MASK, ctx->prot, ret);
         /* Update page flags */
         pte_update_flags(ctx, &env->tlb.tlb6[best].pte1, ret, access_typ=
e);
     }
@@ -317,7 +298,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_=
t *ctx,
     int ret =3D -1;
     bool ifetch =3D access_type =3D=3D MMU_INST_FETCH;
=20
-    LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
+     qemu_log_mask(CPU_LOG_MMU, "%s: %cBAT v " TARGET_FMT_lx "\n", __fun=
c__,
              ifetch ? 'I' : 'D', virtual);
     if (ifetch) {
         BATlt =3D env->IBAT[1];
@@ -332,9 +313,9 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_=
t *ctx,
         BEPIu =3D *BATu & 0xF0000000;
         BEPIl =3D *BATu & 0x0FFE0000;
         bat_size_prot(env, &bl, &valid, &prot, BATu, BATl);
-        LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
-                 " BATl " TARGET_FMT_lx "\n", __func__,
-                 ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
+         qemu_log_mask(CPU_LOG_MMU, "%s: %cBAT%d v " TARGET_FMT_lx " BAT=
u "
+                       TARGET_FMT_lx " BATl " TARGET_FMT_lx "\n", __func=
__,
+                       ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
         if ((virtual & 0xF0000000) =3D=3D BEPIu &&
             ((virtual & 0x0FFE0000) & ~bl) =3D=3D BEPIl) {
             /* BAT matches */
@@ -347,32 +328,33 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ct=
x_t *ctx,
                 ctx->prot =3D prot;
                 ret =3D check_prot(ctx->prot, access_type);
                 if (ret =3D=3D 0) {
-                    LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=3D=
%c%c\n",
-                             i, ctx->raddr, ctx->prot & PAGE_READ ? 'R' =
: '-',
-                             ctx->prot & PAGE_WRITE ? 'W' : '-');
+                    qemu_log_mask(CPU_LOG_MMU, "BAT %d match: r " TARGET=
_FMT_plx
+                                  " prot=3D%c%c\n", i, ctx->raddr,
+                                  ctx->prot & PAGE_READ ? 'R' : '-',
+                                  ctx->prot & PAGE_WRITE ? 'W' : '-');
                 }
                 break;
             }
         }
     }
     if (ret < 0) {
-#if defined(DEBUG_BATS)
         if (qemu_log_enabled()) {
-            LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", virtual);
+            qemu_log_mask(CPU_LOG_MMU, "no BAT match for "
+                          TARGET_FMT_lx ":\n", virtual);
             for (i =3D 0; i < 4; i++) {
                 BATu =3D &BATut[i];
                 BATl =3D &BATlt[i];
                 BEPIu =3D *BATu & 0xF0000000;
                 BEPIl =3D *BATu & 0x0FFE0000;
                 bl =3D (*BATu & 0x00001FFC) << 15;
-                LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_=
FMT_lx
-                         " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
-                         TARGET_FMT_lx " " TARGET_FMT_lx "\n",
-                         __func__, ifetch ? 'I' : 'D', i, virtual,
-                         *BATu, *BATl, BEPIu, BEPIl, bl);
+                 qemu_log_mask(CPU_LOG_MMU, "%s: %cBAT%d v "
+                               TARGET_FMT_lx " BATu " TARGET_FMT_lx
+                               " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_=
lx " "
+                               TARGET_FMT_lx " " TARGET_FMT_lx "\n",
+                               __func__, ifetch ? 'I' : 'D', i, virtual,
+                               *BATu, *BATl, BEPIu, BEPIl, bl);
             }
         }
-#endif
     }
     /* No hit */
     return ret;
@@ -401,11 +383,12 @@ static int get_segment_6xx_tlb(CPUPPCState *env, mm=
u_ctx_t *ctx,
     vsid =3D sr & 0x00FFFFFF;
     target_page_bits =3D TARGET_PAGE_BITS;
     qemu_log_mask(CPU_LOG_MMU,
-            "Check segment v=3D" TARGET_FMT_lx " %d " TARGET_FMT_lx
-            " nip=3D" TARGET_FMT_lx " lr=3D" TARGET_FMT_lx
-            " ir=3D%d dr=3D%d pr=3D%d %d t=3D%d\n",
-            eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr, (int)msr_i=
r,
-            (int)msr_dr, pr !=3D 0 ? 1 : 0, access_type =3D=3D MMU_DATA_=
STORE, type);
+                  "Check segment v=3D" TARGET_FMT_lx " %d " TARGET_FMT_l=
x
+                  " nip=3D" TARGET_FMT_lx " lr=3D" TARGET_FMT_lx
+                  " ir=3D%d dr=3D%d pr=3D%d %d t=3D%d\n",
+                  eaddr, (int)(eaddr >> 28), sr, env->nip, env->lr, (int=
)msr_ir,
+                  (int)msr_dr, pr !=3D 0 ? 1 : 0,
+                  access_type =3D=3D MMU_DATA_STORE, type);
     pgidx =3D (eaddr & ~SEGMENT_MASK_256M) >> target_page_bits;
     hash =3D vsid ^ pgidx;
     ctx->ptem =3D (vsid << 7) | (pgidx >> 10);
@@ -536,9 +519,10 @@ int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t =
*tlb,
         return -1;
     }
     mask =3D ~(tlb->size - 1);
-    LOG_SWTLB("%s: TLB %d address " TARGET_FMT_lx " PID %u <=3D> " TARGE=
T_FMT_lx
-              " " TARGET_FMT_lx " %u %x\n", __func__, i, address, pid, t=
lb->EPN,
-              mask, (uint32_t)tlb->PID, tlb->prot);
+    qemu_log_mask(CPU_LOG_MMU, "%s: TLB %d address " TARGET_FMT_lx
+                  " PID %u <=3D> " TARGET_FMT_lx " " TARGET_FMT_lx " %u =
%x\n",
+                  __func__, i, address, pid, tlb->EPN,
+                  mask, (uint32_t)tlb->PID, tlb->prot);
     /* Check PID */
     if (tlb->PID !=3D 0 && tlb->PID !=3D pid) {
         return -1;
@@ -575,8 +559,9 @@ static int mmu40x_get_physical_address(CPUPPCState *e=
nv, mmu_ctx_t *ctx,
         }
         zsel =3D (tlb->attr >> 4) & 0xF;
         zpr =3D (env->spr[SPR_40x_ZPR] >> (30 - (2 * zsel))) & 0x3;
-        LOG_SWTLB("%s: TLB %d zsel %d zpr %d ty %d attr %08x\n",
-                    __func__, i, zsel, zpr, access_type, tlb->attr);
+        qemu_log_mask(CPU_LOG_MMU,
+                      "%s: TLB %d zsel %d zpr %d ty %d attr %08x\n",
+                      __func__, i, zsel, zpr, access_type, tlb->attr);
         /* Check execute enable bit */
         switch (zpr) {
         case 0x2:
@@ -610,14 +595,16 @@ static int mmu40x_get_physical_address(CPUPPCState =
*env, mmu_ctx_t *ctx,
         }
         if (ret >=3D 0) {
             ctx->raddr =3D raddr;
-            LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =3D> " TARGE=
T_FMT_plx
-                      " %d %d\n", __func__, address, ctx->raddr, ctx->pr=
ot,
-                      ret);
+            qemu_log_mask(CPU_LOG_MMU, "%s: access granted " TARGET_FMT_=
lx
+                          " =3D> " TARGET_FMT_plx
+                          " %d %d\n", __func__, address, ctx->raddr, ctx=
->prot,
+                          ret);
             return 0;
         }
     }
-    LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =3D> " TARGET_FMT_pl=
x
-              " %d %d\n", __func__, address, raddr, ctx->prot, ret);
+     qemu_log_mask(CPU_LOG_MMU, "%s: access refused " TARGET_FMT_lx
+                   " =3D> " TARGET_FMT_plx
+                   " %d %d\n", __func__, address, raddr, ctx->prot, ret)=
;
=20
     return ret;
 }
@@ -646,7 +633,7 @@ static int mmubooke_check_tlb(CPUPPCState *env, ppcem=
b_tlb_t *tlb,
         goto found_tlb;
     }
=20
-    LOG_SWTLB("%s: TLB entry not found\n", __func__);
+     qemu_log_mask(CPU_LOG_MMU, "%s: TLB entry not found\n", __func__);
     return -1;
=20
 found_tlb:
@@ -659,17 +646,17 @@ found_tlb:
=20
     /* Check the address space */
     if ((access_type =3D=3D MMU_INST_FETCH ? msr_ir : msr_dr) !=3D (tlb-=
>attr & 1)) {
-        LOG_SWTLB("%s: AS doesn't match\n", __func__);
+        qemu_log_mask(CPU_LOG_MMU, "%s: AS doesn't match\n", __func__);
         return -1;
     }
=20
     *prot =3D prot2;
     if (prot2 & prot_for_access_type(access_type)) {
-        LOG_SWTLB("%s: good TLB!\n", __func__);
+        qemu_log_mask(CPU_LOG_MMU, "%s: good TLB!\n", __func__);
         return 0;
     }
=20
-    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
+    qemu_log_mask(CPU_LOG_MMU, "%s: no prot match: %x\n", __func__, prot=
2);
     return access_type =3D=3D MMU_INST_FETCH ? -3 : -2;
 }
=20
@@ -694,12 +681,13 @@ static int mmubooke_get_physical_address(CPUPPCStat=
e *env, mmu_ctx_t *ctx,
=20
     if (ret >=3D 0) {
         ctx->raddr =3D raddr;
-        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
-                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
-                  ret);
+        qemu_log_mask(CPU_LOG_MMU, "%s: access granted " TARGET_FMT_lx
+                      " =3D> " TARGET_FMT_plx " %d %d\n", __func__,
+                      address, ctx->raddr, ctx->prot, ret);
     } else {
-        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
-                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
+         qemu_log_mask(CPU_LOG_MMU, "%s: access refused " TARGET_FMT_lx
+                       " =3D> " TARGET_FMT_plx " %d %d\n", __func__,
+                       address, raddr, ctx->prot, ret);
     }
=20
     return ret;
@@ -734,10 +722,11 @@ int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t=
 *tlb,
     }
=20
     mask =3D ~(booke206_tlb_to_page_size(env, tlb) - 1);
-    LOG_SWTLB("%s: TLB ADDR=3D0x" TARGET_FMT_lx " PID=3D0x%x MAS1=3D0x%x=
 MAS2=3D0x%"
-              PRIx64 " mask=3D0x%" HWADDR_PRIx " MAS7_3=3D0x%" PRIx64 " =
MAS8=3D0x%"
-              PRIx32 "\n", __func__, address, pid, tlb->mas1, tlb->mas2,=
 mask,
-              tlb->mas7_3, tlb->mas8);
+     qemu_log_mask(CPU_LOG_MMU, "%s: TLB ADDR=3D0x" TARGET_FMT_lx
+                   " PID=3D0x%x MAS1=3D0x%x MAS2=3D0x%" PRIx64 " mask=3D=
0x%"
+                   HWADDR_PRIx " MAS7_3=3D0x%" PRIx64 " MAS8=3D0x%" PRIx=
32 "\n",
+                   __func__, address, pid, tlb->mas1, tlb->mas2, mask,
+                   tlb->mas7_3, tlb->mas8);
=20
     /* Check PID */
     tlb_pid =3D (tlb->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT;
@@ -838,7 +827,7 @@ static int mmubooke206_check_tlb(CPUPPCState *env, pp=
cmas_tlb_t *tlb,
         }
     }
=20
-    LOG_SWTLB("%s: TLB entry not found\n", __func__);
+     qemu_log_mask(CPU_LOG_MMU, "%s: TLB entry not found\n", __func__);
     return -1;
=20
 found_tlb:
@@ -873,17 +862,17 @@ found_tlb:
     }
=20
     if (as !=3D ((tlb->mas1 & MAS1_TS) >> MAS1_TS_SHIFT)) {
-        LOG_SWTLB("%s: AS doesn't match\n", __func__);
+        qemu_log_mask(CPU_LOG_MMU, "%s: AS doesn't match\n", __func__);
         return -1;
     }
=20
     *prot =3D prot2;
     if (prot2 & prot_for_access_type(access_type)) {
-        LOG_SWTLB("%s: good TLB!\n", __func__);
+        qemu_log_mask(CPU_LOG_MMU, "%s: good TLB!\n", __func__);
         return 0;
     }
=20
-    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
+    qemu_log_mask(CPU_LOG_MMU, "%s: no prot match: %x\n", __func__, prot=
2);
     return access_type =3D=3D MMU_INST_FETCH ? -3 : -2;
 }
=20
@@ -919,12 +908,13 @@ found_tlb:
=20
     if (ret >=3D 0) {
         ctx->raddr =3D raddr;
-        LOG_SWTLB("%s: access granted " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
-                  " %d %d\n", __func__, address, ctx->raddr, ctx->prot,
-                  ret);
+         qemu_log_mask(CPU_LOG_MMU, "%s: access granted " TARGET_FMT_lx
+                       " =3D> " TARGET_FMT_plx " %d %d\n", __func__, add=
ress,
+                       ctx->raddr, ctx->prot, ret);
     } else {
-        LOG_SWTLB("%s: access refused " TARGET_FMT_lx " =3D> " TARGET_FM=
T_plx
-                  " %d %d\n", __func__, address, raddr, ctx->prot, ret);
+         qemu_log_mask(CPU_LOG_MMU, "%s: access refused " TARGET_FMT_lx
+                       " =3D> " TARGET_FMT_plx " %d %d\n", __func__, add=
ress,
+                       raddr, ctx->prot, ret);
     }
=20
     return ret;
@@ -1338,7 +1328,7 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr =
eaddr,
     }
=20
     if (guest_visible) {
-        LOG_MMU_STATE(cs);
+        log_cpu_state_mask(CPU_LOG_MMU, cs, 0);
         if (type =3D=3D ACCESS_CODE) {
             switch (ret) {
             case -1:
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2ec3d203a081..59df6952aea1 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -36,23 +36,8 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
=20
-/* #define DEBUG_BATS */
-/* #define DEBUG_SOFTWARE_TLB */
-/* #define DUMP_PAGE_TABLES */
 /* #define FLUSH_ALL_TLBS */
=20
-#ifdef DEBUG_SOFTWARE_TLB
-#  define LOG_SWTLB(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
-#else
-#  define LOG_SWTLB(...) do { } while (0)
-#endif
-
-#ifdef DEBUG_BATS
-#  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
-#else
-#  define LOG_BATS(...) do { } while (0)
-#endif
-
 /***********************************************************************=
******/
 /* PowerPC MMU emulation */
=20
@@ -89,8 +74,8 @@ static inline void ppc6xx_tlb_invalidate_virt2(CPUPPCSt=
ate *env,
         nr =3D ppc6xx_tlb_getnum(env, eaddr, way, is_code);
         tlb =3D &env->tlb.tlb6[nr];
         if (pte_is_valid(tlb->pte0) && (match_epn =3D=3D 0 || eaddr =3D=3D=
 tlb->EPN)) {
-            LOG_SWTLB("TLB invalidate %d/%d " TARGET_FMT_lx "\n", nr,
-                      env->nb_tlb, eaddr);
+            qemu_log_mask(CPU_LOG_MMU, "TLB invalidate %d/%d "
+                          TARGET_FMT_lx "\n", nr, env->nb_tlb, eaddr);
             pte_invalidate(&tlb->pte0);
             tlb_flush_page(cs, tlb->EPN);
         }
@@ -115,8 +100,9 @@ static void ppc6xx_tlb_store(CPUPPCState *env, target=
_ulong EPN, int way,
=20
     nr =3D ppc6xx_tlb_getnum(env, EPN, way, is_code);
     tlb =3D &env->tlb.tlb6[nr];
-    LOG_SWTLB("Set TLB %d/%d EPN " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
-              " PTE1 " TARGET_FMT_lx "\n", nr, env->nb_tlb, EPN, pte0, p=
te1);
+    qemu_log_mask(CPU_LOG_MMU, "Set TLB %d/%d EPN " TARGET_FMT_lx " PTE0=
 "
+                  TARGET_FMT_lx " PTE1 " TARGET_FMT_lx "\n", nr, env->nb=
_tlb,
+                  EPN, pte0, pte1);
     /* Invalidate any pending reference in QEMU for this virtual address=
 */
     ppc6xx_tlb_invalidate_virt2(env, EPN, is_code, 1);
     tlb->pte0 =3D pte0;
@@ -204,25 +190,27 @@ static inline void do_invalidate_BAT(CPUPPCState *e=
nv, target_ulong BATu,
     end =3D base + mask + 0x00020000;
     if (((end - base) >> TARGET_PAGE_BITS) > 1024) {
         /* Flushing 1024 4K pages is slower than a complete flush */
-        LOG_BATS("Flush all BATs\n");
+        qemu_log_mask(CPU_LOG_MMU, "Flush all BATs\n");
         tlb_flush(cs);
-        LOG_BATS("Flush done\n");
+        qemu_log_mask(CPU_LOG_MMU, "Flush done\n");
         return;
     }
-    LOG_BATS("Flush BAT from " TARGET_FMT_lx " to " TARGET_FMT_lx " ("
-             TARGET_FMT_lx ")\n", base, end, mask);
+    qemu_log_mask(CPU_LOG_MMU, "Flush BAT from " TARGET_FMT_lx
+                  " to " TARGET_FMT_lx " (" TARGET_FMT_lx ")\n",
+                  base, end, mask);
     for (page =3D base; page !=3D end; page +=3D TARGET_PAGE_SIZE) {
         tlb_flush_page(cs, page);
     }
-    LOG_BATS("Flush done\n");
+    qemu_log_mask(CPU_LOG_MMU, "Flush done\n");
 }
 #endif
=20
 static inline void dump_store_bat(CPUPPCState *env, char ID, int ul, int=
 nr,
                                   target_ulong value)
 {
-    LOG_BATS("Set %cBAT%d%c to " TARGET_FMT_lx " (" TARGET_FMT_lx ")\n",=
 ID,
-             nr, ul =3D=3D 0 ? 'u' : 'l', value, env->nip);
+    qemu_log_mask(CPU_LOG_MMU, "Set %cBAT%d%c to " TARGET_FMT_lx " ("
+                  TARGET_FMT_lx ")\n", ID, nr, ul =3D=3D 0 ? 'u' : 'l',
+                  value, env->nip);
 }
=20
 void helper_store_ibatu(CPUPPCState *env, uint32_t nr, target_ulong valu=
e)
@@ -550,9 +538,9 @@ static void do_6xx_tlb(CPUPPCState *env, target_ulong=
 new_EPN, int is_code)
     }
     way =3D (env->spr[SPR_SRR1] >> 17) & 1;
     (void)EPN; /* avoid a compiler warning */
-    LOG_SWTLB("%s: EPN " TARGET_FMT_lx " " TARGET_FMT_lx " PTE0 " TARGET=
_FMT_lx
-              " PTE1 " TARGET_FMT_lx " way %d\n", __func__, new_EPN, EPN=
, CMP,
-              RPN, way);
+    qemu_log_mask(CPU_LOG_MMU, "%s: EPN " TARGET_FMT_lx " " TARGET_FMT_l=
x
+                  " PTE0 " TARGET_FMT_lx " PTE1 " TARGET_FMT_lx " way %d=
\n",
+                  __func__, new_EPN, EPN, CMP, RPN, way);
     /* Store this TLB */
     ppc6xx_tlb_store(env, (uint32_t)(new_EPN & TARGET_PAGE_MASK),
                      way, is_code, CMP, RPN);
@@ -721,15 +709,17 @@ void helper_4xx_tlbwe_hi(CPUPPCState *env, target_u=
long entry,
     ppcemb_tlb_t *tlb;
     target_ulong page, end;
=20
-    LOG_SWTLB("%s entry %d val " TARGET_FMT_lx "\n", __func__, (int)entr=
y,
+    qemu_log_mask(CPU_LOG_MMU, "%s entry %d val " TARGET_FMT_lx "\n",
+                  __func__, (int)entry,
               val);
     entry &=3D PPC4XX_TLB_ENTRY_MASK;
     tlb =3D &env->tlb.tlbe[entry];
     /* Invalidate previous TLB (if it's valid) */
     if (tlb->prot & PAGE_VALID) {
         end =3D tlb->EPN + tlb->size;
-        LOG_SWTLB("%s: invalidate old TLB %d start " TARGET_FMT_lx " end=
 "
-                  TARGET_FMT_lx "\n", __func__, (int)entry, tlb->EPN, en=
d);
+        qemu_log_mask(CPU_LOG_MMU, "%s: invalidate old TLB %d start "
+                      TARGET_FMT_lx " end " TARGET_FMT_lx "\n", __func__=
,
+                      (int)entry, tlb->EPN, end);
         for (page =3D tlb->EPN; page < end; page +=3D TARGET_PAGE_SIZE) =
{
             tlb_flush_page(cs, page);
         }
@@ -758,18 +748,20 @@ void helper_4xx_tlbwe_hi(CPUPPCState *env, target_u=
long entry,
         tlb->prot &=3D ~PAGE_VALID;
     }
     tlb->PID =3D env->spr[SPR_40x_PID]; /* PID */
-    LOG_SWTLB("%s: set up TLB %d RPN " TARGET_FMT_plx " EPN " TARGET_FMT=
_lx
-              " size " TARGET_FMT_lx " prot %c%c%c%c PID %d\n", __func__=
,
-              (int)entry, tlb->RPN, tlb->EPN, tlb->size,
-              tlb->prot & PAGE_READ ? 'r' : '-',
-              tlb->prot & PAGE_WRITE ? 'w' : '-',
-              tlb->prot & PAGE_EXEC ? 'x' : '-',
-              tlb->prot & PAGE_VALID ? 'v' : '-', (int)tlb->PID);
+    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN " TARGET_FMT_plx
+                  " EPN " TARGET_FMT_lx " size " TARGET_FMT_lx
+                  " prot %c%c%c%c PID %d\n", __func__,
+                  (int)entry, tlb->RPN, tlb->EPN, tlb->size,
+                  tlb->prot & PAGE_READ ? 'r' : '-',
+                  tlb->prot & PAGE_WRITE ? 'w' : '-',
+                  tlb->prot & PAGE_EXEC ? 'x' : '-',
+                  tlb->prot & PAGE_VALID ? 'v' : '-', (int)tlb->PID);
     /* Invalidate new TLB (if valid) */
     if (tlb->prot & PAGE_VALID) {
         end =3D tlb->EPN + tlb->size;
-        LOG_SWTLB("%s: invalidate TLB %d start " TARGET_FMT_lx " end "
-                  TARGET_FMT_lx "\n", __func__, (int)entry, tlb->EPN, en=
d);
+        qemu_log_mask(CPU_LOG_MMU, "%s: invalidate TLB %d start "
+                      TARGET_FMT_lx " end " TARGET_FMT_lx "\n", __func__=
,
+                      (int)entry, tlb->EPN, end);
         for (page =3D tlb->EPN; page < end; page +=3D TARGET_PAGE_SIZE) =
{
             tlb_flush_page(cs, page);
         }
@@ -781,8 +773,8 @@ void helper_4xx_tlbwe_lo(CPUPPCState *env, target_ulo=
ng entry,
 {
     ppcemb_tlb_t *tlb;
=20
-    LOG_SWTLB("%s entry %i val " TARGET_FMT_lx "\n", __func__, (int)entr=
y,
-              val);
+    qemu_log_mask(CPU_LOG_MMU, "%s entry %i val " TARGET_FMT_lx "\n",
+                  __func__, (int)entry, val);
     entry &=3D PPC4XX_TLB_ENTRY_MASK;
     tlb =3D &env->tlb.tlbe[entry];
     tlb->attr =3D val & PPC4XX_TLBLO_ATTR_MASK;
@@ -794,13 +786,14 @@ void helper_4xx_tlbwe_lo(CPUPPCState *env, target_u=
long entry,
     if (val & PPC4XX_TLBLO_WR) {
         tlb->prot |=3D PAGE_WRITE;
     }
-    LOG_SWTLB("%s: set up TLB %d RPN " TARGET_FMT_plx " EPN " TARGET_FMT=
_lx
-              " size " TARGET_FMT_lx " prot %c%c%c%c PID %d\n", __func__=
,
-              (int)entry, tlb->RPN, tlb->EPN, tlb->size,
-              tlb->prot & PAGE_READ ? 'r' : '-',
-              tlb->prot & PAGE_WRITE ? 'w' : '-',
-              tlb->prot & PAGE_EXEC ? 'x' : '-',
-              tlb->prot & PAGE_VALID ? 'v' : '-', (int)tlb->PID);
+    qemu_log_mask(CPU_LOG_MMU, "%s: set up TLB %d RPN " TARGET_FMT_plx
+                  " EPN " TARGET_FMT_lx
+                  " size " TARGET_FMT_lx " prot %c%c%c%c PID %d\n", __fu=
nc__,
+                  (int)entry, tlb->RPN, tlb->EPN, tlb->size,
+                  tlb->prot & PAGE_READ ? 'r' : '-',
+                  tlb->prot & PAGE_WRITE ? 'w' : '-',
+                  tlb->prot & PAGE_EXEC ? 'x' : '-',
+                  tlb->prot & PAGE_VALID ? 'v' : '-', (int)tlb->PID);
 }
=20
 target_ulong helper_4xx_tlbsx(CPUPPCState *env, target_ulong address)
@@ -816,8 +809,8 @@ void helper_440_tlbwe(CPUPPCState *env, uint32_t word=
, target_ulong entry,
     target_ulong EPN, RPN, size;
     int do_flush_tlbs;
=20
-    LOG_SWTLB("%s word %d entry %d value " TARGET_FMT_lx "\n",
-              __func__, word, (int)entry, value);
+    qemu_log_mask(CPU_LOG_MMU, "%s word %d entry %d value " TARGET_FMT_l=
x "\n",
+                  __func__, word, (int)entry, value);
     do_flush_tlbs =3D 0;
     entry &=3D 0x3F;
     tlb =3D &env->tlb.tlbe[entry];
--=20
2.31.1


