Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283736F77F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:05:10 +0200 (CEST)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcP5B-0006Wq-1R
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcP1d-0004pw-IR
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:01:29 -0400
Received: from indium.canonical.com ([91.189.90.7]:59268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcP1a-0006Oc-LM
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:01:29 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcP1Y-00085Q-G1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:01:24 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7839D2E815A
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:01:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:54:25 -0000
From: Thomas Huth <1915925@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: semihosting testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee inver7 keithp pmaydell
X-Launchpad-Bug-Reporter: iNvEr7 (inver7)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161356438332.24036.4652954745285513495.malonedeb@chaenomeles.canonical.com>
Message-Id: <161977286608.13825.12992255046582367235.launchpad@wampee.canonical.com>
Subject: [Bug 1915925] Re: ARM semihosting HEAPINFO results wrote to wrong
 address
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 8d2296590fbde843c5701bf2c60a6348ab31a936
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
Reply-To: Bug 1915925 <1915925@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915925

Title:
  ARM semihosting HEAPINFO results wrote to wrong address

Status in QEMU:
  Fix Released

Bug description:
  This affects latest development branch of QEMU.

  According to the ARM spec of the HEAPINFO semihosting call:

  https://developer.arm.com/documentation/100863/0300/Semihosting-
  operations/SYS-HEAPINFO--0x16-?lang=3Den

  > the PARAMETER REGISTER contains the address of a pointer to a four-
  field data block.

  However, QEMU treated the PARAMETER REGISTER as pointing to a four-
  field data block directly.

  Here is a simple program that can demonstrate this problem:
  https://github.com/iNvEr7/qemu-learn/tree/newlib-bug/semihosting-
  newlib

  This code links with newlib with semihosting mode, which will call the
  HEAPINFO SVC during crt0 routine. When running in QEMU (make run), it
  may crash the program either because of invalid write or memory
  curruption, depending on the compiled program structure.

  Also refer to my discussion with newlib folks:
  https://sourceware.org/pipermail/newlib/2021/018260.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915925/+subscriptions

