Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CF44B8325
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:43:31 +0100 (CET)
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFuM-0008VS-ET
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:43:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKFkx-00065Z-Is
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nKFku-0006F5-Lb
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 03:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645000423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3TtyifTkBvffIq1MCmwHBZ/nedtnPusx5+ks20r0XTU=;
 b=VxPMHria+zJieLcYG857jXzP1joGVrA8f9XP/zXYsi6C/34IUNcYxup1uF0+N/0fh7jKsk
 t2G+wjZ0u8NB2b+fS1rBo6R2+2Ci95mAUnUzViAXJ91CxfCSIKDe536lAQxgeIMiuBrwdl
 4ZcCPfdh3fWKL4hh5X9v4GRxM4Fgu88=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-mj2VDKsUPpKuay1YTkYqVA-1; Wed, 16 Feb 2022 03:33:41 -0500
X-MC-Unique: mj2VDKsUPpKuay1YTkYqVA-1
Received: by mail-qk1-f197.google.com with SMTP id
 m22-20020a05620a221600b005f180383baeso761391qkh.15
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 00:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3TtyifTkBvffIq1MCmwHBZ/nedtnPusx5+ks20r0XTU=;
 b=LPL8gCVJHriyUblz1YyAmDhCfdSaIlzlBCi/rIJI/YHRQPKxmW8ncYeLWzNnhnTtmz
 jhGyojn1CIe2+zLgyvNsJ3v37JdeoSBxoaPnCR3CrviJpa7LYsuJVqYmrIMQkGWqqcZY
 iTWB+fTLu4fydHGfjOvEbkF76Qs8szuiaQ/cQxJ3coo/08cpsRsASNr4IApqK8G3E7ad
 XufHA9FGrB6n8pv05AlV0fr40MrVl+y3PvDvOki4x7K8CGZcCFPG0VJmhvv4/5HBg9jj
 MocjIKU8Rz2wurySBS5s5lV4LP7vmmAlxETTnXhOu0TVV+6SVV4oHAmzizV8Mgbnbm80
 duKw==
X-Gm-Message-State: AOAM532TloC5ROaejDFCIcv6OVnLncFl2L2/2SBGsZGQjpPI8QSlzZmo
 wkCLkw5kQ/SWG/99Y4Up99+4UAXrmfq02DoaIkaYt/UMvxaRZZ4qAdLlU49sSHlfUNqRiO2JOuK
 73P1cYWWnUJ35PMk=
X-Received: by 2002:ad4:5fce:0:b0:42d:fa10:6451 with SMTP id
 jq14-20020ad45fce000000b0042dfa106451mr1006592qvb.1.1645000421328; 
 Wed, 16 Feb 2022 00:33:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzfnYS0M1E173zH3uYXamkhzRdWFw+B9NtDcL+MjRd2S6ohuP2TCadIWMSdfEkXrnHrv2jFQ==
X-Received: by 2002:ad4:5fce:0:b0:42d:fa10:6451 with SMTP id
 jq14-20020ad45fce000000b0042dfa106451mr1006580qvb.1.1645000421079; 
 Wed, 16 Feb 2022 00:33:41 -0800 (PST)
Received: from sgarzare-redhat (host-95-248-229-156.retail.telecomitalia.it.
 [95.248.229.156])
 by smtp.gmail.com with ESMTPSA id bk23sm18404621qkb.3.2022.02.16.00.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 00:33:40 -0800 (PST)
Date: Wed, 16 Feb 2022 09:33:36 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] hw/virtio: vdpa: Fix leak of host-notifier memory-region
Message-ID: <20220216083336.jcvgen26qdrz7kpy@sgarzare-redhat>
References: <20220211170259.1388734-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220211170259.1388734-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Fri, Feb 11, 2022 at 06:02:59PM +0100, Laurent Vivier wrote:
>If call virtio_queue_set_host_notifier_mr fails, should free
>host-notifier memory-region.
>
>This problem can trigger a coredump with some vDPA drivers (mlx5,
>but not with the vdpasim), if we unplug the virtio-net card from
>the guest after a stop/start.
>
>The same fix has been done for vhost-user:
>  1f89d3b91e3e ("hw/virtio: Fix leak of host-notifier memory-region")
>
>Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
>Cc: jasowang@redhat.com
>Resolves: https://bugzilla.redhat.com/2027208
>Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>---
> hw/virtio/vhost-vdpa.c | 1 +
> 1 file changed, 1 insertion(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index 04ea43704f5d..11f696468dc1 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -431,6 +431,7 @@ static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
>     g_free(name);
>
>     if (virtio_queue_set_host_notifier_mr(vdev, queue_index, &n->mr, true)) {
>+        object_unparent(OBJECT(&n->mr));
>         munmap(addr, page_size);
>         goto err;
>     }
>-- 
>2.34.1
>
>


