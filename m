Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F367673D08
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:05:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWTd-0001s7-Hq; Thu, 19 Jan 2023 10:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIWTK-0001mQ-CE
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:05:00 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pIWTH-0004ys-4r
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:04:58 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NyQrl6txpz6J9b7;
 Thu, 19 Jan 2023 23:04:23 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Jan
 2023 15:04:50 +0000
Date: Thu, 19 Jan 2023 15:04:49 +0000
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Gregory Price
 <gregory.price@memverge.com>, Lukas Wunner <lukas@wunner.de>, "Michael
 Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: cxl nvdimm Potential probe ordering issues.
Message-ID: <20230119150449.000037f2@huawei.com>
In-Reply-To: <20230119124244.000015b3@Huawei.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <Y8AppXP+eP9cEz+i@memverge.com>
 <20230112172130.0000391b@Huawei.com>
 <Y8CNw/fZT5fZJZcK@memverge.com>
 <20230113091213.00002146@Huawei.com>
 <Y8Foj/12QNl0C96o@memverge.com>
 <20230113144026.000001fb@Huawei.com>
 <20230113144511.00001207@Huawei.com>
 <20230113151206.GA20583@wunner.de> <Y8hG4OyJL7l9oD2f@memverge.com>
 <Y8hJKcy1993SFLLJ@memverge.com>
 <20230119124244.000015b3@Huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 19 Jan 2023 12:42:44 +0000
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> On Wed, 18 Jan 2023 14:31:53 -0500
> Gregory Price <gregory.price@memverge.com> wrote:
> 
> > I apparently forgot an intro lol
> > 
> > I tested the DOE linux branch with the 2023-1-11 QEMU branch with both
> > volatile, non-volatile, and "legacy" (pre-my-patch) non-volatile mode.
> > 
> > 1) *In volatile mode, there are no stack traces present (during boot*)
> > 
> > On Wed, Jan 18, 2023 at 02:22:08PM -0500, Gregory Price wrote:  
> > > 
> > > 1) No stack traces present
> > > 2) Device usage appears to work, but cxl-cli fails to create a region, i
> > > haven't checked why yet (also tried ndctl-75, same results)
> > > 3) There seems to be some other regression with the cxl_pmem_init
> > > routine, because I get a stack trace in this setup regardless of whether
> > > I apply the type-3 device commit.
> > > 
> > > 
> > > All tests below with the previously posted DOE linux branch.
> > > Base QEMU branch was Jonathan's 2023-1-11
> > > 
> > > 
> > > DOE Branch - 2023-1-11 (HEAD) (all commits)
> > > 
> > > QEMU Config:
> > > sudo /opt/qemu-cxl/bin/qemu-system-x86_64 \
> > > -drive file=/var/lib/libvirt/images/cxl.qcow2,format=qcow2,index=0,media=disk,id=hd \
> > > -m 3G,slots=4,maxmem=8G \
> > > -smp 4 \
> > > -machine type=q35,accel=kvm,cxl=on \
> > > -enable-kvm \
> > > -nographic \
> > > -object memory-backend-ram,id=mem0,size=1G,share=on \
> > > -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 \
> > > -device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 \
> > > -device cxl-type3,bus=rp0,volatile-memdev=mem0,id=cxl-mem0 \
> > > -M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=1G
> > > 
> > > Result:  This worked, but cxl-cli could not create a region (will look
> > > into this further later).
> > > 
> > > 
> > > 
> > > 
> > > When running with a persistent memory configuration, I'm seeing a
> > > kernel stack trace on cxl_pmem_init
> > > 
> > > Config:
> > > sudo /opt/qemu-cxl/bin/qemu-system-x86_64 \
> > > -drive file=/var/lib/libvirt/images/cxl.qcow2,format=qcow2,index=0,media=disk,id=hd \
> > > -m 3G,slots=4,maxmem=4G \
> > > -smp 4 \
> > > -machine type=q35,accel=kvm,cxl=on \
> > > -enable-kvm \
> > > -nographic \
> > > -device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 \
> > > -device cxl-rp,port=0,id=rp0,bus=cxl.0,chassis=0,slot=0 \
> > > -object memory-backend-file,id=cxl-mem0,mem-path=/tmp/mem0,size=1G \
> > > -object memory-backend-file,id=cxl-lsa0,mem-path=/tmp/lsa0,size=1G \
> > > -device cxl-type3,bus=rp0,persistent-memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0 \
> > > -M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=1G
> > > 
> > > 
> > > [   62.167518] BUG: kernel NULL pointer dereference, address: 00000000000004c0
> > > [   62.185069] #PF: supervisor read access in kernel mode
> > > [   62.198502] #PF: error_code(0x0000) - not-present page
> > > [   62.211019] PGD 0 P4D 0
> > > [   62.220521] Oops: 0000 [#1] PREEMPT SMP PTI
> > > [   62.233457] CPU: 3 PID: 558 Comm: systemd-udevd Not tainted 6.2.0-rc1+ #1
> > > [   62.252886] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
> > > [   62.258432] Adding 2939900k swap on /dev/zram0.  Priority:100 extents:1 across:2939900k SSDscFS
> > > [   62.285513] RIP: 0010:cxl_nvdimm_probe+0x8d/0x130 [cxl_pmem]
> > > [   62.285529] Code: 85 c0 0f 85 90 00 00 00 f0 80 0c 24 40 f0 80 4c 24 08 10 f0 80 4c 24 08 20 f0 80 4c 24 08 40 49 8d 84 24 b8 04 00 00 4c 89 0
> > > [   62.285531] RSP: 0018:ffffacff0141fc38 EFLAGS: 00010202
> > > [   62.285534] RAX: ffff97a8a37b84b8 RBX: ffff97a8a37b8000 RCX: 0000000000000000
> > > [   62.285536] RDX: 0000000000000001 RSI: ffff97a8a37b8000 RDI: 00000000ffffffff
> > > [   62.285537] RBP: ffff97a8a37b8000 R08: 0000000000000001 R09: 0000000000000001
> > > [   62.285538] R10: 0000000000000001 R11: 0000000000000000 R12: ffff97a8a37b8000
> > > [   62.285539] R13: ffff97a982c3dc28 R14: 0000000000000000 R15: 0000000000000000
> > > [   62.285541] FS:  00007f2619829580(0000) GS:ffff97a9bca00000(0000) knlGS:0000000000000000
> > > [   62.285542] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   62.285544] CR2: 00000000000004c0 CR3: 00000001056a8000 CR4: 00000000000006e0
> > > [   62.285653] Call Trace:
> > > [   62.285656]  <TASK>
> > > [   62.285660]  cxl_bus_probe+0x17/0x50
> > > [   62.285691]  really_probe+0xde/0x380
> > > [   62.285695]  ? pm_runtime_barrier+0x50/0x90
> > > [   62.285700]  __driver_probe_device+0x78/0x170
> > > [   62.285846]  driver_probe_device+0x1f/0x90
> > > [   62.285850]  __driver_attach+0xd2/0x1c0
> > > [   62.285853]  ? __pfx___driver_attach+0x10/0x10
> > > [   62.285856]  bus_for_each_dev+0x76/0xa0
> > > [   62.285860]  bus_add_driver+0x1b1/0x200
> > > [   62.285863]  driver_register+0x89/0xe0
> > > [   62.285868]  ? __pfx_init_module+0x10/0x10 [cxl_pmem]
> > > [   62.285874]  cxl_pmem_init+0x50/0xff0 [cxl_pmem]
> > > [   62.285880]  do_one_initcall+0x6e/0x330
> > > [   62.285888]  do_init_module+0x4a/0x200
> > > [   62.285892]  __do_sys_finit_module+0x93/0xf0
> > > [   62.285899]  do_syscall_64+0x5b/0x80
> > > [   62.285904]  ? do_syscall_64+0x67/0x80
> > > [   62.285906]  ? asm_exc_page_fault+0x22/0x30
> > > [   62.285910]  ? lockdep_hardirqs_on+0x7d/0x100
> > > [   62.285914]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> > > [   62.285917] RIP: 0033:0x7f2619b0afbd
> > > [   62.285920] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 8
> > > [   62.285922] RSP: 002b:00007ffcc516bf58 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> > > [   62.285924] RAX: ffffffffffffffda RBX: 00005557c0dcaa60 RCX: 00007f2619b0afbd
> > > [   62.285925] RDX: 0000000000000000 RSI: 00007f261a18743c RDI: 0000000000000006
> > > [   62.285926] RBP: 00007f261a18743c R08: 0000000000000000 R09: 00007f261a17bb52
> > > [   62.285927] R10: 0000000000000006 R11: 0000000000000246 R12: 0000000000020000
> > > [   62.285928] R13: 00005557c0dbbce0 R14: 0000000000000000 R15: 00005557c0dc18a0
> > > [   62.285932]  </TASK>
> > > [   62.285933] Modules linked in: cxl_pmem(+) snd_pcm libnvdimm snd_timer snd joydev bochs cxl_mem drm_vram_helper parport_pc soundcore drm_ttm_g
> > > [   62.285954] CR2: 00000000000004c0
> > > [   62.288385] ---[ end trace 0000000000000000 ]---
> > > [   63.203514] RIP: 0010:cxl_nvdimm_probe+0x8d/0x130 [cxl_pmem]
> > > [   63.203562] Code: 85 c0 0f 85 90 00 00 00 f0 80 0c 24 40 f0 80 4c 24 08 10 f0 80 4c 24 08 20 f0 80 4c 24 08 40 49 8d 84 24 b8 04 00 00 4c 89 0
> > > [   63.203565] RSP: 0018:ffffacff0141fc38 EFLAGS: 00010202
> > > [   63.203570] RAX: ffff97a8a37b84b8 RBX: ffff97a8a37b8000 RCX: 0000000000000000
> > > [   63.203572] RDX: 0000000000000001 RSI: ffff97a8a37b8000 RDI: 00000000ffffffff
> > > [   63.203574] RBP: ffff97a8a37b8000 R08: 0000000000000001 R09: 0000000000000001
> > > [   63.203576] R10: 0000000000000001 R11: 0000000000000000 R12: ffff97a8a37b8000
> > > [   63.203577] R13: ffff97a982c3dc28 R14: 0000000000000000 R15: 0000000000000000
> > > [   63.203580] FS:  00007f2619829580(0000) GS:ffff97a9bca00000(0000) knlGS:0000000000000000
> > > [   63.203583] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   63.203585] CR2: 00000000000004c0 CR3: 00000001056a8000 CR4: 00000000000006e0  
> 
> Possibly replicated.  What I did was stop cxl_pmem.ko being probed automatically and
> added it manually later. Trace that results is certainly similar to yours.
> 
> Now the MODULE_SOFTDEP() in drivers/cxl/acpi.c should stop that happening
> assuming you are letting autoloading run.
> I wonder if there is a path in which it doesn't?

