Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C3C2FB642
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:14:20 +0100 (CET)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qpv-0004fH-B9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1qnC-0003k8-2x; Tue, 19 Jan 2021 08:11:32 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:36548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1qn8-0007O6-5e; Tue, 19 Jan 2021 08:11:29 -0500
Received: by mail-qk1-x736.google.com with SMTP id 186so21696121qkj.3;
 Tue, 19 Jan 2021 05:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SMGsn2nHMW0CpS4/VmcvAdM/Yc/88LCeQ9EsHE1soMs=;
 b=rTTZajOB7pVIfXMvjhn/1XPzA0X+zfg6vuikdQxvut5aqiFX46kqJx/GmPewbhi/qf
 f5k6esGtTJfsbN7pU1btUhlbq+6z/0GnOc6bDE5ONZzjtsH/poj92IXuWecB1tox3Kab
 Nuh9Hqy5NzEnylNF1Pyzg7uFqZNME8exeb8JKrlextl8b/Zl2X4y/DWHKINyGejGmCxP
 8KACIO2kq37ZasESz0PNJlHIAFE3mSoarVtG1Uz+H7TXj38JwGxJlFma6YYeXUFCNzZA
 KmEtSbf6EBlVk411w2vXhbSGWHI2D14s5NrVmHfuLIf4PZ2TWBMQC/dgbpxQR1fxH/xo
 2z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SMGsn2nHMW0CpS4/VmcvAdM/Yc/88LCeQ9EsHE1soMs=;
 b=k/TETOObVHBVpAWZWjUi3jtVKZo8dCHixHWI2uFg1f9K7e6c0STkRsl2tvDseFkJi9
 s3FjelV/B0d12MMMdHHmAm6j+zMfUaXmycIU3RgJR6jdX48hF9mnLUNR6O1OKKl/KaOm
 HugGu9ffNaz5xueyHOiOe1QS4IbdXPtGX7MnfrzePE8VhJlsTAWoFtTG3w1VC/M/drEb
 Wy3XM9NEEHi4nZPpZoh2/t+m2zdAl+tRojWDXvnSFppOEA+xSz/0FxSZpBU4e1+UhA79
 DehaIUsHV0kqR64q7JRqnvlIOZCAmYYyxnopoXvr/GuM/R8ovpH3rZ5sH72n5gYtrEcV
 /aBA==
X-Gm-Message-State: AOAM532N1KnrJ3ycX/9iT3Tbkp7MWf4d8GlAUtaVG8wa8UAxA9Y0efmN
 f9AJLRNkc0Te2Q2x+135ldA=
X-Google-Smtp-Source: ABdhPJykM3vng2ObKwhE+4Df/CvZzCA/TVdRfdDfgsaqe7A5RGQi1IXF6brxpJvB47D3dC+NvjLNkQ==
X-Received: by 2002:a37:8fc3:: with SMTP id r186mr4255678qkd.253.1611061883627; 
 Tue, 19 Jan 2021 05:11:23 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:a75a:cb34:ba60:6de6:be1d?
 ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id i27sm12636676qkk.15.2021.01.19.05.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:11:23 -0800 (PST)
Subject: Re: [PATCH v2 1/1] spapr.c: always pulse guest IRQ in
 spapr_core_unplug_request()
To: Greg Kurz <groug@kaod.org>
References: <20210118193035.2089474-1-danielhb413@gmail.com>
 <20210118193035.2089474-2-danielhb413@gmail.com>
 <20210119105049.66a6a580@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <a3e54c65-817d-57ef-4b63-36394ef22d70@gmail.com>
