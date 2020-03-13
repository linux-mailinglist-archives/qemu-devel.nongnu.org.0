Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D811849BC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 15:43:29 +0100 (CET)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jClX6-0006IT-TZ
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 10:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jCkAI-0001j6-SM
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:15:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jCkAH-00061H-3I
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:15:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:37502)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jCkAF-0005w0-83
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:15:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jCkAA-0004lN-PQ
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 13:15:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B73F72E80AB
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 13:15:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Mar 2020 13:09:06 -0000
From: carlosedp <carlosedp@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=david@redhat.com; 
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: boeroboy carlosedp davidhildenbrand ivmn th-huth
X-Launchpad-Bug-Reporter: Ivan Warren (ivmn)
X-Launchpad-Bug-Modifier: carlosedp (carlosedp)
References: <157053356610.22354.6751604707489617887.malonedeb@gac.canonical.com>
Message-Id: <158410494615.28539.8403459740910769647.malone@gac.canonical.com>
Subject: [Bug 1847232] Re: qemu TCG in s390x mode issue with calculating HASH
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 9e4b3a75a31aabaeace7730d3a987020996ee635
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Fri, 13 Mar 2020 10:36:05 -0400
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
Reply-To: Bug 1847232 <1847232@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tried applying the -cpu parameter into Qemu 4.1.1 but I got:

qemu-system-riscv64: unable to find CPU model 'qemu'

My command is:

qemu-system-riscv64 \
    -machine virt \
    -cpu qemu,vx=3Doff \
    -nographic \
    -smp 4 \
    -m 4G \
    -bios fw_payload.bin \
    -device virtio-blk-device,drive=3Dhd0 \
    -object rng-random,filename=3D/dev/urandom,id=3Drng0 \
    -device virtio-rng-device,rng=3Drng0 \
    -drive file=3Driscv64-debianrootfs-qemu.qcow2,format=3Dqcow2,id=3Dhd0 \
    -device virtio-net-device,netdev=3Dusernet \
    -netdev user,id=3Dusernet,hostfwd=3Dtcp::22222-:22"

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1847232

Title:
  qemu TCG in s390x mode issue with calculating HASH

Status in QEMU:
  Fix Released

Bug description:
  When using go on s390x on Debian x64 (buster) (host) and debian s390x
  (sid) (guest) I run into the following problem :

  The following occurs while trying to build a custom project :

  go: github.com/FactomProject/basen@v0.0.0-20150613233007-fe3947df716e:
  Get
  https://proxy.golang.org/github.com/%21factom%21project/basen/@v/v0.0.0-2=
0150613233007-fe3947df716e.mod:
  local error: tls: bad record MAC

  Doing a git bisect I find that this problem only occurs on and after
  commit 08ef92d556c584c7faf594ff3af46df456276e1b

  Before that commit, all works fine. Past this commit, build always
  fails.

  Without any proof, It looks like a hash calculation bug related to
  using z/Arch vector facilities...

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1847232/+subscriptions

