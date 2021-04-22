Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F3367982
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:50:52 +0200 (CEST)
Received: from localhost ([::1]:44030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZSEl-0001or-Bz
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZS9u-0005Ah-OX
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:45:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:53112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZS9s-00085k-Bx
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:45:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZS9q-0004lI-TJ
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:45:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DC5B42E8157
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:45:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:38:11 -0000
From: Lukasz Janyst <1811888@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth xyz-k
X-Launchpad-Bug-Reporter: Lukasz Janyst (xyz-k)
X-Launchpad-Bug-Modifier: Lukasz Janyst (xyz-k)
References: <154758033350.20612.10612778559248871550.malonedeb@soybean.canonical.com>
Message-Id: <161906989239.32560.18181250250588122617.launchpad@soybean.canonical.com>
Subject: [Bug 1811888] Re: Qemu refuses to multiboot Elf64 kernels
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: f3709d33a6b38a9aa82c354d0e8b8d5913a94a9e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1811888 <1811888@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1811888

Title:
  Qemu refuses to multiboot Elf64 kernels

Status in QEMU:
  New

Bug description:
  Qemu does not multiboot Elf64 bit kernels when emulating x86_64
  systems. This is unfortunate because it renders the `-kernel` option
  quite useless. It's true that a multiboot compatible bootloader puts
  you in protected mode by default, and you have to set up the long mode
  yourself. While it is easy to put such 32-bit bootstrap code in a 64
  bit binary, it is not possible to compile a 64 bit kernel into a 32
  bit binary.

  After quick search, it turned out that loading 64 bit elf binaries has
  been disabled to be compatible with GRUB. However, since that time,
  both GRUB and Syslinux load 64 bit ELF kernels just fine, which makes
  qemu incompatible with them. Furthermore, it seems that this feature
  does and has always worked fine and that people have since submitted
  patches to re-enable it.

  https://patchwork.ozlabs.org/patch/62142/
  https://patchwork.kernel.org/patch/9770523/

  Please consider applying the attached patch.

  Best Regards,
  Lukasz Janyst

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1811888/+subscriptions

