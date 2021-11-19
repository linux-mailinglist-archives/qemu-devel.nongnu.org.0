Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886BE45757B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:29:42 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7hl-0003mH-IN
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:29:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7RA-0007IK-Qi
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:32 -0500
Received: from [2a00:1450:4864:20::32f] (port=33681
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo7R8-0006QO-Ki
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 12:12:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso8139709wmh.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 09:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yKHiWsNR0W++K0Ck4B1IBleMBkNdeLmDWfP2xP1p/hE=;
 b=PetEfr7DyTFftf2v4UA+fEQWvLKUzirQcNZ+TehjAomflof6vQIRsEQfqohrHwLmYd
 rrt/jvC8FfABvv4X5l3/XqmcSvcyWjVD+Fqm3idPNjqGE7vFi0nvQ6j8tjzL65csfAEi
 SoUyZmD+xRI5tAEVfVPaXvHb9aW71pnbzwaHKon1PLQmsv/2ZmxrBXj8vwtXyykhMQhF
 Y4tc/0FQteeVI4CqSfoKuT0djSbTCM1sVDJKerHiJ3JwxMG9G4649sh18iNBjoA64jUi
 FhJJzmYwlZf8x7ahsKfqRWlF3P7ZzjXl/IqlNFogLsZF6Bukdo6mZBp5MtmxtVCxKfuD
 j3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yKHiWsNR0W++K0Ck4B1IBleMBkNdeLmDWfP2xP1p/hE=;
 b=5l5mMARBGoS9fSsSi7c0vgsBZtw1XeQGJFemt3Yf/SHlVWYEqQK9nB+99UzFVeO91p
 CofwnOSdItcDKO5JqDQ9o9Nd32EywCosJ0kwst0wn+8Wjr9dYgNfDcMu6n1fqoxPZ3PS
 Aig364JLT0mtv+O8YPW8qiA+FaYoLrnGfXB18r54IFo63VSFpedE8rge3DgQEZubQx9t
 Ep8ezhQVu81OONsYY7ciOPE7LDMVc7cBo93xDjl4R/T4bebdWxNyxt++t15vSVT/nJpt
 5eMYJmRgC7O8PTefowaFY22Rm5uM4M9eSWjeoJKRFmzPVIwdT2CG/xcEHzgPMSRYjSTi
 T0yg==
X-Gm-Message-State: AOAM532bMVJ/OkyoD2qJr9jI2rw1Lb7dSbYJK05dWQtc7nik0h7/zAio
 uFjaMWUQCYGdkzuSzCDNW75ek7gtKtY=
X-Google-Smtp-Source: ABdhPJx7ak6zBMYzt3QvOzUzjRs1kRST8o1Kt33RKaZVKSLnPNzyDIaGdTyGdJrE5pUKeJkxnp0rXw==
X-Received: by 2002:a1c:7910:: with SMTP id l16mr1588737wme.36.1637341948803; 
 Fri, 19 Nov 2021 09:12:28 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 a12sm303368wrm.62.2021.11.19.09.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 09:12:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [NOTFORMERGE PATCH 5/5] tests/avocado: Test NetBSD 9.2 on the Jazz
 Magnum machine
Date: Fri, 19 Nov 2021 18:12:02 +0100
Message-Id: <20211119171202.458919-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119171202.458919-1-f4bug@amsat.org>
References: <20211119171202.458919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test NetBSD 9.2 on the Jazz Magnum machine. As the firmware is not
redistributable, it has to be extracted from the floppy configuration
disk coming with a Mips Magnum 4000 system, then the NTPROM_BIN_PATH
environment variable has to be set. For convenience a NVRAM pre-
initialized to boot NetBSD is included. The test can be run as:

  $ NTPROM_BIN_PATH=/path/to/ntprom.bin \
    avocado --show=app,console \
    run -t machine:magnum tests/avocado/
  Fetching asset from tests/avocado/machine_mips_jazz.py:MipsJazz.test_magnum_netbsd_9_2
   (1/1) tests/avocado/machine_mips_jazz.py:MipsJazz.test_magnum_netbsd_9_2:
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
  console: NetBSD/arc Bootstrap, Revision 1.1 (Wed May 12 13:15:55 UTC 2021)
  console: devopen: scsi(0)cdrom(2)fdisk(0) type disk file netbsd
  console: NetBSD 9.2 (RAMDISK) #0: Wed May 12 13:15:55 UTC 2021
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
  console: # ifconfig
  console: sn0: flags=0x8802<BROADCAST,SIMPLEX,MULTICAST> mtu 1500
  console: ec_capabilities=1<VLAN_MTU>
  console: ec_enabled=0
  console: address: 00:00:00:02:03:04
  console: lo0: flags=0x8048<LOOPBACK,RUNNING,MULTICAST> mtu 33160
  console: #
  console: # ifconfig sn0 10.0.2.3/24
  console: #
  console: # ping -c 3 10.0.2.2
  console: PING 10.0.2.2 (10.0.2.2): 56 data bytes
  console: 64 bytes from 10.0.2.2: icmp_seq=0 ttl=255 time=12.526 ms
  console: 64 bytes from 10.0.2.2: icmp_seq=1 ttl=255 time=2.324 ms
  console: 64 bytes from 10.0.2.2: icmp_seq=2 ttl=255 time=0.608 ms
  console: ----10.0.2.2 PING Statistics----
  console: 3 packets transmitted, 3 packets received, 0.0% packet loss
  console: # shutdown -r now
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
  PASS (49.27 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 49.70 s

Inspired-by: Hervé Poussineau <hpoussin@reactos.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- Test NetBSD 9.2 (Finn, Mark)
- Drop '-global ds1225y.size=8200' (Mark)
- Mention "Run a program" option (Mark)
- Check ARP (Finn)

Not for merge until nvram.bin is generated.

Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 .../avocado/machine_mips_jazz.d/nvram.bin.xz  | Bin 0 -> 700 bytes
 tests/avocado/machine_mips_jazz.py            |  99 ++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 tests/avocado/machine_mips_jazz.d/nvram.bin.xz
 create mode 100644 tests/avocado/machine_mips_jazz.py

diff --git a/tests/avocado/machine_mips_jazz.d/nvram.bin.xz b/tests/avocado/machine_mips_jazz.d/nvram.bin.xz
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

diff --git a/tests/avocado/machine_mips_jazz.py b/tests/avocado/machine_mips_jazz.py
new file mode 100644
index 00000000000..1441b7fe5bb
--- /dev/null
+++ b/tests/avocado/machine_mips_jazz.py
@@ -0,0 +1,99 @@
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
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
+from avocado_qemu import wait_for_console_pattern
+
+from tesseract_utils import tesseract_available, tesseract_ocr
+
+class MipsJazz(QemuSystemTest):
+
+    timeout = 60
+
+    @skipUnless(os.getenv('NTPROM_BIN_PATH'), 'NTPROM_BIN_PATH not available')
+    def test_magnum_netbsd_9_2(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:magnum
+        :avocado: tags=os:netbsd
+        :avocado: tags=device:sonic
+        :avocado: tags=device:esp
+        """
+        drive_url = ('http://cdn.netbsd.org/pub/NetBSD/'
+                     'NetBSD-9.2/images/NetBSD-9.2-arc.iso')
+        drive_hash = '409c61aee5459e762cdb120d2591ed2e'
+        drive_path = self.fetch_asset(drive_url, asset_hash=drive_hash,
+                                      algorithm='md5')
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
+        mac = '00:00:00:02:03:04'
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
+                         '-nic', 'user,model=dp83932,mac=' + mac)
+        self.vm.launch()
+
+        console_pattern = 'ARC Multiboot Version 174 (SGI Version 2.6)'
+        wait_for_console_pattern(self, console_pattern)
+
+        wait_for_console_pattern(self, 'Use the arrow keys to select.')
+
+        # Press cursor control 'Down' to select the "Run a program" menu
+        exec_command(self, '\x1b[B')
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
+        exec_command_and_wait_for_pattern(self, 'ifconfig', 'address: ' + mac)
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


