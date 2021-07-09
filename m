Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C33C1F3E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 08:18:12 +0200 (CEST)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jpz-00029I-4o
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 02:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m1joP-0000VW-KX; Fri, 09 Jul 2021 02:16:33 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:51276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1m1joN-0004Mv-Mf; Fri, 09 Jul 2021 02:16:33 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3EBCE20265;
 Fri,  9 Jul 2021 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625811388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bacynsJmbWKghjnydiTsopx/Lp5zzvvJupoZ7/Krylo=;
 b=W+lQFbpxoqthui0AS+3hyvxPCkWpRLB6EaWvLD6pDLxDqceC+g7RLR8MU7k6N4KnTKB3FU
 ToHqSqESaB+GUdm+6/oLQGipA4qRzFdfwgYfV3Lp1DgAvDUw7vBGSv2saH5KUdGieTtV1i
 4Y0unMWIxl2erbZ30G8zBglrKYTkb3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625811388;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bacynsJmbWKghjnydiTsopx/Lp5zzvvJupoZ7/Krylo=;
 b=o5DZIF37Mn9qbTQ17nwmgDSIHSTQpRYi1GRWczG2OTBEei3BSFMb77iixNbssoMK4LHx+A
 GnEHi/NHt4U34NAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 10630133D0;
 Fri,  9 Jul 2021 06:16:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id VKypArzp52DmawAAGKfGzw
 (envelope-from <hare@suse.de>); Fri, 09 Jul 2021 06:16:28 +0000
Subject: Re: [PATCH v2 0/4] hw/nvme: fix controller hotplugging
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210707154936.200166-1-its@irrelevant.dk>
 <YOfnDBwya58drDZk@apples.localdomain>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <4366b9c6-8b8a-a682-9213-740c3088f1b1@suse.de>
Date: Fri, 9 Jul 2021 08:16:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOfnDBwya58drDZk@apples.localdomain>
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
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 8:05 AM, Klaus Jensen wrote:
> On Jul  7 17:49, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Back in May, Hannes posted a fix[1] to re-enable NVMe PCI hotplug. We
>> discussed a bit back and fourth and I mentioned that the core issue was
>> an artifact of the parent/child relationship stemming from the qdev
>> setup we have with namespaces attaching to controller through a qdev
>> bus.
>>
>> The gist of this series is the fourth patch "hw/nvme: fix controller hot
>> unplugging" which basically causes namespaces to be reassigned to a bus
>> owned by the subsystem if the parent controller is linked to one. This
>> fixes `device_del/add nvme` in such settings.
>>
>> Note, that in the case that there is no subsystem involved, nvme devices
>> can be removed from the system with `device_del`, but this *will* cause
>> the namespaces to be removed as well since there is no place (i.e. no
>> subsystem) for them to "linger". And since this series does not add
>> support for hotplugging nvme-ns devices, while an nvme device can be
>> readded, no namespaces can. Support for hotplugging nvme-ns devices is
>> present in [1], but I'd rather not add that since I think '-device
>> nvme-ns' is already a bad design choice.
>>
>> Now, I do realize that it is not "pretty" to explicitly change the
>> parent bus, so I do have a an RFC patch in queue that replaces the
>> subsystem and namespace devices with objects, but keeps -device shims
>> available for backwards compatibility. This approach will solve the
>> problems properly and should be a better model. However, I don't believe
>> it will make it for 6.1 and I'd really like to at least fix the
>> unplugging for 6.1 and this gets the job done.
>>
>>  [1]: 20210511073511.32511-1-hare@suse.de
>>
>> v2:
>> - added R-b's by Hannes for patches 1 through 3
>> - simplified "hw/nvme: fix controller hot unplugging"
>>
>> Klaus Jensen (4):
>>  hw/nvme: remove NvmeCtrl parameter from ns setup/check functions
>>  hw/nvme: mark nvme-subsys non-hotpluggable
>>  hw/nvme: unregister controller with subsystem at exit
>>  hw/nvme: fix controller hot unplugging
>>
>> hw/nvme/nvme.h   | 18 +++++++++-------
>> hw/nvme/ctrl.c   | 14 ++++++------
>> hw/nvme/ns.c     | 55 +++++++++++++++++++++++++++++++-----------------
>> hw/nvme/subsys.c |  9 ++++++++
>> 4 files changed, 63 insertions(+), 33 deletions(-)
>>
>> -- 
>> 2.32.0
>>
> 
> Applied patches 1 through 3 to nvme-next.

So, how do we go about with patch 4?
Without it this whole exercise is a bit pointless, seeing that it 
doesn't fix anything.

Shall we go with that patch as an interim solution?
Will you replace it with your 'object' patch?
What is the plan?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

