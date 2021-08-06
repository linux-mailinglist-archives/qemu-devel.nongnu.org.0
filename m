Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08253E233B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:26:58 +0200 (CEST)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtJp-00031U-Q5
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mBtIy-0001fP-AS
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:26:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mBtIw-0000aq-MU
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628231161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cUEmi5L1+k3WK3DPbfE0IQYdDsQFRFdy3+OuakQvDCI=;
 b=gAlHBixgsKxpj0ehQ8HhIzSe9lhISRaNq0ZhAnuEIpFPtGrMAB9x8xKrNNTVEF+7xu0dk0
 DhWvwzxN68/TJ42/pPu26J46pwzranepoc1T2Jvqtrreg39gDcW8houm9GrzRvxGiZBXES
 42/dmYnUkwx3nU8KVkc8q+gVzCVTt0g=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Os5yPNgWNkW08djuj56EQw-1; Fri, 06 Aug 2021 02:26:00 -0400
X-MC-Unique: Os5yPNgWNkW08djuj56EQw-1
Received: by mail-pj1-f71.google.com with SMTP id
 16-20020a17090a1990b029017582e03c3bso13965781pji.7
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 23:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cUEmi5L1+k3WK3DPbfE0IQYdDsQFRFdy3+OuakQvDCI=;
 b=tFdO6CehEtzXxeCDj7nSHxHjR0SMTjrHhWGie8lbRB5DEvlpKOCeARpgySv6LyyCvW
 rEkntoKoTwLGBIIb9l40mcx8ITHS2ddo6xMsRckfO02rffZ0y0x5KSJgCwkIiCFXIoOD
 8yKOVmQpxCFkxiXxhl2rXllyC0t4WB7/mgUtC2HWnJxJqhR6ZyAhoxgdd1nXhIEiQbgg
 5hzCSaaD12HZhMqkq9sHJe/K1bdIjPAH1+/RHLG7BYG1lSCBQ5m4SYpsvg1nNxfvxgW0
 aUt7J7g+NOND084str8PBGqKxXuj6q92NWCVuJXhsdBE4qcqSuTLgAABrjlcMR2cibS2
 FYfA==
X-Gm-Message-State: AOAM533l1CDbmRSzRvPF2nLHII8l3YBAcQjkEHVZ9Dpx/3Wl3DaEDfyk
 Ul9Fpg4SoMuHQrJq03mWBOYlhvkzhe/8q6QXDtQwMkaWcKv5QuCVlV8S6EmvuKOgYOOVKrflxXl
 Biole5XpZH5XziZE=
X-Received: by 2002:a62:584:0:b029:32e:3b57:a1c6 with SMTP id
 126-20020a6205840000b029032e3b57a1c6mr9033101pff.13.1628231159513; 
 Thu, 05 Aug 2021 23:25:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw6hmxlijJJREOJxZ1VnBTugfejrteMWL8asxcwSii9cYjDIIyJBDnVuSW91iWSGneNm+c6A==
X-Received: by 2002:a62:584:0:b029:32e:3b57:a1c6 with SMTP id
 126-20020a6205840000b029032e3b57a1c6mr9033086pff.13.1628231159285; 
 Thu, 05 Aug 2021 23:25:59 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w21sm9033871pfq.40.2021.08.05.23.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 23:25:58 -0700 (PDT)
Subject: Re: [PATCH 1/2] virtio: add a way to disable a queue
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20210729191910.317114-1-lvivier@redhat.com>
 <20210729191910.317114-2-lvivier@redhat.com>
 <c9b273fb-797b-4810-bb4c-d99d5173fe6c@redhat.com>
 <c26fddb3-8954-2c74-c238-1052356a8f00@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c31d2975-7d90-84f9-74ea-838de69e78f5@redhat.com>
Date: Fri, 6 Aug 2021 14:25:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c26fddb3-8954-2c74-c238-1052356a8f00@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2021/8/2 下午4:42, Laurent Vivier 写道:
> On 02/08/2021 06:50, Jason Wang wrote:
>> 在 2021/7/30 上午3:19, Laurent Vivier 写道:
>>> Add virtio_queue_disable()/virtio_queue_enable() to disable/enable a queue
>>> by setting vring.num to 0 (or num_default).
>>> This is needed to be able to disable a guest driver from the host side
>>
>> I suspect this won't work correclty for vhost.
> With my test it seems to work with vhost too.


So setting 0 will lead -EINVAL to be returned during 
VHOST_SET_VRING_NUM. I think qemu will warn the failure in this case.

What's more important, it's not guaranteed to work for the case of 
vhost-user or vhost-vDPA.


>
>> And I believe we should only do this after the per queue enabling/disabling is supported
>> by the spec.
>>
>> (only MMIO support that AFAIK)
> I don't want to modify the spec.
>
> I need something that works without modifying existing (old) drivers.
>
> The idea is to be able to disable the virtio-net kernel driver from QEMU if the driver is
> too old (i.e. it doesn't support STANDBY feature).
>
> Setting vring.num to 0 forces the kernel driver to exit on error in the probe function.
> It's what I want: the device is present but disabled (the driver is not loaded).
>
> Any other suggestion?


I think we should probably disable the device instead of doing it per 
virtqueue.

Thanks


>
> Thanks,
> Laurent
>
>> Thanks
>>
>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> ---
>>>    include/hw/virtio/virtio.h |  2 ++
>>>    hw/virtio/virtio.c         | 10 ++++++++++
>>>    2 files changed, 12 insertions(+)
>>>
>>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>>> index 8bab9cfb7507..6a3f71b4cd88 100644
>>> --- a/include/hw/virtio/virtio.h
>>> +++ b/include/hw/virtio/virtio.h
>>> @@ -251,6 +251,8 @@ void virtio_config_modern_writel(VirtIODevice *vdev,
>>>                                     uint32_t addr, uint32_t data);
>>>    void virtio_queue_set_addr(VirtIODevice *vdev, int n, hwaddr addr);
>>>    hwaddr virtio_queue_get_addr(VirtIODevice *vdev, int n);
>>> +void virtio_queue_enable(VirtIODevice *vdev, int n);
>>> +void virtio_queue_disable(VirtIODevice *vdev, int n);
>>>    void virtio_queue_set_num(VirtIODevice *vdev, int n, int num);
>>>    int virtio_queue_get_num(VirtIODevice *vdev, int n);
>>>    int virtio_queue_get_max_num(VirtIODevice *vdev, int n);
>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>> index 874377f37a70..fa5228c1a2d6 100644
>>> --- a/hw/virtio/virtio.c
>>> +++ b/hw/virtio/virtio.c
>>> @@ -2244,6 +2244,16 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
>>>        virtio_init_region_cache(vdev, n);
>>>    }
>>>    +void virtio_queue_disable(VirtIODevice *vdev, int n)
>>> +{
>>> +    vdev->vq[n].vring.num = 0;
>>> +}
>>> +
>>> +void virtio_queue_enable(VirtIODevice *vdev, int n)
>>> +{
>>> +    vdev->vq[n].vring.num = vdev->vq[n].vring.num_default;
>>> +}
>>> +
>>>    void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
>>>    {
>>>        /* Don't allow guest to flip queue between existent and


