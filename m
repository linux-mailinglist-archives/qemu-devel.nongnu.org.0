Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7DB266216
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 17:27:01 +0200 (CEST)
Received: from localhost ([::1]:52152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGkx2-00046W-VP
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 11:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kGkvs-0003Cu-N2
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 11:25:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:42238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kGkvm-0006dR-Pb
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 11:25:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kGkvj-0002FZ-5d
 for <qemu-devel@nongnu.org>; Fri, 11 Sep 2020 15:25:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 285542E80AB
 for <qemu-devel@nongnu.org>; Fri, 11 Sep 2020 15:25:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2020 15:20:08 -0000
From: Alexander Bulekov <1895310@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
Message-Id: <159983760940.22223.155030952574347545.malonedeb@wampee.canonical.com>
Subject: [Bug 1895310] [NEW] Heap-overflow (read) in sd_erase
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: 10b9e75c9676aca661ab521efac6f4cf148d06c1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 02:05:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Bug 1895310 <1895310@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,
One more bug in sd ...

cat << EOF | ./qemu-system-i386 -nodefaults \
-device sdhci-pci,sd-spec-version=3D3 \
-device sd-card,drive=3Dmydrive \
-drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydrive \
-nographic -qtest stdio -m 64m -trace 'sd*'
outl 0xcf8 0x80001003
outl 0xcfc 0xd735d735
outl 0xcf8 0x80001011
outl 0xcfc 0x3405064c
write 0x5064c2c 0x1 0xd7
write 0x5064c0f 0x1 0xf7
write 0x5064c05 0x1 0xd7
write 0x5064c0a 0x1 0x84
write 0x5064c0b 0x1 0x4c
write 0x5064c0c 0x1 0x11
write 0x5064c0f 0x1 0xa9
write 0x5064c0f 0x1 0x02
write 0x5064c0f 0x1 0x03
write 0x5064c0e 0x1 0x2c
write 0x5064c0f 0x1 0x06
write 0x5064c0f 0x1 0xe1
write 0x5064c0f 0x1 0x60
write 0x5064c0f 0x1 0x26
EOF

The crash:
=3D=3D133840=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on address =
0x607000059e78 at pc 0x55abd1d761e6 bp 0x7ffc12800630 sp 0x7ffc12800628
READ of size 8 at 0x607000059e78 thread T0
=C2=A0=C2=A0=C2=A0=C2=A0#0 0x55abd1d761e5 in test_bit /home/alxndr/Developm=
ent/qemu/general-fuzz/include/qemu/bitops.h:135:19
=C2=A0=C2=A0=C2=A0=C2=A0#1 0x55abd1d6cb1e in sd_erase /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/sd/sd.c:771:13
=C2=A0=C2=A0=C2=A0=C2=A0#2 0x55abd1d4c893 in sd_normal_command /home/alxndr=
/Development/qemu/general-fuzz/build/../hw/sd/sd.c:1412:13
=C2=A0=C2=A0=C2=A0=C2=A0#3 0x55abd1d33c5d in sd_do_command /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../hw/sd/sd.c:1724:17
=C2=A0=C2=A0=C2=A0=C2=A0#4 0x55abd20117a4 in sdbus_do_command /home/alxndr/=
Development/qemu/general-fuzz/build/../hw/sd/core.c:99:16
=C2=A0=C2=A0=C2=A0=C2=A0#5 0x55abd27ecc90 in sdhci_send_command /home/alxnd=
r/Development/qemu/general-fuzz/build/../hw/sd/sdhci.c:326:12
=C2=A0=C2=A0=C2=A0=C2=A0#6 0x55abd27e16ed in sdhci_write /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../hw/sd/sdhci.c:1136:9
=C2=A0=C2=A0=C2=A0=C2=A0#7 0x55abd43aacc0 in memory_region_write_accessor /=
home/alxndr/Development/qemu/general-fuzz/build/../softmmu/memory.c:483:5
=C2=A0=C2=A0=C2=A0=C2=A0#8 0x55abd43aa19d in access_with_adjusted_size /hom=
e/alxndr/Development/qemu/general-fuzz/build/../softmmu/memory.c:544:18
=C2=A0=C2=A0=C2=A0=C2=A0#9 0x55abd43a7e50 in memory_region_dispatch_write /=
home/alxndr/Development/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
=C2=A0=C2=A0=C2=A0=C2=A0#10 0x55abd3de5dc6 in flatview_write_continue /home=
/alxndr/Development/qemu/general-fuzz/build/../exec.c:3176:23
=C2=A0=C2=A0=C2=A0=C2=A0#11 0x55abd3dced98 in flatview_write /home/alxndr/D=
evelopment/qemu/general-fuzz/build/../exec.c:3216:14
=C2=A0=C2=A0=C2=A0=C2=A0#12 0x55abd3dce8c8 in address_space_write /home/alx=
ndr/Development/qemu/general-fuzz/build/../exec.c:3308:18
=C2=A0=C2=A0=C2=A0=C2=A0#13 0x55abd3ffabbc in qtest_process_command /home/a=
lxndr/Development/qemu/general-fuzz/build/../softmmu/qtest.c:567:9
=C2=A0=C2=A0=C2=A0=C2=A0#14 0x55abd3feb8be in qtest_process_inbuf /home/alx=
ndr/Development/qemu/general-fuzz/build/../softmmu/qtest.c:710:9
=C2=A0=C2=A0=C2=A0=C2=A0#15 0x55abd3fea663 in qtest_read /home/alxndr/Devel=
opment/qemu/general-fuzz/build/../softmmu/qtest.c:722:5
=C2=A0=C2=A0=C2=A0=C2=A0#16 0x55abd51cb9a2 in qemu_chr_be_write_impl /home/=
alxndr/Development/qemu/general-fuzz/build/../chardev/char.c:188:9
=C2=A0=C2=A0=C2=A0=C2=A0#17 0x55abd51cbaea in qemu_chr_be_write /home/alxnd=
r/Development/qemu/general-fuzz/build/../chardev/char.c:200:9
=C2=A0=C2=A0=C2=A0=C2=A0#18 0x55abd51e6264 in fd_chr_read /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../chardev/char-fd.c:68:9
=C2=A0=C2=A0=C2=A0=C2=A0#19 0x55abd515bef6 in qio_channel_fd_source_dispatc=
h /home/alxndr/Development/qemu/general-fuzz/build/../io/channel-watch.c:84=
:12
=C2=A0=C2=A0=C2=A0=C2=A0#20 0x7fd5d58bd4cd in g_main_context_dispatch (/usr=
/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x504cd)
=C2=A0=C2=A0=C2=A0=C2=A0#21 0x55abd54db327 in glib_pollfds_poll /home/alxnd=
r/Development/qemu/general-fuzz/build/../util/main-loop.c:217:9
=C2=A0=C2=A0=C2=A0=C2=A0#22 0x55abd54d8c27 in os_host_main_loop_wait /home/=
alxndr/Development/qemu/general-fuzz/build/../util/main-loop.c:240:5
=C2=A0=C2=A0=C2=A0=C2=A0#23 0x55abd54d8607 in main_loop_wait /home/alxndr/D=
evelopment/qemu/general-fuzz/build/../util/main-loop.c:516:11
=C2=A0=C2=A0=C2=A0=C2=A0#24 0x55abd3d55afd in qemu_main_loop /home/alxndr/D=
evelopment/qemu/general-fuzz/build/../softmmu/vl.c:1676:9
=C2=A0=C2=A0=C2=A0=C2=A0#25 0x55abd16df67c in main /home/alxndr/Development=
/qemu/general-fuzz/build/../softmmu/main.c:50:5
=C2=A0=C2=A0=C2=A0=C2=A0#26 0x7fd5d4ec0cc9 in __libc_start_main csu/../csu/=
libc-start.c:308:16
=C2=A0=C2=A0=C2=A0=C2=A0#27 0x55abd1634e59 in _start (/home/alxndr/Developm=
ent/qemu/general-fuzz/build/qemu-system-i386+0x2d3ee59)

