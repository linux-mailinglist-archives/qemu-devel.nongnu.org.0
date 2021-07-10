Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485513C32CC
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:29:37 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24cS-0007A2-As
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24ZB-0007sS-Rx
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:45362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Z8-0000Xw-GL
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:13 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24Z3-0003mP-F2
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 21DC82E81D0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:25 -0000
From: Launchpad Bug Tracker <1906516@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor phantom1003 th-huth
X-Launchpad-Bug-Reporter: jinyan (phantom1003)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160691732836.26002.10346003915035160514.malonedeb@chaenomeles.canonical.com>
Message-Id: <162589064525.5654.10912649859199189221.malone@loganberry.canonical.com>
Subject: [Bug 1906516] Re: [RISCV] sfence.vma need to end the translation block
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 38ccd9bba79837a28168b079cdff9333e1d8b82d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1906516 <1906516@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906516

Title:
  [RISCV] sfence.vma need to end the translation block

Status in QEMU:
  Expired

Bug description:
  QEMU emulator version 5.0.0

  sfence.vma will flush the tlb, so after this instruction, the translation=
 block should be end. The following code will only work in single step mode:
  ```
  relocate:
  =C2=A0li a0, OFFSET

  =C2=A0la t0, 1f
  =C2=A0add t0, t0, a0
  =C2=A0csrw stvec, t0

  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0la t0, early_pgtbl
  =C2=A0srl t0, t0, PAGE_SHIFT
  =C2=A0li t1, SATP_SV39
  =C2=A0or t0, t1, t0

  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0csrw satp, t0
  1:
  =C2=A0sfence.vma
  =C2=A0la t0, trap_s
  =C2=A0csrw stvec, t0
  =C2=A0ret
  ```

  In this code, I want to relocate pc to virtual address with the OFFSET
  prefix. Before writing to satp, pc run at physic address, stvec has
  been set to label 1 with a virtual prefix and virtual address has been
  mapping in early_pgtbl, after writing satp, qemu will throw a page
  fault, and pc will set to virtual address of label 1.

  The problem is that, in this situation, the translation block will not
  end after sfence.vma, and stvec will be set to trap_s,

  ```
  ----------------
  IN:
  Priv: 1; Virt: 0
  0x00000000800000dc:  00a080b3          add             ra,ra,a0
  0x00000000800000e0:  00007297          auipc           t0,28672        # =
0x800070e0
  0x00000000800000e4:  f2028293          addi            t0,t0,-224
  0x00000000800000e8:  00c2d293          srli            t0,t0,12
  0x00000000800000ec:  fff0031b          addiw           t1,zero,-1
  0x00000000800000f0:  03f31313          slli            t1,t1,63
  0x00000000800000f4:  005362b3          or              t0,t1,t0
  0x00000000800000f8:  18029073          csrrw           zero,satp,t0

  ----------------
  IN:
  Priv: 1; Virt: 0
  0x00000000800000fc:  12000073          sfence.vma      zero,zero
  0x0000000080000100:  00000297          auipc           t0,0            # =
0x80000100
  0x0000000080000104:  1c828293          addi            t0,t0,456
  0x0000000080000108:  10529073          csrrw           zero,stvec,t0

  riscv_raise_exception: 12
  riscv_raise_exception: 12
  riscv_raise_exception: 12
  riscv_raise_exception: 12
  ...
  ```

  So, the program will crash, and the program will work in single step mode:
  ```
  ----------------
  IN:
  Priv: 1; Virt: 0
  0x00000000800000f8:  18029073          csrrw           zero,satp,t0

  ----------------
  IN:
  Priv: 1; Virt: 0
  0x00000000800000fc:  12000073          sfence.vma      zero,zero

  riscv_raise_exception: 12
  ----------------
  IN:
  Priv: 1; Virt: 0
  0xffffffff800000fc:  12000073          sfence.vma      zero,zero

  ----------------
  IN:
  Priv: 1; Virt: 0
  0xffffffff80000100:  00000297          auipc           t0,0            # =
0xffffffff80000100

  ```
  The pc will set to label 1, instead of trap_s.

  I try to patch the code in fence.i in trans_rvi.inc.c to sfence.vma:
  ```
  =C2=A0=C2=A0=C2=A0=C2=A0tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
  =C2=A0=C2=A0=C2=A0=C2=A0exit_tb(ctx);
  =C2=A0=C2=A0=C2=A0=C2=A0ctx->base.is_jmp =3D DISAS_NORETURN;
  ```
  This codes can help to end the tranlate block, since I'm not a qemu guy, =
I'm not sure if this is a corret method.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906516/+subscriptions

