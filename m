Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B45660204
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 15:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDnbe-0006Fd-Rd; Fri, 06 Jan 2023 09:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pDnbU-0006El-1z
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pDnbR-0005Bo-R2
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 09:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673014908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWUBp99FVbFciIf9IIr6S7OrxoamguFqqbjAWMBjeAI=;
 b=aNG2SV7LRODpAN7HLOJ5epRZ8vxKzn3zkfEij92Ky/P5G/2ewkf7YxR4+40cIfnibP8AXG
 /gf4AJk51AAkZrk5m+cbmT6IYRzSwcNwZgqaRzt4dCzM3OCciQV+kokj4s7BMSCN0ujyG9
 hWne/HyZKjxF4y4D/s3kgoXNPJKmFVQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-223-MZn0vwNzNHujmPxj03KXiA-1; Fri, 06 Jan 2023 09:21:47 -0500
X-MC-Unique: MZn0vwNzNHujmPxj03KXiA-1
Received: by mail-yb1-f198.google.com with SMTP id
 e12-20020a25500c000000b007b48c520262so1978013ybb.14
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 06:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xWUBp99FVbFciIf9IIr6S7OrxoamguFqqbjAWMBjeAI=;
 b=WB+29AzhOkexu+lWdjWfcc0c6s1JDLO1z8yvwJaL0Evqi38XzO83WjrFxJcHPNHAZc
 my7QXtPf3erVJVmQi6eEvvs3/9qg3ryETrW1Ho5Z4aAiuEFMcc4WIrtFRqtjb25a9Dxv
 EUgMRj/e6ytu1Fw7WdG2qlhiAFmO57XbD3uMTlN+zmhl7PzeZI0mtjWw5g4bOIvD1QoE
 G3aP6SASXxWJ8dn1JUoVZqpSuUwUUqkd5MVnD3N/1uZMZuAmKZecBDUlAllqIomEnzt1
 zZu2emIkne8jo25Gj1hN6Rz8T3pClhkQMtnSE84Vk3jYbg/Ea2tMjlGpgoJ8ZTXo3lW9
 n3HQ==
X-Gm-Message-State: AFqh2koUpqC3WUQlxQmGqaGDzDZ0rOpNkEu14VLvyp3KbkU0745gCWCw
 CNlRegOskEZxRuhPXqJoBiU6X44d4NHalR3Ter587krtlFHdZ6YgLnzoUHoK0qvF2/n6+MBUqwD
 5Ju3ZguhaFR2esik=
X-Received: by 2002:a81:6f07:0:b0:48d:82cf:2f46 with SMTP id
 k7-20020a816f07000000b0048d82cf2f46mr27146716ywc.0.1673014906496; 
 Fri, 06 Jan 2023 06:21:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsj55D4gCS5ZgZuNSEhEcZRy7lZy+/gae+gh4+IDb/rNkg40ZP4UetWZHypvBTy0S11GtZgUw==
X-Received: by 2002:a81:6f07:0:b0:48d:82cf:2f46 with SMTP id
 k7-20020a816f07000000b0048d82cf2f46mr27146691ywc.0.1673014906233; 
 Fri, 06 Jan 2023 06:21:46 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05620a140f00b006fc92cf4703sm551628qkj.132.2023.01.06.06.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 06:21:45 -0800 (PST)
Message-ID: <43145ede-89dc-280e-b953-6a2b436de395@redhat.com>
Date: Fri, 6 Jan 2023 15:21:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL v4 76/83] vhost-user: Support vhost_dev_start
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-77-mst@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20221107224600.934080-77-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

it seems this patch breaks vhost-user with DPDK.

See https://bugzilla.redhat.com/show_bug.cgi?id=2155173

it seems QEMU doesn't receive the expected commands sequence:

Received unexpected msg type. Expected 22 received 40
Fail to update device iotlb
Received unexpected msg type. Expected 40 received 22
Received unexpected msg type. Expected 22 received 11
Fail to update device iotlb
Received unexpected msg type. Expected 11 received 22
vhost VQ 1 ring restore failed: -71: Protocol error (71)
Received unexpected msg type. Expected 22 received 11
Fail to update device iotlb
Received unexpected msg type. Expected 11 received 22
vhost VQ 0 ring restore failed: -71: Protocol error (71)
unable to start vhost net: 71: falling back on userspace virtio

It receives VHOST_USER_GET_STATUS (40) when it expects VHOST_USER_IOTLB_MSG (22)
and VHOST_USER_IOTLB_MSG when it expects VHOST_USER_GET_STATUS.
and VHOST_USER_GET_VRING_BASE (11) when it expect VHOST_USER_GET_STATUS and so on.

Any idea?

Thanks,
Laurent

