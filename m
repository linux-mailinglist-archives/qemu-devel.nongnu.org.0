Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966C862FA7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 06:36:49 +0200 (CEST)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkhs0-00023F-Qa
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 00:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40072)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hkhqo-0001Zv-4B
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hkhqm-00016O-0S
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:35:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:42120)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hkhqk-00014c-Sj
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 00:35:31 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hkhqh-0007fX-SU
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 04:35:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D13782E80C8
 for <qemu-devel@nongnu.org>; Tue,  9 Jul 2019 04:35:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jul 2019 04:25:48 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1835865@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: acpi piix
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
Message-Id: <156264634854.21327.17484948855790653898.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19007";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 4fd513cce23361a4747c61466e2e305a8f2c3a9a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1835865] [NEW] piix crashes on mips when
 accessing acpi-pci-hotplug
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1835865 <1835865@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

$ qemu-system-mips --version
QEMU emulator version 4.0.50 (v4.0.0-1975-gf34edbc760)

$ qemu-system-mips -machine malta -bios /dev/null -nodefaults -monitor stdi=
o -S
(qemu) o 0xaf00 0
qemu-system-mips: hw/acpi/cpu.c:197: cpu_hotplug_hw_init: Assertion `mc->po=
ssible_cpu_arch_ids' failed.
Aborted (core dumped)

(gdb) bt
#0  0x00007f6fd748957f in raise () at /lib64/libc.so.6
#1  0x00007f6fd7473895 in abort () at /lib64/libc.so.6
#2  0x00007f6fd7473769 in _nl_load_domain.cold.0 () at /lib64/libc.so.6
#3  0x00007f6fd7481a26 in .annobin_assert.c_end () at /lib64/libc.so.6
#4  0x00005646d58ca7bd in cpu_hotplug_hw_init (as=3D0x5646d6ae3300, owner=
=3D0x5646d6fd5b10, state=3D0x5646d6fd7a30, base_addr=3D44800) at hw/acpi/cp=
u.c:197
#5  0x00005646d58c5284 in acpi_switch_to_modern_cphp (gpe_cpu=3D0x5646d6fd7=
910, cpuhp_state=3D0x5646d6fd7a30, io_port=3D44800) at hw/acpi/cpu_hotplug.=
c:107
#6  0x00005646d58c3431 in piix4_set_cpu_hotplug_legacy (obj=3D0x5646d6fd5b1=
0, value=3Dfalse, errp=3D0x5646d61cdb28 <error_abort>) at hw/acpi/piix4.c:6=
17
#7  0x00005646d5b00c70 in property_set_bool (obj=3D0x5646d6fd5b10, v=3D0x56=
46d7697d30, name=3D0x5646d5cf3a90 "cpu-hotplug-legacy", opaque=3D0x5646d707=
d110, errp=3D0x5646d61cdb28 <error_abort>) at qom/object.c:2076
#8  0x00005646d5afeee6 in object_property_set (obj=3D0x5646d6fd5b10, v=3D0x=
5646d7697d30, name=3D0x5646d5cf3a90 "cpu-hotplug-legacy", errp=3D0x5646d61c=
db28 <error_abort>) at qom/object.c:1268
#9  0x00005646d5b01fb8 in object_property_set_qobject (obj=3D0x5646d6fd5b10=
, value=3D0x5646d75b5450, name=3D0x5646d5cf3a90 "cpu-hotplug-legacy", errp=
=3D0x5646d61cdb28 <error_abort>) at qom/qom-qobject.c:26
#10 0x00005646d5aff1cb in object_property_set_bool (obj=3D0x5646d6fd5b10, v=
alue=3Dfalse, name=3D0x5646d5cf3a90 "cpu-hotplug-legacy", errp=3D0x5646d61c=
db28 <error_abort>) at qom/object.c:1334
#11 0x00005646d58c4fce in cpu_status_write (opaque=3D0x5646d6fd7910, addr=
=3D0, data=3D0, size=3D1) at hw/acpi/cpu_hotplug.c:44
#12 0x00005646d569c707 in memory_region_write_accessor (mr=3D0x5646d6fd7920=
, addr=3D0, value=3D0x7ffc18053068, size=3D1, shift=3D0, mask=3D255, attrs=
=3D...) at memory.c:503
#13 0x00005646d569c917 in access_with_adjusted_size (addr=3D0, value=3D0x7f=
fc18053068, size=3D1, access_size_min=3D1, access_size_max=3D4, access_fn=
=3D0x5646d569c61e <memory_region_write_accessor>, mr=3D0x5646d6fd7920, attr=
s=3D...)
    at memory.c:569
#14 0x00005646d569f8f3 in memory_region_dispatch_write (mr=3D0x5646d6fd7920=
, addr=3D0, data=3D0, size=3D1, attrs=3D...) at memory.c:1497
#15 0x00005646d563e5c5 in flatview_write_continue (fv=3D0x5646d751b000, add=
r=3D44800, attrs=3D..., buf=3D0x7ffc180531d4 "", len=3D4, addr1=3D0, l=3D1,=
 mr=3D0x5646d6fd7920) at exec.c:3324
#16 0x00005646d563e70a in flatview_write (fv=3D0x5646d751b000, addr=3D44800=
, attrs=3D..., buf=3D0x7ffc180531d4 "", len=3D4) at exec.c:3363
#17 0x00005646d563ea0f in address_space_write (as=3D0x5646d618abc0 <address=
_space_io>, addr=3D44800, attrs=3D..., buf=3D0x7ffc180531d4 "", len=3D4) at=
 exec.c:3453
#18 0x00005646d5696ee5 in cpu_outl (addr=3D44800, val=3D0) at ioport.c:80
#19 0x00005646d57585d0 in hmp_ioport_write (mon=3D0x5646d6bc70e0, qdict=3D0=
x5646d6cf7140) at monitor/misc.c:1058
#20 0x00005646d5a77b99 in handle_hmp_command (mon=3D0x5646d6bc70e0, cmdline=
=3D0x5646d6bc2542 "0xaf00 0") at monitor/hmp.c:1082
#21 0x00005646d5a7540a in monitor_command_cb (opaque=3D0x5646d6bc70e0, cmdl=
ine=3D0x5646d6bc2540 "o 0xaf00 0", readline_opaque=3D0x0) at monitor/hmp.c:=
47
#22 0x00005646d5c71450 in readline_handle_byte (rs=3D0x5646d6bc2540, ch=3D1=
3) at util/readline.c:408
#23 0x00005646d5a7858f in monitor_read (opaque=3D0x5646d6bc70e0, buf=3D0x7f=
fc180533d0 "\rtc\327FV", size=3D1) at monitor/hmp.c:1312
#24 0x00005646d5bc8d17 in qemu_chr_be_write_impl (s=3D0x5646d6add000, buf=
=3D0x7ffc180533d0 "\rtc\327FV", len=3D1) at chardev/char.c:177
#25 0x00005646d5bc8d7b in qemu_chr_be_write (s=3D0x5646d6add000, buf=3D0x7f=
fc180533d0 "\rtc\327FV", len=3D1) at chardev/char.c:189
#26 0x00005646d5bcb6bf in fd_chr_read (chan=3D0x5646d6a80d60, cond=3DG_IO_I=
N, opaque=3D0x5646d6add000) at chardev/char-fd.c:68
#27 0x00005646d5bec485 in qio_channel_fd_source_dispatch (source=3D0x5646d7=
65a480, callback=3D0x5646d5bcb561 <fd_chr_read>, user_data=3D0x5646d6add000=
) at io/channel-watch.c:84
#28 0x00007f6fd9c1606d in g_main_context_dispatch () at /lib64/libglib-2.0.=
so.0
#29 0x00005646d5c5323a in glib_pollfds_poll () at util/main-loop.c:213
#30 0x00005646d5c532b4 in os_host_main_loop_wait (timeout=3D29821719) at ut=
il/main-loop.c:236
#31 0x00005646d5c533b9 in main_loop_wait (nonblocking=3D0) at util/main-loo=
p.c:512
#32 0x00005646d581d1a1 in main_loop () at vl.c:1791
#33 0x00005646d582485f in main (argc=3D11, argv=3D0x7ffc18054868, envp=3D0x=
7ffc180548c8) at vl.c:4473

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: acpi piix

** Summary changed:

- mips/malta crashes when accessing acpi-pci-hotplug
+ piix crashes on mips when accessing acpi-pci-hotplug

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1835865

Title:
  piix crashes on mips when accessing acpi-pci-hotplug

Status in QEMU:
  New

Bug description:
  $ qemu-system-mips --version
  QEMU emulator version 4.0.50 (v4.0.0-1975-gf34edbc760)

  $ qemu-system-mips -machine malta -bios /dev/null -nodefaults -monitor st=
dio -S
  (qemu) o 0xaf00 0
  qemu-system-mips: hw/acpi/cpu.c:197: cpu_hotplug_hw_init: Assertion `mc->=
