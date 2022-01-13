Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E47748DCB8
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:14:24 +0100 (CET)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83g7-0004gd-6b
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:14:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n83TN-0007zC-7O; Thu, 13 Jan 2022 12:01:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n83TF-0005f6-QT; Thu, 13 Jan 2022 12:01:12 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20DGvWO1021086; 
 Thu, 13 Jan 2022 17:00:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djr2eg1jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 17:00:48 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20DGwqCB022989;
 Thu, 13 Jan 2022 17:00:48 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djr2eg1fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 17:00:47 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20DGvOLl022041;
 Thu, 13 Jan 2022 17:00:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3df289vmch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 17:00:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20DH0epp43647404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jan 2022 17:00:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 011E04C052;
 Thu, 13 Jan 2022 17:00:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 860B64C044;
 Thu, 13 Jan 2022 17:00:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 13 Jan 2022 17:00:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E899C22016D;
 Thu, 13 Jan 2022 18:00:37 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2] ppc/ppc405: Fix TLB flushing
Date: Thu, 13 Jan 2022 18:00:36 +0100
Message-Id: <20220113170036.1214238-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: U7NmzvGqbYa3eh1tqzxc8RVJO8hGxEIS
X-Proofpoint-ORIG-GUID: o539wcNdp5mCybRMVixm1vhObZo3bHYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_08,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1034 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxlogscore=756 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201130105
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cd0c6f473532 did not take into account 405 CPUs when adding
support to batching of TCG tlb flushes. Set the TLB_NEED_LOCAL_FLUSH
flag when the SPR_40x_PID is updated.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Fixes: cd0c6f473532 ("ppc: Do some batching of TCG tlb flushes")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes in v2:

 - Rely on the SPR_40x_PID store helper to program the flush operation
=20
 target/ppc/helper.h     | 1 +
 target/ppc/mmu_helper.c | 8 ++++++++
 target/ppc/translate.c  | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f9c72dcd504d..08165184005c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -708,6 +708,7 @@ DEF_HELPER_FLAGS_1(load_40x_pit, TCG_CALL_NO_RWG, tl,=
 env)
 DEF_HELPER_FLAGS_2(store_40x_pit, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_40x_tcr, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(store_40x_tsr, TCG_CALL_NO_RWG, void, env, tl)
+DEF_HELPER_2(store_40x_pid, void, env, tl)
 DEF_HELPER_2(store_40x_dbcr0, void, env, tl)
 DEF_HELPER_2(store_40x_sler, void, env, tl)
 DEF_HELPER_FLAGS_2(store_booke_tcr, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 59df6952aea1..743215f51c36 100644
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
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 40232201bb0c..3ad1be60e71d 100644
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
2.31.1


