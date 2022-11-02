Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA3616891
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:23:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJy-0007cE-Qw; Wed, 02 Nov 2022 12:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJv-0007NL-DV
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJs-00033F-T1
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iblFjKpaXIHtiQIUGFA8gXnv2AWbCgLXsgXlMDiv4m8=;
 b=I7DkKODx18VrhOT/qOsrETHEfCHphdgTY+Fnjyfih2pdzwTI+45uOSPpVIi7FBDcTyBg2l
 CYo5yQk4O4S2KgsHT4rulbqROvxbn2Q7a6feaJb8/HzBceZLgu+tBDDPPbFiqcK6PiFy1c
 08JdE9bJbKuzzbEZb84sap+rxDL2TnY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-i9nfrDW-PdeKCV3GdmAM_Q-1; Wed, 02 Nov 2022 12:10:22 -0400
X-MC-Unique: i9nfrDW-PdeKCV3GdmAM_Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso648108wmj.4
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iblFjKpaXIHtiQIUGFA8gXnv2AWbCgLXsgXlMDiv4m8=;
 b=dvDXZBzfe3Ivf4YwjTlaKpVpJ+0FY0LcdAPhZXaH4gBgcf9H3VifUhjG/Jo0IoSVjw
 LVvWPPKdEpmcFeoVAJnbkBXCj4T4fq2SImgL4/bq0OMWxRrGUoX4f7WujsQmlQ4UOeug
 3ELutxMWDejeTYQnxqaItagdR8VwiYJxp+SpRvXeZSvZnORtahK0u93BwFaVP5MLHuvS
 ikMMdsBBUzRWtJpeTIE6JQCvf0mH1ALkGI5f61wm1TtQwjQWTJaVaiKeR6y5p+7Fso/9
 5HSSpplSeTFD0x8g11OWsr6j4vOBUWuNGptP7JUeloqPAlbufACHLlTEv2hWL+K3DFWc
 YVUg==
X-Gm-Message-State: ACrzQf1te3He8+ewOYm0Ng91NiMsGayFuncypUC+VLKZH27XwJ1q3JaO
 IzO33feVN96+/2nXmrjzZT9abRjdAFy1wUtjVmUSxL/GqsEXSFL3M6gHHH4i1JV4AcfVQpnV05O
 8sGWh4Uznqa5p2H3eXpx0cryisCQUllt+yu9dtahvPHAYjrLfyEUsAx43DI9k
X-Received: by 2002:a05:6000:24a:b0:236:bc3a:48b2 with SMTP id
 m10-20020a056000024a00b00236bc3a48b2mr13427616wrz.495.1667405421337; 
 Wed, 02 Nov 2022 09:10:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Flla4peF87Su/g77ruVFr+sPXx1zQK043pXQ5cRMMdh6wv9d3efsAyFOXp6UW0VPGKwWigg==
X-Received: by 2002:a05:6000:24a:b0:236:bc3a:48b2 with SMTP id
 m10-20020a056000024a00b00236bc3a48b2mr13427588wrz.495.1667405421081; 
 Wed, 02 Nov 2022 09:10:21 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 n4-20020adfe344000000b002365f326037sm15925574wrj.63.2022.11.02.09.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:20 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 42/82] vhost: expose vhost_virtqueue_stop()
Message-ID: <20221102160336.616599-43-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Expose vhost_virtqueue_stop(), we need to use it when resetting a
virtqueue.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-9-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h | 2 ++
 hw/virtio/vhost.c         | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 0054a695dc..353252ac3e 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -299,6 +299,8 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
 
 int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vdev,
                           struct vhost_virtqueue *vq, unsigned idx);
+void vhost_virtqueue_stop(struct vhost_dev *dev, struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq, unsigned idx);
 
 void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
 void vhost_dev_free_inflight(struct vhost_inflight *inflight);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 788d0a0679..d1c4c20b8c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1201,10 +1201,10 @@ fail_alloc_desc:
     return r;
 }
 
-static void vhost_virtqueue_stop(struct vhost_dev *dev,
-                                    struct VirtIODevice *vdev,
-                                    struct vhost_virtqueue *vq,
-                                    unsigned idx)
+void vhost_virtqueue_stop(struct vhost_dev *dev,
+                          struct VirtIODevice *vdev,
+                          struct vhost_virtqueue *vq,
+                          unsigned idx)
 {
     int vhost_vq_index = dev->vhost_ops->vhost_get_vq_index(dev, idx);
     struct vhost_vring_state state = {
-- 
MST


