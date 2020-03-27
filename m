Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE1A194FC9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 04:46:29 +0100 (CET)
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHfwy-0001Rf-K2
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 23:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56304)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jHfwB-00012y-T1
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jHfwA-0002zn-MX
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:45:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:39424)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jHfwA-0002yN-HM
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:45:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jHfw9-0004eF-AT
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 03:45:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4C5632E804C
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 03:45:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Mar 2020 03:40:12 -0000
From: Hansni Bu <1868527@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hansni rth
X-Launchpad-Bug-Reporter: Hansni Bu (hansni)
X-Launchpad-Bug-Modifier: Hansni Bu (hansni)
References: <158495248924.11669.14742891693687812596.malonedeb@soybean.canonical.com>
Message-Id: <158528041381.15565.11523529984219498902.launchpad@gac.canonical.com>
Subject: [Bug 1868527] Re: alignment may overlap the TLB flags
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 48b813bab623d80f471269b3c9ba7416927f0c8c
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
Reply-To: Bug 1868527 <1868527@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1868527

Title:
  alignment may overlap the TLB flags

Status in QEMU:
  Invalid

Bug description:
  Hi,
  In QEMU-4.2.0, or git-9b26a610936deaf436af9b7e39e4b7f0a35e4409, alignment=
 may overlap the TLB flags. =

  For example, the alignment: MO_ALIGN_32,
      MO_ALIGN_32 =3D 5 << MO_ASHIFT,
  and the TLB flag: TLB_DISCARD_WRITE
  #define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 6))

  then, in the function "get_alignment_bits", the assert may fail:

  #if defined(CONFIG_SOFTMMU)
      /* The requested alignment cannot overlap the TLB flags.  */
      tcg_debug_assert((TLB_FLAGS_MASK & ((1 << a) - 1)) =3D=3D 0);
  #endif

  However, the alignment of MO_ALIGN_32 is not used for now, so the
  assert cannot be triggered in current version. Anyway it seems like a
  potential conflict.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1868527/+subscriptions

