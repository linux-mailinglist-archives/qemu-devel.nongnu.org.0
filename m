Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8281D233F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 01:52:37 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ1Ay-0003jO-TL
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 19:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jZ195-0000jq-HY
 for qemu-devel@nongnu.org; Wed, 13 May 2020 19:50:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:42218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jZ194-0002Fj-6z
 for qemu-devel@nongnu.org; Wed, 13 May 2020 19:50:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jZ192-0000Fe-7U
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 23:50:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 35ACC2E80E7
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 23:50:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2020 23:44:07 -0000
From: easyaspi314 <1878501@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: i386 linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: husseydevin
X-Launchpad-Bug-Reporter: easyaspi314 (husseydevin)
X-Launchpad-Bug-Modifier: easyaspi314 (husseydevin)
Message-Id: <158941344748.31408.6066832909673515633.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1878501] [NEW] qemu-i386 does not define AT_SYSINFO
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0385b538081bc4718df6fb844a3afc89729c94ce";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 8153661d407e4d6477520e1906968f92c2580907
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 19:50:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1878501 <1878501@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

qemu-i386 does not define the AT_SYSINFO auxval when running i386 Linux
binaries.

On most libcs, this is properly handled, but this is mandatory for the
i686 Bionic (Android) libc or it will segfault.

This is due to a blind assumption that getauxval(AT_SYSINFO) will return
a valid function pointer:

The code varies from version to version, but it looks like this:

void *__libc_sysinfo;
// mangled as _Z19__libc_init_sysinfov
void __libc_init_sysinfo() {
  bool dummy;
  // __bionic_getauxval =3D getauxval
  __libc_sysinfo =3D reinterpret_cast<void *>(__bionic_getauxval(AT_SYSINFO=
, dummy));
}

A simple way to reproduce is to compile a basic C program against the
NDK:

int main(void) { return 0; }

$ i686-linux-android-clang -static empty.c -o empty
$ qemu-i386 -cpu max ./empty
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault

The place where it segfaults is misleading: It will, at least on the
current NDK, crash on __set_thread_area, this is due to it calling a
function pointer to __libc_sysinfo returned by __kernel_syscall.

QEMU 4.1.1 (aarch64)
Pixel 2 XL via Termux

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: i386 linux-user

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878501

Title:
  qemu-i386 does not define AT_SYSINFO

Status in QEMU:
  New

Bug description:
  qemu-i386 does not define the AT_SYSINFO auxval when running i386
  Linux binaries.

  On most libcs, this is properly handled, but this is mandatory for the
  i686 Bionic (Android) libc or it will segfault.

  This is due to a blind assumption that getauxval(AT_SYSINFO) will
  return a valid function pointer:

  The code varies from version to version, but it looks like this:

  void *__libc_sysinfo;
  // mangled as _Z19__libc_init_sysinfov
  void __libc_init_sysinfo() {
    bool dummy;
    // __bionic_getauxval =3D getauxval
    __libc_sysinfo =3D reinterpret_cast<void *>(__bionic_getauxval(AT_SYSIN=
FO, dummy));
  }

  A simple way to reproduce is to compile a basic C program against the
  NDK:

  int main(void) { return 0; }

  $ i686-linux-android-clang -static empty.c -o empty
  $ qemu-i386 -cpu max ./empty
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault

  The place where it segfaults is misleading: It will, at least on the
  current NDK, crash on __set_thread_area, this is due to it calling a
  function pointer to __libc_sysinfo returned by __kernel_syscall.

  QEMU 4.1.1 (aarch64)
  Pixel 2 XL via Termux

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878501/+subscriptions

