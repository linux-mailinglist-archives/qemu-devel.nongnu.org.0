Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11303BB47F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 02:27:28 +0200 (CEST)
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0CSN-0000cF-E4
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 20:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0CRQ-0008Mo-MF
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 20:26:28 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0CRO-0000kJ-GP
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 20:26:28 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so19907334wri.4
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 17:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gRXcOg17Ucyn45BOFpKFsG+C5ZgaEUDdeULQfVRbwO4=;
 b=pNLWnVVQeQJTTK/Ypc4JZZTAHgYInWrpHfEXUDICvKGZavGeZdqBdo4Et+AAWWDQNO
 Jp/EeSxwq9f+Z2raocNw2SfbCeOU/Td9Yo9wCCCyjDIjns8k472fgMK4xJsmuCc8U6IQ
 TMz5BdMlBDy5YezcGp8BnVAnIKpQ0zj/e6cSm7wxf4twNC6slenRshTdJohUhvNMdXPv
 dAuP4qJPqQVlNYLwNlFCr4eH40jYLnRSRZXP8Gz6RZ1ziIrIrMNgaxvEUwKpzRelOxQp
 D2Mohxvki/RQNESthzeCDzCbLsxZvmuzfjgQfZ0YTPjFIDY2i4zbUiBKlvYeuLIe1UNc
 WRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gRXcOg17Ucyn45BOFpKFsG+C5ZgaEUDdeULQfVRbwO4=;
 b=EC/M0NgISad2kDcqeM8R71WPB8t3BbxbPKjQHVLupsTbWvvvbour76NxDjTssSqu7T
 CKZF3IqcdUIqAxKVjFFtewJKOO4zC6502ATdekJqTS4KxwiHyGeTToR7/5+P/ldH53zS
 pAIWNQZ7DgJH5ao4vUSwtGP17sZirT9k69zT0CFUqKxKYjlE2dnTYQiz9Ca8Z5iYcwO6
 raJ3+t+Et+JMiM6E244qeEGBX2C/dArijLUk5QPmnxZa746CrtcQqBzD7zk0LgYO9QHd
 0+bcqyu2i3ukSWzb8APEoy5rVC1ADKZZo0A3nOYrN4WU8xWb5s+wIUmysEsOkTO5Ph6H
 gA5Q==
X-Gm-Message-State: AOAM531jQTitCUYFZQGm8axk5SR1KJAywEJp7WtbyMYrl225KW3PF1AR
 zLNtt1spayycxQ7jN+wVVOCvVsrY9N8=
X-Google-Smtp-Source: ABdhPJxWtJ7YgfFkW+SJQi+HK6qkCxyLrhEv84zjcRwrkkIKjGPeK/xO74TvrSxrilr3Q1ldBx93Jg==
X-Received: by 2002:adf:f3c4:: with SMTP id g4mr12231457wrp.289.1625444780855; 
 Sun, 04 Jul 2021 17:26:20 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id i11sm21855320wmg.18.2021.07.04.17.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 17:26:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: Test NetBSD 5.1 on the Jazz Magnum machine
