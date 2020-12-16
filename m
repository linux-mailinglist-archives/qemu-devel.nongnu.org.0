Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4DF2DBD58
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:13:00 +0100 (CET)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSrj-00065o-UQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpSpm-0004jy-FQ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:10:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:58720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kpSpk-0007GC-4Z
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:10:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kpSph-00080b-PF
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 09:10:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B3C272E813B
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 09:10:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Dec 2020 08:59:30 -0000
From: The Lemon Man <1907969@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lemonboy
X-Launchpad-Bug-Reporter: The Lemon Man (lemonboy)
X-Launchpad-Bug-Modifier: The Lemon Man (lemonboy)
References: <160787658999.4842.1029995879259485885.malonedeb@gac.canonical.com>
Message-Id: <160810917079.11466.17769055912453974010.malone@wampee.canonical.com>
Subject: [Bug 1907969] Re: linux-user/i386: Segfault when mixing threads and
 signals
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 3ddd8cd5dbeed87bbfd1d5624db6bbb4b2af5846
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
Reply-To: Bug 1907969 <1907969@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I finally understand where the problem is.

Qemu's user-mode emulation maps guest threads to native ones by spawning a =
new native one
and running a forked copy of the CPUX86State in parallel with the main thre=
ad.

This works fine for pretty much every architecture but i386 where the GDT/L=
DT comes into
play: the two descriptor tables are shared among all the threads, mimicking=
 the real hw
behaviour, but since no host task-switching is being performed the TLS entr=
y in the GDT
become stale.

Raising a signal makes Qemu reload the GS segment from the GDT, that's why =
removing that
line makes the problem disappear.

The problem is also confined to musl libc because of an interesting impleme=
ntation choice.
Once a thread dies Glibc adds the now unused stack to a queue in order to r=
euse it later,
while musl frees it right away when it's not needed anymore and, as a conse=
quence, makes
Qemu segfault.

As luck has it, after spending too much time debugging this, I found somebo=
dy else already
stumbled across this problem and wrote a patch. =


https://patchew.org/QEMU/74c9f1d9-4497-31c2-34a7-e21bef7932bd@scieneer.com/=
mbox

Too bad the patch flew under the radar...

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907969

Title:
  linux-user/i386: Segfault when mixing threads and signals

Status in QEMU:
  New

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

