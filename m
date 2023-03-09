Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A582F6B1F9D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:14:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCLi-00072Q-Ti; Thu, 09 Mar 2023 04:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1paCLh-00072I-Cb
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:14:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1paCLf-0000Ab-Nz
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678353247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9k6qFQzTsSbxbdL1Hx3Wb5IwQp2hYLuVWUfG3MO9eJo=;
 b=FC+hl3JMk9Kj75hJyPDQCdJAXcKVe4lJ3syQkYWtPjCGDIVc0x4Kj2nsc5zr4hH7iR0/an
 QboGaZIkp0/IXk86PMTG7XvxGMICy+PAAQDRx3vffqraHSEhizTd0leVIrthzD3lcVTeJV
 HF9J1xF+46ox/OWoK87y8TNPYc33CLc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-DPfJFu0MMtmlFNJsGy3kWA-1; Thu, 09 Mar 2023 04:14:05 -0500
X-MC-Unique: DPfJFu0MMtmlFNJsGy3kWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so514650wms.9
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678353243;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9k6qFQzTsSbxbdL1Hx3Wb5IwQp2hYLuVWUfG3MO9eJo=;
 b=S+WSWdIW5GdeiEgo/uuWgb4iJjhyP3gOHwsQBB3n0bUa0ea/TdFeyDeXmLTgVDVrzF
 M7/4KJrjy8jaUZIY6EFAO5iRYvnM8TXK35zEuZnPo2abed9sjwtv1IRC2Dza/zHgTMYe
 6MHtRA6dzc4TpMIEYJ+NVZmb9p/79bmJhLeGPUB6Az4AL2zA87P7lXFfUCjHcPHVycJa
 MSzVNwWwU2e4ss9bArezb6dkegByZjkH7Bq/dAWH1l4u40WWormVbKMAKsF7Z9CXV0Eq
 XX6lQYt8u4W6Wzs1iTWZvV9m1jy8BiUUwYWrUiCCoXHbHuFVd1b57s/0Mx2rc1SR4IwR
 +v8Q==
X-Gm-Message-State: AO0yUKVYx85NOjXSVBmGlBGzh96H2RMQR2fVlYWJniZDseam/njRWPs/
 IrcrXJakCWOYJqvU2wBfseID/aAsR7Rv3hYk6+JnCRkotPo67MX0lmR9GPTTuQz272tBlHCxbCx
 /Nkds+y8gyNkx+MA=
X-Received: by 2002:a5d:45c3:0:b0:2c5:6247:b89d with SMTP id
 b3-20020a5d45c3000000b002c56247b89dmr13664619wrs.6.1678353243594; 
 Thu, 09 Mar 2023 01:14:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/CduTA2919fpsb3tdrDU8H51toZT5i/JNUowqp0toZiSk/nU6NSHMWZlLUEgau1mlk1OUY8w==
X-Received: by 2002:a5d:45c3:0:b0:2c5:6247:b89d with SMTP id
 b3-20020a5d45c3000000b002c56247b89dmr13664603wrs.6.1678353243285; 
 Thu, 09 Mar 2023 01:14:03 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:5200:a73:3e7e:12c:b175?
 (p200300cbc70252000a733e7e012cb175.dip0.t-ipconnect.de.
 [2003:cb:c702:5200:a73:3e7e:12c:b175])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adfe8c5000000b002c56179d39esm17271269wrn.44.2023.03.09.01.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:14:02 -0800 (PST)
Message-ID: <66f9d36a-3095-5854-5004-030c963166b0@redhat.com>
Date: Thu, 9 Mar 2023 10:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Reply: [PATCH v2] virtio-balloon: optimize the virtio-balloon on
 the ARM platform
Content-Language: en-US
To: Yangming <yangming73@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
References: <9544c4fe084c4bf281b744eb4e0c998b@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <9544c4fe084c4bf281b744eb4e0c998b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 09.03.23 07:14, Yangming wrote:
>> On 08.03.23 01:42, Michael S. Tsirkin wrote:
>>> On Wed, Mar 01, 2023 at 06:38:13AM +0000, Yangming wrote:
>>>> Optimize the virtio-balloon feature on the ARM platform by adding a
>>>> variable to keep track of the current hot-plugged pc-dimm size,
>>>> instead of traversing the virtual machine's memory modules to count
>>>> the current RAM size during the balloon inflation or deflation
>>>> process. This variable can be updated only when plugging or
>>>> unplugging the device, which will result in an increase of
>>>> approximately 60% efficiency of balloon process on the ARM platform.
>>>>
>>>> We tested the total amount of time required for the balloon inflation
>> process on ARM:
>>>> inflate the balloon to 64GB of a 128GB guest under stress.
>>>> Before: 102 seconds
>>>> After: 42 seconds
>>>>
>>>> Signed-off-by: Qi Xi <xiqi2@huawei.com>
>>>> Signed-off-by: Ming Yang yangming73@huawei.com
>>>> ---
>>>> Refactor the code by adding comments and removing unnecessary code.
>>>>
>>>>    hw/mem/pc-dimm.c           |  7 +++++++
>>>>    hw/virtio/virtio-balloon.c | 33 +++++----------------------------
>>>>    include/hw/boards.h        |  2 ++
>>>>    3 files changed, 14 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c index
>>>> 50ef83215c..3f2734a267 100644
>>>> --- a/hw/mem/pc-dimm.c
>>>> +++ b/hw/mem/pc-dimm.c
>>>> @@ -81,6 +81,10 @@ void pc_dimm_plug(PCDIMMDevice *dimm,
>> MachineState
>>>> *machine)
>>>>
>>>>        memory_device_plug(MEMORY_DEVICE(dimm), machine);
>>>>        vmstate_register_ram(vmstate_mr, DEVICE(dimm));
>>>> +    /* count only "real" DIMMs, not NVDIMMs */
>>>> +    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
>>>> +        machine->device_memory->dimm_size += vmstate_mr->size;
>>>> +    }
>>>>    }
>>>>
>>>>    void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>>>
>>> vmstate_mr->size is Int128 you are not supposed to do math on it.
>>>
>>> And generally poking at this struct is a bad idea.
>>>
>>> I think memory_region_size will do what you want but not 100% sure.
>>> Maybe you need to look at the flatview ...
>>
>> Good point, we should use memory_region_size().
>>
>> --
>> Thanks,
>>
>> David / dhildenb
> 
> Thanks for the suggestion. The problem will be fixed in the upcoming third version by using 'memory_region_size()'.
> 
> By the way, we found that the size of the object is aligned with 'qemu_host_page_size' before allocating the memory (see details in 'qemu_ram_alloc_internal()' from softmmu/physmem.c). This means that the actual allocated memory may differ from the size defined in the Object. As a result, in 'get_current_ram_size()', the original method of counting hot-plugged memory from the Object may not be accurate. Now, we count the size from the memory region, which is a proper way to get the actual size of memory allocated.

You'd have to have a memory backend size that is not aligned to the host 
page size.

qemu-system-x86_64 -nographic -nodefaults -object 
memory-backend-ram,id=tmp,size=1K

While that seems to be possible, it's something very odd to happen (I 
cannot think of a reasonable use case).



-- 
Thanks,

David / dhildenb


