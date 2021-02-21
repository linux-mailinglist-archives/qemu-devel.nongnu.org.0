Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00796320D47
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 20:46:27 +0100 (CET)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDugU-0006i8-2T
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 14:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDucm-0002oO-W0
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:42:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuck-0006v4-93
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:42:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id n10so12502443wmq.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 11:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mz2JvmknQ3dcMHeKvY6Ttas9KYnc1Ho2yP2kBlQDSJ8=;
 b=t7pRm7XLFR3vjLjBmJ3VmWSSt49tj+sfgsBEyVgItTOlnzuDtwYPe4zg9miBcn9fjA
 +24/wN1nPn7y/QJoK3fhBfAVc9mEqFqrT/wBY3jYPUfwsVdNVpzHe15EpCmnD74qJ/I6
 VtY/vYqhMNglxRJuEQtrPAP2JJ80dF9w0v5T9fgYZnfaobz0a0WJP2AZC22e9XdY4hVm
 GFshAp41r5NBwCXCYu7N1YeDvpbSipVic5p6+2y3WDE73vS3E0pOOiLQnPpuFddR5apA
 9YjYtwR4Ercsd3B9N72V6OMFY+T6AjDasJpvnS9LpJsjPMOZUbbUavU/3kOTRB2R0X/H
 9D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mz2JvmknQ3dcMHeKvY6Ttas9KYnc1Ho2yP2kBlQDSJ8=;
 b=mvk7uAtnXhdf57IuL13zlbj3yW31AhzmDBy+43ux8ogLNdBGvhcMl06BwDZiUDbPBh
 4osawwp/NH92jfnUQpjIkbKfMV0oKB8dxpPcE7HEfKPn2kznIy2ucY0h7KJchOMayHNc
 EyRCVStcytoWhJ+5udCZOamQtr0SardQW0u3nkhhrRFDVXhalTEuoeP/9Xuie4HM6A9C
 niWrB1IGzCYPx7jWJZ+k/mywC3qdpPNFhnz0Vh0QfUj4n+yK9lQVwSDgp3t1alp/NDLU
 RcgvXRjnvlVpp2IPGg+JzRQ0Io2UyeSBdKIXdrCXSX/6Fq2ALESuiJPzAPG5TIlyeZlT
 HoqQ==
X-Gm-Message-State: AOAM530pcA1jRBVGmG5Jpsxq8Gto1lm2JVgHIoZP080DU/uatNbsvbns
 ACGbrJRfpjYNCZY32XCbUSLabzLb47M=
X-Google-Smtp-Source: ABdhPJza39cHYpw86X7FELRXhwuoRsx2csXWKxoOQ+6NZZItthSF5z5KSqIzubgVlprIUJ7ajK2t5g==
X-Received: by 2002:a1c:c388:: with SMTP id
 t130mr17211658wmf.107.1613936552545; 
 Sun, 21 Feb 2021 11:42:32 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j2sm2966848wrt.81.2021.02.21.11.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 11:42:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/43] tests/acceptance: Test PMON with Loongson-3A1000 CPU
Date: Sun, 21 Feb 2021 20:38:51 +0100
Message-Id: <20210221193851.2528045-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221193851.2528045-1-f4bug@amsat.org>
References: <20210221193851.2528045-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Test booting of PMON bootloader on loongson3-virt platform.

$ (venv) AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
    avocado --show=app,console \
      run -t machine:loongson3-virt tests/acceptance
Fetching asset from tests/acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console
JOB ID     : 8e202b3727847c9104d0d3d6546ed225d35f6706
JOB LOG    : /home/flygoat/avocado/job-results/job-2021-01-12T10.02-8e202b3/job.log
 (1/1) tests/acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console:
console: PMON2000 MIPS Initializing. Standby...
console: 00000000Jump to 9fc
console: Init Memory done.
console: The uncache data is:
console: 00000000:  5555555555555555
console: 00000008:  aaaaaaaaaaaaaaaa
console: 00000010:  3333333333333333
console: 00000018:  cccccccccccccccc
console: 00000020:  7777777777777777
console: 00000028:  8888888888888888
console: 00000030:  1111111111111111
console: 00000038:  eeeeeeeeeeeeeeee
console: The cached  data is:
console: 00000000:  5555555555555555
console: 00000008:  aaaaaaaaaaaaaaaa
console: 00000010:  3333333333333333
console: 00000018:  cccccccccccccccc
console: 00000020:  7777777777777777
console: 00000028:  8888888888888888
console: 00000030:  1111111111111111
console: 00000038:  eeeeeeeeeeeeeeee
console: Copy PMON to execute location...
console: start = 0x8f900000
console: s0 = 0x30300000
console: _edata = 0x8f989010
console: _end = 0x8f98a028copy text section done.
console: Copy PMON to execute location done.
console: sp=8f8fc000
console: Uncompressing Bios............................................................................OK,Booting Bios
console: FREQ
console: DONE
console: DEVI
console: ENVI
console: MAPV
console: NVRAM@8f7ff898
console: STDV
console: 80100000:  memory between 8f7ff400-8f800000  is already been allocated,heap is already above this point
console: SBDD
console: P12PCIH
console: PCIH
console: PCID
console: setting up 1 bus
console: PCI bus 0 slot 1: probe...completed
console: PCI bus 0 slot 1/0: vendor/product: 0x106b/0x003f (serialbus, USB, interface: 0x10, revision: 0x00)
console: PCI bus 0 slot 1/0: reg 0x10 = 0xffffff00
console: PCI bus 0 slot 2: probe...completed
console: PCI bus 0 slot 2/0: vendor/product: 0x1af4/0x1000 (network, ethernet, interface: 0x00, revision: 0x00)
console: PCI bus 0 slot 2/0: reg 0x10 = 0xffffffe1
console: PCI bus 0 slot 2/0: reg 0x14 = 0xfffff000
console: PCI bus 0 slot 2/0: reg 0x20 = 0xffffc00c
console: PCI bus 0 slot 2/0: reg 0x30 = 0xfffc0000
console: PCI bus 0 slot 3: probe...completed
console: PCI bus 0 slot 4: probe...completed
console: PCI bus 0 slot 5: probe...completed
console: PCI bus 0 slot 6: probe...completed
console: PCI bus 0 slot 7: probe...completed
console: PCI bus 0 slot 8: probe...completed
console: PCI bus 0 slot 9: probe...completed
console: PCI bus 0 slot 10: probe...completed
console: PCI bus 0 slot 11: probe...completed
console: PCI bus 0 slot 12: probe...completed
console: PCI bus 0 slot 13: probe...completed
console: PCI bus 0 slot 14: probe...completed
console: PCI bus 0 slot 15: probe...completed
console: PCI bus 0 slot 16: probe...completed
console: PCI bus 0 slot 17: probe...completed
console: PCI bus 0 slot 18: probe...completed
console: PCI bus 0 slot 19: probe...completed
console: PCI bus 0 slot 20: probe...completed
console: PCI bus 0 slot 21: probe...completed
console: PCI bus 0 slot 22: probe...completed
console: PCI bus 0 slot 23: probe...completed
console: PCI bus 0 slot 24: probe...completed
console: PCI bus 0 slot 25: probe...completed
console: PCI bus 0 slot 26: probe...completed
console: PCI bus 0 slot 27: probe...completed
console: PCI bus 0 slot 28: probe...completed
console: PCI bus 0 slot 29: probe...completed
console: PCI bus 0 slot 30: probe...completed
console: PCI bus 0 slot 31: probe...completed
console: PCIS
console: PCIR
console: PCIW
console: PCI bus 0 slot 2/0: mem @0x40000000, reg 0x30 262144 bytes
console: PCI bus 0 slot 2/0: mem @0x40040000, reg 0x20 16384 bytes
console: PCI bus 0 slot 2/0: mem @0x40044000, reg 0x14 4096 bytes
console: PCI bus 0 slot 1/0: mem @0x40045000, reg 0x10 256 bytes
console: PCI bus 0 slot 2/0: exp @0x40000000, 262144 bytes
console: PCI bus 0 slot 2/0: i/o @0x00004000, reg 0x10 32 bytes
console: NETI
console: RTCL
console: PCID
console: VGAI
console: memorysize=c000000,base=8f6ff508,sysMem=8f6ef500
console: in setup_int_vect!done!VESA
console: vga bios init failed, rc=-1
console: in configure
console: mainbus0 (root)
console: localbus0 at mainbus0
console: loopdev0 at mainbus0pcibr0 at mainbus0
console: pci0 at pcibr0 bus 0
console: ohci0 at pci0 dev 1 function 0 vendor/product: 0x106b/0x003f (serialbus, USB, interface: 0x10, revision: 0x00)usb base addr : 0xc0045000, bus_base is : 0xc0000000
console: OHCI revision: 0x00000010
console: RH: a: 0x00000203 b: 0x00000000
console: early period(0x0)
console: OHCI 8c01ec00 initialized ok
console: New Device 0
console: usb_get_descriptor
console: bLength = 12
console: bDescriptorType =1
console: bcdUSB =  110
console: bDeviceClass =9
console: bDeviceSubClass =0
console: bDeviceProtocol =0
console: bMaxPacketSize0 =8
console: set address 1
console: usb_get_descriptor
console: bLength = 12
console: bDescriptorType =1
console: bcdUSB =  110
console: bDeviceClass =9
console: bDeviceSubClass =0
console: bDeviceProtocol =0
console: bMaxPacketSize0 =8
console: idVendor =0
console: idProduct =0
console: bcdDevice =0
console: iManufacturer=0
console: iProduct =1
console: iSerialNumber=0
console: bNumConfigurations=1
console: usb_get_descriptor
console: usb_get_descriptor
console: get_conf_no 0 Result 25, wLength 25
console: if 0, ep 0
console: bLength=9
console: bDescriptorType=2
console: wTotalLength=19
console: bNumInterfaces=1
console: bConfigurationValue=1
console: iConfiguration=0
console: bmAttributes=40
console: MaxPower=0
console: 09 04 00 00 01 09 00 00 00 07 05 81 03 02 00 ff
console: ##EP epmaxpacketin[1] = 2
console: set configuration 1
console: new device strings: Mfr=0, Product=1, SerialNumber=0
console: USB device number 1 default language ID 0x409
console: Manufacturer
console: Product      OHCI Root Hub
console: SerialNumber
console: New Device 1
console: usb_get_descriptor
console: bLength = 12
console: bDescriptorType =1
console: bcdUSB =  200
console: bDeviceClass =0
console: bDeviceSubClass =0
console: bDeviceProtocol =0
console: bMaxPacketSize0 =8
console: set address 2
console: usb_get_descriptor
console: bLength = 12
console: bDescriptorType =1
console: bcdUSB =  200
console: bDeviceClass =0
console: bDeviceSubClass =0
console: bDeviceProtocol =0
console: bMaxPacketSize0 =8
console: idVendor =627
console: idProduct =1
console: bcdDevice =0
console: iManufacturer=1
console: iProduct =4
console: iSerialNumber=b
console: bNumConfigurations=1
console: usb_get_descriptor
console: usb_get_descriptor
console: get_conf_no 0 Result 34, wLength 34
console: unknown Description Type : 21
console: 09 21 11 01 00 01 22 3F 00
console: if 0, ep 0
console: bLength=9
console: bDescriptorType=2
console: wTotalLength=22
console: bNumInterfaces=1
console: bConfigurationValue=1
console: iConfiguration=8
console: bmAttributes=a0
console: MaxPower=32
console: 09 04 00 00 01 03 01 01 00 09 21 11 01 00 01 22 3f 00 07 05 81 03 08 00 0a
console: ##EP epmaxpacketin[1] = 8
console: set configuration 1
console: new device strings: Mfr=1, Product=4, SerialNumber=11
console: USB device number 2 default language ID 0x409
console: Manufacturer QEMU
console: Product      QEMU USB Keyboard
console: SerialNumber 68284-0000:00:01.0-1
console: drive at ohci0 devnum 2, Product QEMU USB Keyboard
console: not configured
console: New Device 2
console: usb_get_descriptor
console: bLength = 12
console: bDescriptorType =1
console: bcdUSB =  200
console: bDeviceClass =0
console: bDeviceSubClass =0
console: bDeviceProtocol =0
console: bMaxPacketSize0 =8
console: set address 3
console: usb_get_descriptor
console: bLength = 12
console: bDescriptorType =1
console: bcdUSB =  200
console: bDeviceClass =0
console: bDeviceSubClass =0
console: bDeviceProtocol =0
console: bMaxPacketSize0 =8
console: idVendor =627
console: idProduct =1
console: bcdDevice =0
console: iManufacturer=1
console: iProduct =3
console: iSerialNumber=a
console: bNumConfigurations=1
console: usb_get_descriptor
console: usb_get_descriptor
console: get_conf_no 0 Result 34, wLength 34
console: unknown Description Type : 21
console: 09 21 01 00 00 01 22 4A 00
console: if 0, ep 0
console: bLength=9
console: bDescriptorType=2
console: wTotalLength=22
console: bNumInterfaces=1
console: bConfigurationValue=1
console: iConfiguration=7
console: bmAttributes=a0
console: MaxPower=32
console: 09 04 00 00 01 03 00 00 00 09 21 01 00 00 01 22 4a 00 07 05 81 03 08 00 0a
console: ##EP epmaxpacketin[1] = 8
console: set configuration 1
console: new device strings: Mfr=1, Product=3, SerialNumber=10
console: USB device number 3 default language ID 0x409
console: Manufacturer QEMU
console: Product      QEMU USB Tablet
console: SerialNumber 28754-0000:00:01.0-2
console: drive at ohci0 devnum 3, Product QEMU USB Tablet
console: not configured
console: drive at ohci0 devnum 1, Product OHCI Root Hub
console: not configured
console: vendor/product: 0x1af4/0x1000 (network, ethernet, interface: 0x00, revision: 0x00) at pci0 dev 2 function 0 not configured
console: out configure
console: Press <Del> to set BIOS,waiting for 3 seconds here.....
console: devconfig done.
console: ifinit done.
console: domaininit done.
console: init_proc....
console: HSTI
console: SYMI
console: SBDE
console: [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
console: [[  [[[[[[[[[       [[[[[       [[[[   [[[[[  [[[[[      [[[[[       [[[[[       [[[[   [[[[[  [[
console: [[  [[[[[[[[   [[[[  [[[   [[[[  [[[    [[[[  [[[[  [[[[  [[[   [[[[  [[[   [[[[  [[[    [[[[  [[
console: [[  [[[[[[[[  [[[[[[ [[[  [[[[[[ [[[  [  [[[  [[[  [[[[[[[[[[[[   [[[[[[[  [[[[[[ [[[  [  [[[  [[
console: [[  [[[[[[[[  [[[[[[ [[[  [[[[[[ [[[  [[  [[  [[[  [[[    [[[[[[[    [[[[  [[[[[[ [[[  [[  [[  [[
console: [[  [[[[[[[[  [[[[[[ [[[  [[[[[[ [[[  [[[  [  [[[  [[[[[  [[[[[[[[[[  [[[  [[[[[[ [[[  [[[  [  [[
console: [[  [[[[[[[[   [[[[  [[[   [[[[  [[[  [[[[    [[[   [[[[  [[[   [[[  [[[[   [[[[  [[[  [[[[    [[
console: [[       [[[[       [[[[[       [[[[  [[[[[   [[[[       [[[[[      [[[[[[       [[[[  [[[[[   [[
console: [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[2011 Loongson][[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
console: Configuration [Bonito,EL,NET,SCSI,IDE]
console: Version: PMON2000 3.3 (Bonito) #0: Tue Dec 22 01:58:09 UTC 2020 commit b3ece66234adbf7d4e453f0ba4f326c099ac2a76 Author: Jiaxun Yang <jiaxun.yang@flygoat.com> Date:   Tue Dec 22 09:51:10 2020 +0800 .
console: Supported loaders [txt, srec, elf, bin]
console: Supported filesystems [net, fat, fs, disk, iso9660, socket, tty, ram]
console: This software may be redistributed under the BSD copyright.
console: Copyright 2000-2002, Opsycon AB, Sweden.
console: Copyright 2005, ICT CAS.
console: CPU GODSON3 BogoMIPS: 1327
PASS (3.89 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 4.38 s

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
[PMD: Set timeout to 60sec, simply test for ''CPU GODSON3 BogoMIPS']
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS                                 |  1 +
 tests/acceptance/machine_mips_loongson3v.py | 39 +++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 tests/acceptance/machine_mips_loongson3v.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 5eeba79c5a3..ac411c27f93 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1183,6 +1183,7 @@ F: hw/intc/loongson_liointc.c
 F: hw/mips/loongson3_bootp.c
 F: hw/mips/loongson3_bootp.h
 F: hw/mips/loongson3_virt.c
+F: tests/acceptance/machine_mips_loongson3v.py
 
 Boston
 M: Paul Burton <paulburton@kernel.org>
diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/acceptance/machine_mips_loongson3v.py
new file mode 100644
index 00000000000..85b131a40f0
--- /dev/null
+++ b/tests/acceptance/machine_mips_loongson3v.py
@@ -0,0 +1,39 @@
+# Functional tests for the Generic Loongson-3 Platform.
+#
+# Copyright (c) 2021 Jiaxun Yang <jiaxun.yang@flygoat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import time
+
+from avocado import skipUnless
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class MipsLoongson3v(Test):
+    timeout = 60
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_pmon_serial_console(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=endian:little
+        :avocado: tags=machine:loongson3-virt
+        :avocado: tags=cpu:Loongson-3A1000
+        :avocado: tags=device:liointc
+        :avocado: tags=device:goldfish_rtc
+        """
+
+        pmon_hash = '7c8b45dd81ccfc55ff28f5aa267a41c3'
+        pmon_path = self.fetch_asset('https://github.com/loongson-community/pmon/'
+                                    'releases/download/20210112/pmon-3avirt.bin',
+                                     asset_hash=pmon_hash, algorithm='md5')
+
+        self.vm.set_console()
+        self.vm.add_args('-bios', pmon_path)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'CPU GODSON3 BogoMIPS:')
-- 
2.26.2


