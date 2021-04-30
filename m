Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB5636F744
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:41:03 +0200 (CEST)
Received: from localhost ([::1]:33656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOhq-00039c-P8
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOd6-0007fX-7r
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:36:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:49620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOcr-0007pF-O9
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:36:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOco-0003Oo-M9
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:35:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9E6C92E8157
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:35:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:21:54 -0000
From: Thomas Huth <1407808@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nyh pmaydell th-huth
X-Launchpad-Bug-Reporter: Nadav Har'El (nyh)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20150105215424.22410.18753.malonedeb@gac.canonical.com>
Message-Id: <161977091553.4988.11244421543435687999.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1407808] Re: virtual console gives strange response to ANSI DSR
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 7b584d171ce23e69d7267d864ac10f53ba763ef8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1407808

Title:
  virtual console gives strange response to ANSI DSR

Status in QEMU:
  Fix Released

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

