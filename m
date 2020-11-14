Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CEF2B2BC8
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 07:42:49 +0100 (CET)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdpGp-0006Wm-V9
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 01:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdpF0-00063Q-68
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 01:40:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:35224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdpEx-0002fZ-OU
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 01:40:53 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdpEw-0006nE-2B
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 06:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0EB482E8041
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 06:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2020 06:31:10 -0000
From: Thomas Huth <1799919@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pmaydell th-huth yannick-duchene
X-Launchpad-Bug-Reporter: =?utf-8?b?SGlib3U1N8KgKFlhbm5pY2vCoER1Y2jDqm5l?=
 =?utf-8?q?=29_=28yannick-duchene=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154046086166.20410.16328785764794651694.malonedeb@gac.canonical.com>
Message-Id: <160533547018.1224.14955333343125810480.malone@gac.canonical.com>
Subject: [Bug 1799919] Re: IDE HDD emulation random read/write errors
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: db696d6c9c4ab6a387a8fd9135e0e7ee4f15cdd8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 22:45:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1799919 <1799919@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, Peter! Looking at the bug description again and at the point in tim=
e when it happened, this was maybe a bug that we also saw with FreeDOS, cau=
sed by the CONFIG_ATA_DMA setting in Seabios, which had been fixed here: ht=
tps://patchwork.kernel.org/project/qemu-devel/patch/20190318130809.31670-3-=
kraxel@redhat.com/
Anyway, let's mark this as fixed, if it happens again, then please re-open =
or file a new bug.

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1799919

Title:
  IDE HDD emulation random read/write errors

Status in QEMU:
  Fix Released

Bug description:
  I unfortunately can=E2=80=99t give more tracks other than how to reproduc=
e the
  bug, especially that the bug occurs randomly.

  Basically, I=E2=80=99m trying to install DOS 6.22 on an emulated ISA mach=
ine,
  and it fails, DOS complaining about read or write error on drive C.
  Repeating the operation multiple time, I see it occurs at random
  stage, sometime even before it partitions the drive, sometime when it
  formats the drive, sometime when it copies the files from the floppy
  to the drive.

  To test it, unpack the attached archive and execute `./run` from the
  extracted directory. The archive contains three raw floppy images for
  installing DOS 6.22, and a Bourne Shell script which invokes QEmu.
  Just press enter at any installation stage, the bug may occurs at any
  stage.

  I tried with `cache=3Dnone` to be sure it=E2=80=99s not a cache issue, bu=
t its
  the same whatever the cache policy is.

  Version and environment: using QEmu 3.0 on Ubuntu 16.04 on a 32 bits
  DELL Inspiron 9400 (not an emulation, that=E2=80=99s my real laptop).

  For why I=E2=80=99m using QEmu for this: the installation proceeds with n=
ot
  error in VirtualBox, but I wanted to use QEmu to have a serial mouse
  which is not available with QEmu and to have finer control over the
  machine configuration ; VirtualBox although good, is more limited in
  that regard.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1799919/+subscriptions