Date: Mon,  5 Jul 2021 02:26:18 +0200
Message-Id: <20210705002618.745807-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test NetBSD 5.1 on the Jazz Magnum machine. As the firmware is not
redistributable, it has to be extracted from the floppy configuration
disk coming with a Mips Magnum 4000 system, then the NTPROM_BIN_PATH
environment variable has to be set. For convenience a NVRAM pre-
initialized to boot NetBSD is included. The test can be run as:

  $ NTPROM_BIN_PATH=/path/to/ntprom.bin \
    avocado --show=app,console \
    run -t machine:magnum tests/acceptance/
  Fetching asset from tests/acceptance/machine_mips_jazz.py:MipsJazz.test_magnum_netbsd_5_1
   (1/1) tests/acceptance/machine_mips_jazz.py:MipsJazz.test_magnum_netbsd_5_1:
  console: EISA Bus 0 Initialization In Progress... Direct Memory Access (DMA) System Control Port B Timer 1 OK.
  console: ARC Multiboot Version 174 (SGI Version 2.6)
  console: Copyright (c) 1991,1992  Microsoft Corporation
  console: Actions:
  console: Start Windows NT
  console: Run a program
  console: Run setup
  console: Use the arrow keys to select.
  console: Press Enter to choose.
  console: Program to run:
  console: scsi(0)cdrom(2)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)netbsd
  console: NetBSD/arc Bootstrap, Revision 1.1
  console: (builds@b7.netbsd.org, Sat Nov  6 14:06:36 UTC 2010)
  console: devopen: scsi(0)cdrom(2)fdisk(0) type disk file netbsd
  console: NetBSD 5.1 (RAMDISK) #0: Sat Nov  6 14:17:36 UTC 2010
  console: builds@b7.netbsd.org:/home/builds/ab/netbsd-5-1-RELEASE/arc/201011061943Z-obj/home/builds/ab/netbsd-5-1-RELEASE/src/sys/arch/arc/compile/RAMDISK
  console: MIPS Magnum
  console: total memory = 128 MB
  console: avail memory = 117 MB
  console: mainbus0 (root)
  console: cpu0 at mainbus0: MIPS R4000 CPU (0x400) Rev. 0.0 with MIPS R4010 FPC Rev. 0.0
  console: cpu0: 8KB/16B direct-mapped L1 Instruction cache, 48 TLB entries
  console: cpu0: 8KB/16B direct-mapped write-back L1 Data cache
  console: jazzio0 at mainbus0
  console: timer0 at jazzio0 addr 0xe0000228
  console: mcclock0 at jazzio0 addr 0xe0004000: mc146818 compatible time-of-day clock
  console: LPT1 at jazzio0 addr 0xe0008000 intr 0 not configured
  console: fdc0 at jazzio0 addr 0xe0003000 intr 1
  console: fd0 at fdc0 drive 1: 1.44MB, 80 cyl, 2 head, 18 sec
  console: MAGNUM at jazzio0 addr 0xe000c000 intr 2 not configured
  console: VXL at jazzio0 addr 0xe0800000 intr 3 not configured
  console: sn0 at jazzio0 addr 0xe0001000 intr 4: SONIC Ethernet
  console: sn0: Ethernet address 00:00:00:00:00:00
  console: asc0 at jazzio0 addr 0xe0002000 intr 5: NCR53C94, 25MHz, SCSI ID 7
  console: scsibus0 at asc0: 8 targets, 8 luns per target
  console: pckbc0 at jazzio0 addr 0xe0005000 intr 6
  console: pckbd0 at pckbc0 (kbd slot)
  console: wskbd0 at pckbd0 (mux ignored)
  console: pms at jazzio0 addr 0xe0005000 intr 7 not configured
  console: com0 at jazzio0 addr 0xe0006000 intr 8: ns16550a, working fifo
  console: com0: txfifo disabled
  console: com0: console
  console: com1 at jazzio0 addr 0xe0007000 intr 9: ns16550a, working fifo
  console: com1: txfifo disabled
  console: jazzisabr0 at mainbus0
  console: isa0 at jazzisabr0
  console: isapnp0 at isa0 port 0x279: ISA Plug 'n Play device support
  console: scsibus0: waiting 2 seconds for devices to settle...
  console: cd0 at scsibus0 target 2 lun 0: <QEMU, QEMU CD-ROM, 2.5+> cdrom removable
  console: boot device: <unknown>
  console: root on md0a dumps on md0b
  console: root file system type: ffs
  console: WARNING: preposterous TOD clock time
  console: WARNING: using filesystem time
  console: WARNING: CHECK AND RESET THE DATE!
  console: erase ^H, werase ^W, kill ^U, intr ^C, status ^T
  console: Terminal type? [vt100]
  console: Erase is backspace.
  console: S
  console: (I)nstall, (S)hell or (H)alt ?
  console: #
  console: # ifconfig sn0 10.0.2.3/24
  console: # # #
  console: # ping -c 3 10.0.2.2
  console: # # # # # PING 10.0.2.2 (10.0.2.2): 56 data bytes
  console: 64 bytes from 10.0.2.2: icmp_seq=0 ttl=255 time=12.526 ms
  console: 64 bytes from 10.0.2.2: icmp_seq=1 ttl=255 time=2.324 ms
  console: 64 bytes from 10.0.2.2: icmp_seq=2 ttl=255 time=0.608 ms
  console: ----10.0.2.2 PING Statistics----
  console: 3 packets transmitted, 3 packets received, 0.0% packet loss
  console: shutdown -r now
  console: round-trip min/avg/max/stddev = 0.608/5.153/12.526/6.443 ms
  console: # Shutdown NOW!
  console: shutdown: [pid 14]
  console: # sh: /usr/bin/wall: not found
  console: reboot by root:
  console: System shutdown time has arrived
  console: About to run shutdown hooks...
  console: .: Can't open /etc/rc.shutdown
  console: Done running shutdown hooks.
  console: syncing disks... done
  console: unmounting file systems... done
  console: rebooting...
  PASS (39.06 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 39.54 s

Inspired-by: Hervé Poussineau <hpoussin@reactos.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .../machine_mips_jazz.d/nvram.bin.xz          | Bin 0 -> 700 bytes
 tests/acceptance/machine_mips_jazz.py         |  96 ++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 tests/acceptance/machine_mips_jazz.d/nvram.bin.xz
 create mode 100644 tests/acceptance/machine_mips_jazz.py

diff --git a/tests/acceptance/machine_mips_jazz.d/nvram.bin.xz b/tests/acceptance/machine_mips_jazz.d/nvram.bin.xz
new file mode 100644
index 0000000000000000000000000000000000000000..4648bb31a75bd1a6ee06818a1bf0f2109203ced3
GIT binary patch
literal 700
zcmV;t0z>`%H+ooF000E$*0e?f03iV!0000G&sfah5B~ysT>t=TewJhU2JbgNgw@93
z9ne@Of$dv11>H(&qfaP~{?QVNDD*)y9o<}llIpWo;zi4K%|O3oZX7;e0I%^w=#ho%
zm*3>5KcVeDb)hM{s=^@xl3*6CLiEr>=o;i$-UTTwy=`4vF_aQ@AM-}hS_gfV?dXL~
zr6}Ck7jr0Pd6X49Gycxm@5wylC8aWC%NAZ^DQmjk9v0R)a7u1hsY5)le9~S_G;wnI
zNEhT-#4+m{FhwCCTK#>itkJ+zGLq(>iH&;ourQ75=5X0GCmKgT34hXv`!lNS@Vv~9
z#dTZb1?<x%e;6UaEZ?$JT@1SBP5my9l7&XSs?W+Ufr||*z035xw~`at6Ee$`W+96+
z+GJc@N)TzeY@b#YPn@xQT6#fKq_~pFo)=4ZKP9K_BO1_^7pVTQNp$u}nKgZ>DkCrj
z^?l-ksd=`Q%7w&-3CkM)A-1nkM@y=-6N=HiA4b<WBKS^=)!oj-ZC_{*DGqZD2VzX1
zK{*4jgOsj!UPEwQ?*VD-2^<k{1^m(NV;8Ya)p-pwGWqQ7CAgX4w5vWiB095j=yfi%
zkXq_?C-K4b7)51+8S-t@;sSpTEtU7x1UZ|?WWEp59W6%y5<X+<RS_F7)N!aN8Lm!&
z-jRJ50VM#t_NLVKQ`#MuEWzq1$^|tn4L1MW?!$H&fc<(y1QHv6-#@=cN*d%QYMaA0
z+L!W3-k!*7dONwgWwK{?$5Yf5d8TRJIgw7WHR@zI6hLrbArpq|%Ax#6+d)m|&Wh%|
z!pU{tbl$cCNXE=B0Pf|j?*P-9X*vQHCH?48MX**q?{Zss*9HdGiu@Se*+j_z00023
i?D;I-mde`z0hR@TAOHX;UY-@P#Ao{g000001X)@jNK0n`

literal 0
HcmV?d00001

diff --git a/tests/acceptance/machine_mips_jazz.py b/tests/acceptance/machine_mips_jazz.py
new file mode 100644
index 00000000000..0b6640edc12
--- /dev/null
+++ b/tests/acceptance/machine_mips_jazz.py
@@ -0,0 +1,96 @@
+# Functional tests for the Jazz machines.
+#
+# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import lzma
+import shutil
+
+from avocado import skipUnless
+from avocado_qemu import Test
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
+from avocado_qemu import wait_for_console_pattern
+
+from tesseract_utils import tesseract_available, tesseract_ocr
+
+class MipsJazz(Test):
+
+    timeout = 60
+
+    @skipUnless(os.getenv('NTPROM_BIN_PATH'), 'NTPROM_BIN_PATH not available')
+    def test_magnum_netbsd_5_1(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:magnum
+        :avocado: tags=os:netbsd
+        :avocado: tags=device:sonic
+        :avocado: tags=device:esp
+        """
+        drive_url = ('http://archive.netbsd.org/pub/NetBSD-archive/'
+                     'NetBSD-5.1/iso/arccd-5.1.iso')
+        drive_hash = ('c91a57fb373636247d1f1ce283a610ba529e208604a'
+                      'f2a9e0237551fb3d25459c7697775af8c8d35a9764e'
+                      'fca87cfb591f363643e93417cfdb8857215ceb405e')
+        drive_path = self.fetch_asset(drive_url, asset_hash=drive_hash,
+                                      algorithm='sha512')
+        ntprom_hash = '316de17820192c89b8ee6d9936ab8364a739ca53'
+        ntprom_path = self.fetch_asset('file://' + os.getenv('NTPROM_BIN_PATH'),
+                                       asset_hash=ntprom_hash, algorithm='sha1')
+        nvram_size = 8200
+        nvram_path = 'nvram.bin'
+        nvram_xz_hash = '3d4565124ff2369706b97e1d0ef127a68c23d418'
+        nvram_xz_path = os.path.dirname(os.path.abspath(__file__)) \
+                        + '/machine_mips_jazz.d/nvram.bin.xz'
+        nvram_xz_path = self.fetch_asset('file://' + nvram_xz_path,
+                                         asset_hash=nvram_xz_hash,
+                                         algorithm='sha1')
+
+        with lzma.open(nvram_xz_path, 'rb') as f_in:
+            with open(nvram_path, 'wb') as f_out:
+                shutil.copyfileobj(f_in, f_out)
+                f_out.seek(nvram_size)
+                f_out.write(b'\0')
+
+        self.vm.set_console()
+        self.vm.add_args('-bios', ntprom_path,
+                         '-drive', 'if=scsi,unit=2,media=cdrom,format=raw,file='
+                                   + drive_path,
+                         '-global', 'ds1225y.filename=' + nvram_path,
+                         '-global', 'ds1225y.size=' + str(nvram_size),
+                         '-nic', 'user,model=dp83932,mac=00:00:00:02:03:04')
+        self.vm.launch()
+
+        console_pattern = 'ARC Multiboot Version 174 (SGI Version 2.6)'
+        wait_for_console_pattern(self, console_pattern)
+
+        wait_for_console_pattern(self, 'Use the arrow keys to select.')
+        exec_command(self, '\x1b[B') # Cursor Control 'Down'
+
+        program = 'scsi(0)cdrom(2)fdisk(0)boot scsi(0)cdrom(2)fdisk(0)netbsd'
+        exec_command(self, program)
+        wait_for_console_pattern(self, 'NetBSD/arc Bootstrap, Revision 1.1')
+
+        # Terminal type? [vt100]
+        console_pattern = 'erase ^H, werase ^W, kill ^U, intr ^C, status ^T'
+        wait_for_console_pattern(self, console_pattern)
+
+        # (I)nstall, (S)hell or (H)alt
+        exec_command_and_wait_for_pattern(self, '', 'Erase is backspace.')
+        exec_command(self, 'S')
+        interrupt_interactive_console_until_pattern(self, '#')
+
+        exec_command(self, 'ifconfig sn0 10.0.2.3/24')
+        interrupt_interactive_console_until_pattern(self, '#')
+
+        exec_command_and_wait_for_pattern(self, 'ping -c 3 10.0.2.2',
+                '3 packets transmitted, 3 packets received, 0.0% packet loss')
+
+        exec_command_and_wait_for_pattern(self, 'shutdown -r now',
+                                          'rebooting...')
-- 
2.31.1


