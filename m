Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B9F1CB9D8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 23:33:12 +0200 (CEST)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXAcJ-0005iM-C5
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 17:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jXAZT-0004HA-FW
 for qemu-devel@nongnu.org; Fri, 08 May 2020 17:30:15 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:44150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jXAZR-0008PZ-PO
 for qemu-devel@nongnu.org; Fri, 08 May 2020 17:30:14 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id ck5so1541614qvb.11
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 14:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=f60PjaQ32uAPz31QIwCr3FQCyG63xWUpLWuGVvAuWxg=;
 b=hZt/tbIUr7MZ/AcQsUw249u1oIHACXw9aWTb/tX2NjNB7FxambPwkWDPg3Lb/r9FyY
 IVQQaDp02v7414nQR1P4nq8FXUjlzF75vljYV5DxF3IMsqzQqqn/PckPUf1eXISFw7aU
 YUbVWyshPVc3cjbSU6bGiINaeo+qiAxNoRu8EgvkKZPy760X1CUzjXKXJoyF1uQEsBV5
 kgVp/xXJvTBitulV7NcjH0DInamLDw6FI/SyJK1iCgH7stjBiMEZ58g1pSnjOyo6DnRd
 12PowWmYpexTePz5uI7bdLWNcHTxw1ebj0GcvSqVqNBw94osVTwMcHOwOoZfsSkjUI60
 4Agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=f60PjaQ32uAPz31QIwCr3FQCyG63xWUpLWuGVvAuWxg=;
 b=t7q0/spNDX7k9T79+6uzxi6UGdfGKa3GBalGuRd+Oh/g3lUtGu1GnG0HhSxDSZC1f4
 c6BYuMb2R4su3fg575oxfCDFFTbj3jj4R2k/wkxkvCUlgnm/jqZAIfTcTVBFDKAEL55v
 jLOJyWoCkwUkMfqHk2ebgmH9Fx6PDOTVzYaNf0kQDi9EurFUrMgiOnhcBZkXsUdNBsVj
 q3bogFDL/nPRy5NppfnkqxOJepbON0dTDmtzGXc1jdCg/0QTLW4GtEk+SkVzwNNVCPc3
 wVyybZKUPXsw1KogjSqwk3mKVHYh6/ok1MhwaLCjxdLQAPb3suTrxazbE6GBxF6Fx7DC
 aBsg==
X-Gm-Message-State: AGi0PuasV5r3De+JzLrsb5QXi6LhBojBJwX+FhF5yZ7Pw7dlRDqCtGf3
 UpAB6zKYKDVNvxro9lXwmLI=
X-Google-Smtp-Source: APiQypIL2mb0AsOw74PTQWltYRmp6EqRUULHHouBHJlKkcSXJ8xqpuUN0vTwvqnvAwHvRm5g5dfC8w==
X-Received: by 2002:a0c:b44c:: with SMTP id e12mr4722649qvf.30.1588973412489; 
 Fri, 08 May 2020 14:30:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id n13sm2578429qtf.15.2020.05.08.14.30.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 14:30:12 -0700 (PDT)
Subject: [PATCH v24 QEMU 3/3] virtio-balloon: Provide an interface for free
 page reporting
From: Alexander Duyck <alexander.duyck@gmail.com>
To: david@redhat.com, mst@redhat.com
Date: Fri, 08 May 2020 14:30:10 -0700
Message-ID: <20200508213010.26071.6318.stgit@localhost.localdomain>
In-Reply-To: <20200508212719.26071.94248.stgit@localhost.localdomain>
References: <20200508212719.26071.94248.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=alexander.duyck@gmail.com; helo=mail-qv1-xf2b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Duyck <alexander.h.duyck@linux.intel.com>

Add support for free page reporting. The idea is to function very similar
to how the balloon works in that we basically end up madvising the page as
not being used. However we don't really need to bother with any deflate
type logic since the page will be faulted back into the guest when it is
read or written to.

This provides a new way of letting the guest proactively report free
pages to the hypervisor, so the hypervisor can reuse them. In contrast to
inflate/deflate that is triggered via the hypervisor explicitly.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---
 hw/virtio/virtio-balloon.c         |   69 ++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-balloon.h |    2 +
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 1666132a24c1..53abba290274 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -321,6 +321,67 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
     balloon_stats_change_timer(s, 0);
 }
 
