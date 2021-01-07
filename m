Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3CC2EE9A1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:13:59 +0100 (CET)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeTe-0000B2-Pk
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxe7D-0005Nk-Rw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:50:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:58456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxe79-0005YX-4B
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:50:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxe77-00086F-AM
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 22:50:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4D3082E804B
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 22:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 07 Jan 2021 22:37:25 -0000
From: Linh Hoang <1910605@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lthoang
X-Launchpad-Bug-Reporter: Linh Hoang (lthoang)
X-Launchpad-Bug-Modifier: Linh Hoang (lthoang)
Message-Id: <161005904521.27189.16928489496057445235.malonedeb@soybean.canonical.com>
Subject: [Bug 1910605] [NEW] qemu-arm-static ioctl USBDEVFS_BULK return -1
 (EFAULT) Bad address
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: a27e09a905a533599e1139bd41b3b239216a6821
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
Reply-To: Bug 1910605 <1910605@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:


Snippet of code sample:

struct usbdevfs_bulktransfer Bulk;
Bulk.ep =3D hUsb->UsbOut;          =

Bulk.len =3D Len;          =

Bulk.data =3D (void *)pData;          =

Bulk.timeout =3D Timeout;
Bytes =3D ioctl(hUsb->fd, USBDEVFS_BULK, &Bulk)

The above code sample return -1 (EFAULT) Bad address when using qemu-
arm-static but is running ok when on qemu-aarch64-static.

I use a 64-bit intel laptop

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910605

Title:
  qemu-arm-static ioctl USBDEVFS_BULK return -1 (EFAULT) Bad address

Status in QEMU:
  New

Bug description:

  Snippet of code sample:

  struct usbdevfs_bulktransfer Bulk;
  Bulk.ep =3D hUsb->UsbOut;          =

  Bulk.len =3D Len;          =

  Bulk.data =3D (void *)pData;          =

  Bulk.timeout =3D Timeout;
  Bytes =3D ioctl(hUsb->fd, USBDEVFS_BULK, &Bulk)

  The above code sample return -1 (EFAULT) Bad address when using qemu-
  arm-static but is running ok when on qemu-aarch64-static.

  I use a 64-bit intel laptop

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910605/+subscriptions