possible_cpu_arch_ids' failed.
  Aborted (core dumped)

  (gdb) bt
  #0  0x00007f6fd748957f in raise () at /lib64/libc.so.6
  #1  0x00007f6fd7473895 in abort () at /lib64/libc.so.6
  #2  0x00007f6fd7473769 in _nl_load_domain.cold.0 () at /lib64/libc.so.6
  #3  0x00007f6fd7481a26 in .annobin_assert.c_end () at /lib64/libc.so.6
  #4  0x00005646d58ca7bd in cpu_hotplug_hw_init (as=3D0x5646d6ae3300, owner=
=3D0x5646d6fd5b10, state=3D0x5646d6fd7a30, base_addr=3D44800) at hw/acpi/cp=
u.c:197
  #5  0x00005646d58c5284 in acpi_switch_to_modern_cphp (gpe_cpu=3D0x5646d6f=
d7910, cpuhp_state=3D0x5646d6fd7a30, io_port=3D44800) at hw/acpi/cpu_hotplu=
g.c:107
  #6  0x00005646d58c3431 in piix4_set_cpu_hotplug_legacy (obj=3D0x5646d6fd5=
b10, value=3Dfalse, errp=3D0x5646d61cdb28 <error_abort>) at hw/acpi/piix4.c=
:617
  #7  0x00005646d5b00c70 in property_set_bool (obj=3D0x5646d6fd5b10, v=3D0x=
