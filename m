Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CC3C210F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 10:52:44 +0200 (CEST)
Received: from localhost ([::1]:38538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mFX-0006Xx-F8
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 04:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m1mEN-0005Em-6J; Fri, 09 Jul 2021 04:51:31 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:49584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m1mEK-0003iZ-Vz; Fri, 09 Jul 2021 04:51:30 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 229862027B;
 Fri,  9 Jul 2021 08:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625820686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzRe7B/SfBinnpSxqYpQeUyDs6i5sKrQsF7ieBHb2nU=;
 b=bPDXfc1KnTXqUtAcTWMVS8lPaVQJE6j583l/sCRQYTJcx1bkSgjnIwckYVupAIOqC1Thgu
 UZDmxMyt5J4+G4nhxCgegnbzdYJ0g7vko8aUw1LoNmwDIrPFWVA+N95fpLOBf+8rcJGTqt
 t0gLj9gBb6NSN78DaVQS5XPh7Ym7z1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625820686;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzRe7B/SfBinnpSxqYpQeUyDs6i5sKrQsF7ieBHb2nU=;
 b=zgAjeX1GDLfdDa3HhdYILHrhQH3G7rSLcdfjnRS4iB6iQkCxoQGAv60H57c+XdDuTcoQYo
 9P9t5yAOLzZBF2Ag==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EB3AD133D1;
 Fri,  9 Jul 2021 08:51:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id wPSeOA0O6GCmFwAAGKfGzw
 (envelope-from <hare@suse.de>); Fri, 09 Jul 2021 08:51:25 +0000
Subject: Re: [PATCH v2 0/4] hw/nvme: fix controller hotplugging
To: Klaus Jensen <its@irrelevant.dk>
References: <20210707154936.200166-1-its@irrelevant.dk>
 <YOfnDBwya58drDZk@apples.localdomain>
 <4366b9c6-8b8a-a682-9213-740c3088f1b1@suse.de>
 <YOfy/tt/5jgi48uU@apples.localdomain>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <770d94fe-305c-e38f-8c5a-c4bd41d6e84f@suse.de>
Date: Fri, 9 Jul 2021 10:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOfy/tt/5jgi48uU@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 8:55 AM, Klaus Jensen wrote:
> On Jul  9 08:16, Hannes Reinecke wrote:
>> On 7/9/21 8:05 AM, Klaus Jensen wrote:
>>> On Jul  7 17:49, Klaus Jensen wrote:
>>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>>
>>>> Back in May, Hannes posted a fix[1] to re-enable NVMe PCI hotplug. We
>>>> discussed a bit back and fourth and I mentioned that the core issue was
>>>> an artifact of the parent/child relationship stemming from the qdev
>>>> setup we have with namespaces attaching to controller through a qdev
>>>> bus.
>>>>
>>>> The gist of this series is the fourth patch "hw/nvme: fix controller 
>>>> hot
>>>> unplugging" which basically causes namespaces to be reassigned to a bus
>>>> owned by the subsystem if the parent controller is linked to one. This
>>>> fixes `device_del/add nvme` in such settings.
>>>>
>>>> Note, that in the case that there is no subsystem involved, nvme 
>>>> devices
>>>> can be removed from the system with `device_del`, but this *will* cause
>>>> the namespaces to be removed as well since there is no place (i.e. no
>>>> subsystem) for them to "linger". And since this series does not add
>>>> support for hotplugging nvme-ns devices, while an nvme device can be
>>>> readded, no namespaces can. Support for hotplugging nvme-ns devices is
>>>> present in [1], but I'd rather not add that since I think '-device
>>>> nvme-ns' is already a bad design choice.
>>>>
>>>> Now, I do realize that it is not "pretty" to explicitly change the
>>>> parent bus, so I do have a an RFC patch in queue that replaces the
>>>> subsystem and namespace devices with objects, but keeps -device shims
>>>> available for backwards compatibility. This approach will solve the
>>>> problems properly and should be a better model. However, I don't 
>>>> believe
>>>> it will make it for 6.1 and I'd really like to at least fix the
>>>> unplugging for 6.1 and this gets the job done.
>>>>
>>>>  [1]: 20210511073511.32511-1-hare@suse.de
>>>>
>>>> v2:
>>>> - added R-b's by Hannes for patches 1 through 3
>>>> - simplified "hw/nvme: fix controller hot unplugging"
>>>>
>>>> Klaus Jensen (4):
>>>>  hw/nvme: remove NvmeCtrl parameter from ns setup/check functions
>>>>  hw/nvme: mark nvme-subsys non-hotpluggable
>>>>  hw/nvme: unregister controller with subsystem at exit
>>>>  hw/nvme: fix controller hot unplugging
>>>>
>>>> hw/nvme/nvme.h   | 18 +++++++++-------
>>>> hw/nvme/ctrl.c   | 14 ++++++------
>>>> hw/nvme/ns.c     | 55 +++++++++++++++++++++++++++++++-----------------
>>>> hw/nvme/subsys.c |  9 ++++++++
>>>> 4 files changed, 63 insertions(+), 33 deletions(-)
>>>>
>>>> -- 
>>>> 2.32.0
>>>>
>>>
>>> Applied patches 1 through 3 to nvme-next.
>>
>> So, how do we go about with patch 4?
>> Without it this whole exercise is a bit pointless, seeing that it 
>> doesn't fix anything.
>>
> 
> Patch 1-3 are fixes we need anyway, so I thought I might as well apply 
> them :)
> 
>> Shall we go with that patch as an interim solution?
>> Will you replace it with your 'object' patch?
>> What is the plan?
>>
> 
> Yes, if acceptable, I would like to use patch 4 as an interim solution. 
> We have a bug we need to fix for 6.1, and I believe this does the job.
> 
Oh, yes, it does. But it's ever so slightly ugly with the reparenting 
stuff. But if that's considered an interim solution I'm fine with it.

