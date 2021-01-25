Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B8302208
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 07:13:01 +0100 (CET)
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3v7U-0003NX-88
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 01:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3v5e-0002wq-RE
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 01:11:06 -0500
Received: from indium.canonical.com ([91.189.90.7]:45996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l3v5Y-00087D-Tf
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 01:11:06 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l3v5V-0001yB-WC
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:10:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EFD292E8005
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:10:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 Jan 2021 06:01:29 -0000
From: Alain Kalker <1913012@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ackalker
X-Launchpad-Bug-Reporter: Alain Kalker (ackalker)
X-Launchpad-Bug-Modifier: Alain Kalker (ackalker)
Message-Id: <161155449009.29442.6099473190703163302.malonedeb@soybean.canonical.com>
Subject: [Bug 1913012] [NEW] Installed firmware descriptor files contain
 (invalid) relative paths
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2d1d5e352f0d063d660df2300e31f66bed027fa5"; Instance="production"
X-Launchpad-Hash: a60160daa50a5e61516be349f6c7b7158126031e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1913012 <1913012@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Unless the Qemu build is configured using `./configure --datadir=3D<path>
where <path> is some absolute path which is a subdirectory of <prefix>,
the resulting installed firmware descriptor files contain relative paths
for their `mapping.filename` properties. These relative paths will not
be accepted as valid by tools like `virt-install`, resulting in the
inability to configure new VMs using these firmware descriptors.

# QEMU version
$ qemu-system-x86_64 -version
QEMU emulator version 5.2.0

(I've also reproduced the issue with QEMU built from Git master @
v5.2.0-1300-g0e32462630, see next comment.)

# OS version
Void Linux x86_64 (glibc)

Steps to reproduce (with results on my system):

# Verify the symptom

$ virt-install --boot firmware=3Defi --disk none --memory 2048
Using default --name vm4
WARNING  No operating system detected, VM performance may suffer. Specify a=
n OS with --os-variant for optimal results.

Starting install...
ERROR    Failed to open file 'share/qemu/edk2-i386-vars.fd': No such file o=
r directory
Domain installation does not appear to have been successful.
If it was, you can restart your domain by running:
  virsh --connect qemu:///session start vm4
otherwise, please restart your installation.

# Verify most likely cause

$ grep filename /usr/share/qemu/firmware/*i386*.json =

/usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename": "=
share/qemu/edk2-i386-secure-code.fd",
/usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename": "=
share/qemu/edk2-i386-vars.fd",
/usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share/q=
emu/edk2-i386-code.fd",
/usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share/q=
emu/edk2-i386-vars.fd",

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913012

Title:
  Installed firmware descriptor files contain (invalid) relative paths

Status in QEMU:
  New

Bug description:
  Unless the Qemu build is configured using `./configure
  --datadir=3D<path> where <path> is some absolute path which is a
  subdirectory of <prefix>, the resulting installed firmware descriptor
  files contain relative paths for their `mapping.filename` properties.
  These relative paths will not be accepted as valid by tools like
  `virt-install`, resulting in the inability to configure new VMs using
  these firmware descriptors.

  # QEMU version
  $ qemu-system-x86_64 -version
  QEMU emulator version 5.2.0

  (I've also reproduced the issue with QEMU built from Git master @
  v5.2.0-1300-g0e32462630, see next comment.)

  # OS version
  Void Linux x86_64 (glibc)

  Steps to reproduce (with results on my system):

  # Verify the symptom

  $ virt-install --boot firmware=3Defi --disk none --memory 2048
  Using default --name vm4
  WARNING  No operating system detected, VM performance may suffer. Specify=
 an OS with --os-variant for optimal results.

  Starting install...
  ERROR    Failed to open file 'share/qemu/edk2-i386-vars.fd': No such file=
 or directory
  Domain installation does not appear to have been successful.
  If it was, you can restart your domain by running:
    virsh --connect qemu:///session start vm4
  otherwise, please restart your installation.

  # Verify most likely cause

  $ grep filename /usr/share/qemu/firmware/*i386*.json =

  /usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename":=
 "share/qemu/edk2-i386-secure-code.fd",
  /usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename":=
 "share/qemu/edk2-i386-vars.fd",
  /usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share=
/qemu/edk2-i386-code.fd",
  /usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share=
/qemu/edk2-i386-vars.fd",

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913012/+subscriptions

