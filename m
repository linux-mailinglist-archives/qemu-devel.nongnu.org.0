Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC01AC791
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 16:56:56 +0200 (CEST)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP5wk-00043I-RQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 10:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jP5v2-0002Iv-Mb
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:55:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jP5v1-0005XC-5h
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:55:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39780)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jP5v0-0005Wz-Vg; Thu, 16 Apr 2020 10:55:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id k15so1779287pfh.6;
 Thu, 16 Apr 2020 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IaopjLZeEWsUxvp8YecrdwwFLS7fRY69Qv9AmyzBsXI=;
 b=Q0i6qUDD6VGJuPpPLnB8KQf4klkPvVFjsUM3Bn6rvic2V8Yq36bYQX1GXVsd8hzrDu
 FttnTuFGsKr/rBAU/bXXG5U5jJUbGrRCKZm5MRcnCj+yx6I/7gTOOvpbU4dO7hyCn7Wg
 eDECL8k6FhTNoDE90XDljXzn7PRGx9A5mcTBprMEZ3rmQzQ9kNKDG/TOYdCxHD9EjYWf
 URhBv6DgliDfu2HsqhAh1t1xf1+Ls4PpapIlBE/w3Sv5znJwC4jRJmvRfyA9ymgdAu7T
 KiOEsdF3/1HBirz8wzlnsjDUpyGGQnlJn+VSWdlcMijnnSjY9LKcHYKAhgPKAFmya97D
 fgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IaopjLZeEWsUxvp8YecrdwwFLS7fRY69Qv9AmyzBsXI=;
 b=gkCVHacJuWR9VuuyegfZ65ouarCDbf3uz81E9jnZyEEQASH3UYIPZ9bg8H5F1Yup/a
 2Uda9IZGqBY665PuPp8qhddC7yx3axPdebnIcMjMIPXx558W0UvSZLYWf49xssmiGqcV
 kRQZ8UQQlTb1xlb0TWYVR3GUidfnIkMiYiFju03sH+/AJjabzvoohEnpuPBMAw3oyi7A
 RVCJuo+/5vFMFTRyksnkVthPbvfBUn/2s7jnQAUyw0DDi0+6fDJ52b8fGk1A34SN8Vmp
 h3sEdsAN1+Th7oyBOQB7VYFTG5v/moqjFAUSetAOCZyvddrnV4IuMQunOAceUXHKzstt
 AIcw==
X-Gm-Message-State: AGi0PubPgpQFMdFH974xvY+tSb1VgO2TikO69EzqRR6WGvv1dBSoPp3N
 X18DMPpRenWOodrJtas+q6A=
X-Google-Smtp-Source: APiQypJ7hhCs1j9vrsyjQo2bzYmtUJMLWaUgVSV5Ht3fbetL2trhVCNMzpfMc+6DhmeX0JOiU9VnbQ==
X-Received: by 2002:a63:b251:: with SMTP id t17mr30371677pgo.44.1587048905524; 
 Thu, 16 Apr 2020 07:55:05 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id s63sm3671973pfb.44.2020.04.16.07.55.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 07:55:04 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu devel PATCH v6 0/3] Add SmartFusion2 EMAC block
Date: Thu, 16 Apr 2020 20:24:48 +0530
Message-Id: <1587048891-30493-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::433
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
Cc: Subbaraya Sundeep <sbhatta@marvell.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Subbaraya Sundeep <sbhatta@marvell.com>

This patch set emulates Ethernet MAC block
present in Microsemi SmartFusion2 SoC.

v6:
 Fixed destination address matching logic
 Added missing break in emac_write
v5:
 As per Philippe comments:
	Returned size in receive function
	Added link property to pass DMA memory
    Used FIELD() APIs
    Added mac_addr in emac state
    Used FIELD_EX32 and FIELD_DP32 APIs
    Simplified if else logics in emac_write/read
v4:
  Added loop back as per Jason's comment 
v3:
  Added SmartFusion2 ethernet test to tests/acceptance
v2:
  No changes. Fixed Signed-off mail id in patch 2/2

Testing:

1. Download u-boot.bin, uImage and msf2-devkit.dtb from
   https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
2. Copy uImage and msf2-devkit.dtb to suitable Qemu tftp directory
3. Launch Qemu by
   ./arm-softmmu/qemu-system-arm -M emcraft-sf2 -serial mon:stdio -kernel \
   u-boot.bin -display none -nic user,tftp=<qemu tftp directory>

Example:
./arm-softmmu/qemu-system-arm -M emcraft-sf2 -serial mon:stdio -kernel u-boot -display none -nic user,tftp=/home/hyd1358/qemu_tftp

U-Boot 2010.03-00000-ga7695d6 (Apr 04 2020 - 15:07:27)

