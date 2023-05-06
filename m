Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673C6F90DD
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 11:27:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvEAx-0006IB-Rg; Sat, 06 May 2023 05:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pvEAt-0006Ho-Ku
 for qemu-devel@nongnu.org; Sat, 06 May 2023 05:25:55 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pvEAp-00042Y-SY
 for qemu-devel@nongnu.org; Sat, 06 May 2023 05:25:55 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8Bxa+oXHVZkXLcFAA--.9275S3;
 Sat, 06 May 2023 17:25:43 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxRrUUHVZkS1lNAA--.10261S3; 
 Sat, 06 May 2023 17:25:40 +0800 (CST)
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
From: Song Gao <gaosong@loongson.cn>
Message-ID: <c01a2b87-27be-e92a-3a5b-d561eadbc516@loongson.cn>
Date: Sat, 6 May 2023 17:25:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b151ecf7-0544-86ac-a182-1112a4dd7dca@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxRrUUHVZkS1lNAA--.10261S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3tFWrXF43Aw47Wr4UCFyrtFb_yoWDAF45pF
 4kJF15CrWFyr1kZr42qwn7JFy5tr1kK3Wqgr9ru3WvkrsFqr12qF17XryYgr1UJr40kr1Y
 gFyjqr4I93W3Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I
 8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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

  Hi Alexander

