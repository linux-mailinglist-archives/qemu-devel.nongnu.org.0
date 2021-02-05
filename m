Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361E310E42
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:02:17 +0100 (CET)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84Uq-0006Iw-1b
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84Cw-0007hG-Pl
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:43:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84Cm-00058d-Dj
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612543414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5dl2liTwq/i/hQRHcRUFQcev/jTkiAWSOeBhykjKP0E=;
 b=PS30Fmc3vq9SE75FvZVYxRA5Ax4pYj4XFUxuHQCe9vLQCWlJj7CsbJmRqf7rLxlJCnCy4s
 GMFKTGu/aBwEOo+GmBshRfkgAllGZAAAtyaXx7/N1+I7909iwK6P0gPpVCKj+ignYw5K5/
 3M6QzCXFmOK7jPZxR6jypSnzFMzB5o8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-FAwIfqUiNLWv9oFd-KFGTA-1; Fri, 05 Feb 2021 11:43:28 -0500
X-MC-Unique: FAwIfqUiNLWv9oFd-KFGTA-1
Received: by mail-ed1-f71.google.com with SMTP id w14so7233441edv.6
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=5dl2liTwq/i/hQRHcRUFQcev/jTkiAWSOeBhykjKP0E=;
 b=BBHUt1C0W8cgD+exG0Wci5nLddvichTfgQCzxXS4uqVT1Y+ts3j8SdTYU7/go9W7he
 mXqbjbplNRiZqWwJue5cNvQqWYnOCHt15Uv444+LKRMmEKjTK5mZ+Fu3sTh+9wPs7ilM
 SBsy54cRpjh8h/JYGkWeIaoIXLakJGP6J478k1tBoICYVMoIo+4/dQQpHmWKeUguWdd3
 oZGTIKbjic+UZ1wScxorRPOMdaosHuK30/mUZ6lFZNcNN5mfrGoUuKGF4+CCwpFvhR/Q
 0N/ThjU8VtcPHl2uSSdK4NsC5HS+CjnvwdcsDGkyMYeMM6vr5gNTq7+vp/mVqtac2YdC
 skNg==
X-Gm-Message-State: AOAM530bocaGBEp+ZbWdQpzdz5ovGc6b+6sudFZg4PVlYVkEm6qtNmhw
 I7gP1NoZT3W441fmD8RM6XEgCBTLymBazNmpKKlY+0L3OCYjM/81XDStEF0z5TIBAljJwuyw6qV
 UbCcUrrSMvvvUlEQ=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr4249773edd.100.1612543407724; 
 Fri, 05 Feb 2021 08:43:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytOKiVifMS33TbXo3N2pNDNlwOmMa5bfFeibLoUEfdn/UDiJh3dABr8R7P9Nzwd+xveF5c4w==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr4249755edd.100.1612543407558; 
 Fri, 05 Feb 2021 08:43:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b25sm3375814ejz.100.2021.02.05.08.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:43:26 -0800 (PST)
Subject: Re: acceptance-system-fedora and acceptance-system-centos failing
 sporadically with timeout?
To: John Snow <jsnow@redhat.com>, avocado-devel <avocado-devel@redhat.com>
References: <7da911b5-40d3-fd3b-768f-862c07f879ba@suse.de>
 <68c85b98-6a4b-13a7-ae86-8a63013549a7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a3d25c79-0cf0-6c8e-7346-68d775e14e50@redhat.com>
Date: Fri, 5 Feb 2021 17:43:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <68c85b98-6a4b-13a7-ae86-8a63013549a7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------B5C51C4D1188BE6C2E0AE93A"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B5C51C4D1188BE6C2E0AE93A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Cc'ing Avocado team & John (Python inferior exit delay?).

