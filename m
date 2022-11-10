Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52944624C8B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 22:07:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otEl1-0005bo-J1; Thu, 10 Nov 2022 16:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEkx-0005an-Sn
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:06:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEkw-0005lh-35
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668114397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fYyyJ4Ve4Y4kmza5yOzDSeKWNwn1L8uYdfhTgrW7BRg=;
 b=btDZk3i6DGJ3XR98DYeae9W/inczmT1s6tgb+N7GMWmJYLKU4M5jPSuPEdL56Ell6y4HTS
 RqGWG88hlXAlZkMjEdP4qS7Vjg1vvxwQmQciAR7kF/1fsKav07DL8PE7HzSEtu7X+uKu2t
 N0osPXQrOs8cE8MuePT0SBDPG6m80QY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-Av7tGkTZMUGLBrqiiE3huw-1; Thu, 10 Nov 2022 16:06:36 -0500
X-MC-Unique: Av7tGkTZMUGLBrqiiE3huw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfa287000000b00236c367fcddso645762wra.6
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 13:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYyyJ4Ve4Y4kmza5yOzDSeKWNwn1L8uYdfhTgrW7BRg=;
 b=hFI1aoJqSVYiIVF9zVyyfUmzP0beTn8aNlHveeN9lx4voa3/8HR2PF6CWtgA6Zzt1q
 K0Ospa1AGubk7N4jTfTDoZYB+QItDh97eSb4ZeW2bZmKkK4HzvxHXl+dPggIOx6DpOYh
 uPQ9DGyUJGoWXpPpD1NP1tQW0xSQZrkq/IFUtLrYENwBDYdOFLExQFRQseLlWaXKqyRa
 CmCiLp/gT2MHwgxNKHJLvtcHTw0zhwiXjJovBTwPsnEbyOaoT1svtxdKKkOs4cn74Wsy
 QoB4DsQPCIruuZWurnJb163nd7MPghfpMX/WuIrvwp92Rcl2v9o3Oq0kbLbwP+bcumxi
 uUAA==
X-Gm-Message-State: ACrzQf3/RKYF0IVELowkwwSNOxZ1DNcTMHB+A0uSZqrrJzW+A0gCy/2w
 hfuoae8Au1OreCeUlwO0b5BMO9GY552qo264cXz05ZWaRP1QAbg36pi/mxJHGG3UgiHn1VZWPQx
 s9QPdGFxgJUryt47nzYs4pjm+xHvDRL5NbZST9uj0F3E9xzyLIwn/lCZ3FTkC
X-Received: by 2002:a5d:40cc:0:b0:22e:ed53:771c with SMTP id
 b12-20020a5d40cc000000b0022eed53771cmr1119615wrq.297.1668114394685; 
 Thu, 10 Nov 2022 13:06:34 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7JSFiFdhHIYn+DQOQ+JIQKScTU8XCd2GE9BkqzycT/Zp5ACXNKrc+JO15+F2n1Aeg1lvqRRg==
X-Received: by 2002:a5d:40cc:0:b0:22e:ed53:771c with SMTP id
 b12-20020a5d40cc000000b0022eed53771cmr1119607wrq.297.1668114394414; 
 Thu, 10 Nov 2022 13:06:34 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfe948000000b002366553eca7sm136103wrn.83.2022.11.10.13.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 13:06:33 -0800 (PST)
Date: Thu, 10 Nov 2022 16:06:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Alexander Bulekov <alxndr@bu.edu>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 3/3] virtio-net: fix for heap-buffer-overflow
Message-ID: <20221110210428.137015-4-mst@redhat.com>
References: <20221110210428.137015-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110210428.137015-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Run shell script:

    cat << EOF | valgrind qemu-system-i386 -display none -machine accel=qtest, -m \
    512M -M q35 -nodefaults -device virtio-net,netdev=net0 -netdev \
    user,id=net0 -qtest stdio
    outl 0xcf8 0x80000810
    outl 0xcfc 0xc000
    outl 0xcf8 0x80000804
    outl 0xcfc 0x01
    outl 0xc00d 0x0200
    outl 0xcf8 0x80000890
    outb 0xcfc 0x4
    outl 0xcf8 0x80000889
    outl 0xcfc 0x1c000000
    outl 0xcf8 0x80000893
    outw 0xcfc 0x100
    EOF

Got:
    ==68666== Invalid read of size 8
    ==68666==    at 0x688536: virtio_net_queue_enable (virtio-net.c:575)
    ==68666==    by 0x6E31AE: memory_region_write_accessor (memory.c:492)
    ==68666==    by 0x6E098D: access_with_adjusted_size (memory.c:554)
    ==68666==    by 0x6E4DB3: memory_region_dispatch_write (memory.c:1521)
    ==68666==    by 0x6E31AE: memory_region_write_accessor (memory.c:492)
    ==68666==    by 0x6E098D: access_with_adjusted_size (memory.c:554)
    ==68666==    by 0x6E4DB3: memory_region_dispatch_write (memory.c:1521)
    ==68666==    by 0x6EBCD3: flatview_write_continue (physmem.c:2820)
    ==68666==    by 0x6EBFBF: flatview_write (physmem.c:2862)
    ==68666==    by 0x6EF5E7: address_space_write (physmem.c:2958)
    ==68666==    by 0x6DFDEC: cpu_outw (ioport.c:70)
    ==68666==    by 0x6F6DF0: qtest_process_command (qtest.c:480)
    ==68666==  Address 0x29087fe8 is 24 bytes after a block of size 416 in arena "client"

That is reported by Alexander Bulekov. https://gitlab.com/qemu-project/qemu/-/issues/1309

Here, the queue_index is the index of the cvq, but in some cases cvq
does not have the corresponding NetClientState, so overflow appears.

I add a check here, ignore illegal queue_index and cvq queue_index.

Note the queue_index is below the VIRTIO_QUEUE_MAX but greater or equal
than cvq index could hit this. Other devices are similar.

Fixes: 7f863302 ("virtio-net: support queue_enable")
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1309
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-Id: <20221110095739.130393-1-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h |  2 ++
 hw/net/virtio-net.c        | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 141a253a2c..a973811cbf 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -148,7 +148,9 @@ struct VirtioDeviceClass {
     void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
     void (*reset)(VirtIODevice *vdev);
     void (*set_status)(VirtIODevice *vdev, uint8_t val);
+    /* Device must validate queue_index.  */
     void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
+    /* Device must validate queue_index.  */
     void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
     /* For transitional devices, this is a bitmap of features
      * that are only exposed on the legacy interface but not
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 8b32339b76..aba12759d5 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -549,7 +549,14 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
 static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+    NetClientState *nc;
+
+    /* validate queue_index and skip for cvq */
+    if (queue_index >= n->max_queue_pairs * 2) {
+        return;
+    }
+
+    nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
 
     if (!nc->peer) {
         return;
@@ -566,9 +573,16 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
 static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+    NetClientState *nc;
     int r;
 
+    /* validate queue_index and skip for cvq */
+    if (queue_index >= n->max_queue_pairs * 2) {
+        return;
+    }
+
+    nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
+
     if (!nc->peer || !vdev->vhost_started) {
         return;
     }
-- 
MST


