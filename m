Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3153020B6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 04:16:34 +0100 (CET)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3sMj-0000RE-IO
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 22:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l3sLc-0008N4-V0
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 22:15:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l3sLY-0005o4-8K
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 22:15:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611544517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3n0qig3kW8jwbV5DjlSsm7N7Oa8gVmwqBShD05kXwBE=;
 b=Rv3If/Juz8ZNVEo+I+GE3w5tIAhZNmJhSsxrE+840llBrUuaPs7p8zdiVkLJ78EBxH5MCG
 o9Env52AJ5ZPYapQrmZ3XyzNdqvhyOZuoIo2ft33/xowtGCnqtsG9ezKSIlHwwYvciSPi7
 015l0cd6eMdPeX5mT2PfCCKTRKueXjA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-Xc3Uosz2M6euKWEDHXIeGQ-1; Sun, 24 Jan 2021 22:15:14 -0500
X-MC-Unique: Xc3Uosz2M6euKWEDHXIeGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 428BD107ACE3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 03:15:13 +0000 (UTC)
Received: from [10.72.12.105] (ovpn-12-105.pek2.redhat.com [10.72.12.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B3D15D9D7;
 Mon, 25 Jan 2021 03:15:04 +0000 (UTC)
Subject: Re: [PATCH] virtio: Add corresponding memory_listener_unregister to
 unrealize
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210122200851.345259-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <65ea6f69-538f-7f2e-b2d9-bb0a110f004b@redhat.com>
Date: Mon, 25 Jan 2021 11:15:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122200851.345259-1-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/23 上午4:08, Eugenio Pérez wrote:
> Cannot destroy address spaces of IOMMU-aware virtio devices without it,
> since they can contain memory listeners.


It's better to explain why the one in finalize doesn't work here.

Thanks


>
> Fixes: c611c76417f ("virtio: add MemoryListener to cache ring translations")
> Buglink: https://bugs.launchpad.net/qemu/+bug/1912846
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/virtio.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index b308026596..67efd2c301 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3680,6 +3680,7 @@ static void virtio_device_unrealize(DeviceState *dev)
>       VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>       VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(dev);
>   
> +    memory_listener_unregister(&vdev->listener);
>       virtio_bus_device_unplugged(vdev);
>   
>       if (vdc->unrealize != NULL) {


