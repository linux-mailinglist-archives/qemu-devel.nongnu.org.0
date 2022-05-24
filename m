Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54975532BB7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 15:54:01 +0200 (CEST)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntUz2-0005Pt-5e
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 09:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntUtV-0002gI-LG
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:48:17 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:53578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntUtT-0001e8-Ku
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:48:17 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id A8EB421C39;
 Tue, 24 May 2022 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1653400093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ho6E4EofZqGPbs7w9w8YeE2RX5pQNJmeaNyyWDoGcM=;
 b=F/u3kW3FxaICP7++Ypz8As8Gcu8+UFJw+XGNyzaTne/ZlzC//ymZfhp5miKu89j30Vyj/m
 r0W0+bq7hVGdW/EBnap0tDtPWk7HlIFDuVSfP3Nnwhe/UfMgLSsiv/XBdAvpMGXeO56jNl
 3RLhUCU7Q4bz4H61/kq/5f4toipGo7s=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v5 2/3] softmmu/memory: add
 memory_region_try_add_subregion function
Date: Tue, 24 May 2022 15:48:08 +0200
Message-Id: <20220524134809.40732-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220524134809.40732-1-damien.hedde@greensocs.com>
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It allows adding a subregion to a memory region with error handling.
Like memory_region_add_subregion_overlap(), it handles priority as
well. Apart from the error handling, the behavior is the same. It
can be used to do the simple memory_region_add_subregion() (with no
overlap) by setting the priority parameter to 0.

This commit is a preparation to further use of this function in the
context of qapi command which needs error handling support.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
v5:
 + rebase, new callsite

---
 include/exec/memory.h | 22 ++++++++++++++++++++++
 softmmu/memory.c      | 26 +++++++++++++++++---------
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f1c19451bc..36f2e86be5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2215,6 +2215,28 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
                                          MemoryRegion *subregion,
                                          int priority);
 
+/**
+ * memory_region_try_add_subregion: Add a subregion to a container
+ *                                  with error handling.
+ *
+ * Behaves like memory_region_add_subregion_overlap(), but errors are
+ * reported if the subregion cannot be added.
+ *
+ * @mr: the region to contain the new subregion; must be a container
+ *      initialized with memory_region_init().
+ * @offset: the offset relative to @mr where @subregion is added.
+ * @subregion: the subregion to be added.
+ * @priority: used for resolving overlaps; highest priority wins.
+ * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Returns: True in case of success, false otherwise.
+ */
+bool memory_region_try_add_subregion(MemoryRegion *mr,
+                                     hwaddr offset,
+                                     MemoryRegion *subregion,
+                                     int priority,
+                                     Error **errp);
+
 /**
  * memory_region_get_ram_addr: Get the ram address associated with a memory
  *                             region
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7ba2048836..5ea4000830 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2541,27 +2541,34 @@ done:
     memory_region_transaction_commit();
 }
 
-static void memory_region_add_subregion_common(MemoryRegion *mr,
-                                               hwaddr offset,
-                                               MemoryRegion *subregion)
+bool memory_region_try_add_subregion(MemoryRegion *mr,
+                                     hwaddr offset,
+                                     MemoryRegion *subregion,
+                                     int priority,
+                                     Error **errp)
 {
     MemoryRegion *alias;
 
-    assert(!subregion->container);
+    if (subregion->container) {
+        error_setg(errp, "The memory region is already in another region");
+        return false;
+    }
+
+    subregion->priority = priority;
     subregion->container = mr;
     for (alias = subregion->alias; alias; alias = alias->alias) {
         alias->mapped_via_alias++;
     }
     subregion->addr = offset;
     memory_region_update_container_subregions(subregion);
+    return true;
 }
 
 void memory_region_add_subregion(MemoryRegion *mr,
                                  hwaddr offset,
                                  MemoryRegion *subregion)
 {
-    subregion->priority = 0;
-    memory_region_add_subregion_common(mr, offset, subregion);
+    memory_region_try_add_subregion(mr, offset, subregion, 0, &error_abort);
 }
 
 void memory_region_add_subregion_overlap(MemoryRegion *mr,
@@ -2569,8 +2576,8 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
                                          MemoryRegion *subregion,
                                          int priority)
 {
-    subregion->priority = priority;
-    memory_region_add_subregion_common(mr, offset, subregion);
+    memory_region_try_add_subregion(mr, offset, subregion, priority,
+                                    &error_abort);
 }
 
 void memory_region_del_subregion(MemoryRegion *mr,
@@ -2626,7 +2633,8 @@ static void memory_region_readd_subregion(MemoryRegion *mr)
         memory_region_transaction_begin();
         memory_region_ref(mr);
         memory_region_del_subregion(container, mr);
-        memory_region_add_subregion_common(container, mr->addr, mr);
+        memory_region_try_add_subregion(container, mr->addr, mr, mr->priority,
+                                        &error_abort);
         memory_region_unref(mr);
         memory_region_transaction_commit();
     }
-- 
2.36.1


