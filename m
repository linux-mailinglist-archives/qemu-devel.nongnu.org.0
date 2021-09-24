Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18309416B69
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 08:07:24 +0200 (CEST)
Received: from localhost ([::1]:49192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTeMk-0008LU-MK
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 02:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mTeL8-0006Vu-DL; Fri, 24 Sep 2021 02:05:43 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:34234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mTeL4-0007Eq-UM; Fri, 24 Sep 2021 02:05:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 943B52240C;
 Fri, 24 Sep 2021 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632463535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/Lu8Zfv8PTXQ9idbeqB8jRZ5qSWHY4FwqcyLyWrk4U=;
 b=VoxB+clyS0U4JI+J8RWuUqsDK6rtjeDlTmpv3QhAOVQilJVAqndKJ6FHuixkKZs2AqxLEI
 O0SJj4mUIEguLAjMpE4sJ2EBdFnlQ6GESQQjjtIssOq/L2J5nbxLQmwGSB7zA3+kUy2JSt
 Fl6o54BWzlfLxNR7+H7JLmB9qhf3Q2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632463535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/Lu8Zfv8PTXQ9idbeqB8jRZ5qSWHY4FwqcyLyWrk4U=;
 b=Sy8uUgEDQqvG35hj5PNxCgZKk0pKNtoBgDa5tdAddbCga0yvAQA3xA3cQuXvpC9xXldJSt
 whezeNkvlPTbbwBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 755EE13AAC;
 Fri, 24 Sep 2021 06:05:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zsksG69qTWEOUQAAMHmgww
 (envelope-from <hare@suse.de>); Fri, 24 Sep 2021 06:05:35 +0000
Subject: Re: [PATCH] hw/nvme: reattach subsystem namespaces on hotplug
To: Klaus Jensen <its@irrelevant.dk>
References: <20210909094308.122038-1-hare@suse.de>
 <YTnmWUKhtlR2j3yI@apples.localdomain>
 <39666601-8d22-b051-2939-e2ccb96fb010@suse.de>
 <YUzfAP2BWSDJOLSO@apples.localdomain>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <5ad5bace-07f6-13cd-906a-7b600441dd6d@suse.de>
Date: Fri, 24 Sep 2021 08:05:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YUzfAP2BWSDJOLSO@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
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
Cc: Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 10:09 PM, Klaus Jensen wrote:
> On Sep  9 13:37, Hannes Reinecke wrote:
>> On 9/9/21 12:47 PM, Klaus Jensen wrote:
>>> On Sep  9 11:43, Hannes Reinecke wrote:
>>>> With commit 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
>>>> namespaces get moved from the controller to the subsystem if one
>>>> is specified.
>>>> That keeps the namespaces alive after a controller hot-unplug, but
>>>> after a controller hotplug we have to reconnect the namespaces
>>>> from the subsystem to the controller.
>>>>
>>>> Fixes: 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
>>>> Cc: Klaus Jensen <k.jensen@samsung.com>
>>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>>> ---
>>>>   hw/nvme/subsys.c | 8 +++++++-
>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
>>>> index 93c35950d6..a9404f2b5e 100644
>>>> --- a/hw/nvme/subsys.c
>>>> +++ b/hw/nvme/subsys.c
>>>> @@ -14,7 +14,7 @@
>>>>   int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
>>>>   {
>>>>       NvmeSubsystem *subsys = n->subsys;
>>>> -    int cntlid;
>>>> +    int cntlid, nsid;
>>>>   
>>>>       for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
>>>>           if (!subsys->ctrls[cntlid]) {
>>>> @@ -29,12 +29,18 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
>>>>   
>>>>       subsys->ctrls[cntlid] = n;
>>>>   
>>>> +    for (nsid = 0; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
>>>> +        if (subsys->namespaces[nsid]) {
>>>> +            nvme_attach_ns(n, subsys->namespaces[nsid]);
>>>> +        }
>>>
>>> Thanks Hannes! I like it, keeping things simple.
>>>
>>> But we should only attach namespaces that have the shared property or
>>> have ns->attached == 0. Non-shared namespaces may already be attached to
>>> another controller in the subsystem.
>>>
>>
>> Well ... I tried to avoid that subject, but as you brought it up:
>> There is a slightly tricky issue in fabrics, in that the 'controller' is
>> independent from the 'connection'.
>> The 'shared' bit in the CMIC setting indicates that the subsystem may
>> have more than one _controller_. It doesn't talk about how many
>> _connections_ a controller may support; that then is the realm of
>> dynamic or static controllers, which we don't talk about :-).
>> Sufficient to say, linux only implements the dynamic controller model,
>> so every connection will be to a different controller.
>> But you have been warned :-)
>>
>> However, the 'CMIC' setting is independent on the 'NMIC' setting (ie the
>> 'shared' bit in the namespace).
>> Which leads to the interesting question on how exactly should one handle
>> non-shared namespaces in subsystems for which there are multiple
>> controllers. Especially as the NSID space is per subsystem, so each
>> controller will be able to figure out if there are blanked-out namespaces.
>> So to make this a sane setup I would propose to set the 'shared' option
>> automatically whenever the controller has the 'subsys' option set.
>> And actually, I would ditch the 'shared' option completely, and make it
>> dependent on the 'subsys' setting for the controller.
>> Much like we treat the 'CMIC' setting nowadays.
>> That avoids lots of confusions, and also make the implementation _way_
>> easier.
>>
> 
> I see your point. Unfortunately, there is no easy way to ditch shared=
> now. But I think it'd be good enough to attach to shared automatically,
> but not to "shared=off".
> 
> I've already ditched the shared parameter on my RFC refactor series and
> always having the namespaces shared.
> 

Okay.

>>> However...
>>>
>>> The spec says that "The attach and detach operations are persistent
>>> across all reset events.". This means that we should track those events
>>> in the subsystem and only reattach namespaces that were attached at the
>>> time of the "reset" event. Currently, we don't have anything mapping
>>> that state. But the device already has to take some liberties with
>>> regard to stuff that is considered persistent by the spec (SMART log
>>> etc.) since we do not have any way to store stuff persistently across
>>> qemu invocations, so I think the above is an acceptable compromise.
>>>
>> Careful. 'attach' and 'detach' are MI (management interface) operations.
>> If and how many namespaces are visible to any given controllers is
>> actually independent on that; and, in fact, controllers might not even
>> implement 'attach' or 'detach'.
>> But I do agree that we don't handle the 'reset' state properly.
>>
> 
> The Namespace Attachment command has nothing to do with MI? And the QEMU
> controller does support attaching and detaching namespaces.
> 

No, you got me wrong. Whether a not a namespace is attached is 
independent of any 'Namespace attachment' command.
Case in point: the subsystem will be starting up with namespace already 
attached, even though no-one issued any namespace attachment command.

>>> A potential (as good as it gets) fix would be to keep a map/list of
>>> "persistently" attached controllers on the namespaces and re-attach
>>> according to that when we see that controller joining the subsystem
>>> again. CNTLID would be the obvious choice for the key here, but problem
>>> is that we cant really use it since we assign it sequentially from the
>>> subsystem, which now looks like a pretty bad choice. CNTLID should have
>>> been a required property of the nvme device when subsystems are
>>> involved. Maybe we can fix up the CNTLID assignment to take the serial
>>> into account (we know that is defined and *should* be unique) and not
>>> reuse CNTLIDs. This limits the subsystem to NVME_MAX_CONTROLLERS unique
>>> controllers, but I think that is fair enough.
>>>
>>> Sigh. Need to think this through.
>>>
>> Well, actually there is an easy way out. I do agree that we need to make
>> the 'cntlid' a property of the controller. And once it's set we can
>> track it properly, eg by having per-cntlid nsid lists in the subsystem.
>> But if it's not set we can claim that we'll be allocating a new
>> controller across reboots (which is actually what we're doing), making
>> us spec compliant again :-)
>>
> 
> That is a decent solution, but we still can't track it across reboots. I
> think we should just with your patch (but for now, only automatically
> attach shared namespaces).
> 
But that's the point.
We don't _need_ to track it.
We only need to track it when it's specified via a (yet-to-be-added) 
cntlid parameter, but then it's trivial.
If it's not specified we will allocate a new one and don't need to track 
stuff. That's even permitted by the NVMe spec; v2.0 section 3.1.1 has:

While allocation of static controllers to hosts are expected to be 
durable (so that hosts can expect to form associations to the same 
controllers repeatedly (e.g., after each host reboot)), the NVM 
subsystem may remove the host allocation of a controller that is not in 
use at any time for implementation specific reasons
(e.g., controller resource reclamation, subsystem reconfiguration).

> Would that be acceptable to you? It would require your to add shared=on
> on your single-namespace test set up since unfortunately, shared=on is
> not the default. However, we can consider changing that default in 6.2.
> 
Yes, for an interim solution it's okay.
The important bit is to get hotplug up and running again for NVMe; we do 
have some testcases for patches in upstream linux which I would like to 
forward to our QA Team.

Cheers

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

