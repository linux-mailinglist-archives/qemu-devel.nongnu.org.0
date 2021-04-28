Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFFD36E15B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 00:02:24 +0200 (CEST)
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbsGF-0005EI-6b
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 18:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbsEl-0004fV-8u
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 18:00:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:50358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbsEj-0005Ky-2H
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 18:00:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lbsEh-0004Zs-7P
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 22:00:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3562B2E8010
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 22:00:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Apr 2021 21:54:10 -0000
From: Vitaly Buka <1926521@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: vitalybuka
X-Launchpad-Bug-Reporter: Vitaly Buka (vitalybuka)
X-Launchpad-Bug-Modifier: Vitaly Buka (vitalybuka)
Message-Id: <161964685051.14413.3981056017382622620.malonedeb@wampee.canonical.com>
Subject: [Bug 1926521] [NEW] QEMU-user ignores MADV_DONTNEED
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 8599e77ce45bb070d2763816cb33e055a12bef16
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
Reply-To: Bug 1926521 <1926521@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

There is comment int the code "This is a hint, so ignoring and returning su=
ccess is ok"
https://github.com/qemu/qemu/blob/b1cffefa1b163bce9aebc3416f562c1d3886eeaa/=
linux-user/syscall.c#L11941

But it seems incorrect with the current state of Linux

"man madvise" or https://man7.org/linux/man-pages/man2/madvise.2.html
says the following:
>>  These advice values do not influence the semantics
>>       of the application (except in the case of MADV_DONTNEED)

>> After a successful MADV_DONTNEED operation, the semantics
>> of memory access in the specified region are changed:
>> subsequent accesses of pages in the range will succeed,
>> but will result in either repopulating the memory contents
>> from the up-to-date contents of the underlying mapped file
>> (for shared file mappings, shared anonymous mappings, and
>> shmem-based techniques such as System V shared memory
>> segments) or zero-fill-on-demand pages for anonymous
>> private mappings.

Some applications use this behavior clear memory and it
would be nice to be able to run them on QEMU without
workarounds.

Reproducer on "Debian 5.10.24 x86_64 GNU/Linux" as a host.


```
#include "assert.h"
#include "stdio.h"
#include <sys/mman.h>
#include <errno.h>

int main() {
  char *P =3D (char *)mmap(0, 4096, PROT_READ | PROT_WRITE,
                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
  assert(P);
  *P =3D 'A';
  while (madvise(P, 4096, MADV_DONTNEED) =3D=3D -1 && errno =3D=3D EAGAIN) {
  }
  assert(*P =3D=3D 0);

  printf("OK\n");
}

/*
gcc /tmp/madvice.c -o /tmp/madvice

qemu-x86_64 /tmp/madvice
madvice: /tmp/madvice.c:13: main: Assertion `*P =3D=3D 0' failed.
qemu: uncaught target signal 6 (Aborted) - core dumped
Aborted

/tmp/madvice
OK


*/

```

** Affects: qemu
     Importance: Undecided
         Status: New

** Summary changed:

- QEMU-user does no respect MADV_DONTNEED
+ QEMU-user ignores MADV_DONTNEED

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926521

Title:
  QEMU-user ignores MADV_DONTNEED

Status in QEMU:
  New

Bug description:
  There is comment int the code "This is a hint, so ignoring and returning =
success is ok"
  https://github.com/qemu/qemu/blob/b1cffefa1b163bce9aebc3416f562c1d3886eea=
a/linux-user/syscall.c#L11941

  But it seems incorrect with the current state of Linux

  "man madvise" or https://man7.org/linux/man-pages/man2/madvise.2.html
  says the following:
  >>  These advice values do not influence the semantics
  >>       of the application (except in the case of MADV_DONTNEED)

  >> After a successful MADV_DONTNEED operation, the semantics
  >> of memory access in the specified region are changed:
  >> subsequent accesses of pages in the range will succeed,
  >> but will result in either repopulating the memory contents
  >> from the up-to-date contents of the underlying mapped file
  >> (for shared file mappings, shared anonymous mappings, and
  >> shmem-based techniques such as System V shared memory
  >> segments) or zero-fill-on-demand pages for anonymous
  >> private mappings.

  Some applications use this behavior clear memory and it
  would be nice to be able to run them on QEMU without
  workarounds.

  Reproducer on "Debian 5.10.24 x86_64 GNU/Linux" as a host.

  =

  ```
  #include "assert.h"
  #include "stdio.h"
  #include <sys/mman.h>
  #include <errno.h>

  int main() {
    char *P =3D (char *)mmap(0, 4096, PROT_READ | PROT_WRITE,
                           MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    assert(P);
    *P =3D 'A';
    while (madvise(P, 4096, MADV_DONTNEED) =3D=3D -1 && errno =3D=3D EAGAIN=
) {
    }
    assert(*P =3D=3D 0);

    printf("OK\n");
  }

  /*
  gcc /tmp/madvice.c -o /tmp/madvice

  qemu-x86_64 /tmp/madvice
  madvice: /tmp/madvice.c:13: main: Assertion `*P =3D=3D 0' failed.
  qemu: uncaught target signal 6 (Aborted) - core dumped
  Aborted

  /tmp/madvice
  OK

  =

  */

  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926521/+subscriptions

