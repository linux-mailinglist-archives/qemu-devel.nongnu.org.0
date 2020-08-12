Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661CC242BB0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 16:56:55 +0200 (CEST)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5sBS-0006Ow-H1
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 10:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5sAO-0005yJ-U4
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 10:55:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:40454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5sAL-0007T4-Ou
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 10:55:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k5sAJ-0007Q3-Gn
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 14:55:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7D2DB2E8081
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 14:55:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2020 14:47:19 -0000
From: Alexander Bulekov <1891341@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
Message-Id: <159724363988.27044.15720076798297436506.malonedeb@gac.canonical.com>
Subject: [Bug 1891341] [NEW] Heap-use-after-free in usb_packet_copy through
 iov_to_buf
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 69bea908b87e709947cb1fc236acd3289efb71b1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 06:10:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1891341 <1891341@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,
Reproducer:

cat << EOF | ./i386-softmmu/qemu-system-i386 -device nec-usb-xhci \
-trace usb\* -device usb-audio -device usb-storage,drive=3Dmydrive \
-drive id=3Dmydrive,file=3Dnull-co://,size=3D2M,format=3Draw,if=3Dnone \
-nodefaults -nographic -qtest stdio
outl 0xcf8 0x80001016
outl 0xcfc 0x3c009f0d
outl 0xcf8 0x80001004
outl 0xcfc 0xc77695e
writel 0x9f0d000000000040 0xffff3655
writeq 0x9f0d000000002000 0xff2f9e0000000000
write 0x1d 0x1 0x27
write 0x2d 0x1 0x2e
write 0x17232 0x1 0x03
write 0x17254 0x1 0x06
write 0x17278 0x1 0x34
write 0x3d 0x1 0x27
write 0x40 0x1 0x2e
write 0x41 0x1 0x72
write 0x42 0x1 0x01
write 0x4d 0x1 0x2e
write 0x4f 0x1 0x01
writeq 0x9f0d000000002000 0x5c051a0100000000
write 0x34001d 0x1 0x13
write 0x340026 0x1 0x30
write 0x340028 0x1 0x08
write 0x34002c 0x1 0xfe
write 0x34002d 0x1 0x08
write 0x340037 0x1 0x5e
write 0x34003a 0x1 0x05
write 0x34003d 0x1 0x05
write 0x34004d 0x1 0x13
writeq 0x9f0d000000002000 0xff00010100400009
EOF


Abridged trace:
...
[R +0.032356] writel 0x9f0d000000000040 0xffff3655
4760@1597243414.491762:usb_xhci_oper_write off 0x0000, val 0xffff3655
4760@1597243414.491765:usb_xhci_run
4760@1597243414.491769:usb_xhci_irq_intx level 0
OK
[S +0.032371] OK
[R +0.032376] writeq 0x9f0d000000002000 0xff2f9e0000000000
4760@1597243414.491784:usb_xhci_doorbell_write off 0x0000, val 0x00000000
4760@1597243414.491793:usb_xhci_fetch_trb addr 0x0000000000000000, TRB_RESE=
RVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
4760@1597243414.491798:usb_xhci_doorbell_write off 0x0004, val 0xff2f9e00
OK
[S +0.032400] OK
...

[R +0.032495] writeq 0x9f0d000000002000 0x5c051a0100000000
4760@1597243414.491899:usb_xhci_doorbell_write off 0x0000, val 0x00000000
4760@1597243414.491902:usb_xhci_fetch_trb addr 0x0000000000000010, CR_ENABL=
E_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002700
4760@1597243414.491906:usb_xhci_slot_enable slotid 1
4760@1597243414.491909:usb_xhci_fetch_trb addr 0x0000000000000020, CR_ADDRE=
SS_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x00002e00
4760@1597243414.491914:usb_xhci_fetch_trb addr 0x0000000000000030, CR_ENABL=
E_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002700
4760@1597243414.491917:usb_xhci_slot_enable slotid 2
4760@1597243414.491920:usb_xhci_fetch_trb addr 0x0000000000000040, CR_ADDRE=
SS_DEVICE, p 0x000000000001722e, s 0x00000000, c 0x01002e00
4760@1597243414.491925:usb_xhci_slot_address slotid 1, port 2
4760@1597243414.491931:usb_xhci_ep_enable slotid 1, epid 1
4760@1597243414.491937:usb_xhci_fetch_trb addr 0x0000000000000050, TRB_RESE=
RVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
4760@1597243414.491941:usb_xhci_doorbell_write off 0x0004, val 0x5c051a01
4760@1597243414.491945:usb_xhci_ep_kick slotid 1, epid 1, streamid 23557
4760@1597243414.491955:usb_xhci_fetch_trb addr 0x0000000000340000, TRB_RESE=
RVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
OK
[S +0.032563] OK
...

