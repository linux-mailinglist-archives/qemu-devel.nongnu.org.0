Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D1D347324
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:02:03 +0100 (CET)
Received: from localhost ([::1]:50952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOySn-0004ld-JM
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lOyR4-0004AR-TM
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:00:14 -0400
Received: from mga03.intel.com ([134.134.136.65]:22085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lOyR2-0004uh-8N
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:00:14 -0400
IronPort-SDR: 2jUn/cakKDtczyOh5uXMkPkpIZTQGTgEcl76mcAVT5c2qNjQDtCQJqpWo2w/T44GlOawvu8esB
 mRlcJkVi1FFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190683406"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="190683406"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 01:00:08 -0700
IronPort-SDR: M41QRceWNyi5rn5YmftPxs/oJDJ75E5E7zKjsBt8vrQs2FCsgbhFjcef121xWTLz00CuVihhxI
 MFQc33jscW0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="415372529"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 24 Mar 2021 01:00:07 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	ehabkost@redhat.com
Subject: [PATCH v3] i386/cpu_dump: support AVX512 ZMM regs dump
Date: Wed, 24 Mar 2021 16:00:04 +0800
Message-Id: <1616572804-7898-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=robert.hu@linux.intel.com; helo=mga03.intel.com
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
v3: fix some coding style issue.
v2: dump XMM/YMM/ZMM according to XSAVE state-components enablement.

 target/i386/cpu-dump.c | 55 ++++++++++++++++++++++++++++++++++++--------------
 target/i386/cpu.h      | 11 ++++++++++
 2 files changed, 51 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index aac21f1..00fb56f 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -499,21 +499,46 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
+        if ((env->xcr0 & XFEATURE_AVX512) == XFEATURE_AVX512) {
+            /* XSAVE enabled AVX512 */
+            nb = (env->hflags & HF_CS64_MASK) ? 32 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "ZMM%02d=0x%016lx %016lx %016lx %016lx %016lx "
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
+        } else if (env->xcr0 & XFEATURE_AVX) {
+            /* XSAVE enabled AVX */
+            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "YMM%02d=0x%016lx %016lx %016lx %016lx\n",
+                             i,
+                             env->xmm_regs[i].ZMM_Q(3),
+                             env->xmm_regs[i].ZMM_Q(2),
+                             env->xmm_regs[i].ZMM_Q(1),
+                             env->xmm_regs[i].ZMM_Q(0));
+            }
+        } else { /* SSE and below cases */
+            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
+            for (i = 0; i < nb; i++) {
+                qemu_fprintf(f, "XMM%02d=0x%016lx %016lx",
+                             i,
+                             env->xmm_regs[i].ZMM_Q(1),
+                             env->xmm_regs[i].ZMM_Q(0));
+                if ((i & 1) == 1)
+                    qemu_fprintf(f, "\n");
+                else
+                    qemu_fprintf(f, " ");
+            }
         }
     }
     if (flags & CPU_DUMP_CODE) {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916..82f5d56 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -249,6 +249,17 @@ typedef enum X86Seg {
 #define CR4_PKE_MASK   (1U << 22)
 #define CR4_PKS_MASK   (1U << 24)
 
+#define XFEATURE_X87        (1UL << 0)
+#define XFEATURE_SSE        (1UL << 1)
+#define XFEATURE_AVX        (1UL << 2)
+#define XFEATURE_AVX512_OPMASK          (1UL << 5)
+#define XFEATURE_AVX512_ZMM_Hi256       (1UL << 6)
+#define XFEATURE_AVX512_Hi16_ZMM        (1UL << 7)
+#define XFEATURE_AVX512     (XFEATURE_AVX512_OPMASK | \
+                             XFEATURE_AVX512_ZMM_Hi256 | \
+                             XFEATURE_AVX512_Hi16_ZMM)
+
+
 #define DR6_BD          (1 << 13)
 #define DR6_BS          (1 << 14)
 #define DR6_BT          (1 << 15)
-- 
1.8.3.1


