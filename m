Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED85F145959
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 17:07:13 +0100 (CET)
Received: from localhost ([::1]:43834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuIXB-0002iU-0P
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 11:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iuIVk-0001oZ-DI
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 11:05:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iuIVj-00013M-5d
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 11:05:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:54070)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iuIVj-000130-08
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 11:05:43 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iuIVh-0007Yv-JV
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 16:05:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 818DB2E80C8
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 16:05:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jan 2020 15:58:31 -0000
From: Daniel Berrange <1860575@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange lemonboy
X-Launchpad-Bug-Reporter: The Lemon Man (lemonboy)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <157970748795.4848.1694391096642821939.malonedeb@chaenomeles.canonical.com>
Message-Id: <157970871114.4879.13125884642613054475.malone@soybean.canonical.com>
Subject: [Bug 1860575] Re: qemu64 CPU model is incorrect
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b8d1327fd820d6bf500589d6da587d5037c7d88e";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7122e6f2bfb8ccedb7f96d9852471a3422977ffc
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
Reply-To: Bug 1860575 <1860575@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Your analysis of the problem with family makes sense & we do have
mechanism to fix this in QEMU while keeping back compat for existing
deployments.

I'm curious as to the actual errors LLVM reports ?

FWIW, even though qemu64 is the default CPU, practically everyone would
be better off choosing one of the other CPU models explicitly to better
suit their desired use case. There is some guidance here
https://qemu.weilnetz.de/doc/qemu-doc.html#cpu_005fmodels

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1860575

Title:
  qemu64 CPU model is incorrect

Status in QEMU:
  New

Bug description:
  At the moment the "qemu64" CPU is defined as follows:

  ```
          .vendor =3D CPUID_VENDOR_AMD,
          .family =3D 6,
          .model =3D 6,
          .stepping =3D 3,
  ```

  According to Wikipedia [1] this means the CPU is defined as part of the
  K7 family while the AMD64 ISA was only introduced with the K8 series!

  This causes some software such as LLVM to notice the problem (32-bit cpu
  with 64-bit capability reported in the cpuid flag) and produce various
  error messages.

  The simple solution would be to upgrade this definition to use the Sledge=
hammer
  family (15) instead. =


  [1] https://en.wikipedia.org/wiki/List_of_AMD_CPU_microarchitectures

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860575/+subscriptions

