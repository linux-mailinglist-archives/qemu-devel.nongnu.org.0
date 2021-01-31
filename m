Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD35309A3E
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 05:36:32 +0100 (CET)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l64TP-0000UF-74
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 23:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l64SV-0008Pf-0t
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 23:35:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:37042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l64SQ-0005nR-09
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 23:35:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l64SO-0003zc-JY
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 04:35:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 924E42E8024
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 04:35:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 Jan 2021 04:29:08 -0000
From: Gaoning Pan <1913923@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hades0506
X-Launchpad-Bug-Reporter: Gaoning Pan (hades0506)
X-Launchpad-Bug-Modifier: Gaoning Pan (hades0506)
Message-Id: <161206734828.14645.4906468177399180805.malonedeb@wampee.canonical.com>
Subject: [Bug 1913923] [NEW] assert issue locates in
 hw/net/vmxnet3.c:1793:vmxnet3_io_bar1_write: code should not be reach
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: d92820ed5cb11a7ada48479924b8527962d50b64
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
Reply-To: Bug 1913923 <1913923@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,

I found an assertion failure in hw/net/vmxnet3.c:1793

This was found in latest version 5.2.0.

my reproduced is as follows:


cat << EOF | ./qemu-system-x86_64 \
-device vmxnet3 \
-display none -nodefaults -qtest stdio =

outl 0xcf8 0x80001014
outl 0xcfc 0xf0001000
outl 0xcf8 0x80001018
outl 0xcf8 0x80001004
outw 0xcfc 0x7
writel 0x5c000 0xbabefee1
writel 0x5c028 0x5d000
writel 0x5c03c 0x01010101
writel 0x5d038 0xe0000000 =

writel 0xf0001038 1
EOF


Backtrace is as follows:
#0  0x00007f6f641a5f47 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/un=
ix/sysv/linux/raise.c:51
#1  0x00007f6f641a78b1 in __GI_abort () at abort.c:79
#2  0x00007f6f67922315 in g_assertion_message () at /usr/lib/x86_64-linux-g=
nu/libglib-2.0.so.0
#3  0x00007f6f6792237a in g_assertion_message_expr () at /usr/lib/x86_64-li=
nux-gnu/libglib-2.0.so.0
#4  0x000055edcaec96af in vmxnet3_io_bar1_write (opaque=3D0x628000004100, a=
ddr=3D56, val=3D1, size=3D4) at ../hw/net/vmxnet3.c:1793
#5  0x000055edcbd294c6 in memory_region_write_accessor (mr=3D0x628000006b00=
, addr=3D56, value=3D0x7fffd52ba848, size=3D4, shift=3D0, mask=3D4294967295=
, attrs=3D...) at ../softmmu/memory.c:491
#6  0x000055edcbd299be in access_with_adjusted_size (addr=3D56, value=3D0x7=
fffd52ba848, size=3D4, access_size_min=3D4, access_size_max=3D4, access_fn=
=3D0x55edcbd2918c <memory_region_write_accessor>, mr=3D0x628000006b00, attr=
s=3D...) at ../softmmu/memory.c:552
#7  0x000055edcbd35ef2 in memory_region_dispatch_write (mr=3D0x628000006b00=
, addr=3D56, data=3D1, op=3DMO_32, attrs=3D...) at ../softmmu/memory.c:1501
#8  0x000055edcba1e554 in flatview_write_continue (fv=3D0x6060000619a0, add=
r=3D4026535992, attrs=3D..., ptr=3D0x7fffd52bae80, len=3D4, addr1=3D56, l=
=3D4, mr=3D0x628000006b00) at ../softmmu/physmem.c:2759
#9  0x000055edcba1e8c5 in flatview_write (fv=3D0x6060000619a0, addr=3D40265=
35992, attrs=3D..., buf=3D0x7fffd52bae80, len=3D4) at ../softmmu/physmem.c:=
2799
#10 0x000055edcba1f391 in address_space_write (as=3D0x608000002620, addr=3D=
4026535992, attrs=3D..., buf=3D0x7fffd52bae80, len=3D4) at ../softmmu/physm=
em.c:2891
#11 0x000055edcbaff8d3 in qtest_process_command (chr=3D0x55edd03ff4a0 <qtes=
t_chr>, words=3D0x60300007f450) at ../softmmu/qtest.c:534
#12 0x000055edcbb04aa1 in qtest_process_inbuf (chr=3D0x55edd03ff4a0 <qtest_=
chr>, inbuf=3D0x61900000fd00) at ../softmmu/qtest.c:797
#13 0x000055edcbb04bcc in qtest_read (opaque=3D0x55edd03ff4a0 <qtest_chr>, =
buf=3D0x7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0x=
cf8 0x80001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbab=
efee1\nwritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0x=
e0000"..., size=3D225) at ../softmmu/qtest.c:809
#14 0x000055edcbe73742 in qemu_chr_be_write_impl (s=3D0x60f000002110, buf=
=3D0x7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0xcf8=
 0x80001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbabefe=
