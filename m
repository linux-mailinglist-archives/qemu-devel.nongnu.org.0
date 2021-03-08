Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF843316D0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:57:08 +0100 (CET)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJL3z-0003U2-SF
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lJKCh-0006ik-Sq; Mon, 08 Mar 2021 13:02:03 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:43400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lJKCf-0002df-Lu; Mon, 08 Mar 2021 13:02:03 -0500
Received: by mail-qt1-x82c.google.com with SMTP id l14so5418758qtr.10;
 Mon, 08 Mar 2021 10:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/r7Cn0PhijXud09hBtuV4XyxS1AJNXD0kOldlmgiZKA=;
 b=tiijS20+SUyfvIMEiEy0iUWd0ErpNg3lX0f7r/O0VG+UEGrRS92TMUT6pxfyXibxGX
 C/g7RvKuWMZ2KUHlXakvXBJ1hy/PRjg0cwVBvEDw44g2E8BV1zAtGa2P4YKYccsXmqMm
 xTXWehNKrCnBMsBicnq95BjX3IsP+8gWGEnZMw5DX2Cst20p352seoAhJ0JoW/uViopo
 pS/1WlgHRf61lc9t8p3gtJUqOswhnjQwl4ZFBw6qYcC9HW86LJ/WFcq4Kujb390oyH0v
 +afHe5w//ykfI7bGbXpBkERtWdYur1KY+fd7iHBh0yl0x20koqYxfJF6lTKYue5jjmE1
 DFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/r7Cn0PhijXud09hBtuV4XyxS1AJNXD0kOldlmgiZKA=;
 b=ICm11jOlzPRLZKuKUihrv6pPhnOlQO4wcHcjsdYm6L4Amcgp1K/9s5N0+2E7gVUtZv
 8oVnUlSPxXWS2wmoaUJuP/XEFNN+J+nmqHxpU+y6wGSKDYGeNk4954W14g15MsW2PHI8
 MZY92FEOdKmEl6PUWrJRqYS5PO6eqclUWT4VAwZBlZnyeQ+VfI8NF0yd5ufNsGZ2VbOf
 PwsgB6+JeY4h775tyv7CeGbzwm/uVOi0XqV3ID9v7WthpgjQJI1WRKgz1DsZJCq/mhDH
 BT1K5Q1mkY7Lbcc1JgDEiuonmeHptYugRDEBkdi0W6bJjqT2kdD+L610orj2/8HRS+FY
 XqxQ==
X-Gm-Message-State: AOAM530nZF/v/6lGrhy4LWylCJ5YYFPX3BrhezAhibwvqxK/dx6MOQ5R
 H2BTY63O/9jJw2stwPCzjbw=
