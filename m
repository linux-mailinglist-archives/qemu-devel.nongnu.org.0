Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE1937AA01
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:56:52 +0200 (CEST)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgToZ-0003h5-Sc
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1lgTmi-0002dl-5j; Tue, 11 May 2021 10:54:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:47462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1lgTmf-0003Zk-Vw; Tue, 11 May 2021 10:54:55 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E049AF9A;
 Tue, 11 May 2021 14:54:52 +0000 (UTC)
To: Klaus Jensen <its@irrelevant.dk>
References: <20210511073511.32511-1-hare@suse.de>
 <YJp2/AeqfgQ46ZyV@apples.localdomain>
 <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
 <YJqImppDvOKSbgh2@apples.localdomain>
From: Hannes Reinecke <hare@suse.de>
Organization: SUSE Linux GmbH
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <27cc0341-3a32-4a75-f5fd-9987b1b37799@suse.de>
Date: Tue, 11 May 2021 16:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YJqImppDvOKSbgh2@apples.localdomain>
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

On 5/11/21 3:37 PM, Klaus Jensen wrote:
> On May 11 15:12, Hannes Reinecke wrote:
>> On 5/11/21 2:22 PM, Klaus Jensen wrote:
[ .. ]
>>> The hotplug fix looks good - I'll post a series that tries to integrate
>>> both.
>>>
>> Ta.
>>
>> The more I think about it, the more I think we should be looking into
>> reparenting the namespaces to the subsystem.
>> That would have the _immediate_ benefit that 'device_del' and
>> 'device_add' becomes symmetric (ie one doesn't have to do a separate
>> 'device_add nvme-ns'), as the nvme namespace is not affected by the
>> hotplug event.
>>
> 
> I have that working, but I'm struggling with a QEMU API technicality in
> that I apparently cannot simply move the NvmeBus creation to the
> nvme-subsys device. For some reason the bus is not available for the
> nvme-ns devices. That is, if one does something like this:
> 
>   -device nvme-subsys,...
>   -device nvme-ns,...
> 
> Then I get an error that "no 'nvme-bus' bus found for device 'nvme'ns".
> This is probably just me not grok'ing the qdev well enough, so I'll keep
> trying to fix that. What works now is to have the regular setup:
> 
_Normally_ the 'id' of the parent device spans a bus, so the syntax
should be

-device nvme-subsys,id=subsys1,...
-device nvme-ns,bus=subsys1,...

As for the nvme device I would initially expose any namespace from the
subsystem to the controller; the nvme spec has some concept of 'active'
or 'inactive' namespaces which would allow us to blank out individual
namespaces on a per-controller basis, but I fear that's not easy to
model with qdev and the structure above.

>   -device nvme-subsys,...
>   -device nvme,...
>   -device nvme-ns,...
> 
> And the nvme-ns device will then reparent to the NvmeBus on nvme-subsys
> (which magically now IS available when nvme-ns is realized). This has
> the same end result, but I really would like that the namespaces could
> be specified as children of the subsys directly.
> 
Shudder.
Automatic reparenting.
To my understanding from qdev that shouldn't even be possible.
Please don't.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		        Kernel Storage Architect
hare@suse.de			               +49 911 74053 688
SUSE Software Solutions Germany GmbH, 90409 Nürnberg
GF: F. Imendörffer, HRB 36809 (AG Nürnberg)

