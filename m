Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4386D064
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 16:51:22 +0200 (CEST)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho7ke-0006gC-JY
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 10:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1ho7kR-0006GS-GU
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 10:51:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ho7kQ-0001Zk-AZ
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 10:51:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:59818)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ho7kQ-0001Ym-39
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 10:51:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ho7kN-000756-6q
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 14:51:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BAB822E80CE
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 14:51:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jul 2019 14:45:33 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: javascript js softfp
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dibalavs
X-Launchpad-Bug-Reporter: Vasily Dybala (dibalavs)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <154987502048.21937.8846396923018937713.malonedeb@chaenomeles.canonical.com>
Message-Id: <156346113379.17989.18282404940789887161.launchpad@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 26b05e689df63c5ff11b72eb87bbaf16e69a7d57
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1815423] Re: x86_64 TCG: Incorrect floating point
 cast to int.
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
Reply-To: Bug 1815423 <1815423@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Summary changed:

- Incorrect floating point cast to int.
+ x86_64 TCG: Incorrect floating point cast to int.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1815423

Title:
  x86_64 TCG: Incorrect floating point cast to int.

Status in QEMU:
  New

Bug description:
  I used exaample from:
  https://stackoverflow.com/questions/3986795/what-is-the-result-of-casting=
-float-inf-inf-and-nan-to-integer-in-c

  #include <stdio.h>
  #include <math.h>

  int main(int argc, char** argv) {
    float a =3D INFINITY;
    float b =3D -INFINITY;
    float c =3D NAN;

    printf("float %f %f %f\n", a, b, c); =

    printf("int %d %d %d\n", (int) a, (int) b, (int) c); =

    printf("uint %u %u %u\n", (unsigned int) a, (unsigned int) b, (unsigned=
 int) c); =

    printf("lint %ld %ld %ld\n", (long int) a, (long int) b, (long int) b); =

    printf("luint %lu %lu %lu\n", (unsigned long int) a, (unsigned long int=
) b, (unsigned long int) c); =


    return 0;
  }

  And got different results on real computer and on qemu.

  output from real HW is the same as on stackoverflow:

  $ gcc test.c && ./a.out =

  float inf -inf nan
  int -2147483648 -2147483648 -2147483648
  uint 0 0 0
  lint -9223372036854775808 -9223372036854775808 -9223372036854775808
  luint 0 9223372036854775808 9223372036854775808

  =

  But on qemu I got another results:

  float inf -inf nan
  int 2147483647 -2147483648 2147483647
  uint 4294967295 0 4294967295
  lint 9223372036854775807 -9223372036854775808 -9223372036854775808
  luint 18446744073709551615 9223372036854775808 9223372036854775807

  qemu launch string:
  /qemu-system-x86_64 -m 1024 -cpu core2duo -serial stdio -netdev user,id=
=3Dnetwork0 -device e1000,netdev=3Dnetwork0 -kernel my_kernel

  =

  qemu version:
  x86_64-softmmu/qemu-system-x86_64 --version
  QEMU emulator version 3.1.50 (v3.1.0-1676-ge47f81b617-dirty)
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

  =

  This bug affect some javascript (surprise) calculations:

  var conversion =3D "01234567890";
  var x;
  var result =3D conversion[x & 42];
  console.log(result)

  =

  In example, var x is "undefined"
  and when do calculation "x & 42" on js we should get 0 (it is documented =
feature), but actually got "42"

  and "result" sould be "0" but actually we got "undefined"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1815423/+subscriptions

