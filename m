Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84382ADB7D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:20:45 +0100 (CET)
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWNw-0001Go-V5
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcW9h-00031L-1Q
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:06:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:55280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcW9e-0004d1-MF
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:06:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcW9Y-00063I-OV
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 16:05:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B89012E8076
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 16:05:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 15:59:34 -0000
From: Peter Maydell <1641861@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell writalnaie
X-Launchpad-Bug-Reporter: Jie (writalnaie)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20161115075112.3631.29997.malonedeb@soybean.canonical.com>
Message-Id: <160502397453.18270.8517410701742937681.malone@soybean.canonical.com>
Subject: [Bug 1641861] Re: ARM QEMU doesn't enforce that RES0 bits in FPSCR
 are non-writeable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: aa8dd751ce5201c212666d72bede8e30788c301f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1641861 <1641861@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU now does enforce these RES0 bits. I had to fix up the inline asm
syntax in the example guest program (which was missing a clobbers list
and generally didn't work with newer gcc):

int printf(const char *format, ...);
unsigned char i0[0x10];
unsigned char o[0x10];
int main() {
    int k;
    asm volatile ("mov r2, %0\n"
        "ldr r0, [r2]\n"
        "vmsr fpscr, r0\n"
        "mov r2, %1\n"
        "vmrs r4, fpscr\n"
        "str r4, [r2]\n" :: "r"((char *)(i0)), "r"((char *)(o)) : "r2", "r4=
", "memory");

    for (k =3D 0; k < 0x10; k++) {
        printf("%02x", o[0x10 - 1 - k]);
    }
    printf("\n");
}
unsigned char i0[0x10] =3D {0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00,=
 0x28, 0x1c, 0xc7, 0x01, 0x00, 0x00, 0x00, 0x00};

but it now prints:
000000000000000000000000ffff009f

which is the same as the quoted hardware value except that QEMU supports fp=
16 arithmetic and so bit 19 (FZ16) is writable. CPUs without fp16 behave as=
 expected:
qemu-arm -cpu cortex-a9 /tmp/arm
000000000000000000000000fff7009f


** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1641861

Title:
  ARM QEMU doesn't enforce that RES0 bits in FPSCR are non-writeable

Status in QEMU:
  Fix Released

Bug description:
  Hi all, we systematically tested the QEMU implementation for emulating
  arm user mode programs. We found that QEMU incorrectly emulate the
  FPSCR register. The following the proof of code:

  /*********** Beginning of the bug: arm.c **********/

  int printf(const char *format, ...);
  unsigned char i0[0x10];
  unsigned char o[0x10];
  int main() {
  =C2=A0=C2=A0=C2=A0=C2=A0int k =3D 0;
  =C2=A0=C2=A0=C2=A0=C2=A0asm("mov r2, %0\n"
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"ldr r0, [r2]\n"::"r"((ch=
ar *)(i0)));;
  =C2=A0=C2=A0=C2=A0=C2=A0asm("vmsr fpscr, r0");
  =C2=A0=C2=A0=C2=A0=C2=A0asm("mov r2, %0\n"
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"vmrs r4, fpscr\n"
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"str r4, [r2]\n"::"r"((ch=
ar *)(o)));;
  =C2=A0=C2=A0=C2=A0=C2=A0for (k =3D 0; k < 0x10; k++)
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("%02x", o[0x10 - 1=
 - k]);
  =C2=A0=C2=A0=C2=A0=C2=A0printf("\n");
  }
  unsigned char i0[0x10] =3D {0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x0=
0, 0x28, 0x1c, 0xc7, 0x01, 0x00, 0x00, 0x00, 0x00};

  /*********** End fo the bug **********/

  When the program is compiled into arm binary code and running on a
  real arm machine, and running in qemu, we have the following result

  $ arm-linux-gnueabihf-gcc arm.c -o arm -static
  $ ./arm
  000000000000000000000000fff7009f
  $ qemu-arm arm
  000000000000000000000000ffffffff

  According to the ARM manual, bits[19, 14:13, 6:5] of FPSCR should be
  reserved as zero. However, arm qemu fails to keep these bits to be
  zero: these bits can be actually modified in QEMU.

  QEMU version is 2.7.0. The operating system is Linux 3.13.0. x86_64.

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1641861/+subscriptions