0x607000059e78 is located 0 bytes to the right of 72-byte region [0x6070000=
59e30,0x607000059e78)
allocated by thread T0 here:
=C2=A0=C2=A0=C2=A0=C2=A0#0 0x55abd16ad712 in calloc (/home/alxndr/Developme=
nt/qemu/general-fuzz/build/qemu-system-i386+0x2db7712)
=C2=A0=C2=A0=C2=A0=C2=A0#1 0x55abd1d75464 in bitmap_try_new /home/alxndr/De=
velopment/qemu/general-fuzz/include/qemu/bitmap.h:96:12
=C2=A0=C2=A0=C2=A0=C2=A0#2 0x55abd1d74bd4 in bitmap_new /home/alxndr/Develo=
pment/qemu/general-fuzz/include/qemu/bitmap.h:101:26
=C2=A0=C2=A0=C2=A0=C2=A0#3 0x55abd1d67b68 in sd_reset /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/sd/sd.c:576:21
=C2=A0=C2=A0=C2=A0=C2=A0#4 0x55abd47f34b2 in device_transitional_reset /hom=
e/alxndr/Development/qemu/general-fuzz/build/../hw/core/qdev.c:1114:9
=C2=A0=C2=A0=C2=A0=C2=A0#5 0x55abd47f8ca9 in resettable_phase_hold /home/al=
xndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:182:13
=C2=A0=C2=A0=C2=A0=C2=A0#6 0x55abd47afdbd in bus_reset_child_foreach /home/=
alxndr/Development/qemu/general-fuzz/build/../hw/core/bus.c:94:9
=C2=A0=C2=A0=C2=A0=C2=A0#7 0x55abd47fdac3 in resettable_child_foreach /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
=C2=A0=C2=A0=C2=A0=C2=A0#8 0x55abd47f8685 in resettable_phase_hold /home/al=
xndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
=C2=A0=C2=A0=C2=A0=C2=A0#9 0x55abd47ec5f8 in device_reset_child_foreach /ho=
me/alxndr/Development/qemu/general-fuzz/build/../hw/core/qdev.c:358:9
=C2=A0=C2=A0=C2=A0=C2=A0#10 0x55abd47fdac3 in resettable_child_foreach /hom=
e/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
=C2=A0=C2=A0=C2=A0=C2=A0#11 0x55abd47f8685 in resettable_phase_hold /home/a=
lxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
=C2=A0=C2=A0=C2=A0=C2=A0#12 0x55abd47afdbd in bus_reset_child_foreach /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/bus.c:94:9
=C2=A0=C2=A0=C2=A0=C2=A0#13 0x55abd47fdac3 in resettable_child_foreach /hom=
e/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
=C2=A0=C2=A0=C2=A0=C2=A0#14 0x55abd47f8685 in resettable_phase_hold /home/a=
lxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
=C2=A0=C2=A0=C2=A0=C2=A0#15 0x55abd47ec5f8 in device_reset_child_foreach /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/qdev.c:358:9
=C2=A0=C2=A0=C2=A0=C2=A0#16 0x55abd47fdac3 in resettable_child_foreach /hom=
e/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
=C2=A0=C2=A0=C2=A0=C2=A0#17 0x55abd47f8685 in resettable_phase_hold /home/a=
lxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
=C2=A0=C2=A0=C2=A0=C2=A0#18 0x55abd47afdbd in bus_reset_child_foreach /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/bus.c:94:9
=C2=A0=C2=A0=C2=A0=C2=A0#19 0x55abd47fdac3 in resettable_child_foreach /hom=
e/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
=C2=A0=C2=A0=C2=A0=C2=A0#20 0x55abd47f8685 in resettable_phase_hold /home/a=
lxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
=C2=A0=C2=A0=C2=A0=C2=A0#21 0x55abd47f6b28 in resettable_assert_reset /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:60:5
=C2=A0=C2=A0=C2=A0=C2=A0#22 0x55abd47f68cf in resettable_reset /home/alxndr=
/Development/qemu/general-fuzz/build/../hw/core/resettable.c:45:5
=C2=A0=C2=A0=C2=A0=C2=A0#23 0x55abd47fb779 in resettable_cold_reset_fn /hom=
e/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:269:5
=C2=A0=C2=A0=C2=A0=C2=A0#24 0x55abd47f67e5 in qemu_devices_reset /home/alxn=
dr/Development/qemu/general-fuzz/build/../hw/core/reset.c:69:9
=C2=A0=C2=A0=C2=A0=C2=A0#25 0x55abd35a5c1e in pc_machine_reset /home/alxndr=
/Development/qemu/general-fuzz/build/../hw/i386/pc.c:1901:5
=C2=A0=C2=A0=C2=A0=C2=A0#26 0x55abd3d52d9e in qemu_system_reset /home/alxnd=
r/Development/qemu/general-fuzz/build/../softmmu/vl.c:1403:9
=C2=A0=C2=A0=C2=A0=C2=A0#27 0x55abd3d67d2e in qemu_init /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/vl.c:4458:5
=C2=A0=C2=A0=C2=A0=C2=A0#28 0x55abd16df677 in main /home/alxndr/Development=
/qemu/general-fuzz/build/../softmmu/main.c:49:5
=C2=A0=C2=A0=C2=A0=C2=A0#29 0x7fd5d4ec0cc9 in __libc_start_main csu/../csu/=
libc-start.c:308:16

