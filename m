Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F43690FF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 13:20:45 +0200 (CEST)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtrY-0004tq-3D
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 07:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZtnk-0001zb-0E
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lZtne-0005tK-QU
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 07:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619176602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udLgGtwR48vuUKwoyw8IC7sbyV9tPhkBwLBJRqKNZc0=;
 b=d8vWoq8QWFx1BW3IJqwyy9k4E1OODxQ3WKRc0oRChkgyQOD2QcrZKrpbmQ8xieyCkTDepa
 uuUBkiIScubaimB0uvM/Si8WTPjqMu17m97OC9HgvKOe9x7OCWNiSoo9GMbS9079fkJ991
 o2Drw3Z/f6rIlRJ3w94XUt2x4bPf4YY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-NawSCMWYPmyz1gmsFIhtCw-1; Fri, 23 Apr 2021 07:16:40 -0400
X-MC-Unique: NawSCMWYPmyz1gmsFIhtCw-1
Received: by mail-wr1-f69.google.com with SMTP id
 k1-20020adfd2210000b02901040d1dbcaeso14920358wrh.17
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 04:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=udLgGtwR48vuUKwoyw8IC7sbyV9tPhkBwLBJRqKNZc0=;
 b=WNprlrChvNbZi2OxORQ85fTyY8H4/zBQacsXm1+u4YeNl+3g09LWKxacnIPhj3jYeF
 98t7abuN/5YJzn/3XS9/Iwc7yYX4nbBZTn2OWw04NGbC02PRCR/vetnUwoOdqkFEn+9U
 +4QX/WqBWazS+9chCZRZCoAZE3B8wV8s9dP61RfIT5m3w4SbgSQ8Rta3V2IKBjmVA3ee
 z2oUpO8wOnv+rG0kQSEPzE6gQHoFrOvZTkfVi3aom4kz2jxKoYBUpoM6XsVWIC1IDpsD
 mXqHHPbuyALw6fz4FaLLrcidswEXZZ1gTRt56n6E/MK3G0yI58dPPntp0MFTSPRlrdkt
 ToWg==
X-Gm-Message-State: AOAM530DsQP5eL2zcxt2360edYiXfYcKUPFJ/jhwJfzekneSXaGkPSnP
 ldZe6dseBCiB3lzGzxcRL6LI9wJHriCZlbjBmottqq/+18HGJUKcHlBjxMIJGVaW9ymWrQLAfAy
 wYCJZsN0PqPQkzrg=
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr4202570wrw.200.1619176599484; 
 Fri, 23 Apr 2021 04:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx85mWYgmsAN1nhARgcDKEk4rh0RQKbr74mxKhmVNroaBOKen6UXoc6uS5Y+f/DA8DaX7LGg==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr4202536wrw.200.1619176599205; 
 Fri, 23 Apr 2021 04:16:39 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6365.dip0.t-ipconnect.de. [91.12.99.101])
 by smtp.gmail.com with ESMTPSA id
 w22sm10662415wmc.13.2021.04.23.04.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 04:16:38 -0700 (PDT)
Subject: Re: [PATCH v6 10/15] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
To: Markus Armbruster <armbru@redhat.com>
References: <20210421122624.12292-1-david@redhat.com>
 <20210421122624.12292-11-david@redhat.com>
 <87a6ppi77c.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8848ab6a-b435-3f95-1742-6593dff72351@redhat.com>
Date: Fri, 23 Apr 2021 13:16:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87a6ppi77c.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.04.21 13:14, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> Let's provide a way to control the use of RAM_NORESERVE via memory
>> backends using the "reserve" property which defaults to true (old
>> behavior).
>>
>> Only Linux currently supports clearing the flag (and support is checked at
>> runtime, depending on the setting of "/proc/sys/vm/overcommit_memory").
>> Windows and other POSIX systems will bail out with "reserve=false".
>>
>> The target use case is virtio-mem, which dynamically exposes memory
>> inside a large, sparse memory area to the VM. This essentially allows
>> avoiding to set "/proc/sys/vm/overcommit_memory == 0") when using
>> virtio-mem and also supporting hugetlbfs in the future.
>>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   backends/hostmem-file.c  | 11 ++++++-----
>>   backends/hostmem-memfd.c |  1 +
>>   backends/hostmem-ram.c   |  1 +
>>   backends/hostmem.c       | 32 ++++++++++++++++++++++++++++++++
>>   include/sysemu/hostmem.h |  2 +-
>>   qapi/qom.json            |  4 ++++
>>   6 files changed, 45 insertions(+), 6 deletions(-)
>>
>> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
>> index b683da9daf..9d550e53d4 100644
>> --- a/backends/hostmem-file.c
>> +++ b/backends/hostmem-file.c
>> @@ -40,6 +40,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>                  object_get_typename(OBJECT(backend)));
>>   #else
>>       HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(backend);
>> +    uint32_t ram_flags;
>>       gchar *name;
>>   
>>       if (!backend->size) {
>> @@ -52,11 +53,11 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>       }
>>   
>>       name = host_memory_backend_get_name(backend);
>> -    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend),
>> -                                     name,
>> -                                     backend->size, fb->align,
>> -                                     (backend->share ? RAM_SHARED : 0) |
>> -                                     (fb->is_pmem ? RAM_PMEM : 0),
>> +    ram_flags = backend->share ? RAM_SHARED : 0;
>> +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>> +    ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
>> +    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
>> +                                     backend->size, fb->align, ram_flags,
>>                                        fb->mem_path, fb->readonly, errp);
>>       g_free(name);
>>   #endif
>> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
>> index 93b5d1a4cf..f3436b623d 100644
>> --- a/backends/hostmem-memfd.c
>> +++ b/backends/hostmem-memfd.c
>> @@ -55,6 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>   
>>       name = host_memory_backend_get_name(backend);
>>       ram_flags = backend->share ? RAM_SHARED : 0;
>> +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>>       memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
>>                                      backend->size, ram_flags, fd, 0, errp);
>>       g_free(name);
>> diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
>> index 741e701062..b8e55cdbd0 100644
>> --- a/backends/hostmem-ram.c
>> +++ b/backends/hostmem-ram.c
>> @@ -29,6 +29,7 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>>   
>>       name = host_memory_backend_get_name(backend);
>>       ram_flags = backend->share ? RAM_SHARED : 0;
>> +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
>>       memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
>>                                              backend->size, ram_flags, errp);
>>       g_free(name);
> 
> As the commit message says, @reserve translates to RAM_NORESERVE.  Good.
> 
> I figure passing RAM_NORESERVE can't make these functions fail.
> Correct?
> 
> @reserve defaults to true.  The commit message assures us this gives us
> the old behavior.  Good.  But the patch *adds* flag RAM_NORESERVE when
> it is true.  Now I'm confused.

ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;

translates to

if (!backend->reserve)
	ram_flags |= RAM_NORESERVE;

I thought for a while if calling the property "noreserve" would be 
cleaner, but decided against it.

-- 
Thanks,

David / dhildenb


