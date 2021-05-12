Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51F937BC1C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:57:22 +0200 (CEST)
Received: from localhost ([::1]:35346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgnUP-0001Xr-Vy
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnSo-0000DE-On
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:40776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnSm-000194-Np
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:55:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgnSk-0000HF-Jh
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 72C6E2E8187
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:55:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 11:46:34 -0000
From: Thomas Huth <1908513@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cwmyung th-huth
X-Launchpad-Bug-Reporter: Cheolwoo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160820236991.15174.7743358668369837137.malonedeb@soybean.canonical.com>
Message-Id: <162081999492.22508.9746129159173216303.malone@soybean.canonical.com>
Subject: [Bug 1908513] Re: assertion failure in mptsas1068 emulator
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 85bb92ba4b969d9c03935dcdd21efd5591b5d8dd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1908513 <1908513@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This still triggers with the current version from git master, marking as
Confirmed

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908513

Title:
  assertion failure in mptsas1068 emulator

Status in QEMU:
  Confirmed

Bug description:
  Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
  mptsas1068 emulator.

  A malicious guest user/process could use this flaw to abort the QEMU
  process on the host, resulting in a denial of service.

  This was found in version 5.2.0 (master)

  =

  qemu-system-i386: ../hw/scsi/mptsas.c:968: void mptsas_interrupt_status_w=
rite(MPTSASState *): Assertion
  `s->intr_status & MPI_HIS_DOORBELL_INTERRUPT' failed.
  [1]    16951 abort (core dumped)  /home/cwmyung/prj/hyfuzz/src/qemu-5.2/b=
uild/qemu-system-i386 -m 512 -drive

  Program terminated with signal SIGABRT, Aborted.
  #0  __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/unix/sysv/linux/rais=
e.c:51
  51      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
  [Current thread is 1 (Thread 0x7fc7d6023700 (LWP 23475))]
  gdb-peda$ bt
  #0  0x00007fc7efa13f47 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdep=
s/unix/sysv/linux/raise.c:51
  #1  0x00007fc7efa158b1 in __GI_abort () at abort.c:79
  #2  0x00007fc7efa0542a in __assert_fail_base (fmt=3D0x7fc7efb8ca38 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\\n%n", assertion=3Dassertion@entry=3D0x564=
39214d593 "s->intr_status & MPI_HIS_DOORBELL_INTERRUPT", file=3Dfile@entry=
=3D0x56439214d4a7 "../hw/scsi/mptsas.c", line=3Dline@entry=3D0x3c8, functio=
n=3Dfunction@entry=3D0x56439214d81c "void mptsas_interrupt_status_write(MPT=
SASState *)") at assert.c:92
  #3  0x00007fc7efa054a2 in __GI___assert_fail (assertion=3D0x56439214d593 =
"s->intr_status & MPI_HIS_DOORBELL_INTERRUPT", file=3D0x56439214d4a7 "../hw=
/scsi/mptsas.c", line=3D0x3c8, function=3D0x56439214d81c "void mptsas_inter=
rupt_status_write(MPTSASState *)") at assert.c:101
  #4  0x0000564391a43963 in mptsas_interrupt_status_write (s=3D<optimized o=
ut>) at ../hw/scsi/mptsas.c:968
  #5  0x0000564391a43963 in mptsas_mmio_write (opaque=3D0x5643943dd5b0, add=
r=3D0x30, val=3D0x18000000, size=3D<optimized out>) at ../hw/scsi/mptsas.c:=
1052
  #6  0x0000564391e08798 in memory_region_write_accessor (mr=3D<optimized o=
ut>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out=
>, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...)
      at ../softmmu/memory.c:491
  #7  0x0000564391e0858e in access_with_adjusted_size (addr=3D<optimized ou=
t>, value=3D<optimized out>, size=3D<optimized out>, access_size_min=3D<opt=
imized out>, access_size_max=3D<optimized out>, access_fn=3D<optimized out>=
, mr=3D<optimized out>, attrs=3D...) at ../softmmu/memory.c:552
  #8  0x0000564391e0858e in memory_region_dispatch_write (mr=3D0x5643943dde=
a0, addr=3D<optimized out>, data=3D<optimized out>, op=3D<optimized out>, a=
ttrs=3D...) at ../softmmu/memory.c:1501
  #9  0x0000564391eff228 in io_writex (iotlbentry=3D<optimized out>, mmu_id=
x=3D<optimized out>, val=3D<optimized out>, addr=3D<optimized out>, retaddr=
=3D<optimized out>, op=3D<optimized out>, env=3D<optimized out>)
      at ../accel/tcg/cputlb.c:1378
  #10 0x0000564391eff228 in store_helper (env=3D<optimized out>, addr=3D<op=
timized out>, val=3D<optimized out>, oi=3D<optimized out>, retaddr=3D<optim=
ized out>, op=3DMO_32) at ../accel/tcg/cputlb.c:2397
  #11 0x0000564391eff228 in helper_le_stl_mmu (env=3D<optimized out>, addr=
=3D<optimized out>, val=3D0x2, oi=3D<optimized out>, retaddr=3D0x7fc78841b4=
01) at ../accel/tcg/cputlb.c:2463
  #12 0x00007fc78841b401 in code_gen_buffer ()
  #13 0x0000564391dd0da0 in cpu_tb_exec (cpu=3D0x56439363e650, itb=3D<optim=
ized out>) at ../accel/tcg/cpu-exec.c:178
  #14 0x0000564391dd19eb in cpu_loop_exec_tb (tb=3D<optimized out>, cpu=3D<=
optimized out>, last_tb=3D<optimized out>, tb_exit=3D<optimized out>) at ..=
/accel/tcg/cpu-exec.c:658
  #15 0x0000564391dd19eb in cpu_exec (cpu=3D0x56439363e650) at ../accel/tcg=
/cpu-exec.c:771
  #16 0x0000564391e00b9f in tcg_cpu_exec (cpu=3D<optimized out>) at ../acce=
l/tcg/tcg-cpus.c:243
  #17 0x0000564391e00b9f in tcg_cpu_thread_fn (arg=3D0x56439363e650) at ../=
accel/tcg/tcg-cpus.c:427
  #18 0x00005643920d8775 in qemu_thread_start (args=3D<optimized out>) at .=
./util/qemu-thread-posix.c:521
  #19 0x00007fc7efdcd6db in start_thread (arg=3D0x7fc7d6023700) at pthread_=
create.c:463

  To reproduce this issue, please run the QEMU with the following
  command line.

  =

  # To enable ASan option, please set configuration with the following comm=
and
  $ ./configure --target-list=3Di386-softmmu --disable-werror --enable-sani=
tizers
  $ make

  # To reproduce this issue, please run the QEMU process with the following=
 command line.
  $ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3D=
disk,format=3Draw -device mptsas1068,id=3Dscsi -device scsi-hd,drive=3DSysD=
isk -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

  Please let me know if I can provide any further info.
  Thank you.

  - Cheolwoo, Myung (Seoul National University)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908513/+subscriptions

