Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C7477FA3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 22:56:41 +0100 (CET)
Received: from localhost ([::1]:43722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxyjw-0001Qg-1Q
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 16:56:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxM9-0004lC-2I; Thu, 16 Dec 2021 15:28:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxLs-0007X9-FL; Thu, 16 Dec 2021 15:28:00 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJtqA3017562; 
 Thu, 16 Dec 2021 20:27:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cynfwpc9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:17 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGKOZ9c031029;
 Thu, 16 Dec 2021 20:27:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cynfwpc8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:17 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDDrF004792;
 Thu, 16 Dec 2021 20:27:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jravy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKRC7I44302758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:27:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F2E511C054;
 Thu, 16 Dec 2021 20:27:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4723B11C05B;
 Thu, 16 Dec 2021 20:27:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7F2C52201A0;
 Thu, 16 Dec 2021 21:27:11 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 084/101] target/ppc: PMU: update counters on MMCR1 write
Date: Thu, 16 Dec 2021 21:25:57 +0100
Message-Id: <20211216202614.414266-85-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RdAh6iOdf4sgd2LLABsgqv68aoYISOnh
X-Proofpoint-ORIG-GUID: gnPqzGxoDHFwxlpaT5J74lrKzSJAsJlk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=574 malwarescore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

MMCR1 determines the events to be sampled by the PMU. Updating the
counters at every MMCR1 write ensures that we're not sampling more
or less events by looking only at MMCR0 and the PMCs.

It is worth noticing that both the Book3S PowerPC PMU, and this IBM
Power8+ PMU that we're modeling, also uses MMCRA, MMCR2 and MMCR3 to
control the PMU. These three registers aren't being handled in this
initial implementation, so for now we're controlling all the PMU
aspects using MMCR0, MMCR1 and the PMCs.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211201151734.654994-5-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/helper.h              |  1 +
 target/ppc/spr_tcg.h             |  1 +
 target/ppc/cpu_init.c            |  2 +-
 target/ppc/power8-pmu.c          |  7 +++++++
 target/ppc/power8-pmu-regs.c.inc | 11 +++++++++++
 5 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 984d03181a52..77c85e1292fa 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
+DEF_HELPER_2(store_mmcr1, void, env, tl)
 DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(read_pmc, tl, env, i32)
 #endif
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 1e79a0522aac..1d6521eedc83 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -26,6 +26,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn=
);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ceb325b311fb..e865d368f237 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6258,7 +6258,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCStat=
e *env)
                      KVM_REG_PPC_MMCR0, 0x80000000);
     spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_MMCR1,
                      KVM_REG_PPC_MMCR1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_MMCRA, "MMCRA",
                      SPR_NOACCESS, SPR_NOACCESS,
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 7131f52ccc5d..73252529beee 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -133,6 +133,13 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulo=
ng value)
     hreg_compute_hflags(env);
 }
=20
+void helper_store_mmcr1(CPUPPCState *env, uint64_t value)
+{
+    pmu_update_cycles(env);
+
+    env->spr[SPR_POWER_MMCR1] =3D value;
+}
+
 target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
 {
     pmu_update_cycles(env);
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-reg=
s.c.inc
index f0c9cc343b3d..25b13ad56434 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -255,6 +255,12 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, in=
t gprn)
 {
     write_MMCR0_common(ctx, cpu_gpr[gprn]);
 }
+
+void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_icount_io_start(ctx);
+    gen_helper_store_mmcr1(cpu_env, cpu_gpr[gprn]);
+}
 #else
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 {
@@ -301,6 +307,11 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, in=
t gprn)
     spr_write_generic(ctx, sprn, gprn);
 }
=20
+void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
+
 void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
 {
     spr_write_generic(ctx, sprn, gprn);
--=20
2.31.1