+static void virtio_balloon_handle_report(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIOBalloon *dev = VIRTIO_BALLOON(vdev);
+    VirtQueueElement *elem;
+
+    while ((elem = virtqueue_pop(vq, sizeof(VirtQueueElement)))) {
+        unsigned int i;
+
+        /*
+         * When we discard the page it has the effect of removing the page
+         * from the hypervisor itself and causing it to be zeroed when it
+         * is returned to us. So we must not discard the page if it is
+         * accessible by another device or process, or if the guest is
+         * expecting it to retain a non-zero value.
+         */
+        if (qemu_balloon_is_inhibited() || dev->poison_val) {
+            goto skip_element;
+        }
+
+        for (i = 0; i < elem->in_num; i++) {
+            void *addr = elem->in_sg[i].iov_base;
+            size_t size = elem->in_sg[i].iov_len;
+            ram_addr_t ram_offset;
+            RAMBlock *rb;
+
+            /*
+             * There is no need to check the memory section to see if
+             * it is ram/readonly/romd like there is for handle_output
+             * below. If the region is not meant to be written to then
+             * address_space_map will have allocated a bounce buffer
+             * and it will be freed in address_space_unmap and trigger
+             * and unassigned_mem_write before failing to copy over the
+             * buffer. If more than one bad descriptor is provided it
+             * will return NULL after the first bounce buffer and fail
+             * to map any resources.
+             */
+            rb = qemu_ram_block_from_host(addr, false, &ram_offset);
+            if (!rb) {
+                trace_virtio_balloon_bad_addr(elem->in_addr[i]);
+                continue;
+            }
+
+            /*
+             * For now we will simply ignore unaligned memory regions, or
+             * regions that overrun the end of the RAMBlock.
+             */
+            if (!QEMU_IS_ALIGNED(ram_offset | size, qemu_ram_pagesize(rb)) ||
+                (ram_offset + size) > qemu_ram_get_used_length(rb)) {
+                continue;
+            }
+
+            ram_block_discard_range(rb, ram_offset, size);
+        }
+
+skip_element:
+        virtqueue_push(vq, elem, 0);
+        virtio_notify(vdev, vq);
+        g_free(elem);
+    }
+}
+
 static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOBalloon *s = VIRTIO_BALLOON(vdev);
@@ -841,6 +902,12 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
             virtio_error(vdev, "iothread is missing");
         }
     }
+
+    if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_REPORTING)) {
+        s->reporting_vq = virtio_add_queue(vdev, 32,
+                                           virtio_balloon_handle_report);
+    }
+
     reset_stats(s);
 }
 
@@ -945,6 +1012,8 @@ static Property virtio_balloon_properties[] = {
                     VIRTIO_BALLOON_F_FREE_PAGE_HINT, false),
     DEFINE_PROP_BIT("page-poison", VirtIOBalloon, host_features,
                     VIRTIO_BALLOON_F_PAGE_POISON, true),
+    DEFINE_PROP_BIT("free-page-reporting", VirtIOBalloon, host_features,
+                    VIRTIO_BALLOON_F_REPORTING, false),
     /* QEMU 4.0 accidentally changed the config size even when free-page-hint
      * is disabled, resulting in QEMU 3.1 migration incompatibility.  This
      * property retains this quirk for QEMU 4.1 machine types.
diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
index 3ca2a78e1aca..28fd2b396087 100644
--- a/include/hw/virtio/virtio-balloon.h
+++ b/include/hw/virtio/virtio-balloon.h
@@ -42,7 +42,7 @@ enum virtio_balloon_free_page_hint_status {
 
 typedef struct VirtIOBalloon {
     VirtIODevice parent_obj;
-    VirtQueue *ivq, *dvq, *svq, *free_page_vq;
+    VirtQueue *ivq, *dvq, *svq, *free_page_vq, *reporting_vq;
     uint32_t free_page_hint_status;
     uint32_t num_pages;
     uint32_t actual;