在 2023/4/28 下午5:14, Thomas Huth 写道:
> On 28/04/2023 11.11, Alexander Bulekov wrote:
>> On 230428 1015, Thomas Huth wrote:
>>> On 28/04/2023 10.12, Daniel P. Berrangé wrote:
>>>> On Thu, Apr 27, 2023 at 05:10:06PM -0400, Alexander Bulekov wrote:
>>>>> Add a flag to the DeviceState, when a device is engaged in 
>>>>> PIO/MMIO/DMA.
>>>>> This flag is set/checked prior to calling a device's MemoryRegion
>>>>> handlers, and set when device code initiates DMA.  The purpose of 
>>>>> this
>>>>> flag is to prevent two types of DMA-based reentrancy issues:
>>>>>
>>>>> 1.) mmio -> dma -> mmio case
>>>>> 2.) bh -> dma write -> mmio case
>>>>>
>>>>> These issues have led to problems such as stack-exhaustion and
>>>>> use-after-frees.
>>>>>
>>>>> Summary of the problem from Peter Maydell:
>>>>> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com 
>>>>>
>>>>>
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
>>>>> Resolves: CVE-2023-0330
>>>>>
>>>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>    include/exec/memory.h  |  5 +++++
>>>>>    include/hw/qdev-core.h |  7 +++++++
>>>>>    softmmu/memory.c       | 16 ++++++++++++++++
>>>>>    3 files changed, 28 insertions(+)
>>>>>
>>>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>>>> index 15ade918ba..e45ce6061f 100644
>>>>> --- a/include/exec/memory.h
>>>>> +++ b/include/exec/memory.h
>>>>> @@ -767,6 +767,8 @@ struct MemoryRegion {
>>>>>        bool is_iommu;
>>>>>        RAMBlock *ram_block;
>>>>>        Object *owner;
>>>>> +    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR 
>>>>> access hotpath */
>>>>> +    DeviceState *dev;
>>>>>        const MemoryRegionOps *ops;
>>>>>        void *opaque;
>>>>> @@ -791,6 +793,9 @@ struct MemoryRegion {
>>>>>        unsigned ioeventfd_nb;
>>>>>        MemoryRegionIoeventfd *ioeventfds;
>>>>>        RamDiscardManager *rdm; /* Only for RAM */
>>>>> +
>>>>> +    /* For devices designed to perform re-entrant IO into their 
>>>>> own IO MRs */
>>>>> +    bool disable_reentrancy_guard;
>>>>>    };
>>>>>    struct IOMMUMemoryRegion {
>>>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>>>> index bd50ad5ee1..7623703943 100644
>>>>> --- a/include/hw/qdev-core.h
>>>>> +++ b/include/hw/qdev-core.h
>>>>> @@ -162,6 +162,10 @@ struct NamedClockList {
>>>>>        QLIST_ENTRY(NamedClockList) node;
>>>>>    };
>>>>> +typedef struct {
>>>>> +    bool engaged_in_io;
>>>>> +} MemReentrancyGuard;
>>>>> +
>>>>>    /**
>>>>>     * DeviceState:
>>>>>     * @realized: Indicates whether the device has been fully 
>>>>> constructed.
>>>>> @@ -194,6 +198,9 @@ struct DeviceState {
>>>>>        int alias_required_for_version;
>>>>>        ResettableState reset;
>>>>>        GSList *unplug_blockers;
>>>>> +
>>>>> +    /* Is the device currently in mmio/pio/dma? Used to prevent 
>>>>> re-entrancy */
>>>>> +    MemReentrancyGuard mem_reentrancy_guard;
>>>>>    };
>>>>>    struct DeviceListener {
>>>>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>>>>> index b1a6cae6f5..fe23f0e5ce 100644
>>>>> --- a/softmmu/memory.c
>>>>> +++ b/softmmu/memory.c
>>>>> @@ -542,6 +542,18 @@ static MemTxResult 
>>>>> access_with_adjusted_size(hwaddr addr,
>>>>>            access_size_max = 4;
>>>>>        }
>>>>> +    /* Do not allow more than one simultaneous access to a 
>>>>> device's IO Regions */
>>>>> +    if (mr->dev && !mr->disable_reentrancy_guard &&
>>>>> +        !mr->ram_device && !mr->ram && !mr->rom_device && 
>>>>> !mr->readonly) {
>>>>> +        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
>>>>> +            warn_report("Blocked re-entrant IO on "
>>>>> +                    "MemoryRegion: %s at addr: 0x%" HWADDR_PRIX,
>>>>> +                    memory_region_name(mr), addr);
>>>>> +            return MEMTX_ACCESS_ERROR;
>>>>
>>>> If we issue this warn_report on every invalid memory access, is this
>>>> going to become a denial of service by flooding logs, or is the
>>>> return MEMTX_ACCESS_ERROR, sufficient to ensure this is only printed
>>>> *once* in the lifetime of the QEMU process ?
>>>
>>> Maybe it's better to use warn_report_once() here instead?
>>
>> Sounds good - should I respin the series to change this?
>
> Not necessary, I've got v10 already queued, I'll fix it up there
>
>  Thomas
>
This patch causes the loongarch virtual machine to fail to start the 
slave cpu.

     ./build/qemu-system-loongarch64 -machine virt -m 8G -cpu la464 \
              -smp 4 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd 
ramdisk   \
                -serial stdio   -monitor 
telnet:localhost:4495,server,nowait  \
                -append "root=/dev/ram rdinit=/sbin/init 
console=ttyS0,115200"   --nographic


....
qemu-system-loongarch64: warning: Blocked re-entrant IO on MemoryRegion: 
loongarch_ipi_iocsr at addr: 0x24

....
[    0.059284] smp: Bringing up secondary CPUs ...
[    0.062540] Booting CPU#1...
[    5.204340] CPU1: failed to start
[    5.211435] Booting CPU#2...
[   10.465762] CPU2: failed to start
[   10.467757] Booting CPU#3...
[   15.805430] CPU3: failed to start
[   15.805980] smp: Brought up 1 node, 1 CPU
[   15.818832] devtmpfs: initialized
[   15.830287] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 7645041785100000 ns
[   15.830429] futex hash table entries: 1024 (order: 2, 65536 bytes, 
linear)
[   15.840470] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[   15.845424] audit: initializing netlink subsys (disabled)
...

gdb
(gdb) n
qemu-system-loongarch64: warning: Blocked re-entrant IO on MemoryRegion: 
loongarch_ipi_iocsr at addr: 0x24
552                return MEMTX_ACCESS_ERROR;
(gdb) bt
#0  0x0000555555ae93aa in access_with_adjusted_size
     (addr=36, value=0x7fffd299f988, size=4, access_size_min=<optimized 
out>, access_size_max=<optimized out>, access_fn=
     0x555555ae98f0 <memory_region_write_accessor>, mr=0x555556e3a740, 
attrs=...) at ../softmmu/memory.c:552
#1  0x0000555555ae962c in memory_region_dispatch_write 
(mr=0x555556e3a740, addr=36, data=<optimized out>, op=<optimized out>, 
attrs=...)
     at ../softmmu/memory.c:1531
#2  0x0000555555af5739 in address_space_stl_internal 
(endian=DEVICE_NATIVE_ENDIAN, result=0x0, attrs=..., val=0, 
addr=<optimized out>, as=0x5555567b4bb8)
     at 
/home3/gaosong/code/vec/github/send/v2/qemu/include/exec/memory.h:2997
#3  0x0000555555af5739 in address_space_stl (as=0x5555567b4bb8, 
addr=<optimized out>, val=0, attrs=..., result=0x0)
     at /home3/gaosong/code/vec/github/send/v2/qemu/memory_ldst.c.inc:350
#4  0x0000555555ae99e8 in memory_region_write_accessor
     (mr=0x555556e3ab80, addr=0, value=<optimized out>, size=8, 
shift=<optimized out>, mask=<optimized out>, attrs=...) at 
../softmmu/memory.c:493
#5  0x0000555555ae92ae in access_with_adjusted_size
     (addr=0, value=0x7fffd299fb88, size=8, access_size_min=<optimized 
out>, access_size_max=<optimized out>, access_fn=
     0x555555ae98f0 <memory_region_write_accessor>, mr=0x555556e3ab80, 
attrs=...) at ../softmmu/memory.c:567
#6  0x0000555555ae962c in memory_region_dispatch_write 
(mr=0x555556e3ab80, addr=0, data=<optimized out>, op=<optimized out>, 
attrs=...) at ../softmmu/memory.c:1531
#7  0x0000555555af2591 in address_space_stq_internal (as=<optimized 
out>, addr=<optimized out>, val=2147483652, attrs=..., result=0x0, 
endian=DEVICE_NATIVE_ENDIAN)
     at 
/home3/gaosong/code/vec/github/send/v2/qemu/include/exec/memory.h:2997
#8  0x00007fff8d922923 in code_gen_buffer ()
#9  0x0000555555b4b9e0 in cpu_tb_exec (tb_exit=<synthetic pointer>, 
itb=<optimized out>, cpu=0x5555567a5d00) at ../accel/tcg/cpu-exec.c:460
#10 0x0000555555b4b9e0 in cpu_loop_exec_tb (tb_exit=<synthetic pointer>, 
last_tb=<synthetic pointer>, pc=<optimized out>, tb=<optimized out>, 
cpu=0x5555567a5d00)
     at ../accel/tcg/cpu-exec.c:893
#11 0x0000555555b4b9e0 in cpu_exec_loop (cpu=0x5555567a5d00, 
sc=<optimized out>) at ../accel/tcg/cpu-exec.c:1013
#12 0x0000555555b4c67d in cpu_exec_setjmp (cpu=0x5555567a5d00, 
sc=0x7fffd29a0220) at ../accel/tcg/cpu-exec.c:1043
#13 0x0000555555b4c746 in cpu_exec (cpu=0x5555567a5d00) at 
../accel/tcg/cpu-exec.c:1069
#14 0x0000555555b634bf in tcg_cpus_exec (cpu=0x5555567a5d00) at 
../accel/tcg/tcg-accel-ops.c:81
#15 0x0000555555b63613 in mttcg_cpu_thread_fn (arg=0x5555567a5d00) at 
../accel/tcg/tcg-accel-ops-mttcg.c:95
#16 0x0000555555cdefba in qemu_thread_start (args=<optimized out>) at 
../util/qemu-thread-posix.c:541
#17 0x00007fffefcb717a in start_thread () at /lib64/libpthread.so.0
#18 0x00007fffef9e6dc3 in clone () at /lib64/libc.so.6

About LoongArch:
  - docs/system/loongarch/virt.rst

Thanks.
Song Gao


