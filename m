Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010AB2EC42F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 20:52:22 +0100 (CET)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxEqy-00075W-JQ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 14:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxEpv-0006fS-Le
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 14:51:15 -0500
Received: from indium.canonical.com ([91.189.90.7]:33714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxEpt-0001sI-71
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 14:51:15 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxEpp-0006YS-5e
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 19:51:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9E3A12E813E
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 19:51:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 Jan 2021 19:43:51 -0000
From: - <1829459@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crockabiscuit laurent-vivier ubi-one-kenubi
X-Launchpad-Bug-Reporter: crocket (crockabiscuit)
X-Launchpad-Bug-Modifier: - (ubi-one-kenubi)
References: <155806778498.21734.945063058665872727.malonedeb@chaenomeles.canonical.com>
Message-Id: <160996223162.17617.12259954542127890043.malone@gac.canonical.com>
Subject: [Bug 1829459] Re: qemu seems to lack support for pid namespace.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: fdf13b8246448abd5f642ce389afddc1798dc96c
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
Reply-To: Bug 1829459 <1829459@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same issue persists in qemu-5.2.0.

-----------------------------------------
# qemu-aarch64 --version
qemu-aarch64 version 5.2.0
Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
-----------------------------------------

Symptoms when running inside the aarch64 chroot, with both aarch64 and x86_=
64 binaries:
-----------------------------------------
# which unshare bash
/usr/bin/unshare
/bin/bash
# file $(!!)
file $(which unshare bash)
/usr/bin/unshare: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SY=
SV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Li=
nux 3.7.0, stripped
/bin/bash:        ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SY=
SV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Li=
nux 3.7.0, stripped
# unshare --pid -- bash -c 'echo hello world'
qemu: qemu_thread_create: Invalid argument
Aborted (core dumped)
# # --- switch to an x86_64 shell _inside_ the chroot
# LD_LIBRARY_PATH=3D/x86_64/lib64 PATH=3D/x86_64/bin:$PATH bash =

# which unshare bash
/x86_64/bin/unshare
/x86_64/bin/bash
# file $(!!)
file $(which unshare bash)
/x86_64/bin/unshare: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV=
), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Lin=
ux 3.2.0, stripped
/x86_64/bin/bash:    ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV=
), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Lin=
ux 3.2.0, stripped
# unshare --pid -- bash -c 'echo hello world' =

hello world
# =

-----------------------------------------

I can share the core dump, in case that's useful.

On this system, the qemu-aarch64 binary on the host is statically built
and binfmt_misc is configured as follows:
-----------------------------------------
:aarch64:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x0=
0\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\xfc\xff\xff\xff\xff\xff\xff\xff\=
xff\xfe\xff\xff:/usr/bin/qemu-aarch64:CF
-----------------------------------------

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1829459

Title:
  qemu seems to lack support for pid namespace.

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

