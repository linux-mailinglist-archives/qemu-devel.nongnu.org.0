Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9670C4876A7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:40:57 +0100 (CET)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nc8-0000KB-OF
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:40:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3o-0001MH-6u
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3S-0001zt-O6
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E8cVuTw3WnQz2PCB6BKnsgn/gSst2XbDgCGG/3vh9UE=;
 b=hRtmdPJOavgOzOZbw9KEdFISrs+D6lvn0VWMD3ZHL2rs4oWAgVFU+SRRFiV/edsqqJVThe
 RzSXisirak8rsMwk65RFoREiJZP/k147j/HX8/3KQK3uYQ/i24bMpYMUVZsz3AP2WR9X4Y
 y0nxMhd/Zyr8I6BJYUSvR5wGtKqkoBI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-vWbQ2kHqM-SocpLVUPgM6g-1; Fri, 07 Jan 2022 06:04:56 -0500
X-MC-Unique: vWbQ2kHqM-SocpLVUPgM6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay41-20020a05600c1e2900b00345a568e6b2so1349403wmb.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E8cVuTw3WnQz2PCB6BKnsgn/gSst2XbDgCGG/3vh9UE=;
 b=ZrYcoVn7wRUwF9PqASisQhhAMGQWt8rZdEqH1m8lpTVg/iCbnogwkuEpghQL5t83+u
 ixK7O8zgGV9qu8IJOtyZlffFvP5SqsN0kZNiId+c2kXYD49eNYceqmla2tF3Kgs/SxmV
 pyvMOvZ9+MeVNj6nRrgKk2tLxw9NZKOvbRSmO0injvjqshUChXJzi90ZU4+0T+Tke+7x
 4u6QdUp+8co/dI1bgCkL6EyPv8qAmy8GVMJClmi9BkvkUJglqMs+Q6B9BTvlLOh/buWt
 Wq/Q+tiivaq6+I58XZ3MXT73H1edblyavunqR98E+CpRw/AC1sfm2JjZqHfvZfNBBckN
 xFAw==
X-Gm-Message-State: AOAM530SX9pAKFwDoD5W9780GMIRVpFjlpI1D2aB0C1qdxf6rJieXoJK
 VjXSFdwB49jx8+P0yzAjqTeclSlKunHA8P0ArKzjpPCt2qTtoTArzgAY4TclmVdXMixi+I1WiJ4
 x4IdnJo29MIlssx4cUQpMB4nAgEbZckhCNtLPQfy/cZRWJ9NXFSk2WrA/mNoZ
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr54814288wrm.697.1641553495302; 
 Fri, 07 Jan 2022 03:04:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyv1otFjcMO2kvieKXtfeDd7Thwcu1osmBdw7J2P4B/imBSllzNsgOEok5DqXCO9KJx0yhcwg==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr54814263wrm.697.1641553494975; 
 Fri, 07 Jan 2022 03:04:54 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id j11sm5380370wmq.23.2022.01.07.03.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:54 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 36/55] virtio-mem: Support "prealloc=on" option
Message-ID: <20220107102526.39238-37-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michal Privoznik <mprivozn@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

For scarce memory resources, such as hugetlb, we want to be able to
prealloc such memory resources in order to not crash later on access. On
simple user errors we could otherwise easily run out of memory resources
an crash the VM -- pretty much undesired.

For ordinary memory devices, such as DIMMs, we preallocate memory via the
memory backend for such use cases; however, with virtio-mem we're dealing
with sparse memory backends; preallocating the whole memory backend
destroys the whole purpose of virtio-mem.

Instead, we want to preallocate memory when actually exposing memory to the
VM dynamically, and fail plugging memory gracefully + warn the user in case
preallocation fails.

A common use case for hugetlb will be using "reserve=off,prealloc=off" for
the memory backend and "prealloc=on" for the virtio-mem device. This
way, no huge pages will be reserved for the process, but we can recover
if there are no actual huge pages when plugging memory. Libvirt is
already prepared for this.

