Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C55004D3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:50:48 +0200 (CEST)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqVM-0002NV-01
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqT6-0001CS-O5
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqT4-0004fC-P3
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649908106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iylr6kISQiAmwLRLbVxMIXR0lqyeKvBZNx7CpSnsWnk=;
 b=W5mwjuQfc+S2TBOlnZMl6eKAqs5NbZhvrScMXRQtt7nhchFURFaOYVEBpk4FdF/oOi21jx
 rsADxcxMuDSkNuqrmNyIswGGAKYqqU83/ObySLa2oFao2PkPC+nnZME1y/+gjp5DkDH/Nr
 7jJV/R5IasVJUjIxznPDqTbUI7J+LKU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-U3GdJq_9NFOyQ899Fb30OA-1; Wed, 13 Apr 2022 23:48:25 -0400
X-MC-Unique: U3GdJq_9NFOyQ899Fb30OA-1
Received: by mail-pj1-f72.google.com with SMTP id
 i8-20020a17090a2a0800b001cb5c76ea21so2208396pjd.2
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Iylr6kISQiAmwLRLbVxMIXR0lqyeKvBZNx7CpSnsWnk=;
 b=t52WwD5ZX98cC+UQwyDW2ZC8oqvgVW+zt/tcNXdmYtI2pEHux89cba8Z9Pfw4+7M8A
 YnMcb5vs4bdqHf6RKGmB6btLthbMch8BF3OWu9mVX/95i2gPvyHbd2sYHGErFx/Q3yOz
 NxAy3al2y18NJHcndAxOvdYo+9adP3/xkXrydLpXHTvUQBGwcUObvwOBJjvZL3B6w/zz
 Lmm7pGdoEEubpdf/jcmGS5LgdjaD9gCpkfk16ug1WnPFRcDYWevOGz0HL0u3X/PNDWI9
 G0C2JoxhhKYuc9BuSwZhO3oXExo6cWoKp3uVkrt8ct2sIQA7D9FSCNzFC3e30/X3KPkS
 ncfg==
X-Gm-Message-State: AOAM5311e6j/pblLOneaKwvgsrVcu0CchrobZ1Gs99+7AgCtA6/ulctn
 4i7XcdndnMEgnxou/5hfeUMhOpgfzjJSvUzgRjyN7a3oytXXNEb8PuG27+HO52JJV6USqfQ6Q+n
 i+11mfxTZ3fblzNw=
X-Received: by 2002:a17:902:bb8d:b0:156:51a1:3f5a with SMTP id
 m13-20020a170902bb8d00b0015651a13f5amr45431578pls.65.1649908104012; 
 Wed, 13 Apr 2022 20:48:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR120QhEOFlB+5UCKukgOxM3GhXbnLdn7E5ZK+vUwmyRt9dX/VnSEYxhWQFh+7CoLX0rpq9w==
X-Received: by 2002:a17:902:bb8d:b0:156:51a1:3f5a with SMTP id
 m13-20020a170902bb8d00b0015651a13f5amr45431562pls.65.1649908103728; 
 Wed, 13 Apr 2022 20:48:23 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a635117000000b0039d4f859738sm527320pgb.71.2022.04.13.20.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 20:48:23 -0700 (PDT)
Message-ID: <e9258425-f6c9-5fc4-987d-f61b6f25f676@redhat.com>
Date: Thu, 14 Apr 2022 11:48:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 01/25] vhost: Track descriptor chain in private at
 SVQ
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/14 00:31, Eugenio Pérez 写道:
> Only the first one of them were properly enqueued back.


I wonder if it's better to use two patches:

1) using private chain

2) fix the chain issue

Patch looks good itself.

Thanks


>
> While we're at it, harden SVQ: The device could have access to modify
> them, and it definitely have access when we implement packed vq. Harden
> SVQ maintaining a private copy of the descriptor chain. Other fields
> like buffer addresses are already maintained sepparatedly.
>
> Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  6 ++++++
>   hw/virtio/vhost-shadow-virtqueue.c | 27 +++++++++++++++++++++------
>   2 files changed, 27 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index e5e24c536d..c132c994e9 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -53,6 +53,12 @@ typedef struct VhostShadowVirtqueue {
>       /* Next VirtQueue element that guest made available */
>       VirtQueueElement *next_guest_avail_elem;
>   
> +    /*
> +     * Backup next field for each descriptor so we can recover securely, not
> +     * needing to trust the device access.
> +     */
> +    uint16_t *desc_next;
> +
>       /* Next head to expose to the device */
>       uint16_t shadow_avail_idx;
>   
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index b232803d1b..a2531d5874 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -138,6 +138,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
>       for (n = 0; n < num; n++) {
>           if (more_descs || (n + 1 < num)) {
>               descs[i].flags = flags | cpu_to_le16(VRING_DESC_F_NEXT);
> +            descs[i].next = cpu_to_le16(svq->desc_next[i]);
>           } else {
>               descs[i].flags = flags;
>           }
> @@ -145,10 +146,10 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
>           descs[i].len = cpu_to_le32(iovec[n].iov_len);
>   
>           last = i;
> -        i = cpu_to_le16(descs[i].next);
> +        i = cpu_to_le16(svq->desc_next[i]);
>       }
>   
> -    svq->free_head = le16_to_cpu(descs[last].next);
> +    svq->free_head = le16_to_cpu(svq->desc_next[last]);
>   }
>   
>   static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
> @@ -333,13 +334,22 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
>       svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
>   }
>   
> +static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
> +                                             uint16_t num, uint16_t i)
> +{
> +    for (uint16_t j = 0; j < num; ++j) {
> +        i = le16_to_cpu(svq->desc_next[i]);
> +    }
> +
> +    return i;
> +}
> +
>   static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>                                              uint32_t *len)
>   {
> -    vring_desc_t *descs = svq->vring.desc;
>       const vring_used_t *used = svq->vring.used;
>       vring_used_elem_t used_elem;
> -    uint16_t last_used;
> +    uint16_t last_used, last_used_chain, num;
>   
>       if (!vhost_svq_more_used(svq)) {
>           return NULL;
> @@ -365,7 +375,10 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>           return NULL;
>       }
>   
> -    descs[used_elem.id].next = svq->free_head;
> +    num = svq->ring_id_maps[used_elem.id]->in_num +
> +          svq->ring_id_maps[used_elem.id]->out_num;
> +    last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
> +    svq->desc_next[last_used_chain] = svq->free_head;
>       svq->free_head = used_elem.id;
>   
>       *len = used_elem.len;
> @@ -540,8 +553,9 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
>       svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
>       memset(svq->vring.used, 0, device_size);
>       svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
> +    svq->desc_next = g_new0(uint16_t, svq->vring.num);
>       for (unsigned i = 0; i < svq->vring.num - 1; i++) {
> -        svq->vring.desc[i].next = cpu_to_le16(i + 1);
> +        svq->desc_next[i] = cpu_to_le16(i + 1);
>       }
>   }
>   
> @@ -574,6 +588,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>           virtqueue_detach_element(svq->vq, next_avail_elem, 0);
>       }
>       svq->vq = NULL;
> +    g_free(svq->desc_next);
>       g_free(svq->ring_id_maps);
>       qemu_vfree(svq->vring.desc);
>       qemu_vfree(svq->vring.used);


