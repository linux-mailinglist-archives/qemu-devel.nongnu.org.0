Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15736433AB4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:36:22 +0200 (CEST)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrA5-0003wO-6F
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcqNd-00063c-Nn
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:46:23 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcqNW-0005GI-Hv
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:46:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 39F8EC5A530F;
 Tue, 19 Oct 2021 16:46:02 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 16:46:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00655a41280-75c8-4c7f-be62-112a772d3228,
 5B5731C74782081D4A8FE9ECE1C2E20B2A30CE7F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <f883283c-324a-bdab-c9a7-f503082694f1@kaod.org>
Date: Tue, 19 Oct 2021 16:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/ppc/ppc4xx_pci: Fix ppc4xx_pci_map_irq() for recent
 Linux kernels
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>
References: <20211019091817.469003-1-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211019091817.469003-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f39e7b42-f227-4b5b-95ba-da3c4209d8b1
X-Ovh-Tracer-Id: 15720095976293042991
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvvddgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveekueeljeetjeekkedthfetudfgfedvudegudfgtdekvedvvddutedtuddvveeinecuffhomhgrihhnpegtohhnfhhighdrrhhunhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 qemu-ppc@nongnu.org, edgar.iglesias@gmail.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 11:18, Thomas Huth wrote:
> Recent Linux kernels are accessing the PCI device in slot 0 that
> represents the PCI host bridge. This causes ppc4xx_pci_map_irq()
> to return -1 which causes an assert() later:
> 
>   hw/pci/pci.c:262: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.
> 
> Thus we should allocate an IRQ line for the device in slot 0, too.
> To avoid changes to the outside of ppc4xx_pci.c, we map it to
> the internal IRQ number 4 which will then happily be ignored since
> ppc440_bamboo.c does not wire it up.
> 
> With these changes it is now possible again to use recent Linux
> kernels for the bamboo board.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

and

Tested-by: Cédric Le Goater <clg@kaod.org>

with kernel 5.15.0-rc6, ppc44x_defconfig + rtl8139. See below.

Thanks,

C.

Activating Kernel Userspace Execution Prevention
Linux version 5.15.0-rc6-dirty (legoater@yukon) (powerpc64-linux-gnu-gcc (GCC) 11.2.1 20210728 (Red Hat Cross 11.2.1-1), GNU ld version 2.35.2-1.fc34) #3 Tue Oct 19 16:39:39 CEST 2021
random: fast init done
Found initrd at 0xc1900000:0xc19a6be7
Using PowerPC 44x Platform machine description
Found legacy serial port 0 for /plb/opb/serial@ef600300
   mem=ef600300, taddr=ef600300, irq=0, clk=11059200, speed=115200
Found legacy serial port 1 for /plb/opb/serial@ef600400
   mem=ef600400, taddr=ef600400, irq=0, clk=11059200, speed=0
printk: bootconsole [udbg0] enabled
-----------------------------------------------------
phys_mem_size     = 0x8000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x0000000000000100
   possible        = 0x0000000040000100
   always          = 0x0000000000000100
cpu_user_features = 0x8c008000 0x00000000
mmu_features      = 0x00000008
-----------------------------------------------------
Top of RAM: 0x8000000, Total RAM: 0x8000000
Memory hole size: 0MB
Zone ranges:
   Normal   [mem 0x0000000000000000-0x0000000007ffffff]
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
MMU: Allocated 1088 bytes of context maps for 255 contexts
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 1 zonelists, mobility grouping on.  Total pages: 32512
Kernel command line: console=ttyS0 HOST=powerpc-440fp
Unknown command line parameters: HOST=powerpc-440fp
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Kernel virtual memory layout:
   * 0xffbdf000..0xfffff000  : fixmap
   * 0xd1000000..0xffbdf000  : vmalloc & ioremap
