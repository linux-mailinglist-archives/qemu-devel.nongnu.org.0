Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1866A6A6232
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:13:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8D5-0007Ce-SQ; Tue, 28 Feb 2023 17:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pX8D3-00075X-LM
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pX8D1-0007hs-Jy
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677622350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxYUe2D6Ud1DPXZTkmXfbgyqLEBK5K5wQf3Yt4Zstdc=;
 b=d5mnlKaWoj4K3qvEOslxZWZNwFeywMPDavbPGHsBAcG8OPj0VVAa5aAZYfMvR6i7DJy3uc
 /AD3jyq15SVUmfWbf9zARsyLAOqlz7deSu/zJUWaUoFRb41BpoRpyACjofnpJfHxvdytxn
 6fOdyFs3pSd7/y8/RkUT8ZjM8yTMQsE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-X8lkS1ybNtaIuZCIKc8xFQ-1; Tue, 28 Feb 2023 17:12:29 -0500
X-MC-Unique: X8lkS1ybNtaIuZCIKc8xFQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so7490631wme.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :content-language:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dxYUe2D6Ud1DPXZTkmXfbgyqLEBK5K5wQf3Yt4Zstdc=;
 b=rv5AGutX32xasWghtK1gwXKR9hPbW9oQJclxd8TKxpuerndgtT+mO7Vcm/7B8KelZD
 7JTsHv+z1J/jNJGv7/UkbnC9sI/K6Z6bGbkppByD8Nb4J9OsjuALc2NtPAl9W4ak5Io+
 EZDHYAY7+is12oPCUcrKk2WZxts3rhVjKGOS9wMc9A8MreivQjGZNrac7BE56A7RQZZF
 uJ1FIvXWbKYRBYyYHJwpPMp6m+4FTkCgUD09O4kGtl0JggGQpG60I8rvVqWZ9VxJzKq3
 jMOpBfvGhaGbaTNqp34w9zRsAQpPQsNT7ARWgFP4kUKZhB0uRg9fLiQm1hRZseMecMm2
 JhOQ==
X-Gm-Message-State: AO0yUKU0p63wZN4kJPV+z0oTx6SwhBRqiYvRIV13q+6wwCroLRdUpa3I
 Ll1Fu+uovTBfwHFbWPwiAHRHfFH5mouOHOxqyoYT8vogEQqz3kbM8VyzgZ7H2wXpiJ9Ev4A3T3p
 0UQQhZem1RXNf/WM=
X-Received: by 2002:a05:600c:cc5:b0:3eb:2de9:8af1 with SMTP id
 fk5-20020a05600c0cc500b003eb2de98af1mr3398352wmb.32.1677622348039; 
 Tue, 28 Feb 2023 14:12:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9uDFLDHdHQ90rJFDE7nMqqdmUaCWHFHptyxLxrAwPsgGgJnRftM0V2aBWo8qSVD2Zn3cJ5mw==
X-Received: by 2002:a05:600c:cc5:b0:3eb:2de9:8af1 with SMTP id
 fk5-20020a05600c0cc500b003eb2de98af1mr3398338wmb.32.1677622347629; 
 Tue, 28 Feb 2023 14:12:27 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac?
 (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de.
 [2003:cb:c706:b800:3757:baed:f95e:20ac])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d6a41000000b002c70a68111asm11013167wrw.83.2023.02.28.14.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 14:12:27 -0800 (PST)
Message-ID: <eb7e7365-b8e1-2547-596a-98ffe826766f@redhat.com>
Date: Tue, 28 Feb 2023 23:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
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
 <f81827ce-2553-7b50-adba-a32e82f87e1f@redhat.com>
 <a0ebed14-436f-91c9-928d-e53e29d9db81@maciej.szmigiero.name>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for
 memory hot-add protocols
In-Reply-To: <a0ebed14-436f-91c9-928d-e53e29d9db81@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 28.02.23 22:27, Maciej S. Szmigiero wrote:
> On 28.02.2023 16:02, David Hildenbrand wrote:
>>>
>>> That was more or less the approach that v1 of this driver took:
>>> The QEMU manager inserted virtual DIMMs (Hyper-V DM memory devices,
>>> whatever one calls them) explicitly via the machine hotplug handler
>>> (using the device_add command).
>>>
>>> At that time you said [1] that:
>>>> 1) I dislike that an external entity has to do vDIMM adaptions /
>>>> ballooning adaptions when rebooting or when wanting to resize a guest.
>>>
>>> because:
>>>> Once you have the current approach upstream (vDIMMs, ballooning),
>>>> there is no easy way to change that later (requires deprecating, etc.).
>>>
>>> That's why this version hides these vDIMMs.
>>
>> Note that I don't have really strong feelings about letting the user hotplug devices. My comment was in general about user interactions when adding/removing memory or when rebooting the VM. As soon as you use individual memory blocks and/or devices, we end up with a similar user experience as we have already with DIMMS+virtio-balloon (bad IMHO).
>>
>> Hiding the devices internally might make it a little bit easier to use, but it's still the same underlying concept: to add more memory you have to figure out whether to deflate the balloon or whether to add a new memory backend.
> 
> Well, the logic here is pretty simple: deflate the balloon first
> (including deflating it by zero bytes if not inflated), then, if any
> memory size remains to add, hot-add the reminder.
> 

Yes, but if you have 1 GiB deflated and want to add 2 GiB, things are 
already getting more involved if you get what I mean.

I was going through the exact same model back when I was designing 
virtio-mem, and eventually added with a way where you can just tell QEMU 
the requested size an be done with it.

> We can't get rid of ballooning altogether because otherwise going
> below the boot memory size wouldn't be possible.

Right, more on that below.

> 
>> What memory backends will remain when we reboot?
> 
> In this driver version, none will remain inserted
> (virtio-mem also seems to unplug all blocks unconditionally when the
> VM is rebooted).
> 

There is a very important difference: virtio-mem only temporarily 
unplugs that memory. As the guest boots up it re-adds the requested 
amount of memory without any user interaction. That was added for two 
main reasons

(a) We can easily defragment the virtio-mem device that way.
(b) If the rebooted guest doesn't load the virtio-mem driver, it
     wouldn't be able to make use of that memory. Like, rebooting into
     Windows right now ;)

So if you hotplugged some memory using virtio-mem and reboot, that 
memory will automatically be re-added.

> In version 1, all memory backeds were re-inserted once the guest
> re-connected to the DM protocol after a reboot.
> 
> As I wrote in my response to Daniel moments ago, there are some issues
> with automatic re-insertion if the guest never re-connects to the DM
> protocol - that's why I've removed this functionality from this
> driver version.

I think we might be able to to better, but that's just my idea how it 
could look like. I'll describe it below.

[...]

>>> However, I'm not sure what is exactly gained by this approach.
>>>
>>> These sub-devices still need to implement the TYPE_MEMORY_DEVICE interface
>>
>> No, they wouldn't unless I am missing something. Only the hv-balloon device would be a TYPE_MEMORY_DEVICE.
> In case of virtio-mem if one wants to add even more memory than the
> "current" backing memory device allows there's always a possibility of
> adding yet another virtio-mem-pci device with an additional backing
> memory device.

We could, but that's not the way I envision virtio-mem. The thing is, 
already when starting QEMU we have to make decisions about the maximum 
VM size when setting the maxmem option. Consequently, we cannot grow a 
VM until infinity, we already have to plan ahead to some degree.

So what my goal is with virito-mem, is the following (it already works, 
we just have to work on reduction of metadata and memory overcommit 
handling -- mostly internal optimizations):

qemu-kvm ... \
-m 4G,maxmem=1048G \
-object memory-backend-ram,id=mem0,size=1T, ... \
-device virtio-mem-pci,id=vmem0,memdev=mem0,requested-size=0

So we an grow the guest up to 1T if we like. There is no way we could 
add more memory to that VM because we're already hitting the limit of 
maxmem.

It gets more complicated with multiple NUMA nodes, NVDIMMS, etc, but the 
main goal is to make it possible to have the maximum size be 
ridiculously large (while optimizing it internally!) that one doesn't 
have to even worry about adding a new device.

I think the same model would work for hv as well, at least with my 
limited knowledge about it ;)

> 
> If there would be just the main hv-balloon device (implementing
> TYPE_MEMORY_DEVICE) then this would not be possible, since one can't
> have multiple DM VMBus devices.
> 
> Hence, intermediate sub-devices are necessary (each one implementing
> TYPE_MEMORY_DEVICE), which do not sit on the VMBus, in order to allow
> adding new backing memory devices (as virtio-mem allows).

Not necessarily, I think, as discussed.

> 
>>> so they are accounted for properly (the alternative would be to patch
>>> the relevant QEMU code all over the place - that's probably why
>>> virtio-mem also implements this interface instead).
>>
>> Please elaborate, I don't understand what you are trying to say here. Memory devices provide hooks, and the hooks exist for a reason -- because memory devices are no longer simple DIMMs/NVDIMMs. And virtio-mem + virtio-omem was responsible for adding some of these hooks.
> 
> I was referring to the necessity of implementing TYPE_MEMORY_DEVICE at
> all in hv-balloon driver - if it didn't implement this interface then it
> couldn't benefit from the logic in hw/mem/memory-device.c, so it would
> need to be open-coded inside the driver and every call to functions
> provided by that file from QEMU would need to be patched to account for
> the memory provided by this driver.

Ah, yes, one device has to be a memory device. I was just asking if you 
really need multiple ones.

> 
>>
>>>
>>> One still needs some QMP command to add a raw memory backend to
>>> the chosen "container" hv-balloon sub-device.
>>
>> If you go with multiple memory backends, yes.
>>
>>>
>>> Since now the QEMU manager (user) is aware of the presence of these
>>> "container" sub-devices, and has to manage them, changing the QEMU
>>> interface in the future is more complex (as you said in [1]).>
>> Can you elaborate? Yes, when you design the feature around "multiple memory backends", you'll have to have an interface to add such. Well, and to query them during migration. And, maybe also to detect when to remove some (migration)?
>>
> 
> As I wrote above, multiple backing memory devices are necessary so the
> guest can be expanded above the initially provided backing memory device,
> much like virtio-mem already allows.
> 
> And then you have to either:
> 1) Let the hv-balloon driver transparently manage the lifetime of these
> sub-devices, like this version of the patch set does, OR:
> 
> 2) Make the QEMU manager (user) insert and remove these sub-devices
> explicitly, like the version 1 of this driver did.

Let's me raise this idea:

qemu-kvm ... \
-m 4G,maxmem=1048G \
-object memory-backend-ram,id=mem0,size=1T, ... \
-device hv-balloon,id=vmem0,memdev=mem0

We'd do the same internal optimizations as we're doing (and the ones I 
am working on) for virtio-mem.

The above would result in a VM with 4G. With virtio-mem, we resize 
devices, with the balloon, you resize the logical VM size.

So the single (existing?) user interface would be the existing balloon 
cmd. Note that we set the logical VM size here, not the size of the balloon.

info balloon -> 4G
balloon 2G [will inflate]
info balloon -> 2G
balloon 128G [will deflate, then hotplug]
info balloon -> 128G
balloon 8G [will deflate]
info balloon -> 8G
...

How memory is added (deflate first, then expose some new memory via the 
memdev, ...) is left to the hv-balloon device, the user doesn't have to 
bother. We set the logical VM size and hv-balloon will do it's thing to 
eventually reach that goal.

Reboot? Logically unplug all memory and as the guest boots up, re-add 
the memory after the guest booted up.

The only thing we can't do is the following: when going below 4G, we 
cannot resize boot memory.


But I recall that that's *exactly* how the HV version I played with ~2 
years ago worked: always start up with some initial memory ("startup 
memory"). After the VM is up for some seconds, we either add more memory 
(requested > startup) or request the VM to inflate memory (requested < 
startup).


Even migration could eventually be fairly simple, because virtio-mem 
already solved it to some degree. The only catch is, that for boot 
memory, we'd also have to detect discarded ranges. But that would be 
something to think about in the future.

-- 
Thanks,

David / dhildenb


