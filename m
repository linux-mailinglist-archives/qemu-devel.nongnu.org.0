Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4C2C8D39
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:48:18 +0100 (CET)
Received: from localhost ([::1]:34120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjoDh-0007UE-4o
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjoBC-0006Tq-Qj
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:45:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:59078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kjoB9-0004u2-04
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:45:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kjoB6-0008O7-Mg
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 18:45:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A4EBA2E8041
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 18:45:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Nov 2020 18:36:22 -0000
From: JIANG Muhui <1906295@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: muhui
X-Launchpad-Bug-Reporter: JIANG Muhui (muhui)
X-Launchpad-Bug-Modifier: JIANG Muhui (muhui)
Message-Id: <160676138273.7596.15417140211525912914.malonedeb@soybean.canonical.com>
Subject: [Bug 1906295] [NEW] Implementation of exclusive monitor in ARM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="12d09381f8e8eee3115395875b132e165fa96574"; Instance="production"
X-Launchpad-Hash: 6606476fca103688509b38c8fedba551c4076234
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1906295 <1906295@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi

I refer to the implementation of exclusive monitor in ARM32. For
instruction like STREX Rx,Ry,[Rz], we need to check whether the address
[Rz] is in exclusive state. If not, we set the value Rx as 1 without
doing the store operation. However, I noticed that QEMU will not check
whether the address that Rz points to is a legal address or not. If the
value of Rz is 0x0 but it is not in exclusive state. QEMU will set Rx as
1 and continue to execute the following instructions.

However, physical devices will check the value of Rz. If Rz is an illegal a=
ddress (e.g., 0x0), a SIGSEGV signal will be raised even the address is not=
 in exclusive state. I searched many documentation about ARM and it seems t=
hat manual of ARM specification does not specify the implementation of excl=
usive monitor in detail. I am not sure which one is the right behavior. =

Should QEMU add this check? This might not be a mistake. However, should it=
 be better if QEMU has the same behavior as a physical device? Feel free if=
 you need a testcase. Many thanks

Regards
Muhui

** Affects: qemu
     Importance: Undecided
         Status: New

** Summary changed:

- Improper implementation of exclusive monitor in ARM
+ Implementation of exclusive monitor in ARM

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906295

Title:
  Implementation of exclusive monitor in ARM

Status in QEMU:
  New

Bug description:
  Hi

  I refer to the implementation of exclusive monitor in ARM32. For
  instruction like STREX Rx,Ry,[Rz], we need to check whether the
  address [Rz] is in exclusive state. If not, we set the value Rx as 1
  without doing the store operation. However, I noticed that QEMU will
  not check whether the address that Rz points to is a legal address or
  not. If the value of Rz is 0x0 but it is not in exclusive state. QEMU
  will set Rx as 1 and continue to execute the following instructions.

  However, physical devices will check the value of Rz. If Rz is an illegal=
 address (e.g., 0x0), a SIGSEGV signal will be raised even the address is n=
ot in exclusive state. I searched many documentation about ARM and it seems=
 that manual of ARM specification does not specify the implementation of ex=
clusive monitor in detail. I am not sure which one is the right behavior. =

  Should QEMU add this check? This might not be a mistake. However, should =
it be better if QEMU has the same behavior as a physical device? Feel free =
if you need a testcase. Many thanks

  Regards
  Muhui

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906295/+subscriptions

