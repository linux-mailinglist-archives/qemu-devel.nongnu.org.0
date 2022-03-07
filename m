Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD11A4CF9A7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:11:38 +0100 (CET)
Received: from localhost ([::1]:45074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAL3-00089Y-SJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:11:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACM-0001Vw-3R
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACK-0002mt-Dd
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoEIyJ3M3ZHGIXoolRVwuQOGPFG25A4XAUBq+1r+Ueo=;
 b=VvhWWZVtOu7l4zAXyE3l2OGZKYNCIzsauuN+YVt5grVn4L3dz8YghR56sM8W4iV5aj9t6k
 xuIBOtHhNN9Hzbzb0k7WkkZpHRUTOBdrikIVMdfbdFRDvw44e68Fl+K19EG6uoWPMFDDmx
 trQsaVc4wpQjDUjUQ74ij/L3r8dReD0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-c-fkgstjNMiroebUjZGAdw-1; Mon, 07 Mar 2022 05:02:35 -0500
X-MC-Unique: c-fkgstjNMiroebUjZGAdw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020aa7c711000000b00415ecaefd07so5955557edq.21
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SoEIyJ3M3ZHGIXoolRVwuQOGPFG25A4XAUBq+1r+Ueo=;
 b=qer8GsIzHuvVuHcaQUIlf/8e5QgDjQzF5zNA/Bbk5pD6fC6CjCptKvYrQT5QP5d52t
 hCsYHeHGLnBPkNGy4pzLtgJ3eN6YqIyH/LGqOQlBbtaujfUXd4aPCelWslfeV0pw6Xgw
 gDx2ZFHAw71kxRtm4VRCSPlT//p8qKJU/qJcr6w97WVI6p1gPgmVtjmVYdHXASR32PxS
 ZDh+qGzAfermCsGHnlSq56TPOHRDcKgQGuI3Tu605mEpzEc3rzug/4P3DoWwy+9BEecK
 Gb1JeqC1ErXZqN6MO2goXqF0j8uhi0En98Ltv0EGFDWlK6xHuBSGRIuVSIgxmSk+5Tc3
 xPbg==
X-Gm-Message-State: AOAM533RS+Ws/ObmRTnYlBcdMNKiNoz6PXyqcIeyC4hqpMl4BXUJnSrB
 VsTxxw61sCyguxwIdsd1k/lDybbBFmaJVsTdptha1zw4awOU0a+8Pw33iyZVSkr3jf4+VJzli6n
 UmAqhjnPAebqQ/8VwoeEyLievkoUxZ85fxMHay3Y6tUCwPrnffAq7JyuGM8Oi
X-Received: by 2002:a17:906:689:b0:6da:a1f0:a7a7 with SMTP id
 u9-20020a170906068900b006daa1f0a7a7mr8682577ejb.189.1646647353471; 
 Mon, 07 Mar 2022 02:02:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykTiL/xNoGYGJxRsOd8YtsgIuXdUVvVnaJgVsynik+uDIgRhUBHEiPzLApxHZ4DyBwrb85eg==
X-Received: by 2002:a17:906:689:b0:6da:a1f0:a7a7 with SMTP id
 u9-20020a170906068900b006daa1f0a7a7mr8682549ejb.189.1646647353165; 
 Mon, 07 Mar 2022 02:02:33 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 gb2-20020a170907960200b006dac65a914esm3127576ejc.125.2022.03.07.02.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:32 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 23/47] virtio-net: Unlimit tx queue size if peer is vdpa
Message-ID: <20220307100058.449628-24-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

The code used to limit the maximum size of tx queue for others backends
than vhost_user since the introduction of configurable tx queue size in
9b02e1618cf2 ("virtio-net: enable configurable tx queue size").

As vhost_user, vhost_vdpa devices should deal with memory region
crosses already, so let's use the full tx size.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20220217175029.2517071-1-eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index cf8ab0f8af..b02a0632df 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -628,17 +628,20 @@ static int virtio_net_max_tx_queue_size(VirtIONet *n)
     NetClientState *peer = n->nic_conf.peers.ncs[0];
 
     /*
-     * Backends other than vhost-user don't support max queue size.
+     * Backends other than vhost-user or vhost-vdpa don't support max queue
+     * size.
      */
     if (!peer) {
         return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
     }
 
-    if (peer->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
+    switch(peer->info->type) {
+    case NET_CLIENT_DRIVER_VHOST_USER:
+    case NET_CLIENT_DRIVER_VHOST_VDPA:
+        return VIRTQUEUE_MAX_SIZE;
+    default:
         return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
-    }
-
-    return VIRTQUEUE_MAX_SIZE;
+    };
 }
 
 static int peer_attach(VirtIONet *n, int index)
-- 
MST


