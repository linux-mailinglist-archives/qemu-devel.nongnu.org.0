Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341301BFD26
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 16:11:00 +0200 (CEST)
Received: from localhost ([::1]:57618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU9tz-0000UK-2g
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 10:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9ao-0003Pc-VD
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9an-0000ie-30
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:36284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jU9ak-0000YX-Ue
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jU9aj-0007Vi-Tm
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:51:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E06202E80E7
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:51:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2020 13:42:07 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 5-plamen laurent-vivier xanclic
X-Launchpad-Bug-Reporter: pevogam (5-plamen)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <157918316689.4864.12553262908100217782.malonedeb@wampee.canonical.com>
Message-Id: <158825412830.13095.14370065392694908276.launchpad@gac.canonical.com>
Subject: [Bug 1859989] Re: qemu-img has broken output with large snapshot names
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e8f86d7e454c6c207864623e9a84f252c90388b1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 09:35:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Reply-To: Bug 1859989 <1859989@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859989

Title:
  qemu-img has broken output with large snapshot names

Status in QEMU:
  Fix Released

Bug description:
  On Qemu 4.1.1 the output of snapshots breaks if the chosen state name
  is too long:

  ```
  # qemu-img snapshot -l /mnt/local/some_image.qcow2
  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         online_provider_with_dhcp747 MiB 2020-01-15 12:05:01   00:00:45=
.873
  ```

  Prior to 4.1.1 this used to work with extra tabs for the VM SIZE
  values. The collision is also disabling us from using a regex on top
  of this output to detect the snapshot.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859989/+subscriptions

