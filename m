Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A65FA34F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:21:27 +0200 (CEST)
Received: from localhost ([::1]:34010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxP4-0000dw-D9
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcw-0003Wc-Da
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcZ-0007I9-8i
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L0vlmue0OBi9GjcNmLwk7PDumQATzafRURYGTl1dKsE=;
 b=eJuKsmLQlCXElxUFNOQsN9osX5M+lbMdUvmSnPNGqCI9jKGUXzfWnQZTMim7poCbKG2lkE
 zVhQ8P8zN08FsXo0Bwl6NJ0WOCI0WH8WxUl4VvgZIvqqjOF04vzunqGtwKr1bNpYRUue61
 j+uvONtMazMVxRwfFEF2g9legGw0zYY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-ZOi1lzHWM6WAQDTik6CB1w-1; Mon, 10 Oct 2022 13:31:16 -0400
X-MC-Unique: ZOi1lzHWM6WAQDTik6CB1w-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so5820506wmb.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0vlmue0OBi9GjcNmLwk7PDumQATzafRURYGTl1dKsE=;
 b=4TfIuBLJBop1h0zofGRZPDelMyX7vP4g73DSdfV6hXc/NJ9KMbuk/Tji8PI+icAYaB
 1+58wdw2rLXCFOvQgR2Wwx9RPiYyt0GFimKM4fhMxXARZCKitQoE9vOrIEvZDOaBWtsh
 La0mrACqviIdbvzkB/6ZBP8c3lFTYkPS1DoEJd74OIO8s1jv3yUsYvBmefwdSOZc7evX
 sWblA6ZE1ze8As1QobvQg9SGiQfPQQyFCRbV06auad6mlv7UgHjM93sfq/+7zQaeS2Hx
 wgXA/ylocHk/xDmbm1O3p8OUrKZEqlTaH+F5+DJV8gXG35Us963NmHAn+uqK6AtBaDlv
 vPKw==
X-Gm-Message-State: ACrzQf25be/GL2FUgDP8nmyt+0lnmw6PdU606jmo/LrVh71+WgCEiK7k
 s3ZZZxrz6WaSaqhzaRD6t3cCck+IvbYzmKNbVrPm5jzPmgKg9o/gs6VGNpkMkCqmOX09ZCOYLRy
 S1TCaRdq8DEPo1jNeoMarixVHGNSdCB9T8yOB1QdbLfgVKwGLQsR2V0lKYILV
X-Received: by 2002:a7b:cbc6:0:b0:3c4:20c5:3fc5 with SMTP id
 n6-20020a7bcbc6000000b003c420c53fc5mr10148266wmi.9.1665423074906; 
 Mon, 10 Oct 2022 10:31:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+WMAKNCsp5/gRTBQ3BGrti7rhXscLJYKXTnmTWILyvpuaksoUIRoQzE7HGf29TBwQpNMxqQ==
X-Received: by 2002:a7b:cbc6:0:b0:3c4:20c5:3fc5 with SMTP id
 n6-20020a7bcbc6000000b003c420c53fc5mr10148240wmi.9.1665423074571; 
 Mon, 10 Oct 2022 10:31:14 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 co11-20020a0560000a0b00b00228d52b935asm9617166wrb.71.2022.10.10.10.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:14 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Jonah Palmer <jonah.palmer@oracle.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 34/55] qmp: add QMP command x-query-virtio-queue-element
Message-ID: <20221010172813.204597-35-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the information of a VirtQueue element.

[Note: Up until v10 of this patch series, virtio.json had many (15+)
 enums defined (e.g. decoded device features, statuses, etc.). In v10
 most of these enums were removed and replaced with string literals.
 By doing this we get (1) simpler schema, (2) smaller generated code,
 and (3) less maintenance burden for when new things are added (e.g.
 devices, device features, etc.).]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
Message-Id: <1660220684-24909-6-git-send-email-jonah.palmer@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/virtio.json        | 197 ++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-stub.c |   9 ++
 hw/virtio/virtio.c      | 154 +++++++++++++++++++++++++++++++
 3 files changed, 360 insertions(+)

