Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7083D8454
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 01:54:23 +0200 (CEST)
Received: from localhost ([::1]:56576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Wtx-0006ta-PJ
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 19:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1m8Wt1-0006Cp-3N; Tue, 27 Jul 2021 19:53:23 -0400
Received: from mta-07-3.privateemail.com ([68.65.122.17]:4735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1m8Wsy-0001nw-SQ; Tue, 27 Jul 2021 19:53:22 -0400
Received: from mta-07.privateemail.com (localhost [127.0.0.1])
 by mta-07.privateemail.com (Postfix) with ESMTP id 3EC15180022F;
 Tue, 27 Jul 2021 19:53:04 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.235])
 by mta-07.privateemail.com (Postfix) with ESMTPA id 75B38180021B;
 Tue, 27 Jul 2021 19:53:03 -0400 (EDT)
From: Hamza Mahfooz <someguy@effective-light.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: kvm: use RCU_READ_LOCK_GUARD() in
 kvm_arch_fixup_msi_route()
Date: Tue, 27 Jul 2021 19:52:01 -0400
Message-Id: <20210727235201.11491-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=68.65.122.17;
 envelope-from=someguy@effective-light.com; helo=MTA-07-3.privateemail.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Hamza Mahfooz <someguy@effective-light.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per commit 5626f8c6d468 ("rcu: Add automatically released rcu_read_lock
variants"), RCU_READ_LOCK_GUARD() should be used instead of
rcu_read_{un}lock().

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 target/arm/kvm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba224..5d55de1a49 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -998,7 +998,6 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     hwaddr xlat, len, doorbell_gpa;
     MemoryRegionSection mrs;
     MemoryRegion *mr;
-    int ret = 1;
 
     if (as == &address_space_memory) {
         return 0;
@@ -1006,15 +1005,19 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
 
     /* MSI doorbell address is translated by an IOMMU */
 
-    rcu_read_lock();
+    RCU_READ_LOCK_GUARD();
+
     mr = address_space_translate(as, address, &xlat, &len, true,
                                  MEMTXATTRS_UNSPECIFIED);
+
     if (!mr) {
-        goto unlock;
+        return 1;
     }
+
     mrs = memory_region_find(mr, xlat, 1);
+
     if (!mrs.mr) {
-        goto unlock;
+        return 1;
     }
 
     doorbell_gpa = mrs.offset_within_address_space;
@@ -1025,11 +1028,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
 
     trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
 
-    ret = 0;
-
-unlock:
-    rcu_read_unlock();
-    return ret;
+    return 0;
 }
 
 int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
-- 
2.32.0


