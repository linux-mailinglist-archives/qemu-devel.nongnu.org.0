Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F7320D38
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 20:42:09 +0100 (CET)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDucK-0001oz-MO
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 14:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDub5-00016a-5Z
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:40:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:38284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDub0-00067D-7t
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:40:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lDuay-0006g2-9D
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 19:40:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0F9F72E8024
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 19:40:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Feb 2021 19:30:46 -0000
From: Stefan Weil <1914849@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: macos tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hikalium roolebo tnishinaga ubuntu-weilnetz
X-Launchpad-Bug-Reporter: Toshifumi NISHINAGA (tnishinaga)
X-Launchpad-Bug-Modifier: Stefan Weil (ubuntu-weilnetz)
References: <161259505296.24527.7729976640303273029.malonedeb@wampee.canonical.com>
Message-Id: <161393584615.11656.131144073098214065.malone@chaenomeles.canonical.com>
Subject: [Bug 1914849] Re: mprotect fails after MacOS 11.2 on arm mac
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bbfee60eef9f7fd8d30b24b3f53e75656e4d5fb0"; Instance="production"
X-Launchpad-Hash: 63e2a364ab7dfadc03a7cdbe57bb8d5175564006
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

It works for me when I use "./configure --enable-debug-tcg --extra-
cflags=3D-I/opt/homebrew/include".

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914849

Title:
  mprotect fails after MacOS 11.2 on arm mac

Status in QEMU:
  Confirmed

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

