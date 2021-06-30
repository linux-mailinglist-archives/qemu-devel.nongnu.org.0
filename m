Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5D53B7B59
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:40:22 +0200 (CEST)
Received: from localhost ([::1]:59782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyPDC-0007gH-0q
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lyPBh-0006me-19; Tue, 29 Jun 2021 21:38:49 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lyPBe-0004g0-1f; Tue, 29 Jun 2021 21:38:48 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GF3l26nbDzXmFw;
 Wed, 30 Jun 2021 09:33:18 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 30 Jun 2021 09:38:38 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 30 Jun 2021 09:38:37 +0800
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "open
 list:ARM cores" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
Date: Wed, 30 Jun 2021 09:38:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
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
Cc: wanghaibin.wang@huawei.com, lushenming@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/6/30 4:14, Eric Auger wrote:
> Hi Kunkun,
>
> On 6/29/21 11:33 AM, Kunkun Jiang wrote:
>> Hi all,
>>
>> Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
>> our original intention is to flush the ITS tables into guest RAM at
>> the point
>> RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
>> migration launch so let's simply flush the tables each time the VM gets
>> stopped.
>>
>> But I encountered an error when I shut down the virtual machine.
>>
>>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr
>>> 0x0000000000000001: Permission denied
>> Shall we need to flush ITS tables into guest RAM when 'shutdown' the VM?
>> Or do you think this error is normal?
> yes we determined in the past this was the right moment do save the tables
>
> "with a live migration the guest is still running after
> the RAM has been first saved, and so the tables may still change
> during the iterative RAM save. You would actually need to do this
> at just the point we stop the VM before the final RAM save; that *might*
> be possible by using a notifier hook a vm run state change to RUN_STATE_FINISH_MIGRATE
> - if you can do the changes just as the migration flips into that mode
> it *should* work. " said David.
>
> But sometimes as the commit msg says, the VM is stopped before the migration launch - I do not remember the exact scenario tbh -.
Well, I initially wanted to know more about this scenario to determine 
whether
a normal shutdown would fall into it.😂
In my opinion, when the virtual machine is normally shutdown, flushing the
ITS tables is not necessary. If we can't tell the difference between 
'normal shutdown'
and the above scenario, then this 'error' is inevitable.
> So each time the VM is stopped we flush the caches into guest RAM.
>
>
>
>> This error occurs in the following scenario:
>> Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC to
>> the VM.
>>
>> The flow is as follows:
>>
>> QEMU:
>> vm_shutdown
>>      do_vm_stop(RUN_STATE_SHUTDOWN)
>>          vm_state_notify
>>              ...
>>              vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
>>                  kvm_device_access
>>
>> Kernel:
>>      vgic_its_save_tables_v0
>>          vgic_its_save_device_tables
>>              vgic_its_save_itt
>>
>> There is such a code in vgic_its_save_itt():
>>> /*
>>>   * If an LPI carries the HW bit, this means that this
>>>   * interrupt is controlled by GICv4, and we do not
>>>   * have direct access to that state without GICv4.1.
>>>   * Let's simply fail the save operation...
>>>   */
>>> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>>>            return -EACCES;
> As far as I understand you need a v4.1 to migrate,
> following Shenming's series
> [PATCH v5 0/6] KVM: arm64: Add VLPI migration support on GICv4.1
> Maybe sync with him?
Yes, GICv4 does not support live migrate.

Thanks,
Kunkun Jiang
>
> Thanks
>
> Eric
>
>
>> Looking forward to your reply.
>>
>> Thanks,
>> Kunkun Jiang
>>
>>
>>
>>
>>
>>
>>
> .