OK
[S +0.032643] OK
[R +0.032648] writeq 0x9f0d000000002000 0xff00010100400009
4760@1597243414.492052:usb_xhci_doorbell_write off 0x0000, val 0x00400009
4760@1597243414.492055:usb_xhci_doorbell_write off 0x0004, val 0xff000101
4760@1597243414.492058:usb_xhci_ep_kick slotid 1, epid 1, streamid 65280
4760@1597243414.492063:usb_xhci_fetch_trb addr 0x0000000000340010, TR_STATU=
S, p 0x0000000000000000, s 0x00000000, c 0x00001300
4760@1597243414.492067:usb_xhci_xfer_start 0x611000045140: slotid 1, epid 1=
, streamid 0
4760@1597243414.492074:usb_xhci_fetch_trb addr 0x0000000000340020, TR_SETUP=
, p 0x0030000000000000, s 0x00000008, c 0x000008fe
4760@1597243414.492078:usb_xhci_fetch_trb addr 0x0000000000340030, TR_NORMA=
L, p 0x5e00000000000000, s 0x00050000, c 0x00000500
4760@1597243414.492081:usb_xhci_fetch_trb addr 0x0000000000340040, TR_STATU=
S, p 0x0000000000000000, s 0x00000000, c 0x00001300
4760@1597243414.492084:usb_xhci_xfer_start 0x611000045280: slotid 1, epid 1=
, streamid 0
4760@1597243414.492089:usb_packet_state_change bus 0, port 2, ep 0, packet =
0x611000045288, state undef -> setup
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D4760=3D=3DERROR: AddressSanitizer: heap-use-after-free on address 0x6=
25000341000 at pc 0x562d20cd6847 bp 0x7ffccc326780 sp 0x7ffccc325f48
READ of size 48 at 0x625000341000 thread T0
    #0 0x562d20cd6846 in __asan_memcpy (build/i386-softmmu/qemu-system-i386=
+0x250d846)
    #1 0x562d22a6b374 in iov_to_buf_full util/iov.c:52:13
    #2 0x562d21ee5139 in iov_to_buf include/qemu/iov.h:62:16
    #3 0x562d21ee5139 in usb_packet_copy hw/usb/core.c:595:9
    #4 0x562d21ee96b4 in do_parameter hw/usb/core.c:284:9
    #5 0x562d21ee96b4 in usb_process_one hw/usb/core.c:369:13
    #6 0x562d21ee6ad8 in usb_handle_packet hw/usb/core.c:419:9
    #7 0x562d21f927b6 in xhci_kick_epctx hw/usb/hcd-xhci.c
    #8 0x562d21fb337d in xhci_doorbell_write hw/usb/hcd-xhci.c:3162:13
    #9 0x562d212f1b8e in memory_region_write_accessor softmmu/memory.c:483:5
    #10 0x562d212f158b in access_with_adjusted_size softmmu/memory.c:544:18
    #11 0x562d212f0d9b in memory_region_dispatch_write softmmu/memory.c
    #12 0x562d20d344d2 in flatview_write_continue exec.c:3176:23
    #13 0x562d20d29e6b in flatview_write exec.c:3216:14
    #14 0x562d20d29e6b in address_space_write exec.c:3308:18
    #15 0x562d213322a9 in qtest_process_command softmmu/qtest.c:452:13
    #16 0x562d2132f087 in qtest_process_inbuf softmmu/qtest.c:710:9
    #17 0x562d22802293 in fd_chr_read chardev/char-fd.c:68:9
    #18 0x7f6b5673b897 in g_main_context_dispatch (/usr/lib/x86_64-linux-gn=