Date: Tue, 19 Jan 2021 10:11:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119105049.66a6a580@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
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
Cc: Xujun Ma <xuma@redhat.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/19/21 6:50 AM, Greg Kurz wrote:
> On Mon, 18 Jan 2021 16:30:35 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> Commit 47c8c915b162 fixed a problem where multiple spapr_drc_detach()
>> requests were breaking QEMU. The solution was to just spapr_drc_detach()
>> once, and use spapr_drc_unplug_requested() to filter whether we
>> already detached it or not. The commit also tied the hotplug request
>> to the guest in the same condition.
>>
>> Turns out that there is a reliable way for a CPU hotunplug to fail. If
>> a guest with one CPU hotplugs a CPU1, then offline CPU0s via
>> 'echo 0 > /sys/devices/system/cpu/cpu0/online', then attempts to
>> hotunplug CPU1, the kernel will refuse it because it's the last online
>> CPU of the system. Given that we're pulsing the IRQ only in the first try,
>> in a failed attempt, all other CPU1 hotunplug attempts will fail, regardless
>> of the online state of CPU1 in the kernel, because we're simply not letting
>> the guest know that we want to hotunplug the device.
>>
>> Let's move spapr_hotplug_req_remove_by_index() back out of the
>> "if (!spapr_drc_unplug_requested(drc))" conditional, allowing for multiple
>> 'device_del' requests to the same CPU core to reach the guest, in case
>> the CPU core didn't fully hotunplugged previously. Granted, this is not
>> optimal because this can allow for multiple hotplug events queueing in the
>> guest, like it was already possible before 47c8c915b162.
>>
>> Other possible alternatives would be:
>>
>> - check if the given CPU is the last online CPU in the guest before attempting
>> to hotunplug. This can be done by checking 'cs->halted' and msr states of
>> the core. Problem is, this approach will fail if the guest offlines/onlines
>> a CPU while we're in the middle of the unplug request, given that we can't
>> control whether the CPU core states will change in the kernel. This option
>> sure makes it harder to allow a hotunplug failure to happen, but will never
>> be enough to fully avoid it;
>>
>> - let the user handled it. In this case, we would advise the user to reboot the
>> guest and the CPU will be removed during machine reset.
>>
> 
> This is actually the only viable option since there's no way for the guest to
> report an unplug request failure to QEMU. And this isn't specific to CPUs, eg.
> Linux can also block unplug requests for DIMM devices if some LMB doesn't belong
> to ZONE_MOVABLE. The solution for this is to tell linux to always put hot-plugged
> memory in ZONE_MOVABLE.

Indeed, the lack of a 'not going to comply with this unplug request' logic in
PAPR is the source of a lot of bugs and code in QEMU. As I said to you offline,
I had an old idea of proposing a PAPR change to add this mechanic, and then
QEMU can be aware of unplug requests that are denied by the kernel right before
all the DRC state transition occurs. This will demand some changes, but the net
result is more predictability in all unplug operations.

Note that the new LMB DT attribte doesn't fix the problems for DRCs. It just makes
it harder to occur. There's nothing holding the kernel back from refusing LMB unplug
requests in stress conditions (e.g. a stress-ng workload overloading all the RAM).

> 
> Could something similar be done for CPUs ? For example, forbidding the off-lining
> of CPU0 at the linux level : this would ensure all cores, except the one that has
> CPU0, are always hot-unpluggable.

I don't think so. LMBs has a strong case for that extra DT flag because the OS can
expand the kernel space to the hotplugged DIMMs and so on. As you said in the v1
review, PAPR already mentions that offlining all VCPUs should just terminate the
partition, so why do we need a flag to forbid CPU offlining?

We're dealing with a kernel restriction (always need an online CPU) that PAPR doesn't
predicts in the spec. Not only that, but it's also a dynamic restriction. The OS can
deny hotunplug of any of the available CPUs, as long as it is the last online. This
puts QEMU into this weird spot we are now: we can't guarantee that the vcpu state
will remain in the guest during the unplug request.

x86 for instance forbids offlining CPU0. I'm not sure if it's an ACPI restriction or
kernel design choice. But this would fix the issue we're having here. Of all the
available choices for a fix, patching the pseries kernel to forbid offlining CPU0
looks a very sane one in my estimation.


