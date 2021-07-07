Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB83BF054
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:36:23 +0200 (CEST)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DLK-0006SK-7g
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DId-0001r5-6Y
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:33:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DIa-0007gU-VD
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625686412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fA5uiscrduuPmsd8g8UnN6cMIJ0WEpjAe1dloV6xAew=;
 b=P7wF7IK3lZnM32H91SdQFg7uiHPnVRKXazBr412M062zx6Id8Nb5g004CpFpnX5Pr8ulB4
 2rsdIlBKYzptqoHCGnnNBqjMA9CHwo3AJhwI1MrtIy/b4NnDSnNjYI3FfppdcQ9du6TwMa
 9SnOzcLLbmI3qtod1CKbqv0wR21/f64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-2yeXcn3oP5eGfo8IW6X2MQ-1; Wed, 07 Jul 2021 15:33:31 -0400
X-MC-Unique: 2yeXcn3oP5eGfo8IW6X2MQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00EB8CC621;
 Wed,  7 Jul 2021 19:33:30 +0000 (UTC)
Received: from localhost (ovpn-113-79.rdu2.redhat.com [10.10.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E308A5D9FC;
 Wed,  7 Jul 2021 19:33:12 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 06/15] virtio-mem: Don't report errors when
 ram_block_discard_range() fails
Date: Wed,  7 Jul 2021 15:32:32 -0400
Message-Id: <20210707193241.2659335-7-ehabkost@redhat.com>
In-Reply-To: <20210707193241.2659335-1-ehabkost@redhat.com>
References: <20210707193241.2659335-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Any errors are unexpected and ram_block_discard_range() already properly
prints errors. Let's stop manually reporting errors.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210413095531.25603-5-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/virtio/virtio-mem.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 3942fd75496..a92a067b283 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -246,17 +246,14 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
                                       uint64_t size, bool plug)
 {
     const uint64_t offset = start_gpa - vmem->addr;
-    int ret;
+    RAMBlock *rb = vmem->memdev->mr.ram_block;
 
     if (virtio_mem_is_busy()) {
         return -EBUSY;
     }
 
     if (!plug) {
-        ret = ram_block_discard_range(vmem->memdev->mr.ram_block, offset, size);
-        if (ret) {
-            error_report("Unexpected error discarding RAM: %s",
-                         strerror(-ret));
+        if (ram_block_discard_range(rb, offset, size)) {
             return -EBUSY;
         }
     }
@@ -345,15 +342,12 @@ static void virtio_mem_resize_usable_region(VirtIOMEM *vmem,
 static int virtio_mem_unplug_all(VirtIOMEM *vmem)
 {
     RAMBlock *rb = vmem->memdev->mr.ram_block;
-    int ret;
 
     if (virtio_mem_is_busy()) {
         return -EBUSY;
     }
 
-    ret = ram_block_discard_range(rb, 0, qemu_ram_get_used_length(rb));
-    if (ret) {
-        error_report("Unexpected error discarding RAM: %s", strerror(-ret));
+    if (ram_block_discard_range(rb, 0, qemu_ram_get_used_length(rb))) {
         return -EBUSY;
     }
     bitmap_clear(vmem->bitmap, 0, vmem->bitmap_size);
@@ -625,14 +619,8 @@ static int virtio_mem_discard_range_cb(const VirtIOMEM *vmem, void *arg,
                                        uint64_t offset, uint64_t size)
 {
     RAMBlock *rb = vmem->memdev->mr.ram_block;
-    int ret;
 
-    ret = ram_block_discard_range(rb, offset, size);
-    if (ret) {
-        error_report("Unexpected error discarding RAM: %s", strerror(-ret));
-        return -EINVAL;
-    }
-    return 0;
+    return ram_block_discard_range(rb, offset, size) ? -EINVAL : 0;
 }
 
 static int virtio_mem_restore_unplugged(VirtIOMEM *vmem)
-- 
2.31.1


