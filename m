Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EDD391939
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 15:52:51 +0200 (CEST)
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lltxq-0001x7-JY
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 09:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lltwY-0001Go-Uo
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:51:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:37798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lltwV-0002hJ-TH
 for qemu-devel@nongnu.org; Wed, 26 May 2021 09:51:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lltwR-0005eA-Gz
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 13:51:23 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 856C52E81DB
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 13:51:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 13:42:34 -0000
From: Thomas Huth <1878651@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158947446326.30820.963463952935210619.malonedeb@chaenomeles.canonical.com>
Message-Id: <162203655443.22462.16038742832730159895.malone@chaenomeles.canonical.com>
Subject: [Bug 1878651] Re: Assertion failure in e1000e_write_to_rx_buffers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: a891180abb7ea65d09d195b5bb38ecf544da5868
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1878651 <1878651@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the crash with the original reproducer seems to be gone, the
minimized reproducer from comment #2 still triggers this issue. Setting
to "Confirmed".

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878651

Title:
  Assertion failure in e1000e_write_to_rx_buffers

Status in QEMU:
  Confirmed

Bug description:
  Hello,
  While fuzzing, I found an input which triggers an assertion failure in e1=
000e_write_to_rx_buffers:
  /home/alxndr/Development/qemu/hw/net/e1000e_core.c:1424: void e1000e_writ=