u/libglib-2.0.so.0+0x4e897)
    #19 0x562d22a821b3 in glib_pollfds_poll util/main-loop.c:217:9
    #20 0x562d22a821b3 in os_host_main_loop_wait util/main-loop.c:240:5
    #21 0x562d22a821b3 in main_loop_wait util/main-loop.c:516:11
    #22 0x562d21340008 in qemu_main_loop softmmu/vl.c:1676:9
    #23 0x562d228b10fd in main softmmu/main.c:49:5

0x625000341000 is located 0 bytes inside of 4096-byte region [0x62500034100=
0,0x625000342000)
freed by thread T0 here:
    #0 0x562d20cd716d in free (build/i386-softmmu/qemu-system-i386+0x250e16=
d)
    #1 0x562d22a02242 in qemu_vfree util/oslib-posix.c:247:5
    #2 0x562d20d2d019 in address_space_unmap exec.c:3637:5
    #3 0x562d21f09bbb in dma_memory_unmap include/sysemu/dma.h:145:5
    #4 0x562d21f09bbb in usb_packet_unmap hw/usb/libhw.c:65:9
    #5 0x562d21f0966f in usb_packet_map hw/usb/libhw.c:54:5
    #6 0x562d21f985f1 in xhci_setup_packet hw/usb/hcd-xhci.c:1618:5
    #7 0x562d21f92143 in xhci_fire_ctl_transfer hw/usb/hcd-xhci.c:1722:9
    #8 0x562d21f92143 in xhci_kick_epctx hw/usb/hcd-xhci.c:1991:13
    #9 0x562d21fb337d in xhci_doorbell_write hw/usb/hcd-xhci.c:3162:13
    #10 0x562d212f1b8e in memory_region_write_accessor softmmu/memory.c:483=
:5
    #11 0x562d212f158b in access_with_adjusted_size softmmu/memory.c:544:18
    #12 0x562d212f0d9b in memory_region_dispatch_write softmmu/memory.c
    #13 0x562d20d344d2 in flatview_write_continue exec.c:3176:23
    #14 0x562d20d29e6b in flatview_write exec.c:3216:14
    #15 0x562d20d29e6b in address_space_write exec.c:3308:18
    #16 0x562d213322a9 in qtest_process_command softmmu/qtest.c:452:13
    #17 0x562d2132f087 in qtest_process_inbuf softmmu/qtest.c:710:9
    #18 0x562d22802293 in fd_chr_read chardev/char-fd.c:68:9
    #19 0x7f6b5673b897 in g_main_context_dispatch

previously allocated by thread T0 here:
    #0 0x562d20cd7ea7 in posix_memalign (build/i386-softmmu/qemu-system-i38=
6+0x250eea7)
    #1 0x562d22a01995 in qemu_try_memalign util/oslib-posix.c:207:11
    #2 0x562d22a01d48 in qemu_memalign util/oslib-posix.c:223:27
    #3 0x562d20d2c8f0 in address_space_map exec.c:3586:25
    #4 0x562d21f093cb in dma_memory_map include/sysemu/dma.h:135:9
    #5 0x562d21f093cb in usb_packet_map hw/usb/libhw.c:39:19
    #6 0x562d21f985f1 in xhci_setup_packet hw/usb/hcd-xhci.c:1618:5
    #7 0x562d21f92143 in xhci_fire_ctl_transfer hw/usb/hcd-xhci.c:1722:9
    #8 0x562d21f92143 in xhci_kick_epctx hw/usb/hcd-xhci.c:1991:13
    #9 0x562d21fb337d in xhci_doorbell_write hw/usb/hcd-xhci.c:3162:13
    #10 0x562d212f1b8e in memory_region_write_accessor softmmu/memory.c:483=
:5
    #11 0x562d212f158b in access_with_adjusted_size softmmu/memory.c:544:18
    #12 0x562d212f0d9b in memory_region_dispatch_write softmmu/memory.c
    #13 0x562d20d344d2 in flatview_write_continue exec.c:3176:23
    #14 0x562d20d29e6b in flatview_write exec.c:3216:14
    #15 0x562d20d29e6b in address_space_write exec.c:3308:18
    #16 0x562d213322a9 in qtest_process_command softmmu/qtest.c:452:13
    #17 0x562d2132f087 in qtest_process_inbuf softmmu/qtest.c:710:9
    #18 0x562d22802293 in fd_chr_read chardev/char-fd.c:68:9
    #19 0x7f6b5673b897 in g_main_context_dispatch

