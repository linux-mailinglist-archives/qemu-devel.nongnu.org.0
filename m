Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B984A3099FD
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 03:26:52 +0100 (CET)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l62Rv-0007Ha-Qo
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 21:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l62Qp-0006MR-Lu
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 21:25:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:60440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l62Qn-00086H-Co
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 21:25:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l62Qk-0003ds-Ek
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 02:25:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 69D592E813A
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 02:25:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 Jan 2021 02:17:25 -0000
From: Alexander Bulekov <1913915@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: fuzzer virt
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
Message-Id: <161205944589.3833.15789206648891646681.malonedeb@soybean.canonical.com>
Subject: [Bug 1913915] [NEW] aarc64-virt: Null-ptr dereference through
 virtio_write_config
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 3653290f1593ab881af7fc6f79e9ace465667f19
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1913915 <1913915@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Reproducer:
cat << EOF | ./qemu-system-aarch64 \
-machine virt,accel=3Dqtest -qtest stdio
writel 0x8000f00 0x81818191
write 0x4010008004 0x1 0x06
EOF

Stacktrace:
../hw/intc/arm_gic.c:1498:13: runtime error: index 401 out of bounds for ty=
pe 'uint8_t [16][8]'
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.=
c:1498:13 in
OK
[S +0.048579] OK
[R +0.048593] write 0x4010008004 0x1 0x06
../softmmu/memory.c:834:35: runtime error: member access within null pointe=
r of type 'MemoryRegionIoeventfd' (aka 'struct MemoryRegionIoeventfd')
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../softmmu/memory.c=
:834:35 in
AddressSanitizer:DEADLYSIGNAL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D637204=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x000000=
000000 (pc 0x55b2560417c1 bp 0x7ffefc928270 sp 0x7ffefc928020 T0)
=3D=3D637204=3D=3DThe signal is caused by a READ memory access.
=3D=3D637204=3D=3DHint: address points to the zero page.
    #0 0x55b2560417c1 in addrrange_shift /home/alxndr/Development/qemu/buil=
d/../softmmu/memory.c:80:44
    #1 0x55b2560417c1 in address_space_update_ioeventfds /home/alxndr/Devel=
opment/qemu/build/../softmmu/memory.c:834:19
    #2 0x55b2560408c7 in memory_region_transaction_commit /home/alxndr/Deve=
lopment/qemu/build/../softmmu/memory.c:1100:17
    #3 0x55b25481e065 in pci_update_mappings /home/alxndr/Development/qemu/=
build/../hw/pci/pci.c:1363:13
    #4 0x55b25481cec7 in pci_default_write_config /home/alxndr/Development/=
qemu/build/../hw/pci/pci.c:1423:9
    #5 0x55b254806227 in virtio_write_config /home/alxndr/Development/qemu/=
build/../hw/virtio/virtio-pci.c:608:5
    #6 0x55b2551f6e65 in pci_host_config_write_common /home/alxndr/Developm=
ent/qemu/build/../hw/pci/pci_host.c:83:5
    #7 0x55b2560481fe in memory_region_write_accessor /home/alxndr/Developm=
ent/qemu/build/../softmmu/memory.c:491:5
    #8 0x55b256047bfb in access_with_adjusted_size /home/alxndr/Development=
/qemu/build/../softmmu/memory.c:552:18
    #9 0x55b256047467 in memory_region_dispatch_write /home/alxndr/Developm=
ent/qemu/build/../softmmu/memory.c
    #10 0x55b2563d7ffb in flatview_write_continue /home/alxndr/Development/=
qemu/build/../softmmu/physmem.c:2759:23
    #11 0x55b2563cd71b in flatview_write /home/alxndr/Development/qemu/buil=
d/../softmmu/physmem.c:2799:14
    #12 0x55b2563cd71b in address_space_write /home/alxndr/Development/qemu=
/build/../softmmu/physmem.c:2891:18
    #13 0x55b256039d35 in qtest_process_command /home/alxndr/Development/qe=
mu/build/../softmmu/qtest.c:654:9
    #14 0x55b256032b97 in qtest_process_inbuf /home/alxndr/Development/qemu=
/build/../softmmu/qtest.c:797:9
    #15 0x55b256883286 in fd_chr_read /home/alxndr/Development/qemu/build/.=
./chardev/char-fd.c:68:9
    #16 0x7f8d8faf5aae in g_main_context_dispatch (/usr/lib/x86_64-linux-gn=
u/libglib-2.0.so.0+0x51aae)
    #17 0x55b256ede363 in glib_pollfds_poll /home/alxndr/Development/qemu/b=
uild/../util/main-loop.c:232:9
    #18 0x55b256ede363 in os_host_main_loop_wait /home/alxndr/Development/q=
emu/build/../util/main-loop.c:255:5
    #19 0x55b256ede363 in main_loop_wait /home/alxndr/Development/qemu/buil=
d/../util/main-loop.c:531:11
    #20 0x55b255f99599 in qemu_main_loop /home/alxndr/Development/qemu/buil=
d/../softmmu/runstate.c:721:9
    #21 0x55b2542261fd in main /home/alxndr/Development/qemu/build/../softm=
mu/main.c:50:5
    #22 0x7f8d8f59acc9 in __libc_start_main csu/../csu/libc-start.c:308:16
    #23 0x55b254179bc9 in _start (/home/alxndr/Development/qemu/build/qemu-=