Gregory, would you mind checking if
cxl_nvb is NULL here...
https://elixir.bootlin.com/linux/v6.2-rc4/source/drivers/cxl/pmem.c#L67
(printk before it is used should work).

Might also be worth checking cxl_nvd and cxl_ds
but my guess is cxl_nvb is our problem (it is when I deliberate change
the load order).

Jonathan


> 
> Dan, any thoughts?
> 
> There is another race that I can trigger by repeatedly injecting errors and
> causing resets, but the trace for that is very different and
> points at cxl_pmem_ctl() called via nvdimm_probe(). I was going to try
> and pin that one down a little more before posting a report but might
> as well muddy the waters :)
> 
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000358
>  Mem abort info:
>  ESR = 0x0000000096000004
>  EC = 0x25: DABT (current EL), IL = 32 bits
>  SET = 0, FnV = 0
>  EA = 0, S1PTW = 0
>  FSC = 0x04: level 0 translation fault
>  Data abort info:
>  ISV = 0, ISS = 0x00000004
>  CM = 0, WnR = 0
>  user pgtable: 4k pages, 48-bit VAs, pgdp=0000000102e12000
>  [0000000000000358] pgd=0000000000000000, p4d=0000000000000000
>  Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>  Modules linked in: cxl_mem cxl_port cxl_acpi cxl_pmem cxl_pci cxl_core
>  CPU: 0 PID: 236 Comm: kworker/u8:3 Not tainted 6.2.0-rc3+ #598
>  Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
>  Workqueue: events_unbound async_run_entry_fn
>  pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>  pc : cxl_pmem_ctl+0x74/0x244 [cxl_pmem]
>  lr : cxl_pmem_ctl+0x60/0x244 [cxl_pmem]
>  sp : ffff8000089239d0
>  x29: ffff8000089239d0 x28: 0000000000000000 x27: 0000000000000000
>  x26: ffffcd4f6b263000 x25: ffffcd4f6a25d9c8 x24: 0000000000000000
>  kernel: Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>  x23: 0000000000000000 x22: 000000000000000c x21: ffff0000c5b95400
>  x20: ffff0000c0d9ce0c x19: 0000000000000004 x18: 0000000000000000
>  x17: 0000000000000000 x16: ffffcd4f698a5fa0 x15: 0000000000000000
>  x14: 0000000000000002 x13: 0000000000000000 x12: 0000000000000000
>  x11: 0000000000000001 x10: 409e5dd45a38ef72 x9 : ffffcd4f607531f0
>  x8 : ffff0000c0d9ce80 x7 : 0000000000000000 x6 : 0000000000000000
>  x5 : ffff800008923a84 x4 : 000000000000000c x3 : ffff800008923a10
>  x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000070
>  Call trace:
>   cxl_pmem_ctl+0x74/0x244 [cxl_pmem]
>   nvdimm_init_nsarea+0xb8/0xdc
>   nvdimm_probe+0xc0/0x1d0
>   nvdimm_bus_probe+0x90/0x200
>   really_probe+0xc8/0x3e0
>   __driver_probe_device+0x84/0x190
>   driver_probe_device+0x44/0x120
>   __device_attach_driver+0xc4/0x160
>   bus_for_each_drv+0x80/0xe0
>   __device_attach+0xa4/0x1cc
>   device_initial_probe+0x1c/0x2c
>   bus_probe_device+0xa4/0xb0
>   device_add+0x404/0x920
>   nd_async_device_register+0x20/0x70
>   async_run_entry_fn+0x3c/0x154
>   process_one_work+0x200/0x474
>   worker_thread+0x74/0x43c
>   kthread+0x110/0x114
>   ret_from_fork+0x10/0x20
>   Code: 53067e61 f90023e0 f9417aa2 f8617860 (f941ac57)
>   ---[ end trace 0000000000000000 ]---
> 
> Note this seems to have gotten harder to hit for some reason - took
> about 50 resets.
> 
> I'll keep digging
> 
> Jonathan
> 

