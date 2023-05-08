Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138376FB0E0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:05:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0Wl-0000rx-VH; Mon, 08 May 2023 09:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pw0We-0000rh-EE
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:03:36 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pw0WY-0007Xr-6c
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:03:36 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8BxJukX81hkO5UGAA--.10831S3;
 Mon, 08 May 2023 21:03:19 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxKL0R81hkblJRAA--.15285S3; 
 Mon, 08 May 2023 21:03:14 +0800 (CST)
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
To: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, maobibo@loongson.cn,
 Tianrui Zhao <zhaotianrui@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-2-alxndr@bu.edu> <ZEt/3RwtL/jePTTv@redhat.com>
 <828514c6-44f0-32f0-1eb1-a49f21617585@redhat.com>
 <20230428091159.haydefdtq4m6z2tz@mozz.bu.edu>
 <b151ecf7-0544-86ac-a182-1112a4dd7dca@redhat.com>
 <c01a2b87-27be-e92a-3a5b-d561eadbc516@loongson.cn>
 <981cdcd7-7326-08f0-9882-e66840175205@redhat.com>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <c4919eb6-74f1-7699-f924-6917cdf435bb@loongson.cn>
Date: Mon, 8 May 2023 21:03:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <981cdcd7-7326-08f0-9882-e66840175205@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxKL0R81hkblJRAA--.15285S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKr4rtFWDur4rKFWxtr1DJrb_yoW3GF48pF
 4kAFy5KrW5Kr1kJr4jqr1UGFyUtr18G3WUWr17JF10grsrtr1jqr47Xr1YgryUJr48Jr1U
 XryUXr17uF15Jr7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.802,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi, Thomas

