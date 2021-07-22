Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC73D2563
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:15:56 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ZUS-0001L7-0A
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6ZSB-0007il-05
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6ZS8-0006bt-2Q
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626963211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3q97jzPNrMR549NV2zjIGk46mKhPqtXdSzfnAB6VQs=;
 b=h4y5BPNex6jjZUs3DsF+HFTOfuPWzM4MWsGFzkH3mRydyCz9YmjGPESccQRbu1RBXGyyvi
 t98OT7TWe0BOOgObt+qXc2gIpSXArQevfYQkd4yVsV+f8KseG/OC2BPUdWZJ0uMKhTkr8w
 KMW1V7KotJ1WNBVhvInB0+CXO8MzmR4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-IIkb6j3ANWKAeKgdFtSaIg-1; Thu, 22 Jul 2021 10:13:29 -0400
X-MC-Unique: IIkb6j3ANWKAeKgdFtSaIg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i10-20020a5d55ca0000b029013b976502b6so2521870wrw.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 07:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=I3q97jzPNrMR549NV2zjIGk46mKhPqtXdSzfnAB6VQs=;
 b=sipXPNkNNTBnOg80Pn69CA4BeeIB5mvn/RraiwrhBd/k3rGIUAXZTlSg2BSsZGp+qL
 t/Ic2wlRO+vDi3na0fiqL910DXROYUYkmrInU1GfFD1j2jzVNt6HLUZbelv68TZrty21
 /qx1k/TnOT6usWNt5fLrCLrtkk4I6Zksz6JiC6OMOoU3a+LYj1LAV9v5GiBC9NlEy9iY
 IExNWl9hOi7zqtnwci5a/ITPtgnljWEjzkolbPRwsPLVQr3MlR4fd8iAT/265ylfEsHL
 gGUJoUWqJEx1Pohw6bxy5qYOdoWLwdQ5bcOd0vuzeUiQxhWIRhDqVNPoLyno+YXF96U5
 fqmw==
X-Gm-Message-State: AOAM532+7MsA4pjFFDrv5r6Wmy59YGAQ2Z6W4rHyZQM8DLzoqBdtoEpS
 ipKX1puNyH2DsiHkUD/yppNEcJLqe4cAeJ83/UyB13aoI2Zg467ApPZwcpR9GDrgZPub8YGqaby
 /vS+LgCLefc+P5WA=
X-Received: by 2002:a7b:cb92:: with SMTP id m18mr42839063wmi.29.1626963208590; 
 Thu, 22 Jul 2021 07:13:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0DwODBBl76eTetqfDS/REgroWnv0Gnpzg8kR4YoLtpFig3jMOPOtHmGp2mWePyf8ZOBw50A==
X-Received: by 2002:a7b:cb92:: with SMTP id m18mr42839025wmi.29.1626963208279; 
 Thu, 22 Jul 2021 07:13:28 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6970.dip0.t-ipconnect.de. [91.12.105.112])
 by smtp.gmail.com with ESMTPSA id w18sm8099918wrs.44.2021.07.22.07.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 07:13:27 -0700 (PDT)
Subject: Re: [PATCH v2 1/6] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210722123635.60608-1-david@redhat.com>
 <20210722123635.60608-2-david@redhat.com> <YPlzPKCqMZ40z8zY@redhat.com>
 <8ec55578-37b8-079a-5e04-d8160ab19109@redhat.com>
 <YPl25wrKvadQW7Ff@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3e10dfdb-0a6d-69fc-e3f6-c62345cb03f1@redhat.com>
