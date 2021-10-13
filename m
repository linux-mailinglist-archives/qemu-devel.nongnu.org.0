Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA142BD88
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:44:57 +0200 (CEST)
Received: from localhost ([::1]:41722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabkm-0007Df-N5
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabfE-0006Lz-V5
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabfC-000396-Tk
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634121550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+drgKSyBp+3GOfFgRCVw00nbzgTkvgCinN1Uq8+5xro=;
 b=Fo5bsSconuV3X7V++nIC1f2oPj5nn20TJNaybiCnuN8bqDk/5mISDEJNR6oJ3U/RxtQaU7
 fW7qlrZtO9maPesmjTEYSmmC3plx59CxQ1bktuvIOmPjTbxG5SV8MKxJxvwBbfWQuy37nO
 NCxhrxUNuW1MGIb5z7lct64vKNDq3ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-VAyqgU9YN0mfZYNoK44x7A-1; Wed, 13 Oct 2021 06:39:08 -0400
X-MC-Unique: VAyqgU9YN0mfZYNoK44x7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B07A318D6A25;
 Wed, 13 Oct 2021 10:39:06 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B21D5D9D5;
 Wed, 13 Oct 2021 10:38:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 10/15] virtio-mem: Set the RamDiscardManager for the RAM
 memory region earlier
Date: Wed, 13 Oct 2021 12:33:25 +0200
Message-Id: <20211013103330.26869-11-david@redhat.com>
In-Reply-To: <20211013103330.26869-1-david@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's set the RamDiscardManager earlier, logically before we expose the
RAM memory region to the system. This is a preparation for further changes
and is logically cleaner: before we expose the RAM memory region to
migration code, make sure we have the RamDiscardManager setup.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d5a578142b..b2ad27ed7f 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -773,16 +773,17 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
                 sizeof(struct virtio_mem_config));
     vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
 
-    host_memory_backend_set_mapped(vmem->memdev, true);
-    vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
-    qemu_register_reset(virtio_mem_system_reset, vmem);
-
     /*
-     * Set ourselves as RamDiscardManager before the plug handler maps the
-     * memory region and exposes it via an address space.
+     * Set ourselves as RamDiscardManager before we expose the memory region
+     * to the system (e.g., marking the RAMBlock migratable, mapping the
+     * region).
      */
     memory_region_set_ram_discard_manager(&vmem->memdev->mr,
                                           RAM_DISCARD_MANAGER(vmem));
+
+    host_memory_backend_set_mapped(vmem->memdev, true);
+    vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
+    qemu_register_reset(virtio_mem_system_reset, vmem);
 }
 
 static void virtio_mem_device_unrealize(DeviceState *dev)
@@ -790,14 +791,10 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOMEM *vmem = VIRTIO_MEM(dev);
 
-    /*
-     * The unplug handler unmapped the memory region, it cannot be
-     * found via an address space anymore. Unset ourselves.
-     */
-    memory_region_set_ram_discard_manager(&vmem->memdev->mr, NULL);
     qemu_unregister_reset(virtio_mem_system_reset, vmem);
     vmstate_unregister_ram(&vmem->memdev->mr, DEVICE(vmem));
     host_memory_backend_set_mapped(vmem->memdev, false);
+    memory_region_set_ram_discard_manager(&vmem->memdev->mr, NULL);
     virtio_del_queue(vdev, 0);
     virtio_cleanup(vdev);
     g_free(vmem->bitmap);
-- 
2.31.1


