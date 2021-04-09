Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A25735965D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:29:06 +0200 (CEST)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlZh-0005rG-7r
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUlYN-0005Ew-Tn
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUlYM-0006cj-Dl
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617953261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HwNy/2DMX8ogG5NlKnc5vMK6+HX7uswfvpVYBOqwrKM=;
 b=LljD3Gaj9USHB7MQA71c5UmIX7sRGSyw7yqNogdqLJUnGL8/wFDOe5bEVo3G3c97fwTwYr
 l+v8IZQflKpA2ugX5J0JAF/xcOLlaEXL/akv86NGl4yEXX7cWtJStsxwe+fYcArY4l7yL+
 whVbaWZxhzUqh4vgM2MoJxCARd+ai7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-PtJf3kOCO0yKDjvcbPns8w-1; Fri, 09 Apr 2021 03:27:40 -0400
X-MC-Unique: PtJf3kOCO0yKDjvcbPns8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEEDD1007381
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 07:27:38 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-155.pek2.redhat.com
 [10.72.13.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B482196E3;
 Fri,  9 Apr 2021 07:27:34 +0000 (UTC)
Subject: Re: [PATCH v5 5/6] virtio-mmio: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210408093824.14985-1-lulu@redhat.com>
 <20210408093824.14985-6-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a035e3cb-3563-fbdd-234e-a58126e2e339@redhat.com>
Date: Fri, 9 Apr 2021 15:27:32 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408093824.14985-6-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/8 ÏÂÎç5:38, Cindy Lu Ð´µÀ:
> add configure interrupt support for virtio-mmio bus. This
> interrupt will working while backend is vhost-vdpa


So this is actually the guest notifier of config interrupt for virtio-mmio.

Thanks


>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-mmio.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 1aa1aaeca4..64b347421b 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -632,7 +632,26 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
>   
>       return 0;
>   }
> +static int virtio_mmio_set_config_notifier(DeviceState *d,  bool assign)
> +{
> +    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>   
> +    EventNotifier *notifier = virtio_get_config_notifier(vdev);
> +    int r = 0;
> +    if (assign) {
> +        r = event_notifier_init(notifier, 0);
> +        virtio_set_config_notifier_fd_handler(vdev, true, false);
> +    } else {
> +        virtio_set_config_notifier_fd_handler(vdev, false, false);
> +        event_notifier_cleanup(notifier);
> +    }
> +        if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
> +            vdc->guest_notifier_mask(vdev, 0, !assign, VIRTIO_CONFIG_VECTOR);
> +    }
> +    return r;
> +}
>   static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
>                                              bool assign)
>   {
> @@ -654,8 +673,15 @@ static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
>               goto assign_error;
>           }
>       }
> +   r = virtio_mmio_set_config_notifier(d, assign);
> +   if (r < 0) {
> +            goto config_assign_error;
> +   }
>   
>       return 0;
> +config_assign_error:
> +    assert(assign);
> +    r = virtio_mmio_set_config_notifier(d, false);
>   
>   assign_error:
>       /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */


