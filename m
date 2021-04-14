Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0435F5FD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 16:19:09 +0200 (CEST)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWgMG-0003pi-0u
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 10:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWgJ3-0000ov-5G
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:15:50 -0400
Received: from indium.canonical.com ([91.189.90.7]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWgJ0-0005SS-I8
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:15:49 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWgIx-0004aJ-GV
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 14:15:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 786C52E8157
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 14:15:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Apr 2021 14:07:04 -0000
From: Roman Bolshakov <1914849@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: macos tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hikalium roolebo tnishinaga ubuntu-weilnetz
X-Launchpad-Bug-Reporter: Toshifumi NISHINAGA (tnishinaga)
X-Launchpad-Bug-Modifier: Roman Bolshakov (roolebo)
References: <161259505296.24527.7729976640303273029.malonedeb@wampee.canonical.com>
Message-Id: <161840922667.18031.16066179606888007339.launchpad@wampee.canonical.com>
Subject: [Bug 1914849] Re: mprotect fails after MacOS 11.2 on arm mac
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9327c982b35e4a485a3c716663ed8345e279c16e"; Instance="production"
X-Launchpad-Hash: 48b76e10a8f3fc02f3bc79a015f031d1c98cf548
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
Reply-To: Bug 1914849 <1914849@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Confirmed =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914849

Title:
  mprotect fails after MacOS 11.2 on arm mac

Status in QEMU:
  Fix Committed

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