e1\nwritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0xe00=
00"..., len=3D225) at ../chardev/char.c:201
#15 0x000055edcbe73820 in qemu_chr_be_write (s=3D0x60f000002110, buf=3D0x7f=
ffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0xcf8 0x8000=
1018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbabefee1\nwri=
tel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0xe0000"...,=
 len=3D225) at ../chardev/char.c:213
#16 0x000055edcbe9188e in fd_chr_read (chan=3D0x608000002520, cond=3D(G_IO_=
IN | G_IO_HUP), opaque=3D0x60f000002110) at ../chardev/char-fd.c:68
#17 0x000055edcbe2379d in qio_channel_fd_source_dispatch (source=3D0x60c000=
025c00, callback=3D0x55edcbe915ac <fd_chr_read>, user_data=3D0x60f000002110=
) at ../io/channel-watch.c:84
#18 0x00007f6f678fb285 in g_main_context_dispatch () at /usr/lib/x86_64-lin=
ux-gnu/libglib-2.0.so.0
#19 0x000055edcc50b503 in glib_pollfds_poll () at ../util/main-loop.c:221
#20 0x000055edcc50b68b in os_host_main_loop_wait (timeout=3D0) at ../util/m=
ain-loop.c:244
#21 0x000055edcc50b9a5 in main_loop_wait (nonblocking=3D0) at ../util/main-=
loop.c:520
#22 0x000055edcbd8805b in qemu_main_loop () at ../softmmu/vl.c:1678
#23 0x000055edcab67e69 in main (argc=3D8, argv=3D0x7fffd52bd1d8, envp=3D0x7=
fffd52bd220) at ../softmmu/main.c:50
#24 0x00007f6f64188b97 in __libc_start_main (main=3D0x55edcab67e2a <main>, =
argc=3D8, argv=3D0x7fffd52bd1d8, init=3D<optimized out>, fini=3D<optimized =
out>, rtld_fini=3D<optimized out>, stack_end=3D0x7fffd52bd1c8) at ../csu/li=
bc-start.c:310
#25 0x000055edcab67d4a in _start ()

** Affects: qemu
     Importance: Undecided
         Status: New

** Summary changed:

- assert issue locates in hw/net/vmxnet3.c:1793:vmxnet3_io_bar1_write: code=
 should not be reache
+ assert issue locates in hw/net/vmxnet3.c:1793:vmxnet3_io_bar1_write: code=
 should not be reach

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913923

Title:
  assert issue locates in hw/net/vmxnet3.c:1793:vmxnet3_io_bar1_write:
  code should not be reach

Status in QEMU:
  New

Bug description:
  Hello,

  I found an assertion failure in hw/net/vmxnet3.c:1793

  This was found in latest version 5.2.0.

  my reproduced is as follows:

  =

  cat << EOF | ./qemu-system-x86_64 \
  -device vmxnet3 \
  -display none -nodefaults -qtest stdio =

  outl 0xcf8 0x80001014
  outl 0xcfc 0xf0001000
  outl 0xcf8 0x80001018
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  writel 0x5c000 0xbabefee1
  writel 0x5c028 0x5d000
  writel 0x5c03c 0x01010101
  writel 0x5d038 0xe0000000 =

  writel 0xf0001038 1
  EOF

  =

  Backtrace is as follows:
  #0  0x00007f6f641a5f47 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/=
unix/sysv/linux/raise.c:51
  #1  0x00007f6f641a78b1 in __GI_abort () at abort.c:79
  #2  0x00007f6f67922315 in g_assertion_message () at /usr/lib/x86_64-linux=
-gnu/libglib-2.0.so.0
  #3  0x00007f6f6792237a in g_assertion_message_expr () at /usr/lib/x86_64-=
linux-gnu/libglib-2.0.so.0
  #4  0x000055edcaec96af in vmxnet3_io_bar1_write (opaque=3D0x628000004100,=
 addr=3D56, val=3D1, size=3D4) at ../hw/net/vmxnet3.c:1793
  #5  0x000055edcbd294c6 in memory_region_write_accessor (mr=3D0x628000006b=
