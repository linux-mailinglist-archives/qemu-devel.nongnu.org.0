Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA382C3D40
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:09:10 +0100 (CET)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khrjZ-0007Cz-93
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khrhc-0005tO-9b
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khrha-0002vx-6P
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606298825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSc9KIWokFq/Ju/2Oi+1Zj159QVUkHXXJwebK4Rf+7Y=;
 b=AZpjOeJUhg+yCKYIXIajpC0qM0Mb/I3bqRwurgracirjpd9eBDoXr9dEyLpyCrUK1OZOvQ
 Z5V+bNJx8bHh68aVJZ8/tYNS/hzHZDX1LUS86Bm72H70V3q3Su7kuBA1YVsZ9raPEr+xSl
 5Vxtq3ZBBF79XWfikV1MXDdlYlQY3xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-fvaqY5j1NM24HSEVD3cZWg-1; Wed, 25 Nov 2020 05:07:02 -0500
X-MC-Unique: fvaqY5j1NM24HSEVD3cZWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9181E51EE
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 10:07:01 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B40160BE5;
 Wed, 25 Nov 2020 10:06:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] libvhost-user: replace qemu/bswap.h with glibc endian.h
Date: Wed, 25 Nov 2020 14:06:33 +0400
Message-Id: <20201125100640.366523-2-marcandre.lureau@redhat.com>
In-Reply-To: <20201125100640.366523-1-marcandre.lureau@redhat.com>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 77 ++++++++++++++-------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 5c73ffdd6b..1c1cfbf1e7 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -26,6 +26,7 @@
 #include <sys/socket.h>
 #include <sys/eventfd.h>
 #include <sys/mman.h>
+#include <endian.h>
 #include "qemu/compiler.h"
 
 #if defined(__linux__)
@@ -42,7 +43,6 @@
 
 #include "qemu/atomic.h"
 #include "qemu/osdep.h"
-#include "qemu/bswap.h"
 #include "qemu/memfd.h"
 
 #include "libvhost-user.h"
@@ -1081,7 +1081,7 @@ vu_set_vring_addr_exec(VuDev *dev, VhostUserMsg *vmsg)
         return false;
     }
 
-    vq->used_idx = lduw_le_p(&vq->vring.used->idx);
+    vq->used_idx = le16toh(vq->vring.used->idx);
 
     if (vq->last_avail_idx != vq->used_idx) {
         bool resume = dev->iface->queue_is_processed_in_order &&
@@ -1198,7 +1198,7 @@ vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
         return 0;
     }
 
-    vq->used_idx = lduw_le_p(&vq->vring.used->idx);
+    vq->used_idx = le16toh(vq->vring.used->idx);
     vq->resubmit_num = 0;
     vq->resubmit_list = NULL;
     vq->counter = 0;
@@ -2031,13 +2031,13 @@ vu_queue_started(const VuDev *dev, const VuVirtq *vq)
 static inline uint16_t
 vring_avail_flags(VuVirtq *vq)
 {
-    return lduw_le_p(&vq->vring.avail->flags);
+    return le16toh(vq->vring.avail->flags);
 }
 
 static inline uint16_t
 vring_avail_idx(VuVirtq *vq)
 {
-    vq->shadow_avail_idx = lduw_le_p(&vq->vring.avail->idx);
+    vq->shadow_avail_idx = le16toh(vq->vring.avail->idx);
 
     return vq->shadow_avail_idx;
 }
@@ -2045,7 +2045,7 @@ vring_avail_idx(VuVirtq *vq)
 static inline uint16_t
 vring_avail_ring(VuVirtq *vq, int i)
 {
-    return lduw_le_p(&vq->vring.avail->ring[i]);
+    return le16toh(vq->vring.avail->ring[i]);
 }
 
 static inline uint16_t
@@ -2133,12 +2133,12 @@ virtqueue_read_next_desc(VuDev *dev, struct vring_desc *desc,
                          int i, unsigned int max, unsigned int *next)
 {
     /* If this descriptor says it doesn't chain, we're done. */
-    if (!(lduw_le_p(&desc[i].flags) & VRING_DESC_F_NEXT)) {
+    if (!(le16toh(desc[i].flags) & VRING_DESC_F_NEXT)) {
         return VIRTQUEUE_READ_DESC_DONE;
     }
 
     /* Check they're not leading us off end of descriptors. */
-    *next = lduw_le_p(&desc[i].next);
+    *next = le16toh(desc[i].next);
     /* Make sure compiler knows to grab that: we don't want it changing! */
     smp_wmb();
 
@@ -2181,8 +2181,8 @@ vu_queue_get_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int *in_bytes,
         }
         desc = vq->vring.desc;
 
-        if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_INDIRECT) {
-            if (ldl_le_p(&desc[i].len) % sizeof(struct vring_desc)) {
+        if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
+            if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
                 vu_panic(dev, "Invalid size for indirect buffer table");
                 goto err;
             }
@@ -2195,8 +2195,8 @@ vu_queue_get_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int *in_bytes,
 
             /* loop over the indirect descriptor table */
             indirect = 1;
-            desc_addr = ldq_le_p(&desc[i].addr);
-            desc_len = ldl_le_p(&desc[i].len);
+            desc_addr = le64toh(desc[i].addr);
+            desc_len = le32toh(desc[i].len);
             max = desc_len / sizeof(struct vring_desc);
             read_len = desc_len;
             desc = vu_gpa_to_va(dev, &read_len, desc_addr);
@@ -2223,10 +2223,10 @@ vu_queue_get_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int *in_bytes,
                 goto err;
             }
 
