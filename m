Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF7B3420
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 06:27:38 +0200 (CEST)
Received: from localhost ([::1]:58960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9ibx-00008h-Od
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 00:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i9iaF-0007hg-R2
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 00:25:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i9iaE-0004fK-RT
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 00:25:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:48462)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i9iaE-0004fE-Mi
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 00:25:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i9iaD-0004Yj-Ka
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 04:25:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9ABE82E80D0
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 04:25:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Sep 2019 04:17:36 -0000
From: Launchpad Bug Tracker <1830415@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: abarbala ajbennee janitor
X-Launchpad-Bug-Reporter: antonio barbalace (abarbala)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155871970026.24947.15130007838572135437.malonedeb@gac.canonical.com>
Message-Id: <156860745671.25566.2320819098956812377.malone@loganberry.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 28a577303b36889d7a5fbfd6d4303c37dd705706
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1830415] Re: linux-user elf loader issue
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
Reply-To: Bug 1830415 <1830415@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1830415

Title:
  linux-user elf loader issue

Status in QEMU:
  Expired

Bug description:
  all versions up to 4.0 (I didn't test others)
  file affected linux-user/elfload.c
  function load_elf_image

  if (phdr[i].p_type =3D=3D PT_LOAD) {
             =

  -            abi_ulong a =3D phdr[i].p_vaddr - phdr[i].p_offset; =

  +            abi_ulong a =3D phdr[i].p_vaddr ; // - phdr[i].p_offset; =

              if (a < loaddr) {
                  loaddr =3D a;

  To the best of my understanding of the elf format p_offset is not a
  virtual offset. In fact, when I load statically compiled applications,
  the load fails because the libc before main is trying to access phdr
  in the executable image but that memory is not mapped -- this is
  caused by the wrong loaddr above.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1830415/+subscriptions

