Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC74CD6A8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:43:58 +0100 (CET)
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ99x-0002tp-ID
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:43:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8CZ-0005zm-NV
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8CX-0001J6-Eo
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9/XoSsKmPEouICygtljc84b9npXxSXtesafLfFcgh0k=;
 b=Ivlz2XY/55EseVecEemshW/f4MX+Lv5/KeJXOU4V+6+NAwH1JQSbc39dr8KxK1SSSEoCFh
 +FG5a+UqXyBA2q6HjjU5aLqhSscR0LNbBxxsvUec1rmdok2gSFG8XNJ+vhtcmkE3cIKVCe
 0Gmou8EqvyHTbxYgAWe8Y9wCkkPBwq4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-mLd1cRtnMvCNgtb9hk8frw-1; Fri, 04 Mar 2022 08:42:32 -0500
X-MC-Unique: mLd1cRtnMvCNgtb9hk8frw-1
Received: by mail-wm1-f71.google.com with SMTP id
 h206-20020a1c21d7000000b003552c13626cso4163166wmh.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9/XoSsKmPEouICygtljc84b9npXxSXtesafLfFcgh0k=;
 b=sx1CkA8SUWPnJPiPPcuInDZuv7cnr8+eI/GpKTWsufA0qDzH4sFO4r/WzVqn/nvBcD
 /Sb+sLCd0Qs7N9yVVVTQuh3qdtKvI0/BEGhjBr7hwHUHPE/DTOFe17K9sdGTiNAUHE6G
 Wy+2GivCDjgd3sMgcdP0GTj/pjc27W9rc0R9+BhGLzfFmsLvwHXnnXQ/vpLJBk6E27rf
 qyl6OvSnS8u0TicyRDN5dVvQP8Yu2Sqj2ccEje9QklQXkezTOkiILRxxnvhPdj1DmJmv
 woHhezEesKITPBPTXVmvamFP4kjj5r4p6YowXZLBNPKA6Ki/ZzsfKJ0byXa6gcsOq94d
 ZLFw==
X-Gm-Message-State: AOAM532LIHFgUZ4QT/jy4ZUrrEUfR3vs4N+wrWPvFTZBNHBP1v8y1+Tk
 gP12icQ+P0kChNcqUUICBA6LXETErydNc8gqTXdSmDHj+X0ubNz6DakMrH5rBnIjBU7AV9nwVFM
 Dnxv7yegHu3QcvbudF8Fvi/F69m/WAowm56iqofHVrGDva+NeX3S3GXxysPlR
X-Received: by 2002:adf:f50b:0:b0:1f1:d713:34a1 with SMTP id
 q11-20020adff50b000000b001f1d71334a1mr837006wro.506.1646401350450; 
 Fri, 04 Mar 2022 05:42:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2joQYA8cSC8pMBetEeuEI7Q7SZn5fSGuXAEmv/uosBL0WTLjsSQmmjJrU9uOILAnROpaW9g==
X-Received: by 2002:adf:f50b:0:b0:1f1:d713:34a1 with SMTP id
 q11-20020adff50b000000b001f1d71334a1mr836975wro.506.1646401350133; 
 Fri, 04 Mar 2022 05:42:30 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 f13-20020adff8cd000000b001f03439743fsm4712911wrq.75.2022.03.04.05.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:42:25 -0800 (PST)
Date: Fri, 4 Mar 2022 08:42:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/45] vhost-vsock: detach the virqueue element in case of error
Message-ID: <20220304133556.233983-41-mst@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: VictorV <vv474172261@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

In vhost_vsock_common_send_transport_reset(), if an element popped from
the virtqueue is invalid, we should call virtqueue_detach_element() to
detach it from the virtqueue before freeing its memory.

Fixes: fc0b9b0e1c ("vhost-vsock: add virtio sockets device")
Fixes: CVE-2022-26354
Cc: qemu-stable@nongnu.org
Reported-by: VictorV <vv474172261@gmail.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20220228095058.27899-1-sgarzare@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vsock-common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 3f3771274e..ed706681ac 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -153,19 +153,23 @@ static void vhost_vsock_common_send_transport_reset(VHostVSockCommon *vvc)
     if (elem->out_num) {
         error_report("invalid vhost-vsock event virtqueue element with "
                      "out buffers");
-        goto out;
+        goto err;
     }
 
     if (iov_from_buf(elem->in_sg, elem->in_num, 0,
                      &event, sizeof(event)) != sizeof(event)) {
         error_report("vhost-vsock event virtqueue element is too short");
-        goto out;
+        goto err;
     }
 
     virtqueue_push(vq, elem, sizeof(event));
     virtio_notify(VIRTIO_DEVICE(vvc), vq);
 
-out:
+    g_free(elem);
+    return;
+
+err:
+    virtqueue_detach_element(vq, elem, 0);
     g_free(elem);
 }
 
-- 
MST


