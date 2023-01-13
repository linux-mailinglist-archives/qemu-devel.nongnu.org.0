Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D69669906
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKPE-0004uI-Fb; Fri, 13 Jan 2023 08:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGKPB-0004rs-4b
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGKP5-0006lG-6m
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673617648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdsCO8S8NamAvZXt4xhnYc9umP0qVSVYJzFLwnzmTik=;
 b=Bq+YMyg7A/p/mg18WmKyzuUuz4v4oUAhsLEe0xyyLddr0H42pO527zmt7xc845oGeho0UV
 0ZMOf0nrJ3Y0mR7LA+vvYRVT9Wgv6chSVeTtM4M15Bex6rOXkHrclrDQ+tp2e3UeWqNudF
 BgNYRwGf1HCvkR8hzueOnvXROp0y0WQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-K-EupQr4O3u19ywG-LMytA-1; Fri, 13 Jan 2023 08:47:27 -0500
X-MC-Unique: K-EupQr4O3u19ywG-LMytA-1
Received: by mail-wm1-f72.google.com with SMTP id
 t24-20020a1c7718000000b003d1fd0b866fso4913879wmi.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fdsCO8S8NamAvZXt4xhnYc9umP0qVSVYJzFLwnzmTik=;
 b=drYFgb24ojtf0A/RhSW9vrA78YCAd/oe85X7BO5OcwC9U6PxUoii/FCqULGPL/b6ae
 va8RRX+ijU2iYJwVgTY7JNw+nhoZUqVMBc6XQSP+7fDHcHpASYzz9WxyFCP7lKS7/Trm
 o1FCAuZZGCC1EyVg+3FnNzm9rQm9gnheMtFUr59izuA1SYG/zqqhcRbDSYd7ecmzEokd
 MNGxqjwGZ3mvNeeio2SFOE4m2t5MXyn+vLeAXaX3pqBjqVGPj6xq6bWRmI6zcZSmdKPc
 qtUI+X/RfC+6AEqxx5W//4Zjyo81m4+2iEI73SU6uNU2ZlDy8+SlCs7ZadIMdr+dBZgy
 02cQ==
X-Gm-Message-State: AFqh2koC09OcmGXCzHwzxqNVcDVdM7mBU6uwJV+RESCID75y88IcsXFj
 h2ogXWYEQjleL2TalFx1qMHmApyngyL3Wc9VC8KXjfUpPttvajSEU4HG4Qkls7WtGE8RMX7QGdl
 3pFYOkRUWyzEFmy8=
X-Received: by 2002:a05:6000:a19:b0:2bd:c477:8d6b with SMTP id
 co25-20020a0560000a1900b002bdc4778d6bmr7733697wrb.42.1673617646433; 
 Fri, 13 Jan 2023 05:47:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvosg6QCc+pj2TrrqO7haYK9NXZHSlL7JjnSyvin9/ziQkm20pdU7i9VPS91SwfxfS/6jMlJg==
X-Received: by 2002:a05:6000:a19:b0:2bd:c477:8d6b with SMTP id
 co25-20020a0560000a1900b002bdc4778d6bmr7733679wrb.42.1673617646126; 
 Fri, 13 Jan 2023 05:47:26 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:ec00:869d:7200:eb03:db01?
 (p200300cbc704ec00869d7200eb03db01.dip0.t-ipconnect.de.
 [2003:cb:c704:ec00:869d:7200:eb03:db01])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b0027cb20605e3sm18647378wrk.105.2023.01.13.05.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 05:47:25 -0800 (PST)
Message-ID: <fa21267a-c1aa-2d43-799d-eb955318aec3@redhat.com>
Date: Fri, 13 Jan 2023 14:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-4-david@redhat.com> <Y8BJ02EiHNSr6xMv@work-vm>
 <11b7237a-000a-5ad7-3747-246825188d83@redhat.com> <Y8BlCeViRSzyTQ8+@work-vm>
 <Y8CGYZ3F/h1oXV+d@x1n> <Y8CJf7hCy76AtfcF@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 3/8] migration/savevm: Allow immutable device state to
 be migrated early (i.e., before RAM)
In-Reply-To: <Y8CJf7hCy76AtfcF@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

[...]

