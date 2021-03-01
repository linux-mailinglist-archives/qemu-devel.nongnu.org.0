Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F120327DC5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:01:40 +0100 (CET)
Received: from localhost ([::1]:49224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhF5-0005ii-BC
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGhD7-0004yc-7R
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGhD1-0002b0-AC
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614599970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cghL5eY6r4xkb2+Ud1GpNBtywyuXXH5Yr+A4nwdmB7w=;
 b=cYONuPjZTjwwoj04Gn+cIn17dzVUTKOcWpNqqUloHfqR4WBND9EK9kVLYthKQZ7WFD6c75
 mRt6Pjjlm7BMsKIkWpv59Terf+B3TAq6Neinkc8Ixzz7I7UgSmfa8/7NtvQO3evSXKk1tw
 mAm0IV1vYOxbWmM/9McZ9Vv1lRKtGkY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-WYbcI4CdNgOpMxjhadJtyw-1; Mon, 01 Mar 2021 06:59:29 -0500
X-MC-Unique: WYbcI4CdNgOpMxjhadJtyw-1
Received: by mail-wr1-f70.google.com with SMTP id m9so3513405wrx.6
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cghL5eY6r4xkb2+Ud1GpNBtywyuXXH5Yr+A4nwdmB7w=;
 b=TxKL12D2lHcVsCdkwlZerpm4yv//GxJY2+XLZjMtBeugHYZoopvV/ats0l6p9i9hfK
 whHiNxUXpJEuaEWPDJbysN3oNJyMbKwMEl3n34KZDZgX1rdit5Y57Sq8xb7jnOLs426G
 KAV6aoaRIksBfmxVUpLTT9iwPI9NjPOrSszgFbRtQoJQiliErl+StwJlzE2oPvR9jZnU
 Y0mLqzhGYkwT6SSjccnN6x6mvHVEv72Grqlu822CZIurMQrIjUz2povtdQzBLoqgI7n8
 SyEPU0FWwWnXRi5CIpu4s/+VoJrMFe185t1E75ShDq1vYIvKZN3rEWnOdkuY1DZUmby6
 R+TQ==
X-Gm-Message-State: AOAM530CV6W5be+mmXLWuY/uUB8z/t1fZkXvXniAf1szlvjRiFkayqgL
 Tq0s35ej1ISGV5F1YK9ZTTulBURiDYQmHNsHc/UlHsLXAMhDH+DvLB7LTsd9B+y4QT6Zcu27Mtf
 OUkxG8tGgA3Q2j9U=
X-Received: by 2002:a1c:bc56:: with SMTP id m83mr15596817wmf.174.1614599967633; 
 Mon, 01 Mar 2021 03:59:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlc5fWR+hVeLByo80DtsMwfyvS0JN/HVKP5bqL7EvQAJyZ+SEeP33GckLsT+bfwXg/Znf6wg==
X-Received: by 2002:a1c:bc56:: with SMTP id m83mr15596794wmf.174.1614599967386; 
 Mon, 01 Mar 2021 03:59:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n6sm7609864wmd.27.2021.03.01.03.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 03:59:26 -0800 (PST)
Subject: Re: [RFC PATCH 1/3] exec/memory: Introduce
 memory_region_init_rom_device_from_file()
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210225230238.3719051-1-philmd@redhat.com>
 <20210225230238.3719051-2-philmd@redhat.com>
 <20210301115317.i7qctejcit6zcbac@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bbf3a4e2-6875-6c53-b5a7-e42479b5dc00@redhat.com>
Date: Mon, 1 Mar 2021 12:59:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301115317.i7qctejcit6zcbac@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Zheng Xiang <zhengxiang9@huawei.com>, haibinzhang <haibinzhang@tencent.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 12:53 PM, Stefano Garzarella wrote:
> I don't know this code very well, but I have a couple of comments below :-)
> 
> On Fri, Feb 26, 2021 at 12:02:36AM +0100, Philippe Mathieu-Daudé wrote:
>> Introduce memory_region_init_rom_device_from_file() which mmap
>> the backing file of ROM devices. This allows to reduce QEMU memory
>> footprint as the same file can be shared between multiple instances
>> of QEMU.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> include/exec/memory.h | 85 +++++++++++++++++++++++++++++++++++++
>> softmmu/memory.c      | 98 +++++++++++++++++++++++++++++++++++++++++++
>> 2 files changed, 183 insertions(+)
...
>> +void memory_region_init_rom_device_from_file_nomigrate(MemoryRegion *mr,
>> +                                                       Object *owner,
>> +                                                       const
>> MemoryRegionOps *ops,
>> +                                                       void *opaque,
>> +                                                       const char *name,
>> +                                                       uint64_t size,
>> +                                                       uint64_t align,
>> +                                                       uint32_t
>> ram_flags,
>> +                                                       const char *path,
>> +                                                       bool readonly,
>> +                                                       Error **errp)
>> +{
>> +    Error *err = NULL;
>> +
>> +    assert(ops);
>> +#ifdef CONFIG_POSIX
>> +    memory_region_init(mr, owner, name, size);
>> +    mr->opaque = opaque;
>> +    mr->ops = ops;
>> +    mr->rom_device = true;
>> +    mr->readonly = readonly;
>> +    mr->ram = true;
>> +    mr->align = align;
>> +    mr->terminates = true;
>> +    mr->destructor = memory_region_destructor_ram;
>> +    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path,
>> +                                             readonly, &err);
>> +    if (err) {
>> +        mr->size = int128_zero();
>> +        object_unparent(OBJECT(mr));
>> +        error_propagate(errp, err);
>> +    }
>> +#else
>> +    g_autoptr(GError) gerr = NULL;
>> +    gsize len;
>> +
>> +    memory_region_init(mr, owner, name, size);
>> +    mr->ops = ops;
>> +    mr->opaque = opaque;
>> +    mr->terminates = true;
>> +    mr->rom_device = true;
> 
> Why when CONFIG_POSIX is defined we set 'mr->ram', 'mr->align', and
> 'mr->readonly = readonly' but not here?
> (I honestly don't know if they are important, I ask out of curiosity.  :-)

I suppose we should and I forgot :/

> 
>> +
>> +    if (!g_file_get_contents(path, &mr->contents, &len, &gerr)) {
> 
> Should we do these steps in case of an error?
> 
>           mr->size = int128_zero();
>           object_unparent(OBJECT(mr));

Yes...

> 
>> +        error_setg(errp, "Unable to read '%s': %s", path,
>> gerr->message);
>> +        return;
>> +    }
>> +    mr->destructor = memory_region_destructor_contents;
>> +    mr->contents = g_realloc(mr->contents, size);
>> +    mr->ram_block = qemu_ram_alloc_from_ptr(size, mr->contents, mr,
>> &err);
>> +    if (err) {
>> +        mr->size = int128_zero();
>> +        object_unparent(OBJECT(mr));
>> +        error_propagate(errp, err);
>> +    }
>> +#endif
> 
> Maybe I would reorganize the code inside ifdef like this:
> 
>         memory_region_init(mr, owner, name, size);
>         mr->opaque = opaque;
>         ...
>     #ifdef CONFIG_POSIX
>         mr->destructor = memory_region_destructor_ram;
>         mr->ram_block = qemu_ram_alloc_from_file(...);
>     #else
>         if (!g_file_get_contents(..)) {
>             ...
>         }
>         mr->destructor = memory_region_destructor_contents;
>         mr->contents = g_realloc(mr->contents, size);
>         mr->ram_block = qemu_ram_alloc_from_ptr(...)
>     #endif
> 
>         if (err) {
>             ...
>         }

Yes, thanks :)

> 
> I don't have a strong opinion, just an idea.
> 
> Thanks,
> Stefano


