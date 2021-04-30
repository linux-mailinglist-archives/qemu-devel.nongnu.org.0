Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5836F70D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:23:54 +0200 (CEST)
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcORF-0008S0-0l
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOPq-0007hS-68
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:22:26 -0400
Received: from indium.canonical.com ([91.189.90.7]:44752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOPn-000891-TY
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:22:25 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOPl-0000FW-Cs
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:22:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 544A02E8162
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:22:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:14:48 -0000
From: Thomas Huth <1914849@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: macos tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hikalium roolebo th-huth tnishinaga ubuntu-weilnetz
X-Launchpad-Bug-Reporter: Toshifumi NISHINAGA (tnishinaga)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161259505296.24527.7729976640303273029.malonedeb@wampee.canonical.com>
Message-Id: <161977048897.13717.12819990650056380083.malone@wampee.canonical.com>
Subject: [Bug 1914849] Re: mprotect fails after MacOS 11.2 on arm mac
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 2d8644e8865749389d570ce45bcaf638cd34d949
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
Reply-To: Bug 1914849 <1914849@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed here:
https://gitlab.com/qemu-project/qemu/-/commit/c118881ee607dcac

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914849

Title:
  mprotect fails after MacOS 11.2 on arm mac

Status in QEMU:
  Fix Released

Bug description:
  I got the following error when I ran qemu on arm mac(MacOS 11.2).

  ```
  $ ./qemu-system-x86_64
  qemu-system-x86_64: qemu_mprotect__osdep: mprotect failed: Permission den=
ied
  **
  ERROR:../tcg/tcg.c:844:tcg_region_init: assertion failed: (!rc)
  Bail out! ERROR:../tcg/tcg.c:844:tcg_region_init: assertion failed: (!rc)
  [1]    34898 abort      ./qemu-system-x86_64
  ```

  I tested the same version of qemu on intel mac(MacOS 11.2), but it
  works fine.

  And my friend told me that they did not have this error with MacOS
  11.1.

  So, I think it is CPU architecture or an OS version dependent error.

  =

  Environment:

  Qemu commit id: d0dddab40e472ba62b5f43f11cc7dba085dabe71
  OS: MacOS 11.2(20D64)
  Hardware: MacBook Air (M1, 2020)

  =

  How to build:

  ```
  mkdir build/
  cd build/
  ../configure --target-list=3Daarch64-softmmu,x86_64-softmmu
  make
  ```

  =

  How to reproduce:

  ```
  ./qemu-system-x86_64
  ```

  =

  Error message:

  ```
  $ ./qemu-system-x86_64
  qemu-system-x86_64: qemu_mprotect__osdep: mprotect failed: Permission den=
ied
  **
  ERROR:../tcg/tcg.c:844:tcg_region_init: assertion failed: (!rc)
  Bail out! ERROR:../tcg/tcg.c:844:tcg_region_init: assertion failed: (!rc)
  [1]    34898 abort      ./qemu-system-x86_64
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914849/+subscriptions