diff --git a/qapi/virtio.json b/qapi/virtio.json
index d9050f3584..e47a8fb2e0 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -755,3 +755,200 @@
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtVhostQueueStatus',
   'features': [ 'unstable' ] }
+
+##
+# @VirtioRingDesc:
+#
+# Information regarding the vring descriptor area
+#
+# @addr: Guest physical address of the descriptor area
+#
+# @len: Length of the descriptor area
+#
+# @flags: List of descriptor flags
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+  'data': { 'addr': 'uint64',
+            'len': 'uint32',
+            'flags': [ 'str' ] } }
+
+##
+# @VirtioRingAvail:
+#
+# Information regarding the avail vring (a.k.a. driver area)
+#
+# @flags: VRingAvail flags
+#
+# @idx: VRingAvail index
+#
+# @ring: VRingAvail ring[] entry at provided index
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtioRingAvail',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16',
+            'ring': 'uint16' } }
+
+##
+# @VirtioRingUsed:
+#
+# Information regarding the used vring (a.k.a. device area)
+#
+# @flags: VRingUsed flags
+#
+# @idx: VRingUsed index
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtioRingUsed',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16' } }
+
+##
+# @VirtioQueueElement:
+#
+# Information regarding a VirtQueue's VirtQueueElement including
+# descriptor, driver, and device areas
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
+#
+# @index: Index of the element in the queue
+#
+# @descs: List of descriptors (VirtioRingDesc)
+#
+# @avail: VRingAvail info
+#
+# @used: VRingUsed info
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+  'data': { 'name': 'str',
+            'index': 'uint32',
+            'descs': [ 'VirtioRingDesc' ],
+            'avail': 'VirtioRingAvail',
+            'used': 'VirtioRingUsed' } }
+
+##
+# @x-query-virtio-queue-element:
+#
+# Return the information about a VirtQueue's VirtQueueElement
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# @index: Index of the element in the queue
+#         (default: head of the queue)
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioQueueElement information
+#
+# Since: 7.1
+#
+# Examples:
+#
+# 1. Introspect on virtio-net's VirtQueue 0 at index 5
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#                     "queue": 0,
+#                     "index": 5 }
+#    }
+# <- { "return": {
+#          "index": 5,
+#          "name": "virtio-net",
+#          "descs": [
+#              {
+#                  "flags": ["write"],
+#                  "len": 1536,
+#                  "addr": 5257305600
+#              }
+#          ],
+#          "avail": {
+#              "idx": 256,
+#              "flags": 0,
+#              "ring": 5
+#          },
+#          "used": {
+#              "idx": 13,
+#              "flags": 0
+#          }
+#      }
+#    }
+#
+# 2. Introspect on virtio-crypto's VirtQueue 1 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#          "index": 0,
+#          "name": "virtio-crypto",
+#          "descs": [
+#              {
+#                  "flags": [],
+#                  "len": 0,
+#                  "addr": 8080268923184214134
+#              }
+#          ],
+#          "avail": {
+#              "idx": 280,
+#              "flags": 0,
+#              "ring": 0
+#          },
+#          "used": {
+#              "idx": 280,
+#              "flags": 0
+#          }
+#      }
+#    }
+#
+# 3. Introspect on virtio-scsi's VirtQueue 2 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#                     "queue": 2 }
+#    }
+# <- { "return": {
+#          "index": 19,
+#          "name": "virtio-scsi",
+#          "descs": [
+#              {
+#                  "flags": ["used", "indirect", "write"],
+#                  "len": 4099327944,
+#                  "addr": 12055409292258155293
+#              }
+#          ],
+#          "avail": {
+#              "idx": 1147,
+#              "flags": 0,
+#              "ring": 19
+#          },
+#          "used": {
+#              "idx": 280,
+#              "flags": 0
+#          }
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement',
+  'features': [ 'unstable' ] }
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 13e5f93652..7ddb22cc5e 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -31,3 +31,12 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index da869e7b51..808446b4c9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -823,6 +823,19 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
     address_space_cache_invalidate(&caches->used, pa, sizeof(VRingUsedElem));
 }
 
