Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0A364265C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:08:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28AT-0000uW-OA; Mon, 05 Dec 2022 04:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28AQ-0000qd-UI
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28AP-0006Vn-4r
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SGCfToDbM9WhOy+q3kxZx78SijHUnLuNZHHeTrr+MM=;
 b=dJmSUhZ5zv6IJN8q3hsNbWHtS60OYAQ8jyPQA+rcfoqAI+BMh5dp5vu9prZP7heh12TS4T
 p5rQCBsXJIW3FUXs2rHaV7w2SmHAxerZlXy8c62ie0QwJYhrO5g9x2a+kifMT/jd4eAbeB
 bLml/iyDtkSKg9sghBXKBPVe+XaCdJU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-z77S-848PwCeZE2Tmiy1Ew-1; Mon, 05 Dec 2022 04:53:37 -0500
X-MC-Unique: z77S-848PwCeZE2Tmiy1Ew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A304862FEC;
 Mon,  5 Dec 2022 09:53:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED0652166B29;
 Mon,  5 Dec 2022 09:53:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/51] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
Date: Mon,  5 Dec 2022 10:51:44 +0100
Message-Id: <20221205095228.1314-8-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Have qxl_get_check_slot_offset() return false if the requested
buffer size does not fit within the slot memory region.

Similarly qxl_phys2virt() now returns NULL in such case, and
qxl_dirty_one_surface() aborts.

This avoids buffer overrun in the host pointer returned by
memory_region_get_ram_ptr().

Fixes: CVE-2022-4144 (out-of-bounds read)
Reported-by: Wenxu Yin (@awxylitol)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221128202741.4945-5-philmd@linaro.org>
---
 hw/display/qxl.h |  2 +-
 hw/display/qxl.c | 27 +++++++++++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index bf03138ab4..7894bd5134 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -157,7 +157,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
  *
  * Returns a host pointer to a buffer placed at offset @phys within the
  * active slot @group_id of the PCI VGA RAM memory region associated with
- * the @qxl device. If the slot is inactive, or the offset is out
+ * the @qxl device. If the slot is inactive, or the offset + size are out
  * of the memory region, returns NULL.
  *
  * Use with care; by the time this function returns, the returned pointer is
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 231d733250..0b21626aad 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1424,11 +1424,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
 
 /* can be also called from spice server thread context */
 static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
-                                      uint32_t *s, uint64_t *o)
+                                      uint32_t *s, uint64_t *o,
+                                      size_t size_requested)
 {
     uint64_t phys   = le64_to_cpu(pqxl);
     uint32_t slot   = (phys >> (64 -  8)) & 0xff;
     uint64_t offset = phys & 0xffffffffffff;
+    uint64_t size_available;
 
     if (slot >= NUM_MEMSLOTS) {
         qxl_set_guest_bug(qxl, "slot too large %d >= %d", slot,
@@ -1452,6 +1454,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
                           slot, offset, qxl->guest_slots[slot].size);
         return false;
     }
+    size_available = memory_region_size(qxl->guest_slots[slot].mr);
+    if (qxl->guest_slots[slot].offset + offset >= size_available) {
+        qxl_set_guest_bug(qxl,
+                          "slot %d offset %"PRIu64" > region size %"PRIu64"\n",
+                          slot, qxl->guest_slots[slot].offset + offset,
+                          size_available);
+        return false;
+    }
+    size_available -= qxl->guest_slots[slot].offset + offset;
+    if (size_requested > size_available) {
+        qxl_set_guest_bug(qxl,
+                          "slot %d offset %"PRIu64" size %zu: "
+                          "overrun by %"PRIu64" bytes\n",
+                          slot, offset, size_requested,
+                          size_requested - size_available);
+        return false;
+    }
 
     *s = slot;
     *o = offset;
@@ -1471,7 +1490,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
         offset = le64_to_cpu(pqxl) & 0xffffffffffff;
         return (void *)(intptr_t)offset;
     case MEMSLOT_GROUP_GUEST:
-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
+        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) {
             return NULL;
         }
         ptr = memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
@@ -1937,9 +1956,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
     uint32_t slot;
     bool rc;
 
-    rc = qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
-    assert(rc == true);
     size = (uint64_t)height * abs(stride);
+    rc = qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size);
+    assert(rc == true);
     trace_qxl_surfaces_dirty(qxl->id, offset, size);
     qxl_set_dirty(qxl->guest_slots[slot].mr,
                   qxl->guest_slots[slot].offset + offset,
-- 
2.38.1