Note that preallocation cannot protect from the OOM killer -- which
holds true for any kind of preallocation in QEMU. It's primarily useful
only for scarce memory resources such as hugetlb, or shared file-backed
memory. It's of little use for ordinary anonymous memory that can be
swapped, KSM merged, ... but we won't forbid it.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134611.31172-9-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-mem.h |  4 ++++
 hw/virtio/virtio-mem.c         | 39 ++++++++++++++++++++++++++++++----
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index a5dd6a493b..0ac7bcb3b6 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -30,6 +30,7 @@ OBJECT_DECLARE_TYPE(VirtIOMEM, VirtIOMEMClass,
 #define VIRTIO_MEM_REQUESTED_SIZE_PROP "requested-size"
 #define VIRTIO_MEM_BLOCK_SIZE_PROP "block-size"
 #define VIRTIO_MEM_ADDR_PROP "memaddr"
+#define VIRTIO_MEM_PREALLOC_PROP "prealloc"
 
 struct VirtIOMEM {
     VirtIODevice parent_obj;
@@ -62,6 +63,9 @@ struct VirtIOMEM {
     /* block size and alignment */
     uint64_t block_size;
 
+    /* whether to prealloc memory when plugging new blocks */
+    bool prealloc;
+
     /* notifiers to notify when "size" changes */
     NotifierList size_change_notifiers;
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 341c3fa2c1..ab975ff566 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -429,10 +429,40 @@ static int virtio_mem_set_block_state(VirtIOMEM *vmem, uint64_t start_gpa,
             return -EBUSY;
         }
         virtio_mem_notify_unplug(vmem, offset, size);
-    } else if (virtio_mem_notify_plug(vmem, offset, size)) {
-        /* Could be a mapping attempt resulted in memory getting populated. */
-        ram_block_discard_range(vmem->memdev->mr.ram_block, offset, size);
-        return -EBUSY;
+    } else {
+        int ret = 0;
+
+        if (vmem->prealloc) {
+            void *area = memory_region_get_ram_ptr(&vmem->memdev->mr) + offset;
+            int fd = memory_region_get_fd(&vmem->memdev->mr);
+            Error *local_err = NULL;
+
+            os_mem_prealloc(fd, area, size, 1, &local_err);
+            if (local_err) {
+                static bool warned;
+
+                /*
+                 * Warn only once, we don't want to fill the log with these
+                 * warnings.
+                 */
+                if (!warned) {
+                    warn_report_err(local_err);
+                    warned = true;
+                } else {
+                    error_free(local_err);
+                }
+                ret = -EBUSY;
+            }
+        }
+        if (!ret) {
+            ret = virtio_mem_notify_plug(vmem, offset, size);
+        }
+
+        if (ret) {
+            /* Could be preallocation or a notifier populated memory. */
+            ram_block_discard_range(vmem->memdev->mr.ram_block, offset, size);
+            return -EBUSY;
+        }
     }
     virtio_mem_set_bitmap(vmem, start_gpa, size, plug);
     return 0;
@@ -1108,6 +1138,7 @@ static void virtio_mem_instance_init(Object *obj)
 static Property virtio_mem_properties[] = {
     DEFINE_PROP_UINT64(VIRTIO_MEM_ADDR_PROP, VirtIOMEM, addr, 0),
     DEFINE_PROP_UINT32(VIRTIO_MEM_NODE_PROP, VirtIOMEM, node, 0),
+    DEFINE_PROP_BOOL(VIRTIO_MEM_PREALLOC_PROP, VirtIOMEM, prealloc, false),
     DEFINE_PROP_LINK(VIRTIO_MEM_MEMDEV_PROP, VirtIOMEM, memdev,
                      TYPE_MEMORY_BACKEND, HostMemoryBackend *),
     DEFINE_PROP_END_OF_LIST(),
-- 
MST


