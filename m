Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED434AA97
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:56:46 +0100 (CET)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPntF-0004Ug-3x
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lPnrJ-0003Xg-Cs
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:54:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:30556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lPnrD-0001Ya-C2
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:54:45 -0400
IronPort-SDR: 370vQxhpv6KCSVU7Wu2HEknMFbk5hXvMOivQsp3doAuIbFLpjttogyruFeHUZFP8k72aZZmjcT
 0wr0BnBjm5Qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="255154836"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="255154836"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 07:54:36 -0700
IronPort-SDR: 0Sj9WvrMU5rd3S6BlcOCfKN4bOXHjlIjlXfRpOoFXJP8A7oZJbt3Cybqzet7Vhg6Zel9irNnYc
 Vgr4hTIkpXQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="414569243"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga007.jf.intel.com with ESMTP; 26 Mar 2021 07:54:34 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	ehabkost@redhat.com
Subject: [PATCH v4] i386/cpu_dump: support AVX512 ZMM regs dump
Date: Fri, 26 Mar 2021 22:54:29 +0800
Message-Id: <1616770469-36979-1-git-send-email-robert.hu@linux.intel.com>
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
Cc: qemu-devel@nongnu.org, Robert Hoo <robert.hu@linux.intel.com>
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
---
Changelog:
v4: stringent AVX512 case and AVX case judgement criteria
v3: fix some coding style issue.
v2: dump XMM/YMM/ZMM according to XSAVE state-components enablement.

 target/i386/cpu-dump.c | 62 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index aac21f1..dea4564 100644
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
@@ -499,21 +504,48 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
+                qemu_fprintf(f, "Opmask%02d=%016lx%s", i, env->opmask_regs[i],
+                    ((i & 3) == 3) ? "\n" : " ");
+            }
+
+            nb = (env->hflags & HF_CS64_MASK) ? 32 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "ZMM%02d=%016lx %016lx %016lx %016lx %016lx "
+                                "%016lx %016lx %016lx\n",
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
+        } else if (env->xcr0 & avx_mask) {
+            /* XSAVE enabled AVX */
+            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "YMM%02d=%016lx %016lx %016lx %016lx\n",
+                             i,
+                             env->xmm_regs[i].ZMM_Q(3),
+                             env->xmm_regs[i].ZMM_Q(2),
+                             env->xmm_regs[i].ZMM_Q(1),
+                             env->xmm_regs[i].ZMM_Q(0));
+            }
+        } else { /* SSE and below cases */
+            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "XMM%02d=%016lx %016lx%s",
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