SUMMARY: AddressSanitizer: heap-buffer-overflow
/home/alxndr/Development/qemu/general-fuzz/include/qemu/bitops.h:135:19
in test_bit

-Alex

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

  Hello,
- One more bug in sd.c ...
+ One more bug in sd ...
  =

  cat << EOF | ./qemu-system-i386 -nodefaults \
  -device sdhci-pci,sd-spec-version=3D3 \
  -device sd-card,drive=3Dmydrive \
  -drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydrive \
  -nographic -qtest stdio -m 64m -trace 'sd*'
  outl 0xcf8 0x80001003
  outl 0xcfc 0xd735d735
  outl 0xcf8 0x80001011
  outl 0xcfc 0x3405064c
  write 0x5064c2c 0x1 0xd7
  write 0x5064c0f 0x1 0xf7
  write 0x5064c05 0x1 0xd7
  write 0x5064c0a 0x1 0x84
  write 0x5064c0b 0x1 0x4c
  write 0x5064c0c 0x1 0x11
  write 0x5064c0f 0x1 0xa9
  write 0x5064c0f 0x1 0x02
  write 0x5064c0f 0x1 0x03
  write 0x5064c0e 0x1 0x2c
  write 0x5064c0f 0x1 0x06
  write 0x5064c0f 0x1 0xe1
  write 0x5064c0f 0x1 0x60
  write 0x5064c0f 0x1 0x26
  EOF
  =

- =

  The crash:
  =3D=3D133840=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s 0x607000059e78 at pc 0x55abd1d761e6 bp 0x7ffc12800630 sp 0x7ffc12800628
  READ of size 8 at 0x607000059e78 thread T0
