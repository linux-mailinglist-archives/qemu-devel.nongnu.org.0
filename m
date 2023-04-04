Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835A6D6378
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:39:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgsI-0000c8-BL; Tue, 04 Apr 2023 09:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgsF-0000bd-RM
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgsD-0001gU-Cc
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680615536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8A+0/77ETVjCC+da2gmyQ8uuifyTw2Q7q/NY4s52Vs=;
 b=YeNAUa4hhtiLj8Dgxhn8DBcPGnaSTKjzqrFH7nzX4P8fYwSYtIDpYrTAx3+7EhEwXOZjR2
 XSMggwyIxIMbZ6drTBbN3ET4R+4vgtB8cSvsxz9sbgAN71yUHvGpJMRtek/xJ8R/1Sqo4E
 3Gvrh/0lqXP4AJHnfCMNGXNHlYyUGVo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-J9uY-VmoNj-zfFEa7d-5pw-1; Tue, 04 Apr 2023 09:38:55 -0400
X-MC-Unique: J9uY-VmoNj-zfFEa7d-5pw-1
Received: by mail-ed1-f71.google.com with SMTP id
 t26-20020a50d71a000000b005003c5087caso45717320edi.1
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680615534; x=1683207534;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s8A+0/77ETVjCC+da2gmyQ8uuifyTw2Q7q/NY4s52Vs=;
 b=xnzN01GCnF6Hcm/LWcLOldJKkZft6h5G7AG9elqNDyO9I2MoPQuLH9wV3ZWIMMAK8I
 iKchYp9uT8uhI0/d7E5sqvOUwQLnXyWYlfJqrkOtNdcn6/eCrFqrMjAm5JX8p3i925pz
 UIXUG/2CtE3yCCARZBEoFzhkfxep5Osw08/35QJPGEtdmVLQpfj6juct2Tx3w4Mq8g3z
 3FovkBxM5VS3LO+sdblhDZJrc3hy9OIHolRCWR4EPO+/tLRdX/FBTIxsHfPDFFYywzYt
 W1eg0HG/hYqe8X+9OxynpHLQjzeDamkWwqtN4OEKM2FtZwT0J295YQQRHYugPc+gg+FK
 ZIlg==
X-Gm-Message-State: AAQBX9e+JtwNK5SQr7pQ5lYry25iAOyLJCIKiwzqo8NHqRbLKzM6IHtf
 aMmCzANlVFOW8p5Xr4VvLIOKFV4GafIwTE0kmGp7bDZS24oy2+v+1KOkSmMfcw8nzTAgMzOlkHN
 LiC5lX4wupz7g9HQ=
X-Received: by 2002:a05:6402:4cf:b0:4fa:e8f3:968b with SMTP id
 n15-20020a05640204cf00b004fae8f3968bmr2551248edw.19.1680615533974; 
 Tue, 04 Apr 2023 06:38:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350al+iU0IKXO90b1D9to94YRCbqQRKUwSNuKsjsPFReXh3S7dIzKpCXzXyF4ywwP2kJFgg+jKA==
X-Received: by 2002:a05:6402:4cf:b0:4fa:e8f3:968b with SMTP id
 n15-20020a05640204cf00b004fae8f3968bmr2551207edw.19.1680615533676; 
 Tue, 04 Apr 2023 06:38:53 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 f22-20020a50d556000000b005002daeb27asm5937325edj.37.2023.04.04.06.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:38:53 -0700 (PDT)
Message-ID: <8f871654-064c-4782-e99f-c81f5935b23a@redhat.com>
Date: Tue, 4 Apr 2023 15:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/13] virtio-scsi: stop using aio_disable_external()
 during unplug
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 eesposit@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Zhengui Li <lizhengui@huawei.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-3-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230403183004.347205-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/3/23 20:29, Stefan Hajnoczi wrote:
> This patch is part of an effort to remove the aio_disable_external()
> API because it does not fit in a multi-queue block layer world where
> many AioContexts may be submitting requests to the same disk.
> 
> The SCSI emulation code is already in good shape to stop using
> aio_disable_external(). It was only used by commit 9c5aad84da1c
> ("virtio-scsi: fixed virtio_scsi_ctx_check failed when detaching scsi
> disk") to ensure that virtio_scsi_hotunplug() works while the guest
> driver is submitting I/O.
> 
> Ensure virtio_scsi_hotunplug() is safe as follows:
> 
> 1. qdev_simple_device_unplug_cb() -> qdev_unrealize() ->
>     device_set_realized() calls qatomic_set(&dev->realized, false) so
>     that future scsi_device_get() calls return NULL because they exclude
>     SCSIDevices with realized=false.
> 
>     That means virtio-scsi will reject new I/O requests to this
>     SCSIDevice with VIRTIO_SCSI_S_BAD_TARGET even while
>     virtio_scsi_hotunplug() is still executing. We are protected against
>     new requests!
> 
> 2. Add a call to scsi_device_purge_requests() from scsi_unrealize() so
>     that in-flight requests are cancelled synchronously. This ensures
>     that no in-flight requests remain once qdev_simple_device_unplug_cb()
>     returns.
> 
> Thanks to these two conditions we don't need aio_disable_external()
> anymore.
> 
> Cc: Zhengui Li <lizhengui@huawei.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/scsi/scsi-disk.c   | 1 +
>   hw/scsi/virtio-scsi.c | 3 ---
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index 97c9b1c8cd..e01bd84541 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -2522,6 +2522,7 @@ static void scsi_realize(SCSIDevice *dev, Error **errp)
>   
>   static void scsi_unrealize(SCSIDevice *dev)
>   {
> +    scsi_device_purge_requests(dev, SENSE_CODE(RESET));
>       del_boot_device_lchs(&dev->qdev, NULL);
>   }
>   
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index 000961446c..a02f9233ec 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -1061,11 +1061,8 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
>       VirtIODevice *vdev = VIRTIO_DEVICE(hotplug_dev);
>       VirtIOSCSI *s = VIRTIO_SCSI(vdev);
>       SCSIDevice *sd = SCSI_DEVICE(dev);
> -    AioContext *ctx = s->ctx ?: qemu_get_aio_context();
>   
> -    aio_disable_external(ctx);
>       qdev_simple_device_unplug_cb(hotplug_dev, dev, errp);
> -    aio_enable_external(ctx);
>   
>       if (s->ctx) {
>           virtio_scsi_acquire(s);

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


