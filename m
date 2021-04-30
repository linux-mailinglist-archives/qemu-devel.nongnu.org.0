Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30836FD5E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:10:01 +0200 (CEST)
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUmH-0003A3-19
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcUdz-0004jK-5c
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:01:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:52648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcUdw-0007jI-Fc
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:01:26 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcUds-00073d-QM
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:01:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B81A82E8168
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:01:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 14:51:59 -0000
From: Anisse Astier <1828608@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anisse berrange th-huth
X-Launchpad-Bug-Reporter: Anisse Astier (anisse)
X-Launchpad-Bug-Modifier: Anisse Astier (anisse)
References: <155750549613.15038.5455007066011551794.malonedeb@wampee.canonical.com>
Message-Id: <161979432022.4988.12847600532179968618.malone@chaenomeles.canonical.com>
Subject: [Bug 1828608] Re: Chardev websocket might not support pasting more
 than a few chars
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 9c0cbfb30a0f0ee91e265448aa958ae7c315f4ea
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
Reply-To: Bug 1828608 <1828608@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bug is still present.

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1828608

Title:
  Chardev websocket might not support pasting more than a few chars

Status in QEMU:
  New

Bug description:
  When sending more than 4-5 characters on the websocket serial console
  (with pasting for example), the guest might not receive all of them,
  or worse interpret the input as Magic SysRq keys.

  This might be due to the io loop not checking the backend readiness
  before calling the read function.

  Attached patched fixes the problem on my system. I'm not sure it's the
  proper approach, this is just to start discussion.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1828608/+subscriptions

