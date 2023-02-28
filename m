Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA876A6137
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:28:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7W7-0005tA-MH; Tue, 28 Feb 2023 16:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pX7W4-0005sY-KZ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:28:08 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pX7W2-0006qH-IU
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:28:08 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pX7Vu-0004Y3-VJ; Tue, 28 Feb 2023 22:27:59 +0100
Message-ID: <a0ebed14-436f-91c9-928d-e53e29d9db81@maciej.szmigiero.name>
Date: Tue, 28 Feb 2023 22:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, pl-PL
To: David Hildenbrand <david@redhat.com>
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
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for
 memory hot-add protocols
In-Reply-To: <f81827ce-2553-7b50-adba-a32e82f87e1f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
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

On 28.02.2023 16:02, David Hildenbrand wrote:
>>
>> That was more or less the approach that v1 of this driver took:
>> The QEMU manager inserted virtual DIMMs (Hyper-V DM memory devices,
>> whatever one calls them) explicitly via the machine hotplug handler
>> (using the device_add command).
>>
>> At that time you said [1] that:
>>> 1) I dislike that an external entity has to do vDIMM adaptions /
>>> ballooning adaptions when rebooting or when wanting to resize a guest.
>>
>> because:
>>> Once you have the current approach upstream (vDIMMs, ballooning),
>>> there is no easy way to change that later (requires deprecating, etc.).
>>
>> That's why this version hides these vDIMMs.
> 
> Note that I don't have really strong feelings about letting the user hotplug devices. My comment was in general about user interactions when adding/removing memory or when rebooting the VM. As soon as you use individual memory blocks and/or devices, we end up with a similar user experience as we have already with DIMMS+virtio-balloon (bad IMHO).
> 
> Hiding the devices internally might make it a little bit easier to use, but it's still the same underlying concept: to add more memory you have to figure out whether to deflate the balloon or whether to add a new memory backend. 

Well, the logic here is pretty simple: deflate the balloon first
(including deflating it by zero bytes if not inflated), then, if any
memory size remains to add, hot-add the reminder.

We can't get rid of ballooning altogether because otherwise going
below the boot memory size wouldn't be possible.

> What memory backends will remain when we reboot?

In this driver version, none will remain inserted
(virtio-mem also seems to unplug all blocks unconditionally when the
VM is rebooted).

In version 1, all memory backeds were re-inserted once the guest
re-connected to the DM protocol after a reboot.

As I wrote in my response to Daniel moments ago, there are some issues
with automatic re-insertion if the guest never re-connects to the DM
protocol - that's why I've removed this functionality from this
driver version.

> When can we remove memory backends?

There's a QMP event generated when a memory backend can be removed:
HV_BALLOON_MEMORY_BACKEND_UNUSED

> But that's just about the user interaction in general. My comment here was about the hidden devices: they have to go through plug handlers to get resources assigned, not self-assign resources in the realize function.
> 
> 
> Note that virtio-mem uses a single sparse memory backend to make resizing easier (well, and to handle migration and some other things easier). But it comes with other things that require optimization. Using multiple memslots to expose memory to the VM is one optimization I'm working on. Resizable memory backends are another one.
> 
> I think you could implement the memory adding part similar to virtio-mem, and simply have a large sparse memory backend, from which you expose new memory to the VM as you please. And you could even use multiple memslots for that. But that's your design decision, and I won't argue with that, just pointing that out.
> 
> 
>> Instead, the QEMU manager (user) directly provides the raw memory
>> backend device (for example, memory-backend-ram) to the driver via a QMP
>> command.
> 
> Yes, that's what I understood.
> 
>>
>> Since now the user is not expected to touch these vDIMMs directly in any
>> way these become an implementation detail than can be changed or even
>> removed if needed at some point, without affecting the existing users.
>>
>>> But before we dive into the details of that, I wonder if you could just avoid having a memory device for each block of memory you want to add.
>>>
>>>
>>> An alternative might be the following:
>>>
>>> Have a hv-balloon device be a memory device with a configured maximum size and a memory device region container. Let the machine hotplug handler assign a contiguous region in the device memory region and map the memory device region container (while plugging that hv-balloon device), just like we do it for virtio-mem and virtio-pmem.
>>>
>>> In essence, you reserve a region in physical address space that way and can decide what to (un)map into that memory device region container, you do your own placement.
>>>
>>> So when instructed to add a new memory backend, you simply assign an address in the assigned region yourself, and map the memory backend memory region into the device memory region container.
>>>
>>> The only catch is that that memory device (hv-balloon) will then consume multiple memslots (one for each memory backend), right now we only support 1 memslot (e.g., asking if one more slot is free when plugging the device).
>>>
>>>
>> Technically in this case a "main" hv-balloon device is still needed -
>> in contrast with virtio-mem (which allows multiple instances) there can
>> be only one Dynamic Memory protocol provider on the VMBus.
> 
> Yes, just like virtio-balloon. There cannot be multiple instances.

Right, this has some important consequences (see below).

>>
>> That means these "container" sub-devices would need to register with that
>> main hv-balloon device.
>>
> 
> My question is, if they really have to be devices. Why wouldn't it sufficient to map the memory backends directly into the container? Why is the

See the answer below the next paragraph.

> 
>> However, I'm not sure what is exactly gained by this approach.
>>
>> These sub-devices still need to implement the TYPE_MEMORY_DEVICE interface
> 
> No, they wouldn't unless I am missing something. Only the hv-balloon device would be a TYPE_MEMORY_DEVICE.
In case of virtio-mem if one wants to add even more memory than the
"current" backing memory device allows there's always a possibility of
adding yet another virtio-mem-pci device with an additional backing
memory device.

If there would be just the main hv-balloon device (implementing
TYPE_MEMORY_DEVICE) then this would not be possible, since one can't
have multiple DM VMBus devices.

Hence, intermediate sub-devices are necessary (each one implementing
TYPE_MEMORY_DEVICE), which do not sit on the VMBus, in order to allow
adding new backing memory devices (as virtio-mem allows).

>> so they are accounted for properly (the alternative would be to patch
>> the relevant QEMU code all over the place - that's probably why
>> virtio-mem also implements this interface instead).
> 
> Please elaborate, I don't understand what you are trying to say here. Memory devices provide hooks, and the hooks exist for a reason -- because memory devices are no longer simple DIMMs/NVDIMMs. And virtio-mem + virtio-omem was responsible for adding some of these hooks.

I was referring to the necessity of implementing TYPE_MEMORY_DEVICE at
all in hv-balloon driver - if it didn't implement this interface then it
couldn't benefit from the logic in hw/mem/memory-device.c, so it would
need to be open-coded inside the driver and every call to functions
provided by that file from QEMU would need to be patched to account for
the memory provided by this driver.

> 
>>
>> One still needs some QMP command to add a raw memory backend to
>> the chosen "container" hv-balloon sub-device.
> 
> If you go with multiple memory backends, yes.
> 
>>
>> Since now the QEMU manager (user) is aware of the presence of these
>> "container" sub-devices, and has to manage them, changing the QEMU
>> interface in the future is more complex (as you said in [1]).>
> Can you elaborate? Yes, when you design the feature around "multiple memory backends", you'll have to have an interface to add such. Well, and to query them during migration. And, maybe also to detect when to remove some (migration)?
> 

As I wrote above, multiple backing memory devices are necessary so the
guest can be expanded above the initially provided backing memory device,
much like virtio-mem already allows.

And then you have to either:
1) Let the hv-balloon driver transparently manage the lifetime of these
sub-devices, like this version of the patch set does, OR:

2) Make the QEMU manager (user) insert and remove these sub-devices
explicitly, like the version 1 of this driver did.

> 
>>
>> I understand that virtio-mem uses a similar approach, however that's
>> because the virtio-mem protocol itself works that way.
>>
>>> I'm adding support for that right now to implement a virtio-mem
>>> extension -- the memory device says how many memslots it requires,
>>> and these will get reserved for that memory device; the memory device
>>> can then consume them later without further checks dynamically. That
>>> approach could be extended to increase/decrease the memslot
>>> requirement (the device would ask to increase/decrease its limit),
>>> if ever required.
>>
>> In terms of future virtio-mem things I'm also eagerly waiting for an
>> ability to set a removed virtio-mem block read-only (or not covered by
>> any memslot) - this most probably could be reused later for implementing
>> the same functionality in this driver.
> 
> In contrast to setting them read-only, the memslots that contain no plugged blocks anymore will be completely removed. The goal is to not consume any metadata overhead in KVM (well, and also do one step into the direction of protecting unplugged memory from getting reallocated).
> 

Nice, looking forward to having this functionality in QEMU for Linux
guests.

Thanks,
Maciej


