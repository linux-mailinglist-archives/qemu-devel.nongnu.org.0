Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8953CB9D6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:29:34 +0200 (CEST)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4PmP-0007Op-0l
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PZK-0001h9-6p
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PZB-0004UD-KF
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Y7ACOxj8SZNzmvjevV0tlJBqxfRYd9WxWuOxlZmTHg=;
 b=DftVsf5QNRLxfd+Dtkefo9fMKshwiBbfraMBIbdciayub6oSuyLrGa9X+U32EutCSwiacX
 lWBCw6X9vdJ2daioOiVtC+4RB+mIJkJ/FZD+IwIGh3s6i61C4+ZWQQSQXlrdDUpZXmzJqM
 r5MNY1/4IbQBRcFwH1WEb2HloGJqn8k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-7sQOTJq6MFOrX40rm9ErUQ-1; Fri, 16 Jul 2021 11:15:51 -0400
X-MC-Unique: 7sQOTJq6MFOrX40rm9ErUQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 p6-20020a05600c3586b029020b46124c2eso3618375wmq.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Y7ACOxj8SZNzmvjevV0tlJBqxfRYd9WxWuOxlZmTHg=;
 b=rsK3x4tLtZ6a4yXoSkXr/O78n8imnNSczjRNkj2fVrgL+S97CpfbfeIihIYDMRJXp+
 arwqZpHBmdkyXa+2WY6UdyD2YuRLc7SKcB9Clu2CmtUP3jCp0XhUwKOQ4AkuEyZqvS8H
 IVy/7+fPFBzcspubb8kZToFO8PGphIxgjkZJjkloaxO3lTnYCUy2qPFuHOne593pP3hC
 FCPz4MUaF/9H3D4gZjT+eum404Gyt4cPZ/YImTFsyOml5mMuMO+DRtdEhvmy1w7lMwsP
 zfMyygfuBlOgundiwGFGUBSUPIu91mYrQw7ZbyEHAaQ0Kd6FRLq3Vy0jkxdqLnXKQEp6
 PdEw==
X-Gm-Message-State: AOAM5321VuMkW/0VX1zx+T+RWIkldtvvu3b9SNMk9jyULb0sKoy/+4Vp
 e9NQGskyWu+kFtWXhfpaFkh95Q7zdWQsOAYJflN+mXBZlK82btMAuqN9W4/OhxTYw9dkavMCtGQ
 yRGjcC9extmHLYmZNf6C4gUKkoxxIrcvPcyQ15NgGjdu4U/6z2kqTaYJr1UgS
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr13025507wrt.132.1626448549662; 
 Fri, 16 Jul 2021 08:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwkxSD8uDCRSIrpfvvpNSYRL05IdaoMVYIuP9W8EIMqB3iI9Z0CKZCMqsye3l9AsbWXX2Pxg==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr13025476wrt.132.1626448549381; 
 Fri, 16 Jul 2021 08:15:49 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id j10sm10396255wrt.35.2021.07.16.08.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:48 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 19/19] vhost-vsock: SOCK_SEQPACKET feature bit support
Message-ID: <20210716151416.155127-20-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Arseny Krasnov <arseny.krasnov@kaspersky.com>

This adds processing of VIRTIO_VSOCK_F_SEQPACKET features bit. Guest
negotiates it with vhost, thus both will know that SOCK_SEQPACKET
supported by peer.

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-Id: <20210622144747.2949134-1-arseny.krasnov@kaspersky.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vsock.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 777cafe70d..1b1a5c70ed 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -21,6 +21,11 @@
 #include "hw/virtio/vhost-vsock.h"
 #include "monitor/monitor.h"
 
+const int feature_bits[] = {
+    VIRTIO_VSOCK_F_SEQPACKET,
+    VHOST_INVALID_FEATURE_BIT
+};
+
 static void vhost_vsock_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostVSock *vsock = VHOST_VSOCK(vdev);
@@ -108,8 +113,11 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
                                          uint64_t requested_features,
                                          Error **errp)
 {
-    /* No feature bits used yet */
-    return requested_features;
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+
+    virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
+    return vhost_get_features(&vvc->vhost_dev, feature_bits,
+                                requested_features);
 }
 
 static const VMStateDescription vmstate_virtio_vhost_vsock = {
-- 
MST


