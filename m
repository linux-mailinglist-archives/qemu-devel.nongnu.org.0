Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ED463EA14
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:02:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0daC-0007mr-1h; Thu, 01 Dec 2022 02:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1p0da8-0007lL-Fu
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:02:04 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1p0da4-0003Ag-RB
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:02:04 -0500
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NN6Rh4r7NzmWLl;
 Thu,  1 Dec 2022 15:01:04 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Dec 2022 15:01:46 +0800
Subject: Re: regression: insmod module failed in VM with nvdimm on
To: Marc Zyngier <maz@kernel.org>
References: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
 <87r0xkubcp.wl-maz@kernel.org>
CC: <ardb@kernel.org>, <will@kernel.org>, <mark.rutland@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, chenxiang via
 <qemu-devel@nongnu.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>
Message-ID: <b27467dd-0d71-13ce-e3f9-6195371f2c9c@hisilicon.com>
Date: Thu, 1 Dec 2022 15:01:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <87r0xkubcp.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
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


在 2022/11/30 15:53, Marc Zyngier 写道:
> On Wed, 30 Nov 2022 02:52:35 +0000,
> "chenxiang (M)" <chenxiang66@hisilicon.com> wrote:
>> Hi,
>>
>> We boot the VM using following commands (with nvdimm on)  (qemu
>> version 6.1.50, kernel 6.0-r4):
> How relevant is the presence of the nvdimm? Do you observe the failure
> without this?

We didn't see the failure without it.

>> qemu-system-aarch64 -machine
>> virt,kernel_irqchip=on,gic-version=3,nvdimm=on  -kernel
>> /home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios
>> /root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m
>> 2G,maxmem=64G,slots=3 -smp 4 -append 'rdinit=init console=ttyAMA0
>> ealycon=pl0ll,0x90000000 pcie_ports=native pciehp.pciehp_debug=1'
>> -object memory-backend-ram,id=ram1,size=10G -device
>> nvdimm,id=dimm1,memdev=ram1  -device ioh3420,id=root_port1,chassis=1
>> -device vfio-pci,host=7d:01.0,id=net0,bus=root_port1
>>
>> Then in VM we insmod a module, vmalloc error occurs as follows (kernel
>> 5.19-rc4 is normal, and the issue is still on kernel 6.1-rc4):
>>
>> estuary:/$ insmod /lib/modules/$(uname -r)/hnae3.ko
>> [    8.186563] vmap allocation for size 20480 failed: use
>> vmalloc=<size> to increase size
> Have you tried increasing the vmalloc size to check that this is
> indeed the problem?
>
> [...]

I didn't increase the vmalloc size, but i check the vmall size and i 
think it is big enough when the issue occurs:

