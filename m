Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E944A182820
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 06:12:34 +0100 (CET)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCG94-0004ZS-1C
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 01:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jCG7L-0003IH-0i
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 01:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jCG7J-0001Lx-Kw
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 01:10:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:53058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jCG7J-0001Ig-FH
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 01:10:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jCG7H-0000Ag-VD
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 05:10:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8F3B82E80C9
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 05:10:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2020 04:59:20 -0000
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pcc-goog rth
X-Launchpad-Bug-Reporter: Peter Collingbourne (pcc-goog)
X-Launchpad-Bug-Modifier: Richard Henderson (rth)
References: <158397461074.11691.9165479040998830806.malonedeb@soybean.canonical.com>
Message-Id: <158398916050.26762.10177995120826343544.malone@gac.canonical.com>
Subject: [Bug 1867072] Re: ARM: tag bits cleared in FAR_EL1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e0878392dc799b267dea80578fa65500a5d74155";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: ec17e29be210e3d0234b9feda3b0b2f03aca0d7b
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
Reply-To: Bug 1867072 <1867072@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As it happens, I posted some cleanups for this last week:
https://patchew.org/QEMU/20200302175829.2183-1-richard.henderson@linaro.org/

Some of them have been queued to Peter's target-arm.next branch,
but that hasn't made it to master yet.

** Changed in: qemu
       Status: New =3D> In Progress

** Changed in: qemu
     Assignee: (unassigned) =3D> Richard Henderson (rth)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1867072

Title:
  ARM: tag bits cleared in FAR_EL1

Status in QEMU:
  In Progress

Bug description:
  The ARM Architecture Reference Manual provides the following for
  FAR_EL1:

  "For a Data Abort or Watchpoint exception, if address tagging is
  enabled for the address accessed by the data access that caused the
  exception, then this field includes the tag."

  However, I have found that the tag bits in FAR_EL1 are always clear,
  even if the tag bits were set in the original access.

  I can reproduce the problem on both 4.1.1 and master
  (6e8a73e911f066527e775e04b98f31ebd19db600).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1867072/+subscriptions

