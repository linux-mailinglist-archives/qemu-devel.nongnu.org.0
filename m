Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D33E62D3A1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 07:52:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovYkx-0006zh-JF; Thu, 17 Nov 2022 01:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovYkm-0006wX-Pn
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 01:52:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ovYkk-0006t8-EU
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 01:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668667919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rbU31RtGVYLfg4O3Trb1BvKjAcaXkSmbmDSuqwJzErA=;
 b=V31YEzY1q69b/Gg/YmqP7NqYMGqn7iaML0u+ceKQCB58CQuGj+10bB4l4smj+sW6dApF7E
 mVh8C6n+Rkd24BDmFUTOTsiIBz7Xfc8DTdetr4NVJiyDCdke6l3ECrFbiEnae/2GJ7i5k1
 vg93EzNr3wvu7Jset9SglvZAiBXhyNY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-ekThRq93NAymtFDPsZzQ4g-1; Thu, 17 Nov 2022 01:51:57 -0500
X-MC-Unique: ekThRq93NAymtFDPsZzQ4g-1
Received: by mail-pl1-f198.google.com with SMTP id
 n12-20020a170902e54c00b00188515e81a6so742698plf.23
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 22:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rbU31RtGVYLfg4O3Trb1BvKjAcaXkSmbmDSuqwJzErA=;
 b=S6gcktKoRTJ5aWZfPCpcnJKurf2NXAWwKPZORkJfdS9x8vxapTqqeSXF4B7h+z3hkF
 v1AHn4iPIGnuvPLCYD59dtQ7EY58OPk1nyND0Mqz+RDECRMqJpuxtmTqu5l/471oTpLh
 J79i9e8110K9R8XJoK+p1oc6kuTj4euksBrRleBgF817YpGYF9a+sw8znRMfpM8nSa6U
 KWV3S+xMj25ZxsaEhEH3Vu4FYD97tmmUwDvuqYLc7f8nFhvNduDe1wERGQkhS88C4WJ4
 rf3HuOCIb/5G/CnQsp6onGBnaSCYTUqAmo7Sfchmd+HYe8o0coWNbXgiEp6TeB4qLY//
 lsQg==
X-Gm-Message-State: ANoB5pmGOxA4em8PEFAP4T1tGlK6aDIytBhqSfw3SoZvF6uzDZNGtXWX
 NkLblX9pSrMTCqUc5kDouTHArXM3TSSHRTq2bhw4X7/8nonIKQF4XqBI8LOrIxetOrud+PHig8p
 GHiJtJSVHBpo50og=
X-Received: by 2002:a63:4b07:0:b0:46e:9363:d96e with SMTP id
 y7-20020a634b07000000b0046e9363d96emr930541pga.85.1668667915800; 
 Wed, 16 Nov 2022 22:51:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7uEPMxxM20WDRomEVyVlJvMpsYi2YDb+yv5Lw+UkIN9h3fUtxBJTPQfhOnfza8hl3OXmmISg==
X-Received: by 2002:a63:4b07:0:b0:46e:9363:d96e with SMTP id
 y7-20020a634b07000000b0046e9363d96emr930507pga.85.1668667915476; 
 Wed, 16 Nov 2022 22:51:55 -0800 (PST)
Received: from [10.72.13.24] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa79f87000000b005625d5ae760sm271304pfr.11.2022.11.16.22.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 22:51:55 -0800 (PST)
Message-ID: <f22d530b-3c5e-5b94-948d-594608668687@redhat.com>
Date: Thu, 17 Nov 2022 14:51:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for 8.0 v7 10/10] vdpa: Always start CVQ in SVQ mode if
 possible
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Parav Pandit
 <parav@mellanox.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org
References: <20221116150556.1294049-1-eperezma@redhat.com>
 <20221116150556.1294049-11-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221116150556.1294049-11-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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