+/* Called within rcu_read_lock(). */
+static inline uint16_t vring_used_flags(VirtQueue *vq)
+{
+    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
+    hwaddr pa = offsetof(VRingUsed, flags);
+
+    if (!caches) {
+        return 0;
+    }
+
+    return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
+}
+
 /* Called within rcu_read_lock().  */
 static uint16_t vring_used_idx(VirtQueue *vq)
 {
@@ -4782,6 +4795,147 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
     return status;
 }
 
+static strList *qmp_decode_vring_desc_flags(uint16_t flags)
+{
+    strList *list = NULL;
+    strList *node;
+    int i;
+
+    struct {
+        uint16_t flag;
+        const char *value;
+    } map[] = {
+        { VRING_DESC_F_NEXT, "next" },
+        { VRING_DESC_F_WRITE, "write" },
+        { VRING_DESC_F_INDIRECT, "indirect" },
+        { 1 << VRING_PACKED_DESC_F_AVAIL, "avail" },
+        { 1 << VRING_PACKED_DESC_F_USED, "used" },
+        { 0, "" }
+    };
+
+    for (i = 0; map[i].flag; i++) {
+        if ((map[i].flag & flags) == 0) {
+            continue;
+        }
+        node = g_malloc0(sizeof(strList));
+        node->value = g_strdup(map[i].value);
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueue *vq;
+    VirtioQueueElement *element = NULL;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+    vq = &vdev->vq[queue];
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
+        error_setg(errp, "Packed ring not supported");
+        return NULL;
+    } else {
+        unsigned int head, i, max;
+        VRingMemoryRegionCaches *caches;
+        MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
+        MemoryRegionCache *desc_cache;
+        VRingDesc desc;
+        VirtioRingDescList *list = NULL;
+        VirtioRingDescList *node;
+        int rc; int ndescs;
+
+        RCU_READ_LOCK_GUARD();
+
+        max = vq->vring.num;
+
+        if (!has_index) {
+            head = vring_avail_ring(vq, vq->last_avail_idx % vq->vring.num);
+        } else {
+            head = vring_avail_ring(vq, index % vq->vring.num);
+        }
+        i = head;
+
+        caches = vring_get_region_caches(vq);
+        if (!caches) {
+            error_setg(errp, "Region caches not initialized");
+            return NULL;
+        }
+        if (caches->desc.len < max * sizeof(VRingDesc)) {
+            error_setg(errp, "Cannot map descriptor ring");
+            return NULL;
+        }
+
+        desc_cache = &caches->desc;
+        vring_split_desc_read(vdev, &desc, desc_cache, i);
+        if (desc.flags & VRING_DESC_F_INDIRECT) {
+            int64_t len;
+            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
+                                           desc.addr, desc.len, false);
+            desc_cache = &indirect_desc_cache;
+            if (len < desc.len) {
+                error_setg(errp, "Cannot map indirect buffer");
+                goto done;
+            }
+
+            max = desc.len / sizeof(VRingDesc);
+            i = 0;
+            vring_split_desc_read(vdev, &desc, desc_cache, i);
+        }
+
+        element = g_new0(VirtioQueueElement, 1);
+        element->avail = g_new0(VirtioRingAvail, 1);
+        element->used = g_new0(VirtioRingUsed, 1);
+        element->name = g_strdup(vdev->name);
+        element->index = head;
+        element->avail->flags = vring_avail_flags(vq);
+        element->avail->idx = vring_avail_idx(vq);
+        element->avail->ring = head;
+        element->used->flags = vring_used_flags(vq);
+        element->used->idx = vring_used_idx(vq);
+        ndescs = 0;
+
+        do {
+            /* A buggy driver may produce an infinite loop */
+            if (ndescs >= max) {
+                break;
+            }
+            node = g_new0(VirtioRingDescList, 1);
+            node->value = g_new0(VirtioRingDesc, 1);
+            node->value->addr = desc.addr;
+            node->value->len = desc.len;
+            node->value->flags = qmp_decode_vring_desc_flags(desc.flags);
+            node->next = list;
+            list = node;
+
+            ndescs++;
+            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
+                                                max, &i);
+        } while (rc == VIRTQUEUE_READ_DESC_MORE);
+        element->descs = list;
+done:
+        address_space_cache_destroy(&indirect_desc_cache);
+    }
+
+    return element;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
-- 
MST


