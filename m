Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D5260FA6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 12:26:53 +0200 (CEST)
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFapv-0000Xp-RL
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 06:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kFaol-00089S-O5
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 06:25:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:53392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kFaoi-0000DK-7m
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 06:25:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kFaoh-0003ux-6N
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 10:25:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2A7172E80DB
 for <qemu-devel@nongnu.org>; Tue,  8 Sep 2020 10:25:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2020 10:17:49 -0000
From: Derek Su <1894818@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dereksu
X-Launchpad-Bug-Reporter: Derek Su (dereksu)
X-Launchpad-Bug-Modifier: Derek Su (dereksu)
References: <159955977855.17769.18273034994411209537.malonedeb@soybean.canonical.com>
Message-Id: <159956026952.18312.10787971920742104365.launchpad@soybean.canonical.com>
Subject: [Bug 1894818] Re: COLO's guest VNC client hang after failover
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="90a5703803d95539bdb5c0b289b1675630569e1e"; Instance="production"
X-Launchpad-Hash: e26b892e841f55a78950961308b839a817dfece9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 03:20:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1894818 <1894818@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

  Hello,
  =

  After setting up COLO's primary and secondary VMs,
  I installed the vncserver and xrdp (apt install tightvncserver xrdp) insi=
de the VM.
  =

  I access the VM from another PC via VNC/RDP client, and everything is OK.
  Then, kill the primary VM and issue the failover commands.
  =

- The expected result is that the VNC/RDP client can resume after failover.
- But in my test, the VNC client's screen hangs and cannot be recovered no =
longer.
+ The expected result is that the VNC/RDP client can reconnect and resume
+ automatically after failover. (I've confirmed the VNC/RDP client can
+ reconnect automatically.)
+ =

+ But in my test, the VNC client's screen hangs and cannot be recovered no
+ longer. (I need to restart VNC client by myself.)
  =

  BTW, it works well after killing SVM.
  =

  Thanks.
  =

  Regards,
  Derek

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894818

Title:
  COLO's guest VNC client hang after failover

Status in QEMU:
  New

Bug description:
  Hello,

  After setting up COLO's primary and secondary VMs,
  I installed the vncserver and xrdp (apt install tightvncserver xrdp) insi=
de the VM.

  I access the VM from another PC via VNC/RDP client, and everything is OK.
  Then, kill the primary VM and issue the failover commands.

  The expected result is that the VNC/RDP client can reconnect and
  resume automatically after failover. (I've confirmed the VNC/RDP
  client can reconnect automatically.)

  But in my test, the VNC client's screen hangs and cannot be recovered
  no longer. (I need to restart VNC client by myself.)

  BTW, it works well after killing SVM.

  Here is my QEMU networking device
  ```
  -device virtio-net-pci,id=3De0,netdev=3Dhn0 \
  -netdev tap,id=3Dhn0,br=3Dbr0,vhost=3Doff,helper=3D/usr/local/libexec/qem=
u-bridge-helper \
  ```

  Thanks.

  Regards,
  Derek

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894818/+subscriptions

