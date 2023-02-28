Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAFD6A5AAC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:16:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0lk-0006Nq-Ht; Tue, 28 Feb 2023 09:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pX0lO-0006Bh-4K
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:15:39 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pX0lG-0001Vq-H8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:15:24 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pX0ky-0002lp-RS; Tue, 28 Feb 2023 15:15:04 +0100
Message-ID: <a230f8bc-ef59-d2ad-1316-554f1a293da9@maciej.szmigiero.name>
Date: Tue, 28 Feb 2023 15:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
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
Content-Language: en-US, pl-PL
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH][RESEND v3 1/3] hapvdimm: add a virtual DIMM device for
 memory hot-add protocols
In-Reply-To: <0953dc26-da87-65c7-9bba-fec4cfb04999@redhat.com>
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

On 27.02.2023 16:25, David Hildenbrand wrote:
> On 24.02.23 22:41, Maciej S. Szmigiero wrote:
>> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>>
>> This device works like a virtual DIMM stick: it allows inserting extra RAM
> 
> All DIMMs in QEMU are virtual. What you want it, a piece of memory that doesn not get exposed via ACPI or similar (and doesn't follow the traditional "slots" concept).

Right.

>> into the guest at run time and later removing it without having to
>> duplicate all of the address space management logic of TYPE_MEMORY_DEVICE
>> in each memory hot-add protocol driver.
> 
> ... which are these? virtio-mem and virtio-pmem do their own thing for good reasons. You're adding it for HV.
> 
> I don't think their is demand for a generic device. In fact, I have no idea what "HAPVDIMM" should actually mean.
> 
> If you really need such a device after we discussed the alternatives, please keep it hv-specific.

No problem, the device can be made hv-specific - at least until another use
for it is found (if it is found).

>>
>> This device is not meant to be instantiated or removed by the QEMU user
>> directly: rather, the protocol driver is supposed to add and remove it as
>> required.
> 
> That sounds like the wrong approach to me. More on that below.
> 
>>
>> In fact, its very existence is supposed to be an implementation detail,
>> transparent to the QEMU user.
>>
>> To prevent the user from accidentally manually creating an instance of this
>> device the protocol driver is supposed to place the qdev_device_add*() call
>> (that is uses to add this device) between hapvdimm_allow_adding() and
>> hapvdimm_disallow_adding() calls in order to temporary authorize the
>> operation.
>>
> 
> The most important part first: the realize function of a device is not supposed to assing itself any resources. Calling memory device (un)plug functions from the realize function is wrong.
> 
> (Hot)plug handlers are the right approach for that. Please refer to how we chain hotplug handlers (machine hotplug handler -> bus hotplug handler) to implement virtio-mem and virtio-pmem. These hotplug handlers would also be the place where to reject a device if created by the user, for example.
> 

That was more or less the approach that v1 of this driver took:
The QEMU manager inserted virtual DIMMs (Hyper-V DM memory devices,
whatever one calls them) explicitly via the machine hotplug handler
(using the device_add command).

At that time you said [1] that:
> 1) I dislike that an external entity has to do vDIMM adaptions /
> ballooning adaptions when rebooting or when wanting to resize a guest.

because:
> Once you have the current approach upstream (vDIMMs, ballooning),
> there is no easy way to change that later (requires deprecating, etc.).

That's why this version hides these vDIMMs.
Instead, the QEMU manager (user) directly provides the raw memory
backend device (for example, memory-backend-ram) to the driver via a QMP
command.

Since now the user is not expected to touch these vDIMMs directly in any
way these become an implementation detail than can be changed or even
removed if needed at some point, without affecting the existing users.

> But before we dive into the details of that, I wonder if you could just avoid having a memory device for each block of memory you want to add.
> 
> 
> An alternative might be the following:
> 
> Have a hv-balloon device be a memory device with a configured maximum size and a memory device region container. Let the machine hotplug handler assign a contiguous region in the device memory region and map the memory device region container (while plugging that hv-balloon device), just like we do it for virtio-mem and virtio-pmem.
> 
> In essence, you reserve a region in physical address space that way and can decide what to (un)map into that memory device region container, you do your own placement.
> 
> So when instructed to add a new memory backend, you simply assign an address in the assigned region yourself, and map the memory backend memory region into the device memory region container.
> 
> The only catch is that that memory device (hv-balloon) will then consume multiple memslots (one for each memory backend), right now we only support 1 memslot (e.g., asking if one more slot is free when plugging the device).
> 
> 
Technically in this case a "main" hv-balloon device is still needed -
in contrast with virtio-mem (which allows multiple instances) there can
be only one Dynamic Memory protocol provider on the VMBus.

That means these "container" sub-devices would need to register with that
main hv-balloon device.

However, I'm not sure what is exactly gained by this approach.

These sub-devices still need to implement the TYPE_MEMORY_DEVICE interface
so they are accounted for properly (the alternative would be to patch
the relevant QEMU code all over the place - that's probably why
virtio-mem also implements this interface instead).

One still needs some QMP command to add a raw memory backend to
the chosen "container" hv-balloon sub-device.

Since now the QEMU manager (user) is aware of the presence of these
"container" sub-devices, and has to manage them, changing the QEMU
interface in the future is more complex (as you said in [1]).

I understand that virtio-mem uses a similar approach, however that's
because the virtio-mem protocol itself works that way.

> I'm adding support for that right now to implement a virtio-mem
> extension -- the memory device says how many memslots it requires,
> and these will get reserved for that memory device; the memory device
> can then consume them later without further checks dynamically. That
> approach could be extended to increase/decrease the memslot
> requirement (the device would ask to increase/decrease its limit),
> if ever required.

In terms of future virtio-mem things I'm also eagerly waiting for an
ability to set a removed virtio-mem block read-only (or not covered by
any memslot) - this most probably could be reused later for implementing
the same functionality in this driver.

Thanks,
Maciej

[1]: https://lore.kernel.org/qemu-devel/28ab7005-c31c-239e-4659-e5287f4c5468@redhat.com/


