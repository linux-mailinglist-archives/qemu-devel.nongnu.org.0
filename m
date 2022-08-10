Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2149758E987
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 11:23:34 +0200 (CEST)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLhw4-0004v0-Ll
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 05:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLhtf-0003LX-Qx
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLhtb-0002By-Tv
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660123258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKPCXRsLCUR83FUsXKhz6STCs418cN9971AmFfkL1ps=;
 b=IBGhOdr0kqbDfYkSQtZyE/PrKws9/Vgm0Bg0IAmdx0dy15iXzzP3DjUrawEFGkj3MaqbkJ
 NG3C/xV6O7Q/NcjTzGvfhukReR1+S8ceobg3fHnBCr3qF3J4p1Z3GkMlIf7ADFNmCsmtqF
 KZ5H8+pRlLA6+8dWOs8F3sEx5SwPgYI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-R5IrD1fZPACLFTnd5NuQrg-1; Wed, 10 Aug 2022 05:20:57 -0400
X-MC-Unique: R5IrD1fZPACLFTnd5NuQrg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so3594651wms.1
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 02:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=rKPCXRsLCUR83FUsXKhz6STCs418cN9971AmFfkL1ps=;
 b=blwf94GU/Bb8US5duc2+BCErnhORBL7v4/Wdb2N3/iPZtnY9zN/TqTJcnwdg+pbhGt
 C0b01rMsbJ7ybtYDPXiJMs3AugUcxd7h4RIwYKc8Agffm8MQoVwLJ6qLTaTDz9iT0rQg
 lOajYlyTsm62p+JKGtFjrbz+66Lcl4CqxkLkmdkkUadzi/z/FNmSJl1w/h3jYPwZjC2H
 JR4oliKTRbmI8Y8HeeYRg4Ad1jLCyjbp0qviH+RqFIZkJohJ7FdlKw24kASgRoeFxqvy
 gfsGhANMZ+WMWa9L0pCJ4g17OkajsZTyHIJrzwzHlKFpoDjkm7Y6P43S/59uTgr6GSPT
 YFFA==
X-Gm-Message-State: ACgBeo0H3NrpLZvxJn2oOpy9Ycwc6swMfFpwTRW381YCzW28GONHH+Vs
 1lFTZ85DA7u81DYyLXafogMYhbmBx7AKTy+ExZPNhj6hupNCE7QtMZpU7LRrR7AhbmzBAdqwkyB
 XiBfzKyhc/Jb2q9A=
X-Received: by 2002:a7b:c350:0:b0:3a3:7b7e:762 with SMTP id
 l16-20020a7bc350000000b003a37b7e0762mr1715599wmj.184.1660123256352; 
 Wed, 10 Aug 2022 02:20:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uGbk/PdAY4TtQBVXvR0rVsNM2BMDtn341iQDVsidTx1EImDdVYUPvtVJXl76ywk5xHA/Sqw==
X-Received: by 2002:a7b:c350:0:b0:3a3:7b7e:762 with SMTP id
 l16-20020a7bc350000000b003a37b7e0762mr1715586wmj.184.1660123256122; 
 Wed, 10 Aug 2022 02:20:56 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-115-19.web.vodafone.de.
 [109.42.115.19]) by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b003a5b681cdabsm670683wmb.16.2022.08.10.02.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 02:20:55 -0700 (PDT)
Message-ID: <826da406-936d-62a2-490f-5ebbf0074dcb@redhat.com>
Date: Wed, 10 Aug 2022 11:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] backends/hostmem: Fix support of memory-backend-memfd in
 qemu_maxrampagesize()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220810063204.3589543-1-thuth@redhat.com>
 <e1eb8579-079b-fe81-b2df-a342d7ad667a@redhat.com>
 <b8f008b4-fa13-1660-3861-83755b5cd278@redhat.com>
 <20935238-10e8-33bc-8a69-acfa4b343e23@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20935238-10e8-33bc-8a69-acfa4b343e23@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/2022 10.31, David Hildenbrand wrote:
> On 10.08.22 10:11, Thomas Huth wrote:
>> On 10/08/2022 09.32, David Hildenbrand wrote:
>>> On 10.08.22 08:32, Thomas Huth wrote:
>>>> It is currently not possible yet to use "memory-backend-memfd" on s390x
>>>> with hugepages enabled. This problem is caused by qemu_maxrampagesize()
>>>> not taking memory-backend-memfd objects into account yet, so the code
>>>> in s390_memory_init() fails to enable the huge page support there via
>>>> s390_set_max_pagesize(). Fix it by looking at the memory-backend-memfd
>>>> in the host_memory_backend_pagesize() function, too.
>>>>
>>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2116496
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    include/sysemu/hostmem.h |  8 +++++++-
>>>>    backends/hostmem-memfd.c |  2 --
>>>>    backends/hostmem.c       | 27 +++++++++++++++++----------
>>>>    3 files changed, 24 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
>>>> index 9ff5c16963..d983ae6c01 100644
>>>> --- a/include/sysemu/hostmem.h
>>>> +++ b/include/sysemu/hostmem.h
>>>> @@ -34,10 +34,16 @@ OBJECT_DECLARE_TYPE(HostMemoryBackend, HostMemoryBackendClass,
>>>>    /* hostmem-file.c */
>>>>    /**
>>>>     * @TYPE_MEMORY_BACKEND_FILE:
>>>> - * name of backend that uses mmap on a file descriptor
>>>> + * name of backend that uses mmap on a file
>>>>     */
>>>>    #define TYPE_MEMORY_BACKEND_FILE "memory-backend-file"
>>>>    
>>>> +/* hostmem-memfd.c */
>>>> +/**
>>>> + * @TYPE_MEMORY_BACKEND_MEMFD:
>>>> + * name of backend that uses mmap on a memfd file descriptor
>>>> + */
>>>> +#define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
>>>>    
>>>>    /**
>>>>     * HostMemoryBackendClass:
>>>> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
>>>> index 3fc85c3db8..1ab2085e49 100644
>>>> --- a/backends/hostmem-memfd.c
>>>> +++ b/backends/hostmem-memfd.c
>>>> @@ -18,8 +18,6 @@
>>>>    #include "qapi/error.h"
>>>>    #include "qom/object.h"
>>>>    
>>>> -#define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
>>>> -
>>>>    OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendMemfd, MEMORY_BACKEND_MEMFD)
>>>>    
>>>>    
>>>> diff --git a/backends/hostmem.c b/backends/hostmem.c
>>>> index 624bb7ecd3..ebce887105 100644
>>>> --- a/backends/hostmem.c
>>>> +++ b/backends/hostmem.c
>>>> @@ -306,22 +306,29 @@ bool host_memory_backend_is_mapped(HostMemoryBackend *backend)
>>>>        return backend->is_mapped;
>>>>    }
>>>>    
>>>> -#ifdef __linux__
>>>>    size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
>>>>    {
>>>> +    size_t pagesize = 0;
>>>> +
>>>> +#ifdef __linux__
>>>>        Object *obj = OBJECT(memdev);
>>>> -    char *path = object_property_get_str(obj, "mem-path", NULL);
>>>> -    size_t pagesize = qemu_mempath_getpagesize(path);
>>>>    
>>>> -    g_free(path);
>>>> +    if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_FILE)) {
>>>> +        char *path = object_property_get_str(obj, "mem-path", NULL);
>>>> +        pagesize = qemu_mempath_getpagesize(path);
>>>> +        g_free(path);
>>>> +    } else if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_MEMFD) &&
>>>> +               object_property_get_bool(obj, "hugetlb", &error_abort)) {
>>>> +        pagesize = object_property_get_int(obj, "hugetlbsize", &error_abort);
>>>> +    }
>>>> +#endif
>>>
>>> Why can't we simply rely on
>>>
>>> qemu_ram_pagesize(memdev->mr.ram_block);
>>
>> Good idea! That way, we could even get rid of the "#ifdef __linux__" macros
>> here, I guess ... I'll give it a try and send a v2 if it works.
> 
> At first I wondered if we could have to deal with semi-iniutialized
> backendds here, but I think we should simply always already have the
> MR/RamBlock here.

I'll add an assert(pagesize >= getpagesize()) there, just to be sure.

  Thomas