在 2023/5/8 下午5:33, Thomas Huth 写道:
> On 06/05/2023 11.25, Song Gao wrote:
>>   Hi Alexander
>>
>> 在 2023/4/28 下午5:14, Thomas Huth 写道:
>>> On 28/04/2023 11.11, Alexander Bulekov wrote:
>>>> On 230428 1015, Thomas Huth wrote:
>>>>> On 28/04/2023 10.12, Daniel P. Berrangé wrote:
>>>>>> On Thu, Apr 27, 2023 at 05:10:06PM -0400, Alexander Bulekov wrote:
>>>>>>> Add a flag to the DeviceState, when a device is engaged in 
>>>>>>> PIO/MMIO/DMA.
>>>>>>> This flag is set/checked prior to calling a device's MemoryRegion
>>>>>>> handlers, and set when device code initiates DMA.  The purpose 
>>>>>>> of this
>>>>>>> flag is to prevent two types of DMA-based reentrancy issues:
>>>>>>>
>>>>>>> 1.) mmio -> dma -> mmio case
>>>>>>> 2.) bh -> dma write -> mmio case
>>>>>>>
>>>>>>> These issues have led to problems such as stack-exhaustion and
>>>>>>> use-after-frees.
>>>>>>>
>>>>>>> Summary of the problem from Peter Maydell:
>>>>>>> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com 
>>>>>>>
>>>>>>>
>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
>>>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
>>>>>>> Resolves: CVE-2023-0330
>>>>>>>
>>>>>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>>>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>>>> ---
>>>>>>>    include/exec/memory.h  |  5 +++++
>>>>>>>    include/hw/qdev-core.h |  7 +++++++
>>>>>>>    softmmu/memory.c       | 16 ++++++++++++++++
>>>>>>>    3 files changed, 28 insertions(+)
>>>>>>>
>>>>>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>>>>>> index 15ade918ba..e45ce6061f 100644
>>>>>>> --- a/include/exec/memory.h
>>>>>>> +++ b/include/exec/memory.h
>>>>>>> @@ -767,6 +767,8 @@ struct MemoryRegion {
>>>>>>>        bool is_iommu;
>>>>>>>        RAMBlock *ram_block;
>>>>>>>        Object *owner;
>>>>>>> +    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR 
>>>>>>> access hotpath */
>>>>>>> +    DeviceState *dev;
>>>>>>>        const MemoryRegionOps *ops;
>>>>>>>        void *opaque;
>>>>>>> @@ -791,6 +793,9 @@ struct MemoryRegion {
>>>>>>>        unsigned ioeventfd_nb;
>>>>>>>        MemoryRegionIoeventfd *ioeventfds;
>>>>>>>        RamDiscardManager *rdm; /* Only for RAM */
>>>>>>> +
>>>>>>> +    /* For devices designed to perform re-entrant IO into their 
>>>>>>> own IO MRs */
>>>>>>> +    bool disable_reentrancy_guard;
>>>>>>>    };
>>>>>>>    struct IOMMUMemoryRegion {
>>>>>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>>>>>> index bd50ad5ee1..7623703943 100644
>>>>>>> --- a/include/hw/qdev-core.h
>>>>>>> +++ b/include/hw/qdev-core.h
>>>>>>> @@ -162,6 +162,10 @@ struct NamedClockList {
>>>>>>>        QLIST_ENTRY(NamedClockList) node;
>>>>>>>    };
>>>>>>> +typedef struct {
>>>>>>> +    bool engaged_in_io;
>>>>>>> +} MemReentrancyGuard;
>>>>>>> +
>>>>>>>    /**
>>>>>>>     * DeviceState:
>>>>>>>     * @realized: Indicates whether the device has been fully 
>>>>>>> constructed.
>>>>>>> @@ -194,6 +198,9 @@ struct DeviceState {
>>>>>>>        int alias_required_for_version;
>>>>>>>        ResettableState reset;
>>>>>>>        GSList *unplug_blockers;
>>>>>>> +
>>>>>>> +    /* Is the device currently in mmio/pio/dma? Used to prevent 
>>>>>>> re-entrancy */
>>>>>>> +    MemReentrancyGuard mem_reentrancy_guard;
>>>>>>>    };
>>>>>>>    struct DeviceListener {
>>>>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>>>>> index b1a6cae6f5..fe23f0e5ce 100644
>>>>>>> --- a/softmmu/memory.c
>>>>>>> +++ b/softmmu/memory.c
>>>>>>> @@ -542,6 +542,18 @@ static MemTxResult 
>>>>>>> access_with_adjusted_size(hwaddr addr,
>>>>>>>            access_size_max = 4;
>>>>>>>        }
>>>>>>> +    /* Do not allow more than one simultaneous access to a 
>>>>>>> device's IO Regions */
>>>>>>> +    if (mr->dev && !mr->disable_reentrancy_guard &&
>>>>>>> +        !mr->ram_device && !mr->ram && !mr->rom_device && 
>>>>>>> !mr->readonly) {
>>>>>>> +        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
>>>>>>> +            warn_report("Blocked re-entrant IO on "
>>>>>>> +                    "MemoryRegion: %s at addr: 0x%" HWADDR_PRIX,
>>>>>>> +                    memory_region_name(mr), addr);
>>>>>>> +            return MEMTX_ACCESS_ERROR;
>>>>>>
>>>>>> If we issue this warn_report on every invalid memory access, is this
>>>>>> going to become a denial of service by flooding logs, or is the
>>>>>> return MEMTX_ACCESS_ERROR, sufficient to ensure this is only printed
>>>>>> *once* in the lifetime of the QEMU process ?
>>>>>
>>>>> Maybe it's better to use warn_report_once() here instead?
>>>>
>>>> Sounds good - should I respin the series to change this?
>>>
>>> Not necessary, I've got v10 already queued, I'll fix it up there
>>>
>>>  Thomas
>>>
>> This patch causes the loongarch virtual machine to fail to start the 
>> slave cpu.
>>
>>      ./build/qemu-system-loongarch64 -machine virt -m 8G -cpu la464 \
>>               -smp 4 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd 
>> ramdisk   \
>>                 -serial stdio   -monitor 
>> telnet:localhost:4495,server,nowait  \
>>                 -append "root=/dev/ram rdinit=/sbin/init 
>> console=ttyS0,115200"   --nographic
>>
>>
>> ....
>> qemu-system-loongarch64: warning: Blocked re-entrant IO on 
>> MemoryRegion: loongarch_ipi_iocsr at addr: 0x24
>
> Oh, another spot that needs special handling ... I see Alexander 
> already sent a patch (thanks!), but anyway, this is a good indication 
> that we're missing some test coverage in the CI.
>
> Are there any loongarch kernel images available for public download 
> somewhere? If so, we really should add an avocado regression test for 
> this - since as far as I can see, we don't have any  tests for 
> loongarch in tests/avocado yet?
>
we can get  some binarys  at:
https://github.com/yangxiaojuan-loongson/qemu-binary

I'm not sure that avacodo testing can be done using just the kernel.

Is a full loongarch system required?
if  yes,  unfortunately, there is not yet a well-developed loongarch  
system.
And we are moving forward with loongarch support for debian systems.

There are also systems that already support loongarch, e.g archlinux.
https://mirrors.wsyu.edu.cn/loongarch/archlinux/images/

But I briefly tested that it doesn't work in the latest qemu.   I've 
already pushed the maintainer to update the system.

Thanks.
Song Gao