-     #0 0x55abd1d761e5 in test_bit /home/alxndr/Development/qemu/general-f=
uzz/include/qemu/bitops.h:135:19
-     #1 0x55abd1d6cb1e in sd_erase /home/alxndr/Development/qemu/general-f=
uzz/build/../hw/sd/sd.c:771:13
-     #2 0x55abd1d4c893 in sd_normal_command /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/sd/sd.c:1412:13
-     #3 0x55abd1d33c5d in sd_do_command /home/alxndr/Development/qemu/gene=
ral-fuzz/build/../hw/sd/sd.c:1724:17
-     #4 0x55abd20117a4 in sdbus_do_command /home/alxndr/Development/qemu/g=
eneral-fuzz/build/../hw/sd/core.c:99:16
-     #5 0x55abd27ecc90 in sdhci_send_command /home/alxndr/Development/qemu=
/general-fuzz/build/../hw/sd/sdhci.c:326:12
-     #6 0x55abd27e16ed in sdhci_write /home/alxndr/Development/qemu/genera=
l-fuzz/build/../hw/sd/sdhci.c:1136:9
-     #7 0x55abd43aacc0 in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:483:5
-     #8 0x55abd43aa19d in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../softmmu/memory.c:544:18
-     #9 0x55abd43a7e50 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../softmmu/memory.c:1466:16
-     #10 0x55abd3de5dc6 in flatview_write_continue /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../exec.c:3176:23
-     #11 0x55abd3dced98 in flatview_write /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../exec.c:3216:14
-     #12 0x55abd3dce8c8 in address_space_write /home/alxndr/Development/qe=
mu/general-fuzz/build/../exec.c:3308:18
-     #13 0x55abd3ffabbc in qtest_process_command /home/alxndr/Development/=
qemu/general-fuzz/build/../softmmu/qtest.c:567:9
-     #14 0x55abd3feb8be in qtest_process_inbuf /home/alxndr/Development/qe=
mu/general-fuzz/build/../softmmu/qtest.c:710:9
-     #15 0x55abd3fea663 in qtest_read /home/alxndr/Development/qemu/genera=
l-fuzz/build/../softmmu/qtest.c:722:5
-     #16 0x55abd51cb9a2 in qemu_chr_be_write_impl /home/alxndr/Development=
/qemu/general-fuzz/build/../chardev/char.c:188:9
-     #17 0x55abd51cbaea in qemu_chr_be_write /home/alxndr/Development/qemu=
/general-fuzz/build/../chardev/char.c:200:9
-     #18 0x55abd51e6264 in fd_chr_read /home/alxndr/Development/qemu/gener=
al-fuzz/build/../chardev/char-fd.c:68:9
-     #19 0x55abd515bef6 in qio_channel_fd_source_dispatch /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../io/channel-watch.c:84:12
-     #20 0x7fd5d58bd4cd in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x504cd)
-     #21 0x55abd54db327 in glib_pollfds_poll /home/alxndr/Development/qemu=
/general-fuzz/build/../util/main-loop.c:217:9
-     #22 0x55abd54d8c27 in os_host_main_loop_wait /home/alxndr/Development=
/qemu/general-fuzz/build/../util/main-loop.c:240:5
-     #23 0x55abd54d8607 in main_loop_wait /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../util/main-loop.c:516:11
-     #24 0x55abd3d55afd in qemu_main_loop /home/alxndr/Development/qemu/ge=
neral-fuzz/build/../softmmu/vl.c:1676:9
-     #25 0x55abd16df67c in main /home/alxndr/Development/qemu/general-fuzz=
/build/../softmmu/main.c:50:5
-     #26 0x7fd5d4ec0cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
-     #27 0x55abd1634e59 in _start (/home/alxndr/Development/qemu/general-f=
uzz/build/qemu-system-i386+0x2d3ee59)
+ =C2=A0=C2=A0=C2=A0=C2=A0#0 0x55abd1d761e5 in test_bit /home/alxndr/Develo=
pment/qemu/general-fuzz/include/qemu/bitops.h:135:19
+ =C2=A0=C2=A0=C2=A0=C2=A0#1 0x55abd1d6cb1e in sd_erase /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/sd/sd.c:771:13
+ =C2=A0=C2=A0=C2=A0=C2=A0#2 0x55abd1d4c893 in sd_normal_command /home/alxn=
dr/Development/qemu/general-fuzz/build/../hw/sd/sd.c:1412:13
+ =C2=A0=C2=A0=C2=A0=C2=A0#3 0x55abd1d33c5d in sd_do_command /home/alxndr/D=
evelopment/qemu/general-fuzz/build/../hw/sd/sd.c:1724:17
+ =C2=A0=C2=A0=C2=A0=C2=A0#4 0x55abd20117a4 in sdbus_do_command /home/alxnd=
r/Development/qemu/general-fuzz/build/../hw/sd/core.c:99:16
+ =C2=A0=C2=A0=C2=A0=C2=A0#5 0x55abd27ecc90 in sdhci_send_command /home/alx=
ndr/Development/qemu/general-fuzz/build/../hw/sd/sdhci.c:326:12
+ =C2=A0=C2=A0=C2=A0=C2=A0#6 0x55abd27e16ed in sdhci_write /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../hw/sd/sdhci.c:1136:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#7 0x55abd43aacc0 in memory_region_write_accessor=
 /home/alxndr/Development/qemu/general-fuzz/build/../softmmu/memory.c:483:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#8 0x55abd43aa19d in access_with_adjusted_size /h=
ome/alxndr/Development/qemu/general-fuzz/build/../softmmu/memory.c:544:18
+ =C2=A0=C2=A0=C2=A0=C2=A0#9 0x55abd43a7e50 in memory_region_dispatch_write=
 /home/alxndr/Development/qemu/general-fuzz/build/../softmmu/memory.c:1466:=
16
+ =C2=A0=C2=A0=C2=A0=C2=A0#10 0x55abd3de5dc6 in flatview_write_continue /ho=
me/alxndr/Development/qemu/general-fuzz/build/../exec.c:3176:23
+ =C2=A0=C2=A0=C2=A0=C2=A0#11 0x55abd3dced98 in flatview_write /home/alxndr=
/Development/qemu/general-fuzz/build/../exec.c:3216:14
+ =C2=A0=C2=A0=C2=A0=C2=A0#12 0x55abd3dce8c8 in address_space_write /home/a=
lxndr/Development/qemu/general-fuzz/build/../exec.c:3308:18
+ =C2=A0=C2=A0=C2=A0=C2=A0#13 0x55abd3ffabbc in qtest_process_command /home=
/alxndr/Development/qemu/general-fuzz/build/../softmmu/qtest.c:567:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#14 0x55abd3feb8be in qtest_process_inbuf /home/a=
lxndr/Development/qemu/general-fuzz/build/../softmmu/qtest.c:710:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#15 0x55abd3fea663 in qtest_read /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/qtest.c:722:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#16 0x55abd51cb9a2 in qemu_chr_be_write_impl /hom=
e/alxndr/Development/qemu/general-fuzz/build/../chardev/char.c:188:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#17 0x55abd51cbaea in qemu_chr_be_write /home/alx=
ndr/Development/qemu/general-fuzz/build/../chardev/char.c:200:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#18 0x55abd51e6264 in fd_chr_read /home/alxndr/De=
velopment/qemu/general-fuzz/build/../chardev/char-fd.c:68:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#19 0x55abd515bef6 in qio_channel_fd_source_dispa=
tch /home/alxndr/Development/qemu/general-fuzz/build/../io/channel-watch.c:=
84:12
+ =C2=A0=C2=A0=C2=A0=C2=A0#20 0x7fd5d58bd4cd in g_main_context_dispatch (/u=
sr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x504cd)
+ =C2=A0=C2=A0=C2=A0=C2=A0#21 0x55abd54db327 in glib_pollfds_poll /home/alx=
ndr/Development/qemu/general-fuzz/build/../util/main-loop.c:217:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#22 0x55abd54d8c27 in os_host_main_loop_wait /hom=
e/alxndr/Development/qemu/general-fuzz/build/../util/main-loop.c:240:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#23 0x55abd54d8607 in main_loop_wait /home/alxndr=
/Development/qemu/general-fuzz/build/../util/main-loop.c:516:11
+ =C2=A0=C2=A0=C2=A0=C2=A0#24 0x55abd3d55afd in qemu_main_loop /home/alxndr=
/Development/qemu/general-fuzz/build/../softmmu/vl.c:1676:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#25 0x55abd16df67c in main /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../softmmu/main.c:50:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#26 0x7fd5d4ec0cc9 in __libc_start_main csu/../cs=
u/libc-start.c:308:16
+ =C2=A0=C2=A0=C2=A0=C2=A0#27 0x55abd1634e59 in _start (/home/alxndr/Develo=
pment/qemu/general-fuzz/build/qemu-system-i386+0x2d3ee59)
  =

  0x607000059e78 is located 0 bytes to the right of 72-byte region [0x60700=
0059e30,0x607000059e78)
  allocated by thread T0 here:
