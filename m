Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0D4E1613
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 11:31:14 +0200 (CEST)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNCz2-00061a-Ey
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 05:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iNCpX-0001A9-OK
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 05:21:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iNCpW-0000wF-I9
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 05:21:23 -0400
Received: from indium.canonical.com ([91.189.90.7]:35414)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iNCpU-0000ut-E4
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 05:21:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iNCpR-0005ik-N0
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 09:21:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AC62A2E8048
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 09:21:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Oct 2019 09:05:54 -0000
From: David Hildenbrand <1847232@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=david@redhat.com; 
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: davidhildenbrand ivmn
X-Launchpad-Bug-Reporter: Ivan Warren (ivmn)
X-Launchpad-Bug-Modifier: David Hildenbrand (davidhildenbrand)
References: <157053356610.22354.6751604707489617887.malonedeb@gac.canonical.com>
Message-Id: <157182155513.9127.14376753846508553291.launchpad@soybean.canonical.com>
Subject: [Bug 1847232] Re: qemu TCG in s390x mode issue with calculating HASH
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="186023fa645d8be19d403a76064f0643f510db2f";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 292bfc587b6ba5a1bbeb13a4195bfb660acc2e9e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1847232 <1847232@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1847232

Title:
  qemu TCG in s390x mode issue with calculating HASH

Status in QEMU:
  Fix Committed

Bug description:
  When using go on s390x on Debian x64 (buster) (host) and debian s390x
  (sid) (guest) I run into the following problem :

  The following occurs while trying to build a custom project :

  go: github.com/FactomProject/basen@v0.0.0-20150613233007-fe3947df716e:
  Get
  https://proxy.golang.org/github.com/%21factom%21project/basen/@v/v0.0.0-2=
0150613233007-fe3947df716e.mod:
  local error: tls: bad record MAC

  Doing a git bisect I find that this problem only occurs on and after
  commit 08ef92d556c584c7faf594ff3af46df456276e1b

  Before that commit, all works fine. Past this commit, build always
  fails.

  Without any proof, It looks like a hash calculation bug related to
  using z/Arch vector facilities...

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1847232/+subscriptions