> 
>> None of the alternatives are clear winnners, so this patch goes for the approach
>> makes the IRQ queue of the guest prone to multiple hotunplug requests for the
>> same CPU, but at least the user can successfully hotunplug the CPU after a failed
>> attempt, without the need of guest reboot.
>>
>> Reported-by: Xujun Ma <xuma@redhat.com>
>> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1911414
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index e9e3816cd3..e2f12ce413 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -3737,8 +3737,17 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
>>   
>>       if (!spapr_drc_unplug_requested(drc)) {
>>           spapr_drc_detach(drc);
>> -        spapr_hotplug_req_remove_by_index(drc);
>>       }
>> +
>> +    /*
>> +     * spapr_hotplug_req_remove_by_index is left unguarded, out of the
>> +     * "!spapr_drc_unplug_requested" check, to allow for multiple IRQ
>> +     * pulses removing the same CPU core. Otherwise, in an failed hotunplug
>> +     * attempt (e.g. the kernel will refuse to remove the last online CPU
>> +     * core), we will never attempt it again because unplug_requested will
>> +     * still be 'true' in that case.
>> +     */
>> +    spapr_hotplug_req_remove_by_index(drc);
> 
> This not only fire the IRQ again, it also enqueues a new event... have
> you tried hammering QEMU with CPU hot-plug/unplug requests. I seem to
> remember that the troubles fixed by 47c8c915b162 had more to do with
> the DRC state machine than the hot-plug event itself, but posting the
> same event several times during a regular hot-unplug sequence could
> maybe cause subtle bugs as well.

I tried hammering the guest with lots of IRQ events. Aside from the dmesg
flood in the guest kernel everything went fine. No guest breakage of any
sort.

It is also worth noticing that the unplug_request code is protected by
BQL. It is not possible to spam the guest queue out of control.

> 
> Honestly, this is still a band-aid : it doesn't fix anything, it just
> gives an alternative solution to reboot when someone has done something
> silly. I'd rather not loosen our sanity checks for such a corner case.

It doesn't fix indeed. But documenting that the user shouldn't offline CPU0
in the kernel because QEMU can't handle unplug properly isn't fixing anything
either.

Thing is, our spapr code is too optimistic, and not justifiable in my opinion,
in all unplug code for all devices. It assumes that everything will go as
intended, but in reality we're hoping it will work. Otherwise, we're going to
ask the user to reboot the guest so the unplug can happen in CAS.

This change I'm making makes the CPU unplug code way more pessimistic, and it
can open a way for device_del abuse via an IRQ spam. But in the end it will
alleviate he situation not only of this particular bug, but all "insert a random
reason why the kernel denied a CPU hotunplug, and now I can't unplug the
CPU anymore" bugs in the future as well. It gives the user the choice to try
again if something didn't go as planned. As far as I'm concerned, we should
fire up spapr_hotplug_req_remove_by_index() from all unplug_request() calls
of all devices regardless of unplug_request being true or not.

And if we're concerned about abuse of device_del spam, we can document that
device_del can't be spammed in a 'unplug until it works' fashion. I'd rather
advice the user to use device_del properly than to tell the user "if you offline
CPUs and enter this situation, you'll need to reboot the guest".

> 
> On the other side, the at-least-one-cpu thing is a linux limitation.
> It seems fair that linux should provide a way to mitigate the effects.
> Like suggested above, this could be the ability to elect an individual
> vCPU to be always on-line. Since QEMU refuses the hotplug of the boot
> core, QEMU could maybe tell the guest to elect CPU0 through some
> flag in the DT, like we've done recently for LMBs.


As I said above, I think that patching the kernel to avoid CPU0 offlining looks
like a viable idea.


I still believe that this patch should go through regardless though. I'm convinced
that we can't be optimistic about the CPU unplug process as a whole, and advising
the user to not spam the guest IRQ is a better option than documenting that we
need to reset the machine to handle the unplug, because the user did something
that the kernel fully allows, but we can't deal with and won't even allow further
attempts at it. I mean, what are we? Windows?



Thanks,


DHB




> 
>>   }
>>   
>>   int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
> 

