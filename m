Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5EB149B00
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jan 2020 15:16:33 +0100 (CET)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iviiE-0005nA-Mf
	for lists+qemu-devel@lfdr.de; Sun, 26 Jan 2020 09:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ivihT-0005M2-0G
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 09:15:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ivihR-0003ae-JP
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 09:15:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:48386)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ivihR-0003YC-Dc
 for qemu-devel@nongnu.org; Sun, 26 Jan 2020 09:15:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ivihP-0007EC-7j
 for <qemu-devel@nongnu.org>; Sun, 26 Jan 2020 14:15:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 392382E8024
 for <qemu-devel@nongnu.org>; Sun, 26 Jan 2020 14:15:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jan 2020 14:08:04 -0000
From: felix <1860914@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: felix.von.s
X-Launchpad-Bug-Reporter: felix (felix.von.s)
X-Launchpad-Bug-Modifier: felix (felix.von.s)
Message-Id: <158004768486.19485.8886711795112517187.malonedeb@gac.canonical.com>
Subject: [Bug 1860914] [NEW] QEMU prepends pathnames to command lines of
 Multiboot kernels and modules, contrary to the specification
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6479e368cc01fde8b42b27d0b0e2012002c5db85
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: Bug 1860914 <1860914@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

When QEMU is launched with the -kernel option to boot a Multiboot image,
the command line passed in the -append option is additionally prefixed
the pathname of the kernel image and a space. Likewise, module command
lines passed in the -initrd option are passed with the module pathname
and a space prepended. At the very least the former is contary to what
is prescribed in the Multiboot specification, version 0.6.96[0], which
says in =C2=A73.3:

> General-purpose boot loaders should allow user a complete control on
command line independently of other factors like image name.

With respect to module command lines, the spec is less clear, but GNU
GRUB2 (the de facto reference implementation) does not prepend pathnames
to command lines of either. I haven't tested GRUB legacy, but I assume
it exhibits the same behaviour. It would be strange if passing pathnames
was in fact intended; bootloader pathnames are useless to the loaded
kernel, which may potentially have a completely different view of the
file system from the bootloader.

Also, given that a kernel pathname may contain spaces, skipping it in
the command line cannot be done reliably, while loading a Multiboot
module from a pathname that contains spaces is outright impossible.

Found in 4.2.0, but latest git master apparently behaves the same.

[0]: https://www.gnu.org/software/grub/manual/multiboot/multiboot.html

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860914

Title:
  QEMU prepends pathnames to command lines of Multiboot kernels and
  modules, contrary to the specification

Status in QEMU:
  New

Bug description:
  When QEMU is launched with the -kernel option to boot a Multiboot
  image, the command line passed in the -append option is additionally
  prefixed the pathname of the kernel image and a space. Likewise,
  module command lines passed in the -initrd option are passed with the
  module pathname and a space prepended. At the very least the former is
  contary to what is prescribed in the Multiboot specification, version
  0.6.96[0], which says in =C2=A73.3:

  > General-purpose boot loaders should allow user a complete control on
  command line independently of other factors like image name.

  With respect to module command lines, the spec is less clear, but GNU
  GRUB2 (the de facto reference implementation) does not prepend
  pathnames to command lines of either. I haven't tested GRUB legacy,
  but I assume it exhibits the same behaviour. It would be strange if
  passing pathnames was in fact intended; bootloader pathnames are
  useless to the loaded kernel, which may potentially have a completely
  different view of the file system from the bootloader.

  Also, given that a kernel pathname may contain spaces, skipping it in
  the command line cannot be done reliably, while loading a Multiboot
  module from a pathname that contains spaces is outright impossible.

  Found in 4.2.0, but latest git master apparently behaves the same.

  [0]: https://www.gnu.org/software/grub/manual/multiboot/multiboot.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860914/+subscriptions

