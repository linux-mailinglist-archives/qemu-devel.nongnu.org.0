Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C6249B31
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 12:52:19 +0200 (CEST)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Lha-0000On-D0
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 06:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8LgN-0007id-DK
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 06:51:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8LgL-0004Dy-Ih
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 06:51:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8LgJ-0004ie-CO
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 10:50:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4DD8F2E80E9
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 10:50:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2020 10:41:35 -0000
From: Jonathan Wakely <1886155@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jwakely mliska
X-Launchpad-Bug-Reporter: Martin Liska (mliska)
X-Launchpad-Bug-Modifier: Jonathan Wakely (jwakely)
References: <159376359338.16005.10195773015354828175.malonedeb@soybean.canonical.com>
Message-Id: <159783369523.16435.554838415958430933.malone@soybean.canonical.com>
Subject: =?utf-8?q?=5BBug_1886155=5D_Re=3A_error=3A_argument_2_of_=E2=80=98?=
 =?utf-8?b?X19hdG9taWNfbG9hZOKAmSBkaXNjYXJkcyDigJhjb25zdOKAmSBxdWFsaWZpZXI=?=
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: d48c58c0ce430c9e70cbbb1c48d73967f459bb82
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:50:59
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
Reply-To: Bug 1886155 <1886155@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Which means that given an argument of type T * const this defines a
local variable that is also T * const, and then tries to store the
result of the atomic load into that const variable:


```
#define atomic_rcu_read(ptr)                          \
    ({                                                \
    typeof_strip_qual(*ptr) _val;                     \
    atomic_rcu_read__nocheck(ptr, &_val);             \
    _val;                                             \
    })
```

GCC 11 correctly diagnoses that write to a const variable.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886155

Title:
  error: argument 2 of =E2=80=98__atomic_load=E2=80=99 discards =E2=80=98co=
nst=E2=80=99 qualifier

Status in QEMU:
  New

Bug description:
  GCC 11 reports the following errors:

  [  125s] In file included from /home/abuild/rpmbuild/BUILD/qemu-5.0.0/inc=
lude/qemu/seqlock.h:17,
  [  125s]                  from /home/abuild/rpmbuild/BUILD/qemu-5.0.0/inc=
lude/qemu/qht.h:10,
  [  125s]                  from /home/abuild/rpmbuild/BUILD/qemu-5.0.0/uti=
l/qht.c:69:
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c: In function '=
qht_do_lookup':
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:499:27: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   499 |                 void *p =3D atomic_rcu_read(&b->pointers=
[i]);
  [  125s]       |                           ^~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:506:13: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   506 |         b =3D atomic_rcu_read(&b->next);
  [  125s]       |             ^~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c: In function '=
qht_lookup_custom':
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:534:11: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   534 |     map =3D atomic_rcu_read(&ht->map);
  [  125s]       |           ^~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c: In function '=
qht_statistics_init':
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:907:11: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   907 |     map =3D atomic_rcu_read(&ht->map);
  [  125s]       |           ^~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:941:21: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   941 |                 b =3D atomic_rcu_read(&b->next);
  [  125s]       |                     ^~~~~~~~~~~~~~~

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886155/+subscriptions