Memory: 122100K/131072K available (5180K kernel code, 220K rwdata, 1312K rodata, 208K init, 147K bss, 8972K reserved, 0K cma-reserved)
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
UIC0 (32 IRQ sources) at DCR 0xc0
random: get_random_u32 called from start_kernel+0x4cc/0x640 with crng_init=0
time_init: decrementer frequency = 400.000000 MHz
time_init: processor frequency   = 400.000000 MHz
clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x5c4093a7d1, max_idle_ns: 440795210635 ns
clocksource: timebase mult[2800000] shift[24] registered
clockevent: decrementer mult[66666666] shift[32] cpu[0]
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
futex hash table entries: 256 (order: -1, 3072 bytes, linear)
NET: Registered PF_NETLINK/PF_ROUTE protocol family
DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
PCI host bridge /plb/pci@ec000000 (primary) ranges:
  MEM 0x00000000a0000000..0x00000000bfffffff -> 0x00000000a0000000
   IO 0x00000000e8000000..0x00000000e800ffff -> 0x0000000000000000
4xx PCI DMA offset set to 0x00000000
4xx PCI DMA window base to 0x0000000000000000
DMA window size 0x0000000080000000
PCI: Probing PCI hardware
PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
pci_bus 0000:00: root bus resource [mem 0xa0000000-0xbfffffff]
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
pci 0000:00:00.0: [1014:027f] type 00 class 0x068000
PCI: Hiding 4xx host bridge resources 0000:00:00.0
pci 0000:00:01.0: [10ec:8139] type 00 class 0x020000
pci 0000:00:01.0: reg 0x10: [io  0x0000-0x00ff]
pci 0000:00:01.0: reg 0x14: [mem 0x00000000-0x000000ff]
pci 0000:00:01.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
pci 0000:00:01.0: BAR 6: assigned [mem 0xa0000000-0xa003ffff pref]
pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x10ff]
pci 0000:00:01.0: BAR 1: assigned [mem 0xa0040000-0xa00400ff]
pci_bus 0000:00: resource 4 [io  0x0000-0xffff]
pci_bus 0000:00: resource 5 [mem 0xa0000000-0xbfffffff]
vgaarb: loaded
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
clocksource: Switched to clocksource timebase
NET: Registered PF_INET protocol family
IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
NET: Registered PF_UNIX/PF_LOCAL protocol family
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
PCI: CLS 0 bytes, default 32
Trying to unpack rootfs image as initramfs...
workingset: timestamp_bits=30 max_order=15 bucket_order=0
jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
io scheduler mq-deadline registered
io scheduler kyber registered
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
printk: console [ttyS0] disabled
serial8250.0: ttyS0 at MMIO 0xef600300 (irq = 16, base_baud = 691200) is a 16550A
printk: console [ttyS0] enabled
printk: bootconsole [udbg0] disabled
printk: console [ttyS0] disabled
ef600300.serial: ttyS0 at MMIO 0xef600300 (irq = 16, base_baud = 691200) is a 16550
printk: console [ttyS0] enabled
ef600400.serial: ttyS1 at MMIO 0xef600400 (irq = 17, base_baud = 691200) is a 16550
Freeing initrd memory: 664K
brd: module loaded
libphy: Fixed MDIO Bus: probed
PPC 4xx OCP EMAC driver, version 3.54
ZMII /plb/opb/emac-zmii@ef600d00 initialized
8139cp: 8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 2004)
8139cp 0000:00:01.0: enabling device (0000 -> 0003)
8139cp 0000:00:01.0 eth0: RTL-8139C+ at 0x(ptrval), 52:54:00:12:34:56, IRQ 28
NET: Registered PF_INET6 protocol family
Segment Routing with IPv6
In-situ OAM (IOAM) with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered PF_PACKET protocol family
drmem: No dynamic reconfiguration memory found
Freeing unused kernel image (initmem) memory: 208K
Kernel memory protection not selected by kernel config.
Run /init as init process
   with arguments:
     /init
   with environment:
     HOME=/
     TERM=linux
     HOST=powerpc-440fp
8139cp 0000:00:01.0 eth0: link up, 100Mbps, full-duplex, lpa 0x05E1
(powerpc-440fp:1) / $ ping 10.0.2.2
10.0.2.2 is alive!

