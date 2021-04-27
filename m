Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415236CC40
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 22:27:00 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbUIM-0000Oj-TI
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 16:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbUHH-0008KD-Py
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 16:25:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:42620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbUHF-0000PE-D3
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 16:25:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lbUHC-0001IU-H3
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 20:25:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 72A152E815D
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 20:25:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Apr 2021 20:17:32 -0000
From: Ruixin Bao <1893040@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user s390x tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange davidhildenbrand gsalgaon nthorat
 particular-qemu ruixinbao
X-Launchpad-Bug-Reporter: Guirish Salgaonkar (gsalgaon)
X-Launchpad-Bug-Modifier: Ruixin Bao (ruixinbao)
References: <159844225257.1396.12890490778938419036.malonedeb@wampee.canonical.com>
Message-Id: <161955465264.16631.504602128512379933.malone@chaenomeles.canonical.com>
Subject: [Bug 1893040] Re: External modules retreval using Go1.15 on s390x
 appears to have checksum and ECDSA verification issues
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 5af14a32eaee7ec06f5d566e9012edca4898f04a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1893040 <1893040@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello @davidhildenbrand, I have been looking into this bug recently. So
far, I noticed a few things:

1: Similarly as described in comment #5, I also had success building the
go file described in the reproducing steps in #4 using Ubunutu-20.04
with recent qemu-system-s390x (I did it 1 - 2 weeks ago, so it is likely
qemu-6.0rc2 or rc3)

2: Similarly as described in commment #9, when qemu-user-static is used,
there are "ECDSA verification failure". The failure is using multiarch
/qemu-user-static with qemu-s390x 6.0.0-rc3 statically built from source
and copied in when building the container

3: Debugging in a container has been really difficult for me, so I used
chroot and debootstrap to emulate a full s390x file system on a x86 host
and copy the qemu-s390x binary in. I find that I can still reproduce the
error similarly as the container. However, I also find that if I turn
the vector instruction off with vx=3Doff and split the go command into
multiple steps, I am no longer able to reproduce the error. The reason
for splitting the commands is that it looks like go build first calls go
mod tidy, then calls go tool compile to compile the program. Through
experimentation, those appear to call some other binary so the vx=3Doff is
dropped.

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94 Build steps =E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94
root@skewered1:~/example.com/hello# ls                                     =
                                            =

go.mod  hello.go                                                           =
                                            =

root@skewered1:~/example.com/hello# vim go.mod                             =
                                                                           =
                                              =

root@skewered1:~/example.com/hello# ls                                     =
                                            =

go.mod  hello.go                                                           =
                                            =

root@skewered1:~/example.com/hello# uname -a                               =
                                            =

Linux xxx (hidden) 5.4.0-72-generic #80-Ubuntu SMP Mon Apr 12 17:35:00 UTC =
2021 s390x GNU/Linux              =

root@skewered1:~/example.com/hello# file /usr/bin/qemu-s390x-6.0rc5-static =
                                            =

/usr/bin/qemu-s390x-6.0rc5-static: ELF 64-bit LSB shared object, x86-64, ve=
rsion 1 (GNU/Linux), dynamically linked, Bui
ldID[sha1]=3D28d90b247aa25813da5b24d07707863f089a78eb, for GNU/Linux 3.2.0,=
 stripped                                     =

root@skewered1:~/example.com/hello# /usr/bin/qemu-s390x-6.0rc5-static --ver=
sion
qemu-s390x version 5.2.95 (v6.0.0-rc5)                     =

Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
root@skewered1:~/example.com/hello#                        =

root@skewered1:~/example.com/hello# go version                             =
     =

                                                                           =
                                           =

go version go1.15.11 linux/s390x                                           =
                                            =

root@skewered1:~/example.com/hello#                                        =
                                            =

root@skewered1:~/example.com/hello# which go                               =
                         =

/usr/local/go/bin/go
root@skewered1:~/example.com/hello# /usr/bin/qemu-s390x-6.0rc5-static /usr/=
local/go/bin/go build . =

go: finding module for package rsc.io/quote
hello.go:4:5: module rsc.io/quote: Get "https://proxy.golang.org/rsc.io/quo=
te/@v/list": tls: invalid signature by the server certificate: ECDSA verifi=
cation failure
root@skewered1:~/example.com/hello# /usr/bin/qemu-s390x-6.0rc5-static -cpu =
qemu,vx=3Doff /usr/local/go/bin/go mod tidy =

go: finding module for package rsc.io/quote
go: downloading rsc.io/quote v1.5.2
go: found rsc.io/quote in rsc.io/quote v1.5.2
go: downloading rsc.io/sampler v1.3.0
go: downloading golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c
root@skewered1:~/example.com/hello# /usr/bin/qemu-s390x-6.0rc5-static -cpu =
qemu,vx=3Doff /usr/local/go/bin/go build .  =

root@skewered1:~/example.com/hello# ls
go.mod  go.sum  hello  hello.go
root@skewered1:~/example.com/hello# file hello
hello: ELF 64-bit MSB executable, IBM S/390, version 1 (SYSV), statically l=
inked, not stripped
root@skewered1:~/example.com/hello# ./hello =

Hello, world.

4: The above findings make me think that there is some discrepancy
between vector instructions handling for qemu user mode vs system mode.
Additionally, running tests with vx=3Doff in go/src/crypto/ecdsa will make
the test pass while without vx=3Doff, there remains to be a problem.
Currently, I am looking into the go source code hoping to narrow down
the problem. It looks like the difference (between qemu-user and s390x
native host) happens during initTable() function at
crypto/elliptic/p256_s390x.go.

I hope the above findings make sense. It will be great if you can share
some possible insights for where that discrepancy (between qemu-user and
qemu-system) could be. Much appreciated.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893040

Title:
   External modules retreval using Go1.15 on s390x appears to have
  checksum and ECDSA verification issues

Status in QEMU:
  New

Bug description:
  We are observing issue while building go-runner image and we suspect it i=
s due to QEMU version being used. As referred in below issue:
  https://github.com/golang/go/issues/40949

  We tried to build go-runner image using go1.15 and register QEMU
  (docker run --rm --privileged multiarch/qemu-user-
  static@sha256:c772ee1965aa0be9915ee1b018a0dd92ea361b4fa1bcab5bbc033517749=
b2af4
  --reset -p yes) as mentioned in PR
  https://github.com/kubernetes/release/pull/1499. We observed below
  failure during build:

  -------------------------------------------------------------------------=
--------
  ERROR: executor failed running [/bin/sh -c CGO_ENABLED=3D0 GOOS=3Dlinux G=
OARCH=3D${ARCH}     go build -ldflags '-s -w -buildid=3D -extldflags "-stat=
ic"'     -o go-runner ${package}]: buildkit-runc did not terminate successf=
ully
  ------
  =C2=A0> [builder 7/7] RUN CGO_ENABLED=3D0 GOOS=3Dlinux GOARCH=3D${ARCH}  =
   go build -ldflags '-s -w -buildid=3D -extldflags "-static"'     -o go-ru=
nner .:
  ------
  failed to solve: rpc error: code =3D Unknown desc =3D executor failed run=
ning [/bin/sh -c CGO_ENABLED=3D0 GOOS=3Dlinux GOARCH=3D${ARCH}     go build=
 -ldflags '-s -w -buildid=3D -extldflags "-static"'     -o go-runner ${pack=
age}]: buildkit-runc did not terminate successfully
  Makefile:52: recipe for target 'container' failed
  make: *** [container] Error 1
  -------------------------------------------------------------------------=
--------

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893040/+subscriptions

