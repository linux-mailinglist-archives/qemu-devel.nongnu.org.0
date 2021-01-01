Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056F42E85E4
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:16:09 +0100 (CET)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTeS-0000pl-3Q
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTbF-0004Pw-IA; Fri, 01 Jan 2021 18:12:49 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvTbC-0001z9-OQ; Fri, 01 Jan 2021 18:12:49 -0500
Received: by mail-wr1-x430.google.com with SMTP id d13so23336561wrc.13;
 Fri, 01 Jan 2021 15:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZFaL/tBEiGUgBljBvstAJrPr1DQcDPzv1CfU3zzA3U=;
 b=G9jluaP0jy6YijI9Utkj31L/O3aPlj4TVxaAKGfgPlhcWG6guGK1JAwhv+8uvyN45N
 7b/EXgBZWHJDP62iJEnBt/DHMHu63HpSVCPixZ8gupQBnVsA1qSdCYSqmLdjpOIs+SrA
 9pNqKMKG+Nkc2a+sLwE7Utda0jwfgmc9GB2Duq1xa/OcKp+PxzdbTh/0YD/+/ugnuvWQ
 OZXDtlD61Kfsu4n6yOcYlnbBnci7QqJd1XZy2/to/9Qu63CFgDvrOd4BmiMZ5ZNrPRWc
 qMiDYOadi3u4Jmg9ZPLehj2Yt55k1OpyQekXegr63CEMIzrg9TDVStLyKq0wgzxmvmbH
 lQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1ZFaL/tBEiGUgBljBvstAJrPr1DQcDPzv1CfU3zzA3U=;
 b=Z5XY/qEwC9gpYfCUbKFVZgd8Oq65hO0a91/8mfmvC7yi+I6WUganSUq/vPPjvLp1jW
 WHS+47ruAaGDTQeVT96PZu6tuJ6sqc3qUMJLkdhvSYihBQ0sIkif5RsxeIW6IJHJ9c+7
 4LdxIeMb3W+r5pdmqpHnfiWRYLGwwDa4aU07MMbpQ8NIwe8zjlHQ9hO4D0ig0M8iiV2/
 OQ/rl3dUidrepkVadeQdonF+9Aw0O1Kn+woU51ObMDRyB3GBUwdqSuvEIn9Z90aRhywm
 juutuDTnVfBfICVJRkdVvVKRTESK2ntTOfuCiGsTxPiRMorsUTTuRA/YAl0cmUoWjnPf
 5kGw==
X-Gm-Message-State: AOAM5310WIpFKhUcRLP1hs3ri1rtMchwcMgakZkWZ2beAAxu3VvTkYbo
 eeS9acJPh6zNiCT71aP+aBXg5dE5U7U=
X-Google-Smtp-Source: ABdhPJznecIwQf+mD9QbnIsTg9+RTIanmA+7CvjuP8M0wP+S1oaPeFBDb7/5J46W56e1Q2rKFoYqZg==
X-Received: by 2002:adf:c64f:: with SMTP id u15mr66510159wrg.270.1609542763971; 
 Fri, 01 Jan 2021 15:12:43 -0800 (PST)
Received: from x1w.redhat.com (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id c4sm18477181wmf.19.2021.01.01.15.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 15:12:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/5] tests/integration: Test Fuloong2E IDE drive,
 run userspace commands
Date: Sat,  2 Jan 2021 00:12:15 +0100
Message-Id: <20210101231215.1870611-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210101231215.1870611-1-f4bug@amsat.org>
References: <20210101231215.1870611-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Boot rootfs build by Guenter Roeck [*].

