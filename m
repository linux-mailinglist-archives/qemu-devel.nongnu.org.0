Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81BF60EF12
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 06:35:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onuYr-0006pE-NP; Thu, 27 Oct 2022 00:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onuYp-0006h9-2m
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 00:32:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onuYm-0007jE-Sn
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 00:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666845120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYQqBuByPwLQauWAP4mysKoGAkTCi2Y4NGE3x9EAbhI=;
 b=QG0UMoz5eOsuWpjCiVqr0ihmBXoeW40VNC4ZS7qhRn8KG0d0Rc8cc2btYB0WxW/EPgSzl9
 kBK76Wx/qGkeu/Adlw50MhycJVkYjgS8O7eRp83mKUWZAewJbWfuTtireT87NS7uLSwCSA
 HItqq8ZppLxYsRovSzkIuvYsdAtoqaY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-v-vFBYDPOom3gzKoiDAxtw-1; Thu, 27 Oct 2022 00:31:58 -0400
X-MC-Unique: v-vFBYDPOom3gzKoiDAxtw-1
Received: by mail-pl1-f198.google.com with SMTP id
 x18-20020a170902ec9200b001869f20da7eso198039plg.10
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 21:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mYQqBuByPwLQauWAP4mysKoGAkTCi2Y4NGE3x9EAbhI=;
 b=gj2LHBG6/JWDdrhlaz5ZMqjYTfVJL/MAGSASuMSfIwPM6cKOBD1Mj7sBtx4k5Sfcmo
 4ulUQGjqwZlQN5frdNK4pkqu6whfFlB69IAiVZQisgoPo/0nn8QSUGuFS2cV9Qp3UTmL
 w/Pe0nQ83HT9Av1y82YOQcNPgm9DvbH1PwtcSMnQDtUVttIr9c4LUWluIaC9isT3gjLH
 LUwdRDQB+Kna9rgwuQ2EWpbPb8RQ1mfLy3U4u0I7II5mDFNq5VDMdsJuGA2lqNvaIcoS
 PTh8lBe2efMS+y6Td1y4oZ7b7rbBXxqW7OrCaj9ywGyNy2E4iqWrmXpxXyyp3/BuNoEi
 /TEw==
X-Gm-Message-State: ACrzQf3jjtidAdT4PFYzRbNg4GLArWXvairMUjdtGRQyVemsr4mpBdmC
 6oBUJlNq+5ll4X+AHhX8fWG0HVHJDk6mgBb6wgfWk8WPdCIoO70zAykx1EhQr8KxUQwxYA9wrOJ
 CN9oi8By6YMDmmSo=
X-Received: by 2002:a17:90b:1d12:b0:20c:8edd:59a3 with SMTP id
 on18-20020a17090b1d1200b0020c8edd59a3mr7881301pjb.222.1666845112305; 
 Wed, 26 Oct 2022 21:31:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7m9qnYjZnnT2UWbahU2UzvDd/Qkqtd2Lr4L7sr5bJsBinDz9ZUlaKewZwxTmjlAgHzmmeY6A==
X-Received: by 2002:a17:90b:1d12:b0:20c:8edd:59a3 with SMTP id
 on18-20020a17090b1d1200b0020c8edd59a3mr7881264pjb.222.1666845111873; 
 Wed, 26 Oct 2022 21:31:51 -0700 (PDT)
Received: from [10.72.12.115] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a1709027e0200b00180033438a0sm163661plm.106.2022.10.26.21.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 21:31:50 -0700 (PDT)
Message-ID: <53480725-89de-f289-c5cc-4b37ede72c31@redhat.com>
Date: Thu, 27 Oct 2022 12:31:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 3/3] vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
References: <20221026095303.37907-1-eperezma@redhat.com>
 <20221026095303.37907-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221026095303.37907-4-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/10/26 17:53, Eugenio Pérez 写道:
> Now that qemu can handle and emulate it if the vdpa backend does not
> support it we can offer it always.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


I may miss something but isn't more easier to simply remove the 
_F_STATUS from vdpa_feature_bits[]?

Thanks


> ---
>   include/net/vhost-vdpa.h |  1 +
>   hw/net/vhost_net.c       | 16 ++++++++++++++--
>   net/vhost-vdpa.c         |  3 +++
>   3 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
> index b81f9a6f2a..cfbcce6427 100644
> --- a/include/net/vhost-vdpa.h
> +++ b/include/net/vhost-vdpa.h
> @@ -17,5 +17,6 @@
>   struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
>   
>   extern const int vdpa_feature_bits[];
> +extern const uint64_t vhost_vdpa_net_added_feature_bits;
>   
>   #endif /* VHOST_VDPA_H */
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index d28f8b974b..7c15cc6e8f 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -109,10 +109,22 @@ static const int *vhost_net_get_feature_bits(struct vhost_net *net)
>       return feature_bits;
>   }
>   
> +static uint64_t vhost_net_add_feature_bits(struct vhost_net *net)
> +{
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
> +        return vhost_vdpa_net_added_feature_bits;
> +    }
> +
> +    return 0;
> +}
> +
>   uint64_t vhost_net_get_features(struct vhost_net *net, uint64_t features)
>   {
> -    return vhost_get_features(&net->dev, vhost_net_get_feature_bits(net),
> -            features);
> +    uint64_t ret = vhost_get_features(&net->dev,
> +                                      vhost_net_get_feature_bits(net),
> +                                      features);
> +
> +    return ret | vhost_net_add_feature_bits(net);
>   }
>   int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
>                            uint32_t config_len)
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 6d64000202..24d2857593 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_device_features =
>       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
>       BIT_ULL(VIRTIO_NET_F_STANDBY);
>   
> +const uint64_t vhost_vdpa_net_added_feature_bits =
> +    BIT_ULL(VIRTIO_NET_F_STATUS);
> +
>   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>   {
>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);


