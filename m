Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB537A757
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:13:00 +0200 (CEST)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSC3-0007rl-Ts
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1lgSBH-00073x-2G; Tue, 11 May 2021 09:12:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:47908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1lgSBF-0008KL-CQ; Tue, 11 May 2021 09:12:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 449A2AEFE;
 Tue, 11 May 2021 13:12:07 +0000 (UTC)
To: Klaus Jensen <its@irrelevant.dk>
References: <20210511073511.32511-1-hare@suse.de>
 <YJp2/AeqfgQ46ZyV@apples.localdomain>
From: Hannes Reinecke <hare@suse.de>
Organization: SUSE Linux GmbH
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
Date: Tue, 11 May 2021 15:12:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YJp2/AeqfgQ46ZyV@apples.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 2:22 PM, Klaus Jensen wrote:
> On May 11 09:35, Hannes Reinecke wrote:
>> Ever since commit e570768566 ("hw/block/nvme: support for shared
>> namespace in subsystem") NVMe PCI hotplug is broken, as the PCI
>> hotplug infrastructure will only work for the nvme devices (which
>> are PCI devices), but not for any attached namespaces.
>> So when re-adding the NVMe PCI device via 'device_add' the NVMe
>> controller is added, but all namespaces are missing.
>> This patch adds device hotplug hooks for NVMe namespaces, such that one
>> can call 'device_add nvme-ns' to (re-)attach the namespaces after
>> the PCI NVMe device 'device_add nvme' hotplug call.
>>
> 
> Hi Hannes,
> 
> Thanks for this.
> 
> The real fix here is that namespaces are properly detached from other
> controllers that it may be shared on.
> 
> But is this really the behavior we want? That nvme-ns devices always
> "belongs to" (in QEMU qdev terms) an nvme device is an artifact of the
> Bus/Device architecture and not really how an NVM subsystem should
> behave. Removing a controller should not cause shared namespaces to
> disappear from other controllers.
> 
> I have a WIP that instead adds an NvmeBus to the nvme-subsys device and
> reparents the nvme-ns devices to that if the parent controller is linked
> to a sybsystem. This way, nvme-ns devices wont be unrealized under the
> feet of other controllers.
> 
That would be the other direction I thought of; _technically_ NVMe
namespaces are objects of the subsystem, and 'controllers' are just
temporary objects providing access to the namespaces presented by the
subsystem.
So if you are going to rework it I'd rather make the namespaces children
objects of the subsystem, and have nsid maps per controller detailing
which nsids are accessible from the individual controllers.
That would probably a simple memcpy() to start with, but it would allow
us to modify that map via NVMe-MI and stuff.

However, if you do that you'll find that subsystems can't be hotplugged,
too; but I'm sure you'll be able to fix it up :-)

> The hotplug fix looks good - I'll post a series that tries to integrate
> both.
> 
Ta.

The more I think about it, the more I think we should be looking into
reparenting the namespaces to the subsystem.
That would have the _immediate_ benefit that 'device_del' and
'device_add' becomes symmetric (ie one doesn't have to do a separate
'device_add nvme-ns'), as the nvme namespace is not affected by the
hotplug event.

This really was a quick hack to demonstrate a shortcoming in the linux
NVMe stack (cf 'nvme-mpath: delete disk after last connection' if you
are interested in details), so I'm sure there is room for improvement.

And the prime reason for sending it out was to gauge interest by
qemu-devel; I have a somewhat mixed experience when sending patches to
the qemu ML ...

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		        Kernel Storage Architect
hare@suse.de			               +49 911 74053 688
SUSE Software Solutions Germany GmbH, 90409 Nürnberg
GF: F. Imendörffer, HRB 36809 (AG Nürnberg)

