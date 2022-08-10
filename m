Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D713458E882
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 10:14:41 +0200 (CEST)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLgrQ-0000jd-Ep
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 04:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLgoc-0007QO-7r
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 04:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLgoW-0007q8-N6
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 04:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660119094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7R61zRP0KlazYh7mRWmzKZXAfEsbvteoitayab+TTM=;
 b=CvlQL8qMz67yPGQJde+uYPJfxWNDrtXdWtphWGjH/6uOCoo07HwTjar59cRCRclP7VB6yt
 gfUt1jugwQEdCikj0uR0TnxGTSINz9Z7uzkBtcO56/KPFY2qnH8ny9z5XEeKAeU5y+ZZGF
 jW8QEu6XeJc49GVInNdyEE9+N0/Bl3A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-e9VnFXywM42oFMwyzADfaA-1; Wed, 10 Aug 2022 04:11:33 -0400
X-MC-Unique: e9VnFXywM42oFMwyzADfaA-1
Received: by mail-wr1-f72.google.com with SMTP id
 l16-20020adfbd90000000b0022073dbf2f3so2151390wrh.5
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 01:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=x7R61zRP0KlazYh7mRWmzKZXAfEsbvteoitayab+TTM=;
 b=vnaMToABYLw2QA/L+Yd6xheA9cYmdYyA/njzhZMdL66qUAbtV1OSCPZWB7zjmrQQhd
 tddnKPGqvcvJJn1/3GfQu/kUzQvJEvXXVvIKI4YJ/NMHc2mrv+sH6dDfRjBg557JIpUp
 SHwZgAp2z9lCTDBeXeFSJLxFQO9aXpia+24PKIVJTmr8pZxlA7gs+rz8LgnLQ4UXQy7N
 7QdLEbcvoONJddLaef6A3a5BCTsMm6iy2swh77odMzV8WI8sm7zu1fQSab7DSVQSM8M3
 tBaupSIX3pphZk1QFHaYBbnz+2sFz7P4HHe9GXzvwThC4Xek3khB4VB6+gotr1tNWoJi
 qZdg==
X-Gm-Message-State: ACgBeo2aDDERIyqp197yUFIOpS/RxEHahYQq51WxH4SU623+tntq1YvZ
 DjTcG6l1I8Mrj6RdC6kwQBtrwrNk8uXfsYxU4YNjqpL9klS9efp5iFEiV1DS/COKRjPlHWDLwak
 e+m05WZONjTiBD2I=
X-Received: by 2002:a05:600c:22d8:b0:3a5:1450:669e with SMTP id
 24-20020a05600c22d800b003a51450669emr1470732wmg.102.1660119092418; 
 Wed, 10 Aug 2022 01:11:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR77cGzRU/ktsxDtRGv4WcYI5h7BPNnjZ8YInTzMmT7CERz5uy/4JR1jQo1Ynjl42MiDmX9L6g==
X-Received: by 2002:a05:600c:22d8:b0:3a5:1450:669e with SMTP id
 24-20020a05600c22d800b003a51450669emr1470715wmg.102.1660119092161; 
 Wed, 10 Aug 2022 01:11:32 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-115-19.web.vodafone.de.
 [109.42.115.19]) by smtp.gmail.com with ESMTPSA id
 q4-20020a1c4304000000b003a5a5069107sm1458671wma.24.2022.08.10.01.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 01:11:31 -0700 (PDT)
Message-ID: <b8f008b4-fa13-1660-3861-83755b5cd278@redhat.com>
Date: Wed, 10 Aug 2022 10:11:29 +0200
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
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <e1eb8579-079b-fe81-b2df-a342d7ad667a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/08/2022 09.32, David Hildenbrand wrote:
> On 10.08.22 08:32, Thomas Huth wrote:
>> It is currently not possible yet to use "memory-backend-memfd" on s390x
>> with hugepages enabled. This problem is caused by qemu_maxrampagesize()
>> not taking memory-backend-memfd objects into account yet, so the code
>> in s390_memory_init() fails to enable the huge page support there via
>> s390_set_max_pagesize(). Fix it by looking at the memory-backend-memfd
>> in the host_memory_backend_pagesize() function, too.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2116496
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   include/sysemu/hostmem.h |  8 +++++++-
>>   backends/hostmem-memfd.c |  2 --
>>   backends/hostmem.c       | 27 +++++++++++++++++----------
>>   3 files changed, 24 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
>> index 9ff5c16963..d983ae6c01 100644
>> --- a/include/sysemu/hostmem.h
>> +++ b/include/sysemu/hostmem.h
>> @@ -34,10 +34,16 @@ OBJECT_DECLARE_TYPE(HostMemoryBackend, HostMemoryBackendClass,
>>   /* hostmem-file.c */
>>   /**
>>    * @TYPE_MEMORY_BACKEND_FILE:
>> - * name of backend that uses mmap on a file descriptor
>> + * name of backend that uses mmap on a file
>>    */
>>   #define TYPE_MEMORY_BACKEND_FILE "memory-backend-file"
>>   
>> +/* hostmem-memfd.c */
>> +/**
>> + * @TYPE_MEMORY_BACKEND_MEMFD:
>> + * name of backend that uses mmap on a memfd file descriptor
>> + */
>> +#define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
>>   
>>   /**
>>    * HostMemoryBackendClass:
>> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
>> index 3fc85c3db8..1ab2085e49 100644
>> --- a/backends/hostmem-memfd.c
>> +++ b/backends/hostmem-memfd.c
>> @@ -18,8 +18,6 @@
>>   #include "qapi/error.h"
>>   #include "qom/object.h"
>>   
>> -#define TYPE_MEMORY_BACKEND_MEMFD "memory-backend-memfd"
>> -
>>   OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendMemfd, MEMORY_BACKEND_MEMFD)
>>   
>>   
>> diff --git a/backends/hostmem.c b/backends/hostmem.c
>> index 624bb7ecd3..ebce887105 100644
>> --- a/backends/hostmem.c
>> +++ b/backends/hostmem.c
>> @@ -306,22 +306,29 @@ bool host_memory_backend_is_mapped(HostMemoryBackend *backend)
>>       return backend->is_mapped;
>>   }
>>   
>> -#ifdef __linux__
>>   size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
>>   {
>> +    size_t pagesize = 0;
>> +
>> +#ifdef __linux__
>>       Object *obj = OBJECT(memdev);
>> -    char *path = object_property_get_str(obj, "mem-path", NULL);
>> -    size_t pagesize = qemu_mempath_getpagesize(path);
>>   
>> -    g_free(path);
>> +    if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_FILE)) {
>> +        char *path = object_property_get_str(obj, "mem-path", NULL);
>> +        pagesize = qemu_mempath_getpagesize(path);
>> +        g_free(path);
>> +    } else if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND_MEMFD) &&
>> +               object_property_get_bool(obj, "hugetlb", &error_abort)) {
>> +        pagesize = object_property_get_int(obj, "hugetlbsize", &error_abort);
>> +    }
>> +#endif
> 
> Why can't we simply rely on
> 
> qemu_ram_pagesize(memdev->mr.ram_block);

Good idea! That way, we could even get rid of the "#ifdef __linux__" macros 
here, I guess ... I'll give it a try and send a v2 if it works.

  Thomas


