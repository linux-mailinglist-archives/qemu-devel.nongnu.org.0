Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067B4E4F36
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 10:23:37 +0100 (CET)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWxDM-0003E0-Bk
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 05:23:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nWxAJ-0001YN-U8
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 05:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nWxAE-0005Cs-CN
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 05:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648027219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EL60+m+ymgjSEyKZ6VmFl1BZrm7Y4qHvOE5d0n7NLRc=;
 b=YM81tBQEBcefXUeF0boo0bsOh4hfO6ULk1BzJ7gw3nv2IleppQg0tIvzNepiytitvVqXJv
 BQHeGim7SikqnXt21d3FPUoU3ry+kFCLO86rB0qOI2TWxw26gAnNzf67SLfc2nNhyjWk7j
 ScvQmPBm34QnXqs6OBUROWPWguR36Jk=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-UOW0JB2QPR2hM9LV1A54mA-1; Wed, 23 Mar 2022 05:20:18 -0400
X-MC-Unique: UOW0JB2QPR2hM9LV1A54mA-1
Received: by mail-lj1-f200.google.com with SMTP id
 h21-20020a05651c125500b002464536cf4eso339803ljh.23
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 02:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EL60+m+ymgjSEyKZ6VmFl1BZrm7Y4qHvOE5d0n7NLRc=;
 b=aIWEJen/DWfWJ8szDyCmnrYhz1rcEga75IyDuQ5lvdgGQjjchIjldhDgH1itARDMFk
 N1KgC1uJwqdzGaOsuZSLtIkUnZdv3Fh3bqb8jSuQOSSLbHWtXcF1tnYFYYm6/HVS5qdm
 +s0ttozNV7Oj/2crFxXzGUOHUEgbyIiaVv8Lzuit9DuP8P6pQGcMprLtJVk+ymjPmrn7
 WR1EOeLh1v/qr/kIi/7ibCrU4jwUmLJxf5D6hY57L6FQeLeKRUPf1Mlu5uZXPdzSs3y+
 NOlLckL36c3ZlqgSgj8sI0YLsdwNmG9A+T3qGwrcIO63zaXiHbQKivbORTqTV3CvX0Sh
 JcpQ==
X-Gm-Message-State: AOAM5317c2Ts0ufWKJ8PAliB+ax85Rm6hRp8glAS+CzLPOCRnaC7ARbk
 ugmLKYI9aMdNxgCMGdPU72zb2uL2LeoFw0tWnJLZQl9DOfw49pdfWEq5vbxwYAA6PqiyfcewBOh
 9A/IURa2nvZwyLKNm4YqLCVgy3ts6BEQ=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr20916957lfh.471.1648027216448; 
 Wed, 23 Mar 2022 02:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsb2AnpEEbXZrSxqV7g3G60z/HpQJz7Z/CtTOIdYTw0YYR3y06ec8OcEeOcdbGW4VHwILtjpnkrMRZXHHv5a0=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr20916902lfh.471.1648027215481; Wed, 23
 Mar 2022 02:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <1648024966-5170-1-git-send-email-08005325@163.com>
In-Reply-To: <1648024966-5170-1-git-send-email-08005325@163.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 23 Mar 2022 17:20:04 +0800
Message-ID: <CACGkMEsjQp+gjHV23ntJ2oTBCdt-1TT0GGn-PFDjOvETz6sQ7A@mail.gmail.com>
Subject: Re: [PATCH] vdpa: Avoid reset when stop device
To: 08005325@163.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 Eugenio Perez Martin <eperezma@redhat.com>, Michael Qiu <qiudayu@archeros.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding Eugenio,  and Ling Shan.

On Wed, Mar 23, 2022 at 4:58 PM <08005325@163.com> wrote:
>
> From: Michael Qiu <qiudayu@archeros.com>
>
> Currently, when VM poweroff, it will trigger vdpa
> device(such as mlx bluefield2 VF) reset twice, this leads
> to below issue:
>
> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>
> This because in vhost_dev_stop(), qemu tries to stop the device,
> then stop the queue: vhost_virtqueue_stop().
> In vhost_dev_stop(), it resets the device, which clear some flags
> in low level driver, and the driver finds
> that the VQ is invalied, this is the root cause.
>
> Actually, device reset will be called within func release()
>
> To solve the issue, vdpa should set vring unready, and
> remove reset ops in device stop: vhost_dev_start(hdev, false).

This is an interesting issue. Do you see a real issue except for the
above warnings.

The reason we "abuse" reset is that we don't have a stop uAPI for
vhost. We plan to add a status bit to stop the whole device in the
virtio spec, but considering it may take a while maybe we can first
introduce a new uAPI/ioctl for that.

Note that the stop doesn't just work for virtqueue but others like,
e.g config space. But considering we don't have config interrupt
support right now, we're probably fine.

Checking the driver, it looks to me only the IFCVF's set_vq_ready() is
problematic, Ling Shan, please have a check. And we probably need a
workaround for vp_vdpa as well.

Anyhow, this seems to be better than reset. So for 7.1:

Acked-by: Jason Wang <jasowang@redhat.com>

>
> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
> ---
>  hw/virtio/vhost-vdpa.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index c5ed7a3..d858b4f 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>      return idx;
>  }
>
> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
>  {
>      int i;
>      trace_vhost_vdpa_set_vring_ready(dev);
>      for (i = 0; i < dev->nvqs; ++i) {
>          struct vhost_vring_state state = {
>              .index = dev->vq_index + i,
> -            .num = 1,
> +            .num = ready,
>          };
>          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>      }
> @@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>          if (unlikely(!ok)) {
>              return -1;
>          }
> -        vhost_vdpa_set_vring_ready(dev);
> +        vhost_vdpa_set_vring_ready(dev, 1);
>      } else {
> +        vhost_vdpa_set_vring_ready(dev, 0);
>          ok = vhost_vdpa_svqs_stop(dev);
>          if (unlikely(!ok)) {
>              return -1;
> @@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>          memory_listener_register(&v->listener, &address_space_memory);
>          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>      } else {
> -        vhost_vdpa_reset_device(dev);
>          vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                     VIRTIO_CONFIG_S_DRIVER);
>          memory_listener_unregister(&v->listener);
> --
> 1.8.3.1
>


