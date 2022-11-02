Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37171616879
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:22:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGK3-0007yz-PF; Wed, 02 Nov 2022 12:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGK2-0007uu-AC
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGK0-00034y-Og
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86mB4VRuELy+aXvTC76TKdS8NF61AriuuUX2BHwXz70=;
 b=FZ0mIrmm4z28/dRRj46BNmE8+Vv4+7i0A+2MWckG/qdppWSaZ8Dl2GYRuR4Udv33f9893I
 qys66yYQDbfrFHe/ZV9jAsUEYfPzgSHIte1g4bffCLCJ/Tey1UKh1gpJAaiy4CEZgoOAhC
 WL3el1kNIOj761t+i8SrWgg78g3RHLo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-bfLKg5HnPGmT_ENI7JXHZg-1; Wed, 02 Nov 2022 12:10:30 -0400
X-MC-Unique: bfLKg5HnPGmT_ENI7JXHZg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so5013489wra.15
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86mB4VRuELy+aXvTC76TKdS8NF61AriuuUX2BHwXz70=;
 b=d3JD1Qq3fooFXgndj9YmbIQoHgHoiEmaXrUb/Xbbg/qa+D3jB/ut1XKJQniDWpnQdG
 YknuqUMsD+u/131RkEoFkQCyYJbJ/uWPX8/GsernrW1b1JMHtKUn2FCmZ5A5tnWXVIUo
 KGuObFJtdRIb6QQ+XMQ/+yeZZ2WGBtT/Huvf+GDljcYNTxH6t4e9H31DU3kpwFp2MaRm
 VyeSD6imNrgDpTA5F99CRU0QY1xAk7k/isKqXqPUWpRFY31X9pMMOViKnK4fX/31Z2Eu
 SRha4fnx7QbLaHn1QbPRluD0qIE2YeUlKPoFZ7caOeE32riCpUl0KIHWFbKe/bSppkpC
 aBNw==
X-Gm-Message-State: ACrzQf0eHsrHVa0xDizH1mtuG/OIHlUsqnKSia+BpQEnjqFqtkB+WZOR
 152pbp6xA7wGn6xsFYSGyfiXTxkxBqfToLx0sj4zxEcnvbn6D0PZ6JrvDXowGAhDx8AWhOupsWP
 cgDQ3Wt4kmJL6gGGsXuIx20Xfl4hJn0nSDEN9+8f9YpUJvxR7mqueeKwtmfZw
X-Received: by 2002:a05:600c:3550:b0:3cf:4c20:5856 with SMTP id
 i16-20020a05600c355000b003cf4c205856mr16403435wmq.188.1667405429447; 
 Wed, 02 Nov 2022 09:10:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5njBzuMMlFebOUFkq2+P/vt5v9nn2oDn4ou3VfbexnbEeVORhgcoOjfSq8LFWdDeNAX8v3aw==
X-Received: by 2002:a05:600c:3550:b0:3cf:4c20:5856 with SMTP id
 i16-20020a05600c355000b003cf4c205856mr16403394wmq.188.1667405429024; 
 Wed, 02 Nov 2022 09:10:29 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bi22-20020a05600c3d9600b003c6c3fb3cf6sm2782069wmb.18.2022.11.02.09.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:28 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 45/82] virtio-net: introduce flush_or_purge_queued_packets()
Message-ID: <20221102160336.616599-46-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Introduce the fucntion flush_or_purge_queued_packets(), it will be
used in device reset and virtqueue reset. Therefore, we extract the
common logic as a new function.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-12-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b6903aea54..038a6fba7c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -124,6 +124,16 @@ static int vq2q(int queue_index)
     return queue_index / 2;
 }
 
+static void flush_or_purge_queued_packets(NetClientState *nc)
+{
+    if (!nc->peer) {
+        return;
+    }
+
+    qemu_flush_or_purge_queued_packets(nc->peer, true);
+    assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
+}
+
 /* TODO
  * - we could suppress RX interrupt if we were so inclined.
  */
@@ -566,12 +576,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
 
     /* Flush any async TX */
     for (i = 0;  i < n->max_queue_pairs; i++) {
-        NetClientState *nc = qemu_get_subqueue(n->nic, i);
-
-        if (nc->peer) {
-            qemu_flush_or_purge_queued_packets(nc->peer, true);
-            assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
-        }
+        flush_or_purge_queued_packets(qemu_get_subqueue(n->nic, i));
     }
 }
 
-- 
MST


