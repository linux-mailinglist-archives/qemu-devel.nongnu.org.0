Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF4F36F6FA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:14:24 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOI2-0005BW-Q6
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOFa-0003wd-4L
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:11:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:38784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOFM-0001UX-OS
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:11:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOFB-0005ZU-8P
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:11:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3B77F2E815A
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:11:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 07:56:11 -0000
From: Thomas Huth <1919036@bugs.launchpad.net>
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
References: <161565757658.18021.4101884325766858864.malonedeb@soybean.canonical.com>
Message-Id: <161976937192.10438.11649128656873313639.launchpad@gac.canonical.com>
Subject: [Bug 1919036] Re: Assertion failure in fifo8_push_all() through
 am53c974
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 3e09f2805daa718d6139dc555d9187e1ce0dafbf
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
Reply-To: Bug 1919036 <1919036@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1919036

Title:
  Assertion failure in fifo8_push_all() through am53c974

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
  qemu-system-i386: ../util/fifo8.c:43: fifo8_push_all: Assertion `fifo->nu=
m + num <=3D fifo->capacity' failed.

  #0  0x00007ffff0218fb7 in __GI_raise (sig=3Dsig@entry=3D0x6) at ../sysdep=
s/unix/sysv/linux/raise.c:51
  #1  0x00007ffff021a921 in __GI_abort () at abort.c:79
  #2  0x00007ffff020a48a in __assert_fail_base (fmt=3D0x7ffff0391750 "%s%s%=
s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3Dassertion@entry=3D0x5555=
58ed2400 "fifo->num + num <=3D fifo->capacity", file=3Dfile@entry=3D0x55555=
8ed2380 "../util/fifo8.c", line=3Dline@entry=3D0x2b, function=3Dfunction@en=
try=3D0x555558ed2560 <__PRETTY_FUNCTION__.16583> "fifo8_push_all")
      at assert.c:92
  #3  0x00007ffff020a502 in __GI___assert_fail (assertion=3Dassertion@entry=
=3D0x555558ed2400 "fifo->num + num <=3D fifo->capacity", file=3Dfile@entry=
=3D0x555558ed2380 "../util/fifo8.c", line=3Dline@entry=3D0x2b, function=3Df=
unction@entry=3D0x555558ed2560 <__PRETTY_FUNCTION__.16583> "fifo8_push_all"=
) at assert.c:101
  #4  0x00005555587749c4 in fifo8_push_all (fifo=3Dfifo@entry=3D0x61f000005=
200, data=3Ddata@entry=3D0x7fff72bfa640 "", num=3Dnum@entry=3D0x24) at ../u=
til/fifo8.c:43
  #5  0x00005555572bd13e in esp_do_dma (s=3Ds@entry=3D0x61f000005088) at ..=
/hw/scsi/esp.c:577
  #6  0x00005555572bfc8f in handle_ti (s=3D0x61f000005088) at ../hw/scsi/es=
p.c:845
  #7  0x00005555572c419c in esp_reg_write (s=3D0x61f000005088, saddr=3Dsadd=
r@entry=3D0x3, val=3D<optimized out>)
      at ../hw/scsi/esp.c:987
  #8  0x0000555557bb916a in esp_pci_io_write (opaque=3D0x61f000004680, addr=
=3D<optimized out>, val=3D<optimized out>, size=3D<optimized out>) at ../hw=
/scsi/esp-pci.c:214
  #9  0x000055555817ea28 in memory_region_write_accessor (mr=3D0x61f000004f=
70, addr=3D<optimized out>, value=3D<optimized out>, size=3D<optimized out>=
, shift=3D<optimized out>, mask=3D<optimized out>, attrs=3D...) at ../softm=
mu/memory.c:491
  #10 0x0000555558176671 in access_with_adjusted_size (addr=3Daddr@entry=3D=
0xc, value=3Dvalue@entry=3D0x7fff72bfb2a8, size=3Dsize@entry=3D0x1, access_=
size_min=3D<optimized out>, access_size_max=3D<optimized out>, access_fn=3D
      0x55555817e7c0 <memory_region_write_accessor>, mr=3D0x61f000004f70, a=
ttrs=3D...) at ../softmmu/memory.c:552
  #11 0x00005555581892aa in memory_region_dispatch_write (mr=3Dmr@entry=3D0=
x61f000004f70, addr=3D<optimized out>, data=3D<optimized out>, data@entry=
=3D0xffffff90, op=3Dop@entry=3DMO_8, attrs=3D..., attrs@entry=3D...) at ../=
softmmu/memory.c:1508
  #12 0x0000555558024b66 in address_space_stb (as=3D<optimized out>, addr=
=3D<optimized out>, val=3D<optimized out>, attrs=3D..., result=3D0x0) at /h=
ome/cwmyung/prj/hyfuzz/src/qemu-master/memory_ldst.c.inc:382
  #13 0x00007fff9323641c in code_gen_buffer ()
  #14 0x0000555557e793bb in cpu_tb_exec (tb_exit=3D<optimized out>, itb=3D<=
optimized out>, cpu=3D0x62e0000004b4)
      at ../accel/tcg/cpu-exec.c:190
  #15 0x0000555557e793bb in cpu_loop_exec_tb (tb_exit=3D<optimized out>, la=
st_tb=3D<optimized out>, tb=3D<optimized out>, cpu=3D0x62e0000004b4) at ../=
accel/tcg/cpu-exec.c:673
  #16 0x0000555557e793bb in cpu_exec (cpu=3Dcpu@entry=3D0x62e000000400) at =
../accel/tcg/cpu-exec.c:798
  #17 0x0000555557f5fc5a in tcg_cpus_exec (cpu=3Dcpu@entry=3D0x62e000000400=
) at ../accel/tcg/tcg-accel-ops.c:68
  #18 0x00005555582260af in mttcg_cpu_thread_fn (arg=3Darg@entry=3D0x62e000=
000400) at ../accel/tcg/tcg-accel-ops-mttcg.c:70
  #19 0x0000555558777b05 in qemu_thread_start (args=3D<optimized out>) at .=
./util/qemu-thread-posix.c:521
  #20 0x00007ffff05d26db in start_thread (arg=3D0x7fff72bff700) at pthread_=
create.c:463
  #21 0x00007ffff02fb71f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
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
https://bugs.launchpad.net/qemu/+bug/1919036/+subscriptions

