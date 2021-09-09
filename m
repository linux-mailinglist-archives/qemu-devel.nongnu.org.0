Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BE24047FC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 11:45:47 +0200 (CEST)
Received: from localhost ([::1]:56758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGcs-0000CU-5y
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 05:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOGak-0006bB-FG; Thu, 09 Sep 2021 05:43:34 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:42388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOGai-0001UP-Fl; Thu, 09 Sep 2021 05:43:34 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BE31522322;
 Thu,  9 Sep 2021 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631180610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0l7sL6ar7A5ApmxfWZKJpSCDz/QZQX+9Da/NQ4/FsPU=;
 b=K7c2Gs2vKFqrSBmzaarx3t2hZs/602Ox/5H7o1gyXSgX37eAQHMn1en8GV58iMvL1LlcJd
 aStjrmLDY0yWkvsvmnPPd62uVtsWuR4cYwWsPyLkybhpuzCFCcoIfoPPGX82C/CQAT0VNJ
 h/7UVK06AhdysPe5kHApPz6dZ4MSdqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631180610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0l7sL6ar7A5ApmxfWZKJpSCDz/QZQX+9Da/NQ4/FsPU=;
 b=UPPqw45CnatYwx4SWWqRTjikvP8IYn5C4ry8dL+mqRdUYPKDhhNDkFeMEDnvLfRHSEq4/O
 OTUT7Cdli/PB0UAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9634313342;
 Thu,  9 Sep 2021 09:43:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XtlcJELXOWHPJAAAMHmgww
 (envelope-from <hare@suse.de>); Thu, 09 Sep 2021 09:43:30 +0000
Subject: Re: [PULL for-6.1 06/11] hw/nvme: fix controller hot unplugging
To: Klaus Jensen <its@irrelevant.dk>
References: <20210726191901.4680-1-its@irrelevant.dk>
 <20210726191901.4680-7-its@irrelevant.dk>
 <699ace8a-4d92-c9ee-d844-0e5d80edc4d6@suse.de>
 <YTm+yvB3shItJ1Cn@apples.localdomain>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <911674de-89a4-3a2b-e10b-4e7801abfb02@suse.de>
Date: Thu, 9 Sep 2021 11:43:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YTm+yvB3shItJ1Cn@apples.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.922,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 9:59 AM, Klaus Jensen wrote:
> On Sep  9 09:02, Hannes Reinecke wrote:
>> On 7/26/21 9:18 PM, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> Prior to this patch the nvme-ns devices are always children of the
>>> NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
>>> unrealized when the parent device is removed. However, when subsystems
>>> are involved, this is not what we want since the namespaces may be
>>> attached to other controllers as well.
>>>
>>> This patch adds an additional NvmeBus on the subsystem device. When
>>> nvme-ns devices are realized, if the parent controller device is linked
>>> to a subsystem, the parent bus is set to the subsystem one instead. This
>>> makes sure that namespaces are kept alive and not unrealized.
>>>
>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>> ---
>>>   hw/nvme/nvme.h   | 15 ++++++++-------
>>>   hw/nvme/ctrl.c   | 14 ++++++--------
>>>   hw/nvme/ns.c     | 18 ++++++++++++++++++
>>>   hw/nvme/subsys.c |  3 +++
>>>   4 files changed, 35 insertions(+), 15 deletions(-)
>>>
>> Finally got around to test this; sadly, with mixed results.
>> On the good side: controller hotplug works.
>> Within qemu monitor I can do:
>>
>> device_del <devname>
>> device_add <device description>
>>
>> and OS reports:
>> [   56.564447] pcieport 0000:00:09.0: pciehp: Slot(0-2): Attention button
>> pressed
>> [   56.564460] pcieport 0000:00:09.0: pciehp: Slot(0-2): Powering off due to
>> button press
>> [  104.293335] pcieport 0000:00:09.0: pciehp: Slot(0-2): Attention button
>> pressed
>> [  104.293347] pcieport 0000:00:09.0: pciehp: Slot(0-2) Powering on due to
>> button press
>> [  104.293540] pcieport 0000:00:09.0: pciehp: Slot(0-2): Card present
>> [  104.293544] pcieport 0000:00:09.0: pciehp: Slot(0-2): Link Up
>> [  104.428961] pci 0000:03:00.0: [1b36:0010] type 00 class 0x010802
>> [  104.429298] pci 0000:03:00.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
>> [  104.431442] pci 0000:03:00.0: BAR 0: assigned [mem 0xc1200000-0xc1203fff
>> 64bit]
>> [  104.431580] pcieport 0000:00:09.0: PCI bridge to [bus 03]
>> [  104.431604] pcieport 0000:00:09.0:   bridge window [io  0x7000-0x7fff]
>> [  104.434815] pcieport 0000:00:09.0:   bridge window [mem
>> 0xc1200000-0xc13fffff]
>> [  104.436685] pcieport 0000:00:09.0:   bridge window [mem
>> 0x804000000-0x805ffffff 64bit pref]
>> [  104.441896] nvme nvme2: pci function 0000:03:00.0
>> [  104.442151] nvme 0000:03:00.0: enabling device (0000 -> 0002)
>> [  104.455821] nvme nvme2: 1/0/0 default/read/poll queues
>>
>> So that works.
>> But: the namespace is not reconnected.
>>
>> # nvme list-ns /dev/nvme2
>>
>> draws a blank. So guess some fixup patch is in order...
>>
> 
> Hi Hannes,
> 
> I see. Ater the device_del/device_add dance, the namespace is there, but it is
> not automatically attached.
> 
>     # nvme list-ns -a /dev/nvme0
>     [   0]:0x2
> 
>     # nvme attach-ns /dev/nvme0 -n 2 -c 0
>     attach-ns: Success, nsid:2
> 
>     # nvme list-ns /dev/nvme0
>     [   0]:0x2
> 
> 
> I don't *think* the spec says that namespaces *must* be re-attached
> automatically? But I would have to check... If it does say that, then this is a
> bug of course.
> 
Errm. Yes, the namespaces must be present after a 'reset' (which a
hotunplug/hotplug cycle amounts to here).

As per spec the namespaces are a property of the _subsystem_, not the
controller. And the controller attaches to a subsystem, so it'll see any
namespaces which are present in the subsystem.
(whether it needs to see _all_ namespaces from that subsystem is another
story, but doesn't need to bother us here :-).

Just send a patch for it; is actually quite trivial.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer

