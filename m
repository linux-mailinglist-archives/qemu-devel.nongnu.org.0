Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF33C9C74
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 12:11:55 +0200 (CEST)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3yLS-0007Ls-3u
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 06:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3yKX-0006gq-Q7
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:10:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:40052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m3yKT-0007pm-Mp
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 06:10:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m3yKQ-0004kp-UV
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 10:10:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E46692E8169
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 10:10:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jul 2021 10:02:20 -0000
From: Thomas Huth <1878641@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158947155555.22318.7487906636720013107.malonedeb@wampee.canonical.com>
Message-Id: <162634334027.27945.12810509299466272818.malone@wampee.canonical.com>
Subject: [Bug 1878641] Re: Abort() in mch_update_pciexbar
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: e83e101afa7089ca86ff77d0c023d959f735a19c
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1878641 <1878641@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix has been included here:
https://gitlab.com/qemu-project/qemu/-/commit/9b0ca75e0196a725232

** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878641

Title:
  Abort() in mch_update_pciexbar

Status in QEMU:
  Fix Committed

Bug description:
  Hello,
  I found an input which triggers an abort() in mch_update_pciexbar:

  #0  0x00007ffff686d761 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdep=
s/unix/sysv/linux/raise.c:50
  #1  0x00007ffff685755b in __GI_abort () at abort.c:79
  #2  0x000055555705c7ae in mch_update_pciexbar (mch=3D0x629000005920) at /=
home/alxndr/Development/qemu/hw/pci-host/q35.c:324
  #3  0x000055555705bb6a in mch_write_config (d=3D0x629000005920, address=
=3D0x60, val=3D0x8400056e, len=3D0x4) at /home/alxndr/Development/qemu/hw/p=
ci-host/q35.c:480
  #4  0x00005555570954fb in pci_host_config_write_common (pci_dev=3D0x62900=
0005920, addr=3D0x60, limit=3D0x100, val=3D0x8400056e, len=3D0x4) at /home/=
alxndr/Development/qemu/hw/pci/pci_host.c:81
  #5  0x000055555709606e in pci_data_write (s=3D0x61d000096080, addr=3D0xf2=
000060, val=3D0x8400056e, len=3D0x4) at /home/alxndr/Development/qemu/hw/pc=
i/pci_host.c:118
  #6  0x00005555570967d0 in pci_host_data_write (opaque=3D0x629000005200, a=
ddr=3D0x0, val=3D0x8400056e, len=3D0x4) at /home/alxndr/Development/qemu/hw=
/pci/pci_host.c:165
  #7  0x00005555564938b5 in memory_region_write_accessor (mr=3D0x6290000056=
10, addr=3D0x0, value=3D0x7fffffff9c70, size=3D0x4, shift=3D0x0, mask=3D0xf=
fffffff, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:483
  #8  0x000055555649328a in access_with_adjusted_size (addr=3D0x0, value=3D=
0x7fffffff9c70, size=3D0x4, access_size_min=3D0x1, access_size_max=3D0x4, a=
ccess_fn=3D0x555556493360 <memory_region_write_accessor>, mr=3D0x6290000056=
10, attrs=3D...) at /home/alxndr/Development/qemu/memory.c:544
  #9  0x0000555556491df6 in memory_region_dispatch_write (mr=3D0x6290000056=
10, addr=3D0x0, data=3D0x8400056e, op=3DMO_32, attrs=3D...) at /home/alxndr=
/Development/qemu/memory.c:1476
  #10 0x00005555562cbbf4 in flatview_write_continue (fv=3D0x606000033b00, a=
ddr=3D0xcfc, attrs=3D..., ptr=3D0x7fffffffa4e0, len=3D0x4, addr1=3D0x0, l=
=3D0x4, mr=3D0x629000005610) at /home/alxndr/Development/qemu/exec.c:3137
  #11 0x00005555562bbad9 in flatview_write (fv=3D0x606000033b00, addr=3D0xc=
fc, attrs=3D..., buf=3D0x7fffffffa4e0, len=3D0x4) at /home/alxndr/Developme=
nt/qemu/exec.c:3177
  #12 0x00005555562bb609 in address_space_write (as=3D0x55555968f940 <addre=
ss_space_io>, addr=3D0xcfc, attrs=3D..., buf=3D0x7fffffffa4e0, len=3D0x4) a=
t /home/alxndr/Development/qemu/exec.c:3268
  #13 0x0000555556478c0a in cpu_outl (addr=3D0xcfc, val=3D0x8400056e) at /h=
