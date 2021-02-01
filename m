Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0694A30A2E7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 08:57:14 +0100 (CET)
Received: from localhost ([::1]:50402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6U5B-00060k-0V
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 02:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6U4A-0005HY-HE
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:56:10 -0500
Received: from indium.canonical.com ([91.189.90.7]:36622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6U47-0004Fh-5H
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:56:10 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l6U45-0000pv-9U
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:56:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 465502E8139
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 07:56:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Feb 2021 07:47:20 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1913923@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hades0506 philmd
X-Launchpad-Bug-Reporter: Gaoning Pan (hades0506)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161206734828.14645.4906468177399180805.malonedeb@wampee.canonical.com>
Message-Id: <664441c3-4d69-1526-7fae-8c445940f3d6@redhat.com>
Subject: Re: [Bug 1913923] [NEW] assert issue locates in
 hw/net/vmxnet3.c:1793:vmxnet3_io_bar1_write: code should not be reach
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: ce989480ebb12fd72d86a875ae2b24ee345d55c1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

Cc'ing Dmitry Fleytman

On 1/31/21 5:29 AM, Gaoning Pan wrote:
> Public bug reported:
> =

> Hello,
> =

> I found an assertion failure in hw/net/vmxnet3.c:1793
> =

> This was found in latest version 5.2.0.
> =

> my reproduced is as follows:
> =

> =

> cat << EOF | ./qemu-system-x86_64 \
> -device vmxnet3 \
> -display none -nodefaults -qtest stdio =

> outl 0xcf8 0x80001014
> outl 0xcfc 0xf0001000
> outl 0xcf8 0x80001018
> outl 0xcf8 0x80001004
> outw 0xcfc 0x7
> writel 0x5c000 0xbabefee1
> writel 0x5c028 0x5d000
> writel 0x5c03c 0x01010101
> writel 0x5d038 0xe0000000 =

> writel 0xf0001038 1
> EOF
> =

> =

> Backtrace is as follows:
> #0  0x00007f6f641a5f47 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/=
unix/sysv/linux/raise.c:51
> #1  0x00007f6f641a78b1 in __GI_abort () at abort.c:79
> #2  0x00007f6f67922315 in g_assertion_message () at /usr/lib/x86_64-linux=
-gnu/libglib-2.0.so.0
> #3  0x00007f6f6792237a in g_assertion_message_expr () at /usr/lib/x86_64-=
linux-gnu/libglib-2.0.so.0
> #4  0x000055edcaec96af in vmxnet3_io_bar1_write (opaque=3D0x628000004100,=
 addr=3D56, val=3D1, size=3D4) at ../hw/net/vmxnet3.c:1793
> #5  0x000055edcbd294c6 in memory_region_write_accessor (mr=3D0x628000006b=
00, addr=3D56, value=3D0x7fffd52ba848, size=3D4, shift=3D0, mask=3D42949672=
95, attrs=3D...) at ../softmmu/memory.c:491
> #6  0x000055edcbd299be in access_with_adjusted_size (addr=3D56, value=3D0=
x7fffd52ba848, size=3D4, access_size_min=3D4, access_size_max=3D4, access_f=
n=3D0x55edcbd2918c <memory_region_write_accessor>, mr=3D0x628000006b00, att=
rs=3D...) at ../softmmu/memory.c:552
> #7  0x000055edcbd35ef2 in memory_region_dispatch_write (mr=3D0x628000006b=
00, addr=3D56, data=3D1, op=3DMO_32, attrs=3D...) at ../softmmu/memory.c:15=
01
> #8  0x000055edcba1e554 in flatview_write_continue (fv=3D0x6060000619a0, a=
ddr=3D4026535992, attrs=3D..., ptr=3D0x7fffd52bae80, len=3D4, addr1=3D56, l=
=3D4, mr=3D0x628000006b00) at ../softmmu/physmem.c:2759
> #9  0x000055edcba1e8c5 in flatview_write (fv=3D0x6060000619a0, addr=3D402=
6535992, attrs=3D..., buf=3D0x7fffd52bae80, len=3D4) at ../softmmu/physmem.=
c:2799
> #10 0x000055edcba1f391 in address_space_write (as=3D0x608000002620, addr=
=3D4026535992, attrs=3D..., buf=3D0x7fffd52bae80, len=3D4) at ../softmmu/ph=
ysmem.c:2891
> #11 0x000055edcbaff8d3 in qtest_process_command (chr=3D0x55edd03ff4a0 <qt=
est_chr>, words=3D0x60300007f450) at ../softmmu/qtest.c:534
> #12 0x000055edcbb04aa1 in qtest_process_inbuf (chr=3D0x55edd03ff4a0 <qtes=
t_chr>, inbuf=3D0x61900000fd00) at ../softmmu/qtest.c:797
> #13 0x000055edcbb04bcc in qtest_read (opaque=3D0x55edd03ff4a0 <qtest_chr>=
, buf=3D0x7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl =
0xcf8 0x80001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xb=
abefee1\nwritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 =
0xe0000"..., size=3D225) at ../softmmu/qtest.c:809
> #14 0x000055edcbe73742 in qemu_chr_be_write_impl (s=3D0x60f000002110, buf=
=3D0x7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0xcf8=
 0x80001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbabefe=
e1\nwritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0xe00=
00"..., len=3D225) at ../chardev/char.c:201
> #15 0x000055edcbe73820 in qemu_chr_be_write (s=3D0x60f000002110, buf=3D0x=
7fffd52bbe30 "outl 0xcf8 0x80001014\noutl 0xcfc 0xf0001000\noutl 0xcf8 0x80=
001018\noutl 0xcf8 0x80001004\noutw 0xcfc 0x7\nwritel 0x5c000 0xbabefee1\nw=
ritel 0x5c028 0x5d000\nwritel 0x5c03c 0x01010101\nwritel 0x5d038 0xe0000"..=
., len=3D225) at ../chardev/char.c:213
> #16 0x000055edcbe9188e in fd_chr_read (chan=3D0x608000002520, cond=3D(G_I=
O_IN | G_IO_HUP), opaque=3D0x60f000002110) at ../chardev/char-fd.c:68
> #17 0x000055edcbe2379d in qio_channel_fd_source_dispatch (source=3D0x60c0=
00025c00, callback=3D0x55edcbe915ac <fd_chr_read>, user_data=3D0x60f0000021=
10) at ../io/channel-watch.c:84
> #18 0x00007f6f678fb285 in g_main_context_dispatch () at /usr/lib/x86_64-l=
inux-gnu/libglib-2.0.so.0
> #19 0x000055edcc50b503 in glib_pollfds_poll () at ../util/main-loop.c:221
> #20 0x000055edcc50b68b in os_host_main_loop_wait (timeout=3D0) at ../util=
/main-loop.c:244
> #21 0x000055edcc50b9a5 in main_loop_wait (nonblocking=3D0) at ../util/mai=
n-loop.c:520
> #22 0x000055edcbd8805b in qemu_main_loop () at ../softmmu/vl.c:1678
> #23 0x000055edcab67e69 in main (argc=3D8, argv=3D0x7fffd52bd1d8, envp=3D0=
x7fffd52bd220) at ../softmmu/main.c:50
> #24 0x00007f6f64188b97 in __libc_start_main (main=3D0x55edcab67e2a <main>=
, argc=3D8, argv=3D0x7fffd52bd1d8, init=3D<optimized out>, fini=3D<optimize=
d out>, rtld_fini=3D<optimized out>, stack_end=3D0x7fffd52bd1c8) at ../csu/=
libc-start.c:310
> #25 0x000055edcab67d4a in _start ()

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

