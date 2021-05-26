Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33286390DDA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 03:15:46 +0200 (CEST)
Received: from localhost ([::1]:34818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lli9B-0008Qd-9g
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 21:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lli7u-00074w-0s
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lli7s-0001FS-6e
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621991663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zc/pzU0LDlXuq/PIlZ7jK1sYLaLur/xPSpS8UXayb8A=;
 b=HIrHGAOgZ+z2HQ0REu+uAWc5fWi4M1lNGCv9rBAWpmHuExHx++XDpq0H1UF/VURqb7woSH
 PxvVvIWKJimta8ELjxdQlJG2qBoJIsNMgZOhaz7nhhyxcNSVX9OL+QlqjKccq2XGBXOE3Y
 5e9ThpB4DqUsN4FyEzS9B//KVS+S8tM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-wW7Zx0FAOkmGvd5onyf_YA-1; Tue, 25 May 2021 21:14:17 -0400
X-MC-Unique: wW7Zx0FAOkmGvd5onyf_YA-1
Received: by mail-pg1-f199.google.com with SMTP id
 4-20020a6317440000b029021689797ccaso22139837pgx.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 18:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Zc/pzU0LDlXuq/PIlZ7jK1sYLaLur/xPSpS8UXayb8A=;
 b=l61qxoldTK8oUyKvR+x6oqZnqt2OxaMbXlvaR/+9XmxGnmeYlFdKhhC/EKpNbyD2yt
 8n4QlIbYLnuOdzKnfNNwPnq0C4IPJlc/e8zuseonls37olEFZnIbRIH0mVFdYDZCKZed
 3lcorhSuP9dxNVOcIObh8LG1o2D0QmIehIPg0f6tEXNe3Tp6okDjFPO5vftDHNxK9bPb
 IHGHXD3czzCQkmxsT43Aey8DIN9Pf5Q42ecNv/ZGCLCj1UdmCPHIZyU9RqRkFZ2m4Xyu
 p7ae46WsftSOiQlPrZRqUNM9uR8avyj4rr1lgK6cy+0iTi0BosZpxqzlG/ROCIj85ck3
 V3Ag==
X-Gm-Message-State: AOAM5308MA5wRqneOBxW1dT6Axw/PLA6pIsE6WVwY0rG8ktiUsOyMsTe
 kd6sCavZkZg5LAbCeTjo9eHSDXIJNonwUt6ClFnX6Ce1sHEB6mMtK5F7935O0An9h3Is9p17c6P
 0STNm7kBArMVEHEg=
X-Received: by 2002:a62:a517:0:b029:2dc:9daf:5e91 with SMTP id
 v23-20020a62a5170000b02902dc9daf5e91mr32828781pfm.39.1621991655929; 
 Tue, 25 May 2021 18:14:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOD/3JYTfEoVMD++1TY4++AgHy4qjn0MHC2pyUmBme10b4t14OHRl0TmQrSIAakxht72bzGQ==
X-Received: by 2002:a62:a517:0:b029:2dc:9daf:5e91 with SMTP id
 v23-20020a62a5170000b02902dc9daf5e91mr32828755pfm.39.1621991655615; 
 Tue, 25 May 2021 18:14:15 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id c20sm2141408pjr.35.2021.05.25.18.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 18:14:15 -0700 (PDT)
Subject: Re: [RFC v3 13/29] vhost: Add vhost_get_iova_range operation
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-14-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e0114c64-2620-7a72-6445-3035ceb748ac@redhat.com>
Date: Wed, 26 May 2021 09:14:04 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519162903.1172366-14-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/20 上午12:28, Eugenio Pérez 写道:
> For simplicity, If a device does not support this operation it means
> that it can handle full (uint64_t)-1 iova address.


Note that, we probably need a separated patch for this.

And we need to this during vhost-vdpa initialization. If GPA is out of 
the range, we need to fail the start of vhost-vdpa.

THanks


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/vhost-backend.h |  5 +++++
>   hw/virtio/vhost-vdpa.c            | 18 ++++++++++++++++++
>   hw/virtio/trace-events            |  1 +
>   3 files changed, 24 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 94d3323905..bcb112c166 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -36,6 +36,7 @@ struct vhost_vring_addr;
>   struct vhost_scsi_target;
>   struct vhost_iotlb_msg;
>   struct vhost_virtqueue;
> +struct vhost_vdpa_iova_range;
>   
>   typedef int (*vhost_backend_init)(struct vhost_dev *dev, void *opaque);
>   typedef int (*vhost_backend_cleanup)(struct vhost_dev *dev);
> @@ -127,6 +128,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>   
>   typedef int (*vhost_vring_pause_op)(struct vhost_dev *dev);
>   
> +typedef int (*vhost_get_iova_range)(struct vhost_dev *dev,
> +                                    hwaddr *first, hwaddr *last);
> +
>   typedef struct VhostOps {
>       VhostBackendType backend_type;
>       vhost_backend_init vhost_backend_init;
> @@ -173,6 +177,7 @@ typedef struct VhostOps {
>       vhost_get_device_id_op vhost_get_device_id;
>       vhost_vring_pause_op vhost_vring_pause;
>       vhost_force_iommu_op vhost_force_iommu;
> +    vhost_get_iova_range vhost_get_iova_range;
>   } VhostOps;
>   
>   extern const VhostOps user_ops;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 01d2101d09..74fe92935e 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -579,6 +579,23 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
>       return true;
>   }
>   
> +static int vhost_vdpa_get_iova_range(struct vhost_dev *dev,
> +                                     hwaddr *first, hwaddr *last)
> +{
> +    int ret;
> +    struct vhost_vdpa_iova_range range;
> +
> +    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_IOVA_RANGE, &range);
> +    if (ret != 0) {
> +        return ret;
> +    }
> +
> +    *first = range.first;
> +    *last = range.last;
> +    trace_vhost_vdpa_get_iova_range(dev, *first, *last);
> +    return ret;
> +}
> +
>   const VhostOps vdpa_ops = {
>           .backend_type = VHOST_BACKEND_TYPE_VDPA,
>           .vhost_backend_init = vhost_vdpa_init,
> @@ -611,4 +628,5 @@ const VhostOps vdpa_ops = {
>           .vhost_get_device_id = vhost_vdpa_get_device_id,
>           .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>           .vhost_force_iommu = vhost_vdpa_force_iommu,
> +        .vhost_get_iova_range = vhost_vdpa_get_iova_range,
>   };
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index c62727f879..5debe3a681 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
>   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
>   vhost_vdpa_set_owner(void *dev) "dev: %p"
>   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
>   
>   # virtio.c
>   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"