Date: Thu, 22 Jul 2021 16:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPl25wrKvadQW7Ff@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.07.21 15:47, Daniel P. Berrangé wrote:
> On Thu, Jul 22, 2021 at 03:39:50PM +0200, David Hildenbrand wrote:
>> On 22.07.21 15:31, Daniel P. Berrangé wrote:
>>> On Thu, Jul 22, 2021 at 02:36:30PM +0200, David Hildenbrand wrote:
>>>> Let's sense support and use it for preallocation. MADV_POPULATE_WRITE
>>>> does not require a SIGBUS handler, doesn't actually touch page content,
>>>> and avoids context switches; it is, therefore, faster and easier to handle
>>>> than our current approach.
>>>>
>>>> While MADV_POPULATE_WRITE is, in general, faster than manual
>>>> prefaulting, and especially faster with 4k pages, there is still value in
>>>> prefaulting using multiple threads to speed up preallocation.
>>>>
>>>> More details on MADV_POPULATE_WRITE can be found in the Linux commit
>>>> 4ca9b3859dac ("mm/madvise: introduce MADV_POPULATE_(READ|WRITE) to prefault
>>>> page tables") and in the man page proposal [1].
>>>>
>>>> [1] https://lkml.kernel.org/r/20210712083917.16361-1-david@redhat.com
>>>>
>>>> This resolves the TODO in do_touch_pages().
>>>>
>>>> In the future, we might want to look into using fallocate(), eventually
>>>> combined with MADV_POPULATE_READ, when dealing with shared file
>>>> mappings.
>>>>
>>>> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>    include/qemu/osdep.h |  7 ++++
>>>>    util/oslib-posix.c   | 88 +++++++++++++++++++++++++++++++++-----------
>>>>    2 files changed, 74 insertions(+), 21 deletions(-)
>>>
>>>
>>>> @@ -497,6 +493,31 @@ static void *do_touch_pages(void *arg)
>>>>        return NULL;
>>>>    }
>>>> +static void *do_madv_populate_write_pages(void *arg)
>>>> +{
>>>> +    MemsetThread *memset_args = (MemsetThread *)arg;
>>>> +    const size_t size = memset_args->numpages * memset_args->hpagesize;
>>>> +    char * const addr = memset_args->addr;
>>>> +    int ret;
>>>> +
>>>> +    if (!size) {
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    /* See do_touch_pages(). */
>>>> +    qemu_mutex_lock(&page_mutex);
>>>> +    while (!threads_created_flag) {
>>>> +        qemu_cond_wait(&page_cond, &page_mutex);
>>>> +    }
>>>> +    qemu_mutex_unlock(&page_mutex);
>>>> +
>>>> +    ret = qemu_madvise(addr, size, QEMU_MADV_POPULATE_WRITE);
>>>> +    if (ret) {
>>>> +        memset_thread_failed = true;
>>>
>>> I'm wondering if this use of memset_thread_failed is sufficient.
>>>
>>> This is pre-existing from the current impl, and ends up being
>>> used to set the bool result of 'touch_all_pages'. The caller
>>> of that then does
>>>
>>>       if (touch_all_pages(area, hpagesize, numpages, smp_cpus)) {
>>>           error_setg(errp, "os_mem_prealloc: Insufficient free host memory "
>>>               "pages available to allocate guest RAM");
>>>       }
>>>
>>> this was reasonable with the old impl, because the only reason
>>> we ever see 'memset_thread_failed==true' is if we got SIGBUS
>>> due to ENOMEM.
>>>
>>> My concern is that madvise() has a bunch of possible errno
>>> codes returned on failure, and we're not distinguishing
>>> them. In the past this kind of thing has burnt us making
>>> failures hard to debug.
>>>
>>> Could we turn 'bool memset_thread_failed' into 'int memset_thread_errno'
>>>
>>> Then, we can make 'touch_all_pages' have an 'Error **errp'
>>> parameter, and it can directly call
>>>
>>>    error_setg_errno(errp, memset_thead_errno, ....some message...)
>>>
>>> when memset_thread_errno is non-zero, and thus we can remove
>>> the generic message from the caller of touch_all_pages.
>>>
>>> If you agree, it'd be best to refactor the existing code to
>>> use this pattern in an initial patch.
>>
>> We could also simply trace the return value, which should be comparatively
>> easy to add. We should be getting either -ENOMEM or -EHWPOISON. And the
>> latter is highly unlikely to happen when actually preallocating.
>>
>> We made sure that we don't end up with -EINVAL as we're sensing of
>> MADV_POPULATE_WRITE works on the mapping.
> 
> Those are in the "normal" usage scenarios. I'm wondering about the
> abnormal scenarios where QEMU code is mistakenly screwed up or
> libvirt / mgmt app makes some config mistake. eg we can get
> things like EPERM if selinux or seccomp block the madvise
> syscall by mistake (common if EQMU is inside docker for example),
> or can we get EINVAL if the 'addr' is not page aligned, and so on.
> 
>> So when it comes to debugging, I'd actually prefer tracing -errno, as the
>> real error will be of little help to end users.
> 
> I don't care about the end users interpreting it, rather us as maintainers
> who get a bug report containing insufficient info to diagnose the root
> cause.

Well, okay. I'll have a look how this turns out.

-- 
Thanks,

David / dhildenb


