Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111B12D8EC0
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:32:32 +0100 (CET)
Received: from localhost ([::1]:34192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koUIQ-0005zO-My
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1koUGm-00054q-09
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:30:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:56864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1koUGj-0002Rm-J6
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 11:30:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1koUGh-0005YT-L1
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:30:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 750C82E8143
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:30:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Dec 2020 16:23:09 -0000
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
Message-Id: <160787658999.4842.1029995879259485885.malonedeb@gac.canonical.com>
Subject: [Bug 1907969] [NEW] linux-user/i386: Segfault when mixing threads and
 signals
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 060eeafffb81a3c1035f754125224f14e4a67f6b
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

Public bug reported:

Given the following C program, qemu-i386 will surely and certainly segfault=
 when executing it.
The problem is only noticeable if the program is statically linked to musl'=
s libc and, as written
in the title, it only manifests when targeting i386.

Removing the pthread calls or the second raise() makes it not segfault.

The crash is in some part of the TCG-generated code, right when it tries to=
 perform a
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

** Affects: qemu
     Importance: Undecided
         Status: New

** Attachment added: "Compiled static binary"
   https://bugs.launchpad.net/bugs/1907969/+attachment/5443145/+files/muslt

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

