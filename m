Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6B4A4649
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:54:18 +0100 (CET)
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVGD-0005YB-HW
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUZ4-0006C2-5d; Mon, 31 Jan 2022 06:09:43 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nEUYy-00053v-8M; Mon, 31 Jan 2022 06:09:41 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20V98ZvW019469; 
 Mon, 31 Jan 2022 11:08:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx66b8aft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:30 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VAjTvs011268;
 Mon, 31 Jan 2022 11:08:30 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx66b8af7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:30 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VB2NMu011111;
 Mon, 31 Jan 2022 11:08:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3dvw791vb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:08:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20VB8PM447382826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 11:08:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAAB9AE051;
 Mon, 31 Jan 2022 11:08:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42307AE05A;
 Mon, 31 Jan 2022 11:08:25 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 31 Jan 2022 11:08:25 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.57.185])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3FC0D2201C1;
 Mon, 31 Jan 2022 12:08:24 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 13/41] ppc/ppc405: Fix TLB flushing
Date: Mon, 31 Jan 2022 12:07:43 +0100
Message-Id: <20220131110811.619053-14-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131110811.619053-1-clg@kaod.org>
References: <20220131110811.619053-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4uv9Df0UdncPyHVPk59hPkRmZbOaP1Qz
X-Proofpoint-ORIG-GUID: nJ7fQuRGlw0zCYoz96t49TEw2ywlN_Nv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1034
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=900 priorityscore=1501 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310074
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cd0c6f473532 did not take into account 405 CPUs when adding
support to batching of TCG tlb flushes. Set the TLB_NEED_LOCAL_FLUSH
flag when the SPR_40x_PID is set or a TLB updated.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Fixes: cd0c6f473532 ("ppc: Do some batching of TCG tlb flushes")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220113180352.1234512-1-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h     |  1 +
 target/ppc/mmu_helper.c | 12 +++++++++++-
 target/ppc/translate.c  |  2 +-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d318837ea5cc..bdbbd5e1d90f 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -707,6 +707,7 @@ DEF_HELPER_FLAGS_1(load_40x_pit, TCG_CALL_NO_RWG, tl,=
 env)
 DEF_HELPER_FLAGS_2(store_40x_pit, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_40x_tcr, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_40x_tsr, TCG_CALL_NO_RWG, void, env, tl)
+DEF_HELPER_2(store_40x_pid, void, env, tl)
 DEF_HELPER_2(store_40x_dbcr0, void, env, tl)
 DEF_HELPER_2(store_40x_sler, void, env, tl)
 DEF_HELPER_FLAGS_2(store_booke_tcr, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 59df6952aea1..a2a52a12c3a4 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -664,6 +664,14 @@ static inline int booke_page_size_to_tlb(target_ulon=
g page_size)
 #define PPC4XX_TLBLO_ATTR_MASK      0x000000FF
 #define PPC4XX_TLBLO_RPN_MASK       0xFFFFFC00
=20
+void helper_store_40x_pid(CPUPPCState *env, target_ulong val)
+{
+    if (env->spr[SPR_40x_PID] !=3D val) {
+        env->spr[SPR_40x_PID] =3D val;
+        env->tlb_need_flush |=3D TLB_NEED_LOCAL_FLUSH;
+    }
+}
+
 target_ulong helper_4xx_tlbre_hi(CPUPPCState *env, target_ulong entry)
 {
     ppcemb_tlb_t *tlb;
@@ -681,7 +689,7 @@ target_ulong helper_4xx_tlbre_hi(CPUPPCState *env, ta=
rget_ulong entry)
         size =3D PPC4XX_TLBHI_SIZE_DEFAULT;
     }
     ret |=3D size << PPC4XX_TLBHI_SIZE_SHIFT;
-    env->spr[SPR_40x_PID] =3D tlb->PID;
+    helper_store_40x_pid(env, tlb->PID);
     return ret;
 }
=20
@@ -794,6 +802,8 @@ void helper_4xx_tlbwe_lo(CPUPPCState *env, target_ulo=
ng entry,
                   tlb->prot & PAGE_WRITE ? 'w' : '-',
                   tlb->prot & PAGE_EXEC ? 'x' : '-',
                   tlb->prot & PAGE_VALID ? 'v' : '-', (int)tlb->PID);
+
+    env->tlb_need_flush |=3D TLB_NEED_LOCAL_FLUSH;
 }
=20
 target_ulong helper_4xx_tlbsx(CPUPPCState *env, target_ulong address)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9d2adc0caee0..d61c6f0e8f91 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -894,7 +894,7 @@ void spr_write_40x_pid(DisasContext *ctx, int sprn, i=
nt gprn)
 {
     TCGv t0 =3D tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xFF);
-    gen_store_spr(SPR_40x_PID, t0);
+    gen_helper_store_40x_pid(cpu_env, t0);
     tcg_temp_free(t0);
 }
=20
--=20
2.34.1