Full test output:

  $ avocado --show=app,console run -t machine:fuloong2e tests/acceptance/
  Fetching asset from tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e
  Fetching asset from tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e
  JOB ID     : 4a89d17bd6fa596220113ea9b974412c37c6cf9a
  JOB LOG    : /home/phil/avocado/job-results/job-2021-01-01T23.54-4a89d17/job.log
   (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e:
  console: [    0.000000] Initializing cgroup subsys cpuset
  console: [    0.000000] Initializing cgroup subsys cpu
  console: [    0.000000] Initializing cgroup subsys cpuacct
  console: [    0.000000] Linux version 3.16.0-6-loongson-2e (debian-kernel@lists.debian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 Debian 3.16.56-1+deb8u1 (2018-05-08)
  console: [    0.000000] memsize=256, highmemsize=0
  console: [    0.000000] CpuClock = 100000000
  console: [    0.000000] bootconsole [early0] enabled
  console: [    0.000000] CPU0 revision is: 00006302 (ICT Loongson-2)
  console: [    0.000000] FPU revision is: 00000501
  console: [    0.000000] Checking for the multiply/shift bug... no.
  console: [    0.000000] Checking for the daddiu bug... no.
  console: [    0.000000] Determined physical RAM map:
  console: [    0.000000]  memory: 0000000010000000 @ 0000000000000000 (usable)
  console: [    0.000000]  memory: 0000000004000000 @ 0000000010000000 (reserved)
  console: [    0.000000]  memory: 0000000003ffffff @ 000000001c000001 (reserved)
  console: [    0.000000] Initrd not found or empty - disabling initrd
  console: [    0.000000] Zone ranges:
  console: [    0.000000]   DMA      [mem 0x00000000-0x00ffffff]
  console: [    0.000000]   Normal   [mem 0x01000000-0x0fffffff]
  console: [    0.000000] Movable zone start for each node
  console: [    0.000000] Early memory node ranges
  console: [    0.000000]   node   0: [mem 0x00000000-0x0fffffff]
  console: [    0.000000] Reserving 0MB of memory at 0MB for crashkernel
  console: [    0.000000] Primary instruction cache 64kB, VIPT, direct mapped, linesize 32 bytes.
  console: [    0.000000] Primary data cache 64kB, 4-way, VIPT, no aliases, linesize 32 bytes
  console: [    0.000000] Unified secondary cache 512kB 4-way, linesize 32 bytes.
  console: [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16327
  console: [    0.000000] Kernel command line: printk.time=0 console=ttyS0 root=/dev/sda ro panic=-1 noreboot
  console: PID hash table entries: 1024 (order: -1, 8192 bytes)
  console: Dentry cache hash table entries: 32768 (order: 4, 262144 bytes)
  console: Inode-cache hash table entries: 16384 (order: 3, 131072 bytes)
  console: Memory: 250752K/262144K available (5597K kernel code, 716K rwdata, 1548K rodata, 480K init, 581K bss, 11392K reserved)
  console: NR_IRQS:128
  console: Console: colour dummy device 80x25
  console: Calibrating delay loop... 118.60 BogoMIPS (lpj=237216)
  console: pid_max: default: 32768 minimum: 301
  console: Security Framework initialized
  console: AppArmor: AppArmor disabled by boot time parameter
  console: Yama: disabled by default; enable with sysctl kernel.yama.*
  console: Mount-cache hash table entries: 2048 (order: 0, 16384 bytes)
  console: Mountpoint-cache hash table entries: 2048 (order: 0, 16384 bytes)
  console: Initializing cgroup subsys memory
  console: Initializing cgroup subsys devices
  console: Initializing cgroup subsys freezer
  console: Initializing cgroup subsys net_cls
  console: Initializing cgroup subsys blkio
  console: Initializing cgroup subsys perf_event
  console: Initializing cgroup subsys net_prio
  console: Checking for the daddi bug... no.
  console: ftrace: allocating 17617 entries in 18 pages
  console: devtmpfs: initialized
  console: futex hash table entries: 256 (order: -2, 6144 bytes)
  console: NET: Registered protocol family 16
  console: vgaarb: loaded
  console: SCSI subsystem initialized
  console: PCI host bridge to bus 0000:00
  console: pci_bus 0000:00: root bus resource [mem 0x14000000-0x1c000000]
  console: pci_bus 0000:00: root bus resource [io  0x4000-0xffff]
  console: pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
  console: via686b fix: ISA bridge
  console: via686b fix: ISA bridge done
  console: pci 0000:00:05.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
  console: pci 0000:00:05.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
  console: pci 0000:00:05.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
  console: pci 0000:00:05.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
  console: via686b fix: IDE
  console: via686b fix: IDE done
  console: pci 0000:00:05.4: quirk: [io  0xeee0-0xeeef] claimed by vt82c686 SMB
  console: pci 0000:00:07.0: BAR 6: assigned [mem 0x14000000-0x1403ffff pref]
  console: pci 0000:00:07.0: BAR 0: assigned [io  0x4000-0x40ff]
  console: pci 0000:00:07.0: BAR 1: assigned [mem 0x14040000-0x140400ff]
  console: pci 0000:00:05.2: BAR 4: assigned [io  0x4400-0x441f]
  console: pci 0000:00:05.3: BAR 4: assigned [io  0x4420-0x443f]
  console: Switched to clocksource MIPS
  console: NET: Registered protocol family 2
  console: TCP established hash table entries: 2048 (order: 0, 16384 bytes)
  console: TCP bind hash table entries: 2048 (order: 0, 16384 bytes)
  console: TCP: Hash tables configured (established 2048 bind 2048)
  console: TCP: reno registered
  console: UDP hash table entries: 512 (order: 0, 16384 bytes)
  console: UDP-Lite hash table entries: 512 (order: 0, 16384 bytes)
  console: NET: Registered protocol family 1
  console: PCI: Enabling device 0000:00:05.2 (0000 -> 0001)
  console: PCI: Enabling device 0000:00:05.3 (0000 -> 0001)
  console: audit: initializing netlink subsys (disabled)
  console: audit: type=2000 audit(1609541667.424:1): initialized
  console: HugeTLB registered 32 MB page size, pre-allocated 0 pages
  console: zbud: loaded
  console: VFS: Disk quotas dquot_6.5.2
  console: Dquot-cache hash table entries: 2048 (order 0, 16384 bytes)
  console: msgmni has been set to 489
  console: alg: No test for stdrng (krng)
  console: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
  console: io scheduler noop registered
  console: io scheduler deadline registered
  console: io scheduler cfq registered (default)
  console: Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
  console: console [ttyS0] disabled
  console: serial8250.0: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
  console: console [ttyS0] enabled
  console: console [ttyS0] enabled
  console: bootconsole [early0] disabled
  console: bootconsole [early0] disabled
  console: pata_via 0000:00:05.1: BMDMA: BAR4 is zero, falling back to PIO
  console: scsi0 : pata_via
  console: scsi1 : pata_via
  console: ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
  console: ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
  console: serio: i8042 KBD port at 0x60,0x64 irq 1
  console: serio: i8042 AUX port at 0x60,0x64 irq 12
  console: mousedev: PS/2 mouse device common for all mice
  console: rtc_cmos rtc_cmos: rtc core: registered rtc_cmos as rtc0
  console: rtc_cmos rtc_cmos: alarms up to one day, 114 bytes nvram
  console: ata1.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
  console: ata1.00: 15320 sectors, multi 16: LBA48
  console: ledtrig-cpu: registered to indicate activity on CPUs
  console: TCP: cubic registered
  console: NET: Registered protocol family 10
  console: input: AT Raw Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
  console: ata1.00: configured for PIO4
  console: mip6: Mobile IPv6
  console: NET: Registered protocol family 17
  console: mpls_gso: MPLS GSO support
  console: registered taskstats version 1
  console: rtc_cmos rtc_cmos: setting system clock to 2021-01-01 22:54:20 UTC (1609541660)
  console: scsi 0:0:0:0: Direct-Access     ATA      QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
  console: input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input2
  console: sd 0:0:0:0: [sda] 15320 512-byte logical blocks: (7.84 MB/7.48 MiB)
  console: sd 0:0:0:0: [sda] Write Protect is off
  console: sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
  console: sda: unknown partition table
  console: sd 0:0:0:0: [sda] Attached SCSI disk
  console: EXT4-fs (sda): mounting ext3 file system using the ext4 subsystem
  console: EXT4-fs (sda): mounted filesystem with ordered data mode. Opts: (null)
  console: VFS: Mounted root (ext3 filesystem) readonly on device 8:0.
  console: Freeing unused kernel memory: 480K (ffffffff808b8000 - ffffffff80930000)
  console: random: nonblocking pool is initialized
  console: EXT4-fs (sda): re-mounted. Opts: errors=remount-ro,data=ordered
  console: Boot successful.
  console: cat /proc/cpuinfo
  console: / # cat /proc/cpuinfo
  console: system type            : lemote-fuloong-2e-box
  console: machine                        : Unknown
  console: processor              : 0
  console: cpu model              : ICT Loongson-2 V0.2  FPU V0.1
  console: BogoMIPS               : 118.60
  console: wait instruction       : nouname -a
  console: microsecond timers     : yes
  console: tlb_entries            : 64
  console: extra interrupt vector : no
  console: hardware watchpoint    : yes, count: 0, address/irw mask: []
  console: isa                    : mips1 mips2 mips3
  console: ASEs implemented       :
  console: shadow register sets   : 1
  console: kscratch registers     : 0
  console: package                        : 0
  console: core                   : 0
  console: VCED exceptions                : not available
  console: VCEI exceptions                : not available
  console: / # uname -a
  console: Linux (none) 3.16.0-6-loongson-2e #1 Debian 3.16.56-1+deb8u1 (2018-05-08) mips64 GNU/Linux
  console: reboot
  console: / # reboot
  console: / # umount: devtmpfs busy - remounted read-only
  console: EXT4-fs (sda): re-mounted. Opts: (null)
  console: The system is going down NOW!
  console: Sent SIGTERM to all processes
  console: Sent SIGKILL to all processes
  console: Requesting system reboot
  console: sd 0:0:0:0: [sda] Synchronizing SCSI cache
  console: reboot: Restarting system
  PASS (8.44 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 8.85 s

[*] https://github.com/groeck/linux-build-test/

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Guenter Roeck <linux@roeck-us.net>
---
 tests/acceptance/boot_linux_console.py | 30 ++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index fb41bb7144b..91fdd3c4cb2 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -183,13 +183,39 @@ def test_mips64el_fuloong2e(self):
         kernel_path = self.extract_from_deb(deb_path,
                                             '/boot/vmlinux-3.16.0-6-loongson-2e')
 
+        rootfs_url = ('https://github.com/groeck/linux-build-test/'
+                      'raw/8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/'
+                      'rootfs/mipsel64/rootfs.mipsel.ext3.gz')
+        rootfs_hash = '4316abb84b3b8384e124ada7fc72ef8cd5577dac'
+        rootfs_path_gz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
+        rootfs_path = os.path.join(self.workdir, 'rootfs.mipsel.ext3')
+        archive.gzip_uncompress(rootfs_path_gz, rootfs_path)
+
         self.vm.set_console()
-        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
+                               + 'console=ttyS0 '
+                               + 'root=/dev/sda ro '
+                               + 'panic=-1 noreboot')
         self.vm.add_args('-kernel', kernel_path,
-                         '-append', kernel_command_line)
+                         '-drive', 'if=none,format=raw,id=disk0,file='
+                                   + rootfs_path,
+                         '-device', 'ide-hd,bus=ide.0,drive=disk0',
+                         '-append', kernel_command_line,
+                         '-no-reboot')
         self.vm.launch()
+
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
+        self.wait_for_console_pattern('Boot successful.')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'BogoMIPS')
+        exec_command_and_wait_for_pattern(self, 'uname -a',
+                                                'Debian')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     def test_mips_malta_cpio(self):
         """
-- 
2.26.2