On 1/28/21 11:10 AM, Thomas Huth wrote:
> On 28/01/2021 10.45, Claudio Fontana wrote:
>>
>> is it just me, or is the CI sometimes failing with timeout?
>>
>> Fedora:
>> https://gitlab.com/hw-claudio/qemu/-/jobs/986936506
> 
> I've sent a patch for that issue just yesterday:
> 
>  https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06852.html
> 
>> CentOS:
>> https://gitlab.com/hw-claudio/qemu/-/jobs/980769080
> 
> Never seen that one before - if you hit it again, could you please save
> the artifacts and have a look at the log file in there to see what's
> exactly the problem?

https://gitlab.com/philmd/qemu/-/jobs/1008007125

 (28/36)
tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_ppc_mac99:
ERROR: Test reported status but did not finish (90.09 s)

Attached debug.log.

--------------B5C51C4D1188BE6C2E0AE93A
Content-Type: text/x-log; charset=UTF-8;
 name="debug.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="debug.log"

14:44:28 DEBUG| PARAMS (key=arch, path=*, default=ppc) => 'ppc'
14:44:28 DEBUG| PARAMS (key=machine, path=*, default=mac99) => 'mac99'
14:44:28 DEBUG| PARAMS (key=qemu_bin, path=*, default=./qemu-system-ppc) => './qemu-system-ppc'
14:44:28 INFO | recording the execution...
14:44:28 DEBUG| VM launch command: './qemu-system-ppc -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_ettyrtlx/qemu-725-monitor.sock -mon chardev=mon,mode=control -machine mac99 -chardev socket,id=console,path=/var/tmp/avo_qemu_sock_ettyrtlx/qemu-725-console.sock,server=on,wait=off -serial chardev:console -icount shift=7,rr=record,rrfile=/var/tmp/avocado_tovfx415/avocado_job_i58i8d2a/28-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_ppc_mac99/replay.bin -kernel /var/tmp/avocado_tovfx415/avocado_job_i58i8d2a/28-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_ppc_mac99/day15/invaders.elf -append  -net none -no-reboot -M graphics=off'
14:44:28 DEBUG| >>> {'execute': 'qmp_capabilities'}
14:44:28 DEBUG| <<< {'return': {}}
14:44:29 DEBUG| >> =============================================================
14:44:29 DEBUG| >> OpenBIOS 1.1 [Jul 27 2020 08:14]
14:44:29 DEBUG| >> Configuration device id QEMU version 1 machine id 1
14:44:29 DEBUG| >> CPUs: 1
14:44:29 DEBUG| >> Memory: 128M
14:44:29 DEBUG| >> UUID: 00000000-0000-0000-0000-000000000000
14:44:29 DEBUG| >> CPU type PowerPC,G4
14:44:29 DEBUG| milliseconds isn't unique.
14:44:30 DEBUG| Welcome to OpenBIOS v1.1 built on Jul 27 2020 08:14
14:44:30 DEBUG| >> [ppc] Kernel already loaded (0x01000000 + 0x004ed2e4) (initrd 0x00000000 + 0x00000000)
14:44:30 DEBUG| >> [ppc] Kernel command line:
14:44:30 DEBUG| >> switching to new context:
14:44:30 DEBUG| OF stdout device is: /pci@f2000000/mac-io@c/escc@13000/ch-a@13020
14:44:30 DEBUG| Preparing to boot Linux version 4.11.3 (thuth@thuth.remote.csb) (gcc version 6.4.0 (Buildroot 2018.05.2) ) #8 Mon Dec 10 12:05:13 CET 2018
14:44:30 DEBUG| Detected machine type: 00000400
14:44:30 DEBUG| command line:
14:44:31 DEBUG| memory layout at init:
14:44:31 DEBUG| memory_limit : 00000000 (16 MB aligned)
14:44:31 DEBUG| alloc_bottom : 014f2000
14:44:31 DEBUG| alloc_top    : 08000000
14:44:31 DEBUG| alloc_top_hi : 08000000
14:44:31 DEBUG| rmo_top      : 08000000
14:44:31 DEBUG| ram_top      : 08000000
14:44:31 DEBUG| copying OF device tree...
14:44:31 DEBUG| Building dt strings...
14:44:32 DEBUG| Building dt structure...
14:44:35 DEBUG| Device tree strings 0x014f3000 -> 0x014f34f5
14:44:35 DEBUG| Device tree struct  0x014f4000 -> 0x014f6000
14:44:35 DEBUG| Quiescing Open Firmware ...
14:44:36 DEBUG| Booting Linux via __start() @ 0x01000000 ...
14:44:37 DEBUG| Hello World !
14:44:37 DEBUG| Total memory = 128MB; using 256kB for hash table (at c7fc0000)
14:44:37 DEBUG| Linux version 4.11.3 (thuth@thuth.remote.csb) (gcc version 6.4.0 (Buildroot 2018.05.2) ) #8 Mon Dec 10 12:05:13 CET 2018
14:44:37 DEBUG| Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0x07
14:44:37 DEBUG| Mapped at 0xff7c0000
14:44:37 DEBUG| Found a Keylargo mac-io controller, rev: 0, mapped at 0xff740000
14:44:37 DEBUG| PowerMac motherboard: PowerMac G4 AGP Graphics
14:44:37 DEBUG| boot stdout isn't a display !
14:44:37 DEBUG| Using PowerMac machine description
14:44:37 DEBUG| bootconsole [udbg0] enabled
14:44:37 DEBUG| -----------------------------------------------------
14:44:37 DEBUG| Hash_size         = 0x40000
14:44:37 DEBUG| phys_mem_size     = 0x8000000
14:44:37 DEBUG| dcache_bsize      = 0x20
14:44:37 DEBUG| icache_bsize      = 0x20
14:44:37 DEBUG| cpu_features      = 0x000000000020047a
14:44:37 DEBUG| possible        = 0x0000000005a6fd7f
14:44:37 DEBUG| always          = 0x0000000000000000
14:44:37 DEBUG| cpu_user_features = 0x9c000001 0x00000000
14:44:37 DEBUG| mmu_features      = 0x00000001
14:44:37 DEBUG| Hash              = 0xc7fc0000
14:44:37 DEBUG| Hash_mask         = 0xfff
14:44:37 DEBUG| -----------------------------------------------------
14:44:37 DEBUG| Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: 0->0
14:44:37 DEBUG| PCI host bridge /pci@f2000000 (primary) ranges:
14:44:37 DEBUG| IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
14:44:37 DEBUG| MEM 0x0000000080000000..0x000000008fffffff -> 0x0000000080000000
14:44:37 DEBUG| Zone ranges:
14:44:37 DEBUG| DMA      [mem 0x0000000000000000-0x0000000007ffffff]
14:44:37 DEBUG| Normal   empty
14:44:37 DEBUG| HighMem  empty
14:44:37 DEBUG| Movable zone start for each node
14:44:37 DEBUG| Early memory node ranges
14:44:37 DEBUG| node   0: [mem 0x0000000000000000-0x0000000007ffffff]
14:44:37 DEBUG| Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
14:44:37 DEBUG| Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
14:44:37 DEBUG| Kernel command line:
14:44:37 DEBUG| PID hash table entries: 512 (order: -1, 2048 bytes)
14:44:37 DEBUG| Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
14:44:37 DEBUG| Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
14:44:37 DEBUG| Memory: 124532K/131072K available (3028K kernel code, 136K rwdata, 600K rodata, 1016K init, 244K bss, 6540K reserved, 0K cma-reserved, 0K highmem)
14:44:37 DEBUG| Kernel virtual memory layout:
14:44:37 DEBUG| * 0xfffcf000..0xfffff000  : fixmap
14:44:37 DEBUG| * 0xff800000..0xffc00000  : highmem PTEs
14:44:37 DEBUG| * 0xfef3a000..0xff800000  : early ioremap
14:44:37 DEBUG| * 0xc9000000..0xfef3a000  : vmalloc & ioremap
14:44:37 DEBUG| SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
14:44:37 DEBUG| NR_IRQS:512 nr_irqs:512 16
14:44:38 DEBUG| mpic: Setting up MPIC " MPIC 1   " version 1.2 at 80040000, max 1 CPUs
14:44:38 DEBUG| mpic: ISU size: 64, shift: 6, mask: 3f
14:44:38 DEBUG| mpic: Initializing for 64 sources
14:44:38 DEBUG| clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns
14:44:38 DEBUG| clocksource: timebase mult[a000000] shift[24] registered
14:44:38 DEBUG| Console: colour dummy device 80x25
14:44:38 DEBUG| console [ttyS0] enabled
14:44:38 DEBUG| console [ttyS0] enabled
14:44:38 DEBUG| bootconsole [udbg0] disabled
14:44:38 DEBUG| bootconsole [udbg0] disabled
14:44:38 DEBUG| pid_max: default: 32768 minimum: 301
14:44:38 DEBUG| Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
14:44:38 DEBUG| Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
14:44:38 DEBUG| devtmpfs: initialized
14:44:38 DEBUG| clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
14:44:38 DEBUG| futex hash table entries: 256 (order: -1, 3072 bytes)
14:44:38 DEBUG| PCI: Probing PCI hardware
14:44:38 DEBUG| PCI host bridge to bus 0000:00
14:44:38 DEBUG| pci_bus 0000:00: root bus resource [io  0x0000-0x7fffff]
14:44:38 DEBUG| pci_bus 0000:00: root bus resource [mem 0x80000000-0x8fffffff]
14:44:38 DEBUG| pci_bus 0000:00: root bus resource [bus 00-ff]
14:44:38 DEBUG| vgaarb: loaded
14:44:38 DEBUG| usbcore: registered new interface driver usbfs
14:44:38 DEBUG| usbcore: registered new interface driver hub
14:44:38 DEBUG| usbcore: registered new device driver usb
14:44:38 DEBUG| Advanced Linux Sound Architecture Driver Initialized.
14:44:38 DEBUG| clocksource: Switched to clocksource timebase
14:44:39 DEBUG| workingset: timestamp_bits=30 max_order=15 bucket_order=0
14:44:39 DEBUG| Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
14:44:39 DEBUG| io scheduler noop registered
14:44:39 DEBUG| io scheduler deadline registered
14:44:39 DEBUG| io scheduler cfq registered (default)
14:44:39 DEBUG| io scheduler mq-deadline registered
14:44:39 DEBUG| pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
14:44:39 DEBUG| MacIO PCI driver attached to Keylargo chipset
14:44:39 DEBUG| 0.00013020:ch-a: ttyS0 at MMIO 0x80013020 (irq = 37, base_baud = 230400) is a Z85c30 ESCC - Serial port
14:44:39 DEBUG| 0.00013000:ch-b: ttyS1 at MMIO 0x80013000 (irq = 36, base_baud = 230400) is a Z85c30 ESCC - Serial port
14:44:39 DEBUG| Macintosh Cuda and Egret driver.
14:44:39 DEBUG| Uniform Multi-Platform E-IDE driver
14:44:39 DEBUG| adb: starting probe task...
14:44:39 DEBUG| [2]: 2 2
14:44:39 DEBUG| [3]: 3 3
14:44:39 DEBUG| ADB keyboard at 2, handler 1
14:44:39 DEBUG| Detected ADB keyboard, type
14:44:39 DEBUG| ANSI.
14:44:39 DEBUG| input: ADB keyboard as /devices/virtual/input/input0
14:44:39 DEBUG| ADB mouse at 3, handler set to 3
14:44:39 DEBUG| (Mouse Systems A3 Mouse, or compatible)
14:44:39 DEBUG| input: ADB mouse as /devices/virtual/input/input1
14:44:39 DEBUG| adb: finished probe task...
14:44:40 DEBUG| ide-pmac: Found Apple KeyLargo ATA-3 controller (macio), bus ID 0, irq 16
14:44:41 DEBUG| ide0 at 0xc9011000-0xc9011070,0xc9011160 on irq 16
14:44:42 DEBUG| ide-pmac: Found Apple KeyLargo ATA-3 controller (macio), bus ID 1, irq 18
14:44:42 DEBUG| hdc: QEMU DVD-ROM, ATAPI CD/DVD-ROM drive
14:44:43 DEBUG| hdc: MWDMA2 mode selected
14:44:43 DEBUG| ide1 at 0xc9017000-0xc9017070,0xc9017160 on irq 18
14:44:43 DEBUG| ide-gd driver 1.18
14:44:43 DEBUG| ide-cd driver 5.00
14:44:43 DEBUG| ide-cd: hdc: ATAPI 4X DVD-ROM drive, 512kB Cache
14:44:43 DEBUG| cdrom: Uniform CD-ROM driver Revision: 3.20
14:44:43 DEBUG| ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
14:44:43 DEBUG| ohci-pci: OHCI PCI platform driver
14:44:43 DEBUG| ohci-pci 0000:00:0d.0: OHCI PCI host controller
14:44:43 DEBUG| ohci-pci 0000:00:0d.0: new USB bus registered, assigned bus number 1
14:44:43 DEBUG| ohci-pci 0000:00:0d.0: irq 28, io mem 0x80080000
14:44:43 DEBUG| hub 1-0:1.0: USB hub found
14:44:43 DEBUG| hub 1-0:1.0: 3 ports detected
14:44:43 DEBUG| usbcore: registered new interface driver usbhid
14:44:43 DEBUG| usbhid: USB HID core driver
14:44:43 DEBUG| ALSA device list:
14:44:43 DEBUG| No soundcards found.
14:44:43 DEBUG| Freeing unused kernel memory: 1016K
14:44:43 DEBUG| This architecture does not have kernel memory protection.
14:44:44 DEBUG| Starting logging: OK
14:44:44 DEBUG| QEMU advent calendar 2018 - log in as 'root' and run 'ascii_invaders' to play the game
14:44:44 DEBUG| >>> {'execute': 'quit'}
14:44:44 DEBUG| <<< {'return': {}}
14:44:44 INFO | finished the recording with log size 48245628 bytes
14:44:44 INFO | elapsed time 15.96 sec
14:44:44 INFO | replaying the execution...
14:44:44 DEBUG| VM launch command: './qemu-system-ppc -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_mzpk6x_y/qemu-725-monitor.sock -mon chardev=mon,mode=control -machine mac99 -chardev socket,id=console,path=/var/tmp/avo_qemu_sock_mzpk6x_y/qemu-725-console.sock,server=on,wait=off -serial chardev:console -icount shift=7,rr=replay,rrfile=/var/tmp/avocado_tovfx415/avocado_job_i58i8d2a/28-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_ppc_mac99/replay.bin -kernel /var/tmp/avocado_tovfx415/avocado_job_i58i8d2a/28-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_ppc_mac99/day15/invaders.elf -append  -net none -no-reboot -M graphics=off'
14:44:44 DEBUG| >>> {'execute': 'qmp_capabilities'}
14:44:44 DEBUG| <<< {'return': {}}
14:44:46 DEBUG| >> =============================================================
14:44:46 DEBUG| >> OpenBIOS 1.1 [Jul 27 2020 08:14]
14:44:46 DEBUG| >> Configuration device id QEMU version 1 machine id 1
14:44:46 DEBUG| >> CPUs: 1
14:44:46 DEBUG| >> Memory: 128M
14:44:46 DEBUG| >> UUID: 00000000-0000-0000-0000-000000000000
14:44:46 DEBUG| >> CPU type PowerPC,G4
14:44:46 DEBUG| milliseconds isn't unique.
14:44:47 DEBUG| Welcome to OpenBIOS v1.1 built on Jul 27 2020 08:14
14:44:47 DEBUG| >> [ppc] Kernel already loaded (0x01000000 + 0x004ed2e4) (initrd 0x00000000 + 0x00000000)
14:44:47 DEBUG| >> [ppc] Kernel command line:
14:44:47 DEBUG| >> switching to new context:
14:44:48 DEBUG| OF stdout device is: /pci@f2000000/mac-io@c/escc@13000/ch-a@13020
14:44:48 DEBUG| Preparing to boot Linux version 4.11.3 (thuth@thuth.remote.csb) (gcc version 6.4.0 (Buildroot 2018.05.2) ) #8 Mon Dec 10 12:05:13 CET 2018
14:44:48 DEBUG| Detected machine type: 00000400
14:44:48 DEBUG| command line:
14:44:49 DEBUG| memory layout at init:
14:44:49 DEBUG| memory_limit : 00000000 (16 MB aligned)
14:44:49 DEBUG| alloc_bottom : 014f2000
14:44:49 DEBUG| alloc_top    : 08000000
14:44:49 DEBUG| alloc_top_hi : 08000000
14:44:49 DEBUG| rmo_top      : 08000000
14:44:49 DEBUG| ram_top      : 08000000
14:44:50 DEBUG| copying OF device tree...
14:44:50 DEBUG| Building dt strings...
14:44:54 DEBUG| Building dt structure...
14:45:02 DEBUG| Device tree strings 0x014f3000 -> 0x014f34f5
14:45:02 DEBUG| Device tree struct  0x014f4000 -> 0x014f6000
14:45:02 DEBUG| Quiescing Open Firmware ...
14:45:33 DEBUG| Booting Linux via __start() @ 0x01000000 ...
14:45:49 DEBUG| Hello World !
14:45:49 DEBUG| Total memory = 128MB; using 256kB for hash table (at c7fc0000)
14:45:50 DEBUG| Linux version 4.11.3 (thuth@thuth.remote.csb) (gcc version 6.4.0 (Buildroot 2018.05.2) ) #8 Mon Dec 10 12:05:13 CET 2018
14:45:50 DEBUG| Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0x07
14:45:50 DEBUG| Mapped at 0xff7c0000
14:45:50 DEBUG| Found a Keylargo mac-io controller, rev: 0, mapped at 0xff740000
14:45:50 DEBUG| PowerMac motherboard: PowerMac G4 AGP Graphics
14:45:50 DEBUG| boot stdout isn't a display !
14:45:50 DEBUG| Using PowerMac machine description
14:45:50 DEBUG| bootconsole [udbg0] enabled
14:45:50 DEBUG| -----------------------------------------------------
14:45:50 DEBUG| Hash_size         = 0x40000
14:45:50 DEBUG| phys_mem_size     = 0x8000000
14:45:50 DEBUG| dcache_bsize      = 0x20
14:45:50 DEBUG| icache_bsize      = 0x20
14:45:50 DEBUG| cpu_features      = 0x000000000020047a
14:45:50 DEBUG| possible        = 0x0000000005a6fd7f
14:45:50 DEBUG| always          = 0x0000000000000000
14:45:50 DEBUG| cpu_user_features = 0x9c000001 0x00000000
14:45:50 DEBUG| mmu_features      = 0x00000001
14:45:50 DEBUG| Hash              = 0xc7fc0000
14:45:50 DEBUG| Hash_mask         = 0xfff
14:45:50 DEBUG| -----------------------------------------------------
14:45:50 DEBUG| Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: 0->0
14:45:50 DEBUG| PCI host bridge /pci@f2000000 (primary) ranges:
14:45:50 DEBUG| IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
14:45:50 DEBUG| MEM 0x0000000080000000..0x000000008fffffff -> 0x0000000080000000
14:45:50 DEBUG| Zone ranges:
14:45:50 DEBUG| DMA      [mem 0x0000000000000000-0x0000000007ffffff]
14:45:50 DEBUG| Normal   empty
14:45:50 DEBUG| HighMem  empty
14:45:50 DEBUG| Movable zone start for each node
14:45:50 DEBUG| Early memory node ranges
14:45:50 DEBUG| node   0: [mem 0x0000000000000000-0x0000000007ffffff]
14:45:50 DEBUG| Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
14:45:52 DEBUG| Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
14:45:52 DEBUG| Kernel command line:
14:45:52 DEBUG| PID hash table entries: 512 (order: -1, 2048 bytes)
14:45:52 DEBUG| Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
14:45:52 DEBUG| Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
14:45:54 DEBUG| Memory: 124532K/131072K available (3028K kernel code, 136K rwdata, 600K rodata, 1016K init, 244K bss, 6540K reserved, 0K cma-reserved, 0K highmem)
14:45:54 DEBUG| Kernel virtual memory layout:
14:45:54 DEBUG| * 0xfffcf000..0xfffff000  : fixmap
14:45:54 DEBUG| * 0xff800000..0xffc00000  : highmem PTEs
14:45:54 DEBUG| * 0xfef3a000..0xff800000  : early ioremap
14:45:54 DEBUG| * 0xc9000000..0xfef3a000  : vmalloc & ioremap
14:45:54 DEBUG| SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
14:45:54 DEBUG| NR_IRQS:512 nr_irqs:512 16
14:45:54 DEBUG| mpic: Setting up MPIC " MPIC 1   " version 1.2 at 80040000, max 1 CPUs
14:45:54 DEBUG| mpic: ISU size: 64, shift: 6, mask: 3f
14:45:54 DEBUG| mpic: Initializing for 64 sources
14:45:54 DEBUG| clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns
14:45:55 DEBUG| clocksource: timebase mult[a000000] shift[24] registered
14:45:55 DEBUG| Console: colour dummy device 80x25
14:45:55 DEBUG| console [ttyS0] enabled
14:45:55 DEBUG| console [ttyS0] enabled
14:45:55 DEBUG| bootconsole [udbg0] disabled
14:45:55 DEBUG| bootconsole [udbg0] disabled
14:45:55 DEBUG| pid_max: default: 32768 minimum: 301
14:45:55 DEBUG| Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
14:45:55 DEBUG| Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
14:45:55 DEBUG| devtmpfs: initialized
14:45:55 DEBUG| clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
14:45:55 DEBUG| futex hash table entries: 256 (order: -1, 3072 bytes)
14:45:55 DEBUG| PCI: Probing PCI hardware
14:45:55 DEBUG| PCI host bridge to bus 0000:00
14:45:55 DEBUG| pci_bus 0000:00: root bus resource [io  0x0000-0x7fffff]
14:45:55 DEBUG| pci_bus 0000:00: root bus resource [mem 0x80000000-0x8fffffff]
14:45:55 DEBUG| pci_bus 0000:00: root bus resource [bus 00-ff]
14:45:55 DEBUG| vgaarb: loaded
14:45:55 DEBUG| usbcore: registered new interface driver usbfs
14:45:55 DEBUG| usbcore: registered new interface driver hub
14:45:55 DEBUG| usbcore: registered new device driver usb
14:45:55 DEBUG| Advanced Linux Sound Architecture Driver Initialized.
14:45:55 DEBUG| clocksource: Switched to clocksource timebase
14:45:55 DEBUG| workingset: timestamp_bits=30 max_order=15 bucket_order=0
14:45:55 DEBUG| Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
14:45:55 DEBUG| io scheduler noop registered
14:45:55 DEBUG| io scheduler deadline registered
14:45:55 DEBUG| io scheduler cfq registered (default)
14:45:55 DEBUG| io scheduler mq-deadline registered
14:45:55 DEBUG| pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
14:45:55 DEBUG| MacIO PCI driver attached to Keylargo chipset
14:45:55 DEBUG| 0.00013020:ch-a: ttyS0 at MMIO 0x80013020 (irq = 37, base_baud = 230400) is a Z85c30 ESCC - Serial port
14:45:55 DEBUG| 0.00013000:ch-b: ttyS1 at MMIO 0x80013000 (irq = 36, base_baud = 230400) is a Z85c30 ESCC - Serial port
14:45:55 DEBUG| Macintosh Cuda and Egret driver.
14:45:55 DEBUG| Uniform Multi-Platform E-IDE driver
14:45:55 DEBUG| adb: starting probe task...
14:45:56 DEBUG| [2]: 2 2
14:45:56 DEBUG| [3]: 3 3
14:45:56 DEBUG| ADB keyboard at 2, handler 1
14:45:56 DEBUG| Detected ADB keyboard, type
14:45:56 DEBUG| ANSI.
14:45:56 DEBUG| input: ADB keyboard as /devices/virtual/input/input0
14:45:56 DEBUG| ADB mouse at 3, handler set to 3
14:45:56 DEBUG| (Mouse Systems A3 Mouse, or compatible)
14:45:56 DEBUG| input: ADB mouse as /devices/virtual/input/input1
14:45:56 DEBUG| adb: finished probe task...
14:45:56 DEBUG| ide-pmac: Found Apple KeyLargo ATA-3 controller (macio), bus ID 0, irq 16
14:45:56 DEBUG| ide0 at 0xc9011000-0xc9011070,0xc9011160 on irq 16
14:45:56 DEBUG| ide-pmac: Found Apple KeyLargo ATA-3 controller (macio), bus ID 1, irq 18
14:45:56 DEBUG| hdc: QEMU DVD-ROM, ATAPI CD/DVD-ROM drive
14:45:56 DEBUG| hdc: MWDMA2 mode selected
14:45:56 DEBUG| ide1 at 0xc9017000-0xc9017070,0xc9017160 on irq 18
14:45:56 DEBUG| ide-gd driver 1.18
14:45:56 DEBUG| ide-cd driver 5.00
14:45:56 DEBUG| ide-cd: hdc: ATAPI 4X DVD-ROM drive, 512kB Cache
14:45:56 DEBUG| cdrom: Uniform CD-ROM driver Revision: 3.20
14:45:56 DEBUG| ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
14:45:56 DEBUG| ohci-pci: OHCI PCI platform driver
14:45:56 DEBUG| ohci-pci 0000:00:0d.0: OHCI PCI host controller
14:45:56 DEBUG| ohci-pci 0000:00:0d.0: new USB bus registered, assigned bus number 1
14:45:56 DEBUG| ohci-pci 0000:00:0d.0: irq 28, io mem 0x80080000
14:45:56 DEBUG| hub 1-0:1.0: USB hub found
14:45:56 DEBUG| hub 1-0:1.0: 3 ports detected
14:45:56 DEBUG| usbcore: registered new interface driver usbhid
14:45:56 DEBUG| usbhid: USB HID core driver
14:45:56 DEBUG| ALSA device list:
14:45:56 DEBUG| No soundcards found.
14:45:56 DEBUG| Freeing unused kernel memory: 1016K
14:45:56 DEBUG| This architecture does not have kernel memory protection.
14:45:57 DEBUG| Starting logging: OK
14:45:58 DEBUG| QEMU advent calendar 2018 - log in as 'root' and run 'ascii_invaders' to play the game
14:45:58 INFO | successfully finished the replay
14:45:58 INFO | elapsed time 73.88 sec
14:45:58 INFO | replay overhead 362.76%
14:45:58 DEBUG| DATA (filename=output.expected) => NOT FOUND (data sources: variant, test, file)
14:45:58 DEBUG| DATA (filename=stdout.expected) => NOT FOUND (data sources: variant, test, file)
14:45:58 DEBUG| DATA (filename=stderr.expected) => NOT FOUND (data sources: variant, test, file)
14:45:58 INFO | PASS 28-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_ppc_mac99
14:45:58 INFO | 

--------------B5C51C4D1188BE6C2E0AE93A--


