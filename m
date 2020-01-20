Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C801428D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 12:08:36 +0100 (CET)
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itUv5-0007dC-6i
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 06:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1itUdg-0000Ra-2T
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1itUdb-00013l-DV
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:50:35 -0500
Received: from 4.mo177.mail-out.ovh.net ([46.105.37.72]:56882)
 by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
 id 1itUdb-00013O-2f
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:50:31 -0500
Received: from player718.ha.ovh.net (unknown [10.108.16.135])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 9CDD411F2D4
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 11:50:27 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 922BDE506393;
 Mon, 20 Jan 2020 10:49:54 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v2 2/2] target/ppc: add support for Hypervisor Facility
 Unavailable Exception
Date: Mon, 20 Jan 2020 11:49:35 +0100
Message-Id: <20200120104935.24449-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200120104935.24449-1-clg@kaod.org>
References: <20200120104935.24449-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 9644740080235088870
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.37.72
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The privileged message send and clear instructions (msgsndp & msgclrp)
are privileged, but will generate a hypervisor facility unavailable
exception if not enabled in the HFSCR and executed in privileged
non-hypervisor state.

Add checks when accessing the DPDES register and when using the
msgsndp and msgclrp isntructions.

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h         |  6 ++++++
 target/ppc/excp_helper.c | 13 +++++++++++++
 target/ppc/misc_helper.c | 27 +++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 8ebeaba649d0..96aeea1934d8 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -397,6 +397,10 @@ typedef struct ppc_v3_pate_t {
 #define PSSCR_ESL         PPC_BIT(42) /* Enable State Loss */
 #define PSSCR_EC          PPC_BIT(43) /* Exit Criterion */
=20
+/* HFSCR bits */
+#define HFSCR_MSGP     PPC_BIT(53) /* Privileged Message Send Facilities=
 */
+#define HFSCR_IC_MSGP  0xA
+
 #define msr_sf   ((env->msr >> MSR_SF)   & 1)
 #define msr_isf  ((env->msr >> MSR_ISF)  & 1)
 #define msr_shv  ((env->msr >> MSR_SHV)  & 1)
@@ -1329,6 +1333,8 @@ void cpu_ppc_set_vhyp(PowerPCCPU *cpu, PPCVirtualHy=
pervisor *vhyp);
 #endif
=20
 void store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask);
+void helper_hfscr_facility_check(CPUPPCState *env, uint32_t bit,
+                                 const char *caller, uint32_t cause);
=20
 static inline uint64_t ppc_dump_gpr(CPUPPCState *env, int gprn)
 {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 1b07c3ed561e..027f54c0ed5f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -471,6 +471,15 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
     case POWERPC_EXCP_FU:         /* Facility unavailable exception     =
     */
 #ifdef TARGET_PPC64
         env->spr[SPR_FSCR] |=3D ((target_ulong)env->error_code << 56);
+#endif
+        break;
+    case POWERPC_EXCP_HV_FU:     /* Hypervisor Facility Unavailable Exce=
ption */
+#ifdef TARGET_PPC64
+        env->spr[SPR_HFSCR] |=3D ((target_ulong)env->error_code << FSCR_=
IC_POS);
+        srr0 =3D SPR_HSRR0;
+        srr1 =3D SPR_HSRR1;
+        new_msr |=3D (target_ulong)MSR_HVB;
+        new_msr |=3D env->msr & ((target_ulong)1 << MSR_RI);
 #endif
         break;
     case POWERPC_EXCP_PIT:       /* Programmable interval timer interrup=
t    */
@@ -1277,6 +1286,8 @@ void helper_book3s_msgsnd(target_ulong rb)
 #if defined(TARGET_PPC64)
 void helper_book3s_msgclrp(CPUPPCState *env, target_ulong rb)
 {
+    helper_hfscr_facility_check(env, HFSCR_MSGP, "msgclrp", HFSCR_IC_MSG=
P);
+
     if (!dbell_type_server(rb)) {
         return;
     }
@@ -1292,6 +1303,8 @@ void helper_book3s_msgsndp(CPUPPCState *env, target=
_ulong rb)
 {
     int pir =3D env->spr_cb[SPR_PIR].default_value;
=20
+    helper_hfscr_facility_check(env, HFSCR_MSGP, "msgsndp", HFSCR_IC_MSG=
P);
+
     if (!dbell_type_server(rb)) {
         return;
     }
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 0c5919ff08b0..55b68d1246e4 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -41,6 +41,18 @@ void helper_store_dump_spr(CPUPPCState *env, uint32_t =
sprn)
 }
=20
 #ifdef TARGET_PPC64
+static void raise_hv_fu_exception(CPUPPCState *env, uint32_t bit,
+                                  const char *caller, uint32_t cause,
+                                  uintptr_t raddr)
+{
+    qemu_log_mask(CPU_LOG_INT, "HV Facility %d is unavailable (%s)\n",
+                  bit, caller);
+
+    env->spr[SPR_HFSCR] &=3D ~((target_ulong)FSCR_IC_MASK << FSCR_IC_POS=
);
+
+    raise_exception_err_ra(env, POWERPC_EXCP_HV_FU, cause, raddr);
+}
+
 static void raise_fu_exception(CPUPPCState *env, uint32_t bit,
                                uint32_t sprn, uint32_t cause,
                                uintptr_t raddr)
@@ -55,6 +67,17 @@ static void raise_fu_exception(CPUPPCState *env, uint3=
2_t bit,
 }
 #endif
=20
+void helper_hfscr_facility_check(CPUPPCState *env, uint32_t bit,
+                                 const char *caller, uint32_t cause)
+{
+#ifdef TARGET_PPC64
+    if ((env->msr_mask & MSR_HVB) && !msr_hv &&
+                                     !(env->spr[SPR_HFSCR] & (1UL << bit=
))) {
+        raise_hv_fu_exception(env, bit, caller, cause, GETPC());
+    }
+#endif
+}
+
 void helper_fscr_facility_check(CPUPPCState *env, uint32_t bit,
                                 uint32_t sprn, uint32_t cause)
 {
@@ -114,6 +137,8 @@ target_ulong helper_load_dpdes(CPUPPCState *env)
 {
     target_ulong dpdes =3D 0;
=20
+    helper_hfscr_facility_check(env, HFSCR_MSGP, "load DPDES", HFSCR_IC_=
MSGP);
+
     /* TODO: TCG supports only one thread */
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
         dpdes =3D 1;
@@ -127,6 +152,8 @@ void helper_store_dpdes(CPUPPCState *env, target_ulon=
g val)
     PowerPCCPU *cpu =3D env_archcpu(env);
     CPUState *cs =3D CPU(cpu);
=20
+    helper_hfscr_facility_check(env, HFSCR_MSGP, "store DPDES", HFSCR_IC=
_MSGP);
+
     /* TODO: TCG supports only one thread */
     if (val & ~0x1) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid DPDES register value "
--=20
2.21.1


