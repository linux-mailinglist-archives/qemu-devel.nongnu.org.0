Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32F940CC72
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:17:23 +0200 (CEST)
Received: from localhost ([::1]:45596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZTG-0003qh-Vp
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQZN2-0006Nh-Ed; Wed, 15 Sep 2021 14:10:56 -0400
Received: from mail.csgraf.de ([85.25.223.15]:50660 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQZN0-0003Ny-4b; Wed, 15 Sep 2021 14:10:56 -0400
Received: from localhost.localdomain
 (dynamic-095-117-089-091.95.117.pool.telefonica.de [95.117.89.91])
 by csgraf.de (Postfix) with ESMTPSA id 9517B60805FE;
 Wed, 15 Sep 2021 20:10:51 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v11 01/10] arm: Move PMC register definitions to cpu.h
Date: Wed, 15 Sep 2021 20:10:40 +0200
Message-Id: <20210915181049.27597-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210915181049.27597-1-agraf@csgraf.de>
References: <20210915181049.27597-1-agraf@csgraf.de>
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

v9 -> v10:

  - Move to target/arm/internals.h
---
 target/arm/helper.c    | 44 ------------------------------------------
 target/arm/internals.h | 44 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b210da2bc2..21ee94ec2e 100644
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
diff --git a/target/arm/internals.h b/target/arm/internals.h
index cd2ea8a388..777f968764 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1226,4 +1226,48 @@ enum MVEECIState {
     /* All other values reserved */
 };
 
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
 #endif
-- 
2.30.1 (Apple Git-130)


