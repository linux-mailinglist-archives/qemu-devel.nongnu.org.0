Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62656529304
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:41:41 +0200 (CEST)
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiTE-0004A5-EZ
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhko-0003e0-CS
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkm-000774-R5
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ykKNvWWeKNqjpuuIQ4HE4Tn62sQweh+Zh0RPTlHsSLs=;
 b=P7SS9AFA4rRGh27Fg4M07dkB4nZEyvL+JoPkRBGBjoneJwHyLsGIy7YPDvvSDN3L/M/dcd
 I3c1fEr/sw7SLOAt3vYsWxG595nLnUIZ44KEl0ja/8nMgT1p/1dLWKlZ8dl+jORon+0S9r
 4HamIOmDAHXy/fKRDc/dQdNtNIgw6zs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-aLp_OQjbOM-kg5jDgj2TSQ-1; Mon, 16 May 2022 16:55:42 -0400
X-MC-Unique: aLp_OQjbOM-kg5jDgj2TSQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l18-20020aa7d952000000b0042ab7be9adaso1914545eds.21
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ykKNvWWeKNqjpuuIQ4HE4Tn62sQweh+Zh0RPTlHsSLs=;
 b=10V3LtE8+VuidfkefmN/3Ih7d0XzDyjPfBEq6lS3MInzJ7rDEIM9dRa6WlSCbZIG/p
 2dQzlCH6taYvDDOrt5EWbL3mZalHvCvkpQwsSXIqqN2vh9xVmo6XvYtCSCAQS/aYwf85
 QdHSqiVUdgWGe6+CdmOGYdf+UbtlnDNbxS5mssYrCnT4A4zzwtaChgSrOwYSceQXBG3G
 JJ9BHxiThtqIWzLQSH9jeOz7jdGRoea2QLRlbUbJSs+5pkPYYBgEcQL2z0gHZwEVc97q
 8gpv3OrLDvtKbQcCGhtWbJELyqMHrZIhWbMZn7HZEMjNHGPTJNevFuBOQBIsdUMNELRI
 pfqw==
X-Gm-Message-State: AOAM533YTjfDQtMQGhCkFuWpqMNaZV2c/N9tn88AhSvuPeWWwpJbGpWN
 DcEXmLQ4nUbKxUscGsD7vCURSzWqQ76A9sWk0SMPOYIp5qobU04EIpBfNvC18FdY11jVwsBtQxo
 B641aOMkgdnkSJzYuiJkUp7A+9KHMHQ79J2D9cXTqOPC3GupUxQTvbXwfjrOY
X-Received: by 2002:a17:906:9c43:b0:6f3:a8be:af46 with SMTP id
 fg3-20020a1709069c4300b006f3a8beaf46mr16419709ejc.271.1652734540511; 
 Mon, 16 May 2022 13:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDRks9gemuxJzSYNjHuHi27IfjUekY4fas3I/8oglkB4vW7aTnpOeXXMy3vNGnmOoWjKAtFQ==
X-Received: by 2002:a17:906:9c43:b0:6f3:a8be:af46 with SMTP id
 fg3-20020a1709069c4300b006f3a8beaf46mr16419697ejc.271.1652734540276; 
 Mon, 16 May 2022 13:55:40 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 gz15-20020a170907a04f00b006f5294986besm167622ejc.111.2022.05.16.13.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:39 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 79/86] virtio-net: setup vhost_dev and notifiers for cvq
 only when feature is negotiated
Message-ID: <20220516204913.542894-80-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

When the control virtqueue feature is absent or not negotiated,
vhost_net_start() still tries to set up vhost_dev and install
vhost notifiers for the control virtqueue, which results in
erroneous ioctl calls with incorrect queue index sending down
to driver. Do that only when needed.

Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <1651890498-24478-2-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index a788f1c5c7..7545a16ed7 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     NetClientState *nc = qemu_get_queue(n->nic);
     int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
-    int cvq = n->max_ncs - n->max_queue_pairs;
+    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
+              n->max_ncs - n->max_queue_pairs : 0;
 
     if (!get_vhost_net(nc->peer)) {
         return;
-- 
MST


