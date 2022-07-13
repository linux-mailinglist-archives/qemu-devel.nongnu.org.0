Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E6572DC0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 07:55:02 +0200 (CEST)
Received: from localhost ([::1]:40764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBVKv-0003E9-Q6
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 01:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oBVI3-0001hr-HV
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 01:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oBVI0-0005s5-PY
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 01:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657691519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IloaNFRcEAT6V5SqsAHtbCg5xK2ecqDAHsTk7D5DNXE=;
 b=dM3cYuXH1MbUPJgORgeasitcOVpEc6yCzGzPvCKFb2fHLtcQ5GOXz71cPNeQbDi9TTzSAA
 /+i38ptF9cUyXk+BxTTQ3bJLBSY44+DGHCh/BqYbgNm7uPOWNZcQ1iJTLBKjpk4NEiC1Ne
 xLuqhTr/j/krD5gh5P1CGD9TW4d5qsg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418--6NyBi2ZO6SDCpzzeRpjuA-1; Wed, 13 Jul 2022 01:51:57 -0400
X-MC-Unique: -6NyBi2ZO6SDCpzzeRpjuA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c17-20020a7bc011000000b003a2bfaf8d3dso5095915wmb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 22:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IloaNFRcEAT6V5SqsAHtbCg5xK2ecqDAHsTk7D5DNXE=;
 b=uTZbRph89ujG85WG5OMFkg6YhwpGcVz+ys+4belO1lTEcG31nESEjz42AQNvq76Jrd
 JYgJwBbtydX2TXDr9XMLJ1bfaSMAntX/yjtzK2zB2CwmGORqIAN+1P8wxrSFJf5omKZB
 pk93Abuxd/JiRurR/yHrtG4328aoh5cr1cJcsfLGt+UoXIvYrwna2clwrMOBWooLMUYM
 ovistouPDadSPTfM+5+ylceRb8k/clxtbB8V/aNmojZ7vYQaTytUvJ1exlJYsRA4HcVH
 F/gyRcsA8l+Ew6A/z+QhDZ3SvA0UGqVUtpQ/VZSoMf/uxyjbnF3NejE2gZ7q++rsl8HL
 UGWQ==
X-Gm-Message-State: AJIora9GiEvwv2eEXL5IH0yH3SqOx9/WRIIoPX39PUgm95m0oA7yNWv0
 SJG3HODUiTpJJgW8cM+oSVvx/MJwjN7dXm3c45fVbXGrGc35PPIl2rfGsMKMp23l38Ky0ON3/EI
 rMk3xc/nG5rnsWwM=
X-Received: by 2002:adf:e84c:0:b0:21d:83ed:2ce with SMTP id
 d12-20020adfe84c000000b0021d83ed02cemr1417401wrn.582.1657691516230; 
 Tue, 12 Jul 2022 22:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tOKd5rTHw7OBVD3wnBWL75ZxEzgC32Oa7Recv+0NVQHWKu2HgLBebIpf5xbU/OkJT6IH/Deg==
X-Received: by 2002:adf:e84c:0:b0:21d:83ed:2ce with SMTP id
 d12-20020adfe84c000000b0021d83ed02cemr1417380wrn.582.1657691515983; 
 Tue, 12 Jul 2022 22:51:55 -0700 (PDT)
Received: from redhat.com ([2.52.24.42]) by smtp.gmail.com with ESMTPSA id
 j21-20020a05600c405500b0039c811077d3sm998502wmm.22.2022.07.12.22.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 22:51:55 -0700 (PDT)
Date: Wed, 13 Jul 2022 01:51:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH v9 03/23] vdpa: delay set_vring_ready after DRIVER_OK
Message-ID: <20220713014746-mutt-send-email-mst@kernel.org>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-4-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706184008.1649478-4-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 06, 2022 at 08:39:48PM +0200, Eugenio Pérez wrote:
> To restore the device in the destination of a live migration we send the
> commands through control virtqueue. For a device to read CVQ it must
> have received DRIVER_OK status bit.
> 
> However this open a window where the device could start receiving
> packets in rx queue 0 before it receive the RSS configuration. To avoid
> that, we will not send vring_enable until all configuration is used by
> the device.
> 
> As a first step, reverse the DRIVER_OK and SET_VRING_ENABLE steps.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Not a comment on this patch specifically, but generally:

You should know that lots of existing drivers are buggy and
try to poke at the VQs before DRIVER_OK. We are doing our best
to fix them but it's taking forever. For now it's a good
idea to support such drivers even if they are out of spec.
You do that by starting on the first kick in absence of DRIVER_OK.
Further, adding buffers before DRIVER_OK is actually allowed,
as long as you don't kick.


> ---
>  hw/virtio/vhost-vdpa.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 66f054a12c..2ee8009594 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -728,13 +728,18 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>      return idx;
>  }
>  
> +/**
> + * Set ready all vring of the device
> + *
> + * @dev: Vhost device
> + */
>  static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>  {
>      int i;
>      trace_vhost_vdpa_set_vring_ready(dev);
> -    for (i = 0; i < dev->nvqs; ++i) {
> +    for (i = 0; i < dev->vq_index_end; ++i) {
>          struct vhost_vring_state state = {
> -            .index = dev->vq_index + i,
> +            .index = i,
>              .num = 1,
>          };
>          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
> @@ -1097,7 +1102,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>          if (unlikely(!ok)) {
>              return -1;
>          }
> -        vhost_vdpa_set_vring_ready(dev);
>      } else {
>          ok = vhost_vdpa_svqs_stop(dev);
>          if (unlikely(!ok)) {
> @@ -1111,16 +1115,22 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>      }
>  
>      if (started) {
> +        int r;
> +
>          memory_listener_register(&v->listener, &address_space_memory);
> -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +        r = vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> +        if (unlikely(r)) {
> +            return r;
> +        }
> +        vhost_vdpa_set_vring_ready(dev);
>      } else {
>          vhost_vdpa_reset_device(dev);
>          vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                     VIRTIO_CONFIG_S_DRIVER);
>          memory_listener_unregister(&v->listener);
> -
> -        return 0;
>      }
> +
> +    return 0;
>  }
>  
>  static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
> -- 
> 2.31.1


