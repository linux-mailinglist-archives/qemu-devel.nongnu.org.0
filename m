Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67575004B5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:40:13 +0200 (CEST)
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqL6-0006IH-UY
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqJu-0005Qc-4C
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:38:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqJs-00034i-Is
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649907535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjzn/njkWKVm9Aq/dD37bc+8GkjYWrurqjE4+N/0JOc=;
 b=S2m660Hl03Fp5vSnHB8YYKa85kC86jVQ5j1k37O/RtkVMarJ7CblNeHYkoEbhmYIWsxZZ4
 dKehMuLqqgPkBuAwD01JRwEvoMSGLYGrl019EXIFYszMm8+3PS5MX8t9fqC3SS1d5TXkdc
 jcXrjZMHeSLFOEobi33+oQunRA8TAcQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-ZUM1-sCzMxaJ2JqtknL--g-1; Wed, 13 Apr 2022 23:38:54 -0400
X-MC-Unique: ZUM1-sCzMxaJ2JqtknL--g-1
Received: by mail-pg1-f200.google.com with SMTP id
 q13-20020a638c4d000000b003821725ad66so2088491pgn.23
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tjzn/njkWKVm9Aq/dD37bc+8GkjYWrurqjE4+N/0JOc=;
 b=3ncOv2mcFRfYx8SvvyiYDVc1CV+8N+rW/HwJuSqjPE/981u2imtCXflj08go3DMikH
 hWN0NI1IQBn+Q7xWU6Q8znDbgMbwl+P410J1xU7eXwVzTJkprb5zej5Mj0yygx0aglsU
 jtM/ivqnJRcB2q1uui/CoFhi6aDGDcz+K9R2l4X2DHEnKmRDpGHJWa47Mas7vKJrMOlK
 phcU88iagfnMpGjnjag2b6GX61efWeFpVNgND4eGMrSDAdOB/jtAfDFz68KfdbSFzFck
 OAztagFO21Q7KM+SrrdQEPAAt3r0AtoXZnL2IUeSquclmqXIxR3+wJQf43tLvYP+EGdI
 IrJQ==
X-Gm-Message-State: AOAM532I6uIsINiB+M73gal6qOJzf6smW9oTaLQ+1MMSbzhqhhIIuFn4
 ZfkPOwPi2l2VKbeQCYR10ZBqqCF48x8v7oMlWgM7U3kadBl3CPOos5mOoTaDyxHLEjKy1Brs9uV
 9gmXmq5WigC7shsg=
X-Received: by 2002:a63:1325:0:b0:39d:8eaa:27f7 with SMTP id
 i37-20020a631325000000b0039d8eaa27f7mr661598pgl.297.1649907533316; 
 Wed, 13 Apr 2022 20:38:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEJ9lif8qZPp1hmvCQP/RwooeiH7VHBXpgN3Rfq7j1/dmOGCj7439e0hMJFhuwKem/lNJ8XA==
X-Received: by 2002:a63:1325:0:b0:39d:8eaa:27f7 with SMTP id
 i37-20020a631325000000b0039d8eaa27f7mr661567pgl.297.1649907533030; 
 Wed, 13 Apr 2022 20:38:53 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a056a00240700b004e1cde37bc1sm507431pfh.84.2022.04.13.20.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 20:38:52 -0700 (PDT)
Message-ID: <2a158730-570b-998a-0773-21c4b60e97db@redhat.com>
Date: Thu, 14 Apr 2022 11:38:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v5 05/23] vhost: Fix bad return of descriptors to SVQ
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220408133415.1371760-1-eperezma@redhat.com>
 <20220408133415.1371760-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220408133415.1371760-6-eperezma@redhat.com>
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
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/8 21:33, Eugenio Pérez 写道:
> Only the first one of them were properly enqueued back.
>
> Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   hw/virtio/vhost-shadow-virtqueue.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index b232803d1b..c17506df20 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -333,13 +333,25 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
>       svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
>   }
>   
> +static uint16_t vhost_svq_last_desc_of_chain(VhostShadowVirtqueue *svq,
> +                                             uint16_t i)
> +{
> +    vring_desc_t *descs = svq->vring.desc;
> +
> +    while (le16_to_cpu(descs[i].flags) & VRING_DESC_F_NEXT) {
> +        i = le16_to_cpu(descs[i].next);
> +    }
> +
> +    return i;
> +}
> +
>   static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>                                              uint32_t *len)
>   {
>       vring_desc_t *descs = svq->vring.desc;
>       const vring_used_t *used = svq->vring.used;
>       vring_used_elem_t used_elem;
> -    uint16_t last_used;
> +    uint16_t last_used, last_used_chain;
>   
>       if (!vhost_svq_more_used(svq)) {
>           return NULL;
> @@ -365,7 +377,8 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>           return NULL;
>       }
>   
> -    descs[used_elem.id].next = svq->free_head;
> +    last_used_chain = vhost_svq_last_desc_of_chain(svq, used_elem.id);
> +    descs[last_used_chain].next = svq->free_head;
>       svq->free_head = used_elem.id;
>   
>       *len = used_elem.len;