system-aarch64+0x3350bc9)

AddressSanitizer can not provide additional info.
SUMMARY: AddressSanitizer: SEGV /home/alxndr/Development/qemu/build/../soft=
mmu/memory.c:80:44 in addrrange_shift
=3D=3D637204=3D=3DABORTING

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: fuzzer virt

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913915

Title:
  aarc64-virt: Null-ptr dereference through virtio_write_config

Status in QEMU:
  New

Bug description:
  Reproducer:
  cat << EOF | ./qemu-system-aarch64 \
  -machine virt,accel=3Dqtest -qtest stdio
  writel 0x8000f00 0x81818191
  write 0x4010008004 0x1 0x06
  EOF

  Stacktrace:
  ../hw/intc/arm_gic.c:1498:13: runtime error: index 401 out of bounds for =
type 'uint8_t [16][8]'
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gi=
c.c:1498:13 in
  OK
  [S +0.048579] OK
  [R +0.048593] write 0x4010008004 0x1 0x06
  ../softmmu/memory.c:834:35: runtime error: member access within null poin=
ter of type 'MemoryRegionIoeventfd' (aka 'struct MemoryRegionIoeventfd')
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../softmmu/memory=
.c:834:35 in
  AddressSanitizer:DEADLYSIGNAL
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D637204=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x0000=
00000000 (pc 0x55b2560417c1 bp 0x7ffefc928270 sp 0x7ffefc928020 T0)
  =3D=3D637204=3D=3DThe signal is caused by a READ memory access.
  =3D=3D637204=3D=3DHint: address points to the zero page.
      #0 0x55b2560417c1 in addrrange_shift /home/alxndr/Development/qemu/bu=
ild/../softmmu/memory.c:80:44
      #1 0x55b2560417c1 in address_space_update_ioeventfds /home/alxndr/Dev=
elopment/qemu/build/../softmmu/memory.c:834:19
      #2 0x55b2560408c7 in memory_region_transaction_commit /home/alxndr/De=
velopment/qemu/build/../softmmu/memory.c:1100:17
      #3 0x55b25481e065 in pci_update_mappings /home/alxndr/Development/qem=
u/build/../hw/pci/pci.c:1363:13
      #4 0x55b25481cec7 in pci_default_write_config /home/alxndr/Developmen=
t/qemu/build/../hw/pci/pci.c:1423:9
      #5 0x55b254806227 in virtio_write_config /home/alxndr/Development/qem=
u/build/../hw/virtio/virtio-pci.c:608:5
      #6 0x55b2551f6e65 in pci_host_config_write_common /home/alxndr/Develo=
pment/qemu/build/../hw/pci/pci_host.c:83:5
      #7 0x55b2560481fe in memory_region_write_accessor /home/alxndr/Develo=
pment/qemu/build/../softmmu/memory.c:491:5
      #8 0x55b256047bfb in access_with_adjusted_size /home/alxndr/Developme=
nt/qemu/build/../softmmu/memory.c:552:18
      #9 0x55b256047467 in memory_region_dispatch_write /home/alxndr/Develo=
pment/qemu/build/../softmmu/memory.c
      #10 0x55b2563d7ffb in flatview_write_continue /home/alxndr/Developmen=
t/qemu/build/../softmmu/physmem.c:2759:23
      #11 0x55b2563cd71b in flatview_write /home/alxndr/Development/qemu/bu=
ild/../softmmu/physmem.c:2799:14
      #12 0x55b2563cd71b in address_space_write /home/alxndr/Development/qe=
mu/build/../softmmu/physmem.c:2891:18
      #13 0x55b256039d35 in qtest_process_command /home/alxndr/Development/=
qemu/build/../softmmu/qtest.c:654:9
      #14 0x55b256032b97 in qtest_process_inbuf /home/alxndr/Development/qe=
mu/build/../softmmu/qtest.c:797:9
      #15 0x55b256883286 in fd_chr_read /home/alxndr/Development/qemu/build=
/../chardev/char-fd.c:68:9
      #16 0x7f8d8faf5aae in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x51aae)
      #17 0x55b256ede363 in glib_pollfds_poll /home/alxndr/Development/qemu=
/build/../util/main-loop.c:232:9
      #18 0x55b256ede363 in os_host_main_loop_wait /home/alxndr/Development=
/qemu/build/../util/main-loop.c:255:5
      #19 0x55b256ede363 in main_loop_wait /home/alxndr/Development/qemu/bu=
ild/../util/main-loop.c:531:11
      #20 0x55b255f99599 in qemu_main_loop /home/alxndr/Development/qemu/bu=
ild/../softmmu/runstate.c:721:9
      #21 0x55b2542261fd in main /home/alxndr/Development/qemu/build/../sof=
tmmu/main.c:50:5
      #22 0x7f8d8f59acc9 in __libc_start_main csu/../csu/libc-start.c:308:16
      #23 0x55b254179bc9 in _start (/home/alxndr/Development/qemu/build/qem=
u-system-aarch64+0x3350bc9)

  AddressSanitizer can not provide additional info.
  SUMMARY: AddressSanitizer: SEGV /home/alxndr/Development/qemu/build/../so=
ftmmu/memory.c:80:44 in addrrange_shift
  =3D=3D637204=3D=3DABORTING

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913915/+subscriptions

