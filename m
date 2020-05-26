Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C01B9116
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Apr 2020 17:05:41 +0200 (CEST)
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSiqh-0001BA-NM
	for lists+qemu-devel@lfdr.de; Sun, 26 Apr 2020 11:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jSipg-0000cA-Bz
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 11:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jSipe-0006fv-Ad
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 11:04:36 -0400
Received: from indium.canonical.com ([91.189.90.7]:52830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jSipd-0006fo-Sv
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 11:04:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jSipX-0004xb-AC
 for <qemu-devel@nongnu.org>; Sun, 26 Apr 2020 15:04:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2AB8C2E8134
 for <qemu-devel@nongnu.org>; Sun, 26 Apr 2020 15:03:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Apr 2020 10:43:45 -0000
From: Heiko Sieger <1856335@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: babumoger djdatte h-sieger
X-Launchpad-Bug-Reporter: Damir (djdatte)
X-Launchpad-Bug-Modifier: Heiko Sieger (h-sieger)
References: <157625616239.22064.10423897892496347105.malonedeb@gac.canonical.com>
Message-Id: <158789782516.9219.12650443072841154748.malone@gac.canonical.com>
Subject: [Bug 1856335] Re: Cache Layout wrong on many Zen Arch CPUs
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="486bbbd6cb608f8eb468ed0d08689a349dfabe49";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e24542c9f664d2d7ec6b23fded907c71ec062403
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 11:04:31
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
Reply-To: Bug 1856335 <1856335@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It could be an issue of how the kernel presents the CPU topology.

Hardware: AMD Ryzen 3900X 12 core 24 threads (SMT)
Host: Kernel 5.6.6, QEMU 4.2

virsh capabilities | grep "cpu id"
            <cpu id=3D'0' socket_id=3D'0' core_id=3D'0' siblings=3D'0,12'/>
            <cpu id=3D'1' socket_id=3D'0' core_id=3D'1' siblings=3D'1,13'/>
            <cpu id=3D'2' socket_id=3D'0' core_id=3D'2' siblings=3D'2,14'/>
            <cpu id=3D'3' socket_id=3D'0' core_id=3D'4' siblings=3D'3,15'/>
            <cpu id=3D'4' socket_id=3D'0' core_id=3D'5' siblings=3D'4,16'/>
            <cpu id=3D'5' socket_id=3D'0' core_id=3D'6' siblings=3D'5,17'/>
            <cpu id=3D'6' socket_id=3D'0' core_id=3D'8' siblings=3D'6,18'/>
            <cpu id=3D'7' socket_id=3D'0' core_id=3D'9' siblings=3D'7,19'/>
            <cpu id=3D'8' socket_id=3D'0' core_id=3D'10' siblings=3D'8,20'/>
            <cpu id=3D'9' socket_id=3D'0' core_id=3D'12' siblings=3D'9,21'/>
            <cpu id=3D'10' socket_id=3D'0' core_id=3D'13' siblings=3D'10,22=
'/>
            <cpu id=3D'11' socket_id=3D'0' core_id=3D'14' siblings=3D'11,23=
'/>
            <cpu id=3D'12' socket_id=3D'0' core_id=3D'0' siblings=3D'0,12'/>
            <cpu id=3D'13' socket_id=3D'0' core_id=3D'1' siblings=3D'1,13'/>
            <cpu id=3D'14' socket_id=3D'0' core_id=3D'2' siblings=3D'2,14'/>
            <cpu id=3D'15' socket_id=3D'0' core_id=3D'4' siblings=3D'3,15'/>
            <cpu id=3D'16' socket_id=3D'0' core_id=3D'5' siblings=3D'4,16'/>
            <cpu id=3D'17' socket_id=3D'0' core_id=3D'6' siblings=3D'5,17'/>
            <cpu id=3D'18' socket_id=3D'0' core_id=3D'8' siblings=3D'6,18'/>
            <cpu id=3D'19' socket_id=3D'0' core_id=3D'9' siblings=3D'7,19'/>
            <cpu id=3D'20' socket_id=3D'0' core_id=3D'10' siblings=3D'8,20'=
/>
            <cpu id=3D'21' socket_id=3D'0' core_id=3D'12' siblings=3D'9,21'=
/>
            <cpu id=3D'22' socket_id=3D'0' core_id=3D'13' siblings=3D'10,22=
'/>
            <cpu id=3D'23' socket_id=3D'0' core_id=3D'14' siblings=3D'11,23=
'/>

See how cpu id=3D3 gets core id=3D4, and cpu id=3D6 gets core id=3D8, etc.

cat /sys/devices/system/cpu/cpu2/topology/core_id
2

cat /sys/devices/system/cpu/cpu3/topology/core_id
4

However, the association of CPU IDs to L3 caches seems to be correct:

echo "Level  CPU list";for file in /sys/devices/system/cpu/cpu*/cache/index=
3; do echo $(cat $file/id) "    " $(cat $file/shared_cpu_list); done | sort=
 --version-sort
Level  CPU list
0      0-2,12-14
0      0-2,12-14
0      0-2,12-14
0      0-2,12-14
0      0-2,12-14
0      0-2,12-14
1      3-5,15-17
1      3-5,15-17
1      3-5,15-17
1      3-5,15-17
1      3-5,15-17
1      3-5,15-17
2      6-8,18-20
2      6-8,18-20
2      6-8,18-20
2      6-8,18-20
2      6-8,18-20
2      6-8,18-20
3      9-11,21-23
3      9-11,21-23
3      9-11,21-23
3      9-11,21-23
3      9-11,21-23
3      9-11,21-23

There are 4 L3 caches with the correct CPU lists (6 CPUs/threads each).

Is it possible that this weird CPU ID enumeration is causing the
confusion?

Haven't had a chance to check out QEMU 5.0, but hope to do that today.

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