-     #0 0x55abd16ad712 in calloc (/home/alxndr/Development/qemu/general-fu=
zz/build/qemu-system-i386+0x2db7712)
-     #1 0x55abd1d75464 in bitmap_try_new /home/alxndr/Development/qemu/gen=
eral-fuzz/include/qemu/bitmap.h:96:12
-     #2 0x55abd1d74bd4 in bitmap_new /home/alxndr/Development/qemu/general=
-fuzz/include/qemu/bitmap.h:101:26
-     #3 0x55abd1d67b68 in sd_reset /home/alxndr/Development/qemu/general-f=
uzz/build/../hw/sd/sd.c:576:21
-     #4 0x55abd47f34b2 in device_transitional_reset /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/core/qdev.c:1114:9
-     #5 0x55abd47f8ca9 in resettable_phase_hold /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/core/resettable.c:182:13
-     #6 0x55abd47afdbd in bus_reset_child_foreach /home/alxndr/Development=
/qemu/general-fuzz/build/../hw/core/bus.c:94:9
-     #7 0x55abd47fdac3 in resettable_child_foreach /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
-     #8 0x55abd47f8685 in resettable_phase_hold /home/alxndr/Development/q=
emu/general-fuzz/build/../hw/core/resettable.c:173:5
-     #9 0x55abd47ec5f8 in device_reset_child_foreach /home/alxndr/Developm=
ent/qemu/general-fuzz/build/../hw/core/qdev.c:358:9
-     #10 0x55abd47fdac3 in resettable_child_foreach /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
-     #11 0x55abd47f8685 in resettable_phase_hold /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/core/resettable.c:173:5
-     #12 0x55abd47afdbd in bus_reset_child_foreach /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/core/bus.c:94:9
-     #13 0x55abd47fdac3 in resettable_child_foreach /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
-     #14 0x55abd47f8685 in resettable_phase_hold /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/core/resettable.c:173:5
-     #15 0x55abd47ec5f8 in device_reset_child_foreach /home/alxndr/Develop=
ment/qemu/general-fuzz/build/../hw/core/qdev.c:358:9
-     #16 0x55abd47fdac3 in resettable_child_foreach /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
-     #17 0x55abd47f8685 in resettable_phase_hold /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/core/resettable.c:173:5
-     #18 0x55abd47afdbd in bus_reset_child_foreach /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/core/bus.c:94:9
-     #19 0x55abd47fdac3 in resettable_child_foreach /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
-     #20 0x55abd47f8685 in resettable_phase_hold /home/alxndr/Development/=
qemu/general-fuzz/build/../hw/core/resettable.c:173:5
-     #21 0x55abd47f6b28 in resettable_assert_reset /home/alxndr/Developmen=
t/qemu/general-fuzz/build/../hw/core/resettable.c:60:5
-     #22 0x55abd47f68cf in resettable_reset /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/core/resettable.c:45:5
-     #23 0x55abd47fb779 in resettable_cold_reset_fn /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../hw/core/resettable.c:269:5
-     #24 0x55abd47f67e5 in qemu_devices_reset /home/alxndr/Development/qem=
u/general-fuzz/build/../hw/core/reset.c:69:9
-     #25 0x55abd35a5c1e in pc_machine_reset /home/alxndr/Development/qemu/=
general-fuzz/build/../hw/i386/pc.c:1901:5
-     #26 0x55abd3d52d9e in qemu_system_reset /home/alxndr/Development/qemu=
/general-fuzz/build/../softmmu/vl.c:1403:9
-     #27 0x55abd3d67d2e in qemu_init /home/alxndr/Development/qemu/general=
-fuzz/build/../softmmu/vl.c:4458:5
-     #28 0x55abd16df677 in main /home/alxndr/Development/qemu/general-fuzz=
/build/../softmmu/main.c:49:5
-     #29 0x7fd5d4ec0cc9 in __libc_start_main csu/../csu/libc-start.c:308:16
+ =C2=A0=C2=A0=C2=A0=C2=A0#0 0x55abd16ad712 in calloc (/home/alxndr/Develop=
ment/qemu/general-fuzz/build/qemu-system-i386+0x2db7712)
+ =C2=A0=C2=A0=C2=A0=C2=A0#1 0x55abd1d75464 in bitmap_try_new /home/alxndr/=
Development/qemu/general-fuzz/include/qemu/bitmap.h:96:12
+ =C2=A0=C2=A0=C2=A0=C2=A0#2 0x55abd1d74bd4 in bitmap_new /home/alxndr/Deve=
lopment/qemu/general-fuzz/include/qemu/bitmap.h:101:26
+ =C2=A0=C2=A0=C2=A0=C2=A0#3 0x55abd1d67b68 in sd_reset /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/sd/sd.c:576:21
+ =C2=A0=C2=A0=C2=A0=C2=A0#4 0x55abd47f34b2 in device_transitional_reset /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/qdev.c:1114:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#5 0x55abd47f8ca9 in resettable_phase_hold /home/=
alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:182:13
+ =C2=A0=C2=A0=C2=A0=C2=A0#6 0x55abd47afdbd in bus_reset_child_foreach /hom=
e/alxndr/Development/qemu/general-fuzz/build/../hw/core/bus.c:94:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#7 0x55abd47fdac3 in resettable_child_foreach /ho=
me/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#8 0x55abd47f8685 in resettable_phase_hold /home/=
alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#9 0x55abd47ec5f8 in device_reset_child_foreach /=
home/alxndr/Development/qemu/general-fuzz/build/../hw/core/qdev.c:358:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#10 0x55abd47fdac3 in resettable_child_foreach /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#11 0x55abd47f8685 in resettable_phase_hold /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#12 0x55abd47afdbd in bus_reset_child_foreach /ho=
me/alxndr/Development/qemu/general-fuzz/build/../hw/core/bus.c:94:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#13 0x55abd47fdac3 in resettable_child_foreach /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#14 0x55abd47f8685 in resettable_phase_hold /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#15 0x55abd47ec5f8 in device_reset_child_foreach =
/home/alxndr/Development/qemu/general-fuzz/build/../hw/core/qdev.c:358:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#16 0x55abd47fdac3 in resettable_child_foreach /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#17 0x55abd47f8685 in resettable_phase_hold /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#18 0x55abd47afdbd in bus_reset_child_foreach /ho=
me/alxndr/Development/qemu/general-fuzz/build/../hw/core/bus.c:94:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#19 0x55abd47fdac3 in resettable_child_foreach /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#20 0x55abd47f8685 in resettable_phase_hold /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#21 0x55abd47f6b28 in resettable_assert_reset /ho=
me/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:60:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#22 0x55abd47f68cf in resettable_reset /home/alxn=
dr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:45:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#23 0x55abd47fb779 in resettable_cold_reset_fn /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:269:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#24 0x55abd47f67e5 in qemu_devices_reset /home/al=
xndr/Development/qemu/general-fuzz/build/../hw/core/reset.c:69:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#25 0x55abd35a5c1e in pc_machine_reset /home/alxn=
dr/Development/qemu/general-fuzz/build/../hw/i386/pc.c:1901:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#26 0x55abd3d52d9e in qemu_system_reset /home/alx=
ndr/Development/qemu/general-fuzz/build/../softmmu/vl.c:1403:9
+ =C2=A0=C2=A0=C2=A0=C2=A0#27 0x55abd3d67d2e in qemu_init /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/vl.c:4458:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#28 0x55abd16df677 in main /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../softmmu/main.c:49:5
+ =C2=A0=C2=A0=C2=A0=C2=A0#29 0x7fd5d4ec0cc9 in __libc_start_main csu/../cs=
u/libc-start.c:308:16
  =

  SUMMARY: AddressSanitizer: heap-buffer-overflow
  /home/alxndr/Development/qemu/general-fuzz/include/qemu/bitops.h:135:19
  in test_bit
  =

  -Alex

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895310

