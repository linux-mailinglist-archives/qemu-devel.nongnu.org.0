Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF592DE10A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:32:53 +0100 (CET)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD47-0006YZ-Uv
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvw-00033E-4C
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:24 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:43369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvq-00074i-Vr
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:23 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MmU9X-1kPyrp3bbl-00iQFx; Fri, 18 Dec 2020 11:24:17 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/14] linux-user/sparc: Handle tstate in
 sparc64_get/set_context()
Date: Fri, 18 Dec 2020 11:24:07 +0100
Message-Id: <20201218102407.597566-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pIyHsYTh+HsHo3ROoPHIIZFVmmdDt9VfxWKsbQU9GtPva/e2r9C
 JFjiFG7TExdMFEasjcqJ6PduiAMdudLnmY30Np2QNk3X72XUhyBL0yTHvNcyKOLUSBdwkOZ
 sLavxvcs3kQzhpDyUJ6soh/IuVWF1F+ue8Um5CO3lctmcaCFrDiD1kShsqGCMLvRZx0Uzv4
 Qe2d8N6140vcS50uFVwCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oT+m3Whhm7o=:8fOxOQ7A6GX3SxVGDKxsvr
 BKVipxytri2Mxem1bQ4rMTj+xTnFki+VifuDwEfOasY/Qrx+R9LXMK0o6GBAnuS6ZJr+DWNGE
 mN9SK/4ZW90gsqjnP99R5VhmD672czqfG2LVqvNedznCoccgkb4GL6YL/eAq1gHGHM8GG4hvw
 Ol+UF/vhq/sM7RnTz8MlDsKyxl7wLD43Pf08wCxOnuXtr89j8Za4A1DxTGiQAKqBN5Zpyz236
 bBwwe2pnr09MJoAt4MDx7PG3PCjwqFMtoM1s1onQ4T82ij7NtXYKxRPHwsHuasbK6umU/B94Y
 KF700yEMLcMAelWyKXg0eIcFVUmxLb33T6AxS6X5BDW6H3tePPrrsUqkQHz0MY6W6C/eXqXZt
 vNedHFYwNc9AGjYNOKCgPuiWiRNuM+zXE7kCXTZeQZdHrEFygoHjdF/d/0L3d6FJlW9Kc3Zh+
 k2VwxlgQRg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Correctly implement save/restore of the tstate field in
sparc64_get_context() and sparc64_set_context():
 * Don't use the CWP value from the guest in set_context
 * Construct and save a tstate value rather than leaving
   it as zero in get_context

To do this we factor out the "calculate TSTATE value from CPU state"
code from sparc_cpu_do_interrupt() into its own sparc64_tstate()
function; that in turn requires us to move some of the function
prototypes out from inside a CPU_NO_IO_DEFS ifdef guard.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201106152738.26026-5-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c   |  7 +++----
 target/sparc/cpu.h          | 24 ++++++++++++++++++++----
 target/sparc/int64_helper.c |  5 +----
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index d92e096cafa7..d27b7a3af79d 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -438,9 +438,9 @@ void sparc64_set_context(CPUSPARCState *env)
     env->npc = npc;
     __get_user(env->y, &((*grp)[SPARC_MC_Y]));
     __get_user(tstate, &((*grp)[SPARC_MC_TSTATE]));
+    /* Honour TSTATE_ASI, TSTATE_ICC and TSTATE_XCC only */
     env->asi = (tstate >> 24) & 0xff;
-    cpu_put_ccr(env, tstate >> 32);
-    cpu_put_cwp64(env, tstate & 0x1f);
+    cpu_put_ccr(env, (tstate >> 32) & 0xff);
     __get_user(env->gregs[1], (&(*grp)[SPARC_MC_G1]));
     __get_user(env->gregs[2], (&(*grp)[SPARC_MC_G2]));
     __get_user(env->gregs[3], (&(*grp)[SPARC_MC_G3]));
@@ -557,8 +557,7 @@ void sparc64_get_context(CPUSPARCState *env)
         }
     }
 
-    /* XXX: tstate must be saved properly */
-    //    __put_user(env->tstate, &((*grp)[SPARC_MC_TSTATE]));
+    __put_user(sparc64_tstate(env), &((*grp)[SPARC_MC_TSTATE]));
     __put_user(env->pc, &((*grp)[SPARC_MC_PC]));
     __put_user(env->npc, &((*grp)[SPARC_MC_NPC]));
     __put_user(env->y, &((*grp)[SPARC_MC_Y]));
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 277254732b93..4b2290650be4 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -608,10 +608,6 @@ target_ulong cpu_get_psr(CPUSPARCState *env1);
 void cpu_put_psr(CPUSPARCState *env1, target_ulong val);
 void cpu_put_psr_raw(CPUSPARCState *env1, target_ulong val);
 #ifdef TARGET_SPARC64
-target_ulong cpu_get_ccr(CPUSPARCState *env1);
-void cpu_put_ccr(CPUSPARCState *env1, target_ulong val);
-target_ulong cpu_get_cwp64(CPUSPARCState *env1);
-void cpu_put_cwp64(CPUSPARCState *env1, int cwp);
 void cpu_change_pstate(CPUSPARCState *env1, uint32_t new_pstate);
 void cpu_gl_switch_gregs(CPUSPARCState *env, uint32_t new_gl);
 #endif
@@ -829,4 +825,24 @@ static inline bool tb_am_enabled(int tb_flags)
 #endif
 }
 
+#ifdef TARGET_SPARC64
+/* win_helper.c */
+target_ulong cpu_get_ccr(CPUSPARCState *env1);
+void cpu_put_ccr(CPUSPARCState *env1, target_ulong val);
+target_ulong cpu_get_cwp64(CPUSPARCState *env1);
+void cpu_put_cwp64(CPUSPARCState *env1, int cwp);
+
+static inline uint64_t sparc64_tstate(CPUSPARCState *env)
+{
+    uint64_t tstate = (cpu_get_ccr(env) << 32) |
+        ((env->asi & 0xff) << 24) | ((env->pstate & 0xf3f) << 8) |
+        cpu_get_cwp64(env);
+
+    if (env->def.features & CPU_FEATURE_GL) {
+        tstate |= (env->gl & 7ULL) << 40;
+    }
+    return tstate;
+}
+#endif
+
 #endif
diff --git a/target/sparc/int64_helper.c b/target/sparc/int64_helper.c
index ba95bf228cc4..7fb8ab211ca8 100644
--- a/target/sparc/int64_helper.c
+++ b/target/sparc/int64_helper.c
@@ -131,9 +131,7 @@ void sparc_cpu_do_interrupt(CPUState *cs)
     }
     tsptr = cpu_tsptr(env);
 
-    tsptr->tstate = (cpu_get_ccr(env) << 32) |
-        ((env->asi & 0xff) << 24) | ((env->pstate & 0xf3f) << 8) |
-        cpu_get_cwp64(env);
+    tsptr->tstate = sparc64_tstate(env);
     tsptr->tpc = env->pc;
     tsptr->tnpc = env->npc;
     tsptr->tt = intno;
@@ -148,7 +146,6 @@ void sparc_cpu_do_interrupt(CPUState *cs)
     }
 
     if (env->def.features & CPU_FEATURE_GL) {
-        tsptr->tstate |= (env->gl & 7ULL) << 40;
         cpu_gl_switch_gregs(env, env->gl + 1);
         env->gl++;
     }
-- 
2.29.2


