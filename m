Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458E9FAD1D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 10:37:14 +0100 (CET)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUp5N-0008Ms-9i
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 04:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iUp3p-0007EB-Sz
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 04:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iUp3o-0000Kf-LW
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 04:35:37 -0500
Received: from indium.canonical.com ([91.189.90.7]:38718)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iUp3o-0000JK-F7
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 04:35:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iUp3m-0007eE-K2
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 09:35:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9553E2E80C7
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 09:35:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 Nov 2019 09:26:36 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crobinso laurent-vivier pmaydell
X-Launchpad-Bug-Reporter: Cole Robinson (crobinso)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <157349721480.22191.14354362512617460510.malonedeb@soybean.canonical.com>
Message-Id: <157363719710.21811.1266172365389136223.malone@soybean.canonical.com>
Subject: [Bug 1852115] Re: qemu --static user build fails with fedora rawhide
 glibc-2.30.9000
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 336fb9ae6640123e81aa681a9b20db253c083b0d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1852115 <1852115@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed by 0f1f2d4596ae ("linux-user: remove host stime() syscall")


** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1852115

Title:
  qemu --static user build fails with fedora rawhide glibc-2.30.9000

Status in QEMU:
  Fix Committed

Bug description:
  Building qemu latest git 654efcb511d on fedora rawhide fails with this
  configure line:

  ./configure \
  	--static \
  	--disable-system \
  	--enable-linux-user \
  	--disable-werror \
  	--disable-tools \
  	--disable-capstone

  make fails with:

  /usr/bin/ld: linux-user/syscall.o: in function `do_syscall1':
  /root/qemu.git/linux-user/syscall.c:7769: undefined reference to `stime'
  collect2: error: ld returned 1 exit status

  Seems related to this glibc change:
  https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D12cbde1dae6fa4a9=
a792b64564c7e0debf7544cc

  ...

  +* The obsolete function stime is no longer available to newly linked
  +  binaries and it has been removed from <time.h> header.  This function
  +  has been deprecated in favor of clock_settime.
  +

  # rpm -q glibc
  glibc-2.30.9000-17.fc32.x86_64

  =

  FWIW there's some other messages but I don't think they are fatal:

  /usr/bin/ld: /usr/lib/gcc/x86_64-redhat-linux/9/../../../../lib64/libglib=
-2.0.a(gutils.c.o): in function `g_get_user_database_entry':
  (.text+0x267): warning: Using 'getpwuid' in statically linked application=
s requires at runtime the shared libraries from the glibc version used for =
linking
  /usr/bin/ld: (.text+0xe0): warning: Using 'getpwnam_r' in statically link=
ed applications requires at runtime the shared libraries from the glibc ver=
sion used for linking
  /usr/bin/ld: (.text+0x11e): warning: Using 'getpwuid_r' in statically lin=
ked applications requires at runtime the shared libraries from the glibc ve=
rsion used for linking

  =

  Also, --disable-capstone is required to avoid this error, but it is pre-e=
xisting, not sure if it's a bug, if so I can file a separate one:

    LINK    aarch64-linux-user/qemu-aarch64
  /usr/bin/ld: cannot find -lcapstone
  collect2: error: ld returned 1 exit status

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1852115/+subscriptions

