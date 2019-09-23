Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F56BB6D8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 16:34:20 +0200 (CEST)
Received: from localhost ([::1]:57310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCPPv-00064K-AN
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 10:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iCPMk-0004Ue-9z
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:31:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iCPMj-00080U-6e
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:31:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:53494)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iCPMj-0007ym-0Q
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:31:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iCPMh-0000qW-QN
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:30:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C6AB12E80C9
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:30:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Sep 2019 14:25:31 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: marler8997 pmaydell
X-Launchpad-Bug-Reporter: Jonathan Marler (marler8997)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <152881015650.27433.14455383509623030686.malonedeb@gac.canonical.com>
Message-Id: <156924873193.5337.3827035666461540280.malone@chaenomeles.canonical.com>
Subject: [Bug 1776486] Re: detect error when kernel and initrd images exceed
 ram size
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 1c130aa185e2df574aadfd157645064f5dd747e8
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
Reply-To: Bug 1776486 <1776486@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of the 4.1 release we should now do a better job of identifying
overlaps between initrd, kernel, end of ram, etc, for the built-in arm
bootloader.


** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1776486

Title:
  detect error when kernel and initrd images exceed ram size

Status in QEMU:
  Fix Released

Bug description:
  I was unable to figure out why my VM wasn't booting when I added a
  "-initrd" image.  I would launch qemu and get no output, and no error
  message, it would just spin.

  Turns out my initrd image was around 270 MB but I wasn't giving an
  explicit ram size to qemu.  I was told the default memory size was
  around 120 MB so this was definitely a problem.  I think that the qemu
  "pseudo-bootloader" should detect when the kernel image and initrd
  image sizes exceed the size of ram and print a nice error to the user,
  something like:

  Error: the total size of the given boot images (342M) exceeds the size
  allocated for memory (120M)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1776486/+subscriptions