On 11/7/22 23:53, Michael S. Tsirkin wrote:
> From: Yajun Wu <yajunw@nvidia.com>
> 
> The motivation of adding vhost-user vhost_dev_start support is to
> improve backend configuration speed and reduce live migration VM
> downtime.
> 
> Today VQ configuration is issued one by one. For virtio net with
> multi-queue support, backend needs to update RSS (Receive side
> scaling) on every rx queue enable. Updating RSS is time-consuming
> (typical time like 7ms).
> 
> Implement already defined vhost status and message in the vhost
> specification [1].
> (a) VHOST_USER_PROTOCOL_F_STATUS
> (b) VHOST_USER_SET_STATUS
> (c) VHOST_USER_GET_STATUS
> 
> Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
> device start and reset(0) for device stop.
> 
> On reception of the DRIVER_OK message, backend can apply the needed setting
> only once (instead of incremental) and also utilize parallelism on enabling
> queues.
> 
> This improves QEMU's live migration downtime with vhost user backend
> implementation by great margin, specially for the large number of VQs of 64
> from 800 msec to 250 msec.
> 
> [1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html
> 
> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
> Acked-by: Parav Pandit <parav@nvidia.com>
> Message-Id: <20221017064452.1226514-3-yajunw@nvidia.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/virtio/vhost-user.c | 74 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index d256ce589b..abe23d4ebe 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -81,6 +81,7 @@ enum VhostUserProtocolFeature {
>       VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
>       /* Feature 14 reserved for VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS. */
>       VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
> +    VHOST_USER_PROTOCOL_F_STATUS = 16,
>       VHOST_USER_PROTOCOL_F_MAX
>   };
>   
> @@ -126,6 +127,8 @@ typedef enum VhostUserRequest {
>       VHOST_USER_GET_MAX_MEM_SLOTS = 36,
>       VHOST_USER_ADD_MEM_REG = 37,
>       VHOST_USER_REM_MEM_REG = 38,
> +    VHOST_USER_SET_STATUS = 39,
> +    VHOST_USER_GET_STATUS = 40,
>       VHOST_USER_MAX
>   } VhostUserRequest;
>   
> @@ -1452,6 +1455,43 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
>       return 0;
>   }
>   
> +static int vhost_user_set_status(struct vhost_dev *dev, uint8_t status)
> +{
> +    return vhost_user_set_u64(dev, VHOST_USER_SET_STATUS, status, false);
> +}
> +
> +static int vhost_user_get_status(struct vhost_dev *dev, uint8_t *status)
> +{
> +    uint64_t value;
> +    int ret;
> +
> +    ret = vhost_user_get_u64(dev, VHOST_USER_GET_STATUS, &value);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    *status = value;
> +
> +    return 0;
> +}
> +
> +static int vhost_user_add_status(struct vhost_dev *dev, uint8_t status)
> +{
> +    uint8_t s;
> +    int ret;
> +
> +    ret = vhost_user_get_status(dev, &s);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    if ((s & status) == status) {
> +        return 0;
> +    }
> +    s |= status;
> +
> +    return vhost_user_set_status(dev, s);
> +}
> +
>   static int vhost_user_set_features(struct vhost_dev *dev,
>                                      uint64_t features)
>   {
> @@ -1460,6 +1500,7 @@ static int vhost_user_set_features(struct vhost_dev *dev,
>        * backend is actually logging changes
>        */
>       bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
> +    int ret;
>   
>       /*
>        * We need to include any extra backend only feature bits that
> @@ -1467,9 +1508,18 @@ static int vhost_user_set_features(struct vhost_dev *dev,
>        * VHOST_USER_F_PROTOCOL_FEATURES bit for enabling protocol
>        * features.
>        */
> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
> +    ret = vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
>                                 features | dev->backend_features,
>                                 log_enabled);
> +
> +    if (virtio_has_feature(dev->protocol_features,
> +                           VHOST_USER_PROTOCOL_F_STATUS)) {
> +        if (!ret) {
> +            return vhost_user_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
> +        }
> +    }
> +
> +    return ret;
>   }
>   
>   static int vhost_user_set_protocol_features(struct vhost_dev *dev,
> @@ -2620,6 +2670,27 @@ void vhost_user_cleanup(VhostUserState *user)
>       user->chr = NULL;
>   }
>   
> +static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
> +{
> +    if (!virtio_has_feature(dev->protocol_features,
> +                            VHOST_USER_PROTOCOL_F_STATUS)) {
> +        return 0;
> +    }
> +
> +    /* Set device status only for last queue pair */
> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
> +        return 0;
> +    }
> +
> +    if (started) {
> +        return vhost_user_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> +                                          VIRTIO_CONFIG_S_DRIVER |
> +                                          VIRTIO_CONFIG_S_DRIVER_OK);
> +    } else {
> +        return vhost_user_set_status(dev, 0);
> +    }
> +}
> +
>   const VhostOps user_ops = {
>           .backend_type = VHOST_BACKEND_TYPE_USER,
>           .vhost_backend_init = vhost_user_backend_init,
> @@ -2654,4 +2725,5 @@ const VhostOps user_ops = {
>           .vhost_backend_mem_section_filter = vhost_user_mem_section_filter,
>           .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
>           .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
> +        .vhost_dev_start = vhost_user_dev_start,
>   };


