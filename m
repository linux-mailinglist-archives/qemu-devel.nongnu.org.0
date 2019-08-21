Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF97C96FB2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 04:42:00 +0200 (CEST)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0GZT-0005xZ-Jl
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 22:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i0GYN-0005CV-9O
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 22:40:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i0GYL-0006uk-Uo
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 22:40:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:55918)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i0GYL-0006tS-Oj
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 22:40:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i0GYJ-00038K-QW
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 02:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C77C52E8070
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 02:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Aug 2019 02:33:50 -0000
From: fangying <1840865@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: yorifang
X-Launchpad-Bug-Reporter: fangying (yorifang)
X-Launchpad-Bug-Modifier: fangying (yorifang)
Message-Id: <156635483019.23159.9094249492846476541.malonedeb@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: b8eee8ec939871b78ff512079be7b67393944a1f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1840865] [NEW] qemu crashes when doing iotest on
 virtio-9p filesystem
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
Reply-To: Bug 1840865 <1840865@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Qemu crashes when doing avocado-vt test on virtio-9p filesystem.
This bug can be reproduced running https://github.com/autotest/tp-qemu/blob=
/master/qemu/tests/9p.py.
The crash stack goes like:

Program terminated with signal SIGSEGV, Segmentation fault.
#0  v9fs_mark_fids_unreclaim (pdu=3Dpdu@entry=3D0xaaab00046868, path=3Dpath=
@entry=3D0xffff851e2fa8)
    at hw/9pfs/9p.c:505
#1  0x0000aaaae3585acc in v9fs_unlinkat (opaque=3D0xaaab00046868) at hw/9pf=
s/9p.c:2590
#2  0x0000aaaae3811c10 in coroutine_trampoline (i0=3D<optimized out>, i1=3D=
<optimized out>)
    at util/coroutine-ucontext.c:116
#3  0x0000ffffa13ddb20 in ?? () from /lib64/libc.so.6
Backtrace stopped: not enough registers or memory available to unwind furth=
er

A segment fault is triggered at hw/9pfs/9p.c line 505

    for (fidp =3D s->fid_list; fidp; fidp =3D fidp->next) {
        if (fidp->path.size !=3D path->size) {     # fidp is invalid =

            continue;
        }

(gdb) p path
$10 =3D (V9fsPath *) 0xffff851e2fa8
(gdb) p *path
$11 =3D {size =3D 21, data =3D 0xaaaafed6f420 "./9p_test/p2a1/d0/f1"}
(gdb) p *fidp
Cannot access memory at address 0x101010101010101
(gdb) p *pdu
$12 =3D {size =3D 19, tag =3D 54, id =3D 76 'L', cancelled =3D 0 '\000', co=
mplete =3D {entries =3D {
      sqh_first =3D 0x0, sqh_last =3D 0xaaab00046870}}, s =3D 0xaaab000454b=
8, next =3D {
    le_next =3D 0xaaab000467c0, le_prev =3D 0xaaab00046f88}, idx =3D 88}
(gdb) =


Address Sanitizer shows error and saying that there is a heap-use-after-
free on *fidp*.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1840865

Title:
  qemu crashes when doing iotest on  virtio-9p filesystem

Status in QEMU:
  New

Bug description:
  Qemu crashes when doing avocado-vt test on virtio-9p filesystem.
  This bug can be reproduced running https://github.com/autotest/tp-qemu/bl=
ob/master/qemu/tests/9p.py.
  The crash stack goes like:

  Program terminated with signal SIGSEGV, Segmentation fault.
  #0  v9fs_mark_fids_unreclaim (pdu=3Dpdu@entry=3D0xaaab00046868, path=3Dpa=
th@entry=3D0xffff851e2fa8)
      at hw/9pfs/9p.c:505
  #1  0x0000aaaae3585acc in v9fs_unlinkat (opaque=3D0xaaab00046868) at hw/9=
pfs/9p.c:2590
  #2  0x0000aaaae3811c10 in coroutine_trampoline (i0=3D<optimized out>, i1=
=3D<optimized out>)
      at util/coroutine-ucontext.c:116
  #3  0x0000ffffa13ddb20 in ?? () from /lib64/libc.so.6
  Backtrace stopped: not enough registers or memory available to unwind fur=
ther

  A segment fault is triggered at hw/9pfs/9p.c line 505

      for (fidp =3D s->fid_list; fidp; fidp =3D fidp->next) {
          if (fidp->path.size !=3D path->size) {     # fidp is invalid =

              continue;
          }

  (gdb) p path
  $10 =3D (V9fsPath *) 0xffff851e2fa8
  (gdb) p *path
  $11 =3D {size =3D 21, data =3D 0xaaaafed6f420 "./9p_test/p2a1/d0/f1"}
  (gdb) p *fidp
  Cannot access memory at address 0x101010101010101
  (gdb) p *pdu
  $12 =3D {size =3D 19, tag =3D 54, id =3D 76 'L', cancelled =3D 0 '\000', =
complete =3D {entries =3D {
        sqh_first =3D 0x0, sqh_last =3D 0xaaab00046870}}, s =3D 0xaaab00045=
4b8, next =3D {
      le_next =3D 0xaaab000467c0, le_prev =3D 0xaaab00046f88}, idx =3D 88}
  (gdb) =


  Address Sanitizer shows error and saying that there is a heap-use-
  after-free on *fidp*.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1840865/+subscriptions

