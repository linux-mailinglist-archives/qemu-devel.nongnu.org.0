Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99FA4B83D9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:20:31 +0100 (CET)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGU7-0001G1-6c
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:20:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKFqm-0004jR-IV
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:39:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKFqj-0007di-RX
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645000785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wlFo+UhtQkJ6RY+7GfOqu3HZF6mosezyC+4cnRii5rc=;
 b=X45bEfCEII0CIVfVBHmqiDYeXwBwAKgPHYtb5eEIzf20zMCBo9Ch07tGubD1fBtDsux1++
 gGljp9R78omxQ+5JFZcCQtIqH2gzuN5HyKuVk12fBxIoEh8Hgyxl/Cy4vQwTHBfVpGhSli
 UWQ4BAJzik998W/k9tIUBVFVYdolwG8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-gvXzcVUzOM6pVfXZKfnyig-1; Wed, 16 Feb 2022 03:39:43 -0500
X-MC-Unique: gvXzcVUzOM6pVfXZKfnyig-1
Received: by mail-qk1-f200.google.com with SMTP id
 x16-20020a05620a449000b00508582d0db2so809290qkp.0
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 00:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wlFo+UhtQkJ6RY+7GfOqu3HZF6mosezyC+4cnRii5rc=;
 b=rudKh4BESZsRvKk3wW+F8lCrujta+xhXtgUPHuzIvp83R9WmiMU1gVYFazYY50lpTy
 AXpy3Fd6NzEI6W2LnDBX8thlGQv+7GtvvydLRkckLmagbwednGa+tiJ9IS7GjnXpfOJd
 zaWKKrCWDuVl/s3J132d0nfmIRQZA2KlzIcjX5cE5dA55MnNOVEjWgnTrZDwDnWqWTae
 5RjlrQrZJgQ+wc9laGiYJ1moqU+S+AFX/QFEiL7e61gQeQ4CcEmtom0armFORpOiAn8Q
 dZHeCEPaB6UOzjTyisx+SUSAe25v1Ntr30tRoi3crO5k3qJSkZF3lxWNRCMrLFbkdoGM
 OfyQ==
X-Gm-Message-State: AOAM5303adA5WirZlr1pv9OMHaawlZSAwXALuqaiHXAvg7rdBHlrqVOh
 sJiwWl4h4vIxloYiDShTyn8i1+bb7tGcP/JeV4hWOp6re9pgORwvZXlWyk3rv3SG7MMbYk1BduB
 Xaht31qA4QxtOWAM=
X-Received: by 2002:ac8:7d53:0:b0:2d4:9a0c:fd9f with SMTP id
 h19-20020ac87d53000000b002d49a0cfd9fmr1257367qtb.648.1645000783421; 
 Wed, 16 Feb 2022 00:39:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvdHkcq2eIyS0kpNil28X3+DswaGdkg16ebk73NuVxXn0VfKN4UHTUQVv/OR0raDtzCEf5vw==
X-Received: by 2002:ac8:7d53:0:b0:2d4:9a0c:fd9f with SMTP id
 h19-20020ac87d53000000b002d49a0cfd9fmr1257355qtb.648.1645000783211; 
 Wed, 16 Feb 2022 00:39:43 -0800 (PST)
Received: from sgarzare-redhat (host-95-248-229-156.retail.telecomitalia.it.
 [95.248.229.156])
 by smtp.gmail.com with ESMTPSA id s4sm19289583qko.113.2022.02.16.00.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 00:39:42 -0800 (PST)
Date: Wed, 16 Feb 2022 09:39:38 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC] vhost-vdpa: make notifiers _init()/_uninit() symmetric
Message-ID: <20220216083938.ukjkspdzk4w563zv@sgarzare-redhat>
References: <20220211161309.1385839-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220211161309.1385839-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 05:13:09PM +0100, Laurent Vivier wrote:
>vhost_vdpa_host_notifiers_init() initializes queue notifiers
>for queues "dev->vq_index" to queue "dev->vq_index + dev->nvqs",
>whereas vhost_vdpa_host_notifiers_uninit() uninitializes the
>same notifiers for queue "0" to queue "dev->nvqs".
>
>This asymmetry seems buggy, fix that by using dev->vq_index
>as the base for both.
>
>Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
>Cc: jasowang@redhat.com
>Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>---
> hw/virtio/vhost-vdpa.c | 20 ++++++++++----------
> 1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index 04ea43704f5d..9be3dc66580c 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -395,15 +395,6 @@ static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>     }
> }
>
>-static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
>-{
>-    int i;
>-
>-    for (i = 0; i < n; i++) {
>-        vhost_vdpa_host_notifier_uninit(dev, i);
>-    }
>-}
>-
> static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
> {
>     size_t page_size = qemu_real_host_page_size;
>@@ -442,6 +433,15 @@ err:
>     return -1;
> }
>
>+static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
>+{
>+    int i;
>+
>+    for (i = dev->vq_index; i < dev->vq_index + n; i++) {
>+        vhost_vdpa_host_notifier_uninit(dev, i);
>+    }
>+}
>+
> static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
> {
>     int i;
>@@ -455,7 +455,7 @@ static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
>     return;
>
> err:
>-    vhost_vdpa_host_notifiers_uninit(dev, i);
>+    vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
>     return;
> }
>
>-- 
>2.34.1
>
>


