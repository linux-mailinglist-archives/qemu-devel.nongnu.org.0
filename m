Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880322D50D0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 03:23:16 +0100 (CET)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knBbv-0000xK-1b
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 21:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1knBaS-0000NE-8V; Wed, 09 Dec 2020 21:21:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1knBaP-0003Pk-Jm; Wed, 09 Dec 2020 21:21:43 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CryM55SqJzkkWT;
 Thu, 10 Dec 2020 10:20:49 +0800 (CST)
Received: from [10.174.187.219] (10.174.187.219) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 10:21:22 +0800
Subject: Re: [RFC PATCH v2 1/3] vfio: Move the saving of the config space to
 the right place in VFIO migration
To: Alex Williamson <alex.williamson@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-2-lushenming@huawei.com>
 <20201209132947.3177f130.cohuck@redhat.com>
 <20201209113431.5b252e93@omen.home>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <3f7db9e7-3c98-5022-e907-e6214815fae9@huawei.com>
Date: Thu, 10 Dec 2020 10:21:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201209113431.5b252e93@omen.home>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.219]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/12/10 2:34, Alex Williamson wrote:
> On Wed, 9 Dec 2020 13:29:47 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
>> On Wed, 9 Dec 2020 16:09:17 +0800
>> Shenming Lu <lushenming@huawei.com> wrote:
>>
>>> On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
>>> setup, if the restoring of the VFIO PCI device config space is
>>> before the VGIC, an error might occur in the kernel.
>>>
>>> So we move the saving of the config space to the non-iterable
>>> process, so that it will be called after the VGIC according to
>>> their priorities.
>>>
>>> As for the possible dependence of the device specific migration
>>> data on it's config space, we can let the vendor driver to
>>> include any config info it needs in its own data stream.
>>> (Should we note this in the header file linux-headers/linux/vfio.h?)  
>>
>> Given that the header is our primary source about how this interface
>> should act, we need to properly document expectations about what will
>> be saved/restored when there (well, in the source file in the kernel.)
>> That goes in both directions: what a userspace must implement, and what
>> a vendor driver can rely on.

Yeah, in order to make the vendor driver and QEMU cooperate better, we might
need to document some expectations about the data section in the migration
region...

>>
>> [Related, but not a todo for you: I think we're still missing proper
>> documentation of the whole migration feature.]
> 
> Yes, we never saw anything past v1 of the documentation patch.  Thanks,
> 

By the way, is there anything unproper with this patch? Wish your suggestion. :-)

> Alex
> 
> 
>>> Signed-off-by: Shenming Lu <lushenming@huawei.com>
>>> ---
>>>  hw/vfio/migration.c | 25 +++++++++++++++----------
>>>  1 file changed, 15 insertions(+), 10 deletions(-)  
> 
> .
> 

