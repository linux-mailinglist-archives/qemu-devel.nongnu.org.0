Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40112323A05
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 10:57:56 +0100 (CET)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEqvb-0001MP-8V
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 04:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEqoJ-00022n-AC
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:50:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEqoH-0007S1-4s
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614160220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cgf7X2V+cNDckZkSdQKWlxDk2IzJLIhZoFvrNRYHRvE=;
 b=EPkRREdtMcThmKJk+rzsYVusIAUtVCpkWXFghnHsbBEckW7oANFHXkjUUAHysZCV3qBy6a
 1WU7MNPyC+s9Hw9RLuU44s9LZmrgJp3Nh56WgJShxd+c8Q7zjXm/32D0qi//9EG5rRhpYC
 VBbC1Ho1Jn91OPx9CDvQfzrZTN7uNyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-LfMgFunMO1iKl1i-UshJYg-1; Wed, 24 Feb 2021 04:50:16 -0500
X-MC-Unique: LfMgFunMO1iKl1i-UshJYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96953100A8EE;
 Wed, 24 Feb 2021 09:50:15 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75832722CE;
 Wed, 24 Feb 2021 09:50:07 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/13] virtio-mem: Don't report errors when
 ram_block_discard_range() fails
Date: Wed, 24 Feb 2021 10:49:00 +0100
Message-Id: <20210224094910.44986-5-david@redhat.com>
In-Reply-To: <20210224094910.44986-1-david@redhat.com>
References: <20210224094910.44986-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/virtio/virtio-mem.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 471e464171..bbe42ad83b 100644
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
2.29.2


