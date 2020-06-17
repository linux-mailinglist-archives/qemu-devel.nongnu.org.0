Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D173F1FD803
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 23:59:28 +0200 (CEST)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlg5f-0005DY-Sy
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 17:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlg25-0000Jf-C1
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 17:55:45 -0400
Received: from indium.canonical.com ([91.189.90.7]:47866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jlg23-0000cQ-Di
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 17:55:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jlg21-0003NY-47
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:55:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1C7742E80E7
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:55:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2020 21:50:37 -0000
From: Nelson H F Beebe <1883984@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nhfbeebe
X-Launchpad-Bug-Reporter: Nelson H F Beebe (nhfbeebe)
X-Launchpad-Bug-Modifier: Nelson H F Beebe (nhfbeebe)
Message-Id: <159243063748.16697.11009205973276249282.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1883984] [NEW] QEMU S/390x sqxbr (128-bit IEEE 754 square root)
 crashes qemu-system-s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5dbfe743ba17b017304a10f52b78bf6917727df5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 17:50:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1883984 <1883984@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

In porting software to guest Ubuntu 18.04 and 20.04 VMs for S/390x, I disco=
vered
that some of my own numerical programs, and also a GNU configure script for=
 at
least one package with CC=3Dclang, would cause an instant crash of the VM, =
sometimes
also destroying recently opened files, and producing long strings of NUL ch=
aracters
in /var/log/syslog in the S/390 guest O/S.

Further detective work narrowed the cause of the crash down to a single IBM=
 S/390
instruction: sqxbr (128-bit IEEE 754 square root).  Here is a one-line prog=
ram
that when compiled and run on a VM hosted on QEMUcc emulator version 4.2.0 =

(Debian 1:4.2-3ubuntu6.1) [hosted on Ubuntu 20.04 on a Dell Precision 7920 =

workstation with an Intel Xeon Platinum 8253 CPU],  and also on QEMU emulat=
or =

version 5.0.0, reproducibly produces a VM crash under qemu-system-s390x.

% cat bug-sqrtl-one-line.c
int main(void) { volatile long double x, r; x =3D 4.0L; __asm__ __volatile_=
_("sqxbr %0, %1" : "=3Df" (r) : "f" (x)); return (0);}

% cc bug-sqrtl-one-line.c && ./a.out
Segmentation fault (core dumped)

The problem code may be the function float128_sqrt() defined in qemu-5.0.0/=
fpu/softfloat.c
starting at line 7619.  I have NOT attempted to run the qemu-system-s390x e=
xecutable
under a debugger.  However, I observe that S/390 is the only CPU family tha=
t I know of,
except possibly for a Fujitsu SPARC-64, that has a 128-bit square root in h=
ardware.
Thus, this instruction bug may not have been seen before.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883984

Title:
  QEMU S/390x sqxbr (128-bit IEEE 754 square root) crashes qemu-system-
  s390x

Status in QEMU:
  New

Bug description:
  In porting software to guest Ubuntu 18.04 and 20.04 VMs for S/390x, I dis=
covered
  that some of my own numerical programs, and also a GNU configure script f=
or at
  least one package with CC=3Dclang, would cause an instant crash of the VM=
, sometimes
  also destroying recently opened files, and producing long strings of NUL =
characters
  in /var/log/syslog in the S/390 guest O/S.

  Further detective work narrowed the cause of the crash down to a single I=
BM S/390
  instruction: sqxbr (128-bit IEEE 754 square root).  Here is a one-line pr=
ogram
  that when compiled and run on a VM hosted on QEMUcc emulator version 4.2.=
0 =

  (Debian 1:4.2-3ubuntu6.1) [hosted on Ubuntu 20.04 on a Dell Precision 792=
0 =

  workstation with an Intel Xeon Platinum 8253 CPU],  and also on QEMU emul=
ator =

  version 5.0.0, reproducibly produces a VM crash under qemu-system-s390x.

  % cat bug-sqrtl-one-line.c
  int main(void) { volatile long double x, r; x =3D 4.0L; __asm__ __volatil=
e__("sqxbr %0, %1" : "=3Df" (r) : "f" (x)); return (0);}

  % cc bug-sqrtl-one-line.c && ./a.out
  Segmentation fault (core dumped)

  The problem code may be the function float128_sqrt() defined in qemu-5.0.=
0/fpu/softfloat.c
  starting at line 7619.  I have NOT attempted to run the qemu-system-s390x=
 executable
  under a debugger.  However, I observe that S/390 is the only CPU family t=
hat I know of,
  except possibly for a Fujitsu SPARC-64, that has a 128-bit square root in=
 hardware.
  Thus, this instruction bug may not have been seen before.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883984/+subscriptions

