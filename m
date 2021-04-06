Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A8355D17
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:44:23 +0200 (CEST)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsYg-00005r-8k
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTsWm-0007mp-Vw
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:42:25 -0400
Received: from indium.canonical.com ([91.189.90.7]:45428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTsWk-00087O-A6
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:42:24 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lTsWe-00060E-Ad
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 20:42:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 710072E8218
 for <qemu-devel@nongnu.org>; Tue,  6 Apr 2021 20:41:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Apr 2021 17:01:20 -0000
From: Mehrdad Hessar <1922773@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: riscv32
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mehrdadhe
X-Launchpad-Bug-Reporter: Mehrdad Hessar (mehrdadhe)
X-Launchpad-Bug-Modifier: Mehrdad Hessar (mehrdadhe)
Message-Id: <161772848102.29247.5138127903263010821.malonedeb@gac.canonical.com>
Subject: [Bug 1922773] [NEW] RISCV32 illegal instruction exception
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 94cc8ac150a072836afa9d841267aa11b3281e95
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
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
Reply-To: Bug 1922773 <1922773@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

I'm running a machine learning model on qemu riscv32 and I ran into
illegal instruction exception for some reason. I wasn't sure if this is
a bug and if so whether it is related to zephyr or qemu, however I'll
try to provide as much as information to get a better understanding.

Here is the assembly code that I'm running:

0x8000bd74 <+0>:	lw	a4,0(a0)
   0x8000bd76 <+2>:	lw	a5,8(a0)
   0x8000bd78 <+4>:	lw	a0,0(a4)
   0x8000bd7a <+6>:	lw	a1,0(a5)
   0x8000bd7c <+8>:	li	a3,0
   0x8000bd7e <+10>:	j	0x8000bda4 <fused_nn_pad_layout_transform+48>
   0x8000bd80 <+12>:	addi	a5,a3,-2
   0x8000bd84 <+16>:	li	a2,27
   0x8000bd86 <+18>:	bgeu	a2,a5,0x8000bdae <fused_nn_pad_layout_transform+5=
8>
=3D> 0x8000bd8a <+22>:	fmv.w.x	fa5,zero
   0x8000bd8e <+26>:	slli	a5,a3,0x5
   0x8000bd92 <+30>:	add	a5,a5,a4
   0x8000bd94 <+32>:	slli	a5,a5,0x2
   0x8000bd96 <+34>:	add	a5,a5,a1
   0x8000bd98 <+36>:	fsw	fa5,0(a5)
   0x8000bd9a <+38>:	addi	a4,a4,1
   0x8000bd9c <+40>:	li	a5,31
   0x8000bd9e <+42>:	bge	a5,a4,0x8000bd80 <fused_nn_pad_layout_transform+12>
   0x8000bda2 <+46>:	addi	a3,a3,1
   0x8000bda4 <+48>:	li	a5,31
   0x8000bda6 <+50>:	blt	a5,a3,0x8000bde0 <fused_nn_pad_layout_transform+10=
8>
   0x8000bdaa <+54>:	li	a4,0
   0x8000bdac <+56>:	j	0x8000bd9c <fused_nn_pad_layout_transform+40>
   0x8000bdae <+58>:	li	a5,1
   0x8000bdb0 <+60>:	bge	a5,a4,0x8000bdd4 <fused_nn_pad_layout_transform+96>
   0x8000bdb4 <+64>:	li	a5,29
   0x8000bdb6 <+66>:	blt	a5,a4,0x8000bdda <fused_nn_pad_layout_transform+10=
2>
   0x8000bdba <+70>:	li	a5,28
   0x8000bdbc <+72>:	mul	a5,a3,a5
   0x8000bdc0 <+76>:	add	a5,a5,a4
   0x8000bdc2 <+78>:	lui	a2,0x40000
   0x8000bdc6 <+82>:	addi	a2,a2,-58 # 0x3fffffc6
   0x8000bdca <+86>:	add	a5,a5,a2
   0x8000bdcc <+88>:	slli	a5,a5,0x2
   0x8000bdce <+90>:	add	a5,a5,a0
   0x8000bdd0 <+92>:	flw	fa5,0(a5)
   0x8000bdd2 <+94>:	j	0x8000bd8e <fused_nn_pad_layout_transform+26>
   0x8000bdd4 <+96>:	fmv.w.x	fa5,zero
   0x8000bdd8 <+100>:	j	0x8000bd8e <fused_nn_pad_layout_transform+26>
   0x8000bdda <+102>:	fmv.w.x	fa5,zero
   0x8000bdde <+106>:	j	0x8000bd8e <fused_nn_pad_layout_transform+26>
   0x8000bde0 <+108>:	li	a0,0
   0x8000bde2 <+110>:	ret

My code breaks on line 0x8000bd8a and then the mcause register is loaded
with value 0x02 which translates to illegal instruction. Please let me
know if you need more information about this.

I also posted this on ZephyrProject in case it is related to the Zephyr:
https://github.com/zephyrproject-rtos/zephyr/issues/34026

I have tested on both QEMU 5.1.0 and 5.2.0 versions. I ran the same code
on qemu riscv64 and didn't have the same problem. Here is the assembly
code that is generated for the same operation:

=3D> 0x000000008000b446 <+0>:	ld	a4,0(a0)
   0x000000008000b448 <+2>:	ld	a5,8(a0)
   0x000000008000b44a <+4>:	ld	a0,0(a4)
   0x000000008000b44c <+6>:	ld	a1,0(a5)
   0x000000008000b44e <+8>:	li	a3,0
   0x000000008000b450 <+10>:	j	0x8000b476 <fused_nn_pad_layout_transform+48>
   0x000000008000b452 <+12>:	addiw	a5,a3,-2
   0x000000008000b456 <+16>:	li	a2,27
   0x000000008000b458 <+18>:	bgeu	a2,a5,0x8000b480 <fused_nn_pad_layout_tra=
nsform+58>
   0x000000008000b45c <+22>:	li	a2,0
   0x000000008000b460 <+26>:	slliw	a5,a3,0x5
   0x000000008000b464 <+30>:	addw	a5,a5,a4
   0x000000008000b466 <+32>:	slli	a5,a5,0x2
   0x000000008000b468 <+34>:	add	a5,a5,a1
   0x000000008000b46a <+36>:	sw	a2,0(a5)
   0x000000008000b46c <+38>:	addiw	a4,a4,1
   0x000000008000b46e <+40>:	li	a5,31
   0x000000008000b470 <+42>:	bge	a5,a4,0x8000b452 <fused_nn_pad_layout_tran=
sform+12>
   0x000000008000b474 <+46>:	addiw	a3,a3,1
   0x000000008000b476 <+48>:	li	a5,31
   0x000000008000b478 <+50>:	blt	a5,a3,0x8000b4ac <fused_nn_pad_layout_tran=
sform+102>
   0x000000008000b47c <+54>:	li	a4,0
   0x000000008000b47e <+56>:	j	0x8000b46e <fused_nn_pad_layout_transform+40>
   0x000000008000b480 <+58>:	li	a5,1
   0x000000008000b482 <+60>:	bge	a5,a4,0x8000b4a0 <fused_nn_pad_layout_tran=
sform+90>
   0x000000008000b486 <+64>:	li	a5,29
   0x000000008000b488 <+66>:	blt	a5,a4,0x8000b4a6 <fused_nn_pad_layout_tran=
sform+96>
   0x000000008000b48c <+70>:	li	a5,28
   0x000000008000b48e <+72>:	mulw	a5,a5,a3
   0x000000008000b492 <+76>:	addw	a5,a5,a4
   0x000000008000b494 <+78>:	addiw	a5,a5,-58
   0x000000008000b498 <+82>:	slli	a5,a5,0x2
   0x000000008000b49a <+84>:	add	a5,a5,a0
   0x000000008000b49c <+86>:	lw	a2,0(a5)
   0x000000008000b49e <+88>:	j	0x8000b460 <fused_nn_pad_layout_transform+26>
   0x000000008000b4a0 <+90>:	li	a2,0
   0x000000008000b4a4 <+94>:	j	0x8000b460 <fused_nn_pad_layout_transform+26>
   0x000000008000b4a6 <+96>:	li	a2,0
   0x000000008000b4aa <+100>:	j	0x8000b460 <fused_nn_pad_layout_transform+2=
6>
   0x000000008000b4ac <+102>:	li	a0,0
   0x000000008000b4ae <+104>:	ret

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: riscv32

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922773

Title:
  RISCV32 illegal instruction exception

Status in QEMU:
  New

Bug description:
  I'm running a machine learning model on qemu riscv32 and I ran into
  illegal instruction exception for some reason. I wasn't sure if this
  is a bug and if so whether it is related to zephyr or qemu, however
  I'll try to provide as much as information to get a better
  understanding.

  Here is the assembly code that I'm running:

  0x8000bd74 <+0>:	lw	a4,0(a0)
     0x8000bd76 <+2>:	lw	a5,8(a0)
     0x8000bd78 <+4>:	lw	a0,0(a4)
     0x8000bd7a <+6>:	lw	a1,0(a5)
     0x8000bd7c <+8>:	li	a3,0
     0x8000bd7e <+10>:	j	0x8000bda4 <fused_nn_pad_layout_transform+48>
     0x8000bd80 <+12>:	addi	a5,a3,-2
     0x8000bd84 <+16>:	li	a2,27
     0x8000bd86 <+18>:	bgeu	a2,a5,0x8000bdae <fused_nn_pad_layout_transform=
+58>
  =3D> 0x8000bd8a <+22>:	fmv.w.x	fa5,zero
     0x8000bd8e <+26>:	slli	a5,a3,0x5
     0x8000bd92 <+30>:	add	a5,a5,a4
     0x8000bd94 <+32>:	slli	a5,a5,0x2
     0x8000bd96 <+34>:	add	a5,a5,a1
     0x8000bd98 <+36>:	fsw	fa5,0(a5)
     0x8000bd9a <+38>:	addi	a4,a4,1
     0x8000bd9c <+40>:	li	a5,31
     0x8000bd9e <+42>:	bge	a5,a4,0x8000bd80 <fused_nn_pad_layout_transform+=
12>
     0x8000bda2 <+46>:	addi	a3,a3,1
     0x8000bda4 <+48>:	li	a5,31
     0x8000bda6 <+50>:	blt	a5,a3,0x8000bde0 <fused_nn_pad_layout_transform+=
108>
     0x8000bdaa <+54>:	li	a4,0
     0x8000bdac <+56>:	j	0x8000bd9c <fused_nn_pad_layout_transform+40>
     0x8000bdae <+58>:	li	a5,1
     0x8000bdb0 <+60>:	bge	a5,a4,0x8000bdd4 <fused_nn_pad_layout_transform+=
96>
     0x8000bdb4 <+64>:	li	a5,29
     0x8000bdb6 <+66>:	blt	a5,a4,0x8000bdda <fused_nn_pad_layout_transform+=
102>
     0x8000bdba <+70>:	li	a5,28
     0x8000bdbc <+72>:	mul	a5,a3,a5
     0x8000bdc0 <+76>:	add	a5,a5,a4
     0x8000bdc2 <+78>:	lui	a2,0x40000
     0x8000bdc6 <+82>:	addi	a2,a2,-58 # 0x3fffffc6
     0x8000bdca <+86>:	add	a5,a5,a2
     0x8000bdcc <+88>:	slli	a5,a5,0x2
     0x8000bdce <+90>:	add	a5,a5,a0
     0x8000bdd0 <+92>:	flw	fa5,0(a5)
     0x8000bdd2 <+94>:	j	0x8000bd8e <fused_nn_pad_layout_transform+26>
     0x8000bdd4 <+96>:	fmv.w.x	fa5,zero
     0x8000bdd8 <+100>:	j	0x8000bd8e <fused_nn_pad_layout_transform+26>
     0x8000bdda <+102>:	fmv.w.x	fa5,zero
     0x8000bdde <+106>:	j	0x8000bd8e <fused_nn_pad_layout_transform+26>
     0x8000bde0 <+108>:	li	a0,0
     0x8000bde2 <+110>:	ret

  My code breaks on line 0x8000bd8a and then the mcause register is
  loaded with value 0x02 which translates to illegal instruction. Please
  let me know if you need more information about this.

  I also posted this on ZephyrProject in case it is related to the
  Zephyr: https://github.com/zephyrproject-rtos/zephyr/issues/34026

  I have tested on both QEMU 5.1.0 and 5.2.0 versions. I ran the same
  code on qemu riscv64 and didn't have the same problem. Here is the
  assembly code that is generated for the same operation:

  =3D> 0x000000008000b446 <+0>:	ld	a4,0(a0)
     0x000000008000b448 <+2>:	ld	a5,8(a0)
     0x000000008000b44a <+4>:	ld	a0,0(a4)
     0x000000008000b44c <+6>:	ld	a1,0(a5)
     0x000000008000b44e <+8>:	li	a3,0
     0x000000008000b450 <+10>:	j	0x8000b476 <fused_nn_pad_layout_transform+=
48>
     0x000000008000b452 <+12>:	addiw	a5,a3,-2
     0x000000008000b456 <+16>:	li	a2,27
     0x000000008000b458 <+18>:	bgeu	a2,a5,0x8000b480 <fused_nn_pad_layout_t=
ransform+58>
     0x000000008000b45c <+22>:	li	a2,0
     0x000000008000b460 <+26>:	slliw	a5,a3,0x5
     0x000000008000b464 <+30>:	addw	a5,a5,a4
     0x000000008000b466 <+32>:	slli	a5,a5,0x2
     0x000000008000b468 <+34>:	add	a5,a5,a1
     0x000000008000b46a <+36>:	sw	a2,0(a5)
     0x000000008000b46c <+38>:	addiw	a4,a4,1
     0x000000008000b46e <+40>:	li	a5,31
     0x000000008000b470 <+42>:	bge	a5,a4,0x8000b452 <fused_nn_pad_layout_tr=
ansform+12>
     0x000000008000b474 <+46>:	addiw	a3,a3,1
     0x000000008000b476 <+48>:	li	a5,31
     0x000000008000b478 <+50>:	blt	a5,a3,0x8000b4ac <fused_nn_pad_layout_tr=
ansform+102>
     0x000000008000b47c <+54>:	li	a4,0
     0x000000008000b47e <+56>:	j	0x8000b46e <fused_nn_pad_layout_transform+=
40>
     0x000000008000b480 <+58>:	li	a5,1
     0x000000008000b482 <+60>:	bge	a5,a4,0x8000b4a0 <fused_nn_pad_layout_tr=
ansform+90>
     0x000000008000b486 <+64>:	li	a5,29
     0x000000008000b488 <+66>:	blt	a5,a4,0x8000b4a6 <fused_nn_pad_layout_tr=
ansform+96>
     0x000000008000b48c <+70>:	li	a5,28
     0x000000008000b48e <+72>:	mulw	a5,a5,a3
     0x000000008000b492 <+76>:	addw	a5,a5,a4
     0x000000008000b494 <+78>:	addiw	a5,a5,-58
     0x000000008000b498 <+82>:	slli	a5,a5,0x2
     0x000000008000b49a <+84>:	add	a5,a5,a0
     0x000000008000b49c <+86>:	lw	a2,0(a5)
     0x000000008000b49e <+88>:	j	0x8000b460 <fused_nn_pad_layout_transform+=
26>
     0x000000008000b4a0 <+90>:	li	a2,0
     0x000000008000b4a4 <+94>:	j	0x8000b460 <fused_nn_pad_layout_transform+=
26>
     0x000000008000b4a6 <+96>:	li	a2,0
     0x000000008000b4aa <+100>:	j	0x8000b460 <fused_nn_pad_layout_transform=
+26>
     0x000000008000b4ac <+102>:	li	a0,0
     0x000000008000b4ae <+104>:	ret

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922773/+subscriptions

