Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3DD2F6AEA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:27:35 +0100 (CET)
Received: from localhost ([::1]:60106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08HO-0000uj-Im
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l081Q-0006vu-7l
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:11:05 -0500
Received: from indium.canonical.com ([91.189.90.7]:42732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l081A-0006zZ-Nc
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:11:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l0818-00040M-Md
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:10:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A417E2E8029
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 Jan 2021 19:03:11 -0000
From: Alexander Bulekov <1911797@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr imperialguy
X-Launchpad-Bug-Reporter: Ven Karri (imperialguy)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <161064937731.13964.16005967983096454307.malonedeb@gac.canonical.com>
Message-Id: <161065099118.12856.11594106461819557560.malone@gac.canonical.com>
Subject: [Bug 1911797] Re: hmp command `hostfwd_remove` does not work on
 running vm
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="511b4a3b6512aa3d421c5f7d74f3527e78bff26e"; Instance="production"
X-Launchpad-Hash: 25ed3c030dfaf041842a9df1e04a910e4dc10763
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1911797 <1911797@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like intended behavior:

(qemu) help hostfwd_add
hostfwd_add [netdev_id] [tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport=
 -- redirect TCP or UDP connections from host to guest (requires -net user)
(qemu) help hostfwd_remove
hostfwd_remove [netdev_id] [tcp|udp]:[hostaddr]:hostport -- remove host-to-=
guest TCP or UDP redirection

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911797

Title:
  hmp command `hostfwd_remove` does not work on running vm

Status in QEMU:
  New

Bug description:
  On a running VM, I ran the following two hmp commands:

  "hostfwd_add tcp::43210-:43210" --> WORKS
  'hostfwd_remove tcp::43210-:43210" --> DOES NOT WORK. returns 'invalid fo=
rmat'

  QEMU version 5.1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1911797/+subscriptions

