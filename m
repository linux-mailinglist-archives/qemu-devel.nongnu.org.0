Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926D640496C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 13:41:13 +0200 (CEST)
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOIQa-0006eJ-52
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 07:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOINY-00053n-Ap; Thu, 09 Sep 2021 07:38:04 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOINU-0007sT-Jk; Thu, 09 Sep 2021 07:38:04 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90D57201D1;
 Thu,  9 Sep 2021 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631187477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=84q5MEcSvXzgV53BfDFkOTx5UScR7p8E5kM+pb32gs4=;
 b=E4GEnEJ/Uy5ZPUiHF7GbhN8wkv7kKB/k7xA5r6vvVJBMccQlVJDnFUChPpm8/QqpgWIq4e
 0bl33JKMCTJO6ydVoQd/rBZb1r6795r2jlqmnbL5VwDm0tpTXX4lciurOtw8exr/ZzOtze
 vhhqpmYW31hl/fMGvl56XxulMZM/fqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631187477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=84q5MEcSvXzgV53BfDFkOTx5UScR7p8E5kM+pb32gs4=;
 b=p7X95qw2rXc8r9moj0Zm/DmZ3VOW8MO8y9JxWVP+8kS1MOWZXANiVGYBCS3poxmb6xvdgs
 KbV5lq1jb8pGpiBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8444A13A5D;
 Thu,  9 Sep 2021 11:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TFsYIBXyOWE4XAAAMHmgww
 (envelope-from <hare@suse.de>); Thu, 09 Sep 2021 11:37:57 +0000
To: Klaus Jensen <its@irrelevant.dk>
References: <20210909094308.122038-1-hare@suse.de>
 <YTnmWUKhtlR2j3yI@apples.localdomain>
From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH] hw/nvme: reattach subsystem namespaces on hotplug
Message-ID: <39666601-8d22-b051-2939-e2ccb96fb010@suse.de>
Date: Thu, 9 Sep 2021 13:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YTnmWUKhtlR2j3yI@apples.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
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

On 9/9/21 12:47 PM, Klaus Jensen wrote:
> On Sep  9 11:43, Hannes Reinecke wrote:
>> With commit 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
>> namespaces get moved from the controller to the subsystem if one
>> is specified.
>> That keeps the namespaces alive after a controller hot-unplug, but
>> after a controller hotplug we have to reconnect the namespaces
>> from the subsystem to the controller.
>>
>> Fixes: 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
>> Cc: Klaus Jensen <k.jensen@samsung.com>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>  hw/nvme/subsys.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
>> index 93c35950d6..a9404f2b5e 100644
>> --- a/hw/nvme/subsys.c
>> +++ b/hw/nvme/subsys.c
>> @@ -14,7 +14,7 @@
>>  int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
>>  {
>>      NvmeSubsystem *subsys = n->subsys;
>> -    int cntlid;
>> +    int cntlid, nsid;
>>  
>>      for (cntlid = 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
>>          if (!subsys->ctrls[cntlid]) {
>> @@ -29,12 +29,18 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
>>  
>>      subsys->ctrls[cntlid] = n;
>>  
>> +    for (nsid = 0; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
>> +        if (subsys->namespaces[nsid]) {
>> +            nvme_attach_ns(n, subsys->namespaces[nsid]);
>> +        }
> 
> Thanks Hannes! I like it, keeping things simple.
> 
> But we should only attach namespaces that have the shared property or
> have ns->attached == 0. Non-shared namespaces may already be attached to
> another controller in the subsystem.
> 

Well ... I tried to avoid that subject, but as you brought it up:
There is a slightly tricky issue in fabrics, in that the 'controller' is
independent from the 'connection'.
The 'shared' bit in the CMIC setting indicates that the subsystem may
have more than one _controller_. It doesn't talk about how many
_connections_ a controller may support; that then is the realm of
dynamic or static controllers, which we don't talk about :-).
Sufficient to say, linux only implements the dynamic controller model,
so every connection will be to a different controller.
But you have been warned :-)

However, the 'CMIC' setting is independent on the 'NMIC' setting (ie the
'shared' bit in the namespace).
Which leads to the interesting question on how exactly should one handle
non-shared namespaces in subsystems for which there are multiple
controllers. Especially as the NSID space is per subsystem, so each
controller will be able to figure out if there are blanked-out namespaces.
So to make this a sane setup I would propose to set the 'shared' option
automatically whenever the controller has the 'subsys' option set.
And actually, I would ditch the 'shared' option completely, and make it
dependent on the 'subsys' setting for the controller.
Much like we treat the 'CMIC' setting nowadays.
That avoids lots of confusions, and also make the implementation _way_
easier.

> However...
> 
> The spec says that "The attach and detach operations are persistent
> across all reset events.". This means that we should track those events
> in the subsystem and only reattach namespaces that were attached at the
> time of the "reset" event. Currently, we don't have anything mapping
> that state. But the device already has to take some liberties with
> regard to stuff that is considered persistent by the spec (SMART log
> etc.) since we do not have any way to store stuff persistently across
> qemu invocations, so I think the above is an acceptable compromise.
> 
Careful. 'attach' and 'detach' are MI (management interface) operations.
If and how many namespaces are visible to any given controllers is
actually independent on that; and, in fact, controllers might not even
implement 'attach' or 'detach'.
But I do agree that we don't handle the 'reset' state properly.

> A potential (as good as it gets) fix would be to keep a map/list of
> "persistently" attached controllers on the namespaces and re-attach
> according to that when we see that controller joining the subsystem
> again. CNTLID would be the obvious choice for the key here, but problem
> is that we cant really use it since we assign it sequentially from the
> subsystem, which now looks like a pretty bad choice. CNTLID should have
> been a required property of the nvme device when subsystems are
> involved. Maybe we can fix up the CNTLID assignment to take the serial
> into account (we know that is defined and *should* be unique) and not
> reuse CNTLIDs. This limits the subsystem to NVME_MAX_CONTROLLERS unique
> controllers, but I think that is fair enough.
> 
> Sigh. Need to think this through.
> 
Well, actually there is an easy way out. I do agree that we need to make
the 'cntlid' a property of the controller. And once it's set we can
track it properly, eg by having per-cntlid nsid lists in the subsystem.
But if it's not set we can claim that we'll be allocating a new
controller across reboots (which is actually what we're doing), making
us spec compliant again :-)

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer

