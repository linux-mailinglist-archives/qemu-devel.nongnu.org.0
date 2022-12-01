Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA34263EB98
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 09:50:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0fGT-00084u-DU; Thu, 01 Dec 2022 03:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0fGQ-000813-6m
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:49:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0fGO-0007uf-P2
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 03:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669884588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mtbRGTX7p8GiENshwrqOODlvgVH7YP2+8qcWSCMbW/Q=;
 b=benk8SJnTUsG4c3nifLQzxwaFePUK4XHn5571co5jrzh+KrqfHkBsftnK/xwCLSyPrI8M/
 VK+TINY47SCXtEG13mTKblghhXXq/zOd3fmXdDDS9d/5DqkU8yDcI1aF0zm3imIhbtSkFK
 HCl8ztsx/xgVY2D/j3uPyrV3BID0ZRo=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-v63NIBm-PQe5Uqi66k7ULg-1; Thu, 01 Dec 2022 03:49:47 -0500
X-MC-Unique: v63NIBm-PQe5Uqi66k7ULg-1
Received: by mail-ot1-f71.google.com with SMTP id
 s5-20020a9d7585000000b0066c7a3ddf59so488736otk.13
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 00:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mtbRGTX7p8GiENshwrqOODlvgVH7YP2+8qcWSCMbW/Q=;
 b=FTakIDmZJqKBR+mU7nikFwZu4MMjhe54Ou0+tmSL3it2mL32smoQbq8zLoPDYYORe8
 BUnlxsTr7lNA8HF1Ondu8yo2qaAJDhIBh6TKxatNdgBaW0fqzBAOum467y/oXpR4O/HE
 YVODcBCjKbYkEkRXidOMwmWqdB73ISTSCiOB96Qi3Wg8y6WkB9DATI6JAGYpfkmuHMsK
 8n+p2DSXYzYKIat86fgE+KKLuCClVxEPiV0mMmAQbdAIHqI/H712hhJvaS3iXDpz7MX2
 T11Cbvu3VDHpZJVInUQ15q+jHCypQC4au10Qpqp7W2Md6Sy4bLMGj0OvNRAnyIxq1I2w
 8zhg==
X-Gm-Message-State: ANoB5pnDwOx5v72zgFQgw5w+DXvLWF3dDMj2Dpw+nm8qvLCYj16IbH+k
 9Gq2VSQ/Cenj+qRRAiPKq8ScOGoGvmP45rDJDJATH3TRl65kBQ0ytqph6FNDpfIaY6tM+47IHpl
 6scZoFW1Xpf+Q+pfxcqGQ6G3a7YFtnpc=
X-Received: by 2002:aca:906:0:b0:354:68aa:9c59 with SMTP id
 6-20020aca0906000000b0035468aa9c59mr33231879oij.35.1669884586378; 
 Thu, 01 Dec 2022 00:49:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ww/Gc/0jsC2H9Vk3kbfS07QY9eoX2i9BHGWcBp08DfO5ZpiNklnhpayuzwY57D91NS/anPNm1IhN2FE8Tl3M=
X-Received: by 2002:aca:906:0:b0:354:68aa:9c59 with SMTP id
 6-20020aca0906000000b0035468aa9c59mr33231875oij.35.1669884586193; Thu, 01 Dec
 2022 00:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20221130081120.2620722-1-lulu@redhat.com>
In-Reply-To: <20221130081120.2620722-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Dec 2022 16:49:35 +0800
Message-ID: <CACGkMEtnvQwsVTqtGLhPu8eT=3=Q-=RfVQ596qCnJYRKzQa_GA@mail.gmail.com>
Subject: Re: [PATCH] vhost: Not return fail while the device does not support
 send_iotlb_msg
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 30, 2022 at 4:11 PM Cindy Lu <lulu@redhat.com> wrote:
>
> Some device does not support vhost_send_device_iotlb_msg()
> such as vDPA device, which is as expected. So we should not
> return fail here.

Please explain in which case you may hit the -ENODEV and what's the
side effect of this.

Thanks

>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  hw/virtio/vhost-backend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index 8e581575c9..9321ed9031 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -360,7 +360,7 @@ int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
>      if (dev->vhost_ops && dev->vhost_ops->vhost_send_device_iotlb_msg)
>          return dev->vhost_ops->vhost_send_device_iotlb_msg(dev, &imsg);
>
> -    return -ENODEV;
> +    return 0;
>  }
>
>  int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
> @@ -375,7 +375,7 @@ int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
>      if (dev->vhost_ops && dev->vhost_ops->vhost_send_device_iotlb_msg)
>          return dev->vhost_ops->vhost_send_device_iotlb_msg(dev, &imsg);
>
> -    return -ENODEV;
> +    return 0;
>  }
>
>  int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> --
> 2.34.3
>


