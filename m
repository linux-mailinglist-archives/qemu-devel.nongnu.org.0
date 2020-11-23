Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970252C0BA3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:56:55 +0100 (CET)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCKs-0006Rv-Fj
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khCJ6-0005BV-7j
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:55:05 -0500
Received: from indium.canonical.com ([91.189.90.7]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khCJ3-0000Zg-SL
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:55:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khCJ1-0006HG-R8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:54:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C40522E8025
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 13:54:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2020 13:43:53 -0000
From: Vda-linux <1613817@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth vda-linux
X-Launchpad-Bug-Reporter: Vda-linux (vda-linux)
X-Launchpad-Bug-Modifier: Vda-linux (vda-linux)
References: <20160816170639.30090.1747.malonedeb@gac.canonical.com>
Message-Id: <160613903311.12925.25673314193732749.malone@soybean.canonical.com>
Subject: [Bug 1613817] Re: x86: ret,
 lret and iret with noncanonical IP saves wrong IP on the exception
 stack
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 28ae96b60bbf8354bae1d0b8de222946f7c74d5f
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
Reply-To: Bug 1613817 <1613817@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I imagine the fix should be inserted here:

static inline void helper_ret_protected(CPUX86State *env, int shift,
                                        int is_iret, int addend,
                                        uintptr_t retaddr)
{
    uint32_t new_cs, new_eflags, new_ss;
    uint32_t new_es, new_ds, new_fs, new_gs;
    uint32_t e1, e2, ss_e1, ss_e2;
    int cpl, dpl, rpl, eflags_mask, iopl;
    target_ulong ssp, sp, new_eip, new_esp, sp_mask;

#ifdef TARGET_X86_64
    if (shift =3D=3D 2) {
        sp_mask =3D -1;
    } else
#endif
    {
        sp_mask =3D get_sp_mask(env->segs[R_SS].flags);
    }
    sp =3D env->regs[R_ESP];
    ssp =3D env->segs[R_SS].base;
    new_eflags =3D 0; /* avoid warning */
#ifdef TARGET_X86_64
    if (shift =3D=3D 2) {
        POPQ_RA(sp, new_eip, retaddr);
if (new_eip is not canonical) raise_exception_err_ra();  <=3D=3D=3D=3D HERE
        POPQ_RA(sp, new_cs, retaddr);
        new_cs &=3D 0xffff;
        if (is_iret) {
            POPQ_RA(sp, new_eflags, retaddr);
        }
    } else
#endif

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1613817

Title:
  x86: ret, lret and iret with noncanonical IP saves wrong IP on the
  exception stack

Status in QEMU:
  New

Bug description:
  This test program:

  # compile with: gcc -nostartfiles -nostdlib
  _start:         .globl  _start
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0mov     %ss,%eax
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0push    %rax
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0push    %rsp
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pushf
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0mov     %cs,%eax
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0push    %rax
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0mov     $0x1234567812345678,%rax
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0push    %rax
  //qemu bug: ip=3D1234567812345678, should be ip=3D0000000000400abc:
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0iretq
  1:
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0jmp     1b

  should segfault on IRET instruction because return address on stack
  is invalid (it is not canonical).
  And it does, both on native CPU and in qemu.
  But there is a difference: on native CPU, it fails before instruction
  is executed, IOW: saved IP points to the failed IRET:

  # strace -i ./bad_ip_in_iret
  [00007fa609805d57] execve("./bad_ip_in_iret", ["./bad_ip_in_iret"], [/* 5=
4 vars */]) =3D 0
  [00000000004000e7] --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSI_KERNEL, =
si_addr=3D0} ---
  =C2=A0^^^^^^^^^^^^^^^^-NOTE THIS
  [????????????????] +++ killed by SIGSEGV (core dumped) +++

  In qemu, evidently instruction succeeds, and then emulated CPU throws
  an exception because fetching instructions from non-canonical
  addresses is not allowed:

  / # strace -i ./bad_ip_in_iret
  [000000000041a790] execve("./bad_ip_in_iret", ["./bad_ip_in_iret"], [/* 5=
 vars */]) =3D 0
  [1234567812345678] --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSI_KERNEL, =
si_addr=3D0} ---
  =C2=A0^^^^^^^^^^^^^^^^-NOTE THIS
  [????????????????] +++ killed by SIGSEGV +++
  Segmentation fault

  Thus, the emulation is not the same as real CPU.

  This is not specific to IRET, the same happens with "far return" LRET,
  and with ordinary RET instructions as well.
  In qemu:

  / # strace -i ./bad_ip_in_lret
  [000000000041a790] execve("./bad_ip_in_lret", ["./bad_ip_in_lret"], [/* 5=
 vars */]) =3D 0
  [1234567812345678] --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSI_KERNEL, =
si_addr=3D0} ---
  [????????????????] +++ killed by SIGSEGV +++
  Segmentation fault
  / # strace -i ./bad_ip_in_ret
  [000000000041a790] execve("./bad_ip_in_ret", ["./bad_ip_in_ret"], [/* 5 v=
ars */]) =3D 0
  [1234567812345678] --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSI_KERNEL, =
si_addr=3D0} ---
  [????????????????] +++ killed by SIGSEGV +++
  Segmentation fault

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1613817/+subscriptions

