Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6682A0EEE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 20:56:36 +0100 (CET)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYaVn-0000hP-HA
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 15:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kYaUw-0000ES-3o
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 15:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:47208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kYaUt-00045A-Pt
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 15:55:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kYaUr-0007CD-LV
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 19:55:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 972402E804B
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 19:55:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2020 19:50:17 -0000
From: Greg Zdanowski <1902306@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kiler129
X-Launchpad-Bug-Reporter: Greg Zdanowski (kiler129)
X-Launchpad-Bug-Modifier: Greg Zdanowski (kiler129)
Message-Id: <160408741769.30267.7403254595393961918.malonedeb@gac.canonical.com>
Subject: [Bug 1902306] [NEW] Allow setting usb storage device ID parameters
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="96ff31b88b65a0d0ea73b89333fe7c4a2669d8fb"; Instance="production"
X-Launchpad-Hash: 97adba06f3b0b47edfa8ae179eb65e7fcb398488
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 15:55:38
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1902306 <1902306@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Some stubborn software requires certain VID/PID/Serial to authenticate
and refuses to start in emulation. This poses a problem with unsupported
programs which often require keeping an ancient hardware praying that
the USB stick will not die before the (often defunct) company making it.

Virtualizing such environment is desired. However, QEMU doesn't allow
setting VID/PID/Serial/Name of emulated USB devices, but instead uses
hardcoded values:
https://github.com/qemu/qemu/blob/c99fa56b95a72f6debd50a280561895d078ae020/=
hw/usb
/dev-storage.c#L95

This request (including a patch) was already made in 2015 on the list
but never got any response: https://lists.nongnu.org/archive/html/qemu-
discuss/2015-07/msg00072.html


WDYT of adding such functionality?

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: feature-request

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1902306

Title:
  Allow setting usb storage device ID parameters

Status in QEMU:
  New

Bug description:
  Some stubborn software requires certain VID/PID/Serial to authenticate
  and refuses to start in emulation. This poses a problem with
  unsupported programs which often require keeping an ancient hardware
  praying that the USB stick will not die before the (often defunct)
  company making it.

  Virtualizing such environment is desired. However, QEMU doesn't allow
  setting VID/PID/Serial/Name of emulated USB devices, but instead uses
  hardcoded values:
  https://github.com/qemu/qemu/blob/c99fa56b95a72f6debd50a280561895d078ae02=
0/hw/usb
  /dev-storage.c#L95

  This request (including a patch) was already made in 2015 on the list
  but never got any response: https://lists.nongnu.org/archive/html
  /qemu-discuss/2015-07/msg00072.html

  =

  WDYT of adding such functionality?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1902306/+subscriptions

