Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF16A5B43
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 16:04:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX1VS-0002op-RV; Tue, 28 Feb 2023 10:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pX1VO-0002i6-V8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:03:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pX1VN-0003dt-6f
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677596579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNUuFy+z5G9wmLrqSInl5QLCY/3dSqgXGEuukC3UluY=;
 b=ewe1dvkDmMDaqBFBmj0ix08PJrrItJIxNHDsBQ1xSWM7HP1dN2i5TemrHloRMdnm4mPjNt
 flrXPN7ovvfCYrEWO7+6PB9sscX8b3nOUtUPDs7TheEuECm7MiuCbXgxh5xwFpiaSWw0CV
 cgvXrpRJK5N9kkl0xD48efP91wCIfNs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-Iltvy4K_O2GdUfIkkMCjiw-1; Tue, 28 Feb 2023 10:02:51 -0500
X-MC-Unique: Iltvy4K_O2GdUfIkkMCjiw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i18-20020a05600011d200b002c94d861113so1595771wrx.16
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 07:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QNUuFy+z5G9wmLrqSInl5QLCY/3dSqgXGEuukC3UluY=;
 b=2teWhdivTkyPOWk5LPP5mzcJj3Tvd6dQ/ra45A6OeEyxaGKcahjZ0e23Es+o/1bzwL
 sPocx6MWmzhmAKF7Fj3rS0k9NTKo3U2VkjIhaSxRyS57ZAUlNRAv0Y0LnsmJ+oPGxf/w
 1cBg2EAeR0FdyTxdSIlyOScwK33IATJ5kcofM4xPJxX4+i46PVebvFD1R7tuC/pS6YaW
 dTrKNE8xuv8GGlu4F2lOLw7ApmIh5sSmLc8N1hrSl86ViZ+itDrUGKN1o87PIZzVuEvs
 sQacKDsfg8GngzkyY1vb/0BFgGK1xsRABJPewodV0rJEKrspSarno0sPFcqEqkVZUn1J
 icXw==
X-Gm-Message-State: AO0yUKUy3mHbOtGuUX1ZSRg4AavI/mhXu8ul/gjvFSunCzUrlXNz3ODe
 WqSKghdeX8kdfUJld5jNYFFMqRHNnbg+IePwqXgV1MyGuLewbzcyNve/OVdDFd/Fj/GogdRwG2O
 Oo6XD4A8MtJJkwQ+ICBDV
X-Received: by 2002:a05:6000:1789:b0:2c5:5938:e6d6 with SMTP id
 e9-20020a056000178900b002c55938e6d6mr2859494wrg.35.1677596569422; 
 Tue, 28 Feb 2023 07:02:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/lMnr8ZpbuLTPWdRLIvUFH/VnNddlQZAWVG/k0WhKkDnEblLgAYAegHzskJksH6qy+c0IsXQ==
X-Received: by 2002:a05:6000:1789:b0:2c5:5938:e6d6 with SMTP id
 e9-20020a056000178900b002c55938e6d6mr2859433wrg.35.1677596568853; 
 Tue, 28 Feb 2023 07:02:48 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac?
 (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de.
 [2003:cb:c706:b800:3757:baed:f95e:20ac])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a5d6a45000000b002c5706f7c6dsm10035915wrw.94.2023.02.28.07.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 07:02:48 -0800 (PST)
Message-ID: <f81827ce-2553-7b50-adba-a32e82f87e1f@redhat.com>
Date: Tue, 28 Feb 2023 16:02:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <cover.1677274611.git.maciej.szmigiero@oracle.com>
 <369d848fdc86994ca646a5aa4e04c4dc049d04f1.1677274611.git.maciej.szmigiero@oracle.com>
 <0953dc26-da87-65c7-9bba-fec4cfb04999@redhat.com>
 <a230f8bc-ef59-d2ad-1316-554f1a293da9@maciej.szmigiero.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for
 memory hot-add protocols
In-Reply-To: <a230f8bc-ef59-d2ad-1316-554f1a293da9@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

> 
> That was more or less the approach that v1 of this driver took:
> The QEMU manager inserted virtual DIMMs (Hyper-V DM memory devices,
> whatever one calls them) explicitly via the machine hotplug handler
> (using the device_add command).
> 
> At that time you said [1] that:
>> 1) I dislike that an external entity has to do vDIMM adaptions /
>> ballooning adaptions when rebooting or when wanting to resize a guest.
> 
> because:
>> Once you have the current approach upstream (vDIMMs, ballooning),
>> there is no easy way to change that later (requires deprecating, etc.).
> 
> That's why this version hides these vDIMMs.

Note that I don't have really strong feelings about letting the user 
hotplug devices. My comment was in general about user interactions when 
adding/removing memory or when rebooting the VM. As soon as you use 
individual memory blocks and/or devices, we end up with a similar user 
experience as we have already with DIMMS+virtio-balloon (bad IMHO).

