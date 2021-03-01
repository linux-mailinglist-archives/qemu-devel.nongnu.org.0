Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF005327D8E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:52:24 +0100 (CET)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGh67-0003iW-PP
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh4V-0002sb-3c
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:50:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh4S-0005fc-Ej
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614599438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fiUoG4ShvhtMyrPKT2e9ebAgurZFIsZDAUQPQ1GUP0o=;
 b=eb7UmUjPoRWmP3JKMOjxVkatAsNJNjYQbMnHFMDeOXjhAy7xU57o5KSAuTX4DPjsG791mM
 k+EvpMFU9fgjxyJiQqgoA+KQiFDrxfwDsG9RY9Xy1jY/S+X1VT66xUz7PTXQ7rTPZ3YT2q
 HQqHtPM7iqP1dAJfnJMw/WfvMTEXn88=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-07peZILuOX2lSiUctkX8Ew-1; Mon, 01 Mar 2021 06:50:37 -0500
X-MC-Unique: 07peZILuOX2lSiUctkX8Ew-1
Received: by mail-wr1-f70.google.com with SMTP id i5so7662384wrp.8
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fiUoG4ShvhtMyrPKT2e9ebAgurZFIsZDAUQPQ1GUP0o=;
 b=m8hIOyi2gYHM6AadXBm+ANcfRDwDODm1nnlaK2LBwMwmZuQSC7LtALi0Ve7OjbkyeV
 SMI4+TBjiz4pQvJh9TdyoptJD7KokhbbM94xqTQB96RDpFnJgWQHo6eA6FwRT/u9JXXt
 f418brSMIAYFtJnedqltdobaeqtBfCyiDFw3SdGip2Mq8nb0A84cI4RfXf3ogw3kaBbo
 0gJO9eTHOzhNUzXkEnaWi0i6p9nIFfkQLb9qVNBom9fZEZW/GijMplU6BuhvOTasJCHU
 xweWZCtDpZL1rOUk0wVioHAdI1lJ9MIQhK62ISkfdXdiHN0VBEG064x8ardz4u+FRXw6
 y0+A==
X-Gm-Message-State: AOAM533iq5HE4/xGZzJSV+/r5x649znwDFqbmGiIC/U8zYH9kSwgQ8b6
 2NSDO1mn7Y0ROpifixOvVK1vWFSc/bOcHHyvcm+CwR+artkqK8KqWzQvVjitvd7/CwHzguD/3I0
 /KenRWcoF8Kggh0E=
X-Received: by 2002:a1c:6441:: with SMTP id y62mr15406174wmb.97.1614599435831; 
 Mon, 01 Mar 2021 03:50:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQZC3m1lbZ6WBP5BX7wejyycpNVn8uJ5Lf/XzkdExKn6cG3hN/FaJaYN6R5AmAordWOXRvYQ==
X-Received: by 2002:a1c:6441:: with SMTP id y62mr15406156wmb.97.1614599435644; 
 Mon, 01 Mar 2021 03:50:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l8sm9862085wrx.83.2021.03.01.03.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 03:50:35 -0800 (PST)
Subject: Re: [RFC PATCH 3/3] hw/block/pflash: use
 memory_region_init_rom_device_from_file()
To: David Edmondson <dme@dme.org>, qemu-devel@nongnu.org
References: <20210225230238.3719051-1-philmd@redhat.com>
 <20210225230238.3719051-4-philmd@redhat.com> <m2im6fb5k9.fsf@dme.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <be6e184a-21e9-81f7-4f2e-363213a389b4@redhat.com>
Date: Mon, 1 Mar 2021 12:50:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <m2im6fb5k9.fsf@dme.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 haibinzhang <haibinzhang@tencent.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 9:23 AM, David Edmondson wrote:
> On Friday, 2021-02-26 at 00:02:38 +01, Philippe Mathieu-Daudé wrote:
> 
>> If the block drive is read-only we will model a "protected" flash
>> device. We can thus use memory_region_init_rom_device_from_file()
>> which mmap the backing file when creating the MemoryRegion.
>> If the same backing file is used by multiple QEMU instances, this
>> reduces the memory footprint (this is often the case with the
>> CODE flash image from OVMF and AAVMF).
>>
>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/block/pflash_cfi01.c | 20 ++++++++++++++------
>>  hw/block/pflash_cfi02.c | 18 ++++++++++++++----
>>  2 files changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
>> index a5fa8d8b74a..5757391df1c 100644
>> --- a/hw/block/pflash_cfi01.c
>> +++ b/hw/block/pflash_cfi01.c
>> @@ -743,11 +743,19 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>>          pfl->ro = 0;
>>      }
>>  
>> -    memory_region_init_rom_device(
>> -        &pfl->mem, OBJECT(dev),
>> -        &pflash_cfi01_ops,
>> -        pfl,
>> -        pfl->name, total_len, errp);
>> +    if (pfl->blk && pfl->ro) {
>> +        memory_region_init_rom_device_from_file(&pfl->mem, OBJECT(dev),
>> +                                                &pflash_cfi01_ops, pfl,
>> +                                                pfl->name, total_len,
>> +                                                qemu_real_host_page_size,
>> +                                                RAM_SHARED,
>> +                                                blk_bs(pfl->blk)->filename,
> 
> How will this behave if someone does:
> 
>     -drive file=OVMF_CODE.fd.qcow2,index=0,if=pflash,format=qcow2,readonly=on
> 
> Honestly, I'm not sure why they would, but it works today.

OK I can add a check for "raw" driver, but I don't know to check for
offset == 0.


