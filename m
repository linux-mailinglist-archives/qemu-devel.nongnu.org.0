Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156B73C4319
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 06:35:20 +0200 (CEST)
Received: from localhost ([::1]:57608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2nf4-0002PK-Vv
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 00:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWm-0000DT-Pb
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:39204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m2nWl-0006XD-1l
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 00:26:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m2nWW-0005K6-OL
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 305562E82C0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:26:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Jul 2021 04:17:28 -0000
From: Launchpad Bug Tracker <1907969@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386 linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor laurent-vivier lemonboy th-huth
X-Launchpad-Bug-Reporter: The Lemon Man (lemonboy)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160787658999.4842.1029995879259485885.malonedeb@gac.canonical.com>
Message-Id: <162606344823.2726.13586807805113256155.malone@loganberry.canonical.com>
Subject: [Bug 1907969] Re: linux-user/i386: Segfault when mixing threads and
 signals
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: 67dc8cee20b868d5578b1ea2ee34f6429288da1c
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
Reply-To: Bug 1907969 <1907969@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907969

Title:
  linux-user/i386: Segfault when mixing threads and signals

Status in QEMU:
  Expired

Bug description:
  Given the following C program, qemu-i386 will surely and certainly segfau=
lt when executing it.
  The problem is only noticeable if the program is statically linked to mus=
l's libc and, as written
  in the title, it only manifests when targeting i386.

  Removing the pthread calls or the second raise() makes it not
  segfault.

  The crash is in some part of the TCG-generated code, right when it tries =
to perform a
  %gs-relative access.

  If you want a quick way of cross-compiling this binary:

  * Download a copy of the Zig compiler from https://ziglang.org/download/
  * Compile it with
    `zig cc -target i386-linux-musl <C-FILE> -o <OUT>`

  ```
  #include <pthread.h>
  #include <signal.h>
  #include <stdio.h>
  #include <string.h>
  #include <sys/types.h>
  #include <unistd.h>
  #include <asm/prctl.h>
  #include <sys/syscall.h>

  void sig_func(int sig)
  {
      write(1, "hi!\n", strlen("hi!\n"));
  }

  void func(void *p) { }

  typedef void *(*F)(void *);

  int main()
  {
      pthread_t tid;

      struct sigaction action;
      action.sa_flags =3D 0;
      action.sa_handler =3D sig_func;

      if (sigaction(SIGUSR1, &action, NULL) =3D=3D -1) {
          return 1;
      }

      // This works.
      raise(SIGUSR1);

      pthread_create(&tid, NULL, (F)func, NULL);
      pthread_join(tid, NULL);

      // This makes qemu segfault.
      raise(SIGUSR1);
  }
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907969/+subscriptions

