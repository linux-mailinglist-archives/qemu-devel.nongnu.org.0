Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818C3386D3C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 00:51:55 +0200 (CEST)
Received: from localhost ([::1]:59846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lim5a-0001Z3-EI
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 18:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lim4P-0000rW-P2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 18:50:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lim4K-0002Bp-BS
 for qemu-devel@nongnu.org; Mon, 17 May 2021 18:50:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lim4I-0000jy-5M
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 22:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 070272E8186
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 22:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 May 2021 22:42:25 -0000
From: John Snow <1912780@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=High;
 assignee=None; 
X-Launchpad-Bug-Tags: cve security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: jnsnow pjps
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <161131902674.28690.10783050287084462937.malonedeb@soybean.canonical.com>
Message-Id: <162129134515.7898.2239386219237977751.malone@gac.canonical.com>
Subject: [Bug 1912780] Re: QEMU: Null Pointer Failure in fdctrl_read() in
 hw/block/fdc.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: f529f38d4fbde20c4ead9a889124d725ef7c961c
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
Reply-To: Bug 1912780 <1912780@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Took a look at the patch today, I think it might need a change or two
but it should be quick to do. I've asked Thomas to move this issue to
gitlab so I can keep a closer eye on it.

--js

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912780

Title:
  QEMU: Null Pointer Failure in fdctrl_read() in hw/block/fdc.c

Status in QEMU:
  In Progress

Bug description:
  [via qemu-security list]

  This is Gaoning Pan from Zhejiang University & Ant Security Light-Year La=
b.
  I found a Null Pointer issue locates in fdctrl_read() in  hw/block/fdc.c.
  This flaw allows a malicious guest user or process in a denial of service=
 condition.

  This issus was discovered in the latest Qemu-5.2.0. When using floppy dev=
ice, there are several
  choices to get specific drive in get_drv(), depending on fdctrl->cur_drv.=
 But not all drives are
  initialized properly, leaving fdctrl->drives[0]->blk as NULL. So when the=
 drive was used in
  blk_pread(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo, BDRV_SECTOR_SIZ=
E) at line 1918,
  null pointer access triggers, thus denial of service.My reproduced enviro=
nment is as follows:

      Host: ubuntu 18.04
      Guest: ubuntu 18.04

  My boot command is as follows:

    qemu-system-x86_64 -enable-kvm -boot c -m 2G -drive format=3Dqcow2,file=
=3D./ubuntu.img \
     -nic user,hostfwd=3Dtcp:0.0.0.0:5555-:22 -device floppy,unit=3D1,drive=
=3Dmydrive \
     -drive id=3Dmydrive,file=3Dnull-co://,size=3D2M,format=3Draw,if=3Dnone=
 -display none

  ASAN output is as follows:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D14688=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x00000=
000034c (pc 0x5636eee9bbaf bp 0x7ff2a53fdea0 sp 0x7ff2a53fde90 T3)
  =3D=3D14688=3D=3DThe signal is caused by a WRITE memory access.
  =3D=3D14688=3D=3DHint: address points to the zero page.
      #0 0x5636eee9bbae in blk_inc_in_flight ../block/block-backend.c:1356
      #1 0x5636eee9b766 in blk_prw ../block/block-backend.c:1328
      #2 0x5636eee9cd76 in blk_pread ../block/block-backend.c:1491
      #3 0x5636ee1adf24 in fdctrl_read_data ../hw/block/fdc.c:1918
      #4 0x5636ee1a6654 in fdctrl_read ../hw/block/fdc.c:935
      #5 0x5636eebb84c8 in portio_read ../softmmu/ioport.c:179
      #6 0x5636ee9848c5 in memory_region_read_accessor ../softmmu/memory.c:=
442
      #7 0x5636ee9855c2 in access_with_adjusted_size ../softmmu/memory.c:552
      #8 0x5636ee98f0b7 in memory_region_dispatch_read1 ../softmmu/memory.c=
:1420
      #9 0x5636ee98f311 in memory_region_dispatch_read ../softmmu/memory.c:=
1449
      #10 0x5636ee8ff64a in flatview_read_continue ../softmmu/physmem.c:2822
      #11 0x5636ee8ff9e5 in flatview_read ../softmmu/physmem.c:2862
      #12 0x5636ee8ffb83 in address_space_read_full ../softmmu/physmem.c:28=
75
      #13 0x5636ee8ffdeb in address_space_rw ../softmmu/physmem.c:2903
      #14 0x5636eea6a924 in kvm_handle_io ../accel/kvm/kvm-all.c:2285
      #15 0x5636eea6c5e3 in kvm_cpu_exec ../accel/kvm/kvm-all.c:2531
      #16 0x5636eeca492b in kvm_vcpu_thread_fn ../accel/kvm/kvm-cpus.c:49
      #17 0x5636ef1bc296 in qemu_thread_start ../util/qemu-thread-posix.c:5=
21
      #18 0x7ff337c736da in start_thread (/lib/x86_64-linux-gnu/libpthread.=
so.0+0x76da)
      #19 0x7ff33799ca3e in __clone (/lib/x86_64-linux-gnu/libc.so.6+0x121a=
3e)

  AddressSanitizer can not provide additional info.
  SUMMARY: AddressSanitizer: SEGV ../block/block-backend.c:1356 in blk_inc_=
in_flight
  Thread T3 created by T0 here:
      #0 0x7ff33c580d2f in __interceptor_pthread_create (/usr/lib/x86_64-li=
nux-gnu/libasan.so.4+0x37d2f)
      #1 0x5636ef1bc673 in qemu_thread_create ../util/qemu-thread-posix.c:5=
58
      #2 0x5636eeca4ce7 in kvm_start_vcpu_thread ../accel/kvm/kvm-cpus.c:73
      #3 0x5636ee9aa965 in qemu_init_vcpu ../softmmu/cpus.c:622
      #4 0x5636ee82a9b4 in x86_cpu_realizefn ../target/i386/cpu.c:6731
      #5 0x5636eed002f4 in device_set_realized ../hw/core/qdev.c:886
      #6 0x5636eecc59bc in property_set_bool ../qom/object.c:2251
      #7 0x5636eecc0c28 in object_property_set ../qom/object.c:1398
      #8 0x5636eecb6fb9 in object_property_set_qobject ../qom/qom-qobject.c=
:28
      #9 0x5636eecc1175 in object_property_set_bool ../qom/object.c:1465
      #10 0x5636eecfc286 in qdev_realize ../hw/core/qdev.c:399
      #11 0x5636ee739b34 in x86_cpu_new ../hw/i386/x86.c:111
      #12 0x5636ee739d6d in x86_cpus_init ../hw/i386/x86.c:138
      #13 0x5636ee6f843e in pc_init1 ../hw/i386/pc_piix.c:159
      #14 0x5636ee6fab1e in pc_init_v5_2 ../hw/i386/pc_piix.c:438
      #15 0x5636ee1cb4a7 in machine_run_board_init ../hw/core/machine.c:1134
      #16 0x5636ee9c323d in qemu_init ../softmmu/vl.c:4369
      #17 0x5636edd92c71 in main ../softmmu/main.c:49
      #18 0x7ff33789cb96 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x21b96)

  =3D=3D14688=3D=3DABORTING

  Reproducer is attached.

  Best regards.
  Gaoning Pan of Zhejiang University & Ant Security Light-Year Lab

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912780/+subscriptions

