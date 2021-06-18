Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C03AC3CA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 08:23:42 +0200 (CEST)
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu7un-00045N-7I
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 02:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@fastmail.com.au>)
 id 1lu7tY-000321-NW
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 02:22:24 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:40302)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@fastmail.com.au>) id 1lu7tV-0005Zi-Tl
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 02:22:24 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 03A462B595;
 Fri, 18 Jun 2021 02:22:14 -0400 (EDT)
Date: Fri, 18 Jun 2021 16:22:15 +1000 (AEST)
From: Finn Thain <fthain@fastmail.com.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 0/5] dp8393x: fixes for MacOS toolbox ROM
In-Reply-To: <38512250-86bb-7cbd-caca-9bc0378e54e8@ilande.co.uk>
Message-ID: <2a99f70-4584-be2f-4d82-72641d65d7a@nippy.intranet>
References: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
 <20a706c7-9b44-13cc-b294-1ee0f3cff6bb@amsat.org>
 <2a2fff87-6e6f-3362-24e3-760f1aea4573@ilande.co.uk>
 <17f0917-de30-6771-26d0-7a10214221ca@nippy.intranet>
 <38512250-86bb-7cbd-caca-9bc0378e54e8@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: neutral client-ip=98.124.60.144;
 envelope-from=fthain@fastmail.com.au; helo=kvm5.telegraphics.com.au
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Cc: aleksandar.rikalo@syrmia.com, jasowang@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, hpoussin@reactos.org, aurelien@aurel32.net,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On Wed, 16 Jun 2021, Mark Cave-Ayland wrote:

