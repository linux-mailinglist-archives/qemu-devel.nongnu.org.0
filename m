Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791CB345036
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:47:27 +0100 (CET)
Received: from localhost ([::1]:40406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQWM-0006GI-Ht
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOQP8-00011s-6k
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:39:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:44110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOQP6-00058o-8P
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 15:39:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lOQP4-0006qV-35
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 19:39:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0710F2E8165
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 19:39:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Mar 2021 19:22:40 -0000
From: Peter Maydell <1407808@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nyh pmaydell th-huth
X-Launchpad-Bug-Reporter: Nadav Har'El (nyh)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20150105215424.22410.18753.malonedeb@gac.canonical.com>
Message-Id: <161644096067.28371.10292134086588423661.malone@gac.canonical.com>
Subject: [Bug 1407808] Re: virtual console gives strange response to ANSI DSR
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 2eb249569c95ffb574d301d7e5c8be5adbfb60c4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1407808 <1407808@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should be fixed in head-of-git by commit 8eb13bbbac08a, which will
be in QEMU 6.0. (The underlying bug is that when the GTK front-end tries
to send sequences of more than one byte to a UART, it didn't account for
UARTs which don't have a FIFO capable of holding the whole sequence at
once.)


** Changed in: qemu
       Status: Triaged =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1407808

Title:
  virtual console gives strange response to ANSI DSR

Status in QEMU:
  Fix Committed

Bug description:
  With "-serial vc" (which is the default), qemu make strange responses
  to the ANSI DSR escape sequence (\033[6n) which can confuse guests.

  Terminal emulators supporting the ANSI escape sequences usually
  support the "Device Status Report" escape sequence, \033[6n, to which
  as a response the terminal injects as input the response \033[n;mR,
  containing the current cursor position. An application running in the
  guest can use this escape sequence to, for example, figure out the
  size of the terminal it is running under, which can be useful as the
  guest has no other standard way to figure out a "size" for the serial
  port.

  Unfortunately, it seems that qemu when run with "-serial vc" (which
  appears to be the default), when qemu gets the \033[6n escape sequence
  on the serial port, it just responds with a single \033, and that's
  it! This can confuse an application, could concievably assume that a
  terminal either supports this escape sequence and injects the correct
  response (\033[n;mR), or doesn't support it and injects absolutely
  nothing as input - but not something in between.

  This caused a problem on one shell implementation on OSv that tried to
  figure out the terminal's size, and had to work around this unexpected
  behavior (see https://github.com/cloudius-
  systems/osv/commit/b79223584be40459861d1c12e1cb67e3e49e2a12).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1407808/+subscriptions

