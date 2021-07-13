Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C6D3C7996
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:23:58 +0200 (CEST)
Received: from localhost ([::1]:46166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qon-00019n-QD
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qcj-0000eY-Vf
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qci-0008Qf-E4
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Y7ACOxj8SZNzmvjevV0tlJBqxfRYd9WxWuOxlZmTHg=;
 b=AlU2k4SR8KxlYAfjw/PcDWaSvsZp31xXajDLTrHGOc2KuCQyl+B5u01hVdLZcMgXLDAYpX
 WgLN8IjWweixA/poFiW44+5WdwsZe3slUahLYZi3H6Zl68qwOJk2WSzb2FDlSt6xwvUWlJ
 NQ4yj+EdJJZacMKpllnoKpBhBWMUtdE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-GYQMA7quMTm4-K6EI9l0kw-1; Tue, 13 Jul 2021 18:11:26 -0400
X-MC-Unique: GYQMA7quMTm4-K6EI9l0kw-1
Received: by mail-wr1-f72.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so317621wrs.15
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Y7ACOxj8SZNzmvjevV0tlJBqxfRYd9WxWuOxlZmTHg=;
 b=FNt0i8j39rY7AG+IAWUCtUi0blF+DI+M6LyhbN+5Ni5JgFyHd+bDJCj1IUuq3krqn1
 Ob7F7Hupnix6n/ujO0Lc51gNN/c9XJA/mA99Lpj88lTxuOxAYLCouSakI3S3SFDLtRsH
 mFi0fXVGSXXhgzGMDjZk3MTK9URpvBP29Fk3ihI3HwqJXoXMUVwb4OWnDUhWQ1y/+iR/
 UUAt8iGdYURfDMf2f48BrmU8q8irLcQfGmiHvrfjgeqv1C7PZWIFrAL6RGsusd8jxcFF
 DWSZ4vD/I1nyn3qL19am1eVxtY2n8hdv3Oa9xYVrOniH4R8f4g99d/N/aV4UA8KrbO4T
 7vbA==
X-Gm-Message-State: AOAM532xf4bHMudBMu5q5IQyDq6PNvLHkc+b1uNxLZF5txhCZPxCmxSh
 SZ3APvF+GnrugO+Lx2PB0mfYkQhNipPPuXmBduaNGti7nZQ8Um8xbpidLuJd5E2sJyHXyrGkLZF
 4Se3isoT/xsRN1+1qCELq3eZ7p77eBgggbWkWwbF3s5KEK1rnVUDK7UipTwm0
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr7621324wmi.49.1626214284898; 
 Tue, 13 Jul 2021 15:11:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeG0J9nQ1pqKYdzy8y2uoxiIn1c7cOEEoSpwg65ujK2RIRe7CXwpMrOP7iWD96dmLATnlNcg==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr7621300wmi.49.1626214284694; 
 Tue, 13 Jul 2021 15:11:24 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id e15sm133588wrp.29.2021.07.13.15.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:11:24 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:11:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] vhost-vsock: SOCK_SEQPACKET feature bit support
Message-ID: <20210713220946.212562-24-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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


