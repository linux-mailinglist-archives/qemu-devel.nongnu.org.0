Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98873F04D4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 15:33:13 +0200 (CEST)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGLgu-0002O6-Cf
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 09:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mGLf6-0000W2-53
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:31:21 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:46148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mGLf3-0000NA-LI
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 09:31:19 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id AD86C3F61B
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629293473;
 bh=yDvEQZlgjLwghQ5j4ax/F0mV/FLAwZ/WW2Ao5ziwzXI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=CanrS8/GbEAbOMdu+1hZEijyYHejuHTFHyK+JpG2mMaY6O8hoaIUnosIywh+aqegD
 UChSRkpkFyDF6/Qriz3U60nrG4Cu39RAopjztJOivigqLw4q+AV42voad0NX9rUt7s
 eM6vvtZPKs19cWa3r1fbvv9ioh+tnZnNbfN1N8kb4h/5FMv0iLvx1PrUseeyDAh9XK
 diQiSGKn9Ysh0IRsiLPr8aVxmJQeEmKQQQvwJm5Ap54ONuE7lm9/QX6TNtJbT9sg4v
 eh7uUZr+X4CILdPWmzhdKLqzCkmVVgdFp96gsciXxzMaYWSFBl3BSeppBRBDa7Z5W0
 lLK5XdG9JP2jQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 395CC2E8243
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:31:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Aug 2021 13:21:04 -0000
From: Thomas Huth <1908489@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=centos; sourcepackage=qemu-kvm; component=None;
 status=Unknown; importance=Unknown; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: amdnative bonzini luqmana th-huth
X-Launchpad-Bug-Reporter: Luqman (luqmana)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160818582988.15420.16250079431178848252.malonedeb@soybean.canonical.com>
Message-Id: <162929286443.24593.16362265049170097834.malone@wampee.canonical.com>
Subject: [Bug 1908489] Re: qemu 4.2 bootloops with -cpu host and nested
 hypervisor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b08a7ac7ee9dae6cca70a44dbdbee2a2b52e9053"; Instance="production"
X-Launchpad-Hash: 8ed12cd69f5ef94b74a878288a1852f797bf532d
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1908489 <1908489@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking at the comments here, I assume this has been a bug in the
kernel, not in QEMU, so I'm closing this one now. If you still think
this is something that needs fixing in QEMU, please open a new ticket in
the new bug tracker at https://gitlab.com/qemu-project/qemu/-/issues
instead.

** Changed in: qemu
       Status: Incomplete =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908489

Title:
  qemu 4.2 bootloops with -cpu host and nested hypervisor

Status in QEMU:
  Invalid
Status in qemu-kvm package in CentOS:
  Unknown

Bug description:
  I've noticed that after upgrading from Ubuntu 18.04 to 20.04 that
  nested virtualization isn't working anymore.

  I have a simple repro where I create a Windows 10 2004 guest and
  enable Hyper-V in it. This worked fine in 18.04 and specifically qemu
  <4.2 (I specifically tested Qemu 2.11-4.1 which work fine).

  The -cpu arg I'm passing is simply:
      -cpu host,l3-cache=3Don,hv_relaxed,hv_spinlocks=3D0x1fff,hv_vapic,hv_=
time

  Using that Windows won't boot because the nested hypervisor (Hyper-V)
  is unable to be initialize and so it just boot loops. Using the exact
  same qemu command works fine with 4.1 and lower.

  Switching to a named CPU model like Skylake-Client-noTSX-IBRS instead
  of host lets the VM boot but causes some weird behaviour later trying
  to use nested VMs.

  If I had to guess I think it would probably be related to this change
  https://github.com/qemu/qemu/commit/20a78b02d31534ae478779c2f2816c273601e=
869
  which would line up with 4.2 being the first bad version but unsure.

  For now I just have to keep an older build of QEMU to work around
  this. Let me know if there's anything else needed. I can also try out
  any patches. I already have at least a dozen copies of qemu lying
  around now.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908489/+subscriptions


