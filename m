Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A22DE031
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:03:31 +0100 (CET)
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqBfd-0000qp-VV
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqBdS-0008Di-PK
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 04:01:14 -0500
Received: from indium.canonical.com ([91.189.90.7]:56832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kqBdA-0003Ks-H7
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 04:01:13 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kqBd7-00036W-5L
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 09:00:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 247F12E813A
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 09:00:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Dec 2020 08:48:35 -0000
From: taos <1908626@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ggbq
X-Launchpad-Bug-Reporter: taos (ggbq)
X-Launchpad-Bug-Modifier: taos (ggbq)
References: <160825871448.3957.12246357766912503656.malonedeb@wampee.canonical.com>
Message-Id: <160828131554.32032.3351696172710640037.malone@chaenomeles.canonical.com>
Subject: [Bug 1908626] Re: Atomic test-and-set instruction does not work on
 qemu-user
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: f4264ef624504c5258cdd0a402fb1ce08b62e8c8
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
Reply-To: Bug 1908626 <1908626@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Interestingly, the spinlock test works after I change tas() implementation
FROM
  __sync_lock_test_and_set(lock, 1);
TO
  __sync_val_compare_and_swap(lock, 0, 1);

## gcc (GCC) 8.3.1 20190311 (Red Hat 8.3.1-3)

=3D=3D=3D=3D
__sync_lock_test_and_set(lock, 1) disassembly:

```
objdump -S a.out

000000000040073c <tas>:
  40073c:	d10043ff 	sub	sp, sp, #0x10
  400740:	f90007e0 	str	x0, [sp, #8]
  400744:	f94007e0 	ldr	x0, [sp, #8]
  400748:	52800021 	mov	w1, #0x1                   	// #1
  40074c:	885f7c02 	ldxr	w2, [x0]
  400750:	88037c01 	stxr	w3, w1, [x0]
  400754:	35ffffc3 	cbnz	w3, 40074c <tas+0x10>
  400758:	d5033bbf 	dmb	ish
  40075c:	2a0203e0 	mov	w0, w2
  400760:	910043ff 	add	sp, sp, #0x10
  400764:	d65f03c0 	ret
```

=3D=3D=3D=3D
__sync_val_compare_and_swap(lock, 0, 1); disassembly:

```
objdump -S a.out

000000000040073c <tas>:
  40073c:	d10043ff 	sub	sp, sp, #0x10
  400740:	f90007e0 	str	x0, [sp, #8]
  400744:	f94007e0 	ldr	x0, [sp, #8]
  400748:	52800021 	mov	w1, #0x1                   	// #1
  40074c:	885f7c02 	ldxr	w2, [x0]
  400750:	35000062 	cbnz	w2, 40075c <tas+0x20>
  400754:	8803fc01 	stlxr	w3, w1, [x0]
  400758:	35ffffa3 	cbnz	w3, 40074c <tas+0x10>
  40075c:	7100005f 	cmp	w2, #0x0
  400760:	d5033bbf 	dmb	ish
  400764:	2a0203e0 	mov	w0, w2
  400768:	910043ff 	add	sp, sp, #0x10
  40076c:	d65f03c0 	ret
```

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908626

Title:
  Atomic test-and-set instruction does not work on qemu-user

Status in QEMU:
  New

Bug description:
  I try to compile and run PostgreSQL/Greenplum database inside docker cont=
ainer/qemu-aarch64-static:
  ```
   host: CentOS7 x86_64
   container: centos:centos7.9.2009 --platform linux/arm64/v8
   qemu-user-static: https://github.com/multiarch/qemu-user-static/releases/
  ```

  However, GP/PG's spinlock always gets stuck and reports PANIC errors. It =
seems its spinlock
  has something wrong.
  ```
  https://github.com/greenplum-db/gpdb/blob/master/src/include/storage/s_lo=
ck.h
  https://github.com/greenplum-db/gpdb/blob/master/src/backend/storage/lmgr=
/s_lock.c
  ```

  So I extract its spinlock implementation into one test C source file (see=
 attachment file),
  and get reprodcued:

  ```
  $ gcc spinlock_qemu.c
  $ ./a.out =

  C -- slock inited, lock value is: 0
  parent 139642, child 139645
  P -- slock lock before, lock value is: 0
  P -- slock locked, lock value is: 1
  P -- slock unlock after, lock value is: 0
  C -- slock lock before, lock value is: 1
  P -- slock lock before, lock value is: 1
  C -- slock locked, lock value is: 1
  C -- slock unlock after, lock value is: 0
  C -- slock lock before, lock value is: 1
  P -- slock locked, lock value is: 1
  P -- slock unlock after, lock value is: 0
  P -- slock lock before, lock value is: 1
  C -- slock locked, lock value is: 1
  C -- slock unlock after, lock value is: 0
  P -- slock locked, lock value is: 1
  C -- slock lock before, lock value is: 1
  P -- slock unlock after, lock value is: 0
  C -- slock locked, lock value is: 1
  P -- slock lock before, lock value is: 1
  C -- slock unlock after, lock value is: 0
  P -- slock locked, lock value is: 1
  C -- slock lock before, lock value is: 1
  P -- slock unlock after, lock value is: 0
  C -- slock locked, lock value is: 1
  P -- slock lock before, lock value is: 1
  C -- slock unlock after, lock value is: 0
  P -- slock locked, lock value is: 1
  C -- slock lock before, lock value is: 1
  P -- slock unlock after, lock value is: 0
  P -- slock lock before, lock value is: 1
  spin timeout, lock value is 1 (pid 139642)
  spin timeout, lock value is 1 (pid 139645)
  spin timeout, lock value is 1 (pid 139645)
  spin timeout, lock value is 1 (pid 139642)
  spin timeout, lock value is 1 (pid 139645)
  spin timeout, lock value is 1 (pid 139642)
  ...
  ...
  ...
  ```

  NOTE: this code always works on PHYSICAL ARM64 server.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908626/+subscriptions

