Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CF54B8EA9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:57:43 +0100 (CET)
Received: from localhost ([::1]:53108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNcc-0004CU-AF
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:57:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN8E-0003VQ-Qo; Wed, 16 Feb 2022 11:26:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7w-0001Zd-Re; Wed, 16 Feb 2022 11:26:03 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGHGmx020954; 
 Wed, 16 Feb 2022 16:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Fi5QkWvtWBdHif1K021yuF7OOZT/YqtJOg3FMshAFLk=;
 b=lvvbHVO6d1Saia4AHefkGp3kaQzH/quce5y50/iRvgxusxYSL3m4A7Tt2/bEwys5q66P
 oLqFHPxxcmhMzYG1g5fE+WTwH04aMWKDsg1u+RKrqyPkT1LwGYlCh95KUtVvMh2jt9ny
 DYBhhnXrZY7Lb1fA+Hw1bi1r15EsIaoBDKXpcPf7ZWNkO5JGBZlGL/GFh+OX5dXpRJ5H
 f3mqPCHNK1Eqgmw3GfWONlojGzg6K4WViZWexWnNygAaQWj4OurCg9rbfM3MvrEbsZrL
 q+5oMzXADTnWNLjDCcGQ8l0SWn2m86zO5dWH0ciSwQk30YMsJL3dBrGnCAjpg3f9aMET 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94nj846n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:28 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGIAVg022204;
 Wed, 16 Feb 2022 16:25:28 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94nj8467-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:28 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCaxF009730;
 Wed, 16 Feb 2022 16:25:27 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3e64hbkt6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:26 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGPPTe36307356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:25:25 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9446A78070;
 Wed, 16 Feb 2022 16:25:25 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CB4778072;
 Wed, 16 Feb 2022 16:25:24 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:25:24 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/27] target/ppc: Move common SPR functions out of cpu_init
Date: Wed, 16 Feb 2022 13:24:26 -0300
Message-Id: <20220216162426.1885923-28-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GlF9DpY4P5bboxSHHIjMPqzMreqQamd3
X-Proofpoint-ORIG-GUID: WnC8WbOrzGes_7LxwoIS78FmpUjfw02T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 mlxlogscore=505 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Let's leave cpu_init with just generic CPU initialization and
QOM-related functions.

The rest of the SPR registration functions will be moved in the
following patches along with the code that uses them. These are only
the commonly used ones.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c    | 400 --------------------------------------
 target/ppc/helper_regs.c | 402 +++++++++++++++++++++++++++++++++++++++
 target/ppc/spr_common.h  |   1 +
 3 files changed, 403 insertions(+), 400 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 5bbbcceb55..bbc88005d8 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -57,367 +57,6 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
     ppc_store_vscr(env, val);
 }
 