Title:
  Heap-overflow (read) in sd_erase

Status in QEMU:
  New

Bug description:
  Hello,
  One more bug in sd ...

  cat << EOF | ./qemu-system-i386 -nodefaults \
  -device sdhci-pci,sd-spec-version=3D3 \
  -device sd-card,drive=3Dmydrive \
  -drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydrive \
  -nographic -qtest stdio -m 64m -trace 'sd*'
  outl 0xcf8 0x80001003
  outl 0xcfc 0xd735d735
  outl 0xcf8 0x80001011
  outl 0xcfc 0x3405064c
  write 0x5064c2c 0x1 0xd7
  write 0x5064c0f 0x1 0xf7
  write 0x5064c05 0x1 0xd7
  write 0x5064c0a 0x1 0x84
  write 0x5064c0b 0x1 0x4c
  write 0x5064c0c 0x1 0x11
  write 0x5064c0f 0x1 0xa9
  write 0x5064c0f 0x1 0x02
  write 0x5064c0f 0x1 0x03
  write 0x5064c0e 0x1 0x2c
  write 0x5064c0f 0x1 0x06
  write 0x5064c0f 0x1 0xe1
  write 0x5064c0f 0x1 0x60
  write 0x5064c0f 0x1 0x26
  EOF

  The crash:
  =3D=3D133840=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s 0x607000059e78 at pc 0x55abd1d761e6 bp 0x7ffc12800630 sp 0x7ffc12800628
  READ of size 8 at 0x607000059e78 thread T0
  =C2=A0=C2=A0=C2=A0=C2=A0#0 0x55abd1d761e5 in test_bit /home/alxndr/Develo=
pment/qemu/general-fuzz/include/qemu/bitops.h:135:19
  =C2=A0=C2=A0=C2=A0=C2=A0#1 0x55abd1d6cb1e in sd_erase /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/sd/sd.c:771:13
  =C2=A0=C2=A0=C2=A0=C2=A0#2 0x55abd1d4c893 in sd_normal_command /home/alxn=