>>> It might be OK if you just change the declaration; I mean '1' is pretty
>>> close to true? (I think...)
>>> Anyway, at least make the new one a bool.
>>
>> Agreed bool is better.  Can we rename it to something like "early_setup"?
>> "immutable" isn't clear on its most important attribute (on when it'll be
>> migrated).  Meanwhile I'd hope we can comment that explicitly.  I'd go with:
>>
>>    /*
>>     * This VMSD describes something that should be sent during setup phase
>>     * of migration.  It plays similar role as save_setup() for explicitly
>>     * registered vmstate entries, the only difference is the vmsd will be
>>     * sent right at the start of migration.
>>     */
>>    bool early_setup;
> 
> Let me try some even better wording..
> 
>      /*
>       * This VMSD describes something that should be sent during setup phase
>       * of migration.  It plays similar role as save_setup() for explicitly
>       * registered vmstate entries, so it can be seen as a way to describe
>       * save_setup() in vmsd structures.
>       *
>       * One SaveStateEntry should either have the save_setup() specified or
>       * the vmsd with early_setup set to true.  It should never have both
>       * things set.
>       */
>      bool early_setup;
> 

Thanks, I'll use that.

> There's one tricky thing that we'll send QEMU_VM_SECTION_START for
> save_setup() entries but QEMU_VM_SECTION_FULL for vmsd early_setup
> entries.

I think that makes sense for now, though: we only transmit a VMSD and 
VMSDs are transmitted once and are not iterable.

In comparison, for iterable things we expect a

QEMU_VM_SECTION_START
0..X QEMU_VM_SECTION_PART
QEMU_VM_SECTION_END


I assume you're thinking about "mixing" save_state() with an early vmsd 
in a SaveStateEntry. I don't think something like that would currently 
work (I'm pretty sure the core would have a hard time figuring out if to 
restore a vmsd or whether to send the input to load_state()?), neither 
can it be configured: we wither have se->ops or se->vmsd.

> 
> David, do you think we can slightly modify your new version of
> vmstate_save() so as to pass in the section_type?  I think it'll be even
> cleaner to send QEMU_VM_SECTION_START for the early vmsds too.  I assume
> this shouldn't affect your goal and anything else.

I'd prefer to not go down that path for now. QEMU_VM_SECTION_START 
without QEMU_VM_SECTION_PART and QEMU_VM_SECTION_END feels pretty 
incomplete and wrong to me.

If we want to do that in the future, we should conditionally send 
QEMU_VM_SECTION_START only if we have se->ops I assume?

> 
>>
>>>
>>>>>>        int version_id;
>>>>>>        int minimum_version_id;
>>>>>>        MigrationPriority priority;
>>>>>> diff --git a/migration/savevm.c b/migration/savevm.c
>>>>>> index ff2b8d0064..536d6f662b 100644
>>>>>> --- a/migration/savevm.c
>>>>>> +++ b/migration/savevm.c
>>>>>> @@ -1200,6 +1200,15 @@ void qemu_savevm_state_setup(QEMUFile *f)
>>>>>>        trace_savevm_state_setup();
>>>>>>        QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>>>>>> +        if (se->vmsd && se->vmsd->immutable) {
>>>>>> +            ret = vmstate_save(f, se, ms->vmdesc);
>>>>>> +            if (ret) {
>>>>>> +                qemu_file_set_error(f, ret);
>>>>>> +                break;
>>>>>> +            }
>>>>>> +            continue;
>>>>>> +        }
>>>>>> +
>>>>>
>>>>> Does this give you the ordering you want? i.e. there's no guarantee here
>>>>> that immutables come first?
>>>>
>>>> Yes, for virtio-mem at least this is fine. There are no real ordering
>>>> requirements in regard to save_setup().
>>>>
>>>> I guess one could use vmstate priorities to affect the ordering, if
>>>> required.
>>>>
>>>> So for my use case this is good enough, any suggestions? Thanks.
>>>
>>> OK, but consider whether it might be better just to have a separate
>>> QTAILQ_FOREACH look in savevm_state_setup that first does all the
>>> immutables, and then all the setups.
>>
>> After patch 1 the order may not matter iiuc, because each call to the
>> immutable vmsds calls the new vmstate_save() which will always send
>> QEMU_VM_SECTION_FULL and footers along the vmsd.

Agreed. I'll leave it like that for now.

Thanks!

-- 
Thanks,

David / dhildenb


