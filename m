Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826A9BF4F2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 16:21:58 +0200 (CEST)
Received: from localhost ([::1]:37204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDUea-0002h4-3i
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 10:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iDUdT-0002CD-RO
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 10:20:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iDUdS-00061Z-Gq
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 10:20:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:42004)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iDUdS-000606-CK
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 10:20:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iDUdN-00050M-61
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 14:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 16CD82E80CD
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 14:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Sep 2019 14:08:17 -0000
From: Paul Clarke <pc@us.ibm.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc64 testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 7-pc mark-cave-ayland philmd
X-Launchpad-Bug-Reporter: Paul Clarke (7-pc)
X-Launchpad-Bug-Modifier: Paul Clarke (7-pc)
References: <156711057074.6835.13599471410604217618.malonedeb@soybean.canonical.com>
Message-Id: <156950689750.20092.3609250169427301223.malone@wampee.canonical.com>
Subject: [Bug 1841990] Re: instruction 'denbcdq' misbehaving
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19056";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7873f92e804501e803d4df2aad6ba6718cfa72fc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1841990 <1841990@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I haven't tried QEMU 3.1 yet.  Adding to to-do list.

I am narrowing down the remaining failures.  Within the pveclib test suite,=
 there are two tests, one is failing, "pveclib_test".  It contains numerous=
 subtests.  The failing subtests are:
- test_setb_bcdsq
- test_setb_bcdinv
- test_bcdsr
- test_bcdsrrqi

Investigating the first two so far, it looks like "bcdadd." and
"bcdsub." are not operating correctly.  gdb sessions showing the
difference in behavior between QEMU 4.2+patches and hardware (in that
order):

QEMU 4.2+patches:

(gdb) x/i $pc                                                              =
                                         =

=3D> 0x10000698 <vec_setbool_bcdsq+60>:   bcdsub. v0,v0,v1,0               =
                                           =

(gdb) p $vr0.uint128                                                       =
                                         =

$3 =3D 0x9999999999999999999999999999999d                                  =
                                           =

(gdb) p $vr1.uint128                                                       =
                                         =

$4 =3D 0x1d                                                                =
                                           =

(gdb) stepi                                                                =
                                         =

(gdb) p $vr1.uint128                                                       =
                                         =

$5 =3D 0x1d

hardware:

1: x/i $pc
=3D> 0x10000698 <vec_setbool_bcdsq+60>:	bcdsub. v0,v0,v1,0
(gdb) p $vr0.uint128
$2 =3D 0x9999999999999999999999999999999d
(gdb) p $vr1.uint128
$3 =3D 0x1d
(gdb) nexti
(gdb) p $vr0.uint128
$4 =3D 0x9999999999999999999999999999998d

--

QEMU 4.2+patches:

=3D> 0x10000740 <vec_setbool_bcdinv+60>:  bcdadd. v0,v0,v1,0
(gdb) p $vr0.uint128                                      =

$1 =3D 0xa999999999999999000000000000000c                   =

(gdb) p $vr1.uint128                                      =

$2 =3D 0xc                                                  =

(gdb) p $cr                                               =

$4 =3D 0x24000242                                           =

(gdb) nexti                                               =

(gdb) p $vr0.uint128                                      =

$5 =3D 0xffffffffffffffffffffffffffffffff                   =

(gdb) p $cr                             =

$6 =3D 0x24000212                         =


hardware:

=3D> 0x10000740 <vec_setbool_bcdinv+60>:  bcdadd. v0,v0,v1,0
(gdb) p $vr0.uint128
$2 =3D 0xa999999999999999000000000000000c
(gdb) p $vr1.uint128
$3 =3D 0xc
(gdb) p $cr
$4 =3D 0x24000442
(gdb) nexti
(gdb) p $vr0.uint128
$5 =3D 0x999999999999999000000000000000c
(gdb) p $cr
$6 =3D 0x24000412

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1841990

Title:
  instruction 'denbcdq' misbehaving

Status in QEMU:
  New

Bug description:
  Instruction 'denbcdq' appears to have no effect.  Test case attached.

  On ppc64le native:
  --
  gcc -g -O -mcpu=3Dpower9 bcdcfsq.c test-denbcdq.c -o test-denbcdq
  $ ./test-denbcdq
  0x00000000000000000000000000000000
  0x0000000000000000000000000000000c
  0x22080000000000000000000000000000
  $ ./test-denbcdq 1
  0x00000000000000000000000000000001
  0x0000000000000000000000000000001c
  0x22080000000000000000000000000001
  $ ./test-denbcdq $(seq 0 99)
  0x00000000000000000000000000000064
  0x0000000000000000000000000000100c
  0x22080000000000000000000000000080
  --

  With "qemu-ppc64le -cpu power9"
  --
  $ qemu-ppc64le -cpu power9 -L [...] ./test-denbcdq
  0x00000000000000000000000000000000
  0x0000000000000000000000000000000c
  0x0000000000000000000000000000000c
  $ qemu-ppc64le -cpu power9 -L [...] ./test-denbcdq 1
  0x00000000000000000000000000000001
  0x0000000000000000000000000000001c
  0x0000000000000000000000000000001c
  $ qemu-ppc64le -cpu power9 -L [...] ./test-denbcdq $(seq 100)
  0x00000000000000000000000000000064
  0x0000000000000000000000000000100c
  0x0000000000000000000000000000100c
  --

  I started looking at the code, but I got confused rather quickly.
  Could be related to endianness? I think denbcdq arrived on the scene
  before little-endian was a big deal.  Maybe something to do with
  utilizing implicit floating-point register pairs...  I don't think the
  right data is getting to helper_denbcdq, which would point back to the
  gen_fprp_ptr uses in dfp-impl.inc.c (GEN_DFP_T_FPR_I32_Rc).  (Maybe?)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1841990/+subscriptions

