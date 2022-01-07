Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264CC4870AC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 03:42:59 +0100 (CET)
Received: from localhost ([::1]:48612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5fDW-0001vh-96
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 21:42:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5fCb-0001FP-1A
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 21:42:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5fCW-0005t8-5y
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 21:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641523315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/dpHw453RYFA4gCFc93PuC9jDMCkR3C3S4VC3ZrcgU=;
 b=Pqf+O4fMSY/FHKusfnHVKBCitl2Mms5RUYAwATH5rYd4J97+9dt0h9T2B+V4pYVRO4CmMk
 M5Wixk+o10NGh4H99Uh6ACij9xpWPz7ybb01+Umm44goJgPxrN++bN5G4ljcp+5AYnzIhS
 kZ+xrYOcjw6gFk4g9qItZFYjkSd3BV8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-fNun-jelNiaP-JVR8giDoQ-1; Thu, 06 Jan 2022 21:41:54 -0500
X-MC-Unique: fNun-jelNiaP-JVR8giDoQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 62-20020a17090a0fc400b001b31e840054so5459069pjz.1
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 18:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s/dpHw453RYFA4gCFc93PuC9jDMCkR3C3S4VC3ZrcgU=;
 b=wzMC8Nnnnyh7xFIuF0HqltMoJmrik3rS/kk5wkGFIlRKbQDv7gk0ZjK4cdTQugc0A1
 XLvZvENFLF+x/7B8+M7KSJCd4eXkvMhsK2biK69K6enZHAJnRW3juHkLSen7wvz/Fays
 rZbCmUeIgkz+wbRz4T+IWUbNyctD6VzHQtvVb0lZ+pQx/aHeqnE0gjnyCPDXvK/WI+bd
 dH/fzUj2Lo2kN4Pz1pmPHLVmZAe6PS2DvQd1AEFEOkVgDGEIWRkrswc2j69+yYPO5jkY
 BSjlQwKFZnj4tdTSLD3Yx61zswt9Cg/vED2hOq4KSS4U/0PcMbTpVSM0QVkp0cdRSTAw
 v5sg==
X-Gm-Message-State: AOAM531Dj72ReCD7jDHI1sGfufexHw9dP7M9DCb6uwmUYBZ3SNCRyp6v
 YyzotWbf5HBxsYFlp3QvZ7qAP/6HXnUp4rwNqZpoY7505Ldr4Sct9tr1Mz07mSsC5PRdNOhZW0N
 4Qsvs2enAHK0HvsI=
X-Received: by 2002:a63:1748:: with SMTP id 8mr54464898pgx.33.1641523313705;
 Thu, 06 Jan 2022 18:41:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMVATfSMF2rASaVpIcGNYwFAZ4jrx4lcHIe9AxDgQLkwHmiHVysZJMlEiNIK5lnK101rnTpQ==
X-Received: by 2002:a63:1748:: with SMTP id 8mr54464874pgx.33.1641523313396;
 Thu, 06 Jan 2022 18:41:53 -0800 (PST)
Received: from [10.72.13.245] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id e11sm3406697pjj.49.2022.01.06.18.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 18:41:52 -0800 (PST)
Message-ID: <a72255a7-9cdd-af8f-5f5e-44bd2fb9ad54@redhat.com>
Date: Fri, 7 Jan 2022 10:41:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <20220105020008-mutt-send-email-mst@kernel.org>
 <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
 <1d157f74fdac49ff8ae734808bd3c518@huawei.com>
 <CACGkMEukEBFYrmJjj-jXR_UdamFbjrFkj7PbdfQJOGMzekAvSg@mail.gmail.com>
 <20220105072321-mutt-send-email-mst@kernel.org>
 <CACGkMEt+A5-rSq20qTbideO39q-rZ5RKoK8H77OihFQ8VDgUfw@mail.gmail.com>
 <e45ecaa1a6b24395868d92d8ffa9a059@huawei.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <e45ecaa1a6b24395868d92d8ffa9a059@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Yechuan <yechuan@huawei.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini <pbonzini@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/6 下午4:00, Longpeng (Mike, Cloud Infrastructure Service Product 
Dept.) 写道:
>> -----Original Message-----
>> From: Jason Wang [mailto:jasowang@redhat.com]
>> Sent: Thursday, January 6, 2022 10:34 AM
>> To: Michael S. Tsirkin<mst@redhat.com>
>> Cc: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>; Stefan Hajnoczi<stefanha@redhat.com>; Stefano
>> Garzarella<sgarzare@redhat.com>; Cornelia Huck<cohuck@redhat.com>; pbonzini
>> <pbonzini@redhat.com>; Gonglei (Arei)<arei.gonglei@huawei.com>; Yechuan
>> <yechuan@huawei.com>; Huangzhichao<huangzhichao@huawei.com>; qemu-devel
>> <qemu-devel@nongnu.org>
>> Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
>>
>> On Wed, Jan 5, 2022 at 8:26 PM Michael S. Tsirkin<mst@redhat.com>  wrote:
>>> On Wed, Jan 05, 2022 at 05:09:07PM +0800, Jason Wang wrote:
>>>> On Wed, Jan 5, 2022 at 4:37 PM Longpeng (Mike, Cloud Infrastructure
>>>> Service Product Dept.)<longpeng2@huawei.com>  wrote:
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Jason Wang [mailto:jasowang@redhat.com]
>>>>>> Sent: Wednesday, January 5, 2022 3:54 PM
>>>>>> To: Michael S. Tsirkin<mst@redhat.com>
>>>>>> Cc: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>>>>>> <longpeng2@huawei.com>; Stefan Hajnoczi<stefanha@redhat.com>; Stefano
>>>>>> Garzarella<sgarzare@redhat.com>; Cornelia Huck<cohuck@redhat.com>;
>> pbonzini
>>>>>> <pbonzini@redhat.com>; Gonglei (Arei)<arei.gonglei@huawei.com>; Yechuan
>>>>>> <yechuan@huawei.com>; Huangzhichao<huangzhichao@huawei.com>;
>> qemu-devel
>>>>>> <qemu-devel@nongnu.org>
>>>>>> Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
>>>>>>
>>>>>> On Wed, Jan 5, 2022 at 3:02 PM Michael S. Tsirkin<mst@redhat.com>  wrote:
>>>>>>> On Wed, Jan 05, 2022 at 12:35:53PM +0800, Jason Wang wrote:
>>>>>>>> On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike)<longpeng2@huawei.com>
>> wrote:
>>>>>>>>> From: Longpeng<longpeng2@huawei.com>
>>>>>>>>>
>>>>>>>>> To support generic vdpa deivce, we need add the following ioctls:
>>>>>>>>> - GET_VECTORS_NUM: the count of vectors that supported
>>>>>>>> Does this mean MSI vectors? If yes, it looks like a layer violation:
>>>>>>>> vhost is transport independent.
>>>>>>> Well*guest*  needs to know how many vectors device supports.
>>>>>>> I don't think there's a way around that. Do you?
>>>>>> We have VHOST_SET_VRING/CONFIG_CALL which is per vq. I think we can
>>>>>> simply assume #vqs + 1?
>>>>>>
>>>>>>> Otherwise guests will at best be suboptimal.
>>>>>>>
>>>>>>>>   And it reveals device implementation
>>>>>>>> details which block (cross vendor) migration.
>>>>>>>>
>>>>>>>> Thanks
>>>>>>> Not necessarily, userspace can hide this from guest if it
>>>>>>> wants to, just validate.
>>>>>> If we can hide it at vhost/uAPI level, it would be even better?
>>>>>>
>>>>> Not only MSI vectors, but also queue-size, #vqs, etc.
>>>> MSI is PCI specific, we have non PCI vDPA parent e.g VDUSE/simulator/mlx5
>>>>
>>>> And it's something that is not guaranteed to be not changed. E.g some
>>>> drivers may choose to allocate MSI during set_status() which can fail
>>>> for various reasons.
>>>>
>>>>> Maybe the vhost level could expose the hardware's real capabilities
>>>>> and let the userspace (QEMU) do the hiding? The userspace know how
>>>>> to process them.
>>>> #MSI vectors is much more easier to be mediated than queue-size and #vqs.
>>>>
>>>> For interrupts, we've already had VHOST_SET_X_KICK, we can keep
>>>> allocating eventfd based on #MSI vectors to make it work with any
>>>> number of MSI vectors that the virtual device had.
>>> Right but if hardware does not support so many then what?
>>> Just fail?
>> Or just trigger the callback of vqs that shares the vector.
>>
> Then we should disable PI if we need to share a vector in this case?


I may miss something, but I don't see any reason for doing this. I think 
the irqbypass manager and the arch specific PI codes should deal with 
this case.

Ling Shan (cced) told me it works in the past.

Thanks


>


