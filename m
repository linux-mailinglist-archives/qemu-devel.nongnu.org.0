Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B84D3FAC26
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 16:12:07 +0200 (CEST)
Received: from localhost ([::1]:49630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKLXZ-0008MJ-J4
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 10:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mKLWI-0007Y0-Cx
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 10:10:47 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:59914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mKLWF-0007Ps-4h
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 10:10:46 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 33DCA3F360
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 14:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1630246238;
 bh=3066W7d4whq1m2dfZ2S3uj7bILTwHDekZLGX+M41ssI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=LQFsvYJ3o132H3F1h2qIAyWXWi0+CzGsxgTW6SgMZKL179fXmgvVXGHZyl/ULiqrF
 TGw9CDbjSlmFFTukiYV+uRst/Grm1MY5//FSN/D0DDO0f7sVdimpsMzq60DKV3Ecu4
 vEHqeiIFar1ld01rfJdNQmpbkccOIk6nRbo4rEZOZhsr6I39rGGqO1s/mLBlRzhWJm
 MvaRodQ19A/wiMDLgg1fIq6xQpRWbPg04KlffzMQVt7YTY3bYrn3qCRWUgnOQYjrQj
 eeLAAe6tNskC1vSI3Iz7NsPxbJSAw/Jf8/oczZFLTqJKRpePolERiOVzQqkXAUCaoc
 x9iab3GSRGq5A==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 176F92E8135
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 14:10:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 29 Aug 2021 14:00:42 -0000
From: Bruno Haible <1701798@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bruno-clisp cirosantilli cynerva pmaydell
 spirit-rc th-huth
X-Launchpad-Bug-Reporter: Bruno Haible (bruno-clisp)
X-Launchpad-Bug-Modifier: Bruno Haible (bruno-clisp)
References: <149890819992.24827.8096984642709091835.malonedeb@soybean.canonical.com>
Message-Id: <163024564211.11198.9222560679888412977.malone@chaenomeles.canonical.com>
Subject: [Bug 1701798] Re: dynamically linked binaries crash for big-endian
 targets
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="76ef73296f01d64cdfe5c48bfc4daf35cdfde808"; Instance="production"
X-Launchpad-Hash: bb5d90f11bd852c69d05a6c2e18b090847e590e1
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1701798 <1701798@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My last comment ("The issue seems to be fixed, even without the symlink
for /usr/<cpu>-linux-gnu/etc/ld.so.cache.") was incorrect. When this
symlink is set, the program accesses /etc/ld.so.cache after accessing
/usr/<cpu>-linux-gnu/etc/ld.so.cache. In some cases, it works, in some
cases it doesn't =E2=80=94 depending on the contents of /etc/ld.so.cache.

The better fix is to replace /usr/<cpu>-linux-gnu/etc/ld.so.cache with
an empty file:

rm -f "/usr/<cpu>-linux-gnu/etc/ld.so.cache"
mkdir -p "/usr/<cpu>-linux-gnu/etc"
: > "/usr/<cpu>-linux-gnu/etc/ld.so.cache"

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1701798

Title:
  dynamically linked binaries crash for big-endian targets

Status in QEMU:
  Fix Released

Bug description:
  On the targets
    hppa
    m68k
    mips
    mips64
    powerpc
    powerpc64
    s390x
    sparc64
  dynamically linked binaries crash, but statically linked binaries work.
  On the targets
    aarch64
    alpha
    armhf
    powerpc64le
    sh4
  both dynamically linked and statically linked binaries work.

  How to reproduce:

  1) On Ubuntu 16.04, install the packages
  g++-5-aarch64-linux-gnu
  g++-5-alpha-linux-gnu
  g++-5-arm-linux-gnueabihf
  g++-5-hppa-linux-gnu
  g++-5-m68k-linux-gnu
  g++-5-mips-linux-gnu
  g++-5-mips64-linux-gnuabi64
  g++-5-powerpc-linux-gnu
  g++-5-powerpc64-linux-gnu
  g++-5-powerpc64le-linux-gnu
  g++-5-s390x-linux-gnu
  g++-5-sh4-linux-gnu
  g++-5-sparc64-linux-gnu

  2) Install qemu 2.9.0 from source (for m68k, use the 2.7.0-m68k
  code from https://github.com/vivier/qemu-m68k.git):
  $ ../configure --prefix=3D/home/bruno/inst-qemu/2.9.0 --target-list=3Daar=
ch64-softmmu,alpha-softmmu,arm-softmmu,i386-softmmu,m68k-softmmu,mips-softm=
mu,mipsel-softmmu,mips64-softmmu,mips64el-softmmu,ppc-softmmu,ppc64-softmmu=
,s390x-softmmu,sh4-softmmu,sparc-softmmu,sparc64-softmmu,x86_64-softmmu,aar=
ch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,m68k-linux-=
user,mips-linux-user,mipsel-linux-user,mips64-linux-user,mips64el-linux-use=
r,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,s390x-linux-user,sh4-l=
inux-user,sparc-linux-user,sparc64-linux-user --disable-strip --disable-wer=
ror --enable-gtk --enable-vnc
  $ make
  $ make install

  3) Cross-compile the programs:

  $ aarch64-linux-gnu-gcc-5 -O hello.c -o hello.aarch64
  $ alpha-linux-gnu-gcc-5 -O hello.c -o hello.alpha
  $ arm-linux-gnueabihf-gcc-5 -O hello.c -o hello.armhf
  $ hppa-linux-gnu-gcc-5 -O hello.c -o hello.hppa
  $ m68k-linux-gnu-gcc-5 -O hello.c -o hello.m68k
  $ mips-linux-gnu-gcc-5 -O hello.c -o hello.mips
  $ mips64-linux-gnuabi64-gcc-5 -O hello.c -o hello.mips64
  $ powerpc-linux-gnu-gcc-5 -O hello.c -o hello.powerpc
  $ powerpc64-linux-gnu-gcc-5 -O hello.c -o hello.powerpc64
  $ powerpc64le-linux-gnu-gcc-5 -O hello.c -o hello.powerpc64le
  $ s390x-linux-gnu-gcc-5 -O hello.c -o hello.s390x
  $ sh4-linux-gnu-gcc-5 -O hello.c -o hello.sh4
  $ sparc64-linux-gnu-gcc-5 -O hello.c -o hello.sparc64

  4) Run the programs:

  * aarch64 works:
  $ QEMU_LD_PREFIX=3D/usr/aarch64-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-aarc=