Hiding the devices internally might make it a little bit easier to use, 
but it's still the same underlying concept: to add more memory you have 
to figure out whether to deflate the balloon or whether to add a new 
memory backend. What memory backends will remain when we reboot? When 
can we remove memory backends?

But that's just about the user interaction in general. My comment here 
was about the hidden devices: they have to go through plug handlers to 
get resources assigned, not self-assign resources in the realize function.


Note that virtio-mem uses a single sparse memory backend to make 
resizing easier (well, and to handle migration and some other things 
easier). But it comes with other things that require optimization. Using 
multiple memslots to expose memory to the VM is one optimization I'm 
working on. Resizable memory backends are another one.

I think you could implement the memory adding part similar to 
virtio-mem, and simply have a large sparse memory backend, from which 
you expose new memory to the VM as you please. And you could even use 
multiple memslots for that. But that's your design decision, and I won't 
argue with that, just pointing that out.


> Instead, the QEMU manager (user) directly provides the raw memory
> backend device (for example, memory-backend-ram) to the driver via a QMP
> command.

Yes, that's what I understood.

> 
> Since now the user is not expected to touch these vDIMMs directly in any
> way these become an implementation detail than can be changed or even
> removed if needed at some point, without affecting the existing users.
> 
>> But before we dive into the details of that, I wonder if you could just avoid having a memory device for each block of memory you want to add.
>>
>>
>> An alternative might be the following:
>>
>> Have a hv-balloon device be a memory device with a configured maximum size and a memory device region container. Let the machine hotplug handler assign a contiguous region in the device memory region and map the memory device region container (while plugging that hv-balloon device), just like we do it for virtio-mem and virtio-pmem.
>>
>> In essence, you reserve a region in physical address space that way and can decide what to (un)map into that memory device region container, you do your own placement.
>>
>> So when instructed to add a new memory backend, you simply assign an address in the assigned region yourself, and map the memory backend memory region into the device memory region container.
>>
>> The only catch is that that memory device (hv-balloon) will then consume multiple memslots (one for each memory backend), right now we only support 1 memslot (e.g., asking if one more slot is free when plugging the device).
>>
>>
> Technically in this case a "main" hv-balloon device is still needed -
> in contrast with virtio-mem (which allows multiple instances) there can
> be only one Dynamic Memory protocol provider on the VMBus.

Yes, just like virtio-balloon. There cannot be multiple instances.

> 
> That means these "container" sub-devices would need to register with that
> main hv-balloon device.
> 

My question is, if they really have to be devices. Why wouldn't it 
sufficient to map the memory backends directly into the container? Why 
is the

> However, I'm not sure what is exactly gained by this approach.
> 
> These sub-devices still need to implement the TYPE_MEMORY_DEVICE interface

No, they wouldn't unless I am missing something. Only the hv-balloon 
device would be a TYPE_MEMORY_DEVICE.

> so they are accounted for properly (the alternative would be to patch
> the relevant QEMU code all over the place - that's probably why
> virtio-mem also implements this interface instead).

Please elaborate, I don't understand what you are trying to say here. 
Memory devices provide hooks, and the hooks exist for a reason -- 
because memory devices are no longer simple DIMMs/NVDIMMs. And 
virtio-mem + virtio-omem was responsible for adding some of these hooks.

> 
> One still needs some QMP command to add a raw memory backend to
> the chosen "container" hv-balloon sub-device.

If you go with multiple memory backends, yes.

> 
> Since now the QEMU manager (user) is aware of the presence of these
> "container" sub-devices, and has to manage them, changing the QEMU
> interface in the future is more complex (as you said in [1]).

Can you elaborate? Yes, when you design the feature around "multiple 
memory backends", you'll have to have an interface to add such. Well, 
and to query them during migration. And, maybe also to detect when to 
remove some (migration)?


> 
> I understand that virtio-mem uses a similar approach, however that's
> because the virtio-mem protocol itself works that way.
> 
>> I'm adding support for that right now to implement a virtio-mem
>> extension -- the memory device says how many memslots it requires,
>> and these will get reserved for that memory device; the memory device
>> can then consume them later without further checks dynamically. That
>> approach could be extended to increase/decrease the memslot
>> requirement (the device would ask to increase/decrease its limit),
>> if ever required.
> 
> In terms of future virtio-mem things I'm also eagerly waiting for an
> ability to set a removed virtio-mem block read-only (or not covered by
> any memslot) - this most probably could be reused later for implementing
> the same functionality in this driver.

In contrast to setting them read-only, the memslots that contain no 
plugged blocks anymore will be completely removed. The goal is to not 
consume any metadata overhead in KVM (well, and also do one step into 
the direction of protecting unplugged memory from getting reallocated).

-- 
Thanks,

David / dhildenb


