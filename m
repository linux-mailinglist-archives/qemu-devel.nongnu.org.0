Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE6366568
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 08:27:28 +0200 (CEST)
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ6Kd-0006XY-97
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 02:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lZ6HN-0005LM-7g
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 02:24:05 -0400
Received: from mga07.intel.com ([134.134.136.100]:62021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lZ6HK-0007t5-FS
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 02:24:04 -0400
IronPort-SDR: 663Zrlg7lfvQtVHtOkM7iBEUQbAFkVQ3YAg9zuY+ELyXWxtxbejcnC0rEq1iqJoZF3cVev6WNb
 hdMSHrKlxfaw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="259601212"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="259601212"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 23:23:57 -0700
IronPort-SDR: 9arE51LlQeerDZOEnt+TRpOlL7cuClbh6y9rO8f1Grt1LC9bbNhU95Z9I6la4jXnroCfL7UVX1
 HHc9DY9niVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="427397486"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 20 Apr 2021 23:23:55 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	ehabkost@redhat.com
Subject: [PATCH v6] i386/cpu_dump: support AVX512 ZMM regs dump
Date: Wed, 21 Apr 2021 14:23:52 +0800
Message-Id: <1618986232-73826-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=robert.hu@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: robert.hu@intel.com, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit fa4518741e (target-i386: Rename struct XMMReg to ZMMReg),
CPUX86State.xmm_regs[] has already been extended to 512bit to support
AVX512.
Also, other qemu level supports for AVX512 registers are there for
years.
But in x86_cpu_dump_state(), still only dump XMM registers no matter
YMM/ZMM is enabled.
This patch is to complement this, let it dump XMM/YMM/ZMM accordingly.

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
Changelog:
v6: use PRIx64 printf format to satisfy multiple target compiling.
v5: fix a minor issue. rebase to latest master.
v4: stringent AVX512 case and AVX case judgement criteria.
v3: fix some coding style issue.
v2: dump XMM/YMM/ZMM according to XSAVE state-components enablement.

 target/i386/cpu-dump.c | 63 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index aac21f1..02b635a 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -478,6 +478,11 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "EFER=%016" PRIx64 "\n", env->efer);
     if (flags & CPU_DUMP_FPU) {
         int fptag;
+        const uint64_t avx512_mask = XSTATE_OPMASK_MASK | \
+                                     XSTATE_ZMM_Hi256_MASK | \
+                                     XSTATE_Hi16_ZMM_MASK | \
+                                     XSTATE_YMM_MASK | XSTATE_SSE_MASK,
+                       avx_mask = XSTATE_YMM_MASK | XSTATE_SSE_MASK;
         fptag = 0;
         for(i = 0; i < 8; i++) {
             fptag |= ((!env->fptags[i]) << i);
@@ -499,21 +504,49 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
             else
                 qemu_fprintf(f, " ");
         }
-        if (env->hflags & HF_CS64_MASK)
-            nb = 16;
-        else
-            nb = 8;
-        for(i=0;i<nb;i++) {
-            qemu_fprintf(f, "XMM%02d=%08x%08x%08x%08x",
-                         i,
-                         env->xmm_regs[i].ZMM_L(3),
-                         env->xmm_regs[i].ZMM_L(2),
-                         env->xmm_regs[i].ZMM_L(1),
-                         env->xmm_regs[i].ZMM_L(0));
-            if ((i & 1) == 1)
-                qemu_fprintf(f, "\n");
-            else
-                qemu_fprintf(f, " ");
+
+        if ((env->xcr0 & avx512_mask) == avx512_mask) {
+            /* XSAVE enabled AVX512 */
+            for (i = 0; i < NB_OPMASK_REGS; i++) {
+                qemu_fprintf(f, "Opmask%02d=%016"PRIx64"%s", i,
+                             env->opmask_regs[i], ((i & 3) == 3) ? "\n" : " ");
+            }
+
+            nb = (env->hflags & HF_CS64_MASK) ? 32 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "ZMM%02d=%016"PRIx64" %016"PRIx64" %016"PRIx64
+                             " %016"PRIx64" %016"PRIx64" %016"PRIx64
+                             " %016"PRIx64" %016"PRIx64"\n",
+                             i,
+                             env->xmm_regs[i].ZMM_Q(7),
+                             env->xmm_regs[i].ZMM_Q(6),
+                             env->xmm_regs[i].ZMM_Q(5),
+                             env->xmm_regs[i].ZMM_Q(4),
+                             env->xmm_regs[i].ZMM_Q(3),
+                             env->xmm_regs[i].ZMM_Q(2),
+                             env->xmm_regs[i].ZMM_Q(1),
+                             env->xmm_regs[i].ZMM_Q(0));
+            }
+        } else if ((env->xcr0 & avx_mask)  == avx_mask) {
+            /* XSAVE enabled AVX */
+            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "YMM%02d=%016"PRIx64" %016"PRIx64" %016"PRIx64
+                             " %016"PRIx64"\n", i,
+                             env->xmm_regs[i].ZMM_Q(3),
+                             env->xmm_regs[i].ZMM_Q(2),
+                             env->xmm_regs[i].ZMM_Q(1),
+                             env->xmm_regs[i].ZMM_Q(0));
+            }
+        } else { /* SSE and below cases */
+            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "XMM%02d=%016"PRIx64" %016"PRIx64"%s",
+                             i,
+                             env->xmm_regs[i].ZMM_Q(1),
+                             env->xmm_regs[i].ZMM_Q(0),
+                             (i & 1) ? "\n" : " ");
+            }
         }
     }
     if (flags & CPU_DUMP_CODE) {
-- 
1.8.3.1


