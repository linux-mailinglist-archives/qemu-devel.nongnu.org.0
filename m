Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E69213A4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 08:18:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRWC0-0005c7-Os
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 02:18:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hRUpI-0005s5-1B
	for qemu-devel@nongnu.org; Fri, 17 May 2019 00:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hRUpG-0006ob-Jo
	for qemu-devel@nongnu.org; Fri, 17 May 2019 00:50:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:48806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hRUpG-0006lk-EK
	for qemu-devel@nongnu.org; Fri, 17 May 2019 00:50:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hRUpD-0006bb-Fr
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 04:50:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 73BDF2E8076
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 04:50:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 May 2019 04:36:24 -0000
From: crocket <crockabiscuit@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crockabiscuit
X-Launchpad-Bug-Reporter: crocket (crockabiscuit)
X-Launchpad-Bug-Modifier: crocket (crockabiscuit)
Message-Id: <155806778498.21734.945063058665872727.malonedeb@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: dc7c6068cac3c0da05586a34dd0d52ce12a03f7d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Fri, 17 May 2019 02:15:56 -0400
Subject: [Qemu-devel] [Bug 1829459] [NEW] qemu: qemu_thread_create: Invalid
 argument
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1829459 <1829459@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

# Version

qemu-4.0.0
glibc-2.28

# commands used to launch qemu-aarch64 in user mode.

: ${QEMU_BINFMT_FLAGS:=3DOC}

printf '%s\n' ':qemu-
aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\=
xb7\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xf=
e\xff\xff\xff:/usr/bin
/qemu-aarch64:'"${QEMU_BINFMT_FLAGS}" >/proc/sys/fs/binfmt_misc/register

> sudo cp /usr/bin/qemu-aarch64 $RPI/usr/bin
> sudo chroot $RPI /bin/ksh -l

# host

Gentoo Linux amd64

# Guest

Gentoo Linux aarch64

# The problem that I have

"emerge" program fails due to the error, "qemu: qemu_thread_create: Invalid=
 argument".
"emerge" is Gentoo's package manager that compiles and installs packages.

# Workaround

Disable pid-sandbox in emerge.

# How to reproduce the issue

Execute

unshare --pid -- echo hello world

or

python -c "import portage.process; portage.process.spawn(['echo',
'hello', 'world'], unshare_pid=3DTrue)"

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

  # Version
  =

  qemu-4.0.0
  =

  # commands used to launch qemu-aarch64 in user mode.
+ =

+ : ${QEMU_BINFMT_FLAGS:=3DOC}
  =

  printf '%s\n' ':qemu-
  aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x0=
0\xb7\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\=
xfe\xff\xff\xff:/usr/bin
  /qemu-aarch64:'"${QEMU_BINFMT_FLAGS}" >/proc/sys/fs/binfmt_misc/register
  =

  > sudo cp /usr/bin/qemu-aarch64 $RPI/usr/bin
  > sudo chroot $RPI /bin/ksh -l
  =

  # host
  =

  Gentoo Linux amd64
  =

  # Guest
  =

  Gentoo Linux aarch64
  =

  # The problem that I have
  =

  "emerge" program fails due to the error, "qemu: qemu_thread_create: Inval=
id argument".
  "emerge" is Gentoo's package manager that compiles and installs packages.
  =

  # How to reproduce the issue
  =

  Execute
  =

  unshare --pid -- echo hello world
  =

  or
  =

  python -c "import portage.process; portage.process.spawn(['echo',
  'hello', 'world'], unshare_pid=3DTrue)"

** Description changed:

  # Version
  =

  qemu-4.0.0
  =

  # commands used to launch qemu-aarch64 in user mode.
  =

  : ${QEMU_BINFMT_FLAGS:=3DOC}
  =

  printf '%s\n' ':qemu-
  aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x0=
0\xb7\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\=
xfe\xff\xff\xff:/usr/bin
  /qemu-aarch64:'"${QEMU_BINFMT_FLAGS}" >/proc/sys/fs/binfmt_misc/register
  =

  > sudo cp /usr/bin/qemu-aarch64 $RPI/usr/bin
  > sudo chroot $RPI /bin/ksh -l
  =

  # host
  =

  Gentoo Linux amd64
  =

  # Guest
  =

  Gentoo Linux aarch64
  =

  # The problem that I have
  =

  "emerge" program fails due to the error, "qemu: qemu_thread_create: Inval=
id argument".
  "emerge" is Gentoo's package manager that compiles and installs packages.
  =

+ # Workaround
+ =

+ Disable pid-sandbox in emerge.
+ =

  # How to reproduce the issue
  =

  Execute
  =

  unshare --pid -- echo hello world
  =

  or
  =

  python -c "import portage.process; portage.process.spawn(['echo',
  'hello', 'world'], unshare_pid=3DTrue)"

** Description changed:

  # Version
  =

  qemu-4.0.0
+ glibc-2.28
  =

  # commands used to launch qemu-aarch64 in user mode.
  =

  : ${QEMU_BINFMT_FLAGS:=3DOC}
  =

  printf '%s\n' ':qemu-
  aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x0=
0\xb7\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\=
xfe\xff\xff\xff:/usr/bin
  /qemu-aarch64:'"${QEMU_BINFMT_FLAGS}" >/proc/sys/fs/binfmt_misc/register
  =

  > sudo cp /usr/bin/qemu-aarch64 $RPI/usr/bin
  > sudo chroot $RPI /bin/ksh -l
  =

  # host
  =

  Gentoo Linux amd64
  =

  # Guest
  =

  Gentoo Linux aarch64
  =

  # The problem that I have
  =

  "emerge" program fails due to the error, "qemu: qemu_thread_create: Inval=
id argument".
  "emerge" is Gentoo's package manager that compiles and installs packages.
  =

  # Workaround
  =

  Disable pid-sandbox in emerge.
  =

  # How to reproduce the issue
  =

  Execute
  =

  unshare --pid -- echo hello world
  =

  or
  =

  python -c "import portage.process; portage.process.spawn(['echo',
  'hello', 'world'], unshare_pid=3DTrue)"

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829459

Title:
  qemu: qemu_thread_create: Invalid argument

Status in QEMU:
  New

Bug description:
  # Version

  qemu-4.0.0
  glibc-2.28

  # commands used to launch qemu-aarch64 in user mode.

  : ${QEMU_BINFMT_FLAGS:=3DOC}

  printf '%s\n' ':qemu-
  aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x0=
0\xb7\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\=
xfe\xff\xff\xff:/usr/bin
  /qemu-aarch64:'"${QEMU_BINFMT_FLAGS}"
  >/proc/sys/fs/binfmt_misc/register

  > sudo cp /usr/bin/qemu-aarch64 $RPI/usr/bin
  > sudo chroot $RPI /bin/ksh -l

  # host

  Gentoo Linux amd64

  # Guest

  Gentoo Linux aarch64

  # The problem that I have

  "emerge" program fails due to the error, "qemu: qemu_thread_create: Inval=
id argument".
  "emerge" is Gentoo's package manager that compiles and installs packages.

  # Workaround

  Disable pid-sandbox in emerge.

  # How to reproduce the issue

  Execute

  unshare --pid -- echo hello world

  or

  python -c "import portage.process; portage.process.spawn(['echo',
  'hello', 'world'], unshare_pid=3DTrue)"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1829459/+subscriptions

