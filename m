Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CD4043DA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 05:13:03 +0200 (CEST)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOAUn-0006MV-PQ
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 23:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOASn-0003Ku-Dr
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mOASl-0002fA-SP
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631157054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmwPUUk4zTCiR554HSgKhpuVpyzN/I+D+VXqdmbbOjM=;
 b=jRTz2nGz0EiFDpUfB8/t3fxAXX3THOmsuHvfE3MbxFrk7b6BYftosDq8/pD0Y3g60srl+P
 mTAg6+UejOMI3bSYiCkZY4TFT8kD33KIFQpbXL958CQcDFhzGKY8gBMZpZLFfR4CspFuBz
 PdY8JF1G9DxIkfOfnQ3B16iGQ8SoxHY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-xORy0k3jMne6QTa8K-zI8g-1; Wed, 08 Sep 2021 23:10:53 -0400
X-MC-Unique: xORy0k3jMne6QTa8K-zI8g-1
Received: by mail-pj1-f69.google.com with SMTP id
 co10-20020a17090afe8a00b00195640ed21bso460059pjb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 20:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QmwPUUk4zTCiR554HSgKhpuVpyzN/I+D+VXqdmbbOjM=;
 b=HrnRinzX/2+15lmDHZzkVHH5bDwhSboRtAwRiCR2bwtO/ocYkv8DgGutUgxEJCGVeo
 amO/C/0UdyS+tTkG1BtUc2IuUkwXaax+aXNS5kSXyPx7ypusT+5dMpAdl80JZB3eyUe1
 RpSgu/n0xcetAEqWe2xZ5M605a4ESAcfKZJ/cKZInjBsxIm5laLac/TIPjPPigi20dzI
 NlR1IgEg7uFU6VpMAxwguRs5cBYqXs4jEu8xJnrO4hAqnG2tYLRwhIDkOaDhJQ7kMv15
 RstmfQyRpJ1lYVkbiIqK09IK1FIsQhuAG1LAkC/igrLFafIZN1ncMOYUyWui8emaiMaK
 41NQ==
X-Gm-Message-State: AOAM5317M9W0z5jqAenE7VYMVw7Rqkq0Tod9qM7XwjZGEFbuN4mx8887
 aWAbbDU29ePUahwadll6dNBxZOBZUX/qmSrpd4aTDsNYI5KnD/2hnJ1V2uVxjYfa1Aq0LWY85W/
 QzTKnOsEw13E/djA=
X-Received: by 2002:a63:f30c:: with SMTP id l12mr641243pgh.360.1631157051976; 
 Wed, 08 Sep 2021 20:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXo+SMqdjE0/rLqW2+gRWgGJCtGL3wt+XeEZsLFUZGliSjrVzPRJhBlHiKELSDXCSzsbHRHg==
X-Received: by 2002:a63:f30c:: with SMTP id l12mr641226pgh.360.1631157051649; 
 Wed, 08 Sep 2021 20:10:51 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z9sm276756pfa.2.2021.09.08.20.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 20:10:51 -0700 (PDT)
Subject: Re: [PATCH] virtio-net: fix use after unmap/free for sg
To: mst@redhat.com
References: <20210902054412.36615-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6e1a4d42-6eb8-af1a-57a3-056673fb6093@redhat.com>
Date: Thu, 9 Sep 2021 11:10:43 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902054412.36615-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mcascell@redhat.com, Alexander Bulekov <alxndr@bu.edu>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, darren.kenny@oracle.com,
 pj.pandit@yahoo.co.in
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/9/2 ÏÂÎç1:44, Jason Wang Ð´µÀ:
> When mergeable buffer is enabled, we try to set the num_buffers after
> the virtqueue elem has been unmapped. This will lead several issues,
> E.g a use after free when the descriptor has an address which belongs
> to the non direct access region. In this case we use bounce buffer
> that is allocated during address_space_map() and freed during
> address_space_unmap().
>
> Fixing this by storing the elems temporarily in an array and delay the
> unmap after we set the the num_buffers.
>
> This addresses CVE-2021-3748.
>
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Fixes: fbe78f4f55c6 ("virtio-net support")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Jason Wang <jasowang@redhat.com>


Applied.

Thanks


> ---
>   hw/net/virtio-net.c | 39 ++++++++++++++++++++++++++++++++-------
>   1 file changed, 32 insertions(+), 7 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 16d20cdee5..f205331dcf 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1746,10 +1746,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
>       VirtIONet *n = qemu_get_nic_opaque(nc);
>       VirtIONetQueue *q = virtio_net_get_subqueue(nc);
>       VirtIODevice *vdev = VIRTIO_DEVICE(n);
> +    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
> +    size_t lens[VIRTQUEUE_MAX_SIZE];
>       struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
>       struct virtio_net_hdr_mrg_rxbuf mhdr;
>       unsigned mhdr_cnt = 0;
> -    size_t offset, i, guest_offset;
> +    size_t offset, i, guest_offset, j;
> +    ssize_t err;
>   
>       if (!virtio_net_can_receive(nc)) {
>           return -1;
> @@ -1780,6 +1783,12 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
>   
>           total = 0;
>   
> +        if (i == VIRTQUEUE_MAX_SIZE) {
> +            virtio_error(vdev, "virtio-net unexpected long buffer chain");
> +            err = size;
> +            goto err;
> +        }
> +
>           elem = virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
>           if (!elem) {
>               if (i) {
> @@ -1791,7 +1800,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
>                                n->guest_hdr_len, n->host_hdr_len,
>                                vdev->guest_features);
>               }
> -            return -1;
> +            err = -1;
> +            goto err;
>           }
>   
>           if (elem->in_num < 1) {
> @@ -1799,7 +1809,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
>                            "virtio-net receive queue contains no in buffers");
>               virtqueue_detach_element(q->rx_vq, elem, 0);
>               g_free(elem);
> -            return -1;
> +            err = -1;
> +            goto err;
>           }
>   
>           sg = elem->in_sg;
> @@ -1836,12 +1847,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
>           if (!n->mergeable_rx_bufs && offset < size) {
>               virtqueue_unpop(q->rx_vq, elem, total);
>               g_free(elem);
> -            return size;
> +            err = size;
> +            goto err;
>           }
>   
> -        /* signal other side */
> -        virtqueue_fill(q->rx_vq, elem, total, i++);
> -        g_free(elem);
> +        elems[i] = elem;
> +        lens[i] = total;
> +        i++;
>       }
>   
>       if (mhdr_cnt) {
> @@ -1851,10 +1863,23 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
>                        &mhdr.num_buffers, sizeof mhdr.num_buffers);
>       }
>   
> +    for (j = 0; j < i; j++) {
> +        /* signal other side */
> +        virtqueue_fill(q->rx_vq, elems[j], lens[j], j);
> +        g_free(elems[j]);
> +    }
> +
>       virtqueue_flush(q->rx_vq, i);
>       virtio_notify(vdev, q->rx_vq);
>   
>       return size;
> +
> +err:
> +    for (j = 0; j < i; j++) {
> +        g_free(elems[j]);
> +    }
> +
> +    return err;
>   }
>   
>   static ssize_t virtio_net_do_receive(NetClientState *nc, const uint8_t *buf,