-            if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_WRITE) {
-                in_total += ldl_le_p(&desc[i].len);
+            if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
+                in_total += le32toh(desc[i].len);
             } else {
-                out_total += ldl_le_p(&desc[i].len);
+                out_total += le32toh(desc[i].len);
             }
             if (in_total >= max_in_bytes && out_total >= max_out_bytes) {
                 goto done;
@@ -2377,7 +2377,7 @@ vring_used_flags_set_bit(VuVirtq *vq, int mask)
 
     flags = (uint16_t *)((char*)vq->vring.used +
                          offsetof(struct vring_used, flags));
-    stw_le_p(flags, lduw_le_p(flags) | mask);
+    *flags = htole16(le16toh(*flags) | mask);
 }
 
 static inline void
@@ -2387,17 +2387,20 @@ vring_used_flags_unset_bit(VuVirtq *vq, int mask)
 
     flags = (uint16_t *)((char*)vq->vring.used +
                          offsetof(struct vring_used, flags));
-    stw_le_p(flags, lduw_le_p(flags) & ~mask);
+    *flags = htole16(le16toh(*flags) & ~mask);
 }
 
 static inline void
 vring_set_avail_event(VuVirtq *vq, uint16_t val)
 {
+    uint16_t *avail;
+
     if (!vq->notification) {
         return;
     }
 
-    stw_le_p(&vq->vring.used->ring[vq->vring.num], val);
+    avail = (uint16_t *)&vq->vring.used->ring[vq->vring.num];
+    *avail = htole16(val);
 }
 
 void
@@ -2487,15 +2490,15 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
     struct vring_desc desc_buf[VIRTQUEUE_MAX_SIZE];
     int rc;
 
-    if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_INDIRECT) {
-        if (ldl_le_p(&desc[i].len) % sizeof(struct vring_desc)) {
+    if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
+        if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
             vu_panic(dev, "Invalid size for indirect buffer table");
             return NULL;
         }
 
         /* loop over the indirect descriptor table */
-        desc_addr = ldq_le_p(&desc[i].addr);
-        desc_len = ldl_le_p(&desc[i].len);
+        desc_addr = le64toh(desc[i].addr);
+        desc_len = le32toh(desc[i].len);
         max = desc_len / sizeof(struct vring_desc);
         read_len = desc_len;
         desc = vu_gpa_to_va(dev, &read_len, desc_addr);
@@ -2517,11 +2520,11 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
 
     /* Collect all the descriptors */
     do {
-        if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_WRITE) {
+        if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
             if (!virtqueue_map_desc(dev, &in_num, iov + out_num,
                                VIRTQUEUE_MAX_SIZE - out_num, true,
-                               ldq_le_p(&desc[i].addr),
-                               ldl_le_p(&desc[i].len))) {
+                               le64toh(desc[i].addr),
+                               le32toh(desc[i].len))) {
                 return NULL;
             }
         } else {
@@ -2531,8 +2534,8 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
             }
             if (!virtqueue_map_desc(dev, &out_num, iov,
                                VIRTQUEUE_MAX_SIZE, false,
-                               ldq_le_p(&desc[i].addr),
-                               ldl_le_p(&desc[i].len))) {
+                               le64toh(desc[i].addr),
+                               le32toh(desc[i].len))) {
                 return NULL;
             }
         }
@@ -2731,15 +2734,15 @@ vu_log_queue_fill(VuDev *dev, VuVirtq *vq,
     max = vq->vring.num;
     i = elem->index;
 
-    if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_INDIRECT) {
-        if (ldl_le_p(&desc[i].len) % sizeof(struct vring_desc)) {
+    if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
+        if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
             vu_panic(dev, "Invalid size for indirect buffer table");
             return;
         }
 
         /* loop over the indirect descriptor table */
-        desc_addr = ldq_le_p(&desc[i].addr);
-        desc_len = ldl_le_p(&desc[i].len);
+        desc_addr = le64toh(desc[i].addr);
+        desc_len = le32toh(desc[i].len);
         max = desc_len / sizeof(struct vring_desc);
         read_len = desc_len;
         desc = vu_gpa_to_va(dev, &read_len, desc_addr);
@@ -2765,9 +2768,9 @@ vu_log_queue_fill(VuDev *dev, VuVirtq *vq,
             return;
         }
 
-        if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_WRITE) {
-            min = MIN(ldl_le_p(&desc[i].len), len);
-            vu_log_write(dev, ldq_le_p(&desc[i].addr), min);
+        if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
+            min = MIN(le32toh(desc[i].len), len);
+            vu_log_write(dev, le64toh(desc[i].addr), min);
             len -= min;
         }
 
@@ -2792,15 +2795,15 @@ vu_queue_fill(VuDev *dev, VuVirtq *vq,
 
     idx = (idx + vq->used_idx) % vq->vring.num;
 
-    stl_le_p(&uelem.id, elem->index);
-    stl_le_p(&uelem.len, len);
+    uelem.id = htole32(elem->index);
+    uelem.len = htole32(len);
     vring_used_write(dev, vq, &uelem, idx);
 }
 
 static inline
 void vring_used_idx_set(VuDev *dev, VuVirtq *vq, uint16_t val)
 {
-    stw_le_p(&vq->vring.used->idx, val);
+    vq->vring.used->idx = htole16(val);
     vu_log_write(dev,
                  vq->vring.log_guest_addr + offsetof(struct vring_used, idx),
                  sizeof(vq->vring.used->idx));
-- 
2.29.0


