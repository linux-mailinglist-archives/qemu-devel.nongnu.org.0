Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01A482EAE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 08:14:18 +0100 (CET)
Received: from localhost ([::1]:53386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4HXt-00046s-VW
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 02:14:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4GwE-0002F3-06; Mon, 03 Jan 2022 01:35:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gvy-0007zt-5R; Mon, 03 Jan 2022 01:35:21 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2033hbHP010661; 
 Mon, 3 Jan 2022 06:34:52 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dbsg5jh31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:51 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2036Xgc7002283;
 Mon, 3 Jan 2022 06:34:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3daek8yq15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2036YkvV46596372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 06:34:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE1ED11C052;
 Mon,  3 Jan 2022 06:34:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74C9711C058;
 Mon,  3 Jan 2022 06:34:46 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 Jan 2022 06:34:46 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CBBFB2201BB;
 Mon,  3 Jan 2022 07:34:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] ppc/ppc405: Restore TCR and STR write handlers
Date: Mon,  3 Jan 2022 07:34:37 +0100
Message-Id: <20220103063441.3424853-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220103063441.3424853-1-clg@kaod.org>
References: <20220103063441.3424853-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ZCS_wXp9oNthFPBZZui_LwHTyBek7zd
X-Proofpoint-GUID: 7ZCS_wXp9oNthFPBZZui_LwHTyBek7zd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_02,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=945 bulkscore=0 impostorscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030044
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 405 timers were broken when booke support was added. Assumption
was made that the register numbers were the same but it's not :

    SPR_BOOKE_TSR         (0x150)
    SPR_BOOKE_TCR         (0x154)
    SPR_40x_TSR           (0x3D8)
    SPR_40x_TCR           (0x3DA)

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: ddd1055b07fd ("PPC: booke timers")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211222064025.1541490-5-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h             |  2 ++
 target/ppc/helper.h          |  2 ++
 target/ppc/spr_tcg.h         |  2 ++
 hw/ppc/ppc.c                 | 25 +++++++++++++++++++++++++
 target/ppc/cpu_init.c        |  4 ++--
 target/ppc/timebase_helper.c | 10 ++++++++++
 target/ppc/translate.c       | 12 ++++++++++++
 hw/ppc/trace-events          |  2 ++
 8 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index fc66c3561dab..4808e10ebe8b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1399,6 +1399,8 @@ target_ulong load_40x_pit(CPUPPCState *env);
 void store_40x_pit(CPUPPCState *env, target_ulong val);
 void store_40x_dbcr0(CPUPPCState *env, uint32_t val);
 void store_40x_sler(CPUPPCState *env, uint32_t val);
+void store_40x_tcr(CPUPPCState *env, target_ulong val);
+void store_40x_tsr(CPUPPCState *env, target_ulong val);
 void store_booke_tcr(CPUPPCState *env, target_ulong val);
 void store_booke_tsr(CPUPPCState *env, target_ulong val);
 void ppc_tlb_invalidate_all(CPUPPCState *env);
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index fb6cac38b4c5..f9c72dcd504d 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -706,6 +706,8 @@ DEF_HELPER_2(store_hid0_601, void, env, tl)
 DEF_HELPER_3(store_403_pbr, void, env, i32, tl)
 DEF_HELPER_FLAGS_1(load_40x_pit, TCG_CALL_NO_RWG, tl, env)
 DEF_HELPER_FLAGS_2(store_40x_pit, TCG_CALL_NO_RWG, void, env, tl)
+DEF_HELPER_FLAGS_2(store_40x_tcr, TCG_CALL_NO_RWG, void, env, tl)
+DEF_HELPER_FLAGS_2(store_40x_tsr, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_2(store_40x_dbcr0, void, env, tl)
 DEF_HELPER_2(store_40x_sler, void, env, tl)
 DEF_HELPER_FLAGS_2(store_booke_tcr, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index f98d97c0ba17..64cf5302cb86 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -87,6 +87,8 @@ void spr_read_40x_pit(DisasContext *ctx, int gprn, int =
sprn);
 void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn);
 void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn);
 void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn);
+void spr_write_40x_tcr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_40x_tsr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn);
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 818d75798584..cca99cb86f81 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1300,6 +1300,31 @@ target_ulong load_40x_pit (CPUPPCState *env)
     return cpu_ppc_load_decr(env);
 }
=20
+void store_40x_tsr(CPUPPCState *env, target_ulong val)
+{
+    PowerPCCPU *cpu =3D env_archcpu(env);
+
+    trace_ppc40x_store_tcr(val);
+
+    env->spr[SPR_40x_TSR] &=3D ~(val & 0xFC000000);
+    if (val & 0x80000000) {
+        ppc_set_irq(cpu, PPC_INTERRUPT_PIT, 0);
+    }
+}
+
+void store_40x_tcr(CPUPPCState *env, target_ulong val)
+{
+    PowerPCCPU *cpu =3D env_archcpu(env);
+    ppc_tb_t *tb_env;
+
+    trace_ppc40x_store_tsr(val);
+
+    tb_env =3D env->tb_env;
+    env->spr[SPR_40x_TCR] =3D val & 0xFFC00000;
+    start_stop_pit(env, tb_env, 1);
+    cpu_4xx_wdt_cb(cpu);
+}
+
 static void ppc_40x_set_tb_clk (void *opaque, uint32_t freq)
 {
     CPUPPCState *env =3D opaque;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 06ef15cd9e4e..b5e2fde9ec4d 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1440,11 +1440,11 @@ static void register_40x_sprs(CPUPPCState *env)
                  0x00000000);
     spr_register(env, SPR_40x_TCR, "TCR",
                  SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_tcr,
+                 &spr_read_generic, &spr_write_40x_tcr,
                  0x00000000);
     spr_register(env, SPR_40x_TSR, "TSR",
                  SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_tsr,
+                 &spr_read_generic, &spr_write_40x_tsr,
                  0x00000000);
 }
=20
diff --git a/target/ppc/timebase_helper.c b/target/ppc/timebase_helper.c
index 8ff4080eb91e..af378318c19c 100644
--- a/target/ppc/timebase_helper.c
+++ b/target/ppc/timebase_helper.c
@@ -144,6 +144,16 @@ void helper_store_40x_pit(CPUPPCState *env, target_u=
long val)
     store_40x_pit(env, val);
 }
=20
+void helper_store_40x_tcr(CPUPPCState *env, target_ulong val)
+{
+    store_40x_tcr(env, val);
+}
+
+void helper_store_40x_tsr(CPUPPCState *env, target_ulong val)
+{
+    store_40x_tsr(env, val);
+}
+
 void helper_store_booke_tcr(CPUPPCState *env, target_ulong val)
 {
     store_booke_tcr(env, val);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 114456148c4b..eb45f679d34f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -878,6 +878,18 @@ void spr_write_40x_sler(DisasContext *ctx, int sprn,=
 int gprn)
     gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
 }
=20
+void spr_write_40x_tcr(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_icount_io_start(ctx);
+    gen_helper_store_40x_tcr(cpu_env, cpu_gpr[gprn]);
+}
+
+void spr_write_40x_tsr(DisasContext *ctx, int sprn, int gprn)
+{
+    gen_icount_io_start(ctx);
+    gen_helper_store_40x_tsr(cpu_env, cpu_gpr[gprn]);
+}
+
 void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
 {
     gen_icount_io_start(ctx);
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 0c55aa501471..5c0a215cad90 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -110,6 +110,8 @@ ppc4xx_pit_start(uint64_t reload) "PIT 0x%016" PRIx64
 ppc4xx_pit(uint32_t ar, uint32_t ir, uint64_t tcr, uint64_t tsr, uint64_=
t reload) "ar %d ir %d TCR 0x%" PRIx64 " TSR 0x%" PRIx64 " PIT 0x%016" PR=
Ix64
 ppc4xx_wdt(uint64_t tcr, uint64_t tsr) "TCR 0x%" PRIx64 " TSR 0x%" PRIx6=
4
 ppc40x_store_pit(uint64_t value) "val 0x%" PRIx64
+ppc40x_store_tcr(uint64_t value) "val 0x%" PRIx64
+ppc40x_store_tsr(uint64_t value) "val 0x%" PRIx64
 ppc40x_set_tb_clk(uint32_t value) "new frequency %" PRIu32
 ppc40x_timers_init(uint32_t value) "frequency %" PRIu32
=20
--=20
2.31.1


