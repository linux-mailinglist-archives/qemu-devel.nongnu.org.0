Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD25FC0D5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 08:42:38 +0200 (CEST)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiVRt-0002EF-1s
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 02:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oiVAF-0001DF-H5; Wed, 12 Oct 2022 02:24:29 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:52292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oiVAD-0001bh-Ew; Wed, 12 Oct 2022 02:24:22 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D618921A0F;
 Wed, 12 Oct 2022 06:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665555843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEUoIdnslYorIil9+iUGpoic8UMgw2NIsbQr8POKDKk=;
 b=qWWvy10PRxiUg1MNWROKMg+Uut+8iP2lKNp8ujseb6E8VJAwfxOI5EmkyyeMRWIsjGsD+U
 ybXL5g/7CHA1ja+nEUsGpTJLh0VpW0vL1NxowLtrBMrI5dSzn6nI62iYhM5kTBr+vgzzJ8
 EwliWLKxYjrKFjnB8Ayhp7rq5IeIiF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665555843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEUoIdnslYorIil9+iUGpoic8UMgw2NIsbQr8POKDKk=;
 b=Ij+cmwF/08+gZtYFeEGx4IuWIRcZsXyGLbWWWr6RXIjYGYDa5H4XYcvsX5BGH6XFpY5kic
 9wEUpH+Qblt5yuCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 590FD13ACD;
 Wed, 12 Oct 2022 06:24:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id njB6EoNdRmPCJAAAMHmgww
 (envelope-from <hare@suse.de>); Wed, 12 Oct 2022 06:24:03 +0000
Message-ID: <deb27a4f-a053-40b8-b46b-5b4dbd4674a5@suse.de>
Date: Wed, 12 Oct 2022 08:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Content-Language: en-US
To: Daniel Wagner <wagi@monom.org>
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
References: <20210511073511.32511-1-hare@suse.de>
 <YJp2/AeqfgQ46ZyV@apples.localdomain>
 <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
 <YJqImppDvOKSbgh2@apples.localdomain>
 <27cc0341-3a32-4a75-f5fd-9987b1b37799@suse.de>
 <YJqq6rTRTL3mxMK6@apples.localdomain>
 <7f4c0a64-582b-edc7-7362-2da45c137702@suse.de>
 <20221010170100.o326gwco547y3qrz@carbon.lan>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20221010170100.o326gwco547y3qrz@carbon.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.934,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/22 19:01, Daniel Wagner wrote:
> On Tue, May 11, 2021 at 06:12:47PM +0200, Hannes Reinecke wrote:
>> On 5/11/21 6:03 PM, Klaus Jensen wrote:
>>> On May 11 16:54, Hannes Reinecke wrote:
>>>> On 5/11/21 3:37 PM, Klaus Jensen wrote:
>>>>> On May 11 15:12, Hannes Reinecke wrote:
>>>>>> On 5/11/21 2:22 PM, Klaus Jensen wrote:
>>>> [ .. ]
>>>>>>> The hotplug fix looks good - I'll post a series that
>>>>>>> tries to integrate
>>>>>>> both.
>>>>>>>
>>>>>> Ta.
>>>>>>
>>>>>> The more I think about it, the more I think we should be looking into
>>>>>> reparenting the namespaces to the subsystem.
>>>>>> That would have the _immediate_ benefit that 'device_del' and
>>>>>> 'device_add' becomes symmetric (ie one doesn't have to do a separate
>>>>>> 'device_add nvme-ns'), as the nvme namespace is not affected by the
>>>>>> hotplug event.
>>>>>>
>>>>>
>>>>> I have that working, but I'm struggling with a QEMU API technicality in
>>>>> that I apparently cannot simply move the NvmeBus creation to the
>>>>> nvme-subsys device. For some reason the bus is not available for the
>>>>> nvme-ns devices. That is, if one does something like this:
>>>>>
>>>>>    -device nvme-subsys,...
>>>>>    -device nvme-ns,...
>>>>>
>>>>> Then I get an error that "no 'nvme-bus' bus found for device 'nvme'ns".
>>>>> This is probably just me not grok'ing the qdev well enough, so I'll keep
>>>>> trying to fix that. What works now is to have the regular setup:
>>>>>
>>>> _Normally_ the 'id' of the parent device spans a bus, so the syntax
>>>> should be
>>>>
>>>> -device nvme-subsys,id=subsys1,...
>>>> -device nvme-ns,bus=subsys1,...
>>>
>>> Yeah, I know, I just oversimplified the example. This *is* how I wanted
>>> it to work ;)
>>>
>>>>
>>>> As for the nvme device I would initially expose any namespace from the
>>>> subsystem to the controller; the nvme spec has some concept of 'active'
>>>> or 'inactive' namespaces which would allow us to blank out individual
>>>> namespaces on a per-controller basis, but I fear that's not easy to
>>>> model with qdev and the structure above.
>>>>
>>>
>>> The nvme-ns device already supports the boolean 'detached' parameter to
>>> support the concept of an inactive namespace.
>>>
>> Yeah, but that doesn't really work if we move the namespace to the
>> subsystem; the 'detached' parameter is for the controller<->namespace
>> relationship.
>> That's why I meant we have to have some sort of NSID map for the controller
>> such that the controller knows with NSID to access.
>> I guess we can copy the trick with the NSID array, and reverse the operation
>> we have now wrt subsystem; keep the main NSID array in the subsystem, and
>> per-controller NSID arrays holding those which can be accessed.
>>
>> And ignore the commandline for now; figure that one out later.
>>
[..]
> 
> Sorry to ask but has there been any progress on this topic? Just run
> into the same issue that adding nvme device during runtime is not
> showing any namespace.
> 
I _thought_ that the pci hotplug fixes have now been merged with qemu 
upstream. Klaus?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


