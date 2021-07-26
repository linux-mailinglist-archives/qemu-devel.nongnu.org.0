Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED663D5A3B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 15:21:38 +0200 (CEST)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m80Y5-0005Lg-GN
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 09:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m80W9-0002x8-3y; Mon, 26 Jul 2021 09:19:37 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1m80W6-0003bz-L9; Mon, 26 Jul 2021 09:19:36 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GYL5w5Lc9zZt5y;
 Mon, 26 Jul 2021 21:16:04 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:19:29 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:19:28 +0800
Subject: Re: [question] Shall we flush ITS tables into guest RAM when shutdown
 the VM?
To: <eric.auger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
 <82c78e1f-98ef-982e-fbcc-34da6b8aaad7@redhat.com>
 <91d179e0-8365-e3b4-cee6-d05ce918a32d@huawei.com>
 <1d9123e9-705a-36ef-3286-b2f347ec5894@redhat.com>
 <5ccf2a18-0615-8f1c-47cb-163f80037feb@huawei.com>
 <eb63f96e-59e8-55cb-d8ba-119f75ce032f@redhat.com> <YORmWw4MUBV+VTen@work-vm>
 <fc630856-cc51-4830-9f85-4cf89e632819@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <a2ca53c6-9249-439c-16a4-f0dac07af313@huawei.com>
Date: Mon, 26 Jul 2021 21:19:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fc630856-cc51-4830-9f85-4cf89e632819@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, lushenming@huawei.com,
 "open list:ARM cores" <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/6 22:27, Eric Auger wrote:
> Hi Dave,
>
> On 7/6/21 4:19 PM, Dr. David Alan Gilbert wrote:
>> * Eric Auger (eric.auger@redhat.com) wrote:
>>> Hi,
>>>
>>> On 7/6/21 10:18 AM, Kunkun Jiang wrote:
>>>> Hi Eric,
>>>>
>>>> On 2021/6/30 17:16, Eric Auger wrote:
>>>>> On 6/30/21 3:38 AM, Kunkun Jiang wrote:
>>>>>> On 2021/6/30 4:14, Eric Auger wrote:
>>>>>>> Hi Kunkun,
>>>>>>>
>>>>>>> On 6/29/21 11:33 AM, Kunkun Jiang wrote:
>>>>>>>> Hi all,
>>>>>>>>
>>>>>>>> Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
>>>>>>>> our original intention is to flush the ITS tables into guest RAM at
>>>>>>>> the point
>>>>>>>> RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
>>>>>>>> migration launch so let's simply flush the tables each time the VM
>>>>>>>> gets
>>>>>>>> stopped.
>>>>>>>>
>>>>>>>> But I encountered an error when I shut down the virtual machine.
>>>>>>>>
>>>>>>>>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr
>>>>>>>>> 0x0000000000000001: Permission denied
>>>>>>>> Shall we need to flush ITS tables into guest RAM when 'shutdown' the
>>>>>>>> VM?
>>>>>>>> Or do you think this error is normal?
>>>>>>> yes we determined in the past this was the right moment do save the
>>>>>>> tables
>>>>>>>
>>>>>>> "with a live migration the guest is still running after
>>>>>>> the RAM has been first saved, and so the tables may still change
>>>>>>> during the iterative RAM save. You would actually need to do this
>>>>>>> at just the point we stop the VM before the final RAM save; that
>>>>>>> *might*
>>>>>>> be possible by using a notifier hook a vm run state change to
>>>>>>> RUN_STATE_FINISH_MIGRATE
>>>>>>> - if you can do the changes just as the migration flips into that mode
>>>>>>> it *should* work. " said David.
>>>>>>>
>>>>>>> But sometimes as the commit msg says, the VM is stopped before the
>>>>>>> migration launch - I do not remember the exact scenario tbh -.
>>>>>> Well, I initially wanted to know more about this scenario to determine
>>>>>> whether
>>>>>> a normal shutdown would fall into it.😂
>>>>> I think it was for save/restore use case. In that case you need to flush
>>>>> the KVM cache in memory on VM shutdown.
>>>> Sorry for late reply.
>>>>
>>>> Can we distinguish from the 'RunState'?
>>>> When we stop the VM, the RunState will be set. There are many types of
>>>> RunState, such as RUN_STATE_FINISH_MIGRATE/RUN_STATE_SAVE_VM/
>>>> RUN_STATE_SHUTDOWN/RUN_STATE_GUEST_PANICKED, etc.
>>>>
>>>> Maybe RUN_STATE_SHUTDOWN doesn't belong to save/restore use case,
>>>> right?
>>> Adding Dave, Juan and Peter in the loop for migration expertise.
>>>
>>> At the moment we save the ARM ITS MSI controller tables whenever the VM
>>> gets stopped. Saving the tables from KVM caches into the guest RAM is
>>> needed for migration and save/restore use cases.
>>> However with GICv4 this fails at KVM level because some MSIs are
>>> forwarded and saving their state is not supported with GICv4.
>>>
>>> While GICv4 migration is not supported we would like the VM to work
>>> properly, ie. being stoppable without taking care of table saving.
>>>
>>> So could we be more precise and identifiy the save/restore and migration
>>> use cases instead of saving the tables on each VM shutdown.
>> During the precopy migration (not sure about others), we do:
>>
>> static void migration_completion(MigrationState *s)
>> {
>> ....
>>              ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
>> ...
>>                  ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>>                                                           inactivate);
>>
>> so I think we do have that state there to hook off.
> That's consistent with what you suggested in the past ans what is logged
> in the commit message of
>
> cddafd8f353d2d251b1a5c6c948a577a85838582 ("hw/intc/arm_gicv3_its: Implement state save/restore").
>
> However does the save/restore enters that state. If I remember correctly that's why I decided to do the save on each VM stop instead.
>
My idea is to distinguish between save/restore, migration use cases and
other scenarios based on the 'RunState'. RUN_STATE_FINISH_MIGRATION and
RUN_STATE_COLO should be the right cases, I think. I'm not sure
RUN_STATE_SAVE_VM is a right case, which is used in save_snapshot.

