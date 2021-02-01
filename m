Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72230A1D9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 07:07:52 +0100 (CET)
Received: from localhost ([::1]:38436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6SNL-0005EI-Ay
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 01:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l6SMF-0004fq-QI
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 01:06:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l6SMC-0007Ik-G8
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 01:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612159598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5RSZmL8s19fWZdZMsxGxac+DUCKkw9B0P1eYyaNAl/U=;
 b=CTRQ68NupRh2CKscZMt+g9EzsX8eu1m2D8frSuuKr1B1kSYWnium/XqcGDBmWdznXOS0wJ
 VqkFL7S2TTkcjYOo/nwVqIDaJUB2+q/GA3gc9bKJN53xKItdIKgqkGc+Sd7dPo35Cgvu0A
 +9QjJuoGXy9jqgPBn8GIOR9ATyGZY4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-bT8LE8mgOB2iyYRoV0nePw-1; Mon, 01 Feb 2021 01:06:36 -0500
X-MC-Unique: bT8LE8mgOB2iyYRoV0nePw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB2448042A3;
 Mon,  1 Feb 2021 06:06:35 +0000 (UTC)
Received: from [10.72.13.120] (ovpn-13-120.pek2.redhat.com [10.72.13.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1D5C5D9DC;
 Mon,  1 Feb 2021 06:06:27 +0000 (UTC)
Subject: Re: [PATCH] vhost: Check for valid vdev in
 vhost_backend_handle_iotlb_msg
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210129090728.831208-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <28b3542c-1f58-cc8a-be77-c2317aa75089@redhat.com>
Date: Mon, 1 Feb 2021 14:06:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129090728.831208-1-eperezma@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: maxime.coquelin@redhat.com, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/29 下午5:07, Eugenio Pérez wrote:
> Not checking this can lead to invalid dev->vdev member access in
> vhost_device_iotlb_miss if backend issue an iotlb message in a bad
> timing, either maliciously or by a bug.
>
> Reproduced rebooting a guest with testpmd in txonly forward mode.
>   #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
>       dev=dev@entry=0x55a0012f6680, iova=10245279744, write=1)
>       at ../hw/virtio/vhost.c:1013
>   #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
>       imsg=0x7ffddcfd32c0, dev=0x55a0012f6680)
>       at ../hw/virtio/vhost-backend.c:411
>   #2  vhost_backend_handle_iotlb_msg (dev=dev@entry=0x55a0012f6680,
>       imsg=imsg@entry=0x7ffddcfd32c0)
>       at ../hw/virtio/vhost-backend.c:404
>   #3  0x0000559fffeded7b in slave_read (opaque=0x55a0012f6680)
>       at ../hw/virtio/vhost-user.c:1464
>   #4  0x000055a0000c541b in aio_dispatch_handler (
>       ctx=ctx@entry=0x55a0010a2120, node=0x55a0012d9e00)
>       at ../util/aio-posix.c:329
>
> Fixes: 6dcdd06e3b ("spec/vhost-user spec: Add IOMMU support")
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost-backend.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index 222bbcc62d..31b33bde37 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -406,6 +406,11 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
>   {
>       int ret = 0;
>   
> +    if (unlikely(!dev->vdev)) {
> +        error_report("Unexpected IOTLB message when virtio device is stopped");
> +        return -EINVAL;
> +    }
> +
>       switch (imsg->type) {
>       case VHOST_IOTLB_MISS:
>           ret = vhost_device_iotlb_miss(dev, imsg->iova,


