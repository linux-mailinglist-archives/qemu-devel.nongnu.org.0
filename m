Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF1214818
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 20:42:46 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrn7d-000866-7n
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 14:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrmvd-0003Xz-WC
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 14:30:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33894
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrmvc-0001Q2-23
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 14:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593887419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JdaMdAKWaXVwQnXrCapKxlj+F+s4kQbpEqunmlKdvwE=;
 b=c897AqnkkBu7J0es5XuEoHrv4DtKza6l8fSsk2opqezYCf9H9ifCqy1+zQlmBF9/yMhWXw
 6U3haV0MEvO6kZJBMUGVG7eqC+etYieFx+/cvuFJxTlsRZn5Jsv6H++9fk4A3WW6aWhytU
 Dbe5/8TDab+STAzVCTsQOCM6QCTZQWA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-cLvnnzVxNdipVIbXh0iSYg-1; Sat, 04 Jul 2020 14:30:17 -0400
X-MC-Unique: cLvnnzVxNdipVIbXh0iSYg-1
Received: by mail-wm1-f72.google.com with SMTP id s134so40197340wme.6
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 11:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JdaMdAKWaXVwQnXrCapKxlj+F+s4kQbpEqunmlKdvwE=;
 b=R5YdSKkVgz1NGw3U5cMs4118nChoXCOOdmtm+bjRxRfG3eMNvF2qTG3Nn6LNCKqSAh
 ALBqed8W9FrFGtFKrKYNYen1LXKBbV3uURUsG00wz7XBIJ66K2/W4vnjS/NV/kbcRgVV
 +ZkLH0qOXwNvSAlDOieQAQXmWljgzreqFe6eb/qK+f//MqZfyaykidk3u3M7x2ID9KL4
 IBnXtrX7qUyjBbqv2TJU7cNepsX9bJxYXDD7EbC1IYt4TYiTmhr6ZWTSOcvG/xsMIPGB
 v6du1YGvHm1oAw1K35J+ucnpkEvhZ5ieELXTJ2pOR0dqKu0IsWx4kSwdGGdZCpMKo+1H
 +p1g==
X-Gm-Message-State: AOAM530y9nX5nNzOWmo8BNqVbWN8cP4dNqEo2YHXutY5uBFqRp92gM7G
 g+yHuJIr/8+87U/e2pfvQLSM1Jpk/pf4Y4TL/Q0TciHErclrY2CGpfyaE1Ff7eWZNQ7SSlHh4Ip
 C4WCOUmV+8vv+qr8=
X-Received: by 2002:a7b:c259:: with SMTP id b25mr18089632wmj.107.1593887416006; 
 Sat, 04 Jul 2020 11:30:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp+AsqAN3ks7zNIrbl4hjzSPLuk2qff88G5FoEp21b3KjAbxZKD6f2OEsLftfzP49ksq9bug==
X-Received: by 2002:a7b:c259:: with SMTP id b25mr18089616wmj.107.1593887415832; 
 Sat, 04 Jul 2020 11:30:15 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 w7sm17650799wmc.32.2020.07.04.11.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 11:30:15 -0700 (PDT)
Date: Sat, 4 Jul 2020 14:30:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 19/41] virtio-mem: Allow notifiers for size changes
Message-ID: <20200704182750.1088103-20-mst@redhat.com>
References: <20200704182750.1088103-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200704182750.1088103-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Igor Mammedov <imammedo@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We want to send qapi events in case the size of a virtio-mem device
changes. This allows upper layers to always know how much memory is
actually currently consumed via a virtio-mem device.

Unfortuantely, we have to report the id of our proxy device. Let's provide
an easy way for our proxy device to register, so it can send the qapi
events. Piggy-backing on the notifier infrastructure (although we'll
only ever have one notifier registered) seems to be an easy way.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20200626072248.78761-17-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-mem.h |  5 +++++
 hw/virtio/virtio-mem.c         | 21 ++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 6981096f7c..b74c77cd42 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -64,6 +64,9 @@ typedef struct VirtIOMEM {
 
     /* block size and alignment */
     uint64_t block_size;
+
+    /* notifiers to notify when "size" changes */
+    NotifierList size_change_notifiers;
 } VirtIOMEM;
 
 typedef struct VirtIOMEMClass {
@@ -73,6 +76,8 @@ typedef struct VirtIOMEMClass {
     /* public */
     void (*fill_device_info)(const VirtIOMEM *vmen, VirtioMEMDeviceInfo *vi);
     MemoryRegion *(*get_memory_region)(VirtIOMEM *vmem, Error **errp);
+    void (*add_size_change_notifier)(VirtIOMEM *vmem, Notifier *notifier);
+    void (*remove_size_change_notifier)(VirtIOMEM *vmem, Notifier *notifier);
 } VirtIOMEMClass;
 
 #endif
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 2d6f3061a6..6b5551515d 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -184,6 +184,7 @@ static int virtio_mem_state_change_request(VirtIOMEM *vmem, uint64_t gpa,
     } else {
         vmem->size -= size;
     }
+    notifier_list_notify(&vmem->size_change_notifiers, &vmem->size);
     return VIRTIO_MEM_RESP_ACK;
 }
 
@@ -242,7 +243,10 @@ static int virtio_mem_unplug_all(VirtIOMEM *vmem)
         return -EBUSY;
     }
     bitmap_clear(vmem->bitmap, 0, vmem->bitmap_size);
-    vmem->size = 0;
+    if (vmem->size) {
+        vmem->size = 0;
+        notifier_list_notify(&vmem->size_change_notifiers, &vmem->size);
+    }
 
     virtio_mem_resize_usable_region(vmem, vmem->requested_size, true);
     return 0;
@@ -561,6 +565,18 @@ static MemoryRegion *virtio_mem_get_memory_region(VirtIOMEM *vmem, Error **errp)
     return &vmem->memdev->mr;
 }
 
+static void virtio_mem_add_size_change_notifier(VirtIOMEM *vmem,
+                                                Notifier *notifier)
+{
+    notifier_list_add(&vmem->size_change_notifiers, notifier);
+}
+
+static void virtio_mem_remove_size_change_notifier(VirtIOMEM *vmem,
+                                                   Notifier *notifier)
+{
+    notifier_remove(notifier);
+}
+
 static void virtio_mem_get_size(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
 {
@@ -668,6 +684,7 @@ static void virtio_mem_instance_init(Object *obj)
     VirtIOMEM *vmem = VIRTIO_MEM(obj);
 
     vmem->block_size = VIRTIO_MEM_MIN_BLOCK_SIZE;
+    notifier_list_init(&vmem->size_change_notifiers);
 
     object_property_add(obj, VIRTIO_MEM_SIZE_PROP, "size", virtio_mem_get_size,
                         NULL, NULL, NULL);
@@ -705,6 +722,8 @@ static void virtio_mem_class_init(ObjectClass *klass, void *data)
 
     vmc->fill_device_info = virtio_mem_fill_device_info;
     vmc->get_memory_region = virtio_mem_get_memory_region;
+    vmc->add_size_change_notifier = virtio_mem_add_size_change_notifier;
+    vmc->remove_size_change_notifier = virtio_mem_remove_size_change_notifier;
 }
 
 static const TypeInfo virtio_mem_info = {
-- 
MST


