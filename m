Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297952844B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:38:02 +0200 (CEST)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZz7-0008Pd-8N
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9u-000302-MZ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9s-00061R-Rm
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aSSn6J2pR6GttKScmMrHWuvnpYYNy9y4ulKu7u6GGsk=;
 b=IhKAFshnL3bkQG51udjCYJic9UKivbfqD8aRD1H2HRCvO4tBeBEks6MOeRdWztdC8B49RI
 8VsAyAdb/t9ORkt0Qsz9oDemnItlV6IaOmnWLV9VE6zvM562RMyUqFKALNOdpr4sLRbBFD
 pOQ4Ed8ztQXXGDlCDwgRB60djf51g0M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-tKXCbldnMNa765Kb9Y7aSg-1; Mon, 16 May 2022 06:40:58 -0400
X-MC-Unique: tKXCbldnMNa765Kb9Y7aSg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so10155345wmq.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aSSn6J2pR6GttKScmMrHWuvnpYYNy9y4ulKu7u6GGsk=;
 b=OhqRScuvTPZYI183MUCS0ts3e4xnZl3KfxcW8UAC51zTolkcHS5wC1W9wKEw6qkeNV
 xc/CSox79aGNoayclccxiYRkdqFsgb0QqisitDGZ2llVpYur2OrRUWCKLlNCIpC/RDxb
 /Keb5IgMht1UBmCwwlReyVa0J7uSKz+LouyigKs/2HXH7ZIQCTnXcR72Ggxg5m9NgtM/
 FEo2wDn7w3pV2n5A4ZNDfc+gUfrZphcAQatFZdb95zg1ayF6CGzTuYmeJggnx78WR1sR
 W3UV/o0c2o4K/sUZbeuBpiMGvO+ibsNj2XbPI1k9sFDFs1X1bzCp7CIWwG8t/asm7LCP
 NsmA==
X-Gm-Message-State: AOAM530xU0G5IW0p+cS2CfPSiclUYN+9X7YqjEsgYrpgpsOOEiYQYxyq
 qR6tnj5dK+12TdqR8fSMpGMgZ8JO2vG5SJOsnpTEV7KVLjfpHFwNTpAKXQIfTCXpVRwk8zUwqeV
 j/JH8DZAEuzVafw0GbGIxumlfpE5LgdnamfxrH5Di5LMwt/Nwo05sQEnu9yCt
X-Received: by 2002:adf:fd8b:0:b0:20d:e8e:4df5 with SMTP id
 d11-20020adffd8b000000b0020d0e8e4df5mr1285934wrr.117.1652697657093; 
 Mon, 16 May 2022 03:40:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8QjoilzKL6tg2R1+fpvrdFu2JtxfQLqBv/AnlsZF5dEB880PSAWCM8VMxmWLxEE6rhIvvxw==
X-Received: by 2002:adf:fd8b:0:b0:20d:e8e:4df5 with SMTP id
 d11-20020adffd8b000000b0020d0e8e4df5mr1285908wrr.117.1652697656802; 
 Mon, 16 May 2022 03:40:56 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 y2-20020a05600c364200b00394699f803dsm12841581wmq.46.2022.05.16.03.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:56 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 91/91] virtio-net: don't handle mq request in userspace
 handler for vhost-vdpa
Message-ID: <20220516095448.507876-92-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Si-Wei Liu <si-wei.liu@oracle.com>

virtio_queue_host_notifier_read() tends to read pending event
left behind on ioeventfd in the vhost_net_stop() path, and
attempts to handle outstanding kicks from userspace vq handler.
However, in the ctrl_vq handler, virtio_net_handle_mq() has a
recursive call into virtio_net_set_status(), which may lead to
segmentation fault as shown in below stack trace:

0  0x000055f800df1780 in qdev_get_parent_bus (dev=0x0) at ../hw/core/qdev.c:376
1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled (vdev=vdev@entry=0x0) at ../hw/virtio/virtio-bus.c:331
2  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>) at ../hw/virtio/vhost.c:318
3  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>, buffer=0x7fc19bec5240, len=2052, is_write=1, access_len=2052) at ../hw/virtio/vhost.c:336
4  0x000055f800d71867 in vhost_virtqueue_stop (dev=dev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590, vq=0x55f8037cceb0, idx=0) at ../hw/virtio/vhost.c:1241
5  0x000055f800d7406c in vhost_dev_stop (hdev=hdev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590) at ../hw/virtio/vhost.c:1839
6  0x000055f800bf00a7 in vhost_net_stop_one (net=0x55f8037ccc30, dev=0x55f8044ec590) at ../hw/net/vhost_net.c:315
7  0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:423
8  0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
9  0x000055f800d4e628 in virtio_net_set_status (vdev=vdev@entry=0x55f8044ec590, status=15 '\017') at ../hw/net/virtio-net.c:370
10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=<optimized out>, iov=<optimized out>, cmd=0 '\000', n=0x55f8044ec590) at ../hw/net/virtio-net.c:1408
11 0x000055f800d534d8 in virtio_net_handle_ctrl (vdev=0x55f8044ec590, vq=0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
12 0x000055f800d69f37 in virtio_queue_host_notifier_read (vq=0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
13 0x000055f800d69f37 in virtio_queue_host_notifier_read (n=n@entry=0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier (bus=<optimized out>, n=n@entry=14) at ../hw/virtio/virtio-bus.c:312
15 0x000055f800d73106 in vhost_dev_disable_notifiers (hdev=hdev@entry=0x55f8035b51b0, vdev=vdev@entry=0x55f8044ec590)
   at ../../../include/hw/virtio/virtio-bus.h:35
16 0x000055f800bf00b2 in vhost_net_stop_one (net=0x55f8035b51b0, dev=0x55f8044ec590) at ../hw/net/vhost_net.c:316
17 0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:423
18 0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
19 0x000055f800d4e628 in virtio_net_set_status (vdev=0x55f8044ec590, status=15 '\017') at ../hw/net/virtio-net.c:370
20 0x000055f800d6c4b2 in virtio_set_status (vdev=0x55f8044ec590, val=<optimized out>) at ../hw/virtio/virtio.c:1945
21 0x000055f800d11d9d in vm_state_notify (running=running@entry=false, state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
22 0x000055f800d04e7a in do_vm_stop (state=state@entry=RUN_STATE_SHUTDOWN, send_stop=send_stop@entry=false) at ../softmmu/cpus.c:262
23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
24 0x000055f800d126af in qemu_cleanup () at ../softmmu/runstate.c:812
25 0x000055f800ad5b13 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:51

For now, temporarily disable handling MQ request from the ctrl_vq
userspace hanlder to avoid the recursive virtio_net_set_status()
call. Some rework is needed to allow changing the number of
queues without going through a full virtio_net_set_status cycle,
particularly for vhost-vdpa backend.

This patch will need to be reverted as soon as future patches of
having the change of #queues handled in userspace is merged.

Fixes: 402378407db ("vhost-vdpa: multiqueue support")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <1651890498-24478-8-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index ccfb2f3761..9f1d0b3b42 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1428,6 +1428,7 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     uint16_t queue_pairs;
+    NetClientState *nc = qemu_get_queue(n->nic);
 
     virtio_net_disable_rss(n);
     if (cmd == VIRTIO_NET_CTRL_MQ_HASH_CONFIG) {
@@ -1459,6 +1460,18 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
         return VIRTIO_NET_ERR;
     }
 
+    /* Avoid changing the number of queue_pairs for vdpa device in
+     * userspace handler. A future fix is needed to handle the mq
+     * change in userspace handler with vhost-vdpa. Let's disable
+     * the mq handling from userspace for now and only allow get
+     * done through the kernel. Ripples may be seen when falling
+     * back to userspace, but without doing it qemu process would
+     * crash on a recursive entry to virtio_net_set_status().
+     */
+    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        return VIRTIO_NET_ERR;
+    }
+
     n->curr_queue_pairs = queue_pairs;
     /* stop the backend before changing the number of queue_pairs to avoid handling a
      * disabled queue */
-- 
MST