h64 hello.aarch64
  Hello world

  * alpha works:
  $ QEMU_LD_PREFIX=3D/usr/alpha-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-alpha =
hello.alpha=20
  Hello world

  * armhf works:
  $ QEMU_LD_PREFIX=3D/usr/arm-linux-gnueabihf ~/inst-qemu/2.9.0/bin/qemu-ar=
m hello.armhf
  Hello world

  * powerpc64le works:
  $ QEMU_LD_PREFIX=3D/usr/powerpc64le-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-=
ppc64le hello.powerpc64le
  Hello world

  * sh4 works:
  $ QEMU_LD_PREFIX=3D/usr/sh4-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-sh4 hell=
o.sh4
  Hello world

  * =3D=3D=3D=3D=3D sparc64 does not work:
  $ QEMU_LD_PREFIX=3D/usr/sparc64-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-spar=
c64 hello.sparc64
  Segmentation fault (core dumped)

  When I copy the file to a machine with `uname -srm` =3D "Linux 4.5.0-2-sp=
arc64 sparc64",
  it works:
  $ ./hello.sparc64
  Hello world

  When I copy the file and its execution environment /usr/sparc64-linux-gnu=
 to the
  same machine and run the binary in a chroot environment:
  # /bin/hello.sparc64=20
  Hello world

  * =3D=3D=3D=3D=3D mips does not work:
  $ QEMU_LD_PREFIX=3D/usr/mips-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-mips he=
llo.mips
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped

  When I copy the file to a machine with `uname -srm` =3D "Linux 3.16.0-4-4=
kc-malta mips",
  it works:
  $ ./hello.mips
  Hello world

  When I copy the file and its execution environment /usr/mips-linux-gnu to=
 the
  same machine and run the binary in a chroot environment:
  # /bin/hello.mips=20
  Hello world

  * =3D=3D=3D=3D=3D mips64 does not work:
  $ QEMU_LD_PREFIX=3D/usr/mips64-linux-gnuabi64 ~/inst-qemu/2.9.0/bin/qemu-=
mips64 hello.mips64
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped

  When I copy the file to a machine with `uname -srm` =3D "Linux 3.16.0-4-5=
kc-malta mips64",
  it works:
  $ ./hello.mips64
  Hello world

  * =3D=3D=3D=3D=3D powerpc does not work:
  $ QEMU_LD_PREFIX=3D/usr/powerpc-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-ppc =
hello.powerpc
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped

  When I copy the file to a machine with `uname -srm` =3D "Linux 3.17.2-200=
.fc20.ppc64p7 ppc64",
  it works:
  $ ./hello.powerpc
  Hello world

  * =3D=3D=3D=3D=3D powerpc64 does not work:
  $ QEMU_LD_PREFIX=3D/usr/powerpc64-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-pp=
c64 hello.powerpc64
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped

  When I copy the file to a machine with `uname -srm` =3D "Linux 3.17.2-200=
.fc20.ppc64p7 ppc64",
  it works:
  $ ./hello.powerpc64
  Hello world

  * =3D=3D=3D=3D=3D s390x does not work:
  $ QEMU_LD_PREFIX=3D/usr/s390x-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-s390x =
hello.s390x
  <hangs>
  $ QEMU_LD_PREFIX=3D/usr/s390x-linux-gnu ~/inst-qemu/2.8.1/bin/qemu-s390x =
hello.s390x
  qemu-s390x: /media/develdata/devel/build/qemu-2.8.1/translate-all.c:175: =
tb_lock: Assertion `!have_tb_lock' failed.
  Segmentation fault (core dumped)

  When I copy the file to a machine with `uname -srm` =3D "Linux 3.16.0-4-s=
390x s390x",
  it works:
  $ ./hello.s390x
  Hello world

  * =3D=3D=3D=3D=3D hppa does not work:
  $ QEMU_LD_PREFIX=3D/usr/hppa-linux-gnu ~/inst-qemu/2.9.0/bin/qemu-hppa he=
llo.hppa
  Segmentation fault (core dumped)

  * =3D=3D=3D=3D=3D m68k does not work:
  $ QEMU_LD_PREFIX=3D/usr/m68k-linux-gnu QEMU_CPU=3Dm68020 ~/inst-qemu/2.9.=
0/bin/qemu-m68k hello.m68k
  qemu: uncaught target signal 4 (Illegal instruction) - core dumped
  $ QEMU_LD_PREFIX=3D/usr/m68k-linux-gnu QEMU_CPU=3Dm68020 ~/inst-qemu/2.7.=
0-m68k/bin/qemu-m68k hello.m68k
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped

 =20
  The set of targets where it does not work is exactly the big-endian targe=
ts.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1701798/+subscriptions