CPU  : SmartFusion2 SoC (Cortex-M3 Hard IP)
Freqs: CORTEX-M3=142MHz,PCLK0=71MHz,PCLK1=71MHz
Board: M2S-FG484-SOM Rev 1A, www.emcraft.com
DRAM:  64 MB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   M2S_MAC

Hit any key to stop autoboot:  3  0 

M2S-FG484-SOM> run netboot
Using M2S_MAC device
TFTP from server 10.0.2.2; our IP address is 10.0.2.15
Filename 'uImage'.
Load address: 0xa0007fc0
Loading: *#################################################################
 #################################################################
 #################################################################
 ###############################################################
done
Bytes transferred = 3681568 (382d20 hex)
Using M2S_MAC device
TFTP from server 10.0.2.2; our IP address is 10.0.2.15
Filename 'msf2-devkit.dtb'.
Load address: 0xa0000200
Loading: *#
done
Bytes transferred = 1712 (6b0 hex)
## Booting kernel from Legacy Image at a0007fc0 ...
   Image Name:   
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3681504 Bytes =  3.5 MB
   Load Address: a0008000
   Entry Point:  a0008001
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.5.0-gb0e5502-dirty (hyd1358@hyd1358) (gcc version 4.4.1 (Sourcery G++ Lite 2010q1-189) ) #85 PREEMPT Sat Apr 4 23:26:40 IST 2020
[    0.000000] CPU: ARMv7-M [410fc231] revision 1 (ARMv7M), cr=00000000
[    0.000000] CPU: unknown data cache, unknown instruction cache
[    0.000000] Machine model: Microsemi SmartFusion 2 development board
[    0.000000] bootconsole [earlycon0] enabled
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
[    0.000000] Kernel command line: console=ttyS0,115200n8 panic=10 mem=64M@0xa0000000 earlyprintk
[    0.000000] PID hash table entries: 256 (order: -2, 1024 bytes)
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Memory: 61212K/65536K available (1612K kernel code, 75K rwdata, 680K rodata, 1224K init, 120K bss, 4324K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0x00000000 - 0x00001000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0x00000000 - 0xffffffff   (4095 MB)
[    0.000000]     lowmem  : 0xa0000000 - 0xa4000000   (  64 MB)
[    0.000000]     modules : 0xa0000000 - 0xa0800000   (   8 MB)
[    0.000000]       .text : 0xa0008000 - 0xa02453e8   (2293 kB)
[    0.000000]       .init : 0xa0246000 - 0xa0378000   (1224 kB)
[    0.000000]       .data : 0xa0378000 - 0xa038ace0   (  76 kB)
[    0.000000]        .bss : 0xa038ace0 - 0xa03a8ea0   ( 121 kB)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
.
.
.
[    0.445184] Found M2S MAC at 0x40041000, irq 18
[    0.448810] libphy: msf2 MII bus: probed
[    0.527047] ipip: IPv4 over IPv4 tunneling driver
[    0.532367] NET: Registered protocol family 10
[    0.542307] sit: IPv6 over IPv4 tunneling driver
[    0.544655] NET: Registered protocol family 17
[    0.565395] Freeing unused kernel memory: 1224K (a0246000 - a0378000)
init started: BusyBox v1.31.1 (2020-01-25 20:01:06 IST)
starting pid 26, tty '': '/etc/rc'
starting pid 31, tty '/dev/ttyS0': '/bin/hush -i'


BusyBox v1.31.1 (2020-01-25 20:01:06 IST) hush - the humble shell
Enter 'help' for a list of built-in commands.

/ # ifconfig eth0 10.0.2.15
[   11.116091] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
/ # [   11.653634] eth0: link up (100/full)
[   11.655246] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready

/ # ls
dev   proc  sys   etc   usr   bin   tmp   sbin  mnt   init
/ # tftp -gr uImage 10.0.2.2
[   40.780983] random: nonblocking pool is initialized
/ # ls
dev     sys     usr     tmp     mnt     uImage
proc    etc     bin     sbin    init
/ #    


Subbaraya Sundeep (3):
  hw/net: Add Smartfusion2 emac block
  msf2: Add EMAC block to SmartFusion2 SoC
  tests/boot_linux_console: Add ethernet test to SmartFusion2

 MAINTAINERS                            |   2 +
 hw/arm/msf2-soc.c                      |  26 +-
 hw/net/Makefile.objs                   |   1 +
 hw/net/msf2-emac.c                     | 589 +++++++++++++++++++++++++++++++++
 include/hw/arm/msf2-soc.h              |   2 +
 include/hw/net/msf2-emac.h             |  53 +++
 tests/acceptance/boot_linux_console.py |  15 +-
 7 files changed, 681 insertions(+), 7 deletions(-)
 create mode 100644 hw/net/msf2-emac.c
 create mode 100644 include/hw/net/msf2-emac.h

-- 
2.7.4


