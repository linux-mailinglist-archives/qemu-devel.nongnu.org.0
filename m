Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2AC2B534C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:56:58 +0100 (CET)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kelYW-0001qd-UL
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kelXJ-0001Mj-Sm
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:55:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:39002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kelXH-0007KL-M7
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:55:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kelXD-0007Iq-6a
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 20:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 306042E8055
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 20:55:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 20:46:39 -0000
From: Fabrice Fontaine <1904464@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ffontaine
X-Launchpad-Bug-Reporter: Fabrice Fontaine (ffontaine)
X-Launchpad-Bug-Modifier: Fabrice Fontaine (ffontaine)
Message-Id: <160555959985.17306.1370815502265671907.malonedeb@wampee.canonical.com>
Subject: [Bug 1904464] [NEW] Build fails with 64 bits time_t
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 87114e854b04cb19323facf8fbef5a4577fabb30
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:11:09
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
Reply-To: Bug 1904464 <1904464@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

time element is deprecated on new input_event structure in kernel's
input.h [1]

This will avoid the following build failure:

hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no mem=
ber named 'time'
  198 |     if (gettimeofday(&evdev.time, NULL)) {
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df86d=
3d599d5
 - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c5=
1e43bbb

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D152194fe9c3f

** Affects: qemu
     Importance: Undecided
         Status: New

** Patch added: "0002-Fix-build-with-64-bits-time_t.patch"
   https://bugs.launchpad.net/bugs/1904464/+attachment/5434882/+files/0002-=
Fix-build-with-64-bits-time_t.patch

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1904464

Title:
  Build fails with 64 bits time_t

Status in QEMU:
  New

Bug description:
  time element is deprecated on new input_event structure in kernel's
  input.h [1]

  This will avoid the following build failure:

  hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_statu=
s':
  hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no m=
ember named 'time'
    198 |     if (gettimeofday(&evdev.time, NULL)) {
        |                            ^

  Fixes:
   - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df8=
6d3d599d5
   - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429=
c51e43bbb

  [1]
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
?id=3D152194fe9c3f

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1904464/+subscriptions

