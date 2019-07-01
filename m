Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E95B6B5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 10:22:08 +0200 (CEST)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhrZf-0006t4-0s
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 04:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35275)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hhrYa-0006N3-K3
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 04:21:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hhrYZ-0003M7-8S
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 04:21:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:49072)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hhrYZ-0003LJ-2Z
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 04:20:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hhrYX-0001VS-2v
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 08:20:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0CEC22E80CC
 for <qemu-devel@nongnu.org>; Mon,  1 Jul 2019 08:20:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jul 2019 08:05:49 -0000
From: Lukas Durfina <1774149@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arnaudalies-py lukasdurfina
X-Launchpad-Bug-Reporter: mou (arnaudalies-py)
X-Launchpad-Bug-Modifier: Lukas Durfina (lukasdurfina)
References: <152766936065.4012.2532535303592891582.malonedeb@chaenomeles.canonical.com>
Message-Id: <156196834916.18147.11463146522291037635.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18991";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 3f8727bc0f1f346ae02404ffc76c32542f09e295
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1774149] Re: qemu-user x86_64 x86 gdb call
 function from gdb doesn't work
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
Reply-To: Bug 1774149 <1774149@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems the issue is related to gdb code:
set_gdbarch_call_dummy_location (gdbarch, ON_STACK);

What is going on?
The breakpoint is stored on stack and for the first time the address has a =
flag PAGE_WRITE.
After a call, the address does not have anymore the flag PAGE_WRITE. It is =
changed in method tb_page_add() (file: accel/tcg/translate-all.c).

I am thinking more about gdbstub.c.
If there is handled packet M for writing data to memory, it should always w=
rite data to given address.
Reason: you are debugging and you want to verify various scenarios, so chan=
ging different values on different places may be needed.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1774149

Title:
  qemu-user x86_64 x86 gdb call function from gdb doesn't work

Status in QEMU:
  New

Bug description:
  While running qemu user x86_64 x86 with gdb server, calling functions
  are not working.

  Here is how to reproduce it:

  run in a terminal:
  $ qemu-x86_64 -g 12345 -L / /bin/ls

  In another terminal run gdb:
  (gdb) file /bin/ls
  (gdb) target remote :12345
  (gdb) b _init
  (gdb) c
  (gdb) call malloc(1)
  Could not fetch register "fs_base"; remote failure reply 'E14'

  In other cases we also got the error:
  Could not fetch register "orig_rax"; remote failure reply 'E14'

  Here is how I patched it (it is only a workaround):

  diff --git a/gdbstub.c b/gdbstub.c
  index 2a94030..5749efe 100644
  --- a/gdbstub.c
  +++ b/gdbstub.c
  @@ -668,6 +668,11 @@ static int gdb_read_register(CPUState *cpu, uint8_t =
*mem_buf, int reg)
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0return r->get_reg(env, mem_buf, reg - r->base_reg);
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
  +#ifdef TARGET_X86_64
  +    return 8;
  +#elif TARGET_I386
  +    return 4;
  +#endif
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
  =C2=A0}

  (Our guess for this issue was, gdb is requesting for 'fake' registers
  to know register size)

  Once we patched that, we got another problem while calling functions
  from gdb: We could call functions, but only once.

  Here is how to reproduce it:
  run in a terminal:
  $ qemu-x86_64 -g 12345 -L / /bin/ls

  In another terminal run gdb:
  (gdb) file /bin/ls
  (gdb) target remote :12345
  (gdb) b _init
  (gdb) c
  (gdb) call malloc(1)
  $1 =3D (void *) 0x620010
  (gdb) call malloc(1)
  Cannot access memory at address 0x40007ffb8f

  Here is how we patched it to make it work:

  diff --git a/exec.c b/exec.c
  index 03238a3..d303922 100644
  --- a/exec.c
  +++ b/exec.c
  @@ -2833,7 +2833,7 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong=
 addr,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!(flags & PAGE_=
VALID))
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0return -1;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (is_write) {
  -            if (!(flags & PAGE_WRITE))
  +            if (!(flags & (PAGE_WRITE | PAGE_WRITE_ORG)))
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0/* XXX: this code should not depend on lock_user */
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0if (!(p =3D lock_user(VERIFY_WRITE, addr, l, 0)))

  From what we saw, there is a page which is passed to read-only after
  first execution, and gdb need to write on that page to put a
  breakpoint. (on the stack to get function return)

  We suspect this is linked to this:
  https://qemu.weilnetz.de/w64/2012/2012-06-28/qemu-tech.html#Self_002dmodi=
fying-code-and-translated-code-invalidation

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1774149/+subscriptions

