Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1883471A8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:34:12 +0100 (CET)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOx5n-0004un-S8
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lOx37-0003Pj-3u
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:31:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:30028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lOx2z-0002G5-WC
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:31:23 -0400
IronPort-SDR: p9LreL9ComAb2HiQHPVsZVrOql63HQfGPTpXmCF4KoGxQTDY9jFw/FPvwa5nMud1votVb2iLYQ
 oSb1RyNF6rgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="177758333"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="177758333"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 23:31:12 -0700
IronPort-SDR: pc1zj+b7N8HiZ+gNDQKTAeqyZeZnY70vnM3Ooqu4RJPHzJ3oa26fbFQAbcwcuPYSoDO2i/SOTu
 cYqQqq5FF9EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="391176908"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga002.jf.intel.com with ESMTP; 23 Mar 2021 23:31:10 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	ehabkost@redhat.com
Subject: [PATCH v2] i386/cpu_dump: support AVX512 ZMM regs dump
Date: Wed, 24 Mar 2021 14:31:05 +0800
Message-Id: <1616567465-153141-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=robert.hu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
v2: dump XMM/YMM/ZMM according to XSAVE state-components enablement.

 target/i386/cpu-dump.c | 57 +++++++++++++++++++++++++++++++++++++-------------
 target/i386/cpu.h      | 11 ++++++++++
 2 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index aac21f1..c130586 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -499,21 +499,48 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
+        }
+        else if (env->xcr0 & XFEATURE_AVX) {
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
+        }
+        else { /* SSE and below cases */
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
index 570f916..a011702 100644
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
+                             XFEATURE_AVX512_ZMM_Hi256| \
+                             XFEATURE_AVX512_Hi16_ZMM)
+
+
 #define DR6_BD          (1 << 13)
 #define DR6_BS          (1 << 14)
 #define DR6_BT          (1 << 15)
-- 
1.8.3.1