-Alex

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1891341

Title:
  Heap-use-after-free in usb_packet_copy through iov_to_buf

Status in QEMU:
  New

Bug description:
  Hello,
  Reproducer:

  cat << EOF | ./i386-softmmu/qemu-system-i386 -device nec-usb-xhci \
  -trace usb\* -device usb-audio -device usb-storage,drive=3Dmydrive \
  -drive id=3Dmydrive,file=3Dnull-co://,size=3D2M,format=3Draw,if=3Dnone \
  -nodefaults -nographic -qtest stdio
  outl 0xcf8 0x80001016
  outl 0xcfc 0x3c009f0d
  outl 0xcf8 0x80001004
  outl 0xcfc 0xc77695e
  writel 0x9f0d000000000040 0xffff3655
  writeq 0x9f0d000000002000 0xff2f9e0000000000
  write 0x1d 0x1 0x27
  write 0x2d 0x1 0x2e
  write 0x17232 0x1 0x03
  write 0x17254 0x1 0x06
  write 0x17278 0x1 0x34
  write 0x3d 0x1 0x27
  write 0x40 0x1 0x2e
  write 0x41 0x1 0x72
  write 0x42 0x1 0x01
  write 0x4d 0x1 0x2e
  write 0x4f 0x1 0x01
  writeq 0x9f0d000000002000 0x5c051a0100000000
  write 0x34001d 0x1 0x13
  write 0x340026 0x1 0x30
  write 0x340028 0x1 0x08
  write 0x34002c 0x1 0xfe
  write 0x34002d 0x1 0x08
  write 0x340037 0x1 0x5e
  write 0x34003a 0x1 0x05
  write 0x34003d 0x1 0x05
  write 0x34004d 0x1 0x13
  writeq 0x9f0d000000002000 0xff00010100400009
  EOF

  =

  Abridged trace:
  ...
  [R +0.032356] writel 0x9f0d000000000040 0xffff3655
  4760@1597243414.491762:usb_xhci_oper_write off 0x0000, val 0xffff3655
  4760@1597243414.491765:usb_xhci_run
  4760@1597243414.491769:usb_xhci_irq_intx level 0
  OK
  [S +0.032371] OK
  [R +0.032376] writeq 0x9f0d000000002000 0xff2f9e0000000000
  4760@1597243414.491784:usb_xhci_doorbell_write off 0x0000, val 0x00000000
  4760@1597243414.491793:usb_xhci_fetch_trb addr 0x0000000000000000, TRB_RE=
SERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
  4760@1597243414.491798:usb_xhci_doorbell_write off 0x0004, val 0xff2f9e00
  OK
  [S +0.032400] OK
  ...

  [R +0.032495] writeq 0x9f0d000000002000 0x5c051a0100000000
  4760@1597243414.491899:usb_xhci_doorbell_write off 0x0000, val 0x00000000
  4760@1597243414.491902:usb_xhci_fetch_trb addr 0x0000000000000010, CR_ENA=
BLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002700
  4760@1597243414.491906:usb_xhci_slot_enable slotid 1
  4760@1597243414.491909:usb_xhci_fetch_trb addr 0x0000000000000020, CR_ADD=
RESS_DEVICE, p 0x0000000000000000, s 0x00000000, c 0x00002e00
  4760@1597243414.491914:usb_xhci_fetch_trb addr 0x0000000000000030, CR_ENA=
BLE_SLOT, p 0x0000000000000000, s 0x00000000, c 0x00002700
  4760@1597243414.491917:usb_xhci_slot_enable slotid 2
  4760@1597243414.491920:usb_xhci_fetch_trb addr 0x0000000000000040, CR_ADD=
RESS_DEVICE, p 0x000000000001722e, s 0x00000000, c 0x01002e00
  4760@1597243414.491925:usb_xhci_slot_address slotid 1, port 2
  4760@1597243414.491931:usb_xhci_ep_enable slotid 1, epid 1
  4760@1597243414.491937:usb_xhci_fetch_trb addr 0x0000000000000050, TRB_RE=
SERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
  4760@1597243414.491941:usb_xhci_doorbell_write off 0x0004, val 0x5c051a01
  4760@1597243414.491945:usb_xhci_ep_kick slotid 1, epid 1, streamid 23557
  4760@1597243414.491955:usb_xhci_fetch_trb addr 0x0000000000340000, TRB_RE=
SERVED, p 0x0000000000000000, s 0x00000000, c 0x00000000
  OK
  [S +0.032563] OK
  ...

  OK
  [S +0.032643] OK
  [R +0.032648] writeq 0x9f0d000000002000 0xff00010100400009
  4760@1597243414.492052:usb_xhci_doorbell_write off 0x0000, val 0x00400009
  4760@1597243414.492055:usb_xhci_doorbell_write off 0x0004, val 0xff000101
  4760@1597243414.492058:usb_xhci_ep_kick slotid 1, epid 1, streamid 65280
  4760@1597243414.492063:usb_xhci_fetch_trb addr 0x0000000000340010, TR_STA=
TUS, p 0x0000000000000000, s 0x00000000, c 0x00001300
  4760@1597243414.492067:usb_xhci_xfer_start 0x611000045140: slotid 1, epid=
 1, streamid 0
  4760@1597243414.492074:usb_xhci_fetch_trb addr 0x0000000000340020, TR_SET=
UP, p 0x0030000000000000, s 0x00000008, c 0x000008fe
  4760@1597243414.492078:usb_xhci_fetch_trb addr 0x0000000000340030, TR_NOR=
MAL, p 0x5e00000000000000, s 0x00050000, c 0x00000500
  4760@1597243414.492081:usb_xhci_fetch_trb addr 0x0000000000340040, TR_STA=
TUS, p 0x0000000000000000, s 0x00000000, c 0x00001300
  4760@1597243414.492084:usb_xhci_xfer_start 0x611000045280: slotid 1, epid=
 1, streamid 0
  4760@1597243414.492089:usb_packet_state_change bus 0, port 2, ep 0, packe=
t 0x611000045288, state undef -> setup
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D4760=3D=3DERROR: AddressSanitizer: heap-use-after-free on address 0=
x625000341000 at pc 0x562d20cd6847 bp 0x7ffccc326780 sp 0x7ffccc325f48
  READ of size 48 at 0x625000341000 thread T0
      #0 0x562d20cd6846 in __asan_memcpy (build/i386-softmmu/qemu-system-i3=
86+0x250d846)
      #1 0x562d22a6b374 in iov_to_buf_full util/iov.c:52:13
      #2 0x562d21ee5139 in iov_to_buf include/qemu/iov.h:62:16
      #3 0x562d21ee5139 in usb_packet_copy hw/usb/core.c:595:9
      #4 0x562d21ee96b4 in do_parameter hw/usb/core.c:284:9
      #5 0x562d21ee96b4 in usb_process_one hw/usb/core.c:369:13
      #6 0x562d21ee6ad8 in usb_handle_packet hw/usb/core.c:419:9
      #7 0x562d21f927b6 in xhci_kick_epctx hw/usb/hcd-xhci.c
      #8 0x562d21fb337d in xhci_doorbell_write hw/usb/hcd-xhci.c:3162:13
      #9 0x562d212f1b8e in memory_region_write_accessor softmmu/memory.c:48=
3:5
      #10 0x562d212f158b in access_with_adjusted_size softmmu/memory.c:544:=
18
      #11 0x562d212f0d9b in memory_region_dispatch_write softmmu/memory.c
      #12 0x562d20d344d2 in flatview_write_continue exec.c:3176:23
      #13 0x562d20d29e6b in flatview_write exec.c:3216:14
      #14 0x562d20d29e6b in address_space_write exec.c:3308:18
      #15 0x562d213322a9 in qtest_process_command softmmu/qtest.c:452:13
      #16 0x562d2132f087 in qtest_process_inbuf softmmu/qtest.c:710:9
      #17 0x562d22802293 in fd_chr_read chardev/char-fd.c:68:9
      #18 0x7f6b5673b897 in g_main_context_dispatch (/usr/lib/x86_64-linux-=
