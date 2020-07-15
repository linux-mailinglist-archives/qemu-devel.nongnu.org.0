Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A552C22152E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 21:36:31 +0200 (CEST)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvnCg-0002vW-A0
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 15:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jvnBl-0002PJ-R2
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 15:35:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:40710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jvnBj-0004vE-Pc
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 15:35:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jvnBh-0005rh-Qb
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 19:35:29 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C4AF62E80E7
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 19:35:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2020 19:27:01 -0000
From: Laurent Vivier <1884719@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier martingrigorov stefanha
X-Launchpad-Bug-Reporter: Martin Grigorov (martingrigorov)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <159289799812.6175.17000319886186623286.malonedeb@soybean.canonical.com>
Message-Id: <159484122185.13408.13793535130171501254.malone@gac.canonical.com>
Subject: [Bug 1884719] Re: Function not implemented when using libaio
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4809fcb62f445aaa3ae919f7f6c3cc7d156ea57a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 51e1c94b100fe7736d13dcbf58e08ad961de5bc7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 15:35:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1884719 <1884719@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Martin,

after a first look, I can see that asynchronicity introduces more
complexity in QEMU than usual ...

I'm going to try to write the patches. I will ask you some help to test
them.

I've already implemented io_setup and io_destroy, but io_submit
introduces more complexity because we can only cleanup qemu internal
buffers when the I/O are done. To do that we need to intercept events at
io_getevents level.


I will push my patches here:

https://github.com/vivier/qemu/commits/linux-user-libaio

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884719

Title:
  Function not implemented when using libaio

Status in QEMU:
  New

Bug description:
  Hello

  I experience "Function not implemented" errors when trying to use
  Linux libaio library in foreign architecture, e.g. aarch64.

  I've faced this problem while using https://github.com/multiarch/qemu-use=
r-static, i.e. Docker+QEMU. =

  I understand that I do not use plain QEMU and you may count this report a=
s a "distribution of QEMU"! Just let me know what are the steps to test it =
with plain QEMU and I will test and update this ticket!

  =

  Here are the steps to reproduce the issue:

  1) On x86_64 machine register QEMU:

      `docker run -it --rm --privileged multiarch/qemu-user-static
  --reset --credential yes --persistent yes`

  2) Start a Docker image with foreign CPU architecture, e.g. aarch64

      `docker run -it arm64v8/centos:8 bash`

  3) Inside the Docker container install GCC and libaio

      `yum install gcc libaio libaio-devel`

  4) Compile the following C program

  ```
  #include <stdio.h>
  #include <errno.h>
  #include <libaio.h>
  #include <stdlib.h>

  struct io_control {
      io_context_t ioContext;
  };

  int main() {
      int queueSize =3D 10;

      struct io_control * theControl =3D (struct io_control *) malloc(sizeo=
f(struct io_control));
      if (theControl =3D=3D NULL) {
          printf("theControl is NULL");
          return 123;
      }

      int res =3D io_queue_init(queueSize, &theControl->ioContext);
      io_queue_release(theControl->ioContext);
      free(theControl);
      printf("res is: %d", res);
  }
  ```

      ```
      cat > test.c
          [PASTE THE CODE ABOVE HERE]
      ^D
      ```

      `gcc test.c -o out -laio && ./out`

  =

  When executed directly on aarch64 machine (i.e. without emulation) or on =
x86_64 Docker image (e.g. centos:8) it prints `res is: 0`, i.e. it successf=
ully initialized a LibAIO queue.

  But when executed on Docker image with foreign/emulated CPU
  architecture it prints `res is: -38` (ENOSYS). `man io_queue_init`
  says that error ENOSYS is returned when "Not implemented."

  Environment:

  QEMU version: 5.0.0.2  (https://github.com/multiarch/qemu-user-static/blo=
b/master/.travis.yml#L24-L28)
  Container application: Docker
  Output of `docker --version`:

  ```
  Client:
   Version:           19.03.8
   API version:       1.40
   Go version:        go1.13.8
   Git commit:        afacb8b7f0
   Built:             Wed Mar 11 23:42:35 2020
   OS/Arch:           linux/amd64
   Experimental:      false

  Server:
   Engine:
    Version:          19.03.8
    API version:      1.40 (minimum version 1.12)
    Go version:       go1.13.8
    Git commit:       afacb8b7f0
    Built:            Wed Mar 11 22:48:33 2020
    OS/Arch:          linux/amd64
    Experimental:     false
   containerd:
    Version:          1.3.3-0ubuntu2
    GitCommit:        =

   runc:
    Version:          spec: 1.0.1-dev
    GitCommit:        =

   docker-init:
    Version:          0.18.0
    GitCommit:        =

  ```

  Same happens with Ubuntu (arm64v8/ubuntu:focal).

  I've tried to `strace` it but :

  ```
  /usr/bin/strace: ptrace(PTRACE_TRACEME, ...): Function not implemented
  /usr/bin/strace: PTRACE_SETOPTIONS: Function not implemented
  /usr/bin/strace: detach: waitpid(112): No child processes
  /usr/bin/strace: Process 112 detached
  ```

  Here are the steps to reproduce the problem with strace:

       ```
       docker run --rm -it --security-opt seccomp:unconfined --security-opt=
 apparmor:unconfined --privileged --cap-add ALL arm64v8/centos:8 bash

       yum install -y strace`

       strace echo Test
       ```

  Note: I used --privileged, disabled seccomp and apparmor, and added
  all capabilities

  Disabling security solves the "Permission denied" problem but then
  comes the "Not implemented" one.

  =

  Any idea what could be the problem and how to work it around ?
  I've googled a lot but I wasn't able to find any problems related to liba=
io on QEMU.

  Thank you!
  Martin

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884719/+subscriptions

