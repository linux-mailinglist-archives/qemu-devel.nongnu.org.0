Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D603725BF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:19:07 +0200 (CEST)
Received: from localhost ([::1]:60312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoOg-0007bw-Il
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo06-0005JS-DV; Tue, 04 May 2021 01:53:43 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:34629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo02-0004mm-M7; Tue, 04 May 2021 01:53:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK6LJLz9sXN; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=6Z6jyo3bzAclzYab342gMCr7M/a/GiGYHd806MpvsQw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kdtkbdHDsnqI4XUrnOnqBteRDvuttHL3b14s3mSU/7UfgOPrGjoCs2YI7HzkodiS9
 8N7Io1PFS+i5uZQ60d8HaQ6Pu2+0aDNkm7vpRncRQN/pn4e312bhR1UhRgjZ6viYT/
 fEKzeAboAzneRalwUmgzHNEYm0W1cvt7/RjUDqiY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 18/46] linux-user/ppc: Fix msr updates for signal handling
Date: Tue,  4 May 2021 15:52:44 +1000
Message-Id: <20210504055312.306823-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

In save_user_regs, there are two bugs where we OR in a bit number
instead of the bit, clobbering the low bits of MSR.  However:

The MSR_VR and MSR_SPE bits control the availability of the insns.
If the bits were not already set in MSR, then any attempt to access
those registers would result in SIGILL.

For linux-user, we always initialize MSR to the capabilities
of the cpu.  We *could* add checks vs MSR where we currently
check insn_flags and insn_flags2, but we know they match.

Also, there's a stray cut-and-paste comment in restore.

Then, do not force little-endian binaries into big-endian mode.

Finally, use ppc_store_msr for the update to affect hflags.
Which is the reason none of these bugs were previously noticed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323184340.619757-10-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 linux-user/ppc/cpu_loop.c |  5 +++--
 linux-user/ppc/signal.c   | 23 +++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index df71e15a25..4a0f6c8dc2 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -492,11 +492,12 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 #if defined(TARGET_PPC64)
     int flag = (env->insns_flags2 & PPC2_BOOKE206) ? MSR_CM : MSR_SF;
 #if defined(TARGET_ABI32)
-    env->msr &= ~((target_ulong)1 << flag);
+    ppc_store_msr(env, env->msr & ~((target_ulong)1 << flag));
 #else
-    env->msr |= (target_ulong)1 << flag;
+    ppc_store_msr(env, env->msr | (target_ulong)1 << flag);
 #endif
 #endif
+
     env->nip = regs->nip;
     for(i = 0; i < 32; i++) {
         env->gpr[i] = regs->gpr[i];
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index b78613f7c8..bad38f8ed9 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -261,9 +261,6 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
             __put_user(avr->u64[PPC_VEC_HI], &vreg->u64[0]);
             __put_user(avr->u64[PPC_VEC_LO], &vreg->u64[1]);
         }
-        /* Set MSR_VR in the saved MSR value to indicate that
-           frame->mc_vregs contains valid data.  */
-        msr |= MSR_VR;
 #if defined(TARGET_PPC64)
         vrsave = (uint32_t *)&frame->mc_vregs.altivec[33];
         /* 64-bit needs to put a pointer to the vectors in the frame */
@@ -300,9 +297,6 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
         for (i = 0; i < ARRAY_SIZE(env->gprh); i++) {
             __put_user(env->gprh[i], &frame->mc_vregs.spe[i]);
         }
-        /* Set MSR_SPE in the saved MSR value to indicate that
-           frame->mc_vregs contains valid data.  */
-        msr |= MSR_SPE;
         __put_user(env->spe_fscr, &frame->mc_vregs.spe[32]);
     }
 #endif
@@ -354,8 +348,10 @@ static void restore_user_regs(CPUPPCState *env,
     __get_user(msr, &frame->mc_gregs[TARGET_PT_MSR]);
 
     /* If doing signal return, restore the previous little-endian mode.  */
-    if (sig)
-        env->msr = (env->msr & ~(1ull << MSR_LE)) | (msr & (1ull << MSR_LE));
+    if (sig) {
+        ppc_store_msr(env, ((env->msr & ~(1ull << MSR_LE)) |
+                            (msr & (1ull << MSR_LE))));
+    }
 
     /* Restore Altivec registers if necessary.  */
     if (env->insns_flags & PPC_ALTIVEC) {
@@ -376,8 +372,6 @@ static void restore_user_regs(CPUPPCState *env,
             __get_user(avr->u64[PPC_VEC_HI], &vreg->u64[0]);
             __get_user(avr->u64[PPC_VEC_LO], &vreg->u64[1]);
         }
-        /* Set MSR_VEC in the saved MSR value to indicate that
-           frame->mc_vregs contains valid data.  */
 #if defined(TARGET_PPC64)
         vrsave = (uint32_t *)&v_regs[33];
 #else
@@ -468,7 +462,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->nip = (target_ulong) ka->_sa_handler;
 
     /* Signal handlers are entered in big-endian mode.  */
-    env->msr &= ~(1ull << MSR_LE);
+    ppc_store_msr(env, env->msr & ~(1ull << MSR_LE));
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
@@ -563,8 +557,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->nip = (target_ulong) ka->_sa_handler;
 #endif
 
+#ifdef TARGET_WORDS_BIGENDIAN
     /* Signal handlers are entered in big-endian mode.  */
-    env->msr &= ~(1ull << MSR_LE);
+    ppc_store_msr(env, env->msr & ~(1ull << MSR_LE));
+#else
+    /* Signal handlers are entered in little-endian mode.  */
+    ppc_store_msr(env, env->msr | (1ull << MSR_LE));
+#endif
 
     unlock_user_struct(rt_sf, rt_sf_addr, 1);
     return;
-- 
2.31.1


