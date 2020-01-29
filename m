Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BECC14D064
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 19:21:37 +0100 (CET)
Received: from localhost ([::1]:49864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwry3-0006K1-Md
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 13:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iwrxE-0005s4-Vu
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 13:20:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iwrxD-0007FR-LE
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 13:20:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:40782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iwrxD-0007Dh-Fd
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 13:20:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iwrxB-00008K-9X
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 18:20:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 341D12E80C8
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 18:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jan 2020 18:07:35 -0000
From: Philippe Vaucher <philippe.vaucher@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philippe-vaucher pmaydell
X-Launchpad-Bug-Reporter: Philippe Vaucher (philippe-vaucher)
X-Launchpad-Bug-Modifier: Philippe Vaucher (philippe-vaucher)
References: <158022582642.18726.3284794136336139049.malonedeb@gac.canonical.com>
Message-Id: <158032125582.5376.11277721695720530499.malone@chaenomeles.canonical.com>
Subject: [Bug 1861161] Re: qemu-arm-static stuck with 100% CPU when
 cross-compiling emacs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: d074ffb2d4613836d0ea73e643046ebbe3e24c71
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
Reply-To: Bug 1861161 <1861161@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Okay, currently testing XFS. Using newer version of glibc on alpine
triggered other problems, like 0% CPU processes stuck on FUTEX_WAIT.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861161

Title:
  qemu-arm-static stuck with 100% CPU when cross-compiling emacs

Status in QEMU:
  New

Bug description:
  Hello,

  I'm trying to build multi-arch docker images for
  https://hub.docker.com/r/silex/emacs.

  Here is the machine I'm building on (hetzner cloud machine):

  root@ubuntu-4gb-fsn1-1:~# lsb_release -a
  No LSB modules are available.
  Distributor ID: Ubuntu
  Description:    Ubuntu 18.04.3 LTS
  Release:        18.04
  Codename:       bionic
  root@ubuntu-4gb-fsn1-1:~# uname -a
  Linux ubuntu-4gb-fsn1-1 4.15.0-74-generic #84-Ubuntu SMP Thu Dec 19 08:06=
:28 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

  Whenever I try to build the following alpine Dockerfile
  https://gitlab.com/Silex777/docker-
  emacs/blob/master/26.3/alpine/3.9/dev/Dockerfile like this:

  $ sysctl kernel.randomize_va_space=3D0
  $ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
  $ docker build --pull -t test --platform arm .

  It builds fine until this:

  root@ubuntu-4gb-fsn1-1:~# ps -ef | grep qemu
  root     26473 26465 99 14:26 pts/0    01:59:58 /usr/bin/qemu-arm-static =
../src/bootstrap-emacs -batch --no-site-file --no-site-lisp --eval (setq lo=
ad-prefer-newer t) -f batch-byte-compile emacs-lisp/macroexp.el

  This is supposed to take a few seconds, but here it takes 100% CPU and
  never ends. When I strace the process I see a never ending loop like
  this:

  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)
  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)
  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)
  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)
  getdents64(5, /* 0 entries */, 2048)    =3D 0
  lseek(5, 0, SEEK_SET)                   =3D 0
  getdents64(5, /* 5 entries */, 2048)    =3D 120
  tgkill(5875, 5878, SIGRT_2)             =3D -1 EAGAIN (Resource temporari=
ly unavailable)

  It happens with all the QEMU versions I tested:
  - 2.11.1 (OS version)
  - 4.1.1-1 (from multiarch/qemu-user-static:4.1.1-1)
  - 4.2.0-2 (from multiarch/qemu-user-static)

  Any ideas of what I could do to debug it further?

  Kind regards,
  Philippe

  p.s: Everything builds fine when the base image is ubuntu. I also had
  similar hangs with basic commands like "apt-get install foo"
  sometimes.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861161/+subscriptions

