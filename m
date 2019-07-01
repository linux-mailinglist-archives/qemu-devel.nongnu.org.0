Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8B31A1FC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 18:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP8lV-0003GD-US
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 12:52:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hP8jU-0001lj-W4
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:50:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hP8jU-0007EY-2S
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:50:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:40052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hP8jT-0007EL-Tf
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:50:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hP8jS-0003Tc-Nt
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 16:50:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id ADA1B2E80CB
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 16:50:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 May 2019 16:40:51 -0000
From: Erik Kline <1814352@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
	assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ekline pmaydell
X-Launchpad-Bug-Reporter: Erik Kline (ekline)
X-Launchpad-Bug-Modifier: Erik Kline (ekline)
References: <154907151753.31178.12938166708527410326.malonedeb@gac.canonical.com>
Message-Id: <155750645168.26633.1285763542066636816.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18962";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 4dc514e4d1cd65ae1fc705e75ab1e6aa9cedddff
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1814352] Re: SIOCGIFNAME takes a struct ifreq not
 an integer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1814352 <1814352@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you, all.

** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1814352

Title:
  SIOCGIFNAME takes a struct ifreq not an integer

Status in QEMU:
  Fix Committed

Bug description:
  The ioctl SIOCGIFNAME takes a pointer to a struct ifreq, not an
  integer.  This leads to if_indextoname() not correctly returning
  interface names (well, not if they're longer than 4 characters
  including the trailing NULL ;-).

  This is observed on v3.1.0.

  The following one-line patch will be sent to the qemu-devel mailing
  list:

  """
  diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
  index ae8951625f..37501f575c 100644
  --- a/linux-user/ioctls.h
  +++ b/linux-user/ioctls.h
  @@ -178,7 +178,7 @@
   #endif /* CONFIG_USBFS */
   =

     IOCTL(SIOCATMARK, IOC_R, MK_PTR(TYPE_INT))
  -  IOCTL(SIOCGIFNAME, IOC_RW, MK_PTR(TYPE_INT))
  +  IOCTL(SIOCGIFNAME, IOC_RW, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)))
     IOCTL(SIOCGIFFLAGS, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_short_ifreq=
)))
     IOCTL(SIOCSIFFLAGS, IOC_W, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
     IOCTL(SIOCGIFADDR, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifr=
eq)))
  """

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1814352/+subscriptions

