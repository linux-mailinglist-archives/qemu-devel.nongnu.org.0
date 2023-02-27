Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEC6A3BF9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWY1u-00068P-TU; Mon, 27 Feb 2023 02:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWY1m-000680-Kz
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:34:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWY1j-0007xo-Li
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677483259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LNyh6ty354TqaT+I9MM6JrQEa/RfxXfuVfvsohl8EN4=;
 b=Io9yNUam/3Zfw8eyaRXN+UVd+/WDEuUkngXiXinIsUXMk6V5tCjsjIeaQcT/OYmnXkCX8r
 E5wf2TQgEdHoaF3QeDJdSZ7+M6bwUObieEuwyLLJDSwZg5eD25vWaWNs5GVPDMsUPnUKdY
 nJ6n2M8oyDyrRna59GtgPozQwYvTD9s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344--aNLmRs3Nzq3OvihUnnCSA-1; Mon, 27 Feb 2023 02:34:18 -0500
X-MC-Unique: -aNLmRs3Nzq3OvihUnnCSA-1
Received: by mail-pj1-f69.google.com with SMTP id
 d3-20020a17090acd0300b00237659aae8dso4756398pju.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 23:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LNyh6ty354TqaT+I9MM6JrQEa/RfxXfuVfvsohl8EN4=;
 b=6Td7JGzraXeQcLGWdw/8xLUJWm6Zbl/+Q2jUgoBemPc6D3Dt4sCRpak2NoYg0mX6kg
 2rnGnWSTTCHjkTF4gEJdhWS8cmgUS2s6kiHD8QUDBxHDdw0hirbSeonH0QNRW0gZHMBK
 wEd6eoTARNz01pe6WXu8Vg2w8m4kLFTUuqaXt4n0dfiAWeWCPk8fmpNOKkrTo5dQ9nIe
 5ZW0SF9wsHrD5fZCBq8VbzXmtCETi4Cngy+fuWcPE2wr6CTDdKeZg/tNmO+LlAU2hf1y
 h4Dgow9ZARjHnLgapKyddHo4h4vMBQiwzUbAl19nYvLp9b2aitrZ1Q/3WQvU7C3odvg3
 i5gw==
X-Gm-Message-State: AO0yUKUWYKsPhxI8iieB4TLEAQ9J/me5vFEKFloYobcOfb7Wrsn75Efk
 Q2vJZ9bw8X7B4kVb5Kr9u9HANfoQ0Z4AzLnX61XqDRMV2mFIrh0yhIGVID4JQK7M7qki2h8nbOr
 HbUlGWU0MlHfLcW0=
X-Received: by 2002:a17:903:78b:b0:19d:473:4dca with SMTP id
 kn11-20020a170903078b00b0019d04734dcamr3546034plb.15.1677483256843; 
 Sun, 26 Feb 2023 23:34:16 -0800 (PST)
X-Google-Smtp-Source: AK7set8vREmQ9wU019pF54R3mtn9CLTcVfGuTTUOnsyzFyQcC2yVw9Ha6UyGLkRkJm3BIC/YcTn+UQ==
X-Received: by 2002:a17:903:78b:b0:19d:473:4dca with SMTP id
 kn11-20020a170903078b00b0019d04734dcamr3545908plb.15.1677483252246; 
 Sun, 26 Feb 2023 23:34:12 -0800 (PST)
Received: from [10.72.13.83] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d91-20020a17090a6f6400b00233b1da232csm5531088pjk.41.2023.02.26.23.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 23:34:11 -0800 (PST)
Message-ID: <83e6d634-3f03-e10b-eebc-b3a9c9c8705e@redhat.com>
Date: Mon, 27 Feb 2023 15:34:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 08/15] vdpa: rewind at get_base, not set_base
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-9-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230224155438.112797-9-eperezma@redhat.com>
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


在 2023/2/24 23:54, Eugenio Pérez 写道:
> At this moment it is only possible to migrate to a vdpa device running
> with x-svq=on. As a protective measure, the rewind of the inflight
> descriptors was done at the destination. That way if the source sent a
> virtqueue with inuse descriptors they are always discarded.
>
> Since this series allows to migrate also to passthrough devices with no
> SVQ, the right thing to do is to rewind at the source so the base of
> vrings are correct.
>
> Support for inflight descriptors may be added in the future.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>

Thanks


> ---
> v4:
> * Use virtqueue_unpop at vhost_svq_stop instead of rewinding at
>    vhost_vdpa_get_vring_base.
> ---
>   hw/virtio/vhost-shadow-virtqueue.c |  8 ++++++--
>   hw/virtio/vhost-vdpa.c             | 11 -----------
>   2 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 4307296358..523b379439 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -694,13 +694,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>           g_autofree VirtQueueElement *elem = NULL;
>           elem = g_steal_pointer(&svq->desc_state[i].elem);
>           if (elem) {
> -            virtqueue_detach_element(svq->vq, elem, 0);
> +            /*
> +             * TODO: This is ok for networking, but other kinds of devices
> +             * might have problems with just unpop these.
> +             */
> +            virtqueue_unpop(svq->vq, elem, 0);
>           }
>       }
>   
>       next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
>       if (next_avail_elem) {
> -        virtqueue_detach_element(svq->vq, next_avail_elem, 0);
> +        virtqueue_unpop(svq->vq, next_avail_elem, 0);
>       }
>       svq->vq = NULL;
>       g_free(svq->desc_next);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index f542960a64..71e3dc21fe 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1218,18 +1218,7 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
>                                          struct vhost_vring_state *ring)
>   {
>       struct vhost_vdpa *v = dev->opaque;
> -    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
>   
> -    /*
> -     * vhost-vdpa devices does not support in-flight requests. Set all of them
> -     * as available.
> -     *
> -     * TODO: This is ok for networking, but other kinds of devices might
> -     * have problems with these retransmissions.
> -     */
> -    while (virtqueue_rewind(vq, 1)) {
> -        continue;
> -    }
>       if (v->shadow_vqs_enabled) {
>           /*
>            * Device vring base was set at device start. SVQ base is handled by


