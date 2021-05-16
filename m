Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0873820C4
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 22:05:57 +0200 (CEST)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liN1Q-0007ve-LM
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 16:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMum-0001t0-D0; Sun, 16 May 2021 15:59:04 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45350 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMui-0008Dx-Ji; Sun, 16 May 2021 15:59:04 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id 0BC41608069F;
 Sun, 16 May 2021 21:58:59 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 04/19] hvf: Move hvf internal definitions into common header
Date: Sun, 16 May 2021 21:58:40 +0200
Message-Id: <20210516195855.28869-5-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch moves a few internal struct and constant defines over.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 include/sysemu/hvf_int.h   | 30 ++++++++++++++++++++++++++++++
 target/i386/hvf/hvf-i386.h | 31 +------------------------------
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 4c657b054c..ef84a24dd9 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -13,6 +13,36 @@
 
 #include <Hypervisor/hv.h>
 
+/* hvf_slot flags */
+#define HVF_SLOT_LOG (1 << 0)
+
+typedef struct hvf_slot {
+    uint64_t start;
+    uint64_t size;
+    uint8_t *mem;
+    int slot_id;
+    uint32_t flags;
+    MemoryRegion *region;
+} hvf_slot;
+
+typedef struct hvf_vcpu_caps {
+    uint64_t vmx_cap_pinbased;
+    uint64_t vmx_cap_procbased;
+    uint64_t vmx_cap_procbased2;
+    uint64_t vmx_cap_entry;
+    uint64_t vmx_cap_exit;
+    uint64_t vmx_cap_preemption_timer;
+} hvf_vcpu_caps;
+
+struct HVFState {
+    AccelState parent;
+    hvf_slot slots[32];
+    int num_slots;
+
+    hvf_vcpu_caps *hvf_caps;
+};
+extern HVFState *hvf_state;
+
 void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void assert_hvf_ok(hv_return_t ret);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 94e5c788c4..76e9235524 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -18,39 +18,10 @@
 
 #include "qemu/accel.h"
 #include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
 #include "cpu.h"
 #include "x86.h"
 
-/* hvf_slot flags */
-#define HVF_SLOT_LOG (1 << 0)
-
-typedef struct hvf_slot {
-    uint64_t start;
-    uint64_t size;
-    uint8_t *mem;
-    int slot_id;
-    uint32_t flags;
-    MemoryRegion *region;
-} hvf_slot;
-
-typedef struct hvf_vcpu_caps {
-    uint64_t vmx_cap_pinbased;
-    uint64_t vmx_cap_procbased;
-    uint64_t vmx_cap_procbased2;
-    uint64_t vmx_cap_entry;
-    uint64_t vmx_cap_exit;
-    uint64_t vmx_cap_preemption_timer;
-} hvf_vcpu_caps;
-
-struct HVFState {
-    AccelState parent;
-    hvf_slot slots[32];
-    int num_slots;
-
-    hvf_vcpu_caps *hvf_caps;
-};
-extern HVFState *hvf_state;
-
 void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
 
 #ifdef NEED_CPU_H
-- 
2.30.1 (Apple Git-130)