Do you have a better way to identify it?

By the way, it's just get an -EACCESS error and doesn't cause any other
problems. If we don't have a good and easy way to solve it, maybe we can
ignore it.

Thanks,
Kunkun Jiang
>
>>> The tables are saved into guest RAM so when need the CPUs and devices to
>>> be stopped but we need the guest RAM to be saved after the ITS save
>>> operation.
>> Yeh so what should happen is that you:
>>     a) Iterate RAM a lot
>>     b) You stop everything
>>       -> Flushes remaining changes into RAM
>>     c) Transmit device state and last bits of RAM changes.
>>
>> so that flush should happen at (b).
> That's correct.
>
> Thanks
>
> Eric
>> Dave
>>
>>> Kunkun, by the way you currently just get an error from qemu, ie. qemu
>>> does not exit? Couldn't we just ignore -EACCESS error?
>>>
>>> Thanks
>>>
>>> Eric
>>>
>>>
>>>
>>>
>>>>>> In my opinion, when the virtual machine is normally shutdown, flushing
>>>>>> the
>>>>>> ITS tables is not necessary. If we can't tell the difference between
>>>>>> 'normal shutdown'
>>>>>> and the above scenario, then this 'error' is inevitable.
>>>>>>> So each time the VM is stopped we flush the caches into guest RAM.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> This error occurs in the following scenario:
>>>>>>>> Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC
>>>>>>>> to
>>>>>>>> the VM.
>>>>>>>>
>>>>>>>> The flow is as follows:
>>>>>>>>
>>>>>>>> QEMU:
>>>>>>>> vm_shutdown
>>>>>>>>        do_vm_stop(RUN_STATE_SHUTDOWN)
>>>>>>>>            vm_state_notify
>>>>>>>>                ...
>>>>>>>>                vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
>>>>>>>>                    kvm_device_access
>>>>>>>>
>>>>>>>> Kernel:
>>>>>>>>        vgic_its_save_tables_v0
>>>>>>>>            vgic_its_save_device_tables
>>>>>>>>                vgic_its_save_itt
>>>>>>>>
>>>>>>>> There is such a code in vgic_its_save_itt():
>>>>>>>>> /*
>>>>>>>>>     * If an LPI carries the HW bit, this means that this
>>>>>>>>>     * interrupt is controlled by GICv4, and we do not
>>>>>>>>>     * have direct access to that state without GICv4.1.
>>>>>>>>>     * Let's simply fail the save operation...
>>>>>>>>>     */
>>>>>>>>> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>>>>>>>>>              return -EACCES;
>>>>> Maybe we miss a piece of code for 4.0 that unsets the forwarding. The
>>>>> only way to handle this is to make sure  ite->irq->hw is not set on
>>>>> shutdown, no?
>>>> It's not going to return -EACCES here, if we unset the forwarding
>>>> first. But
>>>> this may cause problems in save/restore scenarios. The GICv4 architecture
>>>> doesn't give any guarantee that the pending state is written into the
>>>> pending table.
>>>>
>>>> Thanks,
>>>> Kunkun Jiang
>>>>> Thanks
>>>>>
>>>>> Eric
>>>>>>> As far as I understand you need a v4.1 to migrate,
>>>>>>> following Shenming's series
>>>>>>> [PATCH v5 0/6] KVM: arm64: Add VLPI migration support on GICv4.1
>>>>>>> Maybe sync with him?
>>>>>> Yes, GICv4 does not support live migrate.
>>>>>>
>>>>>> Thanks,
>>>>>> Kunkun Jiang
>>>>>>> Thanks
>>>>>>>
>>>>>>> Eric
>>>>>>>
>>>>>>>
>>>>>>>> Looking forward to your reply.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Kunkun Jiang
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>> .
>>>>> .
>
> .



