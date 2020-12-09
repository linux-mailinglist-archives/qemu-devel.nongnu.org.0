Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61442D4830
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:43:51 +0100 (CET)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3VF-0004GC-5v
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn3NV-0004hV-PY
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:35:49 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:30090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn3NT-00054W-Az
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:35:49 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-vWmW2prsNzmXkb27j1HYpA-1; Wed, 09 Dec 2020 12:35:43 -0500
X-MC-Unique: vWmW2prsNzmXkb27j1HYpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC764801817;
 Wed,  9 Dec 2020 17:35:41 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9460D6EF41;
 Wed,  9 Dec 2020 17:35:40 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/ppc: Introduce an mmu_is_64bit() helper
Date: Wed,  9 Dec 2020 18:35:36 +0100
Message-Id: <20201209173536.1437351-3-groug@kaod.org>
In-Reply-To: <20201209173536.1437351-1-groug@kaod.org>
References: <20201209173536.1437351-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Stephane Duverger <stephane.duverger@free.fr>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Callers don't really need to know how 64-bit MMU model enums are
computed. Hide this in a helper.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/cpu-qom.h            |  5 +++++
 target/ppc/excp_helper.c        |  4 ++--
 target/ppc/machine.c            |  4 ++--
 target/ppc/mmu-hash64.c         |  2 +-
 target/ppc/mmu_helper.c         | 10 +++++-----
 target/ppc/translate.c          |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 7 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 5fdb96f04df5..63b9e8632cab 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -74,6 +74,11 @@ enum powerpc_mmu_t {
     POWERPC_MMU_3_00       =3D POWERPC_MMU_64 | 0x00000005,
 };
=20
+static inline bool mmu_is_64bit(powerpc_mmu_t mmu_model)
+{
+    return mmu_model & POWERPC_MMU_64;
+}
+
 /*************************************************************************=
****/
 /* Exception model                                                        =
   */
 typedef enum powerpc_excp_t powerpc_excp_t;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 74f987080ffc..85de7e6c906b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -266,7 +266,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int ex=
cp_model, int excp)
      */
     if (excp =3D=3D POWERPC_EXCP_HV_EMU
 #if defined(TARGET_PPC64)
-        && !((env->mmu_model & POWERPC_MMU_64) && (env->msr_mask & MSR_HVB=
))
+        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
 #endif /* defined(TARGET_PPC64) */
=20
     ) {
@@ -824,7 +824,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int ex=
cp_model, int excp)
             vector =3D (uint32_t)vector;
         }
     } else {
-        if (!msr_isf && !(env->mmu_model & POWERPC_MMU_64)) {
+        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
             vector =3D (uint32_t)vector;
         } else {
             new_msr |=3D (target_ulong)1 << MSR_SF;
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index c38e7b1268dd..d9d911b9b181 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -550,7 +550,7 @@ static bool sr_needed(void *opaque)
 #ifdef TARGET_PPC64
     PowerPCCPU *cpu =3D opaque;
=20
-    return !(cpu->env.mmu_model & POWERPC_MMU_64);
+    return !mmu_is_64bit(cpu->env.mmu_model);
 #else
     return true;
 #endif
@@ -606,7 +606,7 @@ static bool slb_needed(void *opaque)
     PowerPCCPU *cpu =3D opaque;
=20
     /* We don't support any of the old segment table based 64-bit CPUs */
-    return cpu->env.mmu_model & POWERPC_MMU_64;
+    return mmu_is_64bit(cpu->env.mmu_model);
 }
=20
 static int slb_post_load(void *opaque, int version_id)
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 1b1248fc9054..0fabc10302d7 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1140,7 +1140,7 @@ void ppc_hash64_init(PowerPCCPU *cpu)
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
=20
     if (!pcc->hash64_opts) {
-        assert(!(env->mmu_model & POWERPC_MMU_64));
+        assert(!mmu_is_64bit(env->mmu_model));
         return;
     }
=20
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 9f22b66ea948..ca88658cba04 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2002,7 +2002,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t=
 nr, target_ulong value)
 void ppc_tlb_invalidate_all(CPUPPCState *env)
 {
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         env->tlb_need_flush =3D 0;
         tlb_flush(env_cpu(env));
     } else
@@ -2046,7 +2046,7 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_=
ulong addr)
 #if !defined(FLUSH_ALL_TLBS)
     addr &=3D TARGET_PAGE_MASK;
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         /* tlbie invalidate TLBs for all segments */
         /*
          * XXX: given the fact that there are too many segments to invalid=
ate,
@@ -2091,7 +2091,7 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong va=
lue)
     qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value)=
;
     assert(!cpu->vhyp);
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         target_ulong sdr_mask =3D SDR_64_HTABORG | SDR_64_HTABSIZE;
         target_ulong htabsize =3D value & SDR_64_HTABSIZE;
=20
@@ -2144,7 +2144,7 @@ void ppc_store_ptcr(CPUPPCState *env, target_ulong va=
lue)
 target_ulong helper_load_sr(CPUPPCState *env, target_ulong sr_num)
 {
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         /* XXX */
         return 0;
     }
@@ -2158,7 +2158,7 @@ void helper_store_sr(CPUPPCState *env, target_ulong s=
rnum, target_ulong value)
             "%s: reg=3D%d " TARGET_FMT_lx " " TARGET_FMT_lx "\n", __func__=
,
             (int)srnum, value, env->sr[srnum]);
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         PowerPCCPU *cpu =3D env_archcpu(env);
         uint64_t esid, vsid;
=20
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e68dd65ad3e1..0984ce637be9 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7892,7 +7892,7 @@ static void ppc_tr_init_disas_context(DisasContextBas=
e *dcbase, CPUState *cs)
     ctx->insns_flags =3D env->insns_flags;
     ctx->insns_flags2 =3D env->insns_flags2;
     ctx->access_type =3D -1;
-    ctx->need_access_type =3D !(env->mmu_model & POWERPC_MMU_64);
+    ctx->need_access_type =3D !mmu_is_64bit(env->mmu_model);
     ctx->le_mode =3D !!(env->hflags & (1 << MSR_LE));
     ctx->default_tcg_memop_mask =3D ctx->le_mode ? MO_LE : MO_BE;
     ctx->flags =3D env->flags;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.=
inc
index e4082cfde746..a4d0038828d9 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10671,7 +10671,7 @@ static void ppc_cpu_reset(DeviceState *dev)
 #endif
=20
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         msr |=3D (1ULL << MSR_SF);
     }
 #endif
--=20
2.26.2


