Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE231981BA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 18:54:31 +0200 (CEST)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIxgE-0007Bn-Vx
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 12:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcL-0001NX-Na
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcK-0004yK-Cq
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 12:50:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33520 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcH-0004tG-C7; Mon, 30 Mar 2020 12:50:25 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 13CBF8FF5964092C93BD;
 Tue, 31 Mar 2020 00:50:23 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.27.100) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 31 Mar 2020 00:50:15 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH for-5.0 3/3] exec: Fix for qemu_ram_resize() callback
Date: Mon, 30 Mar 2020 17:49:09 +0100
Message-ID: <20200330164909.28324-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
References: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.27.100]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Summarizing the issue:
1. Memory regions contain ram blocks with a different size,  if the
   size is  not properly aligned. While memory regions can have an
   unaligned size, ram blocks can't. This is true when creating
   resizable memory region with  an unaligned size.
2. When resizing a ram block/memory region, the size of the memory
   region  is set to the aligned size. The callback is called with
   the aligned size. The unaligned piece is lost.

Because of the above, if ACPI blob length modifications happens
after the initial virt_acpi_build() call, and the changed blob
length is within the PAGE size boundary, then the revised size
is not seen by the firmware on Guest reboot.

Hence make sure callback is called if memory region size is changed,
irrespective of aligned or not.

Signed-off-by: David Hildenbrand <david@redhat.com>
[Shameer: added commit log]
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
Please find previous discussion here,
https://patchwork.kernel.org/patch/11432375/#23216751
---
 exec.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index de9d949902..2874bb5088 100644
--- a/exec.c
+++ b/exec.c
@@ -2074,11 +2074,23 @@ static int memory_try_enable_merging(void *addr, size_t len)
  */
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
 {
+    const ram_addr_t unaligned_size = newsize;
+
     assert(block);
 
     newsize = HOST_PAGE_ALIGN(newsize);
 
     if (block->used_length == newsize) {
+        /*
+         * We don't have to resize the ram block (which only knows aligned
+         * sizes), however, we have to notify if the unaligned size changed.
+         */
+        if (unaligned_size != memory_region_size(block->mr)) {
+            memory_region_set_size(block->mr, unaligned_size);
+            if (block->resized) {
+                block->resized(block->idstr, unaligned_size, block->host);
+            }
+        }
         return 0;
     }
 
@@ -2102,9 +2114,9 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
     block->used_length = newsize;
     cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
                                         DIRTY_CLIENTS_ALL);
-    memory_region_set_size(block->mr, newsize);
+    memory_region_set_size(block->mr, unaligned_size);
     if (block->resized) {
-        block->resized(block->idstr, newsize, block->host);
+        block->resized(block->idstr, unaligned_size, block->host);
     }
     return 0;
 }
-- 
2.17.1



