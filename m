Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2229D81
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 19:51:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUEM1-0001VC-IJ
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 13:51:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hUEL0-0001C8-9s
	for qemu-devel@nongnu.org; Fri, 24 May 2019 13:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hUEKz-0003dS-7i
	for qemu-devel@nongnu.org; Fri, 24 May 2019 13:50:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:34640)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hUEKz-0003cz-2e
	for qemu-devel@nongnu.org; Fri, 24 May 2019 13:50:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hUEKx-0006nt-6r
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 17:50:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 293272E8076
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 17:50:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 May 2019 17:41:40 -0000
From: antonio barbalace <1830415@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: abarbala
X-Launchpad-Bug-Reporter: antonio barbalace (abarbala)
X-Launchpad-Bug-Modifier: antonio barbalace (abarbala)
Message-Id: <155871970026.24947.15130007838572135437.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 67d601cd337e03c8bd837d2b6906391005037533
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1830415] [NEW] linux-user elf loader issue
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1830415 <1830415@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

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
the load fails because the libc before main is trying to access phdr in
the executable image but that memory is not mapped -- this is caused by
the wrong loaddr above.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1830415

Title:
  linux-user elf loader issue

Status in QEMU:
  New

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