gnu/libglib-2.0.so.0+0x4e897)
      #19 0x562d22a821b3 in glib_pollfds_poll util/main-loop.c:217:9
      #20 0x562d22a821b3 in os_host_main_loop_wait util/main-loop.c:240:5
      #21 0x562d22a821b3 in main_loop_wait util/main-loop.c:516:11
      #22 0x562d21340008 in qemu_main_loop softmmu/vl.c:1676:9
      #23 0x562d228b10fd in main softmmu/main.c:49:5

  0x625000341000 is located 0 bytes inside of 4096-byte region [0x625000341=
000,0x625000342000)
  freed by thread T0 here:
      #0 0x562d20cd716d in free (build/i386-softmmu/qemu-system-i386+0x250e=
16d)
      #1 0x562d22a02242 in qemu_vfree util/oslib-posix.c:247:5
      #2 0x562d20d2d019 in address_space_unmap exec.c:3637:5
      #3 0x562d21f09bbb in dma_memory_unmap include/sysemu/dma.h:145:5
      #4 0x562d21f09bbb in usb_packet_unmap hw/usb/libhw.c:65:9
      #5 0x562d21f0966f in usb_packet_map hw/usb/libhw.c:54:5
      #6 0x562d21f985f1 in xhci_setup_packet hw/usb/hcd-xhci.c:1618:5
      #7 0x562d21f92143 in xhci_fire_ctl_transfer hw/usb/hcd-xhci.c:1722:9
      #8 0x562d21f92143 in xhci_kick_epctx hw/usb/hcd-xhci.c:1991:13
      #9 0x562d21fb337d in xhci_doorbell_write hw/usb/hcd-xhci.c:3162:13
      #10 0x562d212f1b8e in memory_region_write_accessor softmmu/memory.c:4=
83:5
      #11 0x562d212f158b in access_with_adjusted_size softmmu/memory.c:544:=
18
      #12 0x562d212f0d9b in memory_region_dispatch_write softmmu/memory.c
      #13 0x562d20d344d2 in flatview_write_continue exec.c:3176:23
      #14 0x562d20d29e6b in flatview_write exec.c:3216:14
      #15 0x562d20d29e6b in address_space_write exec.c:3308:18
      #16 0x562d213322a9 in qtest_process_command softmmu/qtest.c:452:13
      #17 0x562d2132f087 in qtest_process_inbuf softmmu/qtest.c:710:9
      #18 0x562d22802293 in fd_chr_read chardev/char-fd.c:68:9
      #19 0x7f6b5673b897 in g_main_context_dispatch

  previously allocated by thread T0 here:
      #0 0x562d20cd7ea7 in posix_memalign (build/i386-softmmu/qemu-system-i=
386+0x250eea7)
      #1 0x562d22a01995 in qemu_try_memalign util/oslib-posix.c:207:11
      #2 0x562d22a01d48 in qemu_memalign util/oslib-posix.c:223:27
      #3 0x562d20d2c8f0 in address_space_map exec.c:3586:25
      #4 0x562d21f093cb in dma_memory_map include/sysemu/dma.h:135:9
      #5 0x562d21f093cb in usb_packet_map hw/usb/libhw.c:39:19
      #6 0x562d21f985f1 in xhci_setup_packet hw/usb/hcd-xhci.c:1618:5
      #7 0x562d21f92143 in xhci_fire_ctl_transfer hw/usb/hcd-xhci.c:1722:9
      #8 0x562d21f92143 in xhci_kick_epctx hw/usb/hcd-xhci.c:1991:13
      #9 0x562d21fb337d in xhci_doorbell_write hw/usb/hcd-xhci.c:3162:13
      #10 0x562d212f1b8e in memory_region_write_accessor softmmu/memory.c:4=
83:5
      #11 0x562d212f158b in access_with_adjusted_size softmmu/memory.c:544:=
18
      #12 0x562d212f0d9b in memory_region_dispatch_write softmmu/memory.c
      #13 0x562d20d344d2 in flatview_write_continue exec.c:3176:23
      #14 0x562d20d29e6b in flatview_write exec.c:3216:14
      #15 0x562d20d29e6b in address_space_write exec.c:3308:18
      #16 0x562d213322a9 in qtest_process_command softmmu/qtest.c:452:13
      #17 0x562d2132f087 in qtest_process_inbuf softmmu/qtest.c:710:9
      #18 0x562d22802293 in fd_chr_read chardev/char-fd.c:68:9
      #19 0x7f6b5673b897 in g_main_context_dispatch

  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1891341/+subscriptions

