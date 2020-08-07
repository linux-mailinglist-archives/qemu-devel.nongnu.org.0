Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A523F2E3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 20:47:17 +0200 (CEST)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k47Oe-0008Bl-8h
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 14:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k47N4-0007Ls-De
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 14:45:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:34386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k47Mw-0000jB-SW
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 14:45:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k47Mv-0005DS-3v
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 18:45:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EF8942E809C
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 18:45:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2020 18:32:04 -0000
From: Thomas Huth <1505041@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange fgouget th-huth
X-Launchpad-Bug-Reporter: Francois Gouget (fgouget)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151012003458.26359.57214.malonedeb@chaenomeles.canonical.com>
Message-Id: <159682512489.26006.12480849118781518560.malone@gac.canonical.com>
Subject: [Bug 1505041] Re: Live snapshot revert times increases linearly with
 snapshot age
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 71238122bc7f5e4ba97b996bd32082220af760bd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 01:41:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1505041 <1505041@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... is this still an issue with the
latest version of QEMU? Or could we close this ticket nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1505041

Title:
  Live snapshot revert times increases linearly with snapshot age

Status in QEMU:
  Incomplete

Bug description:
  The WineTestBot (https://testbot.winehq.org/) uses QEmu live snapshots
  to ensure the Wine tests are always run in a pristine Windows
  environment. However the revert times keep increasing linearly with
  the age of the snapshot, going from tens of seconds to thousands.
  While the revert takes place the qemu process takes 100% of a core and
  there is no disk activity. Obviously waiting over 20 minutes before
  being able to run a 10 second test is not viable.

  Only some VMs are impacted. Based on libvirt's XML files the common
  point appears to be the presence of the following <timer> tags:

      <clock offset=3D'localtime'>
        <timer name=3D'rtc' tickpolicy=3D'delay'/>
        <timer name=3D'pit' tickpolicy=3D'delay'/>
        <timer name=3D'hpet' present=3D'no'/>
      </clock>

  Where the unaffected VMs have the following clock definition instead:

      <clock offset=3D'localtime'/>

  Yet shutting down the affected VMs, changing the clock definition,
  creating a live snapshot and trying to revert to it 6 months later
  results in slow revert times (>400 seconds).

  Changing the tickpolicy to catchup for rtc and/or pit has no effect on
  the revert time (and unsurprisingly causes the clock to run fast in
  the guest).

  =

  To reproduce this problem do the following:
  * Create a Windows VM (either 32 or 64 bits). This is known to happen wit=
h at least Windows 2000, XP, 2003, 2008 and 10.
  * That VM will have the <timer> tags shown above, with the possible addit=
ion of an hypervclock timer.
  * Shut down the VM.
  * date -s "2014/04/01"
  * Start the VM.
  * Take a live snapshot.
  * Shut down the VM.
  * date -s "<your current date>"
  * Revert to the live snapshot.

  If the revert takes more than 2 minutes then there is a problem.

  =

  A workaround is to set track=3D'guest' on the rtc timer. This makes the r=
evert fast and may even be the correct solution. But why is it not the defa=
ult or better documented?
   * It setting track=3D'wall' or omitting track, then the revert is slow a=
nd the clock in the guest is not updated.
   * It setting track=3D'guest' the revert is fast and the clock in the gue=
st is not updated.

  =

  I found three past mentions of this issue but as far as I can tell none o=
f them got anywhere:

  * [Qemu-discuss] massive slowdown for reverts after given amount of time =
on any newer versions
     https://lists.gnu.org/archive/html/qemu-discuss/2013-02/msg00000.html

  * The above post references another one from 2011 wrt qemu 0.14:
     https://lists.gnu.org/archive/html/qemu-devel/2011-03/msg02645.html

  * Comment #9 of Launchpad bug 1174654 matches this slow revert issue. How=
ever
     the bug was really about another issue so this was not followed on.
     https://bugs.launchpad.net/qemu/+bug/1174654/comments/9

  =

  I'm currently running into this issue with QEmu 2.1 but it looks like thi=
s bug has been there all along.
  1:2.1+dfsg-12+deb8u2 qemu-kvm
  1:2.1+dfsg-12+deb8u2 qemu-system-common
  1:2.1+dfsg-12+deb8u2 qemu-system-x86

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1505041/+subscriptions