e_to_rx_buffers(E1000ECore *, hwaddr (*)[4], e1000e_ba_state *, const char =
*, dma_addr_t): Assertion `bastate->cur_idx < MAX_PS_BUFFERS' failed.
  #0  0x00007ffff686d761 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdep=
s/unix/sysv/linux/raise.c:50
  #1  0x00007ffff685755b in __GI_abort () at abort.c:79
  #2  0x00007ffff685742f in __assert_fail_base (fmt=3D0x7ffff69bdb48 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3D0x555557f691e0 <str> "ba=
state->cur_idx < MAX_PS_BUFFERS", file=3D0x555557f5a080 <str> "/home/alxndr=
/Development/qemu/hw/net/e1000e_core.c", line=3D0x590, function=3D<optimize=
d out>) at assert.c:92
  #3  0x00007ffff6866092 in __GI___assert_fail (assertion=3D0x555557f691e0 =
<str> "bastate->cur_idx < MAX_PS_BUFFERS", file=3D0x555557f5a080 <str> "/ho=
me/alxndr/Development/qemu/hw/net/e1000e_core.c", line=3D0x590, function=3D=
0x555557f69240 <__PRETTY_FUNCTION__.e1000e_write_to_rx_buffers> "void e1000=
e_write_to_rx_buffers(E1000ECore *, hwaddr (*)[4], e1000e_ba_state *, const=
 char *, dma_addr_t)") at assert.c:101
  #4  0x0000555556f8fbcd in e1000e_write_to_rx_buffers (core=3D0x7fffee07c4=
e0, ba=3D0x7fffffff8860, bastate=3D0x7fffffff88a0, data=3D0x7fffe61b8021 ""=
, data_len=3D0x2000) at /home/alxndr/Development/qemu/hw/net/e1000e_core.c:=
1424
  #5  0x0000555556f82f14 in e1000e_write_packet_to_guest (core=3D0x7fffee07=
c4e0, pkt=3D0x61100004b900, rxr=3D0x7fffffff8d10, rss_info=3D0x7fffffff8d30=
) at /home/alxndr/Development/qemu/hw/net/e1000e_core.c:1582
  #6  0x0000555556f80960 in e1000e_receive_iov (core=3D0x7fffee07c4e0, iov=
=3D0x61900004e780, iovcnt=3D0x4) at /home/alxndr/Development/qemu/hw/net/e1=
000e_core.c:1709
  #7  0x0000555556f7d457 in e1000e_nc_receive_iov (nc=3D0x614000007460, iov=
=3D0x61900004e780, iovcnt=3D0x4) at /home/alxndr/Development/qemu/hw/net/e1=
000e.c:213
  #8  0x0000555556f64738 in net_tx_pkt_sendv (pkt=3D0x631000028800, nc=3D0x=
614000007460, iov=3D0x61900004e780, iov_cnt=3D0x4) at /home/alxndr/Developm=
ent/qemu/hw/net/net_tx_pkt.c:544
  #9  0x0000555556f63f0e in net_tx_pkt_send (pkt=3D0x631000028800, nc=3D0x6=
14000007460) at /home/alxndr/Development/qemu/hw/net/net_tx_pkt.c:620
  #10 0x0000555556f650e5 in net_tx_pkt_send_loopback (pkt=3D0x631000028800,=
 nc=3D0x614000007460) at /home/alxndr/Development/qemu/hw/net/net_tx_pkt.c:=
633
  #11 0x0000555556fb026a in e1000e_tx_pkt_send (core=3D0x7fffee07c4e0, tx=
=3D0x7fffee09c748, queue_index=3D0x0) at /home/alxndr/Development/qemu/hw/n=
et/e1000e_core.c:664
  #12 0x0000555556faebf6 in e1000e_process_tx_desc (core=3D0x7fffee07c4e0, =
tx=3D0x7fffee09c748, dp=3D0x7fffffff9520, queue_index=3D0x0) at /home/alxnd=
r/Development/qemu/hw/net/e1000e_core.c:743
  #13 0x0000555556fadfa8 in e1000e_start_xmit (core=3D0x7fffee07c4e0, txr=
=3D0x7fffffff9720) at /home/alxndr/Development/qemu/hw/net/e1000e_core.c:934
  #14 0x0000555556fa308b in e1000e_set_tdt (core=3D0x7fffee07c4e0, index=3D=
0xe06, val=3D0x563) at /home/alxndr/Development/qemu/hw/net/e1000e_core.c:2=
451
  #15 0x0000555556f84d7e in e1000e_core_write (core=3D0x7fffee07c4e0, addr=
=3D0x438, val=3D0x563, size=3D0x4) at /home/alxndr/Development/qemu/hw/net/=
e1000e_core.c:3261
  #16 0x0000555556f79497 in e1000e_mmio_write (opaque=3D0x7fffee079800, add=
r=3D0x438, val=3D0x563, size=3D0x4) at /home/alxndr/Development/qemu/hw/net=
/e1000e.c:109
  #17 0x00005555564938b5 in memory_region_write_accessor (mr=3D0x7fffee07c1=
10, addr=3D0x438, value=3D0x7fffffff9d90, size=3D0x4, shift=3D0x0, mask=3D0=
xffffffff, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:483
  #18 0x000055555649328a in access_with_adjusted_size (addr=3D0x438, value=
=3D0x7fffffff9d90, size=3D0x2, access_size_min=3D0x4, access_size_max=3D0x4=
, access_fn=3D0x555556493360 <memory_region_write_accessor>, mr=3D0x7fffee0=
7c110, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:544
  #19 0x0000555556491df6 in memory_region_dispatch_write (mr=3D0x7fffee07c1=
10, addr=3D0x438, data=3D0x563, op=3DMO_16, attrs=3D...) at /home/alxndr/De=
velopment/qemu/memory.c:1476
  #20 0x00005555562cbbf4 in flatview_write_continue (fv=3D0x606000037820, a=
ddr=3D0xe1020438, attrs=3D..., ptr=3D0x61900009ba80, len=3D0x2, addr1=3D0x4=
38, l=3D0x2, mr=3D0x7fffee07c110) at /home/alxndr/Development/qemu/exec.c:3=
137
  #21 0x00005555562bbad9 in flatview_write (fv=3D0x606000037820, addr=3D0xe=
1020023, attrs=3D..., buf=3D0x61900009ba80, len=3D0x417) at /home/alxndr/De=
velopment/qemu/exec.c:3177
  #22 0x00005555562bb609 in address_space_write (as=3D0x6080000027a0, addr=
=3D0xe1020023, attrs=3D..., buf=3D0x61900009ba80, len=3D0x417) at /home/alx=
ndr/Development/qemu/exec.c:3268
  #23 0x0000555556488c07 in qtest_process_command (chr=3D0x555559691d00 <qt=
est_chr>, words=3D0x60400001e210) at /home/alxndr/Development/qemu/qtest.c:=
567
  #24 0x000055555647f187 in qtest_process_inbuf (chr=3D0x555559691d00 <qtes=
t_chr>, inbuf=3D0x61900000f680) at /home/alxndr/Development/qemu/qtest.c:710
  #25 0x000055555647e8b4 in qtest_read (opaque=3D0x555559691d00 <qtest_chr>=
, buf=3D0x7fffffffc9e0 "e2d1b0002e10000000006ff4d055e2d1b0002e10000000006ff=
4f055e2d1b0002e10000000006ff51055e2d1b0002e10000000006ff53055e2d1b0002e1000=
0000006ff55055e2d1b0002e10000000006ff57055e2d1b0002e10000000006ff59055e2d1b=
0002e10000000006ff5b055e2d1b0002e10000000006ff5d055e2d1b0002e10000000006ff5=
f055e2d1b0002e10000000006ff61055e2d1b0002e10000000006ff6305\n-M pc-q35-5.0 =
 -device sdhci-pci,sd-spec-version=3D3 -device sd-card,drive=3Dmydrive -dri=
ve if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydrive -nographic=
 -nographic\n002e10000000006ff27055e2d1b0002e10000000006ff29055e2d1b0002e10=
000000006ff2b055e2d1b0002e10000000006ff2d055e2d1b0002e10000000006ff2f055e2d=
1b0002e10000000006ff31055e2d1b0002e10000000006ff33055e2d1b0002e10000000006f=
f35055e2d1b0002e10000000006ff37055e2d1b0002e10000000006ff39055e2d1b0002e100=
00000006ff3b055e2d1b0002e10000000006ff3d055e2d1b0002e10000000006ff3f055e2d1=
b0002e10000000006ff41055e2d1b0002e10000000006ff43055e2d1b0002e10000000006ff=
45055e2d1b0002e10000000006ff47055e2d1b0002e10000000006ff49055e2d1b0002e1000=
0000006ff4b055\360U", size=3D0x1f2) at /home/alxndr/Development/qemu/qtest.=
c:722
  #26 0x00005555579c260c in qemu_chr_be_write_impl (s=3D0x60f000001d50, buf=
=3D0x7fffffffc9e0 "e2d1b0002e10000000006ff4d055e2d1b0002e10000000006ff4f055=
e2d1b0002e10000000006ff51055e2d1b0002e10000000006ff53055e2d1b0002e100000000=
06ff55055e2d1b0002e10000000006ff57055e2d1b0002e10000000006ff59055e2d1b0002e=
10000000006ff5b055e2d1b0002e10000000006ff5d055e2d1b0002e10000000006ff5f055e=
2d1b0002e10000000006ff61055e2d1b0002e10000000006ff6305\n-M pc-q35-5.0  -dev=
ice sdhci-pci,sd-spec-version=3D3 -device sd-card,drive=3Dmydrive -drive if=
=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydrive -nographic -nog=
raphic\n002e10000000006ff27055e2d1b0002e10000000006ff29055e2d1b0002e1000000=
0006ff2b055e2d1b0002e10000000006ff2d055e2d1b0002e10000000006ff2f055e2d1b000=
2e10000000006ff31055e2d1b0002e10000000006ff33055e2d1b0002e10000000006ff3505=
5e2d1b0002e10000000006ff37055e2d1b0002e10000000006ff39055e2d1b0002e10000000=
006ff3b055e2d1b0002e10000000006ff3d055e2d1b0002e10000000006ff3f055e2d1b0002=
e10000000006ff41055e2d1b0002e10000000006ff43055e2d1b0002e10000000006ff45055=
e2d1b0002e10000000006ff47055e2d1b0002e10000000006ff49055e2d1b0002e100000000=
06ff4b055\360U", len=3D0x1f2) at /home/alxndr/Development/qemu/chardev/char=
.c:183
  #27 0x00005555579c275b in qemu_chr_be_write (s=3D0x60f000001d50, buf=3D0x=
7fffffffc9e0 "e2d1b0002e10000000006ff4d055e2d1b0002e10000000006ff4f055e2d1b=
0002e10000000006ff51055e2d1b0002e10000000006ff53055e2d1b0002e10000000006ff5=
5055e2d1b0002e10000000006ff57055e2d1b0002e10000000006ff59055e2d1b0002e10000=
000006ff5b055e2d1b0002e10000000006ff5d055e2d1b0002e10000000006ff5f055e2d1b0=
002e10000000006ff61055e2d1b0002e10000000006ff6305\n-M pc-q35-5.0  -device s=
dhci-pci,sd-spec-version=3D3 -device sd-card,drive=3Dmydrive -drive if=3Dsd=
,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydrive -nographic -nographi=
c\n002e10000000006ff27055e2d1b0002e10000000006ff29055e2d1b0002e10000000006f=
f2b055e2d1b0002e10000000006ff2d055e2d1b0002e10000000006ff2f055e2d1b0002e100=
00000006ff31055e2d1b0002e10000000006ff33055e2d1b0002e10000000006ff35055e2d1=
b0002e10000000006ff37055e2d1b0002e10000000006ff39055e2d1b0002e10000000006ff=
3b055e2d1b0002e10000000006ff3d055e2d1b0002e10000000006ff3f055e2d1b0002e1000=
0000006ff41055e2d1b0002e10000000006ff43055e2d1b0002e10000000006ff45055e2d1b=
0002e10000000006ff47055e2d1b0002e10000000006ff49055e2d1b0002e10000000006ff4=
b055\360U", len=3D0x1f2) at /home/alxndr/Development/qemu/chardev/char.c:195
  #28 0x00005555579cb97a in fd_chr_read (chan=3D0x6080000026a0, cond=3DG_IO=
_IN, opaque=3D0x60f000001d50) at /home/alxndr/Development/qemu/chardev/char=
-fd.c:68
  #29 0x0000555557a530ea in qio_channel_fd_source_dispatch (source=3D0x60c0=
0002b780, callback=3D0x5555579cb540 <fd_chr_read>, user_data=3D0x60f000001d=
50) at /home/alxndr/Development/qemu/io/channel-watch.c:84
  #30 0x00007ffff7ca8898 in g_main_context_dispatch () at /usr/lib/x86_64-l=
inux-gnu/libglib-2.0.so.0
  #31 0x0000555557c10b85 in glib_pollfds_poll () at /home/alxndr/Developmen=
t/qemu/util/main-loop.c:219
  #32 0x0000555557c0f57e in os_host_main_loop_wait (timeout=3D0x39c63cc8) a=
t /home/alxndr/Development/qemu/util/main-loop.c:242
  #33 0x0000555557c0f177 in main_loop_wait (nonblocking=3D0x0) at /home/alx=
ndr/Development/qemu/util/main-loop.c:518
  #34 0x000055555689fd1e in qemu_main_loop () at /home/alxndr/Development/q=
emu/softmmu/vl.c:1664
  #35 0x0000555557a6a29d in main (argc=3D0x13, argv=3D0x7fffffffe0e8, envp=
=3D0x7fffffffe188) at /home/alxndr/Development/qemu/softmmu/main.c:49

  =

  I can reproduce this in qemu 5.0 using these qtest commands:

  cat << EOF | ./qemu-system-i386 \
  -qtest stdio -nographic -monitor none -serial none \
  -M pc-q35-5.0
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe1020000
  outl 0xcf8 0x80001014
  outl 0xcf8 0x80001004
  outw 0xcfc 0x7
  outl 0xcf8 0x800010a2
  write 0xe1020618 0x14 0x0000d0ff2d05575f215e1b0000000000d0ff2d05
  write 0x27 0x800c 0x08004500feffffff00007b06f
  write 0x1b8006 0x8001 0x2f0
  write 0xe1020023 0x417 0x0002e10000000006ffcf055e2d1b0002e10000000006ffd1=
055e2d1b0002e10000000006ffd3055e2d1b0002e10000000006ffd5055e2d1b0002e100000=
00006ffd7055e2d1b0002e10000000006ffd9055e2d1b0002e10000000006ffdb055e2d1b00=
02e10000000006ffdd055e2d1b0002e10000000006ffdf055e2d1b0002e10000000006ffe10=
55e2d1b0002e10000000006ffe3055e2d1b0002e10000000006ffe5055e2d1b0002e1000000=
0006ffe7055e2d1b0002e10000000006ffe9055e2d1b0002e10000000006ffeb055e2d1b000=
2e10000000006ffed055e2d1b0002e10000000006ffef055e2d1b0002e10000000006fff105=
5e2d1b0002e10000000006fff3055e2d1b0002e10000000006fff5055e2d1b0002e10000000=
006fff7055e2d1b0002e10000000006fff9055e2d1b0002e10000000006fffb055e2d1b0002=
e10000000006fffd055e2d1b0002e10000000006ffff055e2d1b0002e10000000006ff01055=
e2d1b0002e10000000006ff03055e2d1b0002e10000000006ff05055e2d1b0002e100000000=
06ff07055e2d1b0002e10000000006ff09055e2d1b0002e10000000006ff0b055e2d1b0002e=
10000000006ff0d055e2d1b0002e10000000006ff0f055e2d1b0002e10000000006ff11055e=
2d1b0002e10000000006ff13055e2d1b0002e10000000006ff15055e2d1b0002e1000000000=
6ff17055e2d1b0002e10000000006ff19055e2d1b0002e10000000006ff1b055e2d1b0002e1=
0000000006ff1d055e2d1b0002e10000000006ff1f055e2d1b0002e10000000006ff21055e2=
d1b0002e10000000006ff23055e2d1b0002e10000000006ff25055e2d1b0002e10000000006=
ff27055e2d1b0002e10000000006ff29055e2d1b0002e10000000006ff2b055e2d1b0002e10=
000000006ff2d055e2d1b0002e10000000006ff2f055e2d1b0002e10000000006ff31055e2d=
1b0002e10000000006ff33055e2d1b0002e10000000006ff35055e2d1b0002e10000000006f=
f37055e2d1b0002e10000000006ff39055e2d1b0002e10000000006ff3b055e2d1b0002e100=
00000006ff3d055e2d1b0002e10000000006ff3f055e2d1b0002e10000000006ff41055e2d1=
b0002e10000000006ff43055e2d1b0002e10000000006ff45055e2d1b0002e10000000006ff=
47055e2d1b0002e10000000006ff49055e2d1b0002e10000000006ff4b055e2d1b0002e1000=
0000006ff4d055e2d1b0002e10000000006ff4f055e2d1b0002e10000000006ff51055e2d1b=
0002e10000000006ff53055e2d1b0002e10000000006ff55055e2d1b0002e10000000006ff5=
7055e2d1b0002e10000000006ff59055e2d1b0002e10000000006ff5b055e2d1b0002e10000=
000006ff5d055e2d1b0002e10000000006ff5f055e2d1b0002e10000000006ff61055e2d1b0=
002e10000000006ff6305
  EOF

  Also attaching them to this report, in case they are formatted incorrectl=
y:
  ./qemu-system-i386 \
  -qtest stdio -nographic -monitor none -serial none \
  -M pc-q35-5.0 < attachment

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878651/+subscriptions

