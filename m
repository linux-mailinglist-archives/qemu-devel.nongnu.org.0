Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D9622E46
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 15:47:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osmM9-0001cw-D6; Wed, 09 Nov 2022 09:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osmLV-0001RV-Bf
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 09:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osmLS-0004V9-Uc
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 09:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668005185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TCy87JibYNqBpSbp4TWwqbbWbuqv+V/Irkto26whthE=;
 b=ZoW8QG8juNaGBRrMW3HTfcH43B7KI+NdzsmsdsFqNaTD5MO+9j0QLWieWvXSoAb8h4/ogS
 VHVB67Piah+5WJWQxM1BXW1psoaM4v5VHGUreJ4foNGEF4boUmhMD7s4WpaiM1KX6soOep
 5pO07FiftDI9r9CdAI4hUkJMXWwkQNA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-8_zjj5N1OaiVI3u5JNhyQQ-1; Wed, 09 Nov 2022 09:46:24 -0500
X-MC-Unique: 8_zjj5N1OaiVI3u5JNhyQQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 j13-20020a05620a288d00b006be7b2a758fso15770725qkp.1
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 06:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TCy87JibYNqBpSbp4TWwqbbWbuqv+V/Irkto26whthE=;
 b=gbo8gRbqHoGqktH+Ndj6SqNt7L5xHD63+I1D415lB7uczjyB0TxwBqlaoaM+UkL4dx
 /0/C0h9BTJwdED8ANT+lgMSyBl/KDiwhleNvvRpL6qCa0gYMTEOk3W/SL1DqZHgcZP8P
 shGRDOcE+PB6qAcnE9JdBkAs9Izufw65v1+4cumPguE0/aKmUikKL2QYAxaWqzIasOZC
 mkU45ZzCUnvMhKqkSqdjQLFdDXKJpduIk18/p6YL9OKVMuoEU8oOEF+0LpYTLNuqdHxP
 SLR4W8J5dq2d5S5HlRoS2/44vpPT5uygMtTbsuSFw46iOAoXjxck1fks5MIB4QBx9dcn
 DONw==
X-Gm-Message-State: ANoB5pltKTiFSWAPkkj+3eHjjF4iPCf4W6xaafTaVQ5+iePp3qyDsxXH
 EgPciweCE+91JMlL/aUZ9Oe32O3GJCWJ8k4LrCBa4NphlJ1t1QMrJ7rq+uQRBCFivdL+/uG04m+
 faljufFUqn8+5b/g=
X-Received: by 2002:a37:50a:0:b0:6fb:176d:74e6 with SMTP id
 10-20020a37050a000000b006fb176d74e6mr655389qkf.65.1668005183852; 
 Wed, 09 Nov 2022 06:46:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6LxDkJaFjE7Oph6m7Ulz1ove6eMJ60e4zfV51NYJCNhlfLn5G02RfPz1LtRh6s1g3IXaZ/xw==
X-Received: by 2002:a37:50a:0:b0:6fb:176d:74e6 with SMTP id
 10-20020a37050a000000b006fb176d74e6mr655367qkf.65.1668005183553; 
 Wed, 09 Nov 2022 06:46:23 -0800 (PST)
Received: from redhat.com ([185.195.59.47]) by smtp.gmail.com with ESMTPSA id
 f1-20020a05620a408100b006fa4a81e895sm11214040qko.67.2022.11.09.06.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 06:46:23 -0800 (PST)
Date: Wed, 9 Nov 2022 09:46:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, stefanha@gmail.com, lersek@redhat.com,
 jasowang@redhat.com, peter.maydell@linaro.org, kraxel@redhat.com
Subject: Re: [PATCH] virtio: remove the excess virtio features check
Message-ID: <20221109094421-mutt-send-email-mst@kernel.org>
References: <20221109111021.24344-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109111021.24344-1-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Nov 09, 2022 at 07:10:21PM +0800, Xuan Zhuo wrote:
> In virtio_queue_enable(), we checked virtio feature VIRTIO_F_VERSION_1.
> 
> This check is not necessary, and conflict with SeaBIOS. The problem
> appeared in SeaBIOS. But we also remove this check.
> 
> Link: https://www.mail-archive.com/qemu-devel@nongnu.org/msg920538.html
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  hw/virtio/virtio.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 9683b2e158..701e23ea6a 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2499,11 +2499,6 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
>  {
>      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>  
> -    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> -        error_report("queue_enable is only suppported in devices of virtio "
> -                     "1.0 or later.");
> -    }
> -
>      if (k->queue_enable) {
>          k->queue_enable(vdev, queue_index);
>      }

Well this warning turned out to be actually useful.
Let's see whether we can fix seabios in time for release.
If yes I would just make it LOG_GUEST_ERR and limit to
latest machine type but not drop completely.

> -- 
> 2.32.0.3.g01195cf9f