在 2022/11/16 23:05, Eugenio Pérez 写道:
> Isolate control virtqueue in its own group, allowing to intercept control
> commands but letting dataplane run totally passthrough to the guest.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
> v7:
> * Never ask for number of address spaces, just react if isolation is not
>    possible.
> * Return ASID ioctl errors instead of masking them as if the device has
>    no asid.
> * Simplify net_init_vhost_vdpa logic
> * Add "if possible" suffix
>
> v6:
> * Disable control SVQ if the device does not support it because of
> features.
>
> v5:
> * Fixing the not adding cvq buffers when x-svq=on is specified.
> * Move vring state in vhost_vdpa_get_vring_group instead of using a
>    parameter.
> * Rename VHOST_VDPA_NET_CVQ_PASSTHROUGH to VHOST_VDPA_NET_DATA_ASID
>
> v4:
> * Squash vhost_vdpa_cvq_group_is_independent.
> * Rebased on last CVQ start series, that allocated CVQ cmd bufs at load
> * Do not check for cvq index on vhost_vdpa_net_prepare, we only have one
>    that callback registered in that NetClientInfo.
>
> v3:
> * Make asid related queries print a warning instead of returning an
>    error and stop the start of qemu.
> ---
>   hw/virtio/vhost-vdpa.c |   3 +-
>   net/vhost-vdpa.c       | 117 +++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 114 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 852baf8b2c..a29a18a6a9 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -653,7 +653,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>   {
>       uint64_t features;
>       uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
> -        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
> +        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
>       int r;
>   
>       if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index a9c864741a..dc13a49311 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -101,6 +101,8 @@ static const uint64_t vdpa_svq_device_features =
>       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
>       BIT_ULL(VIRTIO_NET_F_STANDBY);
>   
> +#define VHOST_VDPA_NET_CVQ_ASID 1
> +
>   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>   {
>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> @@ -242,6 +244,40 @@ static NetClientInfo net_vhost_vdpa_info = {
>           .check_peer_type = vhost_vdpa_check_peer_type,
>   };
>   
> +static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
> +{
> +    struct vhost_vring_state state = {
> +        .index = vq_index,
> +    };
> +    int r = ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
> +
> +    if (unlikely(r < 0)) {
> +        error_report("Cannot get VQ %u group: %s", vq_index,
> +                     g_strerror(errno));
> +        return r;
> +    }
> +
> +    return state.num;
> +}
> +
> +static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
> +                                           unsigned vq_group,
> +                                           unsigned asid_num)
> +{
> +    struct vhost_vring_state asid = {
> +        .index = vq_group,
> +        .num = asid_num,
> +    };
> +    int r;
> +
> +    r = ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
> +    if (unlikely(r < 0)) {
> +        error_report("Can't set vq group %u asid %u, errno=%d (%s)",
> +                     asid.index, asid.num, errno, g_strerror(errno));
> +    }
> +    return r;
> +}
> +
>   static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
>   {
>       VhostIOVATree *tree = v->iova_tree;
> @@ -316,11 +352,69 @@ dma_map_err:
>   static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>   {
>       VhostVDPAState *s;
> -    int r;
> +    struct vhost_vdpa *v;
> +    uint64_t backend_features;
> +    int64_t cvq_group;
> +    int cvq_index, r;
>   
>       assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>   
>       s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    v = &s->vhost_vdpa;
> +
> +    v->shadow_data = s->always_svq;
> +    v->shadow_vqs_enabled = s->always_svq;
> +    s->vhost_vdpa.address_space_id = VHOST_VDPA_GUEST_PA_ASID;
> +
> +    if (s->always_svq) {
> +        goto out;
> +    }
> +
> +    /* Backend features are not available in v->dev yet. */
> +    r = ioctl(v->device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features);
> +    if (unlikely(r < 0)) {
> +        error_report("Cannot get vdpa backend_features: %s(%d)",
> +            g_strerror(errno), errno);
> +        return -1;
> +    }
> +    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
> +        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {


I think there should be some logic to block migration in this case?


> +        return 0;
> +    }
> +
> +    /**
> +     * Check if all the virtqueues of the virtio device are in a different vq
> +     * than the last vq. VQ group of last group passed in cvq_group.
> +     */
> +    cvq_index = v->dev->vq_index_end - 1;
> +    cvq_group = vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
> +    if (unlikely(cvq_group < 0)) {
> +        return cvq_group;x
> +    }
> +    for (int i = 0; i < cvq_index; ++i) {
> +        int64_t group = vhost_vdpa_get_vring_group(v->device_fd, i);
> +
> +        if (unlikely(group < 0)) {
> +            return group;
> +        }
> +
> +        if (unlikely(group == cvq_group)) {
> +            warn_report(
> +                "CVQ %"PRId64" group is the same as VQ %d one (%"PRId64")",
> +                cvq_group, i, group);
> +            return 0;


Ditto.


> +        }
> +    }
> +
> +    r = vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET_CVQ_ASID);
> +    if (unlikely(r < 0)) {
> +        return r;
> +    } else {
> +        v->shadow_vqs_enabled = true;
> +        s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
> +    }
> +
> +out:
>       if (!s->vhost_vdpa.shadow_vqs_enabled) {
>           return 0;
>       }
> @@ -652,6 +746,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       g_autoptr(VhostIOVATree) iova_tree = NULL;
>       NetClientState *nc;
>       int queue_pairs, r, i = 0, has_cvq = 0;
> +    bool svq_cvq;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>       opts = &netdev->u.vhost_vdpa;
> @@ -693,12 +788,24 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>           return queue_pairs;
>       }
>   
> -    if (opts->x_svq) {
> -        struct vhost_vdpa_iova_range iova_range;
> +    svq_cvq = opts->x_svq || has_cvq;
> +    if (svq_cvq) {
> +        Error *warn = NULL;
>   
> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> -            goto err_svq;
> +        svq_cvq = vhost_vdpa_net_valid_svq_features(features,
> +                                                   opts->x_svq ? errp : &warn);
> +        if (!svq_cvq) {
> +            if (opts->x_svq) {
> +                goto err_svq;
> +            } else {
> +                warn_reportf_err(warn, "Cannot shadow CVQ: ");


This seems suspicious, we reach here we we can't just use svq for cvq.



> +            }
>           }


The above logic is not easy to follow. I guess the root cause is the 
variable name. It looks to me svq_cvq is better to be renamed as "svq"?

Thanks


> +    }
> +
> +    if (svq_cvq) {
> +        /* Allocate a common iova tree if there is a possibility of SVQ */
> +        struct vhost_vdpa_iova_range iova_range;
>   
>           vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
>           iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);


