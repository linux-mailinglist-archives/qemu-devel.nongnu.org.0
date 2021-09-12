Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BED40823B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 01:09:57 +0200 (CEST)
Received: from localhost ([::1]:58006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPYbk-0005cm-9E
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 19:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPYZw-0002Bl-3c; Sun, 12 Sep 2021 19:08:04 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43488 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPYZt-0003Dz-V2; Sun, 12 Sep 2021 19:08:03 -0400
Received: from localhost.localdomain
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id 044D560805E7;
 Mon, 13 Sep 2021 01:07:58 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v9 01/11] arm: Move PMC register definitions to cpu.h
Date: Mon, 13 Sep 2021 01:07:47 +0200
Message-Id: <20210912230757.41096-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210912230757.41096-1-agraf@csgraf.de>
References: <20210912230757.41096-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need PMC register definitions in accel specific code later.
Move all constant definitions to common arm headers so we can reuse
them.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/cpu.h    | 44 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c | 44 --------------------------------------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6a987f65e4..6d60b64c15 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1550,6 +1550,50 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HSTR_TTEE (1 << 16)
 #define HSTR_TJDBX (1 << 17)
 
+/* Definitions for the PMU registers */
+#define PMCRN_MASK  0xf800
+#define PMCRN_SHIFT 11
+#define PMCRLC  0x40
+#define PMCRDP  0x20
+#define PMCRX   0x10
+#define PMCRD   0x8
+#define PMCRC   0x4
+#define PMCRP   0x2
+#define PMCRE   0x1
+/*
+ * Mask of PMCR bits writeable by guest (not including WO bits like C, P,
+ * which can be written as 1 to trigger behaviour but which stay RAZ).
+ */
+#define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
+
+#define PMXEVTYPER_P          0x80000000
+#define PMXEVTYPER_U          0x40000000
+#define PMXEVTYPER_NSK        0x20000000
+#define PMXEVTYPER_NSU        0x10000000
+#define PMXEVTYPER_NSH        0x08000000
+#define PMXEVTYPER_M          0x04000000
+#define PMXEVTYPER_MT         0x02000000
+#define PMXEVTYPER_EVTCOUNT   0x0000ffff
+#define PMXEVTYPER_MASK       (PMXEVTYPER_P | PMXEVTYPER_U | PMXEVTYPER_NSK | \
+                               PMXEVTYPER_NSU | PMXEVTYPER_NSH | \
+                               PMXEVTYPER_M | PMXEVTYPER_MT | \
+                               PMXEVTYPER_EVTCOUNT)
+
+#define PMCCFILTR             0xf8000000
+#define PMCCFILTR_M           PMXEVTYPER_M
+#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
+
+static inline uint32_t pmu_num_counters(CPUARMState *env)
+{
+  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
+}
+
+/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
+static inline uint64_t pmu_counter_mask(CPUARMState *env)
+{
+  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
+}
+
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
 void vfp_set_fpscr(CPUARMState *env, uint32_t val);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a7ae78146d..17f1b05622 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1114,50 +1114,6 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-/* Definitions for the PMU registers */
-#define PMCRN_MASK  0xf800
-#define PMCRN_SHIFT 11
-#define PMCRLC  0x40
-#define PMCRDP  0x20
-#define PMCRX   0x10
-#define PMCRD   0x8
-#define PMCRC   0x4
-#define PMCRP   0x2
-#define PMCRE   0x1
-/*
- * Mask of PMCR bits writeable by guest (not including WO bits like C, P,
- * which can be written as 1 to trigger behaviour but which stay RAZ).
- */
-#define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
-
-#define PMXEVTYPER_P          0x80000000
-#define PMXEVTYPER_U          0x40000000
-#define PMXEVTYPER_NSK        0x20000000
-#define PMXEVTYPER_NSU        0x10000000
-#define PMXEVTYPER_NSH        0x08000000
-#define PMXEVTYPER_M          0x04000000
-#define PMXEVTYPER_MT         0x02000000
-#define PMXEVTYPER_EVTCOUNT   0x0000ffff
-#define PMXEVTYPER_MASK       (PMXEVTYPER_P | PMXEVTYPER_U | PMXEVTYPER_NSK | \
-                               PMXEVTYPER_NSU | PMXEVTYPER_NSH | \
-                               PMXEVTYPER_M | PMXEVTYPER_MT | \
-                               PMXEVTYPER_EVTCOUNT)
-
-#define PMCCFILTR             0xf8000000
-#define PMCCFILTR_M           PMXEVTYPER_M
-#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
-
-static inline uint32_t pmu_num_counters(CPUARMState *env)
-{
-  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
-}
-
-/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
-static inline uint64_t pmu_counter_mask(CPUARMState *env)
-{
-  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
-}
-
 typedef struct pm_event {
     uint16_t number; /* PMEVTYPER.evtCount is 16 bits wide */
     /* If the event is supported on this CPU (used to generate PMCEID[01]) */
-- 
2.30.1 (Apple Git-130)


