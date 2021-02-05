Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332EF31026C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 02:52:02 +0100 (CET)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7qHw-0003BY-MT
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 20:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7qGg-0002gn-Fy
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 20:50:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:41904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7qGe-0004A6-10
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 20:50:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7qGc-0004Gv-1k
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 01:50:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D44802E813A
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 01:50:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Feb 2021 01:40:23 -0000
From: John Arbuckle <1914667@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: programmingkidx
X-Launchpad-Bug-Reporter: John Arbuckle (programmingkidx)
X-Launchpad-Bug-Modifier: John Arbuckle (programmingkidx)
References: <161248158218.12871.10682279346002918371.malonedeb@soybean.canonical.com>
Message-Id: <161248922373.2846.17006090225355491407.malone@gac.canonical.com>
Subject: [Bug 1914667] Re: High cpu usage when guest is idle on
 qemu-system-i386
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 0e0ee4004b46f853fc63b34a81d7b463305ce1d3
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
Reply-To: Bug 1914667 <1914667@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For version 5.2 of qemu-system-i386 the instruction the guest is busy
executing over and over again is this: addb %al, (%eax)

For version 2.10.1 this is the instruction that is being executed when the =
guest is idle:
add %al,(%eax)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914667

Title:
  High cpu usage when guest is idle on qemu-system-i386

Status in QEMU:
  New

Bug description:
  When running Windows XP in qemu-system-i386, the cpu usage of QEMU is
  about 100% even when the guest CPU usage is close to 2%. The host cpu
  usage should be low when the guest cpu usage is low.

  Command: qemu-system-i386 -hda <Windows XP HD image>

  Using this command also shows around 100% host CPU usage:
  qemu-system-i386 -m 700 -hda <Windows XP HD image> -usb -device usb-audio=
 -net nic,model=3Drtl8139 -net user -hdb mountable.img -soundhw pcspk

  Using the Penryn CPU option also saw this problem:
  qemu-system-i386 -hda <Windows XP HD image> -m 700 -cpu Penryn-v1

  Using "-cpu pentium2" saw the same high host cpu usage.

  =

  My Info:
  M1 MacBook Air
  Mac OS 11.1
  qemu-system-i386 version 5.2 (1ba089f2255bfdb071be3ce6ac6c3069e8012179)
  Windows XP SP3 Build 2600

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914667/+subscriptions

