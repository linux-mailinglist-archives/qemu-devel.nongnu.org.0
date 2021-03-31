Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD7A350307
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 17:16:47 +0200 (CEST)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRcaM-0000bx-DQ
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 11:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRcZJ-0008Vr-AT
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:15:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:52126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRcZG-0000Oo-0E
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:15:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lRcZD-00010U-KG
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 15:15:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 955D52E80F9
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 15:15:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 31 Mar 2021 15:08:59 -0000
From: Vladislav Yaroshchuk <1922102@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: macos net network tap tap-net
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: shchukovl
X-Launchpad-Bug-Reporter: Vladislav Yaroshchuk (shchukovl)
X-Launchpad-Bug-Modifier: Vladislav Yaroshchuk (shchukovl)
Message-Id: <161720333927.2408.17717907169331715630.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1922102] [NEW] Broken tap networking on macOS host
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="21fefc602783aa4ba863a4a6c29d38d788ce04ad"; Instance="production"
X-Launchpad-Hash: bb99d34feec907b7e130252952b2464378fb79d5
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
Reply-To: Bug 1922102 <1922102@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Building QEMU with GLib newer than 2.58.3 corrupts tap networking on macOS =
hosts.
Tap device was provided by Tun/Tap kernel extension installed from brew:
=C2=A0=C2=A0brew install tuntap

Checked revisions:
=C2=A0=C2=A0553032d (v5.2.0)
=C2=A0=C2=A06d40ce0 (v6.0.0-rc1)

Host:
=C2=A0MacBook Pro (Retina, 15-inch, Mid 2015)
=C2=A0macOS Catalina 10.15.6 (19G2021)

Guest:
=C2=A0=C2=A0Linux Ubuntu 4.4.0-206-generic x86_64
=C2=A0=C2=A0Also tested macOS Catalina 10.15.7 as a guest, the behaviour is=
 the same.

QEMU command line:

qemu-system-x86_64 \
=C2=A0=C2=A0-drive file=3Dhdd.qcow2,if=3Dvirtio,format=3Dqcow2 \
=C2=A0=C2=A0-m 3G \
=C2=A0=C2=A0-nic tap,script=3Dtap-up.sh

tap-up.sh:

=C2=A0#!/bin/sh

=C2=A0TAPDEV=3D"$1"
=C2=A0BRIDGEDEV=3D"bridge0"

=C2=A0ifconfig "$BRIDGEDEV" addm "$TAPDEV"

Enabling/disabling Hypervisor.Framework acceleration (`-accel hvf`) has
no effect.

How to reproduce:
=C2=A0=C2=A01. Build & install GLib > 2.58.3 (tested 2.60.7, 2.60.7)
=C2=A0=C2=A02. Build qemu-system-x86_64 with GLib > 2.58.3
=C2=A0=C2=A03. Boot any guest any guest with tap networking enabled
=C2=A0=C2=A04. See that the external network is inaccessible

Hotfix:
=C2=A0=C2=A01. Build & install GLib 2.58.3
=C2=A0=C2=A02. Build qemu-system-x86_64 with GLib 2.58.3
=C2=A0=C2=A03. Boot any guest with tap networking enabled
=C2=A0=C2=A04. See that the external network is accessible, everything is w=
orking as expected

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: macos net network tap tap-net

** Description changed:

- Building QEMU with GLib newer than 2.58.3 corrupts tap networking. =

+ Building QEMU with GLib newer than 2.58.3 corrupts tap networking on macO=
S hosts.
  Tap device was provided by Tun/Tap kernel extension installed from brew:
-   brew install tuntap
+ =C2=A0=C2=A0brew install tuntap
  =

  Checked revisions:
-   553032d (v5.2.0)
-   6d40ce0 (v6.0.0-rc1)
+ =C2=A0=C2=A0553032d (v5.2.0)
+ =C2=A0=C2=A06d40ce0 (v6.0.0-rc1)
  =

  Host:
-  MacBook Pro (Retina, 15-inch, Mid 2015)
-  macOS Catalina 10.15.6 (19G2021)
+ =C2=A0MacBook Pro (Retina, 15-inch, Mid 2015)
+ =C2=A0macOS Catalina 10.15.6 (19G2021)
  =

  Guest:
-   Linux Ubuntu 4.4.0-206-generic x86_64
-   Also tested macOS Catalina 10.15.7 as a guest, the behaviour is the sam=
e.
+ =C2=A0=C2=A0Linux Ubuntu 4.4.0-206-generic x86_64
+ =C2=A0=C2=A0Also tested macOS Catalina 10.15.7 as a guest, the behaviour =
is the same.
  =

  QEMU command line:
  =

  qemu-system-x86_64 \
