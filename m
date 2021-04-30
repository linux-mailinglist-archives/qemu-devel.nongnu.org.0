Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E842436F7ED
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:28:30 +0200 (CEST)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPRl-0001yK-VS
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPPQ-0000Ip-DU
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:26:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:39136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcPPK-00031t-11
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:26:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcPPI-0004cN-HP
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4CFD52E816B
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 09:17:26 -0000
From: Thomas Huth <1919035@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr cwmyung mark-cave-ayland mauro-cascella
X-Launchpad-Bug-Reporter: Cheolwoo,Myung (cwmyung)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161565639689.3429.408017997346111219.malonedeb@chaenomeles.canonical.com>
Message-Id: <161977424862.9976.2495065902998517450.launchpad@gac.canonical.com>
Subject: [Bug 1919035] Re: Assertion failure in fifo8_pop_buf() through
 am53c974
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: e9e7013a108eec84d5e5ff78bdfc0917404033e2
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
Reply-To: Bug 1919035 <1919035@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1919035

Title:
  Assertion failure in fifo8_pop_buf() through am53c974

Status in QEMU:
  Fix Released

Bug description:
  Hello,

  Using hypervisor fuzzer, hyfuzz, I found an assertion failure through
  am53c974 emulator.

  A malicious guest user/process could use this flaw to abort the QEMU
  process on the host, resulting in a denial of service.

  This was found in version 5.2.0 (master, 3f8d1885e4)

  =

  ```
  qemu-system-i386: ../util/fifo8.c:73: fifo8_pop_buf: Assertion `max > 0 &=
& max <=3D fifo->num' failed.

  #0  0x00007ffff0218fb7 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdep=
s/unix/sysv/linux/raise.c:51
  #1  0x00007ffff021a921 in __GI_abort () at abort.c:79
  #2  0x00007ffff020a48a in __assert_fail_base (fmt=3D0x7ffff0391750 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3Dassertion@entry=3D0x5555=
58ed24a0 "max > 0 && max <=3D fifo->num", file=3Dfile@entry=3D0x555558ed238=
0 "../util/fifo8.c", line=3Dline@entry=3D0x49, function=3Dfunction@entry=3D=
0x555558ed24e0 <__PRETTY_FUNCTION__.16603> "fifo8_pop_buf") at assert.c:92
  #3  0x00007ffff020a502 in __GI___assert_fail (assertion=3Dassertion@entry=
=3D0x555558ed24a0 "max > 0 && max <=3D fifo->num", file=3Dfile@entry=3D0x55=
5558ed2380 "../util/fifo8.c", line=3Dline@entry=3D0x49, function=3Dfunction=
@entry=3D0x555558ed24e0 <__PRETTY_FUNCTION__.16603> "fifo8_pop_buf") at ass=
ert.c:101
  #4  0x000055555877519a in fifo8_pop_buf (fifo=3Dfifo@entry=3D0x61f0000052=
00, max=3Dmax@entry=3D0xff, num=3Dnum@entry=3D0x7fff72bfa550) at ../util/fi=
fo8.c:73
  #5  0x00005555572b7d9a in do_cmd (s=3Ds@entry=3D0x61f000005088) at ../hw/=
scsi/esp.c:328
  #6  0x00005555572b879a in esp_do_nodma (s=3Ds@entry=3D0x61f000005088) at =
../hw/scsi/esp.c:701
  #7  0x00005555572bfd79 in handle_ti (s=3D0x61f000005088) at ../hw/scsi/es=
p.c:848
  #8  0x00005555572c419c in esp_reg_write (s=3D0x61f000005088, saddr=3Dsadd=
r@entry=3D0x3, val=3D<optimized out>) at ../hw/scsi/esp.c:987
  #9  0x0000555557bb916a in esp_pci_io_write (opaque=3D0x61f000004680, addr=
=3D<optimized out>, val=3D<optimized out>, size=3D<optimized out>) at ../hw=
/scsi/esp-pci.c:214
  #10 0x000055555817ea28 in memory_region_write_accessor (mr=3D0x61f000004f=
70, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out>=
, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...) at ../softm=
mu/memory.c:491
  #11 0x0000555558176671 in access_with_adjusted_size (addr=3Daddr@entry=3D=
0xc, value=3Dvalue@entry=3D0x7fff72bfb2a8, size=3Dsize@entry=3D0x1, access_=
size_min=3D<optimized out>, access_size_max=3D<optimized out>, access_fn=3D
      0x55555817e7c0 <memory_region_write_accessor>, mr=3D0x61f000004f70, a=
ttrs=3D...) at ../softmmu/memory.c:552
  #12 0x00005555581892aa in memory_region_dispatch_write (mr=3Dmr@entry=3D0=
x61f000004f70, addr=3D<optimized out>, data=3D<optimized out>, data@entry=
=3D0x10, op=3Dop@entry=3DMO_8, attrs=3D..., attrs@entry=3D...) at ../softmm=
u/memory.c:1508
  #13 0x0000555558024b66 in address_space_stb (as=3D<optimized out>, addr=
=3D<optimized out>, val=3D<optimized out>, attrs=3D..., result=3D0x0) at /h=
ome/cwmyung/prj/hyfuzz/src/qemu-master/memory_ldst.c.inc:382
  #14 0x00007fff93236d3c in code_gen_buffer ()
  #15 0x0000555557e793bb in cpu_tb_exec (tb_exit=3D<optimized out>, itb=3D<=
optimized out>, cpu=3D0x62e0000004b4) at ../accel/tcg/cpu-exec.c:190
  #16 0x0000555557e793bb in cpu_loop_exec_tb (tb_exit=3D<optimized out>, la=
st_tb=3D<optimized out>, tb=3D<optimized out>, cpu=3D0x62e0000004b4) at ../=
accel/tcg/cpu-exec.c:673
  #17 0x0000555557e793bb in cpu_exec (cpu=3Dcpu@entry=3D0x62e000000400) at =
../accel/tcg/cpu-exec.c:798
  #18 0x0000555557f5fc5a in tcg_cpus_exec (cpu=3Dcpu@entry=3D0x62e000000400=
) at ../accel/tcg/tcg-accel-ops.c:68
  #19 0x00005555582260af in mttcg_cpu_thread_fn (arg=3Darg@entry=3D0x62e000=
000400) at ../accel/tcg/tcg-accel-ops-mttcg.c:70
  #20 0x0000555558777b05 in qemu_thread_start (args=3D<optimized out>) at .=
./util/qemu-thread-posix.c:521
  #21 0x00007ffff05d26db in start_thread (arg=3D0x7fff72bff700) at pthread_=
create.c:463
  #22 0x00007ffff02fb71f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:95
  ```

  =

  To reproduce the assertion failure, please run the QEMU with the followin=
g command line.

  ```

  $ ./qemu-system-i386 -m 512 -drive
  file=3D./hyfuzz.img,index=3D0,media=3Ddisk,format=3Draw -device
  am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk -drive
  id=3DSysDisk,if=3Dnone,file=3D./disk.img

  ```

  Please let me know if I can provide any further info.

  Thank you.

  - Cheolwoo, Myung (Seoul National University)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1919035/+subscriptions

