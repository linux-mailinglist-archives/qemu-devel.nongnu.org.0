Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A136F72E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:34:57 +0200 (CEST)
Received: from localhost ([::1]:48828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcObw-0006BU-TE
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYo-0003ET-5K
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:49078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYd-0005RV-WB
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOYa-0002Po-Gu
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7EBC12E8169
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:18:03 -0000
From: Thomas Huth <1913012@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ackalker th-huth trofi
X-Launchpad-Bug-Reporter: Alain Kalker (ackalker)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161155449009.29442.6099473190703163302.malonedeb@soybean.canonical.com>
Message-Id: <161977068341.10711.11807229887790446341.malone@gac.canonical.com>
Subject: [Bug 1913012] Re: Installed firmware descriptor files contain
 (invalid) relative paths
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: b94e46c4863b5aa1b10b30c8915d0a065800b8b3
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1913012 <1913012@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed here:
https://gitlab.com/qemu-project/qemu/-/commit/4b956a399969c0c497a

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913012

Title:
  Installed firmware descriptor files contain (invalid) relative paths

Status in QEMU:
  Fix Released

Bug description:
  After building and installing QEMU, the resulting installed firmware
  descriptor files contain relative paths for their `mapping.filename`
  properties. These relative paths are causing errors when using tools
  based on `libvirt` like `virt-install`, resulting in the inability to
  configure new VMs which reference these firmware descriptors.

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
  =C2=A0=C2=A0virsh --connect qemu:///session start vm4
  otherwise, please restart your installation.

  # Verify that the file does exist on the system and is accessible

  $ ls -l /usr/share/qemu/edk2-i386-vars.fd
  -rw-r--r-- 1 root root 540672 12 dec 18:47 /usr/share/qemu/edk2-i386-vars=
.fd

  # Verify most likely cause

  $ grep filename /usr/share/qemu/firmware/*i386*.json
  /usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename":=
 "share/qemu/edk2-i386-secure-code.fd",
  /usr/share/qemu/firmware/50-edk2-i386-secure.json:            "filename":=
 "share/qemu/edk2-i386-vars.fd",
  /usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share=
/qemu/edk2-i386-code.fd",
  /usr/share/qemu/firmware/60-edk2-i386.json:            "filename": "share=
/qemu/edk2-i386-vars.fd",

  Note that all the paths are relative and are missing <prefix>, i.e.
  `/usr`.

  # Workaround

  Manually editing the firmware descriptor files in
  `/usr/share/qemu/firmware` to contain full absolute paths to the
  firmware blobs resolves the issue:

  $ sudo sed -i.bak -e 's,"share/qemu/,"/usr/share/qemu/,' /usr/share/qemu/=
firmware/*.json
  $ virt-install --boot firmware=3Defi --disk none --memory 2048
  [...VM boots normally...]

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913012/+subscriptions

