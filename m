Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88981388073
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:22:01 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5I0-0000jz-Ji
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lj5Gl-0008Do-P7
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:20:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:52808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lj5Gj-0008Fh-MB
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:20:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lj5Gg-00004y-Bt
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 19:20:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 58F4E2E813A
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 19:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 May 2021 19:11:29 -0000
From: John Snow <1917442@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=jsnow@redhat.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: samuel-thibault th-huth zamaudio
X-Launchpad-Bug-Reporter: Damien Zammit (zamaudio)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <161468357129.13457.5152619588582197595.malonedeb@chaenomeles.canonical.com>
Message-Id: <162136508966.7565.18377673029558145422.launchpad@gac.canonical.com>
Subject: [Bug 1917442] Re: [AHCI] crash when running a GNU/Hurd guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 4f5734e2229afdeb38b5b7edf2722369a8c46c80
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
Reply-To: Bug 1917442 <1917442@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
     Assignee: (unassigned) =3D> John Snow (jnsnow)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1917442

Title:
  [AHCI] crash when running a GNU/Hurd guest

Status in QEMU:
  Incomplete

Bug description:
  QEMU git hash =3D 51db2d7cf2

  Running guest OS using:

  $ gdb --args /extra/qemu/bin/qemu-system-i386 -M q35,accel=3Dkvm -m 4096
  -net user,hostfwd=3Dtcp::8888-:22 -net nic -drive
  id=3Dudisk,file=3D/dev/sdd,format=3Draw,if=3Dnone -device ide-
  drive,drive=3Dudisk,bootindex=3D1 -curses

  ...

  root@zamhurd:~# .ahcisata0 channel 5: setting WDCTL_RST failed for
  drive 0

  =

  Thread 1 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
                                                                         [S=
witching to Thread 0x7ffff4f7bf00 (LWP 590666)]
  ahci_commit_buf (dma=3D0x555557335870, tx_bytes=3D2048) at ../hw/ide/ahci=
.c:1462
  1462        tx_bytes +=3D le32_to_cpu(ad->cur_cmd->status);
  (gdb) bt full
  #0  ahci_commit_buf (dma=3D0x555557335870, tx_bytes=3D2048)
      at ../hw/ide/ahci.c:1462
          ad =3D 0x555557335870
  #1  0x0000555555893171 in dma_buf_commit (s=3D0x555557335930, tx_bytes=3D=
2048)
      at ../hw/ide/core.c:805
  #2  0x00005555558934f8 in ide_dma_cb (opaque=3D0x555557335930, ret=3D0)
      at ../hw/ide/core.c:887
          s =3D 0x555557335930
          n =3D 4
          sector_num =3D 4491160
          offset =3D 140732794753312
          stay_active =3D false
          prep_size =3D 0
          __PRETTY_FUNCTION__ =3D "ide_dma_cb"
  #3  0x0000555555830720 in dma_complete (dbs=3D0x7ffee83d5120, ret=3D0)
      at ../softmmu/dma-helpers.c:121
          __PRETTY_FUNCTION__ =3D "dma_complete"
  #4  0x00005555558307cd in dma_blk_cb (opaque=3D0x7ffee83d5120, ret=3D0)
      at ../softmmu/dma-helpers.c:139
          dbs =3D 0x7ffee83d5120
          cur_addr =3D 140732794753408
          cur_len =3D 93825013280880
          mem =3D 0x7ffeeccfef00
          __PRETTY_FUNCTION__ =3D "dma_blk_cb"
  #5  0x0000555555d92bce in blk_aio_complete (acb=3D0x7ffee847bbe0)
      at ../block/block-backend.c:1412
  #6  0x0000555555d92df0 in blk_aio_read_entry (opaque=3D0x7ffee847bbe0)
      at ../block/block-backend.c:1466
          acb =3D 0x7ffee847bbe0
          rwco =3D 0x7ffee847bc08
          qiov =3D 0x7ffee83d5180
          __PRETTY_FUNCTION__ =3D "blk_aio_read_entry"
  #7  0x0000555555e85580 in coroutine_trampoline (i0=3D-398117056, i1=3D327=
66)
      at ../util/coroutine-ucontext.c:173
          arg =3D {p =3D 0x7ffee8453740, i =3D {-398117056, 32766}}
          self =3D 0x7ffee8453740
          co =3D 0x7ffee8453740
          fake_stack_save =3D 0x0
  #8  0x00007ffff6544020 in __start_context () at /lib64/libc.so.6
  #9  0x00007ffeefdfd680 in  ()
  #10 0x0000000000000000 in  ()
  (gdb)
  (gdb) l
  1457	 */
  1458	static void ahci_commit_buf(const IDEDMA *dma, uint32_t tx_bytes)
  1459	{
  1460	    AHCIDevice *ad =3D DO_UPCAST(AHCIDevice, dma, dma);
  1461	=

  1462	    tx_bytes +=3D le32_to_cpu(ad->cur_cmd->status);
  1463	    ad->cur_cmd->status =3D cpu_to_le32(tx_bytes);
  1464	}
  1465	=

  1466	static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
  (gdb) p ad
  $1 =3D (AHCIDevice *) 0x555557335870
  (gdb) p ad->cur_cmd
  $2 =3D (AHCICmdHdr *) 0x0
  (gdb)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1917442/+subscriptions

