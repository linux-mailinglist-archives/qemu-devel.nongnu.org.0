Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D47478009
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:36:46 +0100 (CET)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxzMi-00012I-UU
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:36:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLx-00043p-T3; Thu, 16 Dec 2021 15:27:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14514
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLv-0007YX-Ph; Thu, 16 Dec 2021 15:27:49 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDswU014174; 
 Thu, 16 Dec 2021 20:27:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmwwuur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:16 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGKJXcc021345;
 Thu, 16 Dec 2021 20:27:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmwwuua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDE5K019549;
 Thu, 16 Dec 2021 20:27:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78ek0s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKRBIZ45679024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7BBFAE055;
 Thu, 16 Dec 2021 20:27:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9036BAE051;
 Thu, 16 Dec 2021 20:27:11 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:11 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C5C9F220238;
 Thu, 16 Dec 2021 21:27:10 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 083/101] target/ppc: PMU: update counters on PMCs r/w
Date: Thu, 16 Dec 2021 21:25:56 +0100
Message-Id: <20211216202614.414266-84-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l44XbpJHm3pD3CluwcTnEuyKqq7ddX92
X-Proofpoint-ORIG-GUID: wdiVQEtWOy7jBeDJi9pRXHzHfSkjGaCE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1034 lowpriorityscore=0 malwarescore=0
 mlxlogscore=775 mlxscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Calling pmu_update_cycles() on every PMC read/write operation ensures
that the values being fetched are up to date with the current PMU state.

In theory we can get away by just trapping PMCs reads, but we're going
to trap PMC writes to deal with counter overflow logic later on.  Let's
put the required wiring for that and make our lives a bit easier in the
next patches.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211201151734.654994-4-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h              |  2 ++
 target/ppc/spr_tcg.h             |  2 ++
 target/ppc/cpu_init.c            | 12 ++++++------
 target/ppc/power8-pmu.c          | 14 ++++++++++++++
 target/ppc/power8-pmu-regs.c.inc | 29 +++++++++++++++++++++++++++--
 5 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 0e6cf2d09d4e..984d03181a52 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -21,6 +21,8 @@ DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
+DEF_HELPER_3(store_pmc, void, env, i32, i64)
+DEF_HELPER_2(read_pmc, tl, env, i32)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index eb1d0c2bf0dc..1e79a0522aac 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -26,6 +26,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn=
);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
@@ -35,6 +36,7 @@ void spr_write_ctr(DisasContext *ctx, int sprn, int gpr=
n);
 void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_PMC(DisasContext *ctx, int gprn, int sprn);
 void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index cfa605a76b84..ceb325b311fb 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6266,27 +6266,27 @@ static void register_book3s_pmu_sup_sprs(CPUPPCSt=
ate *env)
                      KVM_REG_PPC_MMCRA, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC2, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC3, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC4, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC5, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC6, 0x00000000);
     spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
                      SPR_NOACCESS, SPR_NOACCESS,
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 5e689144d712..7131f52ccc5d 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -133,6 +133,20 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulo=
ng value)
     hreg_compute_hflags(env);
 }
=20
+target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
+{
+    pmu_update_cycles(env);
+
+    return env->spr[sprn];
+}
+
+void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
+{
+    pmu_update_cycles(env);
+
+    env->spr[sprn] =3D value;
+}
+
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env =3D &cpu->env;
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-reg=
s.c.inc
index fbb89776414e..f0c9cc343b3d 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -181,13 +181,23 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sp=
rn, int gprn)
     tcg_temp_free(masked_gprn);
 }
=20
+void spr_read_PMC(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv_i32 t_sprn =3D tcg_const_i32(sprn);
+
+    gen_icount_io_start(ctx);
+    gen_helper_read_pmc(cpu_gpr[gprn], cpu_env, t_sprn);
+
+    tcg_temp_free_i32(t_sprn);
+}
+
 void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn)
 {
     if (!spr_groupA_read_allowed(ctx)) {
         return;
     }
=20
-    spr_read_ureg(ctx, gprn, sprn);
+    spr_read_PMC(ctx, gprn, sprn + 0x10);
 }
=20
 void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
@@ -206,13 +216,23 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gpr=
n, int sprn)
     spr_read_PMC14_ureg(ctx, gprn, sprn);
 }
=20
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t_sprn =3D tcg_const_i32(sprn);
+
+    gen_icount_io_start(ctx);
+    gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
+
+    tcg_temp_free_i32(t_sprn);
+}
+
 void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     if (!spr_groupA_write_allowed(ctx)) {
         return;
     }
=20
-    spr_write_ureg(ctx, sprn, gprn);
+    spr_write_PMC(ctx, sprn + 0x10, gprn);
 }
=20
 void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
@@ -280,4 +300,9 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, int=
 gprn)
 {
     spr_write_generic(ctx, sprn, gprn);
 }
+
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
--=20
2.31.1


