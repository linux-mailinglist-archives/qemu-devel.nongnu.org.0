Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0C3EE710
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 09:16:02 +0200 (CEST)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFtKL-0005RM-66
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 03:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFtJ1-0004jJ-LX
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFtIz-0001T9-DE
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629184476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7J3Fmquq9XhyIEYsU3Z09BwuRFN0HEnhK/NYg8vajs=;
 b=g2qwGtnIy3HiZZncNMUvLI4QzkXX0UxkqHaQIvluBLmOeGfeUOQuqK/2/zoWLec1UFDgM7
 00opgISuyRu1hMTF1WWdABj8e56Q79zfjS5Yxj9nJzBif1YUKktEn1m3CEihTwHakh2RNa
 /wswhY5z7LMHjJYkPrl9aKu4z0r+cio=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-hesWv-nFOuqUYSpBA_Pn1Q-1; Tue, 17 Aug 2021 03:14:35 -0400
X-MC-Unique: hesWv-nFOuqUYSpBA_Pn1Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so577533wmr.9
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 00:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=k7J3Fmquq9XhyIEYsU3Z09BwuRFN0HEnhK/NYg8vajs=;
 b=kXJ872xel70S/lX3Comv3nyUp9qmLPaKXrbXnDdC6JRG4IUuGO8Bg1zfNs4Repzk0v
 eyVx3E7AlFTdXDgT4aJm/v7GKeB9sWiutLcjmzmila8ZNKRtVTiRI/PDCy1aUzV1Tg1y
 JaQtk6RR79ceffHvXTkNnOSJ6ug314O4vgyZqGUEXYFN1MhysbYj8577wNDx0yJA/wkW
 gEoy3D959H2SIc6QSye1gsweWnarDHB3YFvLj5Z+XL2/+1GnyFx8jL+xCbQHcDIIv2vd
 eEaPG3eZNorUghq3Tr8cfq5kHJ4xU9k0lQxF7bi2nUhKqjqpFU/oFk6njtBymVbTx4DC
 RkIA==
X-Gm-Message-State: AOAM532CpxyhSrUHowk5qjJx4DknqUEh3yV5GF2HkoybAmGSoWf8yVQx
 kCpHkJ6PtPT3cI/VNlOj808tt19Bqp+MH+Mr7VBUlGThv1C8vwpqgQXPm1kL4BpUyVMVlTnkxx2
 MIXyMiZGBRyoCqmM=
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr1788535wmj.108.1629184474126; 
 Tue, 17 Aug 2021 00:14:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpqs51PCY8HdAaA1XmmTIN0ZnJusq7G8FBteffJl8YyDfbV1D/CqtmxwrRaYbzweoOkLfa/A==
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr1788517wmj.108.1629184473940; 
 Tue, 17 Aug 2021 00:14:33 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c65c6.dip0.t-ipconnect.de. [91.12.101.198])
 by smtp.gmail.com with ESMTPSA id g11sm1326042wrd.97.2021.08.17.00.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 00:14:33 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 v2] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
To: Peter Xu <peterx@redhat.com>
References: <20210805092350.31195-1-david@redhat.com> <YRrP+tDsIyL3MaWO@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8812f9e2-3b3e-1bc9-2953-107e4c82880b@redhat.com>
Date: Tue, 17 Aug 2021 09:14:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRrP+tDsIyL3MaWO@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.08.21 22:52, Peter Xu wrote:
> On Thu, Aug 05, 2021 at 11:23:50AM +0200, David Hildenbrand wrote:
>> When adding RAM_NORESERVE, we forgot to remove the old assertion when
>> adding the updated one, most probably when reworking the patches or
>> rebasing. We can easily crash QEMU by adding
>>    -object memory-backend-ram,id=mem0,size=500G,reserve=off
>> to the QEMU cmdline:
>>    qemu-system-x86_64: ../softmmu/physmem.c:2146: qemu_ram_alloc_internal:
>>    Assertion `(ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC))
>>    == 0' failed.
>>
>> Fix it by removing the old assertion.
>>
>> Fixes: 8dbe22c6868b ("memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()")
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>
>> v1 -> v2:
>> - Added rbs
>> - Tagged for 6.1 inclusion
>>
>> ---
>>   softmmu/physmem.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 3c1912a1a0..2e18947598 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -2143,7 +2143,6 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
>>       RAMBlock *new_block;
>>       Error *local_err = NULL;
>>   
>> -    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC)) == 0);
>>       assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
>>                             RAM_NORESERVE)) == 0);
>>       assert(!host ^ (ram_flags & RAM_PREALLOC));
>> -- 
>> 2.31.1
>>
> 
> Today I just noticed this patch is still missing for 6.1. How many users are
> there with reserve=off?  Would it be worth rc4 or not?
> 

Indeed, I forgot to follow up, thanks for bringing this up.

Libvirt does not support virtio-mem yet and consequently doesn't support 
reserve=off yet. (there are use cases without virtio-mem, but I don't 
think anybody is using it yet)

It's an easy way to crash QEMU, but we could also fix in the -stable 
tree instead.

(most probably you and me should also be doing PULL requests for "Memory 
API", we'll have to discuss with Paolo)

-- 
Thanks,

David / dhildenb


