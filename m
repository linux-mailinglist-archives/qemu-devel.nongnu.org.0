Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA9A4D0BA3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:03:18 +0100 (CET)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMNp-0008T0-Uy
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:03:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7d-0008Nl-Be
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7b-0005jX-H1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9/XoSsKmPEouICygtljc84b9npXxSXtesafLfFcgh0k=;
 b=CMo1hLmJ/aorqatsI272qLQxJ1sSKS8uPbwInRHGlVUzzymaL1Z6w9rRJEfkeeWenvVpyb
 VAxvlPmFUUuUuCr8Y89ppwkyn5EXEPMZqtl3WTdk79DUtTgckYzuo7UM3/C9g+KqY4Lx11
 5Xho4/EDFy0JwdX4ado9HtPzxRQ/aUc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-nwqdEsDPO9qhF-N9VCMqow-1; Mon, 07 Mar 2022 17:46:29 -0500
X-MC-Unique: nwqdEsDPO9qhF-N9VCMqow-1
Received: by mail-ej1-f71.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso7638051eje.20
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9/XoSsKmPEouICygtljc84b9npXxSXtesafLfFcgh0k=;
 b=M+21C/xZkR0v679KitOUSsAWJCuly3rYx3C5Y4Le0CHtR9D5G/cHu8nJ87aeY2gnna
 h1uDNg5jEWcw0pq8cRIAEZTn+Vl9GaDK9BtGCW1GgKfi2FD362eRpegY7KQ42L7zXhQ1
 5ahgGB01wDqwY1JjUmKGdI01wVNu2/r1hvbQWAPMy/c+MMNa/aKK6tpC1GI4IDZMEBdd
 hPV/XZgvLS/u8a8ujPoed7FqN1XjegXvouYDOshb3x+7vRkX/gSD2HrujI+hsob0kW5c
 VCTOw322i293mG/hxzr3imcnv/vkD9blyCLoB+q8+z3UY9sjU25zoDv4bdY+a3jgmu0d
 JkzQ==
X-Gm-Message-State: AOAM532b3Y9a99gdlFyLUdqjTGh2GR4zRwaXux2vhUMF/lyF1WK+xIVU
 BacvbSZBJm1pz0vwH6/ituPFiffCKR13cOone65Zry/m4bctkdpuu9JJWUyJJhiDacxk1uoumYs
 2dI/0I2yty5wqjp32VFwzx8yPeoJ/Y9u3a4BOE5Z90/6mOFpb/SxKZ60OyjLt
X-Received: by 2002:a17:907:720d:b0:6d7:cdc:958c with SMTP id
 dr13-20020a170907720d00b006d70cdc958cmr10729299ejc.361.1646693188345; 
 Mon, 07 Mar 2022 14:46:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwb88QnnWdmfDhqZS3A2lUxyEqRejEsvDXxT2qf88MjBu+u8bsbXXnrfNRospt6PKp2RK+hwg==
X-Received: by 2002:a17:907:720d:b0:6d7:cdc:958c with SMTP id
 dr13-20020a170907720d00b006d70cdc958cmr10729274ejc.361.1646693187983; 
 Mon, 07 Mar 2022 14:46:27 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 b2-20020a17090630c200b006d58f94acecsm5157897ejb.210.2022.03.07.14.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:27 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 36/47] vhost-vsock: detach the virqueue element in case of
 error
Message-ID: <20220307224357.682101-37-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


