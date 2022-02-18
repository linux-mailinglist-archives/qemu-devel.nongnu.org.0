Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0414BB7FA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 12:24:08 +0100 (CET)
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1Mt-0005CS-Gj
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 06:24:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0ft-0001K2-9o; Fri, 18 Feb 2022 05:39:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fk-0005ka-HH; Fri, 18 Feb 2022 05:39:41 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IA9bRk019314; 
 Fri, 18 Feb 2022 10:39:02 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea62cw1xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:39:01 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAcRcH002057;
 Fri, 18 Feb 2022 10:38:59 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3e64hapt0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21IAcunV49021416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5B1AAE051;
 Fri, 18 Feb 2022 10:38:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FEFAAE045;
 Fri, 18 Feb 2022 10:38:56 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:56 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A6AE7220294;
 Fri, 18 Feb 2022 11:38:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 39/39] target/ppc: Move common SPR functions out of cpu_init
Date: Fri, 18 Feb 2022 11:38:27 +0100
Message-Id: <20220218103827.682032-40-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: glIa_oeQXU0ATyVcUg1oGaOQF9iU5cul
X-Proofpoint-ORIG-GUID: glIa_oeQXU0ATyVcUg1oGaOQF9iU5cul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=290 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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

Let's leave cpu_init with just generic CPU initialization and
QOM-related functions.

The rest of the SPR registration functions will be moved in the
following patches along with the code that uses them. These are only
the commonly used ones.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20220216162426.1885923-28-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/spr_common.h  |   1 +
 target/ppc/cpu_init.c    | 400 --------------------------------------
 target/ppc/helper_regs.c | 402 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 403 insertions(+), 400 deletions(-)

diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
index a243c14a11d9..b5a5bc68952e 100644
--- a/target/ppc/spr_common.h
+++ b/target/ppc/spr_common.h
@@ -204,5 +204,6 @@ void register_thrm_sprs(CPUPPCState *env);
 void register_usprgh_sprs(CPUPPCState *env);
 void register_non_embedded_sprs(CPUPPCState *env);
 void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_way=
s);
+void register_generic_sprs(PowerPCCPU *cpu);
=20
 #endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index a435525ea32f..61d36b11a093 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -57,367 +57,6 @@ static inline void vscr_init(CPUPPCState *env, uint32=
_t val)
     ppc_store_vscr(env, val);
 }
=20
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
-    ppc_spr_t *spr =3D &env->spr_cb[num];
-
-    /* No SPR should be registered twice. */
-    assert(spr->name =3D=3D NULL);
-    assert(name !=3D NULL);
-
-    spr->name =3D name;
-    spr->default_value =3D initial_value;
-    env->spr[num] =3D initial_value;
-
-#ifdef CONFIG_TCG
-    spr->uea_read =3D uea_read;
-    spr->uea_write =3D uea_write;
-# ifndef CONFIG_USER_ONLY
-    spr->oea_read =3D oea_read;
-    spr->oea_write =3D oea_write;
-    spr->hea_read =3D hea_read;
-    spr->hea_write =3D hea_write;
-# endif
-#endif
-#ifdef CONFIG_KVM
-    spr->one_reg_id =3D one_reg_id;
-#endif
-}
-
-/* Generic PowerPC SPRs */
-static void register_generic_sprs(PowerPCCPU *cpu)
-{
-    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
-    CPUPPCState *env =3D &cpu->env;
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
-    /* Register SVR if it's defined to anything else than POWERPC_SVR_NO=
NE */
-    if (pcc->svr !=3D POWERPC_SVR_NONE) {
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
-    env->nb_BATs +=3D 4;
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
-    env->nb_BATs +=3D 4;
-#endif
-}
-
-/* Softare table search registers */
-void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_way=
s)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb =3D nb_tlbs;
-    env->nb_ways =3D nb_ways;
-    env->id_tlbs =3D 1;
-    env->tlb_type =3D TLB_6XX;
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
=20
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
=20
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
index 38fcb5fe5048..9a691d6833fb 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -24,6 +24,8 @@
 #include "sysemu/kvm.h"
 #include "helper_regs.h"
 #include "power8-pmu.h"
+#include "cpu-models.h"
+#include "spr_common.h"
=20
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
+    ppc_spr_t *spr =3D &env->spr_cb[num];
+
+    /* No SPR should be registered twice. */
+    assert(spr->name =3D=3D NULL);
+    assert(name !=3D NULL);
+
+    spr->name =3D name;
+    spr->default_value =3D initial_value;
+    env->spr[num] =3D initial_value;
+
+#ifdef CONFIG_TCG
+    spr->uea_read =3D uea_read;
+    spr->uea_write =3D uea_write;
+# ifndef CONFIG_USER_ONLY
+    spr->oea_read =3D oea_read;
+    spr->oea_write =3D oea_write;
+    spr->hea_read =3D hea_read;
+    spr->hea_write =3D hea_write;
+# endif
+#endif
+#ifdef CONFIG_KVM
+    spr->one_reg_id =3D one_reg_id;
+#endif
+}
+
+/* Generic PowerPC SPRs */
+void register_generic_sprs(PowerPCCPU *cpu)
+{
+    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env =3D &cpu->env;
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
+    /* Register SVR if it's defined to anything else than POWERPC_SVR_NO=
NE */
+    if (pcc->svr !=3D POWERPC_SVR_NONE) {
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
+    env->nb_BATs +=3D 4;
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
+    env->nb_BATs +=3D 4;
+#endif
+}
+
+/* Softare table search registers */
+void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_way=
s)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb =3D nb_tlbs;
+    env->nb_ways =3D nb_ways;
+    env->id_tlbs =3D 1;
+    env->tlb_type =3D TLB_6XX;
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
--=20
2.34.1


