Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024966292CA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 08:57:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouqoi-0001aW-2j; Tue, 15 Nov 2022 02:57:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1ouqoe-0001aF-4h
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 02:57:08 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1ouqob-0004aH-Rn
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 02:57:07 -0500
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NBJQz5M5Rz15Mfv;
 Tue, 15 Nov 2022 15:56:27 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 15:56:14 +0800
Subject: Re: [PATCH] KVM: Add system call KVM_VERIFY_MSI to verify MSI vector
To: Marc Zyngier <maz@kernel.org>
References: <1667894937-175291-1-git-send-email-chenxiang66@hisilicon.com>
 <86wn85pq8f.wl-maz@kernel.org>
 <a55310da-2ed3-f837-71c2-d09764f83538@hisilicon.com>
 <86r0ybp0h1.wl-maz@kernel.org>
CC: <alex.williamson@redhat.com>, <kvm@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Message-ID: <743db0b1-bd20-ac4e-3a2c-c7a617acf8c7@hisilicon.com>
Date: Tue, 15 Nov 2022 15:56:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <86r0ybp0h1.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Marc,


在 2022/11/10 18:28, Marc Zyngier 写道:
> On Wed, 09 Nov 2022 06:21:18 +0000,
> "chenxiang (M)" <chenxiang66@hisilicon.com> wrote:
>> Hi Marc,
>>
>>
>> 在 2022/11/8 20:47, Marc Zyngier 写道:
>>> On Tue, 08 Nov 2022 08:08:57 +0000,
>>> chenxiang <chenxiang66@hisilicon.com> wrote:
>>>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>>>
>>>> Currently the numbers of MSI vectors come from register PCI_MSI_FLAGS
>>>> which should be power-of-2, but in some scenaries it is not the same as
>>>> the number that driver requires in guest, for example, a PCI driver wants
>>>> to allocate 6 MSI vecotrs in guest, but as the limitation, it will allocate
>>>> 8 MSI vectors. So it requires 8 MSI vectors in qemu while the driver in
>>>> guest only wants to allocate 6 MSI vectors.
>>>>
>>>> When GICv4.1 is enabled, we can see some exception print as following for
>>>> above scenaro:
>>>> vfio-pci 0000:3a:00.1: irq bypass producer (token 000000008f08224d) registration fails:66311
>>>>
>>>> In order to verify whether a MSI vector is valid, add KVM_VERIFY_MSI to do
>>>> that. If there is a mapping, return 0, otherwise return negative value.
>>>>
>>>> This is the kernel part of adding system call KVM_VERIFY_MSI.
>>> Exposing something that is an internal implementation detail to
>>> userspace feels like the absolute wrong way to solve this issue.
>>>
>>> Can you please characterise the issue you're having? Is it that vfio
>>> tries to enable an interrupt for which there is no virtual ITS
>>> mapping? Shouldn't we instead try and manage this in the kernel?
>> Before i reported the issue to community, you gave a suggestion about
>> the issue, but not sure whether i misundertood your meaning.
>> You can refer to the link for more details about the issue.
>> https://lkml.kernel.org/lkml/87cze9lcut.wl-maz@kernel.org/T/
> Right. It would have been helpful to mention this earlier. Anyway, I
> would really like this to be done without involving userspace at all.
>
> But first, can you please confirm that the VM works as expected
> despite the message?
Yes, it works well except the message.

> If that's the case, we only need to handle the
> case where this is a multi-MSI setup, and I think this can be done in
> VFIO, without involving userspace.

It seems we can verify every kvm_msi for multi-MSI setup in function 
vfio_pci_set_msi_trigger().
If it is a invalid MSI vector, then we can decrease the numer of MSI 
vectors before  calling vfio_msi_set_block().

>
> Thanks,
>
> 	M.
>


