Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6240646D364
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 13:34:58 +0100 (CET)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muw9x-0001JH-GO
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 07:34:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1muw81-0007Ip-Ln; Wed, 08 Dec 2021 07:32:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1muw7z-0005iY-Lf; Wed, 08 Dec 2021 07:32:57 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B89me7o000963; 
 Wed, 8 Dec 2021 12:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qPzqsTBpby6O6mgvFgIq6aUdCd2Kco+Q9B53Bqn1xTg=;
 b=ChTwdIj0J/yku+s7mVEULxPmKNthFOPOTX8Z6EG7KsruTQZ5pvS1xJRaHfXB8uGjgF9u
 IyaWmRAuEI3llj/GfevfWEsjmQAa+CG83z6oZolifuYeCK8e5zZHEbeXNP7vGrbn2sLo
 TEiF4IP8BuPLiOIlv2dXybdudNSO3yaQt23UepR3dr4uMWxFedeKkbqh6PQ+nklWUwtp
 Ax8LsxPjeYvc+apDagbHgdYUeGyRhbVHl7Pe5Q/mIN2804qkn5jwvcb/MGC+mrGnRUAI
 +VQA21+LXh3C5TAIqXsn3H8hr/nPb3HJFYTCbbrI9f1S3WqNUzk3hJHUFEux3p1exYDN fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cttdbava9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:44 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8C8mZp020090;
 Wed, 8 Dec 2021 12:32:43 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cttdbav9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:43 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8CO4gv016820;
 Wed, 8 Dec 2021 12:32:42 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3cqyyb0xvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:42 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8CWf0A56099276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 12:32:41 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8576478067;
 Wed,  8 Dec 2021 12:32:41 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14E3C7805C;
 Wed,  8 Dec 2021 12:32:40 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.43.72])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 12:32:39 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/ppc: Remove 603e exception model
Date: Wed,  8 Dec 2021 09:30:28 -0300
Message-Id: <20211208123029.2052625-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211208123029.2052625-1-farosas@linux.ibm.com>
References: <20211208123029.2052625-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Uw_IxPdvOBTaFDcd-qyBv2OecQQKBvj1
X-Proofpoint-ORIG-GUID: 8zdr9QuRFxMvs8AY2Rs60twLduqEt8Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_04,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 mlxscore=0 mlxlogscore=918 priorityscore=1501 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112080080
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 603e uses the same exception code as 603 so we don't need a
dedicated entry for it.

This is only a removal of redundant code, no functional change.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu-qom.h     |  2 --
 target/ppc/cpu_init.c    | 32 ++------------------------------
 target/ppc/excp_helper.c |  1 -
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 5800fa324e..e585912571 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -94,8 +94,6 @@ enum powerpc_excp_t {
     POWERPC_EXCP_602,
     /* PowerPC 603 exception model      */
     POWERPC_EXCP_603,
-    /* PowerPC 603e exception model     */
-    POWERPC_EXCP_603E,
     /* PowerPC G2 exception model       */
     POWERPC_EXCP_G2,
     /* PowerPC 604 exception model      */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 55af48769a..8100b89033 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -4749,41 +4749,13 @@ POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
 }
 
-static void init_proc_603E(CPUPPCState *env)
-{
-    register_ne_601_sprs(env);
-    register_sdr1_sprs(env);
-    register_603_sprs(env);
-    /* Time base */
-    register_tbl(env);
-    /* hardware implementation registers */
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
-    init_excp_603(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
 POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
 
     dc->desc = "PowerPC 603e";
-    pcc->init_proc = init_proc_603E;
+    pcc->init_proc = init_proc_603;
     pcc->check_pow = check_pow_hid0;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
@@ -4809,7 +4781,7 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
                     (1ull << MSR_RI) |
                     (1ull << MSR_LE);
     pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_603E;
+    pcc->excp_model = POWERPC_EXCP_603;
     pcc->bus_model = PPC_FLAGS_INPUT_6xx;
     pcc->bfd_mach = bfd_mach_ppc_ec603e;
     pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 17607adbe4..f15a859fe4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -672,7 +672,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         switch (excp_model) {
         case POWERPC_EXCP_602:
         case POWERPC_EXCP_603:
-        case POWERPC_EXCP_603E:
         case POWERPC_EXCP_G2:
             /* Swap temporary saved registers with GPRs */
             if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
-- 
2.33.1