estuary:/$ insmod /lib/modules/$(uname -r)/hnae3.ko
[    4.879899] vmap allocation for size 20480 failed: use vmalloc=<size> 
to increase size
[    4.880643] insmod: vmalloc error: size 16384, vm_struct allocation 
failed, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
[    4.881802] CPU: 1 PID: 230 Comm: insmod Not tainted 6.1.0-rc4+ #21
[    4.882414] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 
02/06/2015
[    4.883082] Call trace:
[    4.883333]  dump_backtrace.part.0+0xc4/0xd0
[    4.883766]  show_stack+0x20/0x50
[    4.884091]  dump_stack_lvl+0x68/0x84
[    4.884450]  dump_stack+0x18/0x34
[    4.884778]  warn_alloc+0x11c/0x1bc
[    4.885124]  __vmalloc_node_range+0x50c/0x64c
[    4.885553]  module_alloc+0xf4/0x100
[    4.885902]  load_module+0x858/0x1e90
[    4.886265]  __do_sys_init_module+0x1c0/0x200
[    4.886699]  __arm64_sys_init_module+0x24/0x30
[    4.887147]  invoke_syscall+0x50/0x120
[    4.887516]  el0_svc_common.constprop.0+0x58/0x190
[    4.887993]  do_el0_svc+0x34/0xc0
[    4.888327]  el0_svc+0x2c/0xb4
[    4.888631]  el0t_64_sync_handler+0xb8/0xbc
[    4.889046]  el0t_64_sync+0x19c/0x1a0
[    4.889423] Mem-Info:
[    4.889639] active_anon:9679 inactive_anon:63094 isolated_anon:0
[    4.889639]  active_file:0 inactive_file:0 isolated_file:0
[    4.889639]  unevictable:0 dirty:0 writeback:0
[    4.889639]  slab_reclaimable:3322 slab_unreclaimable:3082
[    4.889639]  mapped:873 shmem:72569 pagetables:34
[    4.889639]  sec_pagetables:0 bounce:0
[    4.889639]  kernel_misc_reclaimable:0
[    4.889639]  free:416212 free_pcp:4414 free_cma:0
[    4.893362] Node 0 active_anon:38716kB inactive_anon:252376kB 
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB 
isolated(file):0kB mapped:3492kB dirty:0kB writeback:0kB shmem:290276kB 
shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 0kB writeback_tmp:0kB 
kernel_stack:1904kB pagetables:136kB sec_pagetables:0kB 
all_unreclaimable? no
[    4.896343] Node 0 DMA free:1664848kB boost:0kB min:22528kB 
low:28160kB high:33792kB reserved_highatomic:0KB active_anon:38716kB 
inactive_anon:252376kB active_file:0kB inactive_file:0kB unevictable:0kB 
writepending:0kB present:2097152kB managed:2010376kB mlocked:0kB 
bounce:0kB free_pcp:17704kB local_pcp:3668kB free_cma:0kB
[    4.899097] lowmem_reserve[]: 0 0 0 0 0
[    4.899466] Node 0 DMA: 2*4kB (UM) 1*8kB (M) 2*16kB (UM) 1*32kB (M) 
2*64kB (ME) 1*128kB (U) 2*256kB (ME) 2*512kB (M) 6*1024kB (UME) 5*2048kB 
(UM) 402*4096kB (M) = 1664848kB
[    4.900865] Node 0 hugepages_total=0 hugepages_free=0 
hugepages_surp=0 hugepages_size=1048576kB
[    4.901648] Node 0 hugepages_total=0 hugepages_free=0 
hugepages_surp=0 hugepages_size=32768kB
[    4.902526] Node 0 hugepages_total=0 hugepages_free=0 
hugepages_surp=0 hugepages_size=2048kB
[    4.903354] Node 0 hugepages_total=0 hugepages_free=0 
hugepages_surp=0 hugepages_size=64kB
[    4.904173] 72569 total pagecache pages
[    4.904524] 0 pages in swap cache
[    4.904831] Free swap  = 0kB
[    4.905109] Total swap = 0kB
[    4.905407] 524288 pages RAM
[    4.905696] 0 pages HighMem/MovableOnly
[    4.906085] 21694 pages reserved
[    4.906388] 0 pages hwpoisoned
insmod: can't insert '/lib/modules/6.1.0-rc4+/hnae3.ko': Cannot allocate 
memory
estuary:/$ insmod /lib/modules/$(uname -r)/hns3.ko
[    4.911599] vmap allocation for size 122880 failed: use 
vmalloc=<size> to increase size
insmod: can't insert '/lib/modules/6.1.0-rc4+/hns3.ko': Cannot allocate 
memory
estuary:/$ insmod /lib/modules/$(uname -r)/hclge.ko
[    4.917761] vmap allocation for size 319488 failed: use 
vmalloc=<size> to increase size
insmod: can't insert '/lib/modules/6.1.0-rc4+/hclge.ko': Cannot allocate 
memory
estuary:/$ insmod /lib/modules/$(uname -r)/hclgevf.ko
[    5.160299] vmap allocation for size 73728 failed: use vmalloc=<size> 
to increase size
insmod: can't insert '/lib/modules/6.1.0-rc4+/hclgevf.ko': Cannot 
allocate memory
estuary:/$
estuary:/$ cat /proc/meminfo
MemTotal:        2010376 kB
MemFree:         1664848 kB
MemAvailable:    1637744 kB
Buffers:               0 kB
Cached:           290276 kB
SwapCached:            0 kB
Active:            39456 kB
Inactive:         251628 kB
Active(anon):      39456 kB
Inactive(anon):   251628 kB
Active(file):          0 kB
Inactive(file):        0 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:           860 kB
Mapped:             3368 kB
Shmem:            290276 kB
KReclaimable:      13372 kB
Slab:              25732 kB
SReclaimable:      13372 kB
SUnreclaim:        12360 kB
KernelStack:        1872 kB
PageTables:          136 kB
SecPageTables:         0 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:     1005188 kB
Committed_AS:     292076 kB
VmallocTotal:   133143592960 kB
VmallocUsed:        2612 kB
VmallocChunk:          0 kB
Percpu:              672 kB
HardwareCorrupted:     0 kB
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
estuary:/$

>
>> We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr:
>> defer initialization to initcall where permitted").
> I guess you mean commit fc5a89f75d2a instead, right?

Right

>
>> Do you have any idea about the issue?
> I sort of suspect that the nvdimm gets vmap-ed and consumes a large
> portion of the vmalloc space, but you give very little information
> that could help here...
>
> 	M.
>


