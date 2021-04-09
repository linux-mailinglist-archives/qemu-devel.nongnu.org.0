Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9C35964F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:25:36 +0200 (CEST)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlWJ-0004bX-3h
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUlVB-0004B1-Tp
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:24:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUlVA-0004UZ-At
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 03:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617953060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8YPZRrBaQb/8fcCJwCpkiqDsLcZ+QOT8DNmA+7LKAfY=;
 b=cW5elT+9cnPLrpmdHiBet7ciBHDWG6IpiM+eaZgN/yHX7EJ9hDqS0RgCPjFEV4PowkE3py
 hRQ5d0T0eEEIVpDAt5SVxALrjdIdaSi2G14hAaGdqaDJKnt6b25JxeD1oL3WMKyLxVh7hi
 qYPmG08i3y7ic+o5Ostn6FmcxJyuIXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-3du3KPDxNo-cQok1GKga_Q-1; Fri, 09 Apr 2021 03:24:18 -0400
X-MC-Unique: 3du3KPDxNo-cQok1GKga_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 827DB839A4B
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 07:24:17 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-155.pek2.redhat.com
 [10.72.13.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 633186E406;
 Fri,  9 Apr 2021 07:24:16 +0000 (UTC)
Subject: Re: [PATCH v5 4/6] vhost-vdpa: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210408093824.14985-1-lulu@redhat.com>
 <20210408093824.14985-5-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d23aa6a5-8794-c61e-f84c-1d0f96c9e5d9@redhat.com>
Date: Fri, 9 Apr 2021 15:24:14 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408093824.14985-5-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
> Add support for configure interrupt. Set the notifier's fd to
> the kernel driver when vdpa start. also set -1 while vdpa stop.
> then the kernel will release the related resource
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 9ba2a2bed4..7825366f64 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -467,11 +467,33 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>       }
>       return ret;
>    }
> -


Let's keep this blank line.


> +static void vhost_vdpa_config_notify_start(struct vhost_dev *dev,
> +                                struct VirtIODevice *vdev, bool start)
> +{
> +    int fd = 0;
> +    int r = 0;
> +    if (!(dev->features & (0x1ULL << VIRTIO_NET_F_STATUS))) {
> +        return;
> +    }
> +    if (start) {
> +        fd = event_notifier_get_fd(&vdev->config_notifier);
> +        r = dev->vhost_ops->vhost_set_config_call(dev, &fd);


So you introduce a general vhost ops but it's call by devic specific 
code (vhost-vdpa).

Any reason that we don't do that in vhost_dev_start/vhost_dev_stop?

Thanks


> +        if (!r) {
> +            vdev->use_config_notifier = true;
> +            event_notifier_set(&vdev->config_notifier);
> +        }
> +    } else {
> +        fd = -1;
> +        vdev->use_config_notifier = false;
> +        r = dev->vhost_ops->vhost_set_config_call(dev, &fd);
> +    }
> +    return;
> +}
>   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>   {
>       struct vhost_vdpa *v = dev->opaque;
>       trace_vhost_vdpa_dev_start(dev, started);
> +    VirtIODevice *vdev = dev->vdev;
>       if (started) {
>           uint8_t status = 0;
>           memory_listener_register(&v->listener, &address_space_memory);
> @@ -479,8 +501,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>           vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
>   
> +        vhost_vdpa_config_notify_start(dev, vdev, true);
>           return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
>       } else {
> +        vhost_vdpa_config_notify_start(dev, vdev, false);
>           vhost_vdpa_reset_device(dev);
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                      VIRTIO_CONFIG_S_DRIVER);