-/**
- * _spr_register
- *
- * Register an SPR with all the callbacks required for tcg,
- * and the ID number for KVM.
- *
- * The reason for the conditional compilation is that the tcg functions
- * may be compiled out, and the system kvm header may not be available
- * for supplying the ID numbers.  This is ugly, but the best we can do.
- */
-void _spr_register(CPUPPCState *env, int num, const char *name,
-                   USR_ARG(spr_callback *uea_read)
-                   USR_ARG(spr_callback *uea_write)
-                   SYS_ARG(spr_callback *oea_read)
-                   SYS_ARG(spr_callback *oea_write)
-                   SYS_ARG(spr_callback *hea_read)
-                   SYS_ARG(spr_callback *hea_write)
-                   KVM_ARG(uint64_t one_reg_id)
-                   target_ulong initial_value)
-{
-    ppc_spr_t *spr = &env->spr_cb[num];
-
-    /* No SPR should be registered twice. */
-    assert(spr->name == NULL);
-    assert(name != NULL);
-
-    spr->name = name;
-    spr->default_value = initial_value;
-    env->spr[num] = initial_value;
-
-#ifdef CONFIG_TCG
-    spr->uea_read = uea_read;
-    spr->uea_write = uea_write;
-# ifndef CONFIG_USER_ONLY
-    spr->oea_read = oea_read;
-    spr->oea_write = oea_write;
-    spr->hea_read = hea_read;
-    spr->hea_write = hea_write;
-# endif
-#endif
-#ifdef CONFIG_KVM
-    spr->one_reg_id = one_reg_id;
-#endif
-}
-
-/* Generic PowerPC SPRs */
-static void register_generic_sprs(PowerPCCPU *cpu)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    CPUPPCState *env = &cpu->env;
-
-    /* Integer processing */
-    spr_register(env, SPR_XER, "XER",
-                 &spr_read_xer, &spr_write_xer,
-                 &spr_read_xer, &spr_write_xer,
-                 0x00000000);
-    /* Branch control */
-    spr_register(env, SPR_LR, "LR",
-                 &spr_read_lr, &spr_write_lr,
-                 &spr_read_lr, &spr_write_lr,
-                 0x00000000);
-    spr_register(env, SPR_CTR, "CTR",
-                 &spr_read_ctr, &spr_write_ctr,
-                 &spr_read_ctr, &spr_write_ctr,
-                 0x00000000);
-    /* Interrupt processing */
-    spr_register(env, SPR_SRR0, "SRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SRR1, "SRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Processor control */
-    spr_register(env, SPR_SPRG0, "SPRG0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG1, "SPRG1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG2, "SPRG2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG3, "SPRG3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_PVR, "PVR",
-                 /* Linux permits userspace to read PVR */
-#if defined(CONFIG_LINUX_USER)
-                 &spr_read_generic,
-#else
-                 SPR_NOACCESS,
-#endif
-                 SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 pcc->pvr);
-
-    /* Register SVR if it's defined to anything else than POWERPC_SVR_NONE */
-    if (pcc->svr != POWERPC_SVR_NONE) {
-        if (pcc->svr & POWERPC_SVR_E500) {
-            spr_register(env, SPR_E500_SVR, "SVR",
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, SPR_NOACCESS,
-                         pcc->svr & ~POWERPC_SVR_E500);
-        } else {
-            spr_register(env, SPR_SVR, "SVR",
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, SPR_NOACCESS,
-                         pcc->svr);
-        }
-    }
-
-    /* Time base */
-    spr_register(env, SPR_VTBL,  "TBL",
-                 &spr_read_tbl, SPR_NOACCESS,
-                 &spr_read_tbl, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_TBL,   "TBL",
-                 &spr_read_tbl, SPR_NOACCESS,
-                 &spr_read_tbl, &spr_write_tbl,
-                 0x00000000);
-    spr_register(env, SPR_VTBU,  "TBU",
-                 &spr_read_tbu, SPR_NOACCESS,
-                 &spr_read_tbu, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_TBU,   "TBU",
-                 &spr_read_tbu, SPR_NOACCESS,
-                 &spr_read_tbu, &spr_write_tbu,
-                 0x00000000);
-}
-
-void register_non_embedded_sprs(CPUPPCState *env)
-{
-    /* Exception processing */
-    spr_register_kvm(env, SPR_DSISR, "DSISR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DSISR, 0x00000000);
-    spr_register_kvm(env, SPR_DAR, "DAR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DAR, 0x00000000);
-    /* Timer */
-    spr_register(env, SPR_DECR, "DECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_decr, &spr_write_decr,
-                 0x00000000);
-}
-
-/* Storage Description Register 1 */
-void register_sdr1_sprs(CPUPPCState *env)
-{
-#ifndef CONFIG_USER_ONLY
-    if (env->has_hv_mode) {
-        /*
-         * SDR1 is a hypervisor resource on CPUs which have a
-         * hypervisor mode
-         */
-        spr_register_hv(env, SPR_SDR1, "SDR1",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_sdr1,
-                        0x00000000);
-    } else {
-        spr_register(env, SPR_SDR1, "SDR1",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_sdr1,
-                     0x00000000);
-    }
-#endif
-}
-
-/* BATs 0-3 */
-void register_low_BATs(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    spr_register(env, SPR_IBAT0U, "IBAT0U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT0L, "IBAT0L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT1U, "IBAT1U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT1L, "IBAT1L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT2U, "IBAT2U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT2L, "IBAT2L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatl,
-                 0x00000000);
-    spr_register(env, SPR_IBAT3U, "IBAT3U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatu,
-                 0x00000000);
-    spr_register(env, SPR_IBAT3L, "IBAT3L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat, &spr_write_ibatl,
-                 0x00000000);
-    spr_register(env, SPR_DBAT0U, "DBAT0U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatu,
-                 0x00000000);
-    spr_register(env, SPR_DBAT0L, "DBAT0L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatl,
-                 0x00000000);
-    spr_register(env, SPR_DBAT1U, "DBAT1U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatu,
-                 0x00000000);
-    spr_register(env, SPR_DBAT1L, "DBAT1L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatl,
-                 0x00000000);
-    spr_register(env, SPR_DBAT2U, "DBAT2U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatu,
-                 0x00000000);
-    spr_register(env, SPR_DBAT2L, "DBAT2L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatl,
-                 0x00000000);
-    spr_register(env, SPR_DBAT3U, "DBAT3U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatu,
-                 0x00000000);
-    spr_register(env, SPR_DBAT3L, "DBAT3L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat, &spr_write_dbatl,
-                 0x00000000);
-    env->nb_BATs += 4;
-#endif
-}
-
-/* BATs 4-7 */
-void register_high_BATs(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    spr_register(env, SPR_IBAT4U, "IBAT4U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatu_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT4L, "IBAT4L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatl_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT5U, "IBAT5U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatu_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT5L, "IBAT5L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatl_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT6U, "IBAT6U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatu_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT6L, "IBAT6L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatl_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT7U, "IBAT7U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatu_h,
-                 0x00000000);
-    spr_register(env, SPR_IBAT7L, "IBAT7L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_ibat_h, &spr_write_ibatl_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT4U, "DBAT4U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatu_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT4L, "DBAT4L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatl_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT5U, "DBAT5U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatu_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT5L, "DBAT5L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatl_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT6U, "DBAT6U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatu_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT6L, "DBAT6L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatl_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT7U, "DBAT7U",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatu_h,
-                 0x00000000);
-    spr_register(env, SPR_DBAT7L, "DBAT7L",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_dbat_h, &spr_write_dbatl_h,
-                 0x00000000);
-    env->nb_BATs += 4;
-#endif
-}
-
-/* Softare table search registers */
-void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb = nb_tlbs;
-    env->nb_ways = nb_ways;
-    env->id_tlbs = 1;
-    env->tlb_type = TLB_6XX;
-    spr_register(env, SPR_DMISS, "DMISS",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_DCMP, "DCMP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_HASH1, "HASH1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_HASH2, "HASH2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_IMISS, "IMISS",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_ICMP, "ICMP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_RPA, "RPA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-#endif
-}
-
 static void register_745_sprs(CPUPPCState *env)
 {
     /* SGPRs */
@@ -620,25 +259,6 @@ static void register_iamr_sprs(CPUPPCState *env)
 }
 #endif /* TARGET_PPC64 */
 
-void register_thrm_sprs(CPUPPCState *env)
-{
-    /* Thermal management */
-    spr_register(env, SPR_THRM1, "THRM1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_thrm, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_THRM2, "THRM2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_thrm, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_THRM3, "THRM3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_thrm, &spr_write_generic,
-                 0x00000000);
-}
-
 /* SPR specific to PowerPC 604 implementation */
 static void register_604_sprs(CPUPPCState *env)
 {
@@ -1025,26 +645,6 @@ static void register_l3_ctrl(CPUPPCState *env)
                  0x00000000);
 }
 
-void register_usprgh_sprs(CPUPPCState *env)
-{
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-}
-
 /* PowerPC BookE SPR */
 static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
 {
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 38fcb5fe50..9a691d6833 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -24,6 +24,8 @@
 #include "sysemu/kvm.h"
 #include "helper_regs.h"
 #include "power8-pmu.h"
+#include "cpu-models.h"
+#include "spr_common.h"
 
 /* Swap temporary saved registers with GPRs */
 void hreg_swap_gpr_tgpr(CPUPPCState *env)
@@ -302,3 +304,403 @@ void check_tlb_flush(CPUPPCState *env, bool global)
     }
 }
 #endif
+
+/**
+ * _spr_register
+ *
+ * Register an SPR with all the callbacks required for tcg,
+ * and the ID number for KVM.
+ *
+ * The reason for the conditional compilation is that the tcg functions
+ * may be compiled out, and the system kvm header may not be available
+ * for supplying the ID numbers.  This is ugly, but the best we can do.
+ */
+void _spr_register(CPUPPCState *env, int num, const char *name,
+                   USR_ARG(spr_callback *uea_read)
+                   USR_ARG(spr_callback *uea_write)
+                   SYS_ARG(spr_callback *oea_read)
+                   SYS_ARG(spr_callback *oea_write)
+                   SYS_ARG(spr_callback *hea_read)
+                   SYS_ARG(spr_callback *hea_write)
+                   KVM_ARG(uint64_t one_reg_id)
+                   target_ulong initial_value)
+{
+    ppc_spr_t *spr = &env->spr_cb[num];
+
+    /* No SPR should be registered twice. */
+    assert(spr->name == NULL);
+    assert(name != NULL);
+
+    spr->name = name;
+    spr->default_value = initial_value;
+    env->spr[num] = initial_value;
+
+#ifdef CONFIG_TCG
+    spr->uea_read = uea_read;
+    spr->uea_write = uea_write;
+# ifndef CONFIG_USER_ONLY
+    spr->oea_read = oea_read;
+    spr->oea_write = oea_write;
+    spr->hea_read = hea_read;
+    spr->hea_write = hea_write;
+# endif
+#endif
+#ifdef CONFIG_KVM
+    spr->one_reg_id = one_reg_id;
+#endif
+}
+
+/* Generic PowerPC SPRs */
+void register_generic_sprs(PowerPCCPU *cpu)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env = &cpu->env;
+
+    /* Integer processing */
+    spr_register(env, SPR_XER, "XER",
+                 &spr_read_xer, &spr_write_xer,
+                 &spr_read_xer, &spr_write_xer,
+                 0x00000000);
+    /* Branch control */
+    spr_register(env, SPR_LR, "LR",
+                 &spr_read_lr, &spr_write_lr,
+                 &spr_read_lr, &spr_write_lr,
+                 0x00000000);
+    spr_register(env, SPR_CTR, "CTR",
+                 &spr_read_ctr, &spr_write_ctr,
+                 &spr_read_ctr, &spr_write_ctr,
+                 0x00000000);
+    /* Interrupt processing */
+    spr_register(env, SPR_SRR0, "SRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SRR1, "SRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Processor control */
+    spr_register(env, SPR_SPRG0, "SPRG0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG1, "SPRG1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG2, "SPRG2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG3, "SPRG3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_PVR, "PVR",
+                 /* Linux permits userspace to read PVR */
+#if defined(CONFIG_LINUX_USER)
+                 &spr_read_generic,
+#else
+                 SPR_NOACCESS,
+#endif
+                 SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 pcc->pvr);
+
+    /* Register SVR if it's defined to anything else than POWERPC_SVR_NONE */
+    if (pcc->svr != POWERPC_SVR_NONE) {
+        if (pcc->svr & POWERPC_SVR_E500) {
+            spr_register(env, SPR_E500_SVR, "SVR",
+                         SPR_NOACCESS, SPR_NOACCESS,
+                         &spr_read_generic, SPR_NOACCESS,
+                         pcc->svr & ~POWERPC_SVR_E500);
+        } else {
+            spr_register(env, SPR_SVR, "SVR",
+                         SPR_NOACCESS, SPR_NOACCESS,
+                         &spr_read_generic, SPR_NOACCESS,
+                         pcc->svr);
+        }
+    }
+
+    /* Time base */
+    spr_register(env, SPR_VTBL,  "TBL",
+                 &spr_read_tbl, SPR_NOACCESS,
+                 &spr_read_tbl, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_TBL,   "TBL",
+                 &spr_read_tbl, SPR_NOACCESS,
+                 &spr_read_tbl, &spr_write_tbl,
+                 0x00000000);
+    spr_register(env, SPR_VTBU,  "TBU",
+                 &spr_read_tbu, SPR_NOACCESS,
+                 &spr_read_tbu, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_TBU,   "TBU",
+                 &spr_read_tbu, SPR_NOACCESS,
+                 &spr_read_tbu, &spr_write_tbu,
+                 0x00000000);
+}
+
+void register_non_embedded_sprs(CPUPPCState *env)
+{
+    /* Exception processing */
+    spr_register_kvm(env, SPR_DSISR, "DSISR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DSISR, 0x00000000);
+    spr_register_kvm(env, SPR_DAR, "DAR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DAR, 0x00000000);
+    /* Timer */
+    spr_register(env, SPR_DECR, "DECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_decr, &spr_write_decr,
+                 0x00000000);
+}
+
+/* Storage Description Register 1 */
+void register_sdr1_sprs(CPUPPCState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    if (env->has_hv_mode) {
+        /*
+         * SDR1 is a hypervisor resource on CPUs which have a
+         * hypervisor mode
+         */
+        spr_register_hv(env, SPR_SDR1, "SDR1",
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        SPR_NOACCESS, SPR_NOACCESS,
+                        &spr_read_generic, &spr_write_sdr1,
+                        0x00000000);
+    } else {
+        spr_register(env, SPR_SDR1, "SDR1",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_sdr1,
+                     0x00000000);
+    }
+#endif
+}
+
+/* BATs 0-3 */
+void register_low_BATs(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    spr_register(env, SPR_IBAT0U, "IBAT0U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT0L, "IBAT0L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatl,
+                 0x00000000);
+    spr_register(env, SPR_IBAT1U, "IBAT1U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT1L, "IBAT1L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatl,
+                 0x00000000);
+    spr_register(env, SPR_IBAT2U, "IBAT2U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT2L, "IBAT2L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatl,
+                 0x00000000);
+    spr_register(env, SPR_IBAT3U, "IBAT3U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatu,
+                 0x00000000);
+    spr_register(env, SPR_IBAT3L, "IBAT3L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat, &spr_write_ibatl,
+                 0x00000000);
+    spr_register(env, SPR_DBAT0U, "DBAT0U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatu,
+                 0x00000000);
+    spr_register(env, SPR_DBAT0L, "DBAT0L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatl,
+                 0x00000000);
+    spr_register(env, SPR_DBAT1U, "DBAT1U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatu,
+                 0x00000000);
+    spr_register(env, SPR_DBAT1L, "DBAT1L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatl,
+                 0x00000000);
+    spr_register(env, SPR_DBAT2U, "DBAT2U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatu,
+                 0x00000000);
+    spr_register(env, SPR_DBAT2L, "DBAT2L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatl,
+                 0x00000000);
+    spr_register(env, SPR_DBAT3U, "DBAT3U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatu,
+                 0x00000000);
+    spr_register(env, SPR_DBAT3L, "DBAT3L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat, &spr_write_dbatl,
+                 0x00000000);
+    env->nb_BATs += 4;
+#endif
+}
+
+/* BATs 4-7 */
+void register_high_BATs(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    spr_register(env, SPR_IBAT4U, "IBAT4U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatu_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT4L, "IBAT4L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatl_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT5U, "IBAT5U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatu_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT5L, "IBAT5L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatl_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT6U, "IBAT6U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatu_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT6L, "IBAT6L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatl_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT7U, "IBAT7U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatu_h,
+                 0x00000000);
+    spr_register(env, SPR_IBAT7L, "IBAT7L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_ibat_h, &spr_write_ibatl_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT4U, "DBAT4U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatu_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT4L, "DBAT4L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatl_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT5U, "DBAT5U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatu_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT5L, "DBAT5L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatl_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT6U, "DBAT6U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatu_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT6L, "DBAT6L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatl_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT7U, "DBAT7U",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatu_h,
+                 0x00000000);
+    spr_register(env, SPR_DBAT7L, "DBAT7L",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_dbat_h, &spr_write_dbatl_h,
+                 0x00000000);
+    env->nb_BATs += 4;
+#endif
+}
+
+/* Softare table search registers */
+void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb = nb_tlbs;
+    env->nb_ways = nb_ways;
+    env->id_tlbs = 1;
+    env->tlb_type = TLB_6XX;
+    spr_register(env, SPR_DMISS, "DMISS",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_DCMP, "DCMP",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_HASH1, "HASH1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_HASH2, "HASH2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_IMISS, "IMISS",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_ICMP, "ICMP",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_RPA, "RPA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+#endif
+}
+
+void register_thrm_sprs(CPUPPCState *env)
+{
+    /* Thermal management */
+    spr_register(env, SPR_THRM1, "THRM1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_thrm, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_THRM2, "THRM2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_thrm, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_THRM3, "THRM3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_thrm, &spr_write_generic,
+                 0x00000000);
+}
+
+void register_usprgh_sprs(CPUPPCState *env)
+{
+    spr_register(env, SPR_USPRG4, "USPRG4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_USPRG5, "USPRG5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_USPRG6, "USPRG6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_USPRG7, "USPRG7",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+}
diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
index a243c14a11..b5a5bc6895 100644
--- a/target/ppc/spr_common.h
+++ b/target/ppc/spr_common.h
@@ -204,5 +204,6 @@ void register_thrm_sprs(CPUPPCState *env);
 void register_usprgh_sprs(CPUPPCState *env);
 void register_non_embedded_sprs(CPUPPCState *env);
 void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways);
+void register_generic_sprs(PowerPCCPU *cpu);
 
 #endif
-- 
2.34.1


