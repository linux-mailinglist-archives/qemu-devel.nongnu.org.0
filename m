Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF0372006
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:57:26 +0200 (CEST)
Received: from localhost ([::1]:47428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddkz-0003sg-Go
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lddjI-0002aV-Gx
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:56342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lddjF-0001d8-13
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:55:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lddjD-0000jp-0a
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 18:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F01742E8136
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 18:55:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 18:48:22 -0000
From: dcb <1926995@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: dcb (dcb314)
Message-Id: <162006770303.13621.18026521974059309297.malonedeb@wampee.canonical.com>
Subject: [Bug 1926995] [NEW] hw/remote/mpqemu-link.c:221: bad error checking ?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 9ab06f6a69a132e5d2c81b7f72880ece19667c4f
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
Reply-To: Bug 1926995 <1926995@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

hw/remote/mpqemu-link.c:221:36: warning: logical =E2=80=98and=E2=80=99 of m=
utually
exclusive tests is always false [-Wlogical-op]

Source code is

   if (msg->cmd >=3D MPQEMU_CMD_MAX && msg->cmd < 0) {
        return false;
    }

Maybe better code:

   if (msg->cmd >=3D MPQEMU_CMD_MAX || msg->cmd < 0) {
        return false;
    }

It might be useful to switch on gcc compiler flag -Wlogical-op
to see these warnings.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926995

Title:
  hw/remote/mpqemu-link.c:221: bad error checking ?

Status in QEMU:
  New

Bug description:
  hw/remote/mpqemu-link.c:221:36: warning: logical =E2=80=98and=E2=80=99 of=
 mutually
  exclusive tests is always false [-Wlogical-op]

  Source code is

     if (msg->cmd >=3D MPQEMU_CMD_MAX && msg->cmd < 0) {
          return false;
      }

  Maybe better code:

     if (msg->cmd >=3D MPQEMU_CMD_MAX || msg->cmd < 0) {
          return false;
      }

  It might be useful to switch on gcc compiler flag -Wlogical-op
  to see these warnings.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926995/+subscriptions

