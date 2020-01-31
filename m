Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5E14EEEB
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:02:17 +0100 (CET)
Received: from localhost ([::1]:54172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixXoF-0000Ey-UN
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ixXmu-0007od-8V
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:00:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ixXmt-0006vr-09
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:00:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:39008)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ixXms-0006ph-QO
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:00:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ixXmr-0002RU-9Q
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:00:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3FE972E80C3
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:00:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jan 2020 14:52:35 -0000
From: Joey Adams <joeyadams3.14159@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: joeyadams3-14159
X-Launchpad-Bug-Reporter: Joey Adams (joeyadams3-14159)
X-Launchpad-Bug-Modifier: Joey Adams (joeyadams3-14159)
References: <157879657262.5123.4155249157481007374.malonedeb@gac.canonical.com>
Message-Id: <158048235594.18744.4386381018708216063.malone@gac.canonical.com>
Subject: [Bug 1859310] Re: libvirt probing fails due to assertion failure with
 KVM and 'none' machine type
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 117d24e90b24daf3326af51226e1c87ac07aedd8
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
Reply-To: Bug 1859310 <1859310@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was fixed in commit 8f54bbd0b4 "x86: Check for machine state object
class before typecasting it".

** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859310

Title:
  libvirt probing fails due to assertion failure with KVM and 'none'
  machine type

Status in QEMU:
  Fix Committed

Bug description:
  Using libvirt on Ubuntu 19.10, I get the following error when I try to
  set <emulator> to the latest qemu from git (commit dc65a5bdc9):

      error: internal error: Failed to start QEMU binary /usr/local/bin
  /qemu-system-x86_64 for probing:
  /home/joey/git/qemu/target/i386/kvm.c:2176:kvm_arch_init: Object
  0x564bfd5c3200 is not an instance of type x86-machine

  Qemu command line to reproduce:

      sudo x86_64-softmmu/qemu-system-x86_64 -machine 'none,accel=3Dkvm'

  Commit ed9e923c3c (Dec 12, 2019) introduced the issue by removing an
  object_dynamic_cast call.  In this scenario, kvm_arch_init is passed
  an instance of "none-machine" instead of "x86-machine".

  The following one-line change to target/i386/kvm.c reintroduces the
  cast:

       if (kvm_check_extension(s, KVM_CAP_X86_SMM) &&
  +        object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE) &&
           x86_machine_is_smm_enabled(X86_MACHINE(ms))) {
           smram_machine_done.notify =3D register_smram_listener;
           qemu_add_machine_init_done_notifier(&smram_machine_done);
       }

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859310/+subscriptions

