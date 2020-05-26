Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3E1BFC55
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 16:05:24 +0200 (CEST)
Received: from localhost ([::1]:40532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU9oZ-0001MP-8K
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 10:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9al-0003OI-7g
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jU9aj-0000Ug-Dp
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:36138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jU9ai-0000Qc-SB
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:51:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jU9ag-0007Z1-UL
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:51:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E401E2E802D
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 13:51:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2020 13:42:57 -0000
From: Laurent Vivier <Laurent@vivier.eu>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: arichardson th-huth
X-Launchpad-Bug-Reporter: Alexander Richardson (arichardson)
X-Launchpad-Bug-Modifier: Laurent Vivier (laurent-vivier)
References: <158064672776.8396.11527564563260103475.malonedeb@chaenomeles.canonical.com>
Message-Id: <158825417865.5113.1710634802010058449.launchpad@soybean.canonical.com>
Subject: [Bug 1861605] Re: LL/SC broken for MIPS after
 7dd547e5ab6b31e7a0cfc182d3ad131dd55a948f
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 2401a29d4780d0fe490348071fb14a1251daa035
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 09:35:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1861605

Title:
  LL/SC broken for MIPS after 7dd547e5ab6b31e7a0cfc182d3ad131dd55a948f

Status in QEMU:
  Fix Released

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

