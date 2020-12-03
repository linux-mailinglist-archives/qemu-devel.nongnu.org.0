Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E082CD040
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 08:17:05 +0100 (CET)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkirQ-0002em-Gt
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 02:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkiq7-0002Bo-IH
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 02:15:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:38968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kkiq3-0008LL-7S
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 02:15:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kkiq1-0001mD-E0
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 07:15:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6539C2E80DF
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 07:15:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Dec 2020 07:08:10 -0000
From: ruimeiyan <1906608@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ruimeiyan
X-Launchpad-Bug-Reporter: ruimeiyan (ruimeiyan)
X-Launchpad-Bug-Modifier: ruimeiyan (ruimeiyan)
Message-Id: <160697929082.24737.7684799499074231317.malonedeb@gac.canonical.com>
Subject: [Bug 1906608] [NEW]  [Feature request]For some ehci controller,
 qemu should implement using portsc[26-27] to detect the speed of
 device.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="55c41fea591e042b8bb54e6952942f55c764435e"; Instance="production"
X-Launchpad-Hash: e28d2d0b5dcf557de00eda60a8b401ac163e0332
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
Reply-To: Bug 1906608 <1906608@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

for some ehci controller ,for example ehci controller on fsl_imx6,it
using portsc[26-27] to decide a full speed device or high speed device
was connected, hub-ehci.c should set the portsc[26-27] to return the
right speed.

line:1001 in hub-ehci.c
        if (dev && dev->attached && (dev->speedmask & USB_SPEED_MASK_HIGH))=
 {
            val |=3D PORTSC_PED;
        }

below is the spec for fsl_imx6 USB PART.
PORTSC:27=E2=80=9326 :PSPD
Port Speed - Read Only.
This register field indicates the speed at which the port is operating.
00 Full Speed
01 Low Speed
10 High Speed
11 Undefined

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906608

Title:
   [Feature request]For some ehci controller, qemu should implement
  using portsc[26-27]  to detect the speed of device.

Status in QEMU:
  New

Bug description:
  for some ehci controller ,for example ehci controller on fsl_imx6,it
  using portsc[26-27] to decide a full speed device or high speed device
  was connected, hub-ehci.c should set the portsc[26-27] to return the
  right speed.

  line:1001 in hub-ehci.c
          if (dev && dev->attached && (dev->speedmask & USB_SPEED_MASK_HIGH=
)) {
              val |=3D PORTSC_PED;
          }

  below is the spec for fsl_imx6 USB PART.
  PORTSC:27=E2=80=9326 :PSPD
  Port Speed - Read Only.
  This register field indicates the speed at which the port is operating.
  00 Full Speed
  01 Low Speed
  10 High Speed
  11 Undefined

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906608/+subscriptions

