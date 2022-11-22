Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B5633A04
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQRc-0008LS-SC; Tue, 22 Nov 2022 05:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRV-0008Kg-NL
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRU-0004ng-9X
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669112631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z0eKwf2Elhvv90NH0J3EMt4xC/MdiblztPiLZZvKSPs=;
 b=gonbBTXyFSMu7QUnebCKFS6rL5eA6msdmUG6KdMlz+isC70qKR20TcZddRtlU4CW4oQd04
 FCHzgpmyClHVbOFvd5Yri8IPdM8D5ievsAk7KkwxHy1lSMqUg2QqUwY/ZziUGTpyQ2QTaI
 PvSy1aVjtI5RFnKyaig3acBScJzvlVE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-BxsQckHoNJGqW5H4EgGcGw-1; Tue, 22 Nov 2022 05:23:49 -0500
X-MC-Unique: BxsQckHoNJGqW5H4EgGcGw-1
Received: by mail-wr1-f69.google.com with SMTP id
 q2-20020adfab02000000b00241b8f7efc5so3944193wrc.19
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0eKwf2Elhvv90NH0J3EMt4xC/MdiblztPiLZZvKSPs=;
 b=cSCuIs5xSMjldODrTFaTqBIxFSELgSqVtp5RAgv6Cuoq9IGBmmwSJwb02t1OMAmF1H
 bmat/++qv2WPM8advUgZuzwAugVptk6bEXlNNHk+BFAdMvfeSs/+8PGHNWI6cZ/U9hvR
 TIgjPVKDe0onmHA+T/IjdB50t2WwXuzognweLQmqfaV5GFDi18cMktHXlL6gJrpeS9zv
 X5WpjMD2LYwtH70ytQdk5D6qxAtvL6zwhDo0528sHPbw3GX5vT3a+NwZjuWcF0CSPBrD
 GL8j6XoZOVoqz26j1+/aiMMPcdz9yp0StsPj9MlZTziTXU21TFPWAnpU2UryTGvfUd4g
 iM6w==
X-Gm-Message-State: ANoB5pk9sW2Id9tNdM7Eft+0nElbPr5uxGUngqeAodvLQ3NXQRtj6lmP
 AtCwPHXCasPCXj6pDqMU3GYm9SfNGHchtz9zgNGfwNjjptMcZMBVMQdDlQuTfHx5F5ZCTC2raQm
 pSWvYI7pwgVuIYkPbz5MCS0PdtNc1pEL8FQriK6BFsqt7mrdkGJ2G2fjvn2ly
X-Received: by 2002:a05:600c:4f48:b0:3cf:54f4:eea with SMTP id
 m8-20020a05600c4f4800b003cf54f40eeamr9400169wmq.105.1669112627918; 
 Tue, 22 Nov 2022 02:23:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4BrHh7V6MZgQD9bIqnZ+E4Kv+0+QaW5j/v6v2DE9PiNoGW+9HLiSeaekbBqAe2O9hru1bWwQ==
X-Received: by 2002:a05:600c:4f48:b0:3cf:54f4:eea with SMTP id
 m8-20020a05600c4f4800b003cf54f40eeamr9400150wmq.105.1669112627652; 
 Tue, 22 Nov 2022 02:23:47 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 t65-20020a1c4644000000b003cfa622a18asm20616847wma.3.2022.11.22.02.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:23:47 -0800 (PST)
Date: Tue, 22 Nov 2022 05:23:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>
Subject: [PULL 8/8] virtio: disable error for out of spec queue-enable
Message-ID: <20221122102227.6603-9-mst@redhat.com>
References: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122102227.6603-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Virtio 1.0 is pretty clear that features have to be
negotiated before enabling VQs. Unfortunately Seabios
ignored this ever since gaining 1.0 support (UEFI is ok).
Comment the error out for now, and add a TODO.

Fixes: 3c37f8b8d1 ("virtio: introduce virtio_queue_enable()")
Cc: "Kangjie Xu" <kangjie.xu@linux.alibaba.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221121200339.362452-1-mst@redhat.com>
---
 hw/virtio/virtio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9683b2e158..eb6347ab5d 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2499,10 +2499,17 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
 {
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
 
+    /*
+     * TODO: Seabios is currently out of spec and triggering this error.
+     * So this needs to be fixed in Seabios, then this can
+     * be re-enabled for new machine types only, and also after
+     * being converted to LOG_GUEST_ERROR.
+     *
     if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         error_report("queue_enable is only suppported in devices of virtio "
                      "1.0 or later.");
     }
+    */
 
     if (k->queue_enable) {
         k->queue_enable(vdev, queue_index);
-- 
MST


