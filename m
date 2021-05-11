Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C595337A10E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:41:51 +0200 (CEST)
Received: from localhost ([::1]:39764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgN1a-0005x8-SC
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1lgMxT-0007od-Cb
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:37:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:46000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1lgMxO-0003uB-38
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:37:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B8C0AF88;
 Tue, 11 May 2021 07:37:27 +0000 (UTC)
Subject: Re: [Bug 1925496] Re: nvme disk cannot be hotplugged after removal
To: Klaus Jensen <its@irrelevant.dk>, Max Reitz <mreitz@redhat.com>
References: <161909487037.10022.905940620153099238.malonedeb@wampee.canonical.com>
 <161960231059.11681.2408216748859225156.malone@wampee.canonical.com>
 <YIk1KG4dgT6mwChA@apples.localdomain>
 <09273f4c-3ac6-1fc4-b26e-d6fd3bee9021@redhat.com>
 <YI+l2X3jtvaZC6wv@apples.localdomain>
From: Hannes Reinecke <hare@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <495074fe-0502-4a0a-30fc-3a8472fed35e@suse.de>
Date: Tue, 11 May 2021 09:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YI+l2X3jtvaZC6wv@apples.localdomain>
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
Cc: Bug 1925496 <1925496@bugs.launchpad.net>, kwolf@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 9:27 AM, Klaus Jensen wrote:
> On Apr 28 15:00, Max Reitz wrote:
>> On 28.04.21 12:12, Klaus Jensen wrote:
>>> On Apr 28 09:31, Oguz Bektas wrote:
>>>>> My understanding is that this is the expected behavior. The reason is
>>>>> that the drive cannot be deleted immediately when the device is
>>>>> hot-unplugged, since it might not be safe (other parts of QEMU could
>>>>> be using it, like background block jobs).
>>>>>
>>>>> On the other hand, the fact that if the drive is removed explicitly
>>>>> through QMP (or in the monitor with drive_del), the drive id is
>>>>> remains "in use". This might be a completely different bug that is
>>>>> unrelated to the nvme device.
>>>>
>>>> using the same commands I can hot-plug and hot-unplug a scsi disk like
>>>> this without issue - this behavior only appeared on nvme devices.
>>>>
>>>
>>> Kevin, Max, can you shed any light on this?
>>>
>>> Specifically what the expected behavior is wrt. to the drive when
>>> unplugging a device that has one attached?
>>>
>>> If the scsi disk is capable of "cleaning up" immediately, then I
>>> suppose that some steps are missing in the nvme unrealization.
>>
> 
> Hi Max,
> 
> Thanks for your help!
> 
>> I’m not very strong when it comes to question for guest devices, but
>> looking into the QAPI documentation, it says that when DEVICE_DELETED
>> is emitted, it’s safe to reuse the device ID.  Before then, it isn’t,
>> because the guest may yet need to release the device.
>>
> 
> This is specifically related to releasing the "drive", not the device.
> Problem is that when the device is deleted (using device_del), the pci
> device goes away rapidly, but the drive (as shown in `info block`)
> lingers for a couple of seconds before going into the "unlocked" state.
> If the drive is then deleted (`drive_del`) everything is good, but if
> the drive is deleted within those couple of seconds, the drive_del
> completes successfully, but the drive id never becomes available again.
> 
>> So the questions that come to my mind are:
>> - Do nvme guest devices have a release protocol with the guest, so
>> that it just may take some time for the guest to release the device? 
>> I.e. that this would be perfectly normal and documented behavior?
>> (Perhaps this just isn’t the case for scsi, or the guest just releases
>> those devices much quicker)
>>
> 
> The NVMe device is a PCIDevice, I wonder if that is what adds some delay
> on this?
> 
>> - Did Oguz always wait for the DEVICE_DELETED event before reusing the
>> ID?  Sounds like it would be a bug if reusing the ID after getting
>> that event failed.
>>
> 
> From the bug report, it does not look like anything like that is done.
> 
> I basically dont understand the deletion protocol here and why the drive
> is not released immediately. Even if I add a call to
> blockdev_mark_auto_del() there is a delay, but the drive does get
> automatically deleted.

FWIW, I've just sent a patch to re-enable NVMe namespace hotplug;
basically you can 'hot-delete' an nvme device via 'device_del <pcidev>',
but you cannot 'hot-add' an nvme device via 'device_add <pcidev>'.
Or, rather, you can, but then you end up with a NVME controller with no
namespaces which tends to be kinda pointless.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		        Kernel Storage Architect
hare@suse.de			               +49 911 74053 688
SUSE Software Solutions Germany GmbH, 90409 Nürnberg
GF: F. Imendörffer, HRB 36809 (AG Nürnberg)

