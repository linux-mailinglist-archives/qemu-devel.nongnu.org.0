Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B4331430A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:33:12 +0100 (CET)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9F5j-0003eP-4q
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9B9S-0007oG-QT
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:20:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:40020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l9B9N-0004j3-4k
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:20:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l9B9K-00046a-2a
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 18:20:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E48AF2E813B
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 18:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Feb 2021 18:08:14 -0000
From: Roman Bolshakov <1914849@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: macos tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hikalium roolebo tnishinaga
X-Launchpad-Bug-Reporter: Toshifumi NISHINAGA (tnishinaga)
X-Launchpad-Bug-Modifier: Roman Bolshakov (roolebo)
References: <161259505296.24527.7729976640303273029.malonedeb@wampee.canonical.com>
Message-Id: <161280769492.2878.8851519112088854609.malone@chaenomeles.canonical.com>
Subject: [Bug 1914849] Re: mprotect fails after MacOS 11.2 on arm mac
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: d68f3c6a975682578c799e54c386dbe1635487e7
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

The patch can be used as a workaround for now:
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..76be8c295b 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -110,6 +110,9 @@ int qemu_mprotect_none(void *addr, size_t size)
 {
 #ifdef _WIN32
     return qemu_mprotect__osdep(addr, size, PAGE_NOACCESS);
+#elif defined(__APPLE__) && defined(__arm64__)
+    /* Workaround mprotect (RWX->NONE) issue on Big Sur 11.2 */
+    return 0;
 #else
     return qemu_mprotect__osdep(addr, size, PROT_NONE);
 #endif

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914849

Title:
  mprotect fails after MacOS 11.2 on arm mac

Status in QEMU:
  New

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

