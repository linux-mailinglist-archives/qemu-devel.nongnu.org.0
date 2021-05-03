Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC8372147
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 22:27:05 +0200 (CEST)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldf9k-0003Ju-Tu
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 16:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldf8X-0002t5-7g
 for qemu-devel@nongnu.org; Mon, 03 May 2021 16:25:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:38478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldf8N-00055R-H7
 for qemu-devel@nongnu.org; Mon, 03 May 2021 16:25:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldf8K-0007h4-IG
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 20:25:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 79F992E8187
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 20:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 20:15:38 -0000
From: Jonathan Albrecht <1920913@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: davidhildenbrand jonalbrecht nam121 pmaydell
X-Launchpad-Bug-Reporter: Namrata Bhave (nam121)
X-Launchpad-Bug-Modifier: Jonathan Albrecht (jonalbrecht)
References: <161649998851.23806.5550710395623491265.malonedeb@chaenomeles.canonical.com>
Message-Id: <162007293895.14746.2454595977606055866.malone@wampee.canonical.com>
Subject: [Bug 1920913] Re: Openjdk11+ fails to install on s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 43d24758f15561f0da76c4e888ab7d2e799738c5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1920913 <1920913@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>From looking at the in_asm logs, it looks like that instruction starting
with 0xebde is executed once with no problem but the second time its
changed to 0x0000.

... # First Time
----------------
IN:
0x40126d6880: =C2=A0ebde f000 ec51 =C2=A0tmy =C2=A0 =C2=A0 =C2=A0-0x14000(%=
r15), 0xde
0x40126d6886: =C2=A0e3e0 f008 0024 =C2=A0stg =C2=A0 =C2=A0 =C2=A0%r14, 8(%r=
15)
0x40126d688c: =C2=A0b904 000f =C2=A0 =C2=A0 =C2=A0 lgr =C2=A0 =C2=A0 =C2=A0=
%r0, %r15
0x40126d6890: =C2=A0a7fb ffa0 =C2=A0 =C2=A0 =C2=A0 aghi =C2=A0 =C2=A0 %r15,=
 -0x60
0x40126d6894: =C2=A0e300 f000 0024 =C2=A0stg =C2=A0 =C2=A0 =C2=A0%r0, 0(%r1=
5)
0x40126d689a: =C2=A0c438 ffff ff73 =C2=A0lgrl =C2=A0 =C2=A0 %r3, 0x40126d67=
80
0x40126d68a0: =C2=A05840 30dc =C2=A0 =C2=A0 =C2=A0 l =C2=A0 =C2=A0 =C2=A0 =
=C2=A0%r4, 0xdc(%r3)
0x40126d68a4: =C2=A0c248 0000 0008 =C2=A0agfi =C2=A0 =C2=A0 %r4, 8
0x40126d68aa: =C2=A05040 30dc =C2=A0 =C2=A0 =C2=A0 st =C2=A0 =C2=A0 =C2=A0 =
%r4, 0xdc(%r3)
0x40126d68ae: =C2=A0c0f4 0000 00d1 =C2=A0jg =C2=A0 =C2=A0 =C2=A0 0x40126d6a=
50
PSW=3Dmask 0000000180000000 addr 00000040126d6880 cc =C2=A0CC_OP_LTGT0_64
R00=3D0000000000000000 R01=3D00000040126d6880 R02=3D00000006296f5d20 R03=3D=
00000006296f5d20
R04=3D000000405f45fcd8 R05=3D00000006000000e8 R06=3D0000004012169380 R07=3D=
0000004002c410e8
R08=3D0000004004019000 R09=3D000000405f2d29d0 R10=3D0000004002c41048 R11=3D=
00000006296095e0
R12=3D000000400280ec50 R13=3D0000004002c411d0 R14=3D00000040126d5c64 R15=3D=
0000004002c40e88

... # Second Time
unimplemented opcode 0x0000
----------------
IN:
PSW=3Dmask 0000000180000000 addr 00000040126d6880 cc CC_OP_LTUGTU_32
R00=3D0000000000001808 R01=3D00000040126d53c0 R02=3D00000006296f5d78 R03=3D=
00000006296f5d78
R04=3D000000405f45fcd8 R05=3D00000006000000f0 R06=3D0000004012114000 R07=3D=
5f9dbb3700003030
R08=3D0000004004019000 R09=3D0000000800001808 R10=3D0000004002c41048 R11=3D=
00000006296095e0
R12=3D000000400280ec50 R13=3D0000004002c411d0 R14=3D00000040126d5c64 R15=3D=
0000004002c40e88

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920913

Title:
  Openjdk11+ fails to install on s390x

Status in QEMU:
  New

Bug description:
  While installing openjdk11 or higher from repo, it crashes while configur=
ing ca-certificates-java.
  Although `java -version` passes, `jar -version` crashes. Detailed logs at=
tached to this issue.

  ```
  # A fatal error has been detected by the Java Runtime Environment:
  #
  #  SIGILL (0x4) at pc=3D0x00000040126f9980, pid=3D8425, tid=3D8430
  #
  # JRE version: OpenJDK Runtime Environment (11.0.10+9) (build 11.0.10+9-U=
buntu-0ubuntu1.20.04)
  # Java VM: OpenJDK 64-Bit Server VM (11.0.10+9-Ubuntu-0ubuntu1.20.04, mix=
ed mode, tiered, compressed oops, g1 gc, linux-s390x)
  # Problematic frame:
  # J 4 c1 java.lang.StringLatin1.hashCode([B)I java.base@11.0.10 (42 bytes=
) @ 0x00000040126f9980 [0x00000040126f9980+0x0000000000000000]
  #
  # Core dump will be written. Default location: Core dumps may be processe=
d with "/usr/share/apport/apport %p %s %c %d %P %E" (or dumping to //core.8=
425)
  #
  # An error report file with more information is saved as:
  # //hs_err_pid8425.log
  sed with "/usr/share/apport/apport %p %s %c %d %P %E" (or dumping to /roo=
t/core.10740)
  #
  # An error report file with more information is saved as:
  # /root/hs_err_pid10740.log
  ```

  Observed this on s390x/ubuntu as well as s390x/alpine when run on amd64 h=
ost.
  Please note, on native s390x, the installation is successful. Also this c=
rash is not observed while installing openjdk-8-jdk.

  Qemu version: 5.2.0

  Please let me know if any more details are needed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920913/+subscriptions