You can add my 'Reviewed-by: Hannes Reinecke <hare@suse.de>' tag if you 
like.

> I considered changing the existing nvme-bus to be on the main system 
> bus, but then we break the existing behavior that the namespaces attach 
> to the most recently defined controller in the absence of the shared 
> parameter or an explicit bus parameter.
> 
Do we?
My idea was to always attach a namespace to a subsystem (and, if not 
present, create one). The controller would then 'link' to that 
subsystem. The subsystem would have a 'shared' attribute, which would 
determine if more than one controller can be 'linked' to it.

That way we change the relationship between the controller and the 
namespace, as then the namespace would be a child of the subsystem,
and the namespace would need to be detached separately from the controller.

But it fits neatly into the current device model, except the slightly 
awkward 'link' thingie.

> Wrt. "the plan", right now, I see two solutions going forward:
> 
> 1. Introduce new -object's for nvme-nvm-subsystem and nvme-ns
>     This is the approach that I am taking right now and it works well. 
> It allows many-to-many relationships and separates the life times of 
> subsystems, namespaces and controllers like you mentioned.
> 

Ah. Would like to see that path, then.

>     Conceptually, I also really like that the subsystem and namespace 
> are not "devices". One could argue that the namespace is comparable 
> to a SCSI LUN (-device scsi-hd, right?), but where the SCSI LUN 
> actually "shows up" in the host, the nvme namespace does not.
> 

Well, 'devices' really is an abstraction, and it really depends on what 
you declare a device is. But yes, in the QDEV sense with its strict 
inheritance the nvme topology is not a good fit, agreed.

As for SCSI: the namespace is quite comparable to a SCSI LUN; the NVMe 
controller is roughly equivalent to the 'initiator' on SCSI, and the 
subsystem would match up to the SCSI target.

The problem for NVMe is that the whole NVMe-over-Fabrics stuff was 
layered on top of the existing NVMe-PCI spec, so that the 'subsystem' 
only truly exists for NVMe-over-Fabrics; for PCI you don't actually need 
it, and indeed some NVMe PCI devices don't even fill out these values.
And it makes things tricky for qemu, as the nvme emulation is actually 
based on the pre-fabrics spec, hence subsystem concept was never 
implemented properly.

>     My series handles backwards compatibility by keeping -device "shims" 
>     around that just wraps the new objects but behaves like it used to. 
>     The plan would be to deprecate these devices.
> 

Or keeping the '-device' shims around for just nvme-pci, and require 
-object specification if one would want to use nvme-over-fabrics.

>     The downside to this approach is that it moves the subsystem and    
> namespaces out of the "qdev tree (info qtree)" and into the pure QOM    
> "/objects" tree. Instead of qtree, we can have QMP and HMP commands    
> for introspection.
> 

Serves them right for introducing tons of different abstractions.
Not a problem from my side.

> 2. Make the subsystem a "system bus device"
>     This way we add an "nvme-nvm-subsystems" bus as a direct child of 
> the main system bus, and we can possibly get rid of the explicit 
> -device nvme-subsys as well. We change the namespace device to plug 
> into that instead. The nvme controller device still needs to plug 
> into the PCI bus, so it cannot be a child of the subsystems bus, but 
> can keep using a link parameter to hook into the subsystem and attach 
> to any namespaces it would like.
> 

I don't think we can or should do away with the subsystem; that's quite 
a central structure in the nvme-oF spec, and trying to create an 
abstraction without it will just lead to lots of duplicated 
identification, not to mention the increased complexity during lookup
(As per spec, the controller connects to a subsystem, and the subsystem 
presents the namespaces. Abstracting away the subsystem would mean that 
you have to have lots of tracking in the individual namespace, with lots 
of possibilities to get it wrong.)

But from my perspective it should be perfectly feasible to have the 
subsystem a child of the main/system bus, and the controller a child of 
the PCI bus.

As mentioned above, that would break the implicit destruction of the 
namespace when detaching the controller, but one could argue that that's 
exactly the point, seeing that several controllers can have access to 
the same namespace.

>     I'm unsure if we can do this without deprecating the existing    
> namespace device, just like option 1.
> 
>     I have not implemented this, so I need to look more into it. It 
> seems like the main thing that this gives us compared to 1) is `info 
> qtree`support and we still end up just "wiring" namespace attachment 
> with backlinks anyway.
> 

Yeah, we'll have to do wiring one way or other.

> I'm not sure what I would prefer, but I've found that implementing it as 
> -object's is a breath of fresh air and as I mentioned, conceptually, I 
> like option 1 because namespaces are -objects and not -devices.
> 

Sure. I just tend leave the infrastructure questions to those actively 
working with the qemu community. I've found the qemu development process 
to be too unwieldy for me to make more than the random contribution.

> And, by the way, thanks for chipping in on this Hannes, I had sort of 
> crossed off option 2 before you showed up and threw some ideas in the 
> air ;)

Sure.
I could give it a go at option 2); patch 4 should be a good starting 
point. And shouldn't be too hard to implement, either.

Then we can compare results and make a judgement call.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