00, addr=3D56, value=3D0x7fffd52ba848, size=3D4, shift=3D0, mask=3D42949672=
95, attrs=3D...) at ../softmmu/memory.c:491
  #6  0x000055edcbd299be in access_with_adjusted_size (addr=3D56, value=3D0=
x7fffd52ba848, size=3D4, access_size_min=3D4, access_size_max=3D4, access_f=
n=3D0x55edcbd2918c <memory_region_write_accessor>, mr=3D0x628000006b00, att=
rs=3D...) at ../softmmu/memory.c:552
  #7  0x000055edcbd35ef2 in memory_region_dispatch_write (mr=3D0x628000006b=
00, addr=3D56, data=3D1, op=3DMO_32, attrs=3D...) at ../softmmu/memory.c:15=
01
  #8  0x000055edcba1e554 in flatview_write_continue (fv=3D0x6060000619a0, a=
ddr=3D4026535992, attrs=3D..., ptr=3D0x7fffd52bae80, len=3D4, addr1=3D56, l=
=3D4, mr=3D0x628000006b00) at ../softmmu/physmem.c:2759
  #9  0x000055edcba1e8c5 in flatview_write (fv=3D0x6060000619a0, addr=3D402=
6535992, attrs=3D..., buf=3D0x7fffd52bae80, len=3D4) at ../softmmu/physmem.=
c:2799
  #10 0x000055edcba1f391 in address_space_write (as=3D0x608000002620, addr=
=3D4026535992, attrs=3D..., buf=3D0x7fffd52bae80, len=3D4) at ../softmmu/ph=
ysmem.c:2891
  #11 0x000055edcbaff8d3 in qtest_process_command (chr=3D0x55edd03ff4a0 <qt=
est_chr>, words=3D0x60300007f450) at ../softmmu/qtest.c:534
  #12 0x000055edcbb04aa1 in qtest_process_inbuf (chr=3D0x55edd03ff4a0 <qtes=
t_chr>, inbuf=3D0x61900000fd00) at ../softmmu/qtest.c:797
  #13 0x000055edcbb04bcc in qtest_read (opaque=3D0x55edd03ff4a0 <qtest_chr>=
, buf=3D0x7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl =
0xcf8 0x80001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xb=
abefee1\nwritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 =
0xe0000"..., size=3D225) at ../softmmu/qtest.c:809
  #14 0x000055edcbe73742 in qemu_chr_be_write_impl (s=3D0x60f000002110, buf=
=3D0x7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0xcf8=
 0x80001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbabefe=
e1\nwritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0xe00=
00"..., len=3D225) at ../chardev/char.c:201
  #15 0x000055edcbe73820 in qemu_chr_be_write (s=3D0x60f000002110, buf=3D0x=
7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0xcf8 0x80=
001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbabefee1\nw=
ritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0xe0000"..=
., len=3D225) at ../chardev/char.c:213
  #16 0x000055edcbe9188e in fd_chr_read (chan=3D0x608000002520, cond=3D(G_I=
O_IN | G_IO_HUP), opaque=3D0x60f000002110) at ../chardev/char-fd.c:68
  #17 0x000055edcbe2379d in qio_channel_fd_source_dispatch (source=3D0x60c0=
00025c00, callback=3D0x55edcbe915ac <fd_chr_read>, user_data=3D0x60f0000021=
10) at ../io/channel-watch.c:84
  #18 0x00007f6f678fb285 in g_main_context_dispatch () at /usr/lib/x86_64-l=
inux-gnu/libglib-2.0.so.0
  #19 0x000055edcc50b503 in glib_pollfds_poll () at ../util/main-loop.c:221
  #20 0x000055edcc50b68b in os_host_main_loop_wait (timeout=3D0) at ../util=
/main-loop.c:244
  #21 0x000055edcc50b9a5 in main_loop_wait (nonblocking=3D0) at ../util/mai=
n-loop.c:520
  #22 0x000055edcbd8805b in qemu_main_loop () at ../softmmu/vl.c:1678
  #23 0x000055edcab67e69 in main (argc=3D8, argv=3D0x7fffd52bd1d8, envp=3D0=
x7fffd52bd220) at ../softmmu/main.c:50
  #24 0x00007f6f64188b97 in __libc_start_main (main=3D0x55edcab67e2a <main>=
, argc=3D8, argv=3D0x7fffd52bd1d8, init=3D<optimized out>, fini=3D<optimize=
d out>, rtld_fini=3D<optimized out>, stack_end=3D0x7fffd52bd1c8) at ../csu/=
libc-start.c:310
  #25 0x000055edcab67d4a in _start ()

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913923/+subscriptions