> On 16/06/2021 04:09, Finn Thain wrote:
> 
> > With "qemu-system-mips -M magnum ..." I was able to boot both Linux 
> > and NetBSD. That was after commit 89ae0ff9b7 ("net/dp8393x: add PROM 
> > to store MAC address"). But that's not to say that the MAC address was 
> > decoded correctly.
> > 
> > Please see, 
> > https://lore.kernel.org/qemu-devel/alpine.LNX.2.21.1.1912241504560.11@nippy.intranet/
> > 
> > The Linux/mips (jazzsonic) testing that I did back in 2019 used a 
> > custom busybox initramfs. The NetBSD/mips testing used the official CD 
> > ISO image. I will look into reviving those test harnesses because I 
> > think patch 4/5 and the proposed big-endian flag will need some 
> > regression testing.
> 
> Thanks for the reference - I've just discovered from the link above 
> something I hadn't realised which is that -M magnum is present on both 
> qemu-system-mips64 *AND* qemu-system-mips64el indicating that the endian 
> needs to be set accordingly. Fortunately it should be possible to use a 
> similar solution as to that used for the malta machine i.e.:
> 
> 
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 1e1cf8154e..16b32d2b2c 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -124,7 +124,7 @@ static void mips_jazz_init(MachineState *machine,
>  {
>      MemoryRegion *address_space = get_system_memory();
>      char *filename;
> -    int bios_size, n;
> +    int bios_size, n, big_endian;
>      Clock *cpuclk;
>      MIPSCPU *cpu;
>      MIPSCPUClass *mcc;
> @@ -155,6 +155,12 @@ static void mips_jazz_init(MachineState *machine,
>          [JAZZ_PICA61] = {33333333, 4},
>      };
> 
> +#ifdef TARGET_WORDS_BIGENDIAN
> +    big_endian = 1;
> +#else
> +    big_endian = 0;
> +#endif
> +
>      if (machine->ram_size > 256 * MiB) {
>          error_report("RAM size more than 256Mb is not supported");
>          exit(EXIT_FAILURE);
> @@ -280,6 +286,7 @@ static void mips_jazz_init(MachineState *machine,
>              dev = qdev_new("dp8393x");
>              qdev_set_nic_properties(dev, nd);
>              qdev_prop_set_uint8(dev, "it_shift", 2);
> +            qdev_prop_set_bit(dev, "big_endian", big_endian);
>              object_property_set_link(OBJECT(dev), "dma_mr",
>                                       OBJECT(rc4030_dma_mr), &error_abort);
>              sysbus = SYS_BUS_DEVICE(dev);
> 

I was able to test this patch series successfully, using both 
"qemu-system-mipsel -M magnum" and "qemu-system-m68k -M q800". With the 
latter emulator I used a Linux/m68k guest and with the former I used both 
Linux/mips and NetBSD/arc guests.

Basic dp8393x functionality worked fine. I don't know how the m68k guest 
obtained its MAC address setting, but the macsonic driver banner message 
agrees with what's on the wire, at least.

The mips guest has ARC firmware which allowed the MAC address to be 
programmed manually:

 JAZZ Setup Program Version 0.17            Friday, 6-18-2021   5:06:02 AM
 Copyright (c) 1991, 1992  Microsoft Corporation

     The current Ethernet station address is: 900090001122
     Enter the new station address:  900090123456 
     The value written to NVRAM is: 9000901234560042
 Press any key to continue...

I'm guessing that the "0042" is the checksum?

BTW, the patch in the message quoted above does not seem to affect my 
results. (This host is little-endian...) I don't know how to test 
that one. For the others:
Tested-by: Finn Thain <fthain@linux-m68k.org>

> 
> If you have bootable images available for -M magnum under 
> qemu-system-mips64 and qemu-system-mips64el, is it possible to make them 
> available to others for testing?
> 

All of the ARC-compliant systems were little-endian according to the 
"Advanced RISC Computing Specification" published by MIPS Technology. 
There may have been some non-ARC machines but I've not explored that 
question.

Regarding bootable images: for NetBSD I just used the official installer, 
NetBSD-9.2-arc.iso. (The regressions I encountered in the past were fixed 
and hence NetBSD 5.1 isn't needed.)

For convenience, I used the NetBSD/arc bootloader to load either the 
NetBSD kernel or the Linux kernel. The ARC bios is required. For a copy of 
that please see https://gunkies.org/wiki/Installing_NetBSD_ARC_on_Qemu

For Linux/mips I updated my disk images, which are 1) an extfs image 
containing a minimal 32-bit mipsel busybox rootfs and 2) an ISO image 
containing a Linux kernel binary.

Unfortunately, the default mainline kernel build (jazz_defconfig) seems to 
be too big and crashes the bootloader (not a new problem though):

NetBSD/arc Bootstrap, Revision 1.1 (Wed May 12 13:15:55 UTC 2021)
devopen: scsi(0)cdrom(4)fdisk(0) type disk file vmlinux
6787344+134272 [775200+974808/
Jazz Monitor. Version 174
Press H for help, Q to quit.
AdEL exception occurred.
 at=ffffff7f v0=74736b5f v1=807f3e94 a0=e0002003 a1=00000090 a2=80eff05c
 a3=a07f0000 t0=00000002 t1=807f3ae8 t2=807f3e40 t3=80efe548 t4=00000001
 t5=00000001 t6=00000088 t7=00000080 s0=807f5060 s1=807f3df8 s2=807f3e94
 s3=8003f8e0 s4=807f3df8 s5=00000001 s6=ffffff3f s7=807f3d40 t8=61747274
 t9=61747274 k0=80041f50 k1=80000194 gp=80f0cc50 sp=80efe560 s8=8003f928
 ra=800213d4 psr=20000803 epc=800213e4 cause=00004010 errorepc=00000000
 badvaddr=74736bbf
>

This limitation prevents embedding the initramfs into 'vmlinux'.

A successful workaround is to shrink the kernel binary by disabling some 
Kconfig options.

$ git checkout v5.12
$ make ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- clean jazz_defconfig
$ scripts/config -d IPV6 -d WIRELESS -d WLAN -d DEBUG_KERNEL -d EXPERT -d CC_OPTIMIZE_FOR_PERFORMANCE -e CC_OPTIMIZE_FOR_SIZE
$ make ARCH=mips CROSS_COMPILE=mipsel-linux-gnu-
$ mkisofs -o vmlinux.iso -J -iso-level 3 vmlinux
$ qemu-system-mips64el -M magnum -L . -drive if=scsi,unit=0,format=raw,file=rootfs.img -drive if=scsi,unit=2,media=cdrom,format=raw,file=vmlinux.iso -drive if=scsi,unit=4,media=cdrom,format=raw,file=NetBSD-9.2-arc.iso -global ds1225y.filename=nvram -global ds1225y.size=8200 -serial mon:stdio -serial null -net nic,model=dp83932,addr=00:00:00:01:02:03 -net bridge


 Actions:

     Start Windows NT
->   Run a program
     Run setup

 Use the arrow keys to select.I Version 2.6)
 Press Enter to choose


     Program to run:
scsi(0)cdrom(4)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)vmlinux root=/dev/sda rw ignore_loglevel ip=192.168.66.123 console=ttyS0


NetBSD/arc Bootstrap, Revision 1.1 (Wed May 12 13:15:55 UTC 2021)
devopen: scsi(0)cdrom(2)fdisk(0) type disk file vmlinux
5326644+144284 [777648+947785]=0x6dd3a0
Linux version 5.12.0 (fthain@nippy) (mipsel-linux-gnu-gcc (btc) 6.4.0, GNU ld (btc) 2.28) #28 Fri Jun 18 13:50:42 AEST 2021
ARCH: Microsoft-Jazz
PROMLIB: ARC firmware Version 1 Revision 2
CPU0 revision is: 00000400 (R4000PC)
FPU revision is: 00000500
printk: debug: ignoring loglevel setting.
Primary instruction cache 8kB, VIPT, direct mapped, linesize 16 bytes.
Primary data cache 8kB, direct mapped, VIPT, cache aliases, linesize 16 bytes
Zone ranges:
  DMA      [mem 0x0000000000000000-0x0000000000ffffff]
  Normal   [mem 0x0000000001000000-0x0000000007ffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x0000000007ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
On node 0 totalpages: 32768
  DMA zone: 32 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 4096 pages, LIFO batch:0
  Normal zone: 224 pages used for memmap
  Normal zone: 28672 pages, LIFO batch:7
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Built 1 zonelists, mobility grouping on.  Total pages: 32512
Kernel command line: scsi(0)cdrom(2)fdisk(0)vmlinux root=/dev/sda rw ignore_loglevel ip=192.168.66.123 console=ttyS0
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 124092K/131072K available (3960K kernel code, 236K rwdata, 860K rodata, 184K init, 94K bss, 6980K reserved, 0K cma-reserved)
NR_IRQS: 256
random: get_random_bytes called from start_kernel+0x330/0x4dc with crng_init=0
Console: colour dummy device 80x25
sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 21474836475000000ns
Calibrating delay loop... 984.67 BogoMIPS (lpj=4923392)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 256 (order: -1, 3072 bytes, linear)
NET: Registered protocol family 16
VDMA: R4030 DMA pagetables initialized.
SCSI subsystem initialized
libata version 3.00 loaded.
NET: Registered protocol family 2
tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
NET: Registered protocol family 1
workingset: timestamp_bits=30 max_order=15 bucket_order=0
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler mq-deadline registered
io scheduler kyber registered
Console: switching to colour frame buffer device 100x37
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
printk: console [ttyS0] disabled
serial8250.0: ttyS0 at MMIO 0xe0006000 (irq = 32, base_baud = 115200) is a 16550A
printk: console [ttyS0] enabled
serial8250.0: ttyS1 at MMIO 0xe0007000 (irq = 33, base_baud = 115200) is a 16550A
jazz_esp jazz_esp.0: esp0: regs[(ptrval):0] irq[29]
jazz_esp jazz_esp.0: esp0: is a FAS100A, 40 MHz (ccf=0), SCSI ID 7
random: fast init done
scsi host0: esp
PDC20230-C/20630 VLB ATA controller detected.
scsi host1: pata_legacy
ata1: PATA max PIO2 cmd 0x1f0 ctl 0x3f6 irq 14
scsi 0:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
scsi target0:0:0: Beginning Domain Validation
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
scsi target0:0:0: Domain Validation skipping write tests
scsi target0:0:0: Ending Domain Validation
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
scsi 0:0:2:0: CD-ROM            QEMU     QEMU CD-ROM      2.5+ PQ: 0 ANSI: 5
scsi target0:0:2: Beginning Domain Validation
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
scsi target0:0:2: Domain Validation skipping write tests
scsi target0:0:2: Ending Domain Validation
VDMA: Channel 0: Memory error!
scsi 0:0:4:0: CD-ROM            QEMU     QEMU CD-ROM      2.5+ PQ: 0 ANSI: 5
scsi target0:0:4: Beginning Domain Validation
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
scsi target0:0:4: Domain Validation skipping write tests
scsi target0:0:4: Ending Domain Validation
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
sd 0:0:0:0: [sda] 40960 512-byte logical blocks: (21.0 MB/20.0 MiB)
VDMA: Channel 0: Memory error!
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 63 00 00 08
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
sd 0:0:0:0: [sda] Attached SCSI disk
scsi host1: pata_legacy
ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
scsi host1: pata_legacy
ata3: PATA max PIO4 cmd 0x1e8 ctl 0x3ee irq 11
scsi host1: pata_legacy
ata4: PATA max PIO4 cmd 0x168 ctl 0x36e irq 10
scsi host1: pata_legacy
ata5: PATA max PIO4 cmd 0x1e0 ctl 0x3e6 irq 8
scsi host1: pata_legacy
ata6: PATA max PIO4 cmd 0x160 ctl 0x366 irq 12
SONIC ethernet @e0001000, MAC 90:00:90:12:34:56, IRQ 28
serio: i8042 KBD port at 0xe0005000,0xe0005001 irq 30
serio: i8042 AUX port at 0xe0005000,0xe0005001 irq 31
input: AT Raw Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input2
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
EXT4-fs (sda): warning: mounting unchecked fs, running e2fsck is recommended
EXT4-fs (sda): mounted filesystem without journal. Opts: (null). Quota mode: disabled.
VFS: Mounted root (ext4 filesystem) on device 8:0.
Freeing prom memory: 376k freed
Freeing prom memory: 60k freed
Freeing prom memory: 4k freed
Freeing unused kernel memory: 184K
This architecture does not have kernel memory protection.
Run /sbin/init as init process
  with arguments:
    /sbin/init
    scsi(0)cdrom(2)fdisk(0)vmlinux
  with environment:
    HOME=/
    TERM=linux
    ip=192.168.66.123
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
process '/bin/busybox' started with executable stack
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
hwclock: can't open '/dev/misc/rtc': No such file or directory
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
VDMA: Channel 0: Memory error!
# ip link
1: lo: <LOOPBACK> mtu 65536 qdisc noop qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 90:00:90:12:34:56 brd ff:ff:ff:ff:ff:ff
# ping 192.168.66.1
PING 192.168.66.1 (192.168.66.1): 56 data bytes
64 bytes from 192.168.66.1: seq=0 ttl=64 time=40.000 ms
64 bytes from 192.168.66.1: seq=1 ttl=64 time=0.000 ms
64 bytes from 192.168.66.1: seq=2 ttl=64 time=0.000 ms
^C
--- 192.168.66.1 ping statistics ---
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max = 0.000/13.333/40.000 ms
#


The process for booting NetBSD is the same except that "Program to run"
would be:
scsi(0)cdrom(4)fdisk(0)boot scsi(0)cdrom(4)fdisk(0)netbsd


NetBSD/arc Bootstrap, Revision 1.1 (Wed May 12 13:15:55 UTC 2021)
devopen: scsi(0)cdrom(4)fdisk(0) type disk file netbsd
5193200+83744=0x508968
[   1.0000000] Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
[   1.0000000]     2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017,
[   1.0000000]     2018, 2019, 2020 The NetBSD Foundation, Inc.  All rights reserved.
[   1.0000000] Copyright (c) 1982, 1986, 1989, 1991, 1993
[   1.0000000]     The Regents of the University of California.  All rights reserved.

[   1.0000000] NetBSD 9.2 (RAMDISK) #0: Wed May 12 13:15:55 UTC 2021
[   1.0000000]  mkrepro@mkrepro.NetBSD.org:/usr/src/sys/arch/arc/compile/RAMDISK
[   1.0000000] MIPS Magnum
[   1.0000000] total memory = 128 MB
[   1.0000000] avail memory = 119 MB
[   1.0000000] mainbus0 (root)
[   1.0000000] cpu0 at mainbus0: MIPS R4000 CPU (0x400) Rev. 0.0 with MIPS R4010 FPC Rev. 0.0
[   1.0000000] cpu0: 48 TLB entries, 256MB max page size
[   1.0000000] cpu0: 8KB/16B direct-mapped L1 instruction cache
[   1.0000000] cpu0: 8KB/16B direct-mapped write-back L1 data cache
[   1.0000000] jazzio0 at mainbus0
[   1.0000000] timer0 at jazzio0 addr 0xe0000228
[   1.0000000] mcclock0 at jazzio0 addr 0xe0004000: mc146818 compatible time-of-day clock
[   1.0000000] LPT1 at jazzio0 addr 0xe0008000 intr 0 not configured
[   1.0000000] fdc0 at jazzio0 addr 0xe0003000 intr 1
[   1.0000000] fd0 at fdc0 drive 1: 1.44MB, 80 cyl, 2 head, 18 sec
[   1.0000000] MAGNUM at jazzio0 addr 0xe000c000 intr 2 not configured
[   1.0000000] VXL at jazzio0 addr 0xe0800000 intr 3 not configured
[   1.0000000] sn0 at jazzio0 addr 0xe0001000 intr 4: SONIC Ethernet
[   1.0000000] sn0: Ethernet address 90:00:90:12:34:56
[   1.0000000] asc0 at jazzio0 addr 0xe0002000 intr 5: NCR53C94, 25MHz, SCSI ID 7
[   1.0000000] scsibus0 at asc0: 8 targets, 8 luns per target
[   1.0000000] pckbc0 at jazzio0 addr 0xe0005000 intr 6
[   1.0000000] pckbd0 at pckbc0 (kbd slot)
[   1.0000000] wskbd0 at pckbd0 (mux ignored)
[   1.0000000] pms at jazzio0 addr 0xe0005000 intr 7 not configured
[   1.0000000] com0 at jazzio0 addr 0xe0006000 intr 8: ns16550a, working fifo
[   1.0000000] com0: txfifo disabled
[   1.0000000] com0: console
[   1.0000000] com1 at jazzio0 addr 0xe0007000 intr 9: ns16550a, working fifo
[   1.0000000] com1: txfifo disabled
[   1.0000000] jazzisabr0 at mainbus0
[   1.0000000] isa0 at jazzisabr0
[   1.0000000] isapnp0 at isa0 port 0x279
[   1.0000100] scsibus0: waiting 2 seconds for devices to settle...
[   2.3472719] sd0 at scsibus0 target 0 lun 0: <QEMU, QEMU HARDDISK, 2.5+> disk fixed
[   2.3472719] sd0: 20480 KB, 40 cyl, 16 head, 64 sec, 512 bytes/sect x 40960 sectors
[   2.3472719] cd0 at scsibus0 target 2 lun 0: <QEMU, QEMU CD-ROM, 2.5+> cdrom removable
[   2.3472719] cd1 at scsibus0 target 4 lun 0: <QEMU, QEMU CD-ROM, 2.5+> cdrom removable
[   2.3544734] boot device: <unknown>
[   2.3544734] root on md0a dumps on md0b
[   2.3611882] root file system type: ffs
[   2.3678883] kern.module.path=/stand/arc/9.2/modules
[   2.3678883] WARNING: preposterous TOD clock time
[   2.3678883] WARNING: using filesystem time
[   2.3712975] WARNING: CHECK AND RESET THE DATE!
erase ^H, werase ^W, kill ^U, intr ^C, status ^T
Terminal type? [vt100]
Erase is backspace.
(I)nstall, (S)hell or (H)alt ? s
# ifconfig sn0 192.168.66.123
# ping 192.168.66.1
PING 192.168.66.1 (192.168.66.1): 56 data bytes
64 bytes from 192.168.66.1: icmp_seq=0 ttl=64 time=7.208080 ms
64 bytes from 192.168.66.1: icmp_seq=1 ttl=64 time=1.696826 ms
^C
----192.168.66.1 PING Statistics----
2 packets transmitted, 2 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 1.696826/4.452453/7.208080/3.897045 ms
# ifconfig -a
sn0: flags=0x8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
        ec_capabilities=1<VLAN_MTU>
        ec_enabled=0
        address: 90:00:90:12:34:56
        inet 192.168.66.123/24 broadcast 192.168.66.255 flags 0x0
lo0: flags=0x8048<LOOPBACK,RUNNING,MULTICAST> mtu 33160
#


