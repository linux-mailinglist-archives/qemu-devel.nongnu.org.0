Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BDA2DD003
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:04:49 +0100 (CET)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpr5U-0005Md-LF
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpr1r-0002dL-PZ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:01:03 -0500
Received: from indium.canonical.com ([91.189.90.7]:36054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpr1o-0002Zm-MR
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:01:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kpr1n-0002dk-1f
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 11:00:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 06CE92E8048
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 11:00:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Dec 2020 10:52:49 -0000
From: "Cheol-Woo,Myung" <1908513@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cwmyung
X-Launchpad-Bug-Reporter: Cheol-Woo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Cheol-Woo,Myung (cwmyung)
Message-Id: <160820236991.15174.7743358668369837137.malonedeb@soybean.canonical.com>
Subject: [Bug 1908513] [NEW] assertion failure in mptsas1068 emulator
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: a93c6bbf74323282680c2f6f67c3ba03c4a13d7a
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
Reply-To: Bug 1908513 <1908513@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
mptsas1068 emulator.

A malicious guest user/process could use this flaw to abort the QEMU
process on the host, resulting in a denial of service.

This was found in version 5.2.0 (master)


qemu-system-i386: ../hw/scsi/mptsas.c:968: void mptsas_interrupt_status_wri=
te(MPTSASState *): Assertion
`s->intr_status & MPI_HIS_DOORBELL_INTERRUPT' failed.
[1]    16951 abort (core dumped)  /home/cwmyung/prj/hyfuzz/src/qemu-5.2/bui=
ld/qemu-system-i386 -m 512 -drive

Program terminated with signal SIGABRT, Aborted.
#0  __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/unix/sysv/linux/raise.=
c:51
51      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
[Current thread is 1 (Thread 0x7fc7d6023700 (LWP 23475))]
gdb-peda$ bt
#0  0x00007fc7efa13f47 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/=
unix/sysv/linux/raise.c:51
#1  0x00007fc7efa158b1 in __GI_abort () at abort.c:79
#2  0x00007fc7efa0542a in __assert_fail_base (fmt=3D0x7fc7efb8ca38 "%s%s%s:=
%u: %s%sAssertion `%s' failed.\\n%n", assertion=3Dassertion@entry=3D0x56439=
214d593 "s->intr_status & MPI_HIS_DOORBELL_INTERRUPT", file=3Dfile@entry=3D=
0x56439214d4a7 "../hw/scsi/mptsas.c", line=3Dline@entry=3D0x3c8, function=
=3Dfunction@entry=3D0x56439214d81c "void mptsas_interrupt_status_write(MPTS=
ASState *)") at assert.c:92
#3  0x00007fc7efa054a2 in __GI___assert_fail (assertion=3D0x56439214d593 "s=
->intr_status & MPI_HIS_DOORBELL_INTERRUPT", file=3D0x56439214d4a7 "../hw/s=
csi/mptsas.c", line=3D0x3c8, function=3D0x56439214d81c "void mptsas_interru=
pt_status_write(MPTSASState *)") at assert.c:101
#4  0x0000564391a43963 in mptsas_interrupt_status_write (s=3D<optimized out=
>) at ../hw/scsi/mptsas.c:968
#5  0x0000564391a43963 in mptsas_mmio_write (opaque=3D0x5643943dd5b0, addr=
=3D0x30, val=3D0x18000000, size=3D<optimized out>) at ../hw/scsi/mptsas.c:1=
052
#6  0x0000564391e08798 in memory_region_write_accessor (mr=3D<optimized out=
>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out>,=
 shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...)
    at ../softmmu/memory.c:491
#7  0x0000564391e0858e in access_with_adjusted_size (addr=3D<optimized out>=
, value=3D<optimized out>, size=3D<optimized out>, access_size_min=3D<optim=
ized out>, access_size_max=3D<optimized out>, access_fn=3D<optimized out>, =
mr=3D<optimized out>, attrs=3D...) at ../softmmu/memory.c:552
#8  0x0000564391e0858e in memory_region_dispatch_write (mr=3D0x5643943ddea0=
, addr=3D<optimized out>, data=3D<optimized out>, op=3D<optimized out>, att=
rs=3D...) at ../softmmu/memory.c:1501
#9  0x0000564391eff228 in io_writex (iotlbentry=3D<optimized out>, mmu_idx=
=3D<optimized out>, val=3D<optimized out>, addr=3D<optimized out>, retaddr=
=3D<optimized out>, op=3D<optimized out>, env=3D<optimized out>)
    at ../accel/tcg/cputlb.c:1378
#10 0x0000564391eff228 in store_helper (env=3D<optimized out>, addr=3D<opti=
mized out>, val=3D<optimized out>, oi=3D<optimized out>, retaddr=3D<optimiz=
ed out>, op=3DMO_32) at ../accel/tcg/cputlb.c:2397
#11 0x0000564391eff228 in helper_le_stl_mmu (env=3D<optimized out>, addr=3D=
<optimized out>, val=3D0x2, oi=3D<optimized out>, retaddr=3D0x7fc78841b401)=
 at ../accel/tcg/cputlb.c:2463
#12 0x00007fc78841b401 in code_gen_buffer ()
#13 0x0000564391dd0da0 in cpu_tb_exec (cpu=3D0x56439363e650, itb=3D<optimiz=
ed out>) at ../accel/tcg/cpu-exec.c:178
#14 0x0000564391dd19eb in cpu_loop_exec_tb (tb=3D<optimized out>, cpu=3D<op=
timized out>, last_tb=3D<optimized out>, tb_exit=3D<optimized out>) at ../a=
ccel/tcg/cpu-exec.c:658
#15 0x0000564391dd19eb in cpu_exec (cpu=3D0x56439363e650) at ../accel/tcg/c=
pu-exec.c:771
#16 0x0000564391e00b9f in tcg_cpu_exec (cpu=3D<optimized out>) at ../accel/=
tcg/tcg-cpus.c:243
#17 0x0000564391e00b9f in tcg_cpu_thread_fn (arg=3D0x56439363e650) at ../ac=
cel/tcg/tcg-cpus.c:427
#18 0x00005643920d8775 in qemu_thread_start (args=3D<optimized out>) at ../=
util/qemu-thread-posix.c:521
#19 0x00007fc7efdcd6db in start_thread (arg=3D0x7fc7d6023700) at pthread_cr=
eate.c:463

To reproduce this issue, please run the QEMU with the following command
line.


# To enable ASan option, please set configuration with the following command
$ ./configure --target-list=3Di386-softmmu --disable-werror --enable-saniti=
zers
$ make

# To reproduce this issue, please run the QEMU process with the following c=
ommand line.
$ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3Ddi=
sk,format=3Draw -device mptsas1068,id=3Dscsi -device scsi-hd,drive=3DSysDis=
k -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

Please let me know if I can provide any further info.
Thank you.

- Cheolwoo, Myung (Seoul National University)

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "attachment.zip"
   https://bugs.launchpad.net/bugs/1908513/+attachment/5444459/+files/attac=
hment.zip

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908513

Title:
  assertion failure in mptsas1068 emulator

Status in QEMU:
  New

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