X-Google-Smtp-Source: ABdhPJyIYbZxdKNeeX1W3jYcbRRlfWbNi51e9D60XBOYtzTbZRDWczuEZox4rzSeTeeU4WCBp4tE5A==
X-Received: by 2002:ac8:5b8d:: with SMTP id a13mr21112546qta.240.1615226517834; 
 Mon, 08 Mar 2021 10:01:57 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:1670:7849:4614:f4b6:4112?
 ([2804:431:c7c7:1670:7849:4614:f4b6:4112])
 by smtp.gmail.com with ESMTPSA id 75sm1291145qkj.134.2021.03.08.10.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 10:01:57 -0800 (PST)
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
To: Markus Armbruster <armbru@redhat.com>
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
Date: Mon, 8 Mar 2021 15:01:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87blbt60hc.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/8/21 2:04 PM, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> On 3/6/21 3:57 AM, Markus Armbruster wrote:
>>> Cc: ACPI maintainers for additional expertise.
>>>
>>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>>
>>>> Hi,
>>>>
>>>> Recent changes in pseries code (not yet pushed, available at David's
>>>> ppc-for-6.0) are using the QAPI event MEM_UNPLUG_ERROR to report memory
>>>> hotunplug errors in the pseries machine.
>>>>
>>>> The pseries machine is also using a timeout to cancel CPU hotunplugs that
>>>> takes too long to finish (in which we're assuming a guest side error) and
>>>> it would be desirable to also send a QAPI event for this case as well.
>>>>
>>>> At this moment, there is no "CPU_UNPLUG_ERROR" in QAPI (guess ACPI doesn't
>>>> need it).
>>>
>>> I see two interpretations of "ACPI doesn't need":
>>>
>>> 1. Unplug can't fail, or QEMU can't detect failure.  Michael, Igor?
>>>
>>> 2. Management applications haven't needed to know badly enough to
>>> implement an event.
>>>
>>>>             Before sending patches to implement this new event I had a talk
>>>> with David Gibson and he suggested that, instead of adding a new CPU_UNPLUG_ERROR
>>>> event, we could add a generic event (e.g. DEVICE_UNPLUG_ERROR) that can be
>>>> used by the pseries machine in both error scenarios (MEM and CPU).
>>>
>>> Good point.  One general event is better than two special ones that
>>> could easily grow siblings.
>>>
>>>> This could also be used by x86 as well, although I believe the use of
>>>> MEM_UNPLUG_ERROR would need to be kept for awhile to avoid breaking ABI.
>>>
>>> Yes.  Our rules for interface deprecation apply.
>>>
>>>> Any suggestions/comments?
>>>
>>> We should document the event's reliability.  Are there unplug operations
>>> where we can't detect failure?  Are there unplug operations where we
>>> could, but haven't implemented the event?
>>
>> The current version of the PowerPC spec that the pseries machine implements
>> (LOPAR) does not predict a way for the virtual machine to report a hotunplug
>> error back to the hypervisor. If something fails, the hypervisor is left
>> in the dark.
>>
>> What happened in the 6.0.0 dev cycle is that we faced a reliable way of
> 
> Do you mean "unreliable way"?

I guess a better word would be 'reproducible', as in we discovered a reproducible
way of getting the guest kernel to refuse the CPU hotunplug.

> 
>> making CPU hotunplug fail in the guest (trying to hotunplug the last online
>> CPU) and the pseries machine was unprepared for dealing with it. We ended up
>> implementing a hotunplug timeout and, if the timeout kicks in, we're assuming
>> that the CPU hotunplug failed in the guest. This is the first scenario we have
>> today where we want to send a QAPI event informing the CPU hotunplug error,
>> but this event does not exist in QEMU ATM.
> 
> When the timeout kicks in, how can you know the operation failed?  You
> better be sure when you send an error event.  In other words: what
> prevents the scenario where the operation is much slower than you
> expect, the timeout expires, the error event is sent, and then the
> operation completes successfully?

A CPU hotunplug in a pseries guest takes no more than a couple of seconds, even
if the guest is under heavy load. The timeout is set to 15 seconds.

I'm aware that there's always that special use case, that we haven't seen yet,
where this assumption is no longer valid. The plan is to change the spec and the
guest kernel to signal the CPU hotunplug error back to QEMU before the dragon
lands. For now, timing out the CPU hotunplug process when we're almost certain
(but not 100%) that it failed in the guest is the best can do.

For both cases I want to use DEVICE_UNPLUG_ERROR right from the start, avoiding
guest visible changes when we change how we're detecting the unplug errors.

> 
>> The second scenario is a memory hotunplug error. I found out that the pseries
>> guest kernel does a reconfiguration step when re-attaching the DIMM right
>> after refusing the hotunplug, and this reconfiguration is visible to QEMU.
>> I proceeded to make the pseries machine detect this error case, rollback the
>> unplug operation and fire up the MEM_UNPLUG_ERROR. This case is already covered
>> by QAPI, but if we add a DEVICE_UNPLUG_ERROR event I would use it in this case as
>> well instead of the MEM specific one.
>>
>> This investigation and work in the mem hotunplug error path triggered a
>> discussion in qemu-ppc, where we're considering whether we should do the same
>> signalling the kernel does for the DIMM hotunplug error for all other device
>> hotunplug errors, given that the reconfiguration per se is not forbidden by LOPAR
>> and it's currently a no-op. We would make a LOPAR spec change to make this an
>> official hotunplug error report mechanism, and all pseries hotunplug operations,
>> for all devices, would report DEVICE_UNPLUG_ERROR QAPI events in the error path.
>>
>> Granted, the spec change + Kernel change is not something that we will be able
>> to nail down in the 6.0.0 cycle, but having the DEVICE_UNPLUG_ERROR QAPI event
>> already in place would make it easier for the future as well.
>>
>>
>> I have a doc draft of these changes/infos that I forgot to post. I would post
>> it as docs/system/ppc-spapr-hotunplug-notes.rst. I can add the QAPI events
>> information there as well. Does that work for you as far as documentation
>> goes?
> 
> A DEVICE_UNPLUG_ERROR event makes perfect sense regardless of machine
> and device.
> 
> I'm not asking you to to implement it for all machines and devices.  But
> I want its design to support growth towards that goal, and its
> documentation reflect its current state.
> 
> In particular, the doc comment in the QAPI schema should list the
> limitation.  If the event is only implemented for LOPAR for now, say so.
> If it's only implemented for certain devices, say so.
> 
> Questions?


Nope. Thanks for the pointers. I'll add the DEVICE_UNPLUG_ERROR QAPI event
in a way that it can be used by other machines in the future, and documenting
where the event is being used ATM.


Thanks,


DHB


> 

