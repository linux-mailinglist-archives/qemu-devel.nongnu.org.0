Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B396203B0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:22:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxN-0001vB-Vu; Mon, 07 Nov 2022 17:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAx2-0001hu-Rp
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwz-0003wu-TT
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86mB4VRuELy+aXvTC76TKdS8NF61AriuuUX2BHwXz70=;
 b=DFJJId+W/OLwCEj8MjsMe2+TyEx6C7t5A3Auwinn/lhC+HZ7eBpkofXHZ0tahV0BBfxV1o
 Y+DN9xf+X1XWKh4nbuYmuIpG8htK9FnVU9CP/rgeGD8IQcimhgbDYCkkcz7KoZjB/rge85
 vN3PaBI4PA2FKOxLQ3ySU3WLnXdAK1g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-prptlsXYPGmfoxWkKNyIBA-1; Mon, 07 Nov 2022 17:50:39 -0500
X-MC-Unique: prptlsXYPGmfoxWkKNyIBA-1
Received: by mail-qk1-f199.google.com with SMTP id
 bp10-20020a05620a458a00b006fa29f253dcso11288368qkb.11
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=86mB4VRuELy+aXvTC76TKdS8NF61AriuuUX2BHwXz70=;
 b=kGiSHt/Ooar2sFZsUgX1hrNGwyXfZ4aq0cV/f87meADgb5zhbIoqLPZECRNf6zsner
 qGAo2k6bcZuDZwRuqUm35MOckrMAN5Zc9deulus7HzVMn99Wp8caIY9BzS/dctXoCljL
 2HBSbOkzlL0+KEu+TirqUoG5JELxXNQJ2bgz/mjMBsebiv81/bmNFNj1+j6BCh30CDNt
 D91gt2sA3bhc9qA+BzOpiMFF7HTfRVPLSHOLrayYKC/iB7iMPj1cJG6ewu7rWw0sm2wz
 3IaygePahpiwuoLLh/ZlTFAxYW2IRx/LTlUIbCO8nOO6AYwyRjE2xLeXdN/dnbrBXP/q
 MHzQ==
X-Gm-Message-State: ACrzQf1h8FBEixyx1Ksr4KOwe/o7ksw/5tepxeaDQ5aUs6BkI3aBO0V4
 zcUfVKMT1nTmR811S1JogR0PjOqRNV0jFVfnL02Fs9mQHlelcfTfFAnya8bhHmEeX61ZybFUxCJ
 Fan48UWuu3bg5nbw75lqMyDXANrVl7qsMklPNMps/SAvA79i0yF8UpUaCWqac
X-Received: by 2002:a05:620a:448d:b0:6cf:2a95:a10c with SMTP id
 x13-20020a05620a448d00b006cf2a95a10cmr37941420qkp.526.1667861438401; 
 Mon, 07 Nov 2022 14:50:38 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5VdV92udvk93f0KPWyifxxpbUlofg7THPyrFb5OyYVbGSTo5OHW24y0QpP7e03HVy291LPzA==
X-Received: by 2002:a05:620a:448d:b0:6cf:2a95:a10c with SMTP id
 x13-20020a05620a448d00b006cf2a95a10cmr37941396qkp.526.1667861438083; 
 Mon, 07 Nov 2022 14:50:38 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 q17-20020a37f711000000b006e07228ed53sm7680677qkj.18.2022.11.07.14.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:37 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 37/83] virtio-net: introduce flush_or_purge_queued_packets()
Message-ID: <20221107224600.934080-38-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


