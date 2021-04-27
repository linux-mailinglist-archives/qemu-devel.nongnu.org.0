Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996336BE82
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 06:32:34 +0200 (CEST)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbFOj-0003NR-FC
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 00:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbFN7-0002ut-2s
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 00:30:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:46010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbFN1-0002ni-Pa
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 00:30:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lbFMy-0001br-VD
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 04:30:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E9D5E2E808A
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 04:30:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Apr 2021 04:20:59 -0000
From: Thomas Huth <1895305@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kaniini th-huth z3ntu
X-Launchpad-Bug-Reporter: Luca Weiss (z3ntu)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159983459206.747.8861900115459003190.malonedeb@chaenomeles.canonical.com>
Message-Id: <161949725965.4401.18129197045610568045.malone@gac.canonical.com>
Subject: [Bug 1895305] Re: pthread_cancel fails with "RT33" with musl libc
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 22208a751cf24bde35ef50a0dc325a7433149bfc
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
Reply-To: Bug 1895305 <1895305@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, thanks, since this was a regressin in Alpine, I'm marking the bug as
closed here.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895305

Title:
  pthread_cancel fails with "RT33" with musl libc

Status in QEMU:
  Invalid

Bug description:
  From my testing it seems that QEMU built against musl libc crashes on
  pthread_cancel cancel calls - if the binary is also built with musl
  libc.

  Minimal sample:

  #include <pthread.h>
  #include <stdio.h>
  #include <unistd.h>
  void* threadfunc(void* ignored) {
  	while (1) {
  		pause();
  	}
  	return NULL;
  }
  int main() {
  	pthread_t thread;
  	pthread_create(&thread, NULL, &threadfunc, NULL);
  	sleep(1);
  	pthread_cancel(thread);
  	printf("OK, alive\n");
  }

  In an Alpine Linux aarch64 chroot (on an x86_64 host) the binary will
  just output RT33 and has exit code 161.

  Using qemu-aarch64 on an x86_64 host results in the output (fish shell)
    fish: =E2=80=9Cqemu-aarch64-static ./musl-stat=E2=80=A6=E2=80=9D termin=
ated by signal Unknown (Unknown)
  or (bash)
    Real-time signal 2

  and exit code 164.

  It doesn't matter whether the binary is linked dynamically or static.
  You can see my test results in the following table:

  |                      | QEMU glibc | QEMU musl |
  |----------------------|------------|-----------|
  | binary glibc dynamic | =E2=9C=93          | =E2=9C=93         |
  | binary glibc static  | =E2=9C=93          | =E2=9C=93         |
  | binary musl dynamic  | =E2=9C=93          | =E2=9C=97         |
  | binary musl static   | =E2=9C=93          | =E2=9C=97         |

  Both QEMU builds are v5.1.0 (glibc v2.32 / musl v1.2.1)

  I've uploaded all my compile and test commands (plus a script to
  conveniently run them all) to https://github.com/z3ntu/qemu-
  pthread_cancel . It also includes the built binaries if needed. The
  test script output can be found at https://github.com/z3ntu/qemu-
  pthread_cancel/blob/master/results.txt

  Further links:
  - https://gitlab.com/postmarketOS/pmaports/-/issues/190#note_141902075
  - https://gitlab.com/postmarketOS/pmbootstrap/-/issues/1970

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895305/+subscriptions

