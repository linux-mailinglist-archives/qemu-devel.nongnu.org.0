Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545BF19A936
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 12:11:56 +0200 (CEST)
Received: from localhost ([::1]:57484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJaLi-000420-T5
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 06:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jJaL0-0003bg-2p
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:11:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jJaKy-0004Ph-Tn
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:11:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:60950)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jJaKy-0004PJ-OV
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:11:08 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jJaKx-0004Hk-G4
 for <qemu-devel@nongnu.org>; Wed, 01 Apr 2020 10:11:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 73FCC2E8030
 for <qemu-devel@nongnu.org>; Wed,  1 Apr 2020 10:11:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Apr 2020 10:04:10 -0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dgilbert-h marcandre-lureau
X-Launchpad-Bug-Reporter: Dr. David Alan Gilbert (dgilbert-h)
X-Launchpad-Bug-Modifier: Dr. David Alan Gilbert (dgilbert-h)
References: <158533956244.22377.11770713570863953031.malonedeb@wampee.canonical.com>
Message-Id: <158573545037.21356.5280387511281341265.malone@gac.canonical.com>
Subject: [Bug 1869426] Re: 5.0rc0->4.2 serial migraiton
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a296f04231dee355be5db73cc878b9e21689a253";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a448b9ff1e27039b4dd5e122c409b3d4b4160aa7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1869426 <1869426@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix posted:
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg08803.html

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1869426

Title:
  5.0rc0->4.2 serial migraiton

Status in QEMU:
  New

Bug description:
  Migrating from 5.0rc0->4.2 with pc-q35-4.2 we get an error:

  Unknown savevm section or instance 'serial' 1

  dumping the migration streams it looks like 5.0 is duplicating the
  serial migration data:

      "serial (26)": {
          "divider": "0x000c",
          "rbr": "0x00",
          "ier": "0x00",
          "iir": "0x01",
          "lcr": "0x00",
          "mcr": "0x00",
          "lsr": "0x60",
          "msr": "0xb0",
          "scr": "0x00",
          "fcr_vmstate": "0x00"
      },
      "serial (27)": {
          "state": {
              "divider": "0x000c",
              "rbr": "0x00",
              "ier": "0x00",
              "iir": "0x01",
              "lcr": "0x00",
              "mcr": "0x00",
              "lsr": "0x60",
              "msr": "0xb0",
              "scr": "0x00",
              "fcr_vmstate": "0x00"
          }
      },

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1869426/+subscriptions