5646d7697d30, name=3D0x5646d5cf3a90 "cpu-hotplug-legacy", opaque=3D0x5646d7=
07d110, errp=3D0x5646d61cdb28 <error_abort>) at qom/object.c:2076
  #8  0x00005646d5afeee6 in object_property_set (obj=3D0x5646d6fd5b10, v=3D=
0x5646d7697d30, name=3D0x5646d5cf3a90 "cpu-hotplug-legacy", errp=3D0x5646d6=
1cdb28 <error_abort>) at qom/object.c:1268
  #9  0x00005646d5b01fb8 in object_property_set_qobject (obj=3D0x5646d6fd5b=
10, value=3D0x5646d75b5450, name=3D0x5646d5cf3a90 "cpu-hotplug-legacy", err=
p=3D0x5646d61cdb28 <error_abort>) at qom/qom-qobject.c:26
  #10 0x00005646d5aff1cb in object_property_set_bool (obj=3D0x5646d6fd5b10,=
 value=3Dfalse, name=3D0x5646d5cf3a90 "cpu-hotplug-legacy", errp=3D0x5646d6=
1cdb28 <error_abort>) at qom/object.c:1334
  #11 0x00005646d58c4fce in cpu_status_write (opaque=3D0x5646d6fd7910, addr=
=3D0, data=3D0, size=3D1) at hw/acpi/cpu_hotplug.c:44
  #12 0x00005646d569c707 in memory_region_write_accessor (mr=3D0x5646d6fd79=
20, addr=3D0, value=3D0x7ffc18053068, size=3D1, shift=3D0, mask=3D255, attr=
s=3D...) at memory.c:503
  #13 0x00005646d569c917 in access_with_adjusted_size (addr=3D0, value=3D0x=
