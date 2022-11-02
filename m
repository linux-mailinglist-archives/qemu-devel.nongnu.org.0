Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218DA616827
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:15:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJx-0007Uw-SW; Wed, 02 Nov 2022 12:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJu-0007H3-Mp
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJm-0002xs-Vt
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6uK+4zsl0JYm6l7lOzD9Nix6fgmHw0181ZM3BtJtePE=;
 b=WaYNT1/EYRK6Yw2UIk7cA9Tq4CXlpTGwPlk9YT1YrZLyaRHa5RL7jcFulqxkBFUZmCDSlN
 QZFfmoZnVTOu2vnVQtfFSEGD29PYRdQ9f9OBhs0Yz64ujvWdNJ9DlJbppLzHE3zL5gDYuF
 aAIxhh4N30a/whbwYkR/C9Vf7lHjxSg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263--76C3dO2OGyL1zcfpbTJaw-1; Wed, 02 Nov 2022 12:10:17 -0400
X-MC-Unique: -76C3dO2OGyL1zcfpbTJaw-1
Received: by mail-wm1-f71.google.com with SMTP id
 az11-20020a05600c600b00b003c6e3d4d5b1so8088758wmb.7
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6uK+4zsl0JYm6l7lOzD9Nix6fgmHw0181ZM3BtJtePE=;
 b=Z2tQsFb5S4C0d89zozW1c4cP2sLDe3AjY8dxlMxriFvgw2+gLEAAbGZYxR7o3bEprt
 vV8bs+D1PqtDnSwhNcigSV0DhGE5b5x9ulNMcIBbsn4LphtrNRqw3IW9eDdm9F9qjgeo
 Xky2QWgVEayAeyl+iOQYe9CHgF83Rc7mwl9MpJPqBqdPTQhL5r5kdZVaSGBWwlTgzBN4
 /vaCalDG141TczZct83g2tmwdEVV3/KET7GtM4nMlQgY0aD8G0A2eqM6aoOnVG3ewzpu
 GAwhOHe4ukegWTKGdhcwXJA0Ow3uDT2Xhg2fgPk4zigS4/aJ5FG2QRpAT1+/9Z5HXXe6
 3Vmw==
X-Gm-Message-State: ACrzQf2YjLBHCgnTzhUC8N5U9EzYzqgiUComjJJ/xynv5ATCgfPnfxqN
 zNv/3bs7ijM0Va3t0EJJ4wh/ZSONGxKJh6B0XZw388qeZUymdDo5i4g6/AIvmQwQw5eug0OJSzo
 tdnHDL3OVgaDBEVIk4nnUg4aRtKNuNJcJOdo82bOd1llyxt0HCB1eectgl2nz
X-Received: by 2002:a05:600c:19cc:b0:3c6:fd74:cb2b with SMTP id
 u12-20020a05600c19cc00b003c6fd74cb2bmr16423040wmq.6.1667405415564; 
 Wed, 02 Nov 2022 09:10:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5b3UirKsvVFNm+1vWNVQMvdfxp6MLZP81yrMKjF3AswDUgF8alDH23EaDWKXNPApwBB7F6qA==
X-Received: by 2002:a05:600c:19cc:b0:3c6:fd74:cb2b with SMTP id
 u12-20020a05600c19cc00b003c6fd74cb2bmr16423004wmq.6.1667405415236; 
 Wed, 02 Nov 2022 09:10:15 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b00236a16c00ffsm13212964wri.43.2022.11.02.09.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:14 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 40/82] virtio-pci: support queue enable
Message-ID: <20221102160336.616599-41-mst@redhat.com>
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

PCI devices support device specific vq enable.

Based on this function, the driver can re-enable the virtqueue after the
virtqueue is reset.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-7-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index d4f2ffe986..855718d586 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1342,6 +1342,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        proxy->vqs[vdev->queue_sel].used[0]);
             proxy->vqs[vdev->queue_sel].enabled = 1;
             proxy->vqs[vdev->queue_sel].reset = 0;
+            virtio_queue_enable(vdev, vdev->queue_sel);
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
         }
-- 
MST


