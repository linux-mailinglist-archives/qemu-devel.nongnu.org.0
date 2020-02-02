Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5CA14FD13
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Feb 2020 13:42:12 +0100 (CET)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyEZm-0004JV-PB
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 07:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iyEYZ-0003ro-Iq
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 07:40:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iyEYY-0002sh-FF
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 07:40:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:52942)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iyEYY-0002o1-9x
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 07:40:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iyEYW-0005SA-FG
 for <qemu-devel@nongnu.org>; Sun, 02 Feb 2020 12:40:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 692052E806B
 for <qemu-devel@nongnu.org>; Sun,  2 Feb 2020 12:40:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Feb 2020 12:32:07 -0000
From: Alexander Richardson <1861605@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arichardson
X-Launchpad-Bug-Reporter: Alexander Richardson (arichardson)
X-Launchpad-Bug-Modifier: Alexander Richardson (arichardson)
Message-Id: <158064672776.8396.11527564563260103475.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1861605] [NEW] LL/SC broken for MIPS after
 7dd547e5ab6b31e7a0cfc182d3ad131dd55a948f
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7c25f9ab928aba09eb3675ed84a82a3e317917f0
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
Reply-To: Bug 1861605 <1861605@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

In that commit the env->llval value is loaded as an unsigned value
(instead of sign-extended as before and therefore the CMPXCHG in
gen_st_cond() in translate.c fails.

I have committed a fix for this issue as https://github.com/CTSRD-
CHERI/qemu/commit/a18d80c629989d002794f558968e1561edaf3dfd

An alternative solution would be to change the cmpxchg line to perform a no=
n-sign-extended compare, i.e. replace
    tcg_gen_atomic_cmpxchg_tl(t0, addr, cpu_llval, val,
                              eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo); =

with
    tcg_gen_atomic_cmpxchg_tl(t0, addr, cpu_llval, val,
                              eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo & =
~MO_SIGN); =



I cannot send this patch to the QEMU mailing list as I am not able to setup=
 git-send-email.
Feel free to apply this commit or the alternative solution.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861605

Title:
  LL/SC broken for MIPS after 7dd547e5ab6b31e7a0cfc182d3ad131dd55a948f

Status in QEMU:
  New

Bug description:
  In that commit the env->llval value is loaded as an unsigned value
  (instead of sign-extended as before and therefore the CMPXCHG in
  gen_st_cond() in translate.c fails.

  I have committed a fix for this issue as https://github.com/CTSRD-
  CHERI/qemu/commit/a18d80c629989d002794f558968e1561edaf3dfd

  An alternative solution would be to change the cmpxchg line to perform a =
non-sign-extended compare, i.e. replace
      tcg_gen_atomic_cmpxchg_tl(t0, addr, cpu_llval, val,
                                eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo)=
; =

  with
      tcg_gen_atomic_cmpxchg_tl(t0, addr, cpu_llval, val,
                                eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo =
& ~MO_SIGN); =


  =

  I cannot send this patch to the QEMU mailing list as I am not able to set=
up git-send-email.
  Feel free to apply this commit or the alternative solution.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861605/+subscriptions