-   -drive file=3Dhdd.qcow2,if=3Dvirtio,format=3Dqcow2 \
-   -m 3G \
-   -nic tap,script=3Dtap-up.sh
+ =C2=A0=C2=A0-drive file=3Dhdd.qcow2,if=3Dvirtio,format=3Dqcow2 \
+ =C2=A0=C2=A0-m 3G \
+ =C2=A0=C2=A0-nic tap,script=3Dtap-up.sh
  =

  tap-up.sh:
-  =

-  #!/bin/sh
  =

-  TAPDEV=3D"$1"
-  BRIDGEDEV=3D"bridge0"
+ =C2=A0#!/bin/sh
  =

-  ifconfig "$BRIDGEDEV" addm "$TAPDEV"
+ =C2=A0TAPDEV=3D"$1"
+ =C2=A0BRIDGEDEV=3D"bridge0"
+ =

+ =C2=A0ifconfig "$BRIDGEDEV" addm "$TAPDEV"
  =

  Enabling/disabling Hypervisor.Framework acceleration (`-accel hvf`) has
  no effect.
  =

- How to reproduce: =

-   1. Build & install GLib > 2.58.3 (tested 2.60.7, 2.60.7)
-   2. Build qemu-system-x86_64 with GLib > 2.58.3
-   3. Boot any guest any guest with tap networking enabled
-   4. See that the external network is inaccessible
+ How to reproduce:
+ =C2=A0=C2=A01. Build & install GLib > 2.58.3 (tested 2.60.7, 2.60.7)
+ =C2=A0=C2=A02. Build qemu-system-x86_64 with GLib > 2.58.3
+ =C2=A0=C2=A03. Boot any guest any guest with tap networking enabled
+ =C2=A0=C2=A04. See that the external network is inaccessible
  =

  Hotfix:
-   1. Build & install GLib 2.58.3
-   2. Build qemu-system-x86_64 with GLib 2.58.3
-   3. Boot any guest with tap networking enabled
-   4. See that the external network is accessible, everything is working a=
s expected
+ =C2=A0=C2=A01. Build & install GLib 2.58.3
+ =C2=A0=C2=A02. Build qemu-system-x86_64 with GLib 2.58.3
+ =C2=A0=C2=A03. Boot any guest with tap networking enabled
+ =C2=A0=C2=A04. See that the external network is accessible, everything is=
 working as expected

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922102

Title:
  Broken tap networking on macOS host

Status in QEMU:
  New

Bug description:
  Building QEMU with GLib newer than 2.58.3 corrupts tap networking on macO=
S hosts.
  Tap device was provided by Tun/Tap kernel extension installed from brew:
  =C2=A0=C2=A0brew install tuntap

  Checked revisions:
  =C2=A0=C2=A0553032d (v5.2.0)
  =C2=A0=C2=A06d40ce0 (v6.0.0-rc1)

  Host:
  =C2=A0MacBook Pro (Retina, 15-inch, Mid 2015)
  =C2=A0macOS Catalina 10.15.6 (19G2021)

  Guest:
  =C2=A0=C2=A0Linux Ubuntu 4.4.0-206-generic x86_64
  =C2=A0=C2=A0Also tested macOS Catalina 10.15.7 as a guest, the behaviour =
is the same.

  QEMU command line:

  qemu-system-x86_64 \
  =C2=A0=C2=A0-drive file=3Dhdd.qcow2,if=3Dvirtio,format=3Dqcow2 \
  =C2=A0=C2=A0-m 3G \
  =C2=A0=C2=A0-nic tap,script=3Dtap-up.sh

  tap-up.sh:

  =C2=A0#!/bin/sh

  =C2=A0TAPDEV=3D"$1"
  =C2=A0BRIDGEDEV=3D"bridge0"

  =C2=A0ifconfig "$BRIDGEDEV" addm "$TAPDEV"

  Enabling/disabling Hypervisor.Framework acceleration (`-accel hvf`)
  has no effect.

  How to reproduce:
  =C2=A0=C2=A01. Build & install GLib > 2.58.3 (tested 2.60.7, 2.60.7)
  =C2=A0=C2=A02. Build qemu-system-x86_64 with GLib > 2.58.3
  =C2=A0=C2=A03. Boot any guest any guest with tap networking enabled
  =C2=A0=C2=A04. See that the external network is inaccessible

  Hotfix:
  =C2=A0=C2=A01. Build & install GLib 2.58.3
  =C2=A0=C2=A02. Build qemu-system-x86_64 with GLib 2.58.3
  =C2=A0=C2=A03. Boot any guest with tap networking enabled
  =C2=A0=C2=A04. See that the external network is accessible, everything is=
 working as expected

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922102/+subscriptions

