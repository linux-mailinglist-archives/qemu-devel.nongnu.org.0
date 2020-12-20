Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEFE2DF509
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 11:51:51 +0100 (CET)
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqwJa-0008MO-3u
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 05:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqwIl-0007vt-Aw
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 05:50:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:42976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqwIe-0004j0-1j
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 05:50:57 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kqwIb-0006na-VM
 for <qemu-devel@nongnu.org>; Sun, 20 Dec 2020 10:50:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EB2D22E8060
 for <qemu-devel@nongnu.org>; Sun, 20 Dec 2020 10:50:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Dec 2020 10:36:41 -0000
From: Luqman <1908489@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: luqmana
X-Launchpad-Bug-Reporter: Luqman (luqmana)
X-Launchpad-Bug-Modifier: Luqman (luqmana)
References: <160818582988.15420.16250079431178848252.malonedeb@soybean.canonical.com>
Message-Id: <160846060219.1287.7718951679916511019.malone@soybean.canonical.com>
Subject: [Bug 1908489] Re: qemu 4.2 bootloops with -cpu host and nested
 hypervisor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: 8f18c438c4e04f764539df0fe2460ba871e0a828
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
Reply-To: Bug 1908489 <1908489@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, so I narrowed done one possible issue: the BNDCFGS bits in the vm
entry/exit control MSRs are not set but HyperV expects them to be set if
xsave is supported. This quick patch actually lets Hyper-V initialize
and continue booting:
https://gist.github.com/552baa8be026e67bef2d223076b81636

An alternative to that patch is just telling Hyper-V xsave is disabled.
In the guest before enabling Hyper-V: bcdedit /set xsavedisable 1

Unfortunately while this does let the guest Hyper-V initialize, the
nested (root) Windows guest doesn't boot and still gets stuck in a
bootloop.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908489

Title:
  qemu 4.2 bootloops with -cpu host and nested hypervisor

Status in QEMU:
  New

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

