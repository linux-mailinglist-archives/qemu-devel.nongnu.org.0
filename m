Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E87372C03
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:29:18 +0200 (CEST)
Received: from localhost ([::1]:44676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldw33-0004vh-P2
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldw0L-00040G-3l
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:26:29 -0400
Received: from indium.canonical.com ([91.189.90.7]:35246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldw0H-00082i-D2
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:26:28 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldw0A-00023o-CN
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 14:26:18 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5C9C32E818D
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 14:26:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 14:17:39 -0000
From: Namrata Bhave <1920913@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: davidhildenbrand jonalbrecht nam121 pmaydell
X-Launchpad-Bug-Reporter: Namrata Bhave (nam121)
X-Launchpad-Bug-Modifier: Namrata Bhave (nam121)
References: <161649998851.23806.5550710395623491265.malonedeb@chaenomeles.canonical.com>
Message-Id: <162013785970.767.5036320595990346538.malone@chaenomeles.canonical.com>
Subject: [Bug 1920913] Re: Openjdk11+ fails to install on s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: cbf0ca7907fb613e5481c31050ac5ceb1af8b1d6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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

Some more analysis:
Tried to explicitely compile as well as exclude few methods during compilat=
ion such as  'java.lang.StringLatin1::hashCode', 'java.util.concurrent.Conc=
urrentHashMap', 'java.lang.String*' which are part of trace as logged in ab=
ove comments, with the help of advanced JIT options. =

However it is not good enough to draw any conclusion as `java -version` com=
mand passes on random runs. `mvn -v` which consistently fails, is seen to b=
e passing always with any of above combination set using MAVEN_OPTS. =


Also compared the assembly log as @jonalbrecht mentioned above on qemu setu=
p vs native s390x for `mvn -v` command. =

The initial few compiled methods match, however it fails for 'java.lang.Str=
ing::isLatin1':

Failure in qemu :
ImmutableOopMap{Z_R2=3DOop }pc offsets: 170 232 244 272 Compiled method (c1=
)    1077   12       2       java.lang.String::equalsIgnoreCase (45 bytes)
 total in heap  [0x00000040117f2210,0x00000040117f28b0] =3D 1696
 relocation     [0x00000040117f2370,0x00000040117f23c8] =3D 88
 constants      [0x00000040117f2400,0x00000040117f2440] =3D 64
 main code      [0x00000040117f2440,0x00000040117f2600] =3D 448
 stub code      [0x00000040117f2600,0x00000040117f2668] =3D 104
 metadata       [0x00000040117f2668,0x00000040117f2688] =3D 32
 scopes data    [0x00000040117f2688,0x00000040117f2738] =3D 176
 scopes pcs     [0x00000040117f2738,0x00000040117f2888] =3D 336
 dependencies   [0x00000040117f2888,0x00000040117f2890] =3D 8
 nul chk table  [0x00000040117f2890,0x00000040117f28b0] =3D 32

ImmutableOopMap{}pc offsets: 288
ImmutableOopMap{Z_R2=3DOop Z_R5=3DOop }pc offsets: 372
ImmutableOopMap{Z_R5=3DOop Z_R2=3DOop }pc offsets: 384 392 400 unimplemente=
d opcode 0x0000
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGILL (0x4) at pc=3D0x00000040117f1680, pid=3D11738, tid=3D11787
#
# JRE version: OpenJDK Runtime Environment (11.0.11+9) (build 11.0.11+9-Ubu=
ntu-0ubuntu2.20.04)
# Java VM: OpenJDK 64-Bit Server VM (11.0.11+9-Ubuntu-0ubuntu2.20.04, compi=
led mode, tiered, compressed oops, g1 gc, linux-s390x)
# Problematic frame:
# J 9 c1 java.lang.String.hashCode()I java.base (49 bytes) @ 0x00000040117f=
1680 [0x00000040117f1640+0x0000000000000040]
#
# Core dump will be written. Default location: Core dumps may be processed =
with "/usr/share/apport/apport %p %s %c %d %P %E" (or dumping to //core.117=
38)
#
# An error report file with more information is saved as:
# //hs_err_pid11738.log


vs

Native s390x log:
ImmutableOopMap{Z_R2=3DOop }pc offsets: 170 232 244 272 Compiled method (c1=
)      34   12       2       java.lang.String::equalsIgnoreCase (45 bytes)
 total in heap  [0x000003ff7a097110,0x000003ff7a0977b0] =3D 1696
 relocation     [0x000003ff7a097270,0x000003ff7a0972c8] =3D 88
 constants      [0x000003ff7a097300,0x000003ff7a097340] =3D 64
 main code      [0x000003ff7a097340,0x000003ff7a097500] =3D 448
 stub code      [0x000003ff7a097500,0x000003ff7a097568] =3D 104
 metadata       [0x000003ff7a097568,0x000003ff7a097588] =3D 32
 scopes data    [0x000003ff7a097588,0x000003ff7a097638] =3D 176
 scopes pcs     [0x000003ff7a097638,0x000003ff7a097788] =3D 336
 dependencies   [0x000003ff7a097788,0x000003ff7a097790] =3D 8
 nul chk table  [0x000003ff7a097790,0x000003ff7a0977b0] =3D 32

ImmutableOopMap{}pc offsets: 276
ImmutableOopMap{Z_R2=3DOop Z_R5=3DOop }pc offsets: 360
ImmutableOopMap{Z_R5=3DOop Z_R2=3DOop }pc offsets: 372 380 388 Compiled met=
hod (c1)      34   13       2       java.lang.String::isLatin1 (19 bytes)
 total in heap  [0x000003ff7a097810,0x000003ff7a097c10] =3D 1024
 relocation     [0x000003ff7a097970,0x000003ff7a097990] =3D 32
 constants      [0x000003ff7a0979c0,0x000003ff7a097a00] =3D 64
 main code      [0x000003ff7a097a00,0x000003ff7a097b40] =3D 320
 stub code      [0x000003ff7a097b40,0x000003ff7a097b98] =3D 88
 metadata       [0x000003ff7a097b98,0x000003ff7a097ba0] =3D 8
 scopes data    [0x000003ff7a097ba0,0x000003ff7a097bb8] =3D 24
 scopes pcs     [0x000003ff7a097bb8,0x000003ff7a097c08] =3D 80
 dependencies   [0x000003ff7a097c08,0x000003ff7a097c10] =3D 8 =


..................................................

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