dr/Development/qemu/general-fuzz/build/../hw/sd/sd.c:1412:13
  =C2=A0=C2=A0=C2=A0=C2=A0#3 0x55abd1d33c5d in sd_do_command /home/alxndr/D=
evelopment/qemu/general-fuzz/build/../hw/sd/sd.c:1724:17
  =C2=A0=C2=A0=C2=A0=C2=A0#4 0x55abd20117a4 in sdbus_do_command /home/alxnd=
r/Development/qemu/general-fuzz/build/../hw/sd/core.c:99:16
  =C2=A0=C2=A0=C2=A0=C2=A0#5 0x55abd27ecc90 in sdhci_send_command /home/alx=
ndr/Development/qemu/general-fuzz/build/../hw/sd/sdhci.c:326:12
  =C2=A0=C2=A0=C2=A0=C2=A0#6 0x55abd27e16ed in sdhci_write /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../hw/sd/sdhci.c:1136:9
  =C2=A0=C2=A0=C2=A0=C2=A0#7 0x55abd43aacc0 in memory_region_write_accessor=
 /home/alxndr/Development/qemu/general-fuzz/build/../softmmu/memory.c:483:5
  =C2=A0=C2=A0=C2=A0=C2=A0#8 0x55abd43aa19d in access_with_adjusted_size /h=
ome/alxndr/Development/qemu/general-fuzz/build/../softmmu/memory.c:544:18
  =C2=A0=C2=A0=C2=A0=C2=A0#9 0x55abd43a7e50 in memory_region_dispatch_write=
 /home/alxndr/Development/qemu/general-fuzz/build/../softmmu/memory.c:1466:=
16
  =C2=A0=C2=A0=C2=A0=C2=A0#10 0x55abd3de5dc6 in flatview_write_continue /ho=
me/alxndr/Development/qemu/general-fuzz/build/../exec.c:3176:23
  =C2=A0=C2=A0=C2=A0=C2=A0#11 0x55abd3dced98 in flatview_write /home/alxndr=
/Development/qemu/general-fuzz/build/../exec.c:3216:14
  =C2=A0=C2=A0=C2=A0=C2=A0#12 0x55abd3dce8c8 in address_space_write /home/a=
lxndr/Development/qemu/general-fuzz/build/../exec.c:3308:18
  =C2=A0=C2=A0=C2=A0=C2=A0#13 0x55abd3ffabbc in qtest_process_command /home=
/alxndr/Development/qemu/general-fuzz/build/../softmmu/qtest.c:567:9
  =C2=A0=C2=A0=C2=A0=C2=A0#14 0x55abd3feb8be in qtest_process_inbuf /home/a=
lxndr/Development/qemu/general-fuzz/build/../softmmu/qtest.c:710:9
  =C2=A0=C2=A0=C2=A0=C2=A0#15 0x55abd3fea663 in qtest_read /home/alxndr/Dev=
elopment/qemu/general-fuzz/build/../softmmu/qtest.c:722:5
  =C2=A0=C2=A0=C2=A0=C2=A0#16 0x55abd51cb9a2 in qemu_chr_be_write_impl /hom=
e/alxndr/Development/qemu/general-fuzz/build/../chardev/char.c:188:9
  =C2=A0=C2=A0=C2=A0=C2=A0#17 0x55abd51cbaea in qemu_chr_be_write /home/alx=
ndr/Development/qemu/general-fuzz/build/../chardev/char.c:200:9
  =C2=A0=C2=A0=C2=A0=C2=A0#18 0x55abd51e6264 in fd_chr_read /home/alxndr/De=
velopment/qemu/general-fuzz/build/../chardev/char-fd.c:68:9
  =C2=A0=C2=A0=C2=A0=C2=A0#19 0x55abd515bef6 in qio_channel_fd_source_dispa=
tch /home/alxndr/Development/qemu/general-fuzz/build/../io/channel-watch.c:=
84:12
  =C2=A0=C2=A0=C2=A0=C2=A0#20 0x7fd5d58bd4cd in g_main_context_dispatch (/u=
sr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x504cd)
  =C2=A0=C2=A0=C2=A0=C2=A0#21 0x55abd54db327 in glib_pollfds_poll /home/alx=
ndr/Development/qemu/general-fuzz/build/../util/main-loop.c:217:9
  =C2=A0=C2=A0=C2=A0=C2=A0#22 0x55abd54d8c27 in os_host_main_loop_wait /hom=
e/alxndr/Development/qemu/general-fuzz/build/../util/main-loop.c:240:5
  =C2=A0=C2=A0=C2=A0=C2=A0#23 0x55abd54d8607 in main_loop_wait /home/alxndr=
/Development/qemu/general-fuzz/build/../util/main-loop.c:516:11
  =C2=A0=C2=A0=C2=A0=C2=A0#24 0x55abd3d55afd in qemu_main_loop /home/alxndr=
/Development/qemu/general-fuzz/build/../softmmu/vl.c:1676:9
  =C2=A0=C2=A0=C2=A0=C2=A0#25 0x55abd16df67c in main /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../softmmu/main.c:50:5
  =C2=A0=C2=A0=C2=A0=C2=A0#26 0x7fd5d4ec0cc9 in __libc_start_main csu/../cs=
u/libc-start.c:308:16
  =C2=A0=C2=A0=C2=A0=C2=A0#27 0x55abd1634e59 in _start (/home/alxndr/Develo=
pment/qemu/general-fuzz/build/qemu-system-i386+0x2d3ee59)

  0x607000059e78 is located 0 bytes to the right of 72-byte region [0x60700=
0059e30,0x607000059e78)
  allocated by thread T0 here:
  =C2=A0=C2=A0=C2=A0=C2=A0#0 0x55abd16ad712 in calloc (/home/alxndr/Develop=