7ffc18053068, size=3D1, access_size_min=3D1, access_size_max=3D4, access_fn=
=3D0x5646d569c61e <memory_region_write_accessor>, mr=3D0x5646d6fd7920, attr=
s=3D...)
      at memory.c:569
  #14 0x00005646d569f8f3 in memory_region_dispatch_write (mr=3D0x5646d6fd79=
20, addr=3D0, data=3D0, size=3D1, attrs=3D...) at memory.c:1497
  #15 0x00005646d563e5c5 in flatview_write_continue (fv=3D0x5646d751b000, a=
ddr=3D44800, attrs=3D..., buf=3D0x7ffc180531d4 "", len=3D4, addr1=3D0, l=3D=
1, mr=3D0x5646d6fd7920) at exec.c:3324
  #16 0x00005646d563e70a in flatview_write (fv=3D0x5646d751b000, addr=3D448=
00, attrs=3D..., buf=3D0x7ffc180531d4 "", len=3D4) at exec.c:3363
  #17 0x00005646d563ea0f in address_space_write (as=3D0x5646d618abc0 <addre=
ss_space_io>, addr=3D44800, attrs=3D..., buf=3D0x7ffc180531d4 "", len=3D4) =
at exec.c:3453
  #18 0x00005646d5696ee5 in cpu_outl (addr=3D44800, val=3D0) at ioport.c:80
  #19 0x00005646d57585d0 in hmp_ioport_write (mon=3D0x5646d6bc70e0, qdict=
=3D0x5646d6cf7140) at monitor/misc.c:1058
  #20 0x00005646d5a77b99 in handle_hmp_command (mon=3D0x5646d6bc70e0, cmdli=
ne=3D0x5646d6bc2542 "0xaf00 0") at monitor/hmp.c:1082
  #21 0x00005646d5a7540a in monitor_command_cb (opaque=3D0x5646d6bc70e0, cm=
dline=3D0x5646d6bc2540 "o 0xaf00 0", readline_opaque=3D0x0) at monitor/hmp.=
c:47
  #22 0x00005646d5c71450 in readline_handle_byte (rs=3D0x5646d6bc2540, ch=
=3D13) at util/readline.c:408
  #23 0x00005646d5a7858f in monitor_read (opaque=3D0x5646d6bc70e0, buf=3D0x=
7ffc180533d0 "\rtc\327FV", size=3D1) at monitor/hmp.c:1312
  #24 0x00005646d5bc8d17 in qemu_chr_be_write_impl (s=3D0x5646d6add000, buf=
=3D0x7ffc180533d0 "\rtc\327FV", len=3D1) at chardev/char.c:177
  #25 0x00005646d5bc8d7b in qemu_chr_be_write (s=3D0x5646d6add000, buf=3D0x=
7ffc180533d0 "\rtc\327FV", len=3D1) at chardev/char.c:189
  #26 0x00005646d5bcb6bf in fd_chr_read (chan=3D0x5646d6a80d60, cond=3DG_IO=
_IN, opaque=3D0x5646d6add000) at chardev/char-fd.c:68
  #27 0x00005646d5bec485 in qio_channel_fd_source_dispatch (source=3D0x5646=
d765a480, callback=3D0x5646d5bcb561 <fd_chr_read>, user_data=3D0x5646d6add0=
00) at io/channel-watch.c:84
  #28 0x00007f6fd9c1606d in g_main_context_dispatch () at /lib64/libglib-2.=
0.so.0
  #29 0x00005646d5c5323a in glib_pollfds_poll () at util/main-loop.c:213
  #30 0x00005646d5c532b4 in os_host_main_loop_wait (timeout=3D29821719) at =
util/main-loop.c:236
  #31 0x00005646d5c533b9 in main_loop_wait (nonblocking=3D0) at util/main-l=
oop.c:512
  #32 0x00005646d581d1a1 in main_loop () at vl.c:1791
  #33 0x00005646d582485f in main (argc=3D11, argv=3D0x7ffc18054868, envp=3D=
0x7ffc180548c8) at vl.c:4473

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1835865/+subscriptions

