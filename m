Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23C120239
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 11:21:43 +0100 (CET)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ignVV-0000H9-RV
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 05:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1ignUd-00082e-KB
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 05:20:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1ignUb-0007Fq-VE
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 05:20:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:47412)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1ignUb-0007Bw-PQ
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 05:20:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ignUZ-00048g-E3
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 10:20:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4AA542E80C8
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 10:20:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Dec 2019 10:06:05 -0000
From: Damir <1856335@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: djdatte
X-Launchpad-Bug-Reporter: Damir (djdatte)
X-Launchpad-Bug-Modifier: Damir (djdatte)
References: <157625616239.22064.10423897892496347105.malonedeb@gac.canonical.com>
Message-Id: <157649076618.19251.2274802547008878034.launchpad@wampee.canonical.com>
Subject: [Bug 1856335] Re: Cache Layout wrong on many Zen Arch CPUs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c597c3229eb023b1e626162d5947141bf7befb13";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: b31e90666a7df27d74c6e127a32282374b35c2bd
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
Reply-To: Bug 1856335 <1856335@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

  AMD CPUs have L3 cache per 2, 3 or 4 cores. Currently, TOPOEXT seems to
  always map Cache ass if it was an 4-Core per CCX CPU, which is
  incorrect, and costs upwards 30% performance (more realistically 10%) in
  L3 Cache Layout aware applications.
  =

  Example on a 4-CCX CPU (1950X /w 8 Cores and no SMT):
  =

-   <cpu mode=3D'custom' match=3D'exact' check=3D'full'>
-     <model fallback=3D'forbid'>EPYC-IBPB</model>
-     <vendor>AMD</vendor>
-     <topology sockets=3D'1' cores=3D'8' threads=3D'1'/>
+ =C2=A0=C2=A0<cpu mode=3D'custom' match=3D'exact' check=3D'full'>
+ =C2=A0=C2=A0=C2=A0=C2=A0<model fallback=3D'forbid'>EPYC-IBPB</model>
+ =C2=A0=C2=A0=C2=A0=C2=A0<vendor>AMD</vendor>
+ =C2=A0=C2=A0=C2=A0=C2=A0<topology sockets=3D'1' cores=3D'8' threads=3D'1'=
/>
  =

  In windows, coreinfo reports correctly:
  =

  ****----  Unified Cache 1, Level 3,    8 MB, Assoc  16, LineSize  64
  ----****  Unified Cache 6, Level 3,    8 MB, Assoc  16, LineSize  64
  =

  On a 3-CCX CPU (3960X /w 6 cores and no SMT):
  =

-  <cpu mode=3D'custom' match=3D'exact' check=3D'full'>
-     <model fallback=3D'forbid'>EPYC-IBPB</model>
-     <vendor>AMD</vendor>
-     <topology sockets=3D'1' cores=3D'6' threads=3D'1'/>
+ =C2=A0<cpu mode=3D'custom' match=3D'exact' check=3D'full'>
+ =C2=A0=C2=A0=C2=A0=C2=A0<model fallback=3D'forbid'>EPYC-IBPB</model>
+ =C2=A0=C2=A0=C2=A0=C2=A0<vendor>AMD</vendor>
+ =C2=A0=C2=A0=C2=A0=C2=A0<topology sockets=3D'1' cores=3D'6' threads=3D'1'=
/>
  =

  in windows, coreinfo reports incorrectly:
  =

  ****--  Unified Cache  1, Level 3,    8 MB, Assoc  16, LineSize  64
  ----**  Unified Cache  6, Level 3,    8 MB, Assoc  16, LineSize  64
  =

+ Validated against 3.0, 3.1, 4.1 and 4.2 versions of qemu-kvm.
  =

- Validated against 3.0, 3.1, 4.1 and 4.2 versions of qemu-kvm. =

- =

- With newer Qemu there is a fix (that does behave correctly) in using the =
dies parameter: =

-  <qemu:arg value=3D'cores=3D3,threads=3D1,dies=3D2,sockets=3D1'/>
+ With newer Qemu there is a fix (that does behave correctly) in using the =
dies parameter:
+ =C2=A0<qemu:arg value=3D'cores=3D3,threads=3D1,dies=3D2,sockets=3D1'/>
  =

  The problem is that the dies are exposed differently than how AMD does
- it natively, they are exposed to Windows as sockets, which means, you
- can't ever have a machine with more than two CCX (6 cores) as Windows
- only supports two sockets. (Should this be reported as a separate bug?)
+ it natively, they are exposed to Windows as sockets, which means, that
+ if you are nto a business user, you can't ever have a machine with more
+ than two CCX (6 cores) as consumer versions of Windows only supports two
+ sockets. (Should this be reported as a separate bug?)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856335

Title:
  Cache Layout wrong on many Zen Arch CPUs

Status in QEMU:
  New

Bug description:
  AMD CPUs have L3 cache per 2, 3 or 4 cores. Currently, TOPOEXT seems
  to always map Cache ass if it was an 4-Core per CCX CPU, which is
  incorrect, and costs upwards 30% performance (more realistically 10%)
  in L3 Cache Layout aware applications.

  Example on a 4-CCX CPU (1950X /w 8 Cores and no SMT):

  =C2=A0=C2=A0<cpu mode=3D'custom' match=3D'exact' check=3D'full'>
  =C2=A0=C2=A0=C2=A0=C2=A0<model fallback=3D'forbid'>EPYC-IBPB</model>
  =C2=A0=C2=A0=C2=A0=C2=A0<vendor>AMD</vendor>
  =C2=A0=C2=A0=C2=A0=C2=A0<topology sockets=3D'1' cores=3D'8' threads=3D'1'=
/>

  In windows, coreinfo reports correctly:

  ****----  Unified Cache 1, Level 3,    8 MB, Assoc  16, LineSize  64
  ----****  Unified Cache 6, Level 3,    8 MB, Assoc  16, LineSize  64

  On a 3-CCX CPU (3960X /w 6 cores and no SMT):

  =C2=A0<cpu mode=3D'custom' match=3D'exact' check=3D'full'>
  =C2=A0=C2=A0=C2=A0=C2=A0<model fallback=3D'forbid'>EPYC-IBPB</model>
  =C2=A0=C2=A0=C2=A0=C2=A0<vendor>AMD</vendor>
  =C2=A0=C2=A0=C2=A0=C2=A0<topology sockets=3D'1' cores=3D'6' threads=3D'1'=
/>

  in windows, coreinfo reports incorrectly:

  ****--  Unified Cache  1, Level 3,    8 MB, Assoc  16, LineSize  64
  ----**  Unified Cache  6, Level 3,    8 MB, Assoc  16, LineSize  64

  Validated against 3.0, 3.1, 4.1 and 4.2 versions of qemu-kvm.

  With newer Qemu there is a fix (that does behave correctly) in using the =
dies parameter:
  =C2=A0<qemu:arg value=3D'cores=3D3,threads=3D1,dies=3D2,sockets=3D1'/>

  The problem is that the dies are exposed differently than how AMD does
  it natively, they are exposed to Windows as sockets, which means, that
  if you are nto a business user, you can't ever have a machine with
  more than two CCX (6 cores) as consumer versions of Windows only
  supports two sockets. (Should this be reported as a separate bug?)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856335/+subscriptions