ment/qemu/general-fuzz/build/qemu-system-i386+0x2db7712)
  =C2=A0=C2=A0=C2=A0=C2=A0#1 0x55abd1d75464 in bitmap_try_new /home/alxndr/=
Development/qemu/general-fuzz/include/qemu/bitmap.h:96:12
  =C2=A0=C2=A0=C2=A0=C2=A0#2 0x55abd1d74bd4 in bitmap_new /home/alxndr/Deve=
lopment/qemu/general-fuzz/include/qemu/bitmap.h:101:26
  =C2=A0=C2=A0=C2=A0=C2=A0#3 0x55abd1d67b68 in sd_reset /home/alxndr/Develo=
pment/qemu/general-fuzz/build/../hw/sd/sd.c:576:21
  =C2=A0=C2=A0=C2=A0=C2=A0#4 0x55abd47f34b2 in device_transitional_reset /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/qdev.c:1114:9
  =C2=A0=C2=A0=C2=A0=C2=A0#5 0x55abd47f8ca9 in resettable_phase_hold /home/=
alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:182:13
  =C2=A0=C2=A0=C2=A0=C2=A0#6 0x55abd47afdbd in bus_reset_child_foreach /hom=
e/alxndr/Development/qemu/general-fuzz/build/../hw/core/bus.c:94:9
  =C2=A0=C2=A0=C2=A0=C2=A0#7 0x55abd47fdac3 in resettable_child_foreach /ho=
me/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
  =C2=A0=C2=A0=C2=A0=C2=A0#8 0x55abd47f8685 in resettable_phase_hold /home/=
alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
  =C2=A0=C2=A0=C2=A0=C2=A0#9 0x55abd47ec5f8 in device_reset_child_foreach /=
home/alxndr/Development/qemu/general-fuzz/build/../hw/core/qdev.c:358:9
  =C2=A0=C2=A0=C2=A0=C2=A0#10 0x55abd47fdac3 in resettable_child_foreach /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
  =C2=A0=C2=A0=C2=A0=C2=A0#11 0x55abd47f8685 in resettable_phase_hold /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
  =C2=A0=C2=A0=C2=A0=C2=A0#12 0x55abd47afdbd in bus_reset_child_foreach /ho=
me/alxndr/Development/qemu/general-fuzz/build/../hw/core/bus.c:94:9
  =C2=A0=C2=A0=C2=A0=C2=A0#13 0x55abd47fdac3 in resettable_child_foreach /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
  =C2=A0=C2=A0=C2=A0=C2=A0#14 0x55abd47f8685 in resettable_phase_hold /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
  =C2=A0=C2=A0=C2=A0=C2=A0#15 0x55abd47ec5f8 in device_reset_child_foreach =
/home/alxndr/Development/qemu/general-fuzz/build/../hw/core/qdev.c:358:9
  =C2=A0=C2=A0=C2=A0=C2=A0#16 0x55abd47fdac3 in resettable_child_foreach /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
  =C2=A0=C2=A0=C2=A0=C2=A0#17 0x55abd47f8685 in resettable_phase_hold /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
  =C2=A0=C2=A0=C2=A0=C2=A0#18 0x55abd47afdbd in bus_reset_child_foreach /ho=
me/alxndr/Development/qemu/general-fuzz/build/../hw/core/bus.c:94:9
  =C2=A0=C2=A0=C2=A0=C2=A0#19 0x55abd47fdac3 in resettable_child_foreach /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:96:9
  =C2=A0=C2=A0=C2=A0=C2=A0#20 0x55abd47f8685 in resettable_phase_hold /home=
/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:173:5
  =C2=A0=C2=A0=C2=A0=C2=A0#21 0x55abd47f6b28 in resettable_assert_reset /ho=
me/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:60:5
  =C2=A0=C2=A0=C2=A0=C2=A0#22 0x55abd47f68cf in resettable_reset /home/alxn=
dr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:45:5
  =C2=A0=C2=A0=C2=A0=C2=A0#23 0x55abd47fb779 in resettable_cold_reset_fn /h=
ome/alxndr/Development/qemu/general-fuzz/build/../hw/core/resettable.c:269:5
  =C2=A0=C2=A0=C2=A0=C2=A0#24 0x55abd47f67e5 in qemu_devices_reset /home/al=
xndr/Development/qemu/general-fuzz/build/../hw/core/reset.c:69:9
  =C2=A0=C2=A0=C2=A0=C2=A0#25 0x55abd35a5c1e in pc_machine_reset /home/alxn=
dr/Development/qemu/general-fuzz/build/../hw/i386/pc.c:1901:5
  =C2=A0=C2=A0=C2=A0=C2=A0#26 0x55abd3d52d9e in qemu_system_reset /home/alx=
ndr/Development/qemu/general-fuzz/build/../softmmu/vl.c:1403:9
  =C2=A0=C2=A0=C2=A0=C2=A0#27 0x55abd3d67d2e in qemu_init /home/alxndr/Deve=
lopment/qemu/general-fuzz/build/../softmmu/vl.c:4458:5
  =C2=A0=C2=A0=C2=A0=C2=A0#28 0x55abd16df677 in main /home/alxndr/Developme=
nt/qemu/general-fuzz/build/../softmmu/main.c:49:5
  =C2=A0=C2=A0=C2=A0=C2=A0#29 0x7fd5d4ec0cc9 in __libc_start_main csu/../cs=
u/libc-start.c:308:16

  SUMMARY: AddressSanitizer: heap-buffer-overflow
  /home/alxndr/Development/qemu/general-
  fuzz/include/qemu/bitops.h:135:19 in test_bit

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895310/+subscriptions

