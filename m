Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9F6399AE2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 08:38:02 +0200 (CEST)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1logzQ-0003nz-Nb
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 02:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logxX-000286-5O
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logxT-0005dX-VH
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622702158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zVFE71bLDCRPryooz1iblr9yaJBv/ACAux6M0S7UQU=;
 b=JoiMnUVS2q9aOMj17+kA5bX0+Ra6FFSvm5MNr3DuKl6G3CCQTeg8IHggrSL0hN/OPtWYXu
 G6wORnnwe930HUfBNo7HD7CgJ8t3TfH7E8wIGg2AA2LAqaBHxcwCOScvqO4QoGM/MgKMQr
 dErMkrH0DlYvSxZ1vZ7Os3us3wh55Ms=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-zLq0gZ6rOk2jAd0PVWLDBA-1; Thu, 03 Jun 2021 02:35:57 -0400
X-MC-Unique: zLq0gZ6rOk2jAd0PVWLDBA-1
Received: by mail-pj1-f72.google.com with SMTP id
 15-20020a17090a0f0fb029016ad0f32fd0so2331883pjy.6
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 23:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9zVFE71bLDCRPryooz1iblr9yaJBv/ACAux6M0S7UQU=;
 b=ElVtmBpjfcnSUxrbP4+nUGR5PMXTgRNyRtbOH1ykwcEdeN0i3UJVRoOobTiX4ap/HI
 UwpQXvGR9lYnp3mfz/iA0Qu6PLrZr+7jdcu1ItL9OIDA+PfQUiWnMTPfS3zdAjuHR/v8
 2FEP2ErgabY+5IBSzXw0cSp0GUb3RcfJGyYi+uYf3NtvnAt5SABfZAhlhNuEoK0jliV5
 HR1NV99WZ51uTvCESeKeDxZtMK4WWH534tjGdKwPXOMy0x4j+Y3MXi6cjwamO33yEkIj
 hGqGrZFH4e/cFoRRf8m6F8Cpfn0U5K74Op9RB58eiJUvZG7FrG1QvUiRhdBJYBVG2z11
 jxOA==
X-Gm-Message-State: AOAM530P6d9UmPA8a5ZUUKvyXwF+CJcZPJKxh9anI2jIvJZLfoLCwNYp
 vqTueoQyFgyte950q64+lDLrMb9EkD1rrbxALP8dWhMmZam/bY3OmK5sxLi0XysPv3PY6JCOFrN
 k0eXjrzTeHbrG3LLw2eK5rScG6BF9r+JiFAzNxnKX9QHm0cYj/A/6zt2Rgw88DpxbJ9o=
X-Received: by 2002:a63:d14b:: with SMTP id c11mr37159649pgj.162.1622702156194; 
 Wed, 02 Jun 2021 23:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPKQ+vw8yFmR8IoGpeStMMoe+7FIHE5pozS4IFBG9DS0Mv0+jflfSFFhIh/WKBsvpIQ4Bsag==
X-Received: by 2002:a63:d14b:: with SMTP id c11mr37159625pgj.162.1622702155768; 
 Wed, 02 Jun 2021 23:35:55 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b16sm1242689pju.35.2021.06.02.23.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 23:35:55 -0700 (PDT)
Subject: Re: [PATCH v7 07/10] virtio-mmio: add support for configure interrupt
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-8-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4d06d28c-8a61-5e2f-f6e3-8061f6bc2001@redhat.com>
Date: Thu, 3 Jun 2021 14:35:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602034750.23377-8-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
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


ÔÚ 2021/6/2 ÉÏÎç11:47, Cindy Lu Ð´µÀ:
> Add configure interrupt support for virtio-mmio bus. This
> interrupt will working while backend is vhost-vdpa
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/virtio-mmio.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 13772d52bb..423267d51c 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -670,7 +670,26 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
>   
>       return 0;
>   }
> +static int virtio_mmio_set_config_notifier(DeviceState *d, bool assign)
> +{
> +    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>   
> +    EventNotifier *notifier = virtio_get_config_notifier(vdev);
> +    int r = 0;
> +    if (assign) {
> +        r = event_notifier_init(notifier, 0);


The return value is ignored.


> +        virtio_set_notifier_fd_handler(vdev, -1, true, false);


You'd better use the macro you introduced in patch 1 here?


> +    } else {
> +        virtio_set_notifier_fd_handler(vdev, -1, false, false);
> +        event_notifier_cleanup(notifier);
> +    }
> +    if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
> +        vdc->guest_notifier_mask(vdev, -1, !assign);
> +    }
> +    return r;
> +}
>   static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
>                                              bool assign)
>   {
> @@ -692,8 +711,15 @@ static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
>               goto assign_error;
>           }
>       }
> +    r = virtio_mmio_set_config_notifier(d, assign);
> +    if (r < 0) {
> +        goto config_assign_error;
> +    }
>   
>       return 0;
> +config_assign_error:
> +    assert(assign);
> +    r = virtio_mmio_set_config_notifier(d, false);


This looks wired. We only have a single configure interrupt, so assign 
fails should mean unassigned?

Thanks


>   
>   assign_error:
>       /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */


