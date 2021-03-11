Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8BA337F47
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 21:52:52 +0100 (CET)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKSId-0006Z7-Fs
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 15:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKSGj-0005h5-Ag; Thu, 11 Mar 2021 15:50:53 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:36912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKSGf-0004Aq-Gu; Thu, 11 Mar 2021 15:50:53 -0500
Received: by mail-qk1-x732.google.com with SMTP id s7so22139689qkg.4;
 Thu, 11 Mar 2021 12:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rqmy5YMopHmFtsNqSyrjaLSHDrPvCVW8jnYNkQ3JpR8=;
 b=Hqwqjae1kFztLUU5yzSOu1zGw2u21gZwl9ouxeQOqF7j6In60qdCeruuTRzbrXNx9y
 S4xKEfgoWwRTn0jPJxojEPPTD23CPC/oj0cZAN9hCFmhO1rPMmJvz6D3nA/aY5vuCCr2
 yiE9DwGxwsdoQDCXCTT9i1IwL95czzXsXs49FclhSoJ6tJ6pwCFdnaVAnY56Vqe7Lila
 fH9taBx8g7NQDCCao/AmFseJuAB1/Z+yI1MgPSGqkNEZrk/VVFDjrXIDeteNTKQza6NN
 2D8XeyXn7xjBI7yEHhRZUtn+DpakWfOZV248z1Mz1LUstsnUjG/gTl7kmfFHaoQAGILg
 oRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rqmy5YMopHmFtsNqSyrjaLSHDrPvCVW8jnYNkQ3JpR8=;
 b=k6Sfrm5v3DuGdYXSS4aP/8n8JNAvjop+76zcyfsVgrdQqDXCBqqT+mEayfHpNeEmfN
 9mXly3dF+CW1JIFo5ZW/UwKB/C24q+2r2HP40TqRja4/fh85sIEthjSnuMXVSM7fvXdI
 2TD9YjNhLG+HNIZmUEvYOc1RZrgs8mh1JQAwOlgEynLdzHn1vvjvV0Ec74m0CKnE14+8
 UIw6qZfo7iDUcs4WMJK8QqIkXDikgykMB87mfP9kGGkhq7+P7VXnZFM4ZyG5BwyTf24k
 4cUPxGst6y3dgWzKE4q2qGsiskWGIawwkLpwVlG25ax1rF+LV439UhiWIdzQrH6zUAKc
 SWcA==
X-Gm-Message-State: AOAM533q2zv1tlTCa1dx8EfBX3sPBHLLoY/EHNqWk1yjPmo3NwweLi6b
 +ajReKCCQcgljh6nMFZ4zY8=
X-Google-Smtp-Source: ABdhPJxCEingiml6dyjTq2b09khvKVAFqI3ZarmHk9etdxXzPx5M7z4vvNyt/vo9zzYLda4BGFTR9w==
X-Received: by 2002:a37:8703:: with SMTP id j3mr9324654qkd.308.1615495847160; 
 Thu, 11 Mar 2021 12:50:47 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:cc80:21a:fa87:b9b8:5376?
 ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id k24sm2577059qtu.35.2021.03.11.12.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 12:50:46 -0800 (PST)
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
To: Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box> <87mtvczvzw.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
Date: Thu, 11 Mar 2021 17:50:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87mtvczvzw.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/9/21 3:22 AM, Markus Armbruster wrote:
> Cc: Paolo and Julia in addition to Igor, because the thread is wandering
> towards DeviceState member pending_deleted_event.
> 
> Cc: Laine for libvirt expertise.  Laine, if you're not the right person,
> please loop in the right person.
> 
> David Gibson <david@gibson.dropbear.id.au> writes:
> 
>> On Mon, Mar 08, 2021 at 03:01:53PM -0300, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 3/8/21 2:04 PM, Markus Armbruster wrote:
>>>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>>>
>>>>> On 3/6/21 3:57 AM, Markus Armbruster wrote:
> [...]
>>>>>> We should document the event's reliability.  Are there unplug operations
>>>>>> where we can't detect failure?  Are there unplug operations where we
>>>>>> could, but haven't implemented the event?
>>>>>
>>>>> The current version of the PowerPC spec that the pseries machine implements
>>>>> (LOPAR) does not predict a way for the virtual machine to report a hotunplug
>>>>> error back to the hypervisor. If something fails, the hypervisor is left
>>>>> in the dark.
>>>>>
>>>>> What happened in the 6.0.0 dev cycle is that we faced a reliable way of
>>>>
>>>> Do you mean "unreliable way"?
>>>
>>> I guess a better word would be 'reproducible', as in we discovered a reproducible
>>> way of getting the guest kernel to refuse the CPU hotunplug.
>>
>> Right.  It's worth noting here that in the PAPR model, there are no
>> "forced" unplugs.  Unplugs always consist of a request to the guest,
>> which is then resposible for offlining the device and signalling back
>> to the hypervisor that it's done with it.
>>
>>>>> making CPU hotunplug fail in the guest (trying to hotunplug the last online
>>>>> CPU) and the pseries machine was unprepared for dealing with it. We ended up
>>>>> implementing a hotunplug timeout and, if the timeout kicks in, we're assuming
>>>>> that the CPU hotunplug failed in the guest. This is the first scenario we have
>>>>> today where we want to send a QAPI event informing the CPU hotunplug error,
>>>>> but this event does not exist in QEMU ATM.
>>>>
>>>> When the timeout kicks in, how can you know the operation failed?  You
>>>> better be sure when you send an error event.  In other words: what
>>>> prevents the scenario where the operation is much slower than you
>>>> expect, the timeout expires, the error event is sent, and then the
>>>> operation completes successfully?
>>>
>>> A CPU hotunplug in a pseries guest takes no more than a couple of seconds, even
>>> if the guest is under heavy load. The timeout is set to 15 seconds.
>>
>> Right.  We're well aware that a timeout is an ugly hack, since it's
>> not really possible to distinguish it from a guest that's just being
>> really slow.
> 
> As long as unplug failure cannot be detected reliably, we need a timeout
> *somewhere*.  I vaguely recall libvirt has one.  Laine?

Yeah, Libvirt has a timeout for hotunplug operations. I agree that QEMU doing
the timeout makes more sense since it has more information about the
conditions/mechanics involved.

At this moment, the only case I know of hotunplug operations timing out in
QEMU is what we did with CPU hotunplug in pseries though. I can't tell if
unplug timeout is desirable mechanism for other machines/device types.

> 
> Putting the timeout in QEMU might be better.  QEMU might be in a better
> position to pick a suitable timeout.
> 
>> It was the best thing we could come up with in the short term though.
>> Without the changes we're suggesting here, the guest can positively
>> assert the unplug is complete, but it has no way to signal failure.
>> So, without a timeout qemu is stuck waiting indefinitely (or at least
>> until the next machine reset) on the guest for an unplug that might
>> never complete.
>>
>> It's particularly nasty if the guest does really fail the hotplug
>> internally, but then conditions change so that the same unplug could
>> now succeed.  The unplug request is just a message - there's no guest
>> visible persistent state saying we want the device unplugged, so if
>> conditions change the guest won't then re-attempt the unplug.
>> Meanwhile the user can't re-attempt the device_del, because on the
>> qemu side it's still stuck in a pending unplug waiting on the guest.
> 
> "Can't re-attempt" feels like a bug.  Let me explain.


So, what David mentioned above is related to pseries internals I believe.

Up to 5.2.0 the pseries machine were silently ignoring all 'device_del'
issued for devices that were in the middle of the unplug process, with the
exception of DIMMs where we bothered to throw an error message back to the
user.

In 6.0.0 the code was reworked, and now we're always letting the user know
when the 'device_del' was ignored due to an ongoing hotunplug of the device.
And for CPUs we also tell the timeout remaining. We're still not sending
multiple hotunplug IRQ pulses to the guest, but at least the user is now
informed about it.

As for the commit mentioned below:

> 
> Depending on the device, device_del can complete the unplug, or merely
> initiate it.  Documentation:
> 
> # Notes: When this command completes, the device may not be removed from the
> #        guest.  Hot removal is an operation that requires guest cooperation.
> #        This command merely requests that the guest begin the hot removal
> #        process.  Completion of the device removal process is signaled with a
> #        DEVICE_DELETED event. Guest reset will automatically complete removal
> #        for all devices.
> 
> This is not as accurate as it could be.  Behavior depends on the device.
> 
> For some kinds of devices, the command completes the unplug before it
> sends its reply.  Example: USB devices.  Fine print: the DEVICE_DELETED
> event gets send with a slight delay because device cleanup uses RCU.
> 
> For others, notably PCI devices, the command only pokes the guest to do
> its bit.  QEMU reacts to the guest's actions, which eventually leads to
> the actual unplug.  DEVICE_DELETED gets sent then.  If the guest doesn't
> play ball to the end, the event doesn't get send.
> 
> The "can't retry unplug" behavior is new.  Another device_del used to
> simply poke the guest again.  I think this regressed in commit
> cce8944cc9 "qdev-monitor: Forbid repeated device_del", 2020-02-25.
> Feels like a must-fix for 6.0.


This doesn't directly affect pseries code because we're not using
dev->pending_deleted_event to track the pending unplug status. We're
using an internal flag that is related to the DRC (the 'hotplug state'
of the device).

The commit seems a bit odd because it is making a change in the common code
inside qmp_device_del() based on a PCI-e specific behavior. In the end this
doesn't impact any other device but PCI-e (it is the only device that uses
dev->pending_deleted_event to mark the start and finish of the unplug process),
but it's not something that I might expect in that function.

IMO this verification should be removed from qmp_device_del and moved to
pcie_cap_slot_unplug_request_cb(). This would fix the problem for PCIe devices
without making assumptions about everything else.


> 
>> As we're discussing we think we have a better way, but it relies on
>> guest changes, so we can't assume we already have that on the qemu
>> side.
>>
>>> I'm aware that there's always that special use case, that we haven't seen yet,
>>> where this assumption is no longer valid. The plan is to change the spec and the
>>> guest kernel to signal the CPU hotunplug error back to QEMU before the dragon
>>> lands. For now, timing out the CPU hotunplug process when we're almost certain
>>> (but not 100%) that it failed in the guest is the best can do.
>>>
>>> For both cases I want to use DEVICE_UNPLUG_ERROR right from the start, avoiding
>>> guest visible changes when we change how we're detecting the unplug errors.
>>>
>>>>> The second scenario is a memory hotunplug error. I found out that the pseries
>>>>> guest kernel does a reconfiguration step when re-attaching the DIMM right
>>>>> after refusing the hotunplug, and this reconfiguration is visible to QEMU.
>>>>> I proceeded to make the pseries machine detect this error case, rollback the
>>>>> unplug operation and fire up the MEM_UNPLUG_ERROR. This case is already covered
>>>>> by QAPI, but if we add a DEVICE_UNPLUG_ERROR event I would use it in this case as
>>>>> well instead of the MEM specific one.
>>>>>
>>>>> This investigation and work in the mem hotunplug error path triggered a
>>>>> discussion in qemu-ppc, where we're considering whether we should do the same
>>>>> signalling the kernel does for the DIMM hotunplug error for all other device
>>>>> hotunplug errors, given that the reconfiguration per se is not forbidden by LOPAR
>>>>> and it's currently a no-op. We would make a LOPAR spec change to make this an
>>>>> official hotunplug error report mechanism, and all pseries hotunplug operations,
>>>>> for all devices, would report DEVICE_UNPLUG_ERROR QAPI events in the error path.
>>>>>
>>>>> Granted, the spec change + Kernel change is not something that we will be able
>>>>> to nail down in the 6.0.0 cycle, but having the DEVICE_UNPLUG_ERROR QAPI event
>>>>> already in place would make it easier for the future as well.
>>>>>
>>>>>
>>>>> I have a doc draft of these changes/infos that I forgot to post. I would post
>>>>> it as docs/system/ppc-spapr-hotunplug-notes.rst. I can add the QAPI events
>>>>> information there as well. Does that work for you as far as documentation
>>>>> goes?
>>>>
>>>> A DEVICE_UNPLUG_ERROR event makes perfect sense regardless of machine
>>>> and device.
>>
>> Ack.  Fwiw, I don't think this can ever be more than a "best effort"
>> notification.  Even with a machine and OS that should support it, a
>> guest bug or hang could mean that it never acks *or* nacks an unplug
>> request.
> 
> Since the success event is named DEVICE_DELETED, I'd name the
> probably-failed event DEVICE_NOT_DELETED.  Bonus: can read it as a
> statement of fact "still not deleted" instead of an error (that just
> might not be one).


"DEVICE_NOT_DELETED" sounds way better for what we want to express in the
pseries case when we can't be 100% sure of a guest side error. However,
there is at least one case where I'm sure of a guest side error (where I'm
using MEM_UNPLUG_ERROR), so DEVICE_UNPLUG_ERROR seems fitting in that case.


Should we add both DEVICE_NOT_DELETED and DEVICE_UNPLUG_ERROR then? I can use
both in pseries-6.0.0.




Thanks,


DHB


> 
>>>> I'm not asking you to to implement it for all machines and devices.  But
>>>> I want its design to support growth towards that goal, and its
>>>> documentation reflect its current state.
>>>>
>>>> In particular, the doc comment in the QAPI schema should list the
>>>> limitation.  If the event is only implemented for LOPAR for now, say so.
>>>> If it's only implemented for certain devices, say so.
>>>>
>>>> Questions?
>>>
>>>
>>> Nope. Thanks for the pointers. I'll add the DEVICE_UNPLUG_ERROR QAPI event
>>> in a way that it can be used by other machines in the future, and documenting
>>> where the event is being used ATM.
>>>
>>>
>>> Thanks,
>>>
>>>
>>> DHB
>>>
>>>
>>>>
>>>
> 

