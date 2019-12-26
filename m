Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EA212AF76
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Dec 2019 23:56:32 +0100 (CET)
Received: from localhost ([::1]:57176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ikc3S-0003Ma-Q7
	for lists+qemu-devel@lfdr.de; Thu, 26 Dec 2019 17:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ikc2g-0002vk-Bl
 for qemu-devel@nongnu.org; Thu, 26 Dec 2019 17:55:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ikc2e-0000Fl-MZ
 for qemu-devel@nongnu.org; Thu, 26 Dec 2019 17:55:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:39930)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ikc2e-0000FK-Gj
 for qemu-devel@nongnu.org; Thu, 26 Dec 2019 17:55:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ikc2c-0001K0-Jl
 for <qemu-devel@nongnu.org>; Thu, 26 Dec 2019 22:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 931A62E805D
 for <qemu-devel@nongnu.org>; Thu, 26 Dec 2019 22:55:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Dec 2019 22:42:44 -0000
From: Marek Dolata <1857640@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mkdolata
X-Launchpad-Bug-Reporter: Marek Dolata (mkdolata)
X-Launchpad-Bug-Modifier: Marek Dolata (mkdolata)
Message-Id: <157740016424.15105.4522605454597916967.malonedeb@wampee.canonical.com>
Subject: [Bug 1857640] [NEW] qemu-system-i386 registers clobbered after gdb
 set due to k_gs_base bug in gdbstub
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f1acbe6dd68a2f3169a42c942367fb23bb09aace
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1857640 <1857640@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Due to a bug in /target/i386/gdbstub.c, setting registers in gdb causes
the ones following k_gs_base to get clobbered.

I'm using qemu version 4.2.50 on an msys64 and start qemu's i386 with a
gdb server.

$ qemu-system-i386 -version
QEMU emulator version 4.2.50 (v4.2.0-363-gdd5b0f9549-dirty)
Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

$ qemu-system-i386 -gdb tcp::29096 -S
C:\msys64\usr\local\qemu-system-i386.exe: invalid accelerator kvm
C:\msys64\usr\local\qemu-system-i386.exe: falling back to tcg


I start a gdb client, connect to the server, display the register state, se=
t k_gs_base, display the register state again, and notice an issue. (Settin=
g other registers also clobbers the ones after k_gs_base).

$ gdb -q
(gdb) target remote :29096
...
(gdb) info regs
...
gs_base        0x0      0
k_gs_base      0x0      0
cr0            0x60000010       [ CD NW ET ]
cr2            0x0      0
...
(gdb) set $k_gs_base =3D 0x41414141
(gdb) info regs
...
gs_base        0x0      0
k_gs_base      0x0      0
cr0            0x41414151       [ CD WP ET PE ]
cr2            0x60000010       1610612752
...


In the gdbstub code, I notice that the read and write functions are not sym=
metric for IDX_SEG_REGS + 8, which corresponds to k_gs_base.

$ cat /usr/local/src/qemu-4.2.0/target/i386/gdbstub.c
...
int x86_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
{
...
        case IDX_SEG_REGS + 8:
#ifdef TARGET_X86_64
            if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
                return gdb_get_reg64(mem_buf, env->kernelgsbase);
            }
            return gdb_get_reg32(mem_buf, env->kernelgsbase);
#else
            return gdb_get_reg32(mem_buf, 0);
#endif
...
}
...
int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
{
...
#ifdef TARGET_X86_64
        case IDX_SEG_REGS + 8:
            if (env->hflags & HF_CS64_MASK) {
                env->kernelgsbase =3D ldq_p(mem_buf);
                return 8;
            }
            env->kernelgsbase =3D ldl_p(mem_buf);
            return 4;
#endif
...
}
...


I change the write function, rebuild, and verify that the issue is resolved.

$ cat /usr/local/src/qemu-4.2.0/target/i386/gdbstub.c
int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
{
...
        case IDX_SEG_REGS + 8:
#ifdef TARGET_X86_64
            if (env->hflags & HF_CS64_MASK) {
                env->kernelgsbase =3D ldq_p(mem_buf);
                return 8;
            }
            env->kernelgsbase =3D ldl_p(mem_buf);
            return 4;
#else
            return 4;
#endif
...
}
...

$ make
...
$ make install
...

$ qemu-system-i386 -gdb tcp::29096 -S

$ gdb -q
(gdb) target remote :29096
...
(gdb) info regs
...
gs_base        0x0      0
k_gs_base      0x0      0
cr0            0x60000010       [ CD NW ET ]
cr2            0x0      0
...
(gdb) set $k_gs_base =3D 0x41414141
(gdb) info regs
...
gs_base        0x0      0
k_gs_base      0x0      0
cr0            0x60000010       [ CD NW ET ]
cr2            0x0      0
...


