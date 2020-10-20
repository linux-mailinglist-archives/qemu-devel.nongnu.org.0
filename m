Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A2290430
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 13:38:19 +0200 (CEST)
Received: from localhost ([::1]:41926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTO3u-00066y-PW
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 07:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <FelixCui-oc@zhaoxin.com>)
 id 1kTO23-00057B-4I
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:36:24 -0400
Received: from zxshcas2.zhaoxin.com ([203.148.12.82]:7046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <FelixCui-oc@zhaoxin.com>)
 id 1kTO1s-0001Aq-59
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:36:22 -0400
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 16 Oct
 2020 19:29:44 +0800
Received: from localhost.localdomain (124.64.17.66) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 16 Oct
 2020 19:29:43 +0800
From: FelixCuioc <FelixCui-oc@zhaoxin.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: [PATCH 1/1] Skip flatview_simplify() for cpu vendor zhaoxin
Date: Fri, 16 Oct 2020 07:29:33 -0400
Message-ID: <20201016112933.14856-2-FelixCui-oc@zhaoxin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016112933.14856-1-FelixCui-oc@zhaoxin.com>
References: <20201016112933.14856-1-FelixCui-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [124.64.17.66]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Received-SPF: pass client-ip=203.148.12.82;
 envelope-from=FelixCui-oc@zhaoxin.com; helo=ZXSHCAS2.zhaoxin.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/16 07:29:46
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
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
Cc: TonyWWang-oc@zhaoxin.com, RockCui-oc@zhaoxin.com, qemu-devel@nongnu.org,
 CobeChen-oc@zhaoxin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The issue here is that an assinged EHCI device accesses
an adjacent mapping between the delete and add phases
of the VFIO MemoryListener.
We want to skip flatview_simplify() is to prevent EHCI
device IOVA mappings from being unmapped.

Signed-off-by: FelixCuioc <FelixCui-oc@zhaoxin.com>
---
 softmmu/memory.c  | 20 +++++++++++++++++++-
 target/i386/cpu.c |  7 +++++++
 target/i386/cpu.h |  3 +++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 403ff3abc9..a998018d87 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -700,6 +700,22 @@ static MemoryRegion *memory_region_get_flatview_root(MemoryRegion *mr)
     return NULL;
 }
 
+static bool skip_simplify(void)
+{
+#ifdef I386_CPU_H
+    char vendor[CPUID_VENDOR_SZ + 1] = { 0 };
+    host_get_vendor(vendor);
+    if (!strncmp(vendor, CPUID_VENDOR_VIA, strlen(CPUID_VENDOR_VIA))
+        || !strncmp(vendor, CPUID_VENDOR_ZHAOXIN,
+                  strlen(CPUID_VENDOR_ZHAOXIN))) {
+        return true;
+    }
+    return false;
+#else
+    return false;
+#endif
+}
+
 /* Render a memory topology into a list of disjoint absolute ranges. */
 static FlatView *generate_memory_topology(MemoryRegion *mr)
 {
@@ -713,7 +729,9 @@ static FlatView *generate_memory_topology(MemoryRegion *mr)
                              addrrange_make(int128_zero(), int128_2_64()),
                              false, false);
     }
-    flatview_simplify(view);
+    if (!skip_simplify()) {
+        flatview_simplify(view);
+    }
 
     view->dispatch = address_space_dispatch_new(view);
     for (i = 0; i < view->nr; i++) {
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5d713c8528..6bda35a03e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1559,6 +1559,13 @@ void host_cpuid(uint32_t function, uint32_t count,
     if (edx)
         *edx = vec[3];
 }
+void host_get_vendor(char *vendor)
+{
+  uint32_t eax, ebx, ecx, edx;
+
+  host_cpuid(0x0, 0, &eax, &ebx, &ecx, &edx);
+  x86_cpu_vendor_words2str(vendor, ebx, edx, ecx);
+}
 
 void host_vendor_fms(char *vendor, int *family, int *model, int *stepping)
 {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 51c1d5f60a..e8e26e6a53 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -832,6 +832,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 
 #define CPUID_VENDOR_VIA   "CentaurHauls"
 
+#define CPUID_VENDOR_ZHAOXIN   "  Shanghai  "
+
 #define CPUID_VENDOR_HYGON    "HygonGenuine"
 
 #define IS_INTEL_CPU(env) ((env)->cpuid_vendor1 == CPUID_VENDOR_INTEL_1 && \
@@ -1918,6 +1920,7 @@ void cpu_clear_apic_feature(CPUX86State *env);
 void host_cpuid(uint32_t function, uint32_t count,
                 uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx);
 void host_vendor_fms(char *vendor, int *family, int *model, int *stepping);
+void host_get_vendor(char *vendor);
 
 /* helper.c */
 bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-- 
2.17.1


