Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6949F623B66
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:41:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0JA-0007he-UN; Thu, 10 Nov 2022 00:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot0J8-0007hQ-MY
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot0J4-0001NJ-FI
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668058852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNVESHMXm8XLHqmpP/5Naw7okC4rI80zGLYxXKZMM6o=;
 b=hsLJtTHqFjjVKkzAMJaTJiD9xZtD1ZbAu3Xi24pPEviBotMh8QFeWqKeIOKEJwT7ABfEM/
 U/J1zEkbe5U0BPzMf+PYYd8PoKKItiEubcxmD3z/LiP6iNzlfcGeamydrre8jBPNyEjXZt
 BPBicuAsp8lmyFTX5HTZopaFFru4pgY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-lC5QyeZwPfePGForUlNatA-1; Thu, 10 Nov 2022 00:40:50 -0500
X-MC-Unique: lC5QyeZwPfePGForUlNatA-1
Received: by mail-pj1-f72.google.com with SMTP id
 m1-20020a17090a5a4100b002138550729dso608958pji.2
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KNVESHMXm8XLHqmpP/5Naw7okC4rI80zGLYxXKZMM6o=;
 b=Qa7IiJB9V+BYXlFDfrA+iizBH6PYMMju0FMRiA2smrTspxHcw4RzjIjIFQc4looEO6
 ySD0A+U7sAc1QbOSZLoQWfQN9WSvIkmDpnF9x1MSeWKRIMyi51TmYvOzpoWz41tLhgkv
 gBUqVlgoRapVt2QfCfSnQR6NyfAy7LB/ZCrW2MVPMdtHm1zOZbqkPe1ECaX8U1ZRrwiZ
 JfRblaPGDybQRy4+y/TEqVM00WwRA+scf3kCNFWmVkx9BY16/RnO/3tlcc2wiZyiMp6H
 l4uDIE8eFD2In6/hLCcnyDM0F3CybqgalGbTX/pQ3gYWdznLEiaTKOKVPfpgozbnAa6h
 v+uw==
X-Gm-Message-State: ACrzQf26eLQrYx+bd6nyl1Qvw6yl5FqbqaEWM9TKaI3i3ubLHVDnuw8c
 nf3YKz9qVpAzMJXZyK0EqEzmhlC5lIQtp20XGMf65zMtZA9WjCVB/l+Hkfx0P6EH9mOms+UUt3z
 uMiXIqku2EIPZ4NY=
X-Received: by 2002:a17:902:e745:b0:187:2033:1832 with SMTP id
 p5-20020a170902e74500b0018720331832mr55580845plf.119.1668058849871; 
 Wed, 09 Nov 2022 21:40:49 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6MlPDUf0LLkCc9kum3CdKh2TL8pGtBzVG4EX5JLDgqAznrRCBMNu3on0DUJLj0JobGM/g/2g==
X-Received: by 2002:a17:902:e745:b0:187:2033:1832 with SMTP id
 p5-20020a170902e74500b0018720331832mr55580818plf.119.1668058849561; 
 Wed, 09 Nov 2022 21:40:49 -0800 (PST)
Received: from [10.72.13.112] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 12-20020a63124c000000b0046f8e444edfsm7895121pgs.60.2022.11.09.21.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:40:48 -0800 (PST)
Message-ID: <56bfad97-74d2-8570-c391-83ecf9965cfd@redhat.com>
Date: Thu, 10 Nov 2022 13:40:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 05/10] vdpa: move SVQ vring features check to net/
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-6-eperezma@redhat.com>
Content-Language: en-US
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221108170755.92768-6-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/11/9 01:07, Eugenio Pérez 写道:
> The next patches will start control SVQ if possible. However, we don't
> know if that will be possible at qemu boot anymore.


If I was not wrong, there's no device specific feature that is checked 
in the function. So it should be general enough to be used by devices 
other than net. Then I don't see any advantage of doing this.

Thanks


>
> Since the moved checks will be already evaluated at net/ to know if it
> is ok to shadow CVQ, move them.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 33 ++-------------------------------
>   net/vhost-vdpa.c       |  3 ++-
>   2 files changed, 4 insertions(+), 32 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 3df2775760..146f0dcb40 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -402,29 +402,9 @@ static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
>       return ret;
>   }
>   
> -static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
> -                               Error **errp)
> +static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v)
>   {
>       g_autoptr(GPtrArray) shadow_vqs = NULL;
> -    uint64_t dev_features, svq_features;
> -    int r;
> -    bool ok;
> -
> -    if (!v->shadow_vqs_enabled) {
> -        return 0;
> -    }
> -
> -    r = vhost_vdpa_get_dev_features(hdev, &dev_features);
> -    if (r != 0) {
> -        error_setg_errno(errp, -r, "Can't get vdpa device features");
> -        return r;
> -    }
> -
> -    svq_features = dev_features;
> -    ok = vhost_svq_valid_features(svq_features, errp);
> -    if (unlikely(!ok)) {
> -        return -1;
> -    }
>   
>       shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>       for (unsigned n = 0; n < hdev->nvqs; ++n) {
> @@ -436,7 +416,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>       }
>   
>       v->shadow_vqs = g_steal_pointer(&shadow_vqs);
> -    return 0;
>   }
>   
>   static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
> @@ -461,11 +440,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>       dev->opaque =  opaque ;
>       v->listener = vhost_vdpa_memory_listener;
>       v->msg_type = VHOST_IOTLB_MSG_V2;
> -    ret = vhost_vdpa_init_svq(dev, v, errp);
> -    if (ret) {
> -        goto err;
> -    }
> -
> +    vhost_vdpa_init_svq(dev, v);
>       vhost_vdpa_get_iova_range(v);
>   
>       if (!vhost_vdpa_first_dev(dev)) {
> @@ -476,10 +451,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>                                  VIRTIO_CONFIG_S_DRIVER);
>   
>       return 0;
> -
> -err:
> -    ram_block_discard_disable(false);
> -    return ret;
>   }
>   
>   static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index d3b1de481b..fb35b17ab4 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -117,9 +117,10 @@ static bool vhost_vdpa_net_valid_svq_features(uint64_t features, Error **errp)
>       if (invalid_dev_features) {
>           error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
>                      invalid_dev_features);
> +        return false;
>       }
>   
> -    return !invalid_dev_features;
> +    return vhost_svq_valid_features(features, errp);
>   }
>   
>   static int vhost_vdpa_net_check_device_id(struct vhost_net *net)


