Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC84CD614
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:12:32 +0100 (CET)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8fX-0004BP-9t
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89r-0001ml-Ql
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89p-0000b5-EA
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2MmbtRN8dUw8oStDJevhrQCWdjKFEsw6VGH8lAmLmm4=;
 b=K8P6HDWCxncmjlwKBaZjXJU3QDCvHBUUFMp9x8I27BSqb2obN/PLr7QkeduJMNK6/6jeUh
 Ldx4GYIO0Xde4cwwXmGnwkrzhUV9ffRX0KqNJ1/9TzA7UfOMCmLowJlHv5gtp9YUlR3Dr4
 HzgBo6R3UBbEci+GriYVL7V4d66hoLE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-n1WABH6vMlaEhkbeFUnZEw-1; Fri, 04 Mar 2022 08:39:43 -0500
X-MC-Unique: n1WABH6vMlaEhkbeFUnZEw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so4172113wme.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2MmbtRN8dUw8oStDJevhrQCWdjKFEsw6VGH8lAmLmm4=;
 b=nuj05/KoUnlSOcEZP8YDiNedl9vohebeHn2rz4tYeSH+yj2NjqZWPUjNH0ChzHwCB6
 b8z4mjDQlit0kUH4g7o9qpAgUVnLms+8o4QgkHKoTn0dk1y0JP62h08VNxST2YXLHJF9
 gHdLJss2pJ/VeqS4sRvUpuQBzxpjkv06B9uwJ/dsm2++rpr38vscVk3vgOxtxnZnknh7
 JCBda1OPyAsK2XTIYufHLH5354q7uCj1+XzYNTuuzosAPluC0Ft1bQqICSSmtPrqJq3Q
 ynuaKzd9Lg1CptxiBJliRgjZZrjaiuyylHaG7obAbbDKTzPJOJALEiK8hiHktncMuF7v
 WMcQ==
X-Gm-Message-State: AOAM533W3PIfYZ0yRMQESO4gJzR9suprZhxGYN0afZC8pKRXo9HfMoSJ
 wWfD+liFu2/hyKBHji6DCHSARI4wJyMB40Ulto+vjE1JAgWlayHgVl43Rew30yUzUvnCOfa4Egy
 ypQ498QLprCIeA8syIXdVlwuSn0IeuMOgAKR760xvH9aC+ZBEig288julDBvn
X-Received: by 2002:adf:df0a:0:b0:1f0:2140:1b41 with SMTP id
 y10-20020adfdf0a000000b001f021401b41mr11546978wrl.94.1646401182134; 
 Fri, 04 Mar 2022 05:39:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR5Le5DdBLqZZ/FMTnXXejhN72QuaczGtklV44igio/vB3rgtjpD1wQt17n3uE/l4TUybGqw==
X-Received: by 2002:adf:df0a:0:b0:1f0:2140:1b41 with SMTP id
 y10-20020adfdf0a000000b001f021401b41mr11546963wrl.94.1646401181911; 
 Fri, 04 Mar 2022 05:39:41 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 h188-20020a1c21c5000000b00385699a8993sm5418041wmh.11.2022.03.04.05.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:39:39 -0800 (PST)
Date: Fri, 4 Mar 2022 08:39:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/45] hw/virtio: vdpa: Fix leak of host-notifier memory-region
Message-ID: <20220304133556.233983-18-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, jasowang@redhat.com,
 qemu-stable@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

If call virtio_queue_set_host_notifier_mr fails, should free
host-notifier memory-region.

This problem can trigger a coredump with some vDPA drivers (mlx5,
but not with the vdpasim), if we unplug the virtio-net card from
the guest after a stop/start.

The same fix has been done for vhost-user:
  1f89d3b91e3e ("hw/virtio: Fix leak of host-notifier memory-region")

Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
Cc: jasowang@redhat.com
Resolves: https://bugzilla.redhat.com/2027208
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20220211170259.1388734-1-lvivier@redhat.com>
Cc: qemu-stable@nongnu.org
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 04ea43704f..11f696468d 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -431,6 +431,7 @@ static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
+        object_unparent(OBJECT(&n->mr));
         munmap(addr, page_size);
         goto err;
     }
-- 
MST


