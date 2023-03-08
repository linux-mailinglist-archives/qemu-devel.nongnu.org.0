Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E006C6B0492
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 11:35:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZr8E-0000Vy-GX; Wed, 08 Mar 2023 05:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZr86-0000Ae-Cq
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:34:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZr84-0006Ch-Kx
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678271679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/NPnoN9iaB0GVxT3iFavDkDJXFT49zrThzMgzfRUYU=;
 b=A3Kdr1Eu6OXx6eVTI2HMZo6tMY7A57/d3B+tFAhOLhjf3PFvMdSM8LfV7ftSzwKSvtW04z
 kwLJoky2/MtueP4hrN9Tywu7CmL/apv3Plil3mMXMMQxhDK8NO36qbiJEfpWokezKeVHFx
 5ecmCx11Lqwt1x6RttGOg1RibozFGQY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-vOzUSg5xNvK4v8kOEoJn7g-1; Wed, 08 Mar 2023 05:34:38 -0500
X-MC-Unique: vOzUSg5xNvK4v8kOEoJn7g-1
Received: by mail-wm1-f72.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so641034wmq.6
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 02:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678271677;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/NPnoN9iaB0GVxT3iFavDkDJXFT49zrThzMgzfRUYU=;
 b=L9JmrKtGfD2peNs+QITAzJfcaA9pTYFS/rUJNAfGe+x4ANc5ez9LZQGb6L/YFYlXZm
 +M5tEjku7888zqEucAwOOQ+sn26QzxVSHpc8NhAs3qK7RLSIAi8EFFv/zEjMeDiNydXV
 aIXZI/XqrHdvUY0hRFX2mH2SekxZ+UiA8R0tEFujV63fsnHfUUl2l4QPR6kxtlotlUpI
 H8Wy97j2TRbdIPX/u81wmTf6o3R57Kp5/dp4szAyE34rNQqGNc+0WDtEODdvWhH/VE1y
 ljSfHyKCYebRFY/PL0BtvY2v97BhcOIlzc9xvHzWwT9l0zvAMeS28AWmSo5Rat0ANogI
 KIsQ==
X-Gm-Message-State: AO0yUKUaaBZjTwFAcoy4wPky97diYPd/ggSpRligIscBTO1YgCQrWHWd
 95CyIjRM66Xnh0dzayOdwFRYNKiDahwYKU7ZXONoPdnS7X5hRrSYHzPR0rCmaCr7jUKwx30IwhV
 xJoPLquMozRN2Ne0=
X-Received: by 2002:a05:600c:3148:b0:3eb:3fea:a2ac with SMTP id
 h8-20020a05600c314800b003eb3feaa2acmr16100700wmo.22.1678271677307; 
 Wed, 08 Mar 2023 02:34:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/m8gtGC+Evnqc3bUC8sCbNqTJ+guLjQ50KtLM8LZP/LWgQs39ue+Z3dUH8bFs0HbBUrRmX0w==
X-Received: by 2002:a05:600c:3148:b0:3eb:3fea:a2ac with SMTP id
 h8-20020a05600c314800b003eb3feaa2acmr16100680wmo.22.1678271676945; 
 Wed, 08 Mar 2023 02:34:36 -0800 (PST)
Received: from ?IPV6:2003:cb:c71b:cb00:d372:1da8:9e9e:422d?
 (p200300cbc71bcb00d3721da89e9e422d.dip0.t-ipconnect.de.
 [2003:cb:c71b:cb00:d372:1da8:9e9e:422d])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c308900b003dfe5190376sm15222984wmn.35.2023.03.08.02.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 02:34:36 -0800 (PST)
Message-ID: <0aad3683-b362-8bb1-4f5f-1761d0370c77@redhat.com>
Date: Wed, 8 Mar 2023 11:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] virtio-balloon: optimize the virtio-balloon on the ARM
 platform
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Yangming <yangming73@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
References: <20230301062642.1058-1-xiqi2@huawei.com>
 <afd620a5e7c14a0794812e72ba1af545@huawei.com>
 <20230307193739-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230307193739-mutt-send-email-mst@kernel.org>
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

On 08.03.23 01:42, Michael S. Tsirkin wrote:
> On Wed, Mar 01, 2023 at 06:38:13AM +0000, Yangming wrote:
>> Optimize the virtio-balloon feature on the ARM platform by adding
>> a variable to keep track of the current hot-plugged pc-dimm size,
>> instead of traversing the virtual machine's memory modules to count
>> the current RAM size during the balloon inflation or deflation
>> process. This variable can be updated only when plugging or unplugging
>> the device, which will result in an increase of approximately 60%
>> efficiency of balloon process on the ARM platform.
>>
>> We tested the total amount of time required for the balloon inflation process on ARM:
>> inflate the balloon to 64GB of a 128GB guest under stress.
>> Before: 102 seconds
>> After: 42 seconds
>>
>> Signed-off-by: Qi Xi <xiqi2@huawei.com>
>> Signed-off-by: Ming Yang yangming73@huawei.com
>> ---
>> Refactor the code by adding comments and removing unnecessary code.
>>
>>   hw/mem/pc-dimm.c           |  7 +++++++
>>   hw/virtio/virtio-balloon.c | 33 +++++----------------------------
>>   include/hw/boards.h        |  2 ++
>>   3 files changed, 14 insertions(+), 28 deletions(-)
>>
>> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
>> index 50ef83215c..3f2734a267 100644
>> --- a/hw/mem/pc-dimm.c
>> +++ b/hw/mem/pc-dimm.c
>> @@ -81,6 +81,10 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
>>   
>>       memory_device_plug(MEMORY_DEVICE(dimm), machine);
>>       vmstate_register_ram(vmstate_mr, DEVICE(dimm));
>> +    /* count only "real" DIMMs, not NVDIMMs */
>> +    if (!object_dynamic_cast(OBJECT(dimm), TYPE_NVDIMM)) {
>> +        machine->device_memory->dimm_size += vmstate_mr->size;
>> +    }
>>   }
>>   
>>   void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
> 
> vmstate_mr->size is Int128 you are not supposed to do math on it.
> 
> And generally poking at this struct is a bad idea.
> 
> I think memory_region_size will do what you want but not 100% sure.
> Maybe you need to look at the flatview ...

Good point, we should use memory_region_size().

-- 
Thanks,

David / dhildenb


