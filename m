Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25A3DD236
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 10:43:59 +0200 (CEST)
Received: from localhost ([::1]:44304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mATYE-00089h-DX
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 04:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mATXO-0007V0-4z
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 04:43:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mATXL-0005Oi-B0
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 04:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627893782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rd/6Qs8LkkJMZPL7Hj7wPgpP7UK+DDzJ6QQbfIRseE=;
 b=bQMT0wan5LqE1WuDnkZ8bKOZ5ksbPRzHB8Jp0G/83GzI+TyjUOilCm7V71Abk4IY8nid97
 Kpc6V/D6rwDYd8wC63aGF/gmIdIY/guy1jnO5pvWuRX8kBq8pkmeEYVF+kw0+SKePvWqC4
 1bLJXcexuDWzw2nwFMxDLdgsA6Gk0f8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-QCPwZJEYNlithV6eQxnuIw-1; Mon, 02 Aug 2021 04:43:01 -0400
X-MC-Unique: QCPwZJEYNlithV6eQxnuIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so5051846wmj.6
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 01:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/rd/6Qs8LkkJMZPL7Hj7wPgpP7UK+DDzJ6QQbfIRseE=;
 b=B6HZ9wfWluBxYJVfdk0vKF3VmqsPKmrMZpXh+ibIEf7Vz/D6zB2tT/fBYurOPyNata
 hqgtcp4SFN358YRp5Ld+OtccM/GP5RQu/cTHzefoHx/kzFuXcL3tfPeZAzULt/jAClcS
 i3TiptReHRWkWIAWrtd9Y1egXJFpH0WMkN8WERgxGZTgk45hx8IzyTm+HrSgMTdJzkTB
 qeRrP8MVC3viyuV2ua3N12616x2G6Ktu3dGZgKfdPMuLkaG1sT+SDDnRqffJTEA4c9pQ
 7Wp+MC/ky9SByrETpSyyYj7aGVz3ea+x1A4ysoVuqeALS+w9+WVwXSe9KC4hcCcZ9p0C
 e0XQ==
X-Gm-Message-State: AOAM5313HoMXCuPso+J3f4eB41cRIMcVBC2jDNoRI7Y59JJt9he75KC4
 8BoIeYLPUj1Eo8pTzXt7XKbQ+Kgu0J9C18Wpnv6zO90Xvx0cCdOQvbpMFo9P72KXf4chw3S4VBV
 +mwmY0ARchk6To1g=
X-Received: by 2002:a05:6000:18a9:: with SMTP id
 b9mr16195713wri.418.1627893779967; 
 Mon, 02 Aug 2021 01:42:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMSXLEY7UWKtP5hfHCEdCp/xVfD4a7xc35hoWvTTpenrRTEPF5jUo37NP00FMMjetilusLWQ==
X-Received: by 2002:a05:6000:18a9:: with SMTP id
 b9mr16195685wri.418.1627893779750; 
 Mon, 02 Aug 2021 01:42:59 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.182])
 by smtp.gmail.com with ESMTPSA id 9sm9399315wmf.34.2021.08.02.01.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 01:42:59 -0700 (PDT)
Subject: Re: [PATCH 1/2] virtio: add a way to disable a queue
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210729191910.317114-1-lvivier@redhat.com>
 <20210729191910.317114-2-lvivier@redhat.com>
 <c9b273fb-797b-4810-bb4c-d99d5173fe6c@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <c26fddb3-8954-2c74-c238-1052356a8f00@redhat.com>
Date: Mon, 2 Aug 2021 10:42:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c9b273fb-797b-4810-bb4c-d99d5173fe6c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.08, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Juan Quintela <quintela@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/08/2021 06:50, Jason Wang wrote:
> 
> 在 2021/7/30 上午3:19, Laurent Vivier 写道:
>> Add virtio_queue_disable()/virtio_queue_enable() to disable/enable a queue
>> by setting vring.num to 0 (or num_default).
>> This is needed to be able to disable a guest driver from the host side
> 
> 
> I suspect this won't work correclty for vhost.

With my test it seems to work with vhost too.

> 
> And I believe we should only do this after the per queue enabling/disabling is supported
> by the spec.
> 
> (only MMIO support that AFAIK)

I don't want to modify the spec.

I need something that works without modifying existing (old) drivers.

The idea is to be able to disable the virtio-net kernel driver from QEMU if the driver is
too old (i.e. it doesn't support STANDBY feature).

Setting vring.num to 0 forces the kernel driver to exit on error in the probe function.
It's what I want: the device is present but disabled (the driver is not loaded).

Any other suggestion?

Thanks,
Laurent

> Thanks
> 
> 
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   include/hw/virtio/virtio.h |  2 ++
>>   hw/virtio/virtio.c         | 10 ++++++++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index 8bab9cfb7507..6a3f71b4cd88 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -251,6 +251,8 @@ void virtio_config_modern_writel(VirtIODevice *vdev,
>>                                    uint32_t addr, uint32_t data);
>>   void virtio_queue_set_addr(VirtIODevice *vdev, int n, hwaddr addr);
>>   hwaddr virtio_queue_get_addr(VirtIODevice *vdev, int n);
>> +void virtio_queue_enable(VirtIODevice *vdev, int n);
>> +void virtio_queue_disable(VirtIODevice *vdev, int n);
>>   void virtio_queue_set_num(VirtIODevice *vdev, int n, int num);
>>   int virtio_queue_get_num(VirtIODevice *vdev, int n);
>>   int virtio_queue_get_max_num(VirtIODevice *vdev, int n);
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 874377f37a70..fa5228c1a2d6 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -2244,6 +2244,16 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
>>       virtio_init_region_cache(vdev, n);
>>   }
>>   +void virtio_queue_disable(VirtIODevice *vdev, int n)
>> +{
>> +    vdev->vq[n].vring.num = 0;
>> +}
>> +
>> +void virtio_queue_enable(VirtIODevice *vdev, int n)
>> +{
>> +    vdev->vq[n].vring.num = vdev->vq[n].vring.num_default;
>> +}
>> +
>>   void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
>>   {
>>       /* Don't allow guest to flip queue between existent and
> 


