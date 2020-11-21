Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC31E2BC29C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 00:12:08 +0100 (CET)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgc35-0001OE-Uh
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 18:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgc1m-0000qy-W2
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:10:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:54986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgc1k-0002Dd-3t
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 18:10:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgc1i-0007Zp-FR
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:10:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 71B7A2E8138
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 23:10:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 23:05:16 -0000
From: Peter Maydell <1843205@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: float libm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahuszagh pmaydell
X-Launchpad-Bug-Reporter: Alexander Huszagh (ahuszagh)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <156799031829.6257.13539682604144427187.malonedeb@soybean.canonical.com>
Message-Id: <160599991667.20086.12934607365829826352.malone@gac.canonical.com>
Subject: [Bug 1843205] Re: Inaccurate Fmod on i386
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: e8996af447ce485927f994e2fc1e5f3d4d0edab3
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1843205 <1843205@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On current head-of-git QEMU I get the correct answer. I think this was
probably fixed by the reimplementation of the 'fprem' emulation in
commit 5ef396e2ba86, which was in the 5.1.0 release.


** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843205

Title:
  Inaccurate Fmod on i386

Status in QEMU:
  Fix Released

Bug description:
  # Qemu Version

  ```bash
  $ qemu-i386 --version
  qemu-i386 version 3.0.1 (qemu-3.0.1-4.fc29)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
  ```

  # Failing Source Code (C)

  ```c
  #include <math.h>
  #include <stdio.h>

  int main()
  {
      double x =3D 29860476080414620.0;
      double y =3D 17.0;
      double z =3D fmod(x, y);
      printf("%f\n", z);
      return 0;
  }
  ```

  The code was compiled with GCC (8.3.1) on x86-64 with the flags `-O3
  -m32 -lm -static`.

  # Emitted (Annotated) Assembly

  In order to facilitate debugging the issue, the following assembly was
  generated to show nothing unusual occurred during compilation. The
  assembly was generated with flags `-S -O3 -m32 -lm`, and then
  annotated to show the operands to fmod.

  ```asm
  	.file	"a.c"
  	.text
  	.section	.rodata.str1.1,"aMS",@progbits,1
  .LC2:
  	.string	"%f\n"
  	.section	.text.startup,"ax",@progbits
  	.p2align 4,,15
  	.globl	main
  	.type	main, @function
  main:
  .LFB16:
  	.cfi_startproc
  	leal	4(%esp), %ecx
  	.cfi_def_cfa 1, 0
  	andl	$-16, %esp
  	pushl	-4(%ecx)
  	pushl	%ebp
  	.cfi_escape 0x10,0x5,0x2,0x75,0
  	movl	%esp, %ebp
  	pushl	%ecx
  	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
  	subl	$4, %esp
  	pushl	$1076953088				; high 32-bits of double for y
  	pushl	$0 						; low 32-bits of double for y
  	pushl	$1130005884				; high 32-bits of double for x
  	pushl	$2003187687				; low 32-bits of double for x
  	call	fmod
  	movl	$.LC2, (%esp)
  	fstpl	4(%esp)
  	call	printf
  	movl	-4(%ebp), %ecx
  	.cfi_def_cfa 1, 0
  	addl	$16, %esp
  	xorl	%eax, %eax
  	leave
  	.cfi_restore 5
  	leal	-4(%ecx), %esp
  	.cfi_def_cfa 4, 4
  	ret
  	.cfi_endproc
  .LFE16:
  	.size	main, .-main
  	.ident	"GCC: (GNU) 8.3.1 20190223 (Red Hat 8.3.1-2)"
  	.section	.note.GNU-stack,"",@progbits
  ```

  # Result

  Running the compiled binary on x86_64 produces the expected value of
  `15.000000`, while using `qemu-i386 <binary>` produces the unexpected
  result of `-4.000000`.

  This was tested against:

  1. Qemu 3.0.1 for Fedora 29.
  2. Qemu 4.1.0 built from source, downloaded from https://download.qemu.or=
g/qemu-4.1.0.tar.xz
  3. Qemu built-from-source against commit 90b1e3afd33226b6078fec6d77a18373=
712a975c.

  # Building Qemu

  Qemu built-from-source was compiled as follows:

  ```bash
  mkdir build && cd build
  ../configure --disable-kvm --target-list=3D"i386-linux-user"
  make -j 5
  ```

  # Results

  All built versions of Qemu running the 32-bit failed to produce the
  accurate result. Using qemu-x86_64 against an x86_64 binary built from
  the same C source code produces correct results. Running the 32-bit
  binary natively produces the correct result.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843205/+subscriptions