ome/alxndr/Development/qemu/ioport.c:80
  #14 0x000055555648166f in qtest_process_command (chr=3D0x555559691d00 <qt=
est_chr>, words=3D0x60300009ebf0) at /home/alxndr/Development/qemu/qtest.c:=
396
  #15 0x000055555647f187 in qtest_process_inbuf (chr=3D0x555559691d00 <qtes=
t_chr>, inbuf=3D0x61900000f680) at /home/alxndr/Development/qemu/qtest.c:710
  #16 0x000055555647e8b4 in qtest_read (opaque=3D0x555559691d00 <qtest_chr>=
, buf=3D0x7fffffffca40 "outl 0xcf8 0xf2000060\noutl 0xcfc 0x8400056e\n-M pc=
-q35-5.0 -device intel-hda,id=3Dhda0 -device hda-output,bus=3Dhda0.0 -devic=
e hda-micro,bus=3Dhda0.0 -device hda-duplex,bus=3Dhda0.0 -display none -nod=
efaults -nographic\n\377\377\377\177", size=3D0xd2) at /home/alxndr/Develop=
ment/qemu/qtest.c:722
  #17 0x00005555579c260c in qemu_chr_be_write_impl (s=3D0x60f000001f30, buf=
=3D0x7fffffffca40 "outl 0xcf8 0xf2000060\noutl 0xcfc 0x8400056e\n-M pc-q35-=
5.0 -device intel-hda,id=3Dhda0 -device hda-output,bus=3Dhda0.0 -device hda=
-micro,bus=3Dhda0.0 -device hda-duplex,bus=3Dhda0.0 -display none -nodefaul=
ts -nographic\n\377\377\377\177", len=3D0xd2) at /home/alxndr/Development/q=
emu/chardev/char.c:183
  #18 0x00005555579c275b in qemu_chr_be_write (s=3D0x60f000001f30, buf=3D0x=
7fffffffca40 "outl 0xcf8 0xf2000060\noutl 0xcfc 0x8400056e\n-M pc-q35-5.0 -=
device intel-hda,id=3Dhda0 -device hda-output,bus=3Dhda0.0 -device hda-micr=
o,bus=3Dhda0.0 -device hda-duplex,bus=3Dhda0.0 -display none -nodefaults -n=
ographic\n\377\377\377\177", len=3D0xd2) at /home/alxndr/Development/qemu/c=
hardev/char.c:195
  #19 0x00005555579cb97a in fd_chr_read (chan=3D0x6080000026a0, cond=3DG_IO=
_IN, opaque=3D0x60f000001f30) at /home/alxndr/Development/qemu/chardev/char=
-fd.c:68
  #20 0x0000555557a530ea in qio_channel_fd_source_dispatch (source=3D0x60c0=
0002ef00, callback=3D0x5555579cb540 <fd_chr_read>, user_data=3D0x60f000001f=
30) at /home/alxndr/Development/qemu/io/channel-watch.c:84
  #21 0x00007ffff7ca8898 in g_main_context_dispatch () at /usr/lib/x86_64-l=
inux-gnu/libglib-2.0.so.0
  #22 0x0000555557c10b85 in glib_pollfds_poll () at /home/alxndr/Developmen=
t/qemu/util/main-loop.c:219
  #23 0x0000555557c0f57e in os_host_main_loop_wait (timeout=3D0x0) at /home=
/alxndr/Development/qemu/util/main-loop.c:242
  #24 0x0000555557c0f177 in main_loop_wait (nonblocking=3D0x0) at /home/alx=
ndr/Development/qemu/util/main-loop.c:518
  #25 0x000055555689fd1e in qemu_main_loop () at /home/alxndr/Development/q=
emu/softmmu/vl.c:1664
  #26 0x0000555557a6a29d in main (argc=3D0x17, argv=3D0x7fffffffe148, envp=
=3D0x7fffffffe208) at /home/alxndr/Development/qemu/softmmu/main.c:49

 =20
  I can reproduce this in qemu 5.0 built using these qtest commands:

  cat << EOF | ./qemu-system-i386 \
  -qtest stdio -nographic -monitor none -serial none \
  -M pc-q35-5.0
  outl 0xcf8 0xf2000060
  outl 0xcfc 0x8400056e
  EOF

  Please let me know if I can provide any further info.
  -Alex

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878641/+subscriptions