I'll submit the patch below.

$ diff gdbstub.c gdbstub.c.bkp
353d352
<         case IDX_SEG_REGS + 8:
354a354
>         case IDX_SEG_REGS + 8:
362,363d361
< #else
<             return 4;

** Affects: qemu
     Importance: Undecided
         Status: New

** Summary changed:

- registers clobbered after set in qemu-system-i386 due to k_gs_base
+ qemu-system-i386 registers clobbered after gdb set due to k_gs_base bug i=
n gdbstub

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1857640

Title:
  qemu-system-i386 registers clobbered after gdb set due to k_gs_base
  bug in gdbstub

Status in QEMU:
  New

Bug description:
  Due to a bug in /target/i386/gdbstub.c, setting registers in gdb
  causes the ones following k_gs_base to get clobbered.

  I'm using qemu version 4.2.50 on an msys64 and start qemu's i386 with
  a gdb server.

  $ qemu-system-i386 -version
  QEMU emulator version 4.2.50 (v4.2.0-363-gdd5b0f9549-dirty)
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

  $ qemu-system-i386 -gdb tcp::29096 -S
  C:\msys64\usr\local\qemu-system-i386.exe: invalid accelerator kvm
  C:\msys64\usr\local\qemu-system-i386.exe: falling back to tcg

  =

  I start a gdb client, connect to the server, display the register state, =
set k_gs_base, display the register state again, and notice an issue. (Sett=
ing other registers also clobbers the ones after k_gs_base).

  $ gdb -q
  (gdb) target remote :29096
  ...
  (gdb) info regs
  ...
  gs_base        0x0      0
  k_gs_base      0x0      0
  cr0            0x60000010       [ CD NW ET ]
  cr2            0x0      0
  ...
  (gdb) set $k_gs_base =3D 0x41414141
  (gdb) info regs
  ...
  gs_base        0x0      0
  k_gs_base      0x0      0
  cr0            0x41414151       [ CD WP ET PE ]
  cr2            0x60000010       1610612752
  ...

  =

  In the gdbstub code, I notice that the read and write functions are not s=
ymmetric for IDX_SEG_REGS + 8, which corresponds to k_gs_base.

  $ cat /usr/local/src/qemu-4.2.0/target/i386/gdbstub.c
  ...
  int x86_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
  {
  ...
          case IDX_SEG_REGS + 8:
  #ifdef TARGET_X86_64
              if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
                  return gdb_get_reg64(mem_buf, env->kernelgsbase);
              }
              return gdb_get_reg32(mem_buf, env->kernelgsbase);
  #else
              return gdb_get_reg32(mem_buf, 0);
  #endif
  ...
  }
  ...
  int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
  {
  ...
  #ifdef TARGET_X86_64
          case IDX_SEG_REGS + 8:
              if (env->hflags & HF_CS64_MASK) {
                  env->kernelgsbase =3D ldq_p(mem_buf);
                  return 8;
              }
              env->kernelgsbase =3D ldl_p(mem_buf);
              return 4;
  #endif
  ...
  }
  ...

  =

  I change the write function, rebuild, and verify that the issue is resolv=
ed.

  $ cat /usr/local/src/qemu-4.2.0/target/i386/gdbstub.c
  int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
  {
  ...
          case IDX_SEG_REGS + 8:
  #ifdef TARGET_X86_64
              if (env->hflags & HF_CS64_MASK) {
                  env->kernelgsbase =3D ldq_p(mem_buf);
                  return 8;
              }
              env->kernelgsbase =3D ldl_p(mem_buf);
              return 4;
  #else
              return 4;
  #endif
  ...
  }
  ...

  $ make
  ...
  $ make install
  ...

  $ qemu-system-i386 -gdb tcp::29096 -S

  $ gdb -q
  (gdb) target remote :29096
  ...
  (gdb) info regs
  ...
  gs_base        0x0      0
  k_gs_base      0x0      0
  cr0            0x60000010       [ CD NW ET ]
  cr2            0x0      0
  ...
  (gdb) set $k_gs_base =3D 0x41414141
  (gdb) info regs
  ...
  gs_base        0x0      0
  k_gs_base      0x0      0
  cr0            0x60000010       [ CD NW ET ]
  cr2            0x0      0
  ...

  =

  I'll submit the patch below.

  $ diff gdbstub.c gdbstub.c.bkp
  353d352
  <         case IDX_SEG_REGS + 8:
  354a354
  >         case IDX_SEG_REGS + 8:
  362,363d361
  < #else
  <             return 4;

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1857640/+subscriptions

