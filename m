Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38037BC10
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:52:15 +0200 (CEST)
Received: from localhost ([::1]:55552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgnPT-0004GS-16
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnNw-000262-3F
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:50:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:40220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgnNt-0006Rt-VT
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:50:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgnNs-0008Cf-Fc
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:50:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 66C322E8187
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:50:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 11:44:34 -0000
From: Thomas Huth <1907909@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr cwmyung th-huth
X-Launchpad-Bug-Reporter: Cheolwoo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160778696243.15318.2318965348341715879.malonedeb@chaenomeles.canonical.com>
Message-Id: <162081987421.7921.7829816877778742575.malone@wampee.canonical.com>
Subject: [Bug 1907909] Re: assertion failure in am53c974
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 9748e59a04b572cd09330c9f1529269aabe6f0f7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1907909 <1907909@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Can you still reproduce the issue with QEMU v6.0? For me, the attached
reproducer does not cause a crash anymore...

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907909

Title:
  assertion failure in am53c974

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
  am53c974 emulator.

  A malicious guest user/process could use this flaw to abort the QEMU
  process on the host, resulting in a denial of service.

  This was found in version 5.2.0 (master)

  =

  qemu-system-i386: ../hw/scsi/esp.c:402: void esp_do_dma(ESPState *): Asse=
rtion `s->cmdlen <=3D sizeof(s->cmdbuf) && len <=3D sizeof(s->cmdbuf) - s->=
cmdlen' failed.

  #0  __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdeps/unix/sysv/linux/rais=
e.c:51
  51      ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
  [Current thread is 1 (Thread 0x7fdd25dc4700 (LWP 28983))]
  gdb-peda$ bt
  #0  0x00007fdd3f8b5f47 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdep=
s/unix/sysv/linux/raise.c:51
  #1  0x00007fdd3f8b78b1 in __GI_abort () at abort.c:79
  #2  0x00007fdd3f8a742a in __assert_fail_base (fmt=3D0x7fdd3fa2ea38 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\\n%n", assertion=3Dassertion@entry=3D0x55b=
3e11a51c6 "s->cmdlen <=3D sizeof(s->cmdbuf) && len <=3D sizeof(s->cmdbuf) -=
 s->cmdlen", file=3Dfile@entry=3D0x55b3e11a4f73 "../hw/scsi/esp.c", line=3D=
line@entry=3D0x192, function=3Dfunction@entry=3D0x55b3e11a520d "void esp_do=
_dma(ESPState *)") at assert.c:92
  #3  0x00007fdd3f8a74a2 in __GI___assert_fail (assertion=3D0x55b3e11a51c6 =
"s->cmdlen <=3D sizeof(s->cmdbuf) && len <=3D sizeof(s->cmdbuf) - s->cmdlen=
", file=3D0x55b3e11a4f73 "../hw/scsi/esp.c", line=3D0x192, function=3D0x55b=
3e11a520d "void esp_do_dma(ESPState *)") at assert.c:101
  #4  0x000055b3e0941441 in esp_do_dma (s=3D0x55b3e49d1c88) at ../hw/scsi/e=
sp.c:401
  #5  0x000055b3e0944261 in handle_ti (s=3D0x55b3e49d1c88) at ../hw/scsi/es=
p.c:549
  #6  0x000055b3e093fdf9 in esp_dma_enable (s=3D0x55b3e49d1c88, irq=3D<opti=
mized out>, level=3D<optimized out>)
      at ../hw/scsi/esp.c:79
  #7  0x000055b3e0897930 in esp_pci_dma_write (pci=3D<optimized out>, saddr=
=3D<optimized out>, val=3D<optimized
  out>) at ../hw/scsi/esp-pci.c:83
  #8  0x000055b3e0897930 in esp_pci_io_write (opaque=3D<optimized out>, add=
r=3D<optimized out>, val=3D0xcf, size=3D0x4) at ../hw/scsi/esp-pci.c:209
  #9  0x000055b3e0e8f798 in memory_region_write_accessor (mr=3D<optimized o=
ut>, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out=
>, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...)
      at ../softmmu/memory.c:491
  #10 0x000055b3e0e8f58e in access_with_adjusted_size (addr=3D<optimized ou=
t>, value=3D<optimized out>, size=3D<optimized out>, access_size_min=3D<opt=
imized out>, access_size_max=3D<optimized out>, access_fn=3D<optimized out>=
, mr=3D<optimized out>, attrs=3D...) at ../softmmu/memory.c:552
  #11 0x000055b3e0e8f58e in memory_region_dispatch_write (mr=3D0x55b3e49d1b=
70, addr=3D<optimized out>, data=3D<optimized out>, op=3D<optimized out>, a=
ttrs=3D...) at ../softmmu/memory.c:1501
  #12 0x000055b3e0e21541 in address_space_stb (as=3D<optimized out>, addr=
=3D<optimized out>, val=3D0xffffffcf, attrs=3D..., result=3D0x0) at ../memo=
ry_ldst.c.inc:382
  #13 0x00007fdcd84a4a7f in code_gen_buffer ()
  #14 0x000055b3e0e57da0 in cpu_tb_exec (cpu=3D0x55b3e3c33650, itb=3D<optim=
ized out>)
      at ../accel/tcg/cpu-exec.c:178
  #15 0x000055b3e0e589eb in cpu_loop_exec_tb (tb=3D<optimized out>, cpu=3D<=
optimized out>, last_tb=3D<optimized
  out>, tb_exit=3D<optimized out>) at ../accel/tcg/cpu-exec.c:658
  #16 0x000055b3e0e589eb in cpu_exec (cpu=3D0x55b3e3c33650) at ../accel/tcg=
/cpu-exec.c:771
  #17 0x000055b3e0e87b9f in tcg_cpu_exec (cpu=3D<optimized out>) at ../acce=
l/tcg/tcg-cpus.c:243
  #18 0x000055b3e0e87b9f in tcg_cpu_thread_fn (arg=3D0x55b3e3c33650) at ../=
accel/tcg/tcg-cpus.c:427
  #19 0x000055b3e115f775 in qemu_thread_start (args=3D<optimized out>) at .=
./util/qemu-thread-posix.c:521
  #20 0x00007fdd3fc6f6db in start_thread (arg=3D0x7fdd25dc4700) at pthread_=
create.c:463
  #21 0x00007fdd3f998a3f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95

  To reproduce the assertion failure, please run the QEMU with the
  following command line.

  =

  $ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3D=
disk,format=3Draw -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDis=
k -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

  Please let me know if I can provide any further info.

  Thank you.

  - Cheolwoo, Myung (Seoul National University)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907909/+subscriptions

