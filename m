Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918FD377725
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:12:17 +0200 (CEST)
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfl6O-0005id-LP
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfl56-0004EM-8j
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:10:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:55352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfl4v-0002mz-1G
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:10:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfl4t-00008B-8Q
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:10:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 34E2E2E813A
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:10:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:02:21 -0000
From: Frederic Bezies <1919169@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fredb74
X-Launchpad-Bug-Reporter: Frederic Bezies (fredb74)
X-Launchpad-Bug-Modifier: Frederic Bezies (fredb74)
References: <161582345370.2384.8032103660795941094.malonedeb@chaenomeles.canonical.com>
Message-Id: <162057254206.6759.11654609645698686283.launchpad@gac.canonical.com>
Subject: [Bug 1919169] Re: [git]Startup crash when trying to use an EFI
 enabled VM in accel/kvm/kvm-all.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 4d1a862dac94cce71dfe2f800f778cc6003fc595
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1919169 <1919169@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1919169

Title:
  [git]Startup crash when trying to use an EFI enabled VM in accel/kvm
  /kvm-all.c

Status in QEMU:
  Fix Released

Bug description:
  Hello.

  I build a git version based on commit
  6157b0e19721aadb4c7fdcfe57b2924af6144b14.

  When I try to launch an EFI enabled VM, it crashes on start. Here is
  the command line used:

  qemu-system-x86_64 -bios /usr/share/edk2-ovmf/x64/OVMF.fd -enable-kvm
  -smp 4 -soundhw all -k fr -m 4096 -vga qxl -hda disk.img -cdrom
  archlinux-2021.03.01-x86_64.iso -boot cd &

  Here is the log I get:

  =

  "qemu-system-x86_64: ../accel/kvm/kvm-all.c:690: kvm_log_clear_one_slot: =
Assertion `QEMU_IS_ALIGNED(start | size, psize)' failed."

  =

  ed2k-ovmf version: 202102

  I tried an older version, edk2-ovmf 202011, same crash on start.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1919169/+subscriptions

