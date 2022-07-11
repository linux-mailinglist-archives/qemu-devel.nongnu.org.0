Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95256F99A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:06:10 +0200 (CEST)
Received: from localhost ([::1]:58130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oApMn-0004Vf-Ck
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApJE-0001rA-6E
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApJ1-000355-Tt
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657530133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zgode2mdm9IHZZecJW+AkD2jbXyDBiwDFSVVcVWRMg=;
 b=XFm/EKDF0GRaoWi84k9g5RGP4QtlnXYWW7s4czZBkRe4Ff6XrD1k5mIcDU+e2LAHy+2qOH
 DyPim/DL+dQvbbA9Q6gZ2wQ0x4X7imJu9eY+Oj71B+DojkeA2T9CPzRBam1thgnrovlpYA
 JWJFl9/kjrOa1U/9WcsrAYXzNkn2n1A=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-9iP2Am41OfSThRMTzRytaw-1; Mon, 11 Jul 2022 05:02:12 -0400
X-MC-Unique: 9iP2Am41OfSThRMTzRytaw-1
Received: by mail-pf1-f200.google.com with SMTP id
 by4-20020a056a00400400b005251029fd97so780972pfb.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4zgode2mdm9IHZZecJW+AkD2jbXyDBiwDFSVVcVWRMg=;
 b=K9QKmcrghWzy9NmA8GwteCsq77RepgF6W0DUhCTDVSAj+ruO0P26gNYxVAKCVzyYvd
 mNtMssJoRvoWGPl4t1lNNXPu9w2BtIc5xYz8hjunZg26b959q0ujohCNlGyWP7ne7brb
 pIpEszjjBzUsw7vBszCbypVq4kfiY6BsEBQHXIHDd+21OC57lXafG2c5dCc7evSVa+qX
 1j6waOh35eYrhqbGfemXTLunHdSCINxInkIVcQO8O1jYvggIiCWxwDZplcAVVPuTzjNT
 edZpMmLReM4IDHpprkP+OUdXKt7xZtmeEbcuOj/5/HNVcsdOZ+wU1lLj3KT5ImDHbqdN
 krNQ==
X-Gm-Message-State: AJIora8J3jxtqvlM06MrnxnBrOeuk0erjivrr/O5kHtrBFtVK7qGr7G6
 Go7eD8bznCcqOC10J06/pQnYEMwWn0Kh6szQulz/jRGRdYXO8a6XCuCIWo0aUffqfzC0jcO9bZC
 4OVZ686YZ42HLo6k=
X-Received: by 2002:a17:902:d4c5:b0:16c:48bd:3585 with SMTP id
 o5-20020a170902d4c500b0016c48bd3585mr4593387plg.79.1657530131047; 
 Mon, 11 Jul 2022 02:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vmnosnm0h/pd/o679xO+Dnkk0SV3yh/NIAIK8Nv/J0uSn7D3Caloosh/X2h3WK/CRS2G3ZuA==
X-Received: by 2002:a17:902:d4c5:b0:16c:48bd:3585 with SMTP id
 o5-20020a170902d4c500b0016c48bd3585mr4593352plg.79.1657530130797; 
 Mon, 11 Jul 2022 02:02:10 -0700 (PDT)
Received: from [10.72.13.128] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a170902e80100b0016bb24f5d19sm4177232plg.209.2022.07.11.02.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 02:02:10 -0700 (PDT)
Message-ID: <bf07d1d1-6429-f895-dd5d-24adcd3719be@redhat.com>
Date: Mon, 11 Jul 2022 17:02:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 11/23] vhost: Move last chain id to SVQ element
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-12-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


在 2022/7/7 02:39, Eugenio Pérez 写道:
> We will allow SVQ user to store opaque data for each element, so its
> easier if we store this kind of information just at avail.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Note that kernel driver doesn't have this optimization so far.  I wonder 
if this is not a must, let's post this on top of the shadow CVQ stuffs.

Thanks


> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  3 +++
>   hw/virtio/vhost-shadow-virtqueue.c | 14 ++++++++------
>   2 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index e434dc63b0..0e434e9fd0 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -17,6 +17,9 @@
>   
>   typedef struct SVQElement {
>       VirtQueueElement *elem;
> +
> +    /* Last descriptor of the chain */
> +    uint32_t last_chain_id;
>   } SVQElement;
>   
>   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index cf1745fd4d..c5e49e51c5 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -239,7 +239,9 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>                             size_t out_num, const struct iovec *in_sg,
>                             size_t in_num, VirtQueueElement *elem)
>   {
> +    SVQElement *svq_elem;
>       unsigned qemu_head;
> +    size_t n;
>       bool ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num,
>                                     &qemu_head);
>       if (unlikely(!ok)) {
> @@ -247,7 +249,10 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>           return false;
>       }
>   
> -    svq->ring_id_maps[qemu_head].elem = elem;
> +    n = out_num + in_num;
> +    svq_elem = &svq->ring_id_maps[qemu_head];
> +    svq_elem->elem = elem;
> +    svq_elem->last_chain_id = vhost_svq_last_desc_of_chain(svq, n, qemu_head);
>       return true;
>   }
>   
> @@ -400,7 +405,7 @@ static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
>       const vring_used_t *used = svq->vring.used;
>       vring_used_elem_t used_elem;
>       SVQElement svq_elem = vhost_svq_empty_elem();
> -    uint16_t last_used, last_used_chain, num;
> +    uint16_t last_used;
>   
>       if (!vhost_svq_more_used(svq)) {
>           return svq_elem;
> @@ -428,11 +433,8 @@ static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
>           return svq_elem;
>       }
>   
> -    num = svq_elem.elem->in_num + svq_elem.elem->out_num;
> -    last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
> -    svq->desc_next[last_used_chain] = svq->free_head;
> +    svq->desc_next[svq_elem.last_chain_id] = svq->free_head;
>       svq->free_head = used_elem.id;
> -
>       *len = used_elem.len;
>       return svq_elem;
>   }


