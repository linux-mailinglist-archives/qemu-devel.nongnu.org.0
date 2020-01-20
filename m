Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBB7142E9E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 16:18:47 +0100 (CET)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itYpC-0007o3-NF
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 10:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1itYmX-0005ao-IQ
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:16:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1itYmT-0001QF-Jh
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:16:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:43308)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1itYmR-0001OR-Px
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:15:57 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1itYmN-00054w-0H
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 15:15:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 824272E80D4
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 15:15:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jan 2020 15:06:32 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: asiagaming samuel-thibault
X-Launchpad-Bug-Reporter: jusunLee (asiagaming)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <154785010249.1233.12902128942224805447.malonedeb@gac.canonical.com>
Message-Id: <157953279275.4440.17041323484097675756.launchpad@soybean.canonical.com>
Subject: [Bug 1812451] Re: In windows host,
 tftp arbitrary file read vulnerability
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f1052173880d8dae43faa7c2fc45da1b42227143";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: aa73901c0ea68a910571e017ad390905d39e82e7
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
Reply-To: Bug 1812451 <1812451@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1812451

Title:
  In windows host, tftp arbitrary file read vulnerability

Status in QEMU:
  Fix Committed

Bug description:
  https://github.com/qemu/qemu/blob/master/slirp/tftp.c#L343

  =C2=A0=C2=A0if (!strncmp(req_fname, "../", 3) ||
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0req_fname[strlen(req_fname) - 1] =3D=
=3D '/' ||
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0strstr(req_fname, "/../")) {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tftp_send_error(spt, 2, "Access viola=
tion", tp);
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
  =C2=A0=C2=A0}

  There is file path check for not allowing escape tftp directory.
  But, in windows, file path is separated by "\" backslash.
  So, guest can read arbitrary file in Windows host.

  This bug is variant of CVE-2019-2553 - Directory traversal
  vulnerability.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1812451/+subscriptions

