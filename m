Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E0B0F7B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 15:03:00 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8OkV-0006sN-03
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 09:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i8OiO-0005tS-O4
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:00:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i8OiN-0002by-5e
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:00:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:38402)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i8OiM-0002av-U8
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:00:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i8OiL-0007iP-CN
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 13:00:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0CE4D2E80D3
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 13:00:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Sep 2019 12:51:50 -0000
From: Anisse Astier <1843711@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: anisse
X-Launchpad-Bug-Reporter: Anisse Astier (anisse)
X-Launchpad-Bug-Modifier: Anisse Astier (anisse)
Message-Id: <156829271040.1120.16860411935336460779.malonedeb@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19044";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: c6df62e980e694ecc473db16157df13728bd4119
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1843711] [NEW] qemu-xhci device should detect if
 libusb host supports streams
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
Reply-To: Bug 1843711 <1843711@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When using USB=C2=A0passthrough with the qemu-xhci (and nec-usb-xhci),
streams are enabled by default, but if the host xHCI controller doesn't
support them, it will trigger hard-to-debug UAS guest errors.

This should be possible to detect since the kernel returns ENOSYS (errno 38=
) when xhci host controller does not support streams:
            libusb: error [do_streams_ioctl] streams-ioctl failed error -1 =
errno 38
            qemu: libusb_alloc_streams: -99 [OTHER]

Maybe libusb should return a dedicated error instead of
LIBUSB_ERROR_OTHER in this case, but qemu does not handle any other
error code anyway.

Just trying to enable streams before enabling them in qemu should do it.
I don't know if it should be done in hcd-xhci.c, host-libusb.c or
elsewhere, but this would be detectable at launch instead of a static
option true/false, maybe a ternary with auto would be better.

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: feature-request

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843711

Title:
  qemu-xhci device should detect if libusb host supports streams

Status in QEMU:
  New

Bug description:
  When using USB=C2=A0passthrough with the qemu-xhci (and nec-usb-xhci),
  streams are enabled by default, but if the host xHCI controller
  doesn't support them, it will trigger hard-to-debug UAS guest errors.

  This should be possible to detect since the kernel returns ENOSYS (errno =
38) when xhci host controller does not support streams:
              libusb: error [do_streams_ioctl] streams-ioctl failed error -=
1 errno 38
              qemu: libusb_alloc_streams: -99 [OTHER]

  Maybe libusb should return a dedicated error instead of
  LIBUSB_ERROR_OTHER in this case, but qemu does not handle any other
  error code anyway.

  Just trying to enable streams before enabling them in qemu should do
  it. I don't know if it should be done in hcd-xhci.c, host-libusb.c or
  elsewhere, but this would be detectable at launch instead of a static
  option true/false, maybe a ternary with auto would be better.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843711/+subscriptions

