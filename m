Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6960963CD8B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:54:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0DDb-0004oh-Ga; Tue, 29 Nov 2022 21:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1p0DDX-0004oG-Qk
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 21:52:59 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1p0DDP-00062j-Oa
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 21:52:59 -0500
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NMNyh4b1czmWKp;
 Wed, 30 Nov 2022 10:51:56 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 30 Nov 2022 10:52:36 +0800
To: <ardb@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, <will@kernel.org>, <mark.rutland@arm.com>, 
 <linux-arm-kernel@lists.infradead.org>, chenxiang via
 <qemu-devel@nongnu.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>
Subject: regression: insmod module failed in VM with nvdimm on
Message-ID: <e6a804de-a5f7-c551-ffba-e09d04e438fc@hisilicon.com>
Date: Wed, 30 Nov 2022 10:52:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

We boot the VM using following commands (with nvdimm on)  (qemu version 
6.1.50, kernel 6.0-r4):

qemu-system-aarch64 -machine 
virt,kernel_irqchip=on,gic-version=3,nvdimm=on  -kernel 
/home/kernel/Image -initrd /home/mini-rootfs/rootfs.cpio.gz -bios 
/root/QEMU_EFI.FD -cpu host -enable-kvm -net none -nographic -m 
2G,maxmem=64G,slots=3 -smp 4 -append 'rdinit=init console=ttyAMA0 
ealycon=pl0ll,0x90000000 pcie_ports=native pciehp.pciehp_debug=1' 
-object memory-backend-ram,id=ram1,size=10G -device 
nvdimm,id=dimm1,memdev=ram1  -device ioh3420,id=root_port1,chassis=1 
-device vfio-pci,host=7d:01.0,id=net0,bus=root_port1

Then in VM we insmod a module, vmalloc error occurs as follows (kernel 
5.19-rc4 is normal, and the issue is still on kernel 6.1-rc4):

estuary:/$ insmod /lib/modules/$(uname -r)/hnae3.ko
[    8.186563] vmap allocation for size 20480 failed: use vmalloc=<size> 
to increase size
[    8.187288] insmod: vmalloc error: size 16384, vm_struct allocation 
failed, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
[    8.188402] CPU: 1 PID: 235 Comm: insmod Not tainted 6.0.0-rc4+ #1
[    8.188958] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 
02/06/2015
[    8.189593] Call trace:
[    8.189825]  dump_backtrace.part.0+0xc4/0xd0
[    8.190245]  show_stack+0x24/0x40
[    8.190563]  dump_stack_lvl+0x68/0x84
[    8.190913]  dump_stack+0x18/0x34
[    8.191223]  warn_alloc+0x124/0x1b0
[    8.191555]  __vmalloc_node_range+0xe4/0x55c
[    8.191959]  module_alloc+0xf8/0x104
[    8.192305]  load_module+0x854/0x1e70
[    8.192655]  __do_sys_init_module+0x1e0/0x220
[    8.193075]  __arm64_sys_init_module+0x28/0x34
[    8.193489]  invoke_syscall+0x50/0x120
[    8.193841]  el0_svc_common.constprop.0+0x58/0x1a0
[    8.194296]  do_el0_svc+0x38/0xd0
[    8.194613]  el0_svc+0x2c/0xc0
[    8.194901]  el0t_64_sync_handler+0x1ac/0x1b0
[    8.195313]  el0t_64_sync+0x19c/0x1a0
[    8.195672] Mem-Info:
[    8.195872] active_anon:17641 inactive_anon:118549 isolated_anon:0
[    8.195872]  active_file:0 inactive_file:0 isolated_file:0
[    8.195872]  unevictable:0 dirty:0 writeback:0
[    8.195872]  slab_reclaimable:3439 slab_unreclaimable:3067
[    8.195872]  mapped:877 shmem:135976 pagetables:39 bounce:0
[    8.195872]  kernel_misc_reclaimable:0
[    8.195872]  free:353735 free_pcp:3210 free_cma:0
[    8.199119] Node 0 active_anon:70564kB inactive_anon:474196kB 
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB 
isolated(file):0kB mapped:3508kB dirty:0kB writeback:0kB shmem:543904kB 
shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 0kB writeback_tmp:0kB 
kernel_stack:1904kB pagetables:156kB all_unreclaimable? no
[    8.201683] Node 0 DMA free:1414940kB boost:0kB min:22528kB 
low:28160kB high:33792kB reserved_highatomic:0KB active_anon:70564kB 
inactive_anon:474196kB active_file:0kB inactive_file:0kB unevictable:0kB 
writepending:0kB present:2097152kB managed:2010444kB mlocked:0kB 
bounce:0kB free_pcp:12840kB local_pcp:2032kB free_cma:0kB
[    8.204158] lowmem_reserve[]: 0 0 0 0
[    8.204481] Node 0 DMA: 1*4kB (E) 1*8kB (U) 1*16kB (U) 2*32kB (UM) 
1*64kB (U) 1*128kB (U) 2*256kB (ME) 2*512kB (ME) 2*1024kB (M) 3*2048kB 
(UM) 343*4096kB (M) = 1414940kB
[    8.205881] Node 0 hugepages_total=0 hugepages_free=0 
hugepages_surp=0 hugepages_size=1048576kB
[    8.206644] Node 0 hugepages_total=0 hugepages_free=0 
hugepages_surp=0 hugepages_size=32768kB
[    8.207381] Node 0 hugepages_total=0 hugepages_free=0 
hugepages_surp=0 hugepages_size=2048kB
[    8.208111] Node 0 hugepages_total=0 hugepages_free=0 
hugepages_surp=0 hugepages_size=64kB
[    8.208826] 135976 total pagecache pages
[    8.209195] 0 pages in swap cache
[    8.209484] Free swap  = 0kB
[    8.209733] Total swap = 0kB
[    8.209989] 524288 pages RAM
[    8.210239] 0 pages HighMem/MovableOnly
[    8.210571] 21677 pages reserved
[    8.210852] 0 pages hwpoisoned
insmod: can't insert '/lib/modules/6.0.0-rc4+/hnae3.ko': Cannot allocate 
memory

We git bisect the code, and find the patch c5a89f75d2a ("arm64: kaslr: 
defer initialization to initcall where permitted").

Do you have any idea about the issue?


Best Regards,

Xiang Chen


