Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A70613798
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:14:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIL-0001wE-9g; Mon, 31 Oct 2022 08:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHv-0007gQ-1f
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHn-0002td-4v
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9TiK/twTV1XSaiRhUn6axecxwXVlXGBefrK4mR0z22I=;
 b=OxIqi5inb3x7P47I1D+ufRhWJQAl69NQSB0I1tmONErMT5zSqfG525NqkNjgTI3bK8bPG0
 tIeDa4lgUFIhbFrXv1ohmBW3Xd73Sc1iTN/YK4+wM5Z4mmAn6aYaN5TP58oSbe9BdCxCOP
 gskB24AAf5fXZaZf8WmyD71uQYFUXRM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-Q6Gp2xB9MMyn-rGwU8fY-w-1; Mon, 31 Oct 2022 08:53:01 -0400
X-MC-Unique: Q6Gp2xB9MMyn-rGwU8fY-w-1
Received: by mail-wr1-f71.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so3047353wrg.21
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9TiK/twTV1XSaiRhUn6axecxwXVlXGBefrK4mR0z22I=;
 b=trDN59INXNMofY9mayflOQds963tzxkg6Ev2Nk+CL+OPoMl6VTharOm7d35Cz3+Q04
 VbDRpTf58k+1OUTGFpewBFhqt325+jMeOGuE8lyJZ4tHukJa+PWt58n23iOlIMemG5KY
 DmjBkheyGqqKwMo4pyFQRpspY8sLGTMQrDlf2GTjPiRzFxGo5MebW3CECz1T5i3QddSD
 kiw2WhV65zPFKb1YP4MLNmGVKfrrFRoc1Dih3TkyQdBjbV1Cg1fOmtYzKUaIz5EnP64X
 RsF/JU3LVvGOr74J2/f7zhr8pJKnfWb81HdRRo4rkq8U2hxG+SSesTf6b4A0CVLPPuH6
 iH3Q==
X-Gm-Message-State: ACrzQf3ZxG/WPEc+sCMZu9kFiP7ptDHD+mM/gCUPbOlq8I1lFuQaWlQx
 8pKNIUaw6mXLglXlqQaJ/jPLKfLCcjzg6iHQVCAtyfCXIv7sbbcsROx/K7M11Ed6kwnGKBVGvDt
 uQuI/lYvncOgdTChJ4hkvWibvQN0+DAod1Sg2dS25079nx4qdp1fpk/HyunOX
X-Received: by 2002:a05:6000:1201:b0:236:61f4:b384 with SMTP id
 e1-20020a056000120100b0023661f4b384mr7683181wrx.505.1667220779830; 
 Mon, 31 Oct 2022 05:52:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zXpAml/I/7P0RPT82NEWHTYPdW5F9l5Xp05x+KsBGiGBQJEvekAmCpUkwkCf83hx3PHSnaw==
X-Received: by 2002:a05:6000:1201:b0:236:61f4:b384 with SMTP id
 e1-20020a056000120100b0023661f4b384mr7683157wrx.505.1667220779510; 
 Mon, 31 Oct 2022 05:52:59 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c4e9000b003cf568a736csm5260213wmq.20.2022.10.31.05.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:59 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 47/86] virtio-net: introduce flush_or_purge_queued_packets()
Message-ID: <20221031124928.128475-48-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
index e9f696b4cf..4ace57fa6d 100644
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


