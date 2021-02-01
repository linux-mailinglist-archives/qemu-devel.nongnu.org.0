Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96130A1DB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 07:11:59 +0100 (CET)
Received: from localhost ([::1]:40918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6SRI-0006UT-KE
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 01:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l6SQP-0005xG-Ap
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 01:11:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l6SQN-0000kr-P6
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 01:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612159858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fmf3/F4bar93epA9jgT+XZRxFS/bi7T0OzcismX32KQ=;
 b=g5fxPwfuPBtG7ElU4i9Xq0BDxjITN7d75pTwOefWxteoEkWMOWm8gvJQxlmU7in22nOMbE
 ZPNgaXAgFvDBBvatFsZpnrMCjBDF8y1q449FhLm7ISgqyIleLwRV8g6FjyYedG45xT91j6
 Xd+GRCm2bNvvDQLgCMfK8HIhJFNOISI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Ndapx0jlNLWAIfVCrybtsA-1; Mon, 01 Feb 2021 01:10:55 -0500
X-MC-Unique: Ndapx0jlNLWAIfVCrybtsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8BB0190D344;
 Mon,  1 Feb 2021 06:10:53 +0000 (UTC)
Received: from [10.72.13.120] (ovpn-13-120.pek2.redhat.com [10.72.13.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9874E5D9DC;
 Mon,  1 Feb 2021 06:10:41 +0000 (UTC)
Subject: Re: [RFC 03/10] virtio: Add virtio_queue_get_idx
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f440260b-d970-548f-8d0d-5e3deb403773@redhat.com>
Date: Mon, 1 Feb 2021 14:10:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129205415.876290-4-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/30 上午4:54, Eugenio Pérez wrote:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/virtio.h | 2 ++
>   hw/virtio/virtio.c         | 5 +++++
>   2 files changed, 7 insertions(+)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 9988c6d5c9..9013c03424 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -399,6 +399,8 @@ static inline bool virtio_device_disabled(VirtIODevice *vdev)
>       return unlikely(vdev->disabled || vdev->broken);
>   }
>   
> +unsigned virtio_queue_get_idx(const VirtIODevice *vdev, const VirtQueue *vq);
> +
>   bool virtio_legacy_allowed(VirtIODevice *vdev);
>   bool virtio_legacy_check_disabled(VirtIODevice *vdev);
>   
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index ebb780fb42..3d14b0ef74 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -500,6 +500,11 @@ void virtio_queue_set_notification(VirtQueue *vq, int enable)
>       }
>   }
>   
> +unsigned virtio_queue_get_idx(const VirtIODevice *vdev, const VirtQueue *vq)
> +{
> +    return vq - vdev->vq;
> +}


It looks to me we had a dedicated index stored in VirtQueue: 
vq->queue_index.

Thanks


> +
>   int virtio_queue_ready(VirtQueue *vq)
>   {
>       return vq->vring.avail != 0;


