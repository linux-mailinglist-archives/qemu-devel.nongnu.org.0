Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18C614FD5A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Feb 2020 14:32:24 +0100 (CET)
Received: from localhost ([::1]:56112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyFMN-0005hX-Nd
	for lists+qemu-devel@lfdr.de; Sun, 02 Feb 2020 08:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iyFKk-0004pr-Dp
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 08:30:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iyFKj-0001er-79
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 08:30:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:55394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iyFKi-0001dk-Vp
 for qemu-devel@nongnu.org; Sun, 02 Feb 2020 08:30:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iyFKh-0007v3-MC
 for <qemu-devel@nongnu.org>; Sun, 02 Feb 2020 13:30:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7BA8B2E80C8
 for <qemu-devel@nongnu.org>; Sun,  2 Feb 2020 13:30:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Feb 2020 13:23:56 -0000
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
References: <158064672776.8396.11527564563260103475.malonedeb@chaenomeles.canonical.com>
Message-Id: <158064983615.19517.9291620777909773732.malone@wampee.canonical.com>
Subject: [Bug 1861605] Re: LL/SC broken for MIPS after
 7dd547e5ab6b31e7a0cfc182d3ad131dd55a948f
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0a62c17273454a1313f81a74a2198ec30b44c7b6";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3d59b15426486db9fbeaa58c82c25308d22f285e
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

New patch:
https://github.com/qemu/qemu/commit/6ff8dec97f1a105d0da96c67ee24c75e437df162

** Description changed:

  In that commit the env->llval value is loaded as an unsigned value
  (instead of sign-extended as before and therefore the CMPXCHG in
  gen_st_cond() in translate.c fails.
  =

- I have committed a fix for this issue as https://github.com/CTSRD-
- CHERI/qemu/commit/a18d80c629989d002794f558968e1561edaf3dfd
+ I have committed a fix for this issue as
+ https://github.com/qemu/qemu/commit/6ff8dec97f1a105d0da96c67ee24c75e437df=
162
  =

  An alternative solution would be to change the cmpxchg line to perform a =
non-sign-extended compare, i.e. replace
-     tcg_gen_atomic_cmpxchg_tl(t0, addr, cpu_llval, val,
-                               eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo)=
; =

+ =C2=A0=C2=A0=C2=A0=C2=A0tcg_gen_atomic_cmpxchg_tl(t0, cpu_lladdr, cpu_llv=
al, val,
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo=
);
  with
-     tcg_gen_atomic_cmpxchg_tl(t0, addr, cpu_llval, val,
-                               eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo =
& ~MO_SIGN); =

+ =C2=A0=C2=A0=C2=A0=C2=A0tcg_gen_atomic_cmpxchg_tl(t0, cpu_lladdr, cpu_llv=
al, val,
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo=
 & ~MO_SIGN);
  =

+ However, that change does not fix the fact that the result of ll is no
+ longer sign-extended, therefore I think adding a cast in the helpers is
+ better.
  =

  I cannot send this patch to the QEMU mailing list as I am not able to set=
up git-send-email.
  Feel free to apply this commit or the alternative solution.

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

  I have committed a fix for this issue as
  https://github.com/qemu/qemu/commit/6ff8dec97f1a105d0da96c67ee24c75e437df=
162

  An alternative solution would be to change the cmpxchg line to perform a =
non-sign-extended compare, i.e. replace
  =C2=A0=C2=A0=C2=A0=C2=A0tcg_gen_atomic_cmpxchg_tl(t0, cpu_lladdr, cpu_llv=
al, val,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo=
);
  with
  =C2=A0=C2=A0=C2=A0=C2=A0tcg_gen_atomic_cmpxchg_tl(t0, cpu_lladdr, cpu_llv=
al, val,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0eva ? MIPS_HFLAG_UM : ctx->mem_idx, tcg_mo=
 & ~MO_SIGN);

  However, that change does not fix the fact that the result of ll is no
  longer sign-extended, therefore I think adding a cast in the helpers
  is better.

  I cannot send this patch to the QEMU mailing list as I am not able to set=
up git-send-email.
  Feel free to apply this commit or the alternative solution.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1861605/+subscriptions

