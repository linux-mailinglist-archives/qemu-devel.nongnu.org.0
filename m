Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A01CD028
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 05:07:31 +0200 (CEST)
Received: from localhost ([::1]:60926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXymx-00075x-2g
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 23:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jXylw-0006Kx-4p
 for qemu-devel@nongnu.org; Sun, 10 May 2020 23:06:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58031
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jXylv-00036j-7w
 for qemu-devel@nongnu.org; Sun, 10 May 2020 23:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589166386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8sskrjpGJWQKTxxkIPnWrXY+VNuY/blopfi1zc5aME=;
 b=eY61rrXp/3EbnwYI9myI7OzlVlbCVpZS2qRyC+3J6Ml9r1pfAOIsPGtzV5SeyCz8pBa+9l
 NLcJDB2vC45VjO6N0QvStnwt8dKv2ytfxTSmOE72GeRlgPnesdhZ5UkCYK43RgZJwNMHVl
 670blkQ358oKnFCaZIuqcR6V3sERsn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-RXIGtYYtMsmsf_ipAJNmkQ-1; Sun, 10 May 2020 23:06:24 -0400
X-MC-Unique: RXIGtYYtMsmsf_ipAJNmkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2D7E835B40;
 Mon, 11 May 2020 03:06:15 +0000 (UTC)
Received: from [10.72.12.137] (ovpn-12-137.pek2.redhat.com [10.72.12.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BA3638E;
 Mon, 11 May 2020 03:06:00 +0000 (UTC)
Subject: Re: [PATCH v2 4/5] vhost: check vring address before calling unmap
To: Dima Stepanov <dimastep@yandex-team.ru>, qemu-devel@nongnu.org
References: <cover.1588252861.git.dimastep@yandex-team.ru>
 <2d4952df2cc246f7421b4b9023a581b22210fc41.1588252862.git.dimastep@yandex-team.ru>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4a03e4aa-3a21-d678-be98-13268343b674@redhat.com>
Date: Mon, 11 May 2020 11:05:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2d4952df2cc246f7421b4b9023a581b22210fc41.1588252862.git.dimastep@yandex-team.ru>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 23:06:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, kwolf@redhat.com, yc-core@yandex-team.ru,
 qemu-block@nongnu.org, mst@redhat.com, dgilbert@redhat.com, mreitz@redhat.com,
 arei.gonglei@huawei.com, fengli@smartx.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/4/30 下午9:36, Dima Stepanov wrote:
> Since disconnect can happen at any time during initialization not all
> vring buffers (for instance used vring) can be intialized successfully.
> If the buffer was not initialized then vhost_memory_unmap call will lead
> to SIGSEGV. Add checks for the vring address value before calling unmap.
> Also add assert() in the vhost_memory_unmap() routine.
>
> Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
> ---
>   hw/virtio/vhost.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index ddbdc53..3ee50c4 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -314,6 +314,8 @@ static void vhost_memory_unmap(struct vhost_dev *dev, void *buffer,
>                                  hwaddr len, int is_write,
>                                  hwaddr access_len)
>   {
> +    assert(buffer);
> +
>       if (!vhost_dev_has_iommu(dev)) {
>           cpu_physical_memory_unmap(buffer, len, is_write, access_len);
>       }
> @@ -1132,12 +1134,25 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
>                                                   vhost_vq_index);
>       }
>   
> -    vhost_memory_unmap(dev, vq->used, virtio_queue_get_used_size(vdev, idx),
> -                       1, virtio_queue_get_used_size(vdev, idx));
> -    vhost_memory_unmap(dev, vq->avail, virtio_queue_get_avail_size(vdev, idx),
> -                       0, virtio_queue_get_avail_size(vdev, idx));
> -    vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
> -                       0, virtio_queue_get_desc_size(vdev, idx));
> +    /*
> +     * Since the vhost-user disconnect can happen during initialization
> +     * check if vring was initialized, before making unmap.
> +     */
> +    if (vq->used) {
> +        vhost_memory_unmap(dev, vq->used,
> +                           virtio_queue_get_used_size(vdev, idx),
> +                           1, virtio_queue_get_used_size(vdev, idx));
> +    }
> +    if (vq->avail) {
> +        vhost_memory_unmap(dev, vq->avail,
> +                           virtio_queue_get_avail_size(vdev, idx),
> +                           0, virtio_queue_get_avail_size(vdev, idx));
> +    }
> +    if (vq->desc) {
> +        vhost_memory_unmap(dev, vq->desc,
> +                           virtio_queue_get_desc_size(vdev, idx),
> +                           0, virtio_queue_get_desc_size(vdev, idx));
> +    }


Any reason not checking hdev->started instead? vhost_dev_start() will 
set it to true if virtqueues were correctly mapped.

Thanks


>   }
>   
>   static void vhost_eventfd_add(MemoryListener *listener,


