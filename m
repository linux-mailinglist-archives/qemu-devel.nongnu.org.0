Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C84636C7E6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:42:37 +0200 (CEST)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOv6-0005Al-42
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbOta-0004VT-Re
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:41:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:39046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lbOtO-0001wh-86
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:41:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lbOtM-0004Oo-JR
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 14:40:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 85BBA2E8144
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 14:40:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Apr 2021 14:34:46 -0000
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
Message-Id: <161953408612.16689.7708079795349157763.malone@chaenomeles.canonical.com>
Subject: [Bug 1920913] Re: Openjdk11+ fails to install on s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: c6e00106cad36f7a651c33d21a0efc14f4e67cca
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
Reply-To: Bug 1920913 <1920913@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi @davidhildenbrand, I'm on the same team as @nam121 and I've been
looking at this issue as well.

I think this is the same issue as: https://github.com/multiarch/qemu-
user-static/issues/129

I've been running an s390x docker image on a master build (with latest
s390x commit from Apr 23) of user mode qemu-s390x-static with some debug
logging on:

$ sudo docker run -e QEMU_CPU=3D"qemu" -e QEMU_LOG=3D"unimp,guest_errors" -e
QEMU_LOG_FILENAME=3D"/s390x/qemu_s390x.log"

I ran a simple java program with:

$ java -Xcomp -XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly
-XX:PrintAssemblyOptions=3Dhsdis-print-bytes -XX:+LogCompilation
-XX:LogFile=3Djava_compilation_log.log  Main > java_out.txt

and the qemu log contained just one line:

unimplemented opcode 0x0000

Note that if the JIT is turned off with 'java -Xint', then all programs
I've tried run without problem.

The hs_err file reports a SIGILL in the same spot as in the other
comments:

--- SNIP
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGILL (0x4) at pc=3D0x00000040126d7680, pid=3D208, tid=3D211
#
# JRE version: OpenJDK Runtime Environment (11.0.10+9) (build 11.0.10+9-Ubu=
ntu-0ubuntu1.20.04)
# Java VM: OpenJDK 64-Bit Server VM (11.0.10+9-Ubuntu-0ubuntu1.20.04, compi=
led mode, tiered, compressed oops, g1 gc, linux-s390x)
# Problematic frame:
# J 9 c1 java.lang.String.hashCode()I java.base (49 bytes) @ 0x00000040126d=
7680 [0x00000040126d7640+0x0000000000000040]
--- SNIP
--- SNIP
Instructions: (pc=3D0x00000040126d7680)
0x00000040126d7580:   00000040 5f5f4140 00000040 5f5f4140
0x00000040126d7590:   00000040 5f5f4140 00000040 5f5f4140
0x00000040126d75a0:   00000040 5f5f4358 00000040 5f5f4358
0x00000040126d75b0:   00000040 5f5f4358 00000040 5f5f4358
0x00000040126d75c0:   00000040 5f5f4140 00000040 5f5f4140
0x00000040126d75d0:   00000000 00000000 ffffffff ffffffff
0x00000040126d75e0:   00000040 5f5f4140 00000000 00000000
0x00000040126d75f0:   ffffffff ffffffff 00000040 5f3fb9d0
0x00000040126d7600:   00000040 12238c00 00000040 12232800
0x00000040126d7610:   00000040 5f3fef18 00000040 12238c00
0x00000040126d7620:   00000040 12235000 00000000 00000000
0x00000040126d7630:   00000000 00000000 00000000 00000000
0x00000040126d7640:   b9040009 cc08ffff fff85500 2008a784  # <-- String.has=
hCode() entry point at 0x00000040126d7640
0x00000040126d7650:   0019a51d 0040c019 12167a80 07f10700
0x00000040126d7660:   07000700 07000700 07000700 07000700
0x00000040126d7670:   07000700 07000700 07000700 07000700
0x00000040126d7680:   0000f000 ec51e3e0 f0080024 b904000f  # <-- note 0x000=
0 at 0x00000040126d7680
0x00000040126d7690:   a7fbffa0 e300f000 0024c438 ffffff73
--- SNIP

The assembly printed by java looks like:

--- SNIP
[Entry Point]
  # {method} {0x000000405f3fb9d0} 'hashCode' '()I' in 'java/lang/String'
  #           [sp+0x60]  (sp of caller)
  0x00000040126d7640: lgr	%r0,%r9         ;...b9040009
                                                ;   {no_reloc}
  0x00000040126d7644: aih	%r0,-8          ;...cc08ffff fff8

  0x00000040126d764a: cl        %r0,8(%r2)      ;...55002008

  0x00000040126d764e: je        0x00000040126d7680  ;...a7840019

  0x00000040126d7652: llihl     %r1,64          ;...a51d0040

  0x00000040126d7656: iilf      %r1,303463040   ;...c0191216 7a80

  0x00000040126d765c: br        %r1             ;...07f1

  0x00000040126d765e: nopr                      ;...0700

  0x00000040126d7660: nopr                      ;...0700

  0x00000040126d7662: nopr                      ;...0700

  0x00000040126d7664: nopr                      ;...0700

  0x00000040126d7666: nopr                      ;...0700

  0x00000040126d7668: nopr                      ;...0700

  0x00000040126d766a: nopr                      ;...0700

  0x00000040126d766c: nopr                      ;...0700

  0x00000040126d766e: nopr                      ;...0700

  0x00000040126d7670: nopr                      ;...0700

  0x00000040126d7672: nopr                      ;...0700

  0x00000040126d7674: nopr                      ;...0700

  0x00000040126d7676: nopr                      ;...0700

  0x00000040126d7678: nopr                      ;...0700

  0x00000040126d767a: nopr                      ;...0700

  0x00000040126d767c: nopr                      ;...0700

  0x00000040126d767e: nopr                      ;...0700

[Verified Entry Point]
  0x00000040126d7680: tmy	-81920(%r15),222  ;...ebdef000 ec51

  0x00000040126d7686: stg       %r14,8(%r15)    ;...e3e0f008 0024

  0x00000040126d768c: lgr       %r0,%r15        ;...b904000f

  0x00000040126d7690: aghi      %r15,-96        ;...a7fbffa0

  0x00000040126d7694: stg       %r0,0(%r15)     ;...e300f000 0024

  0x00000040126d769a: lgrl	%r3,0x00000040126d7580
                                                ;...c438ffff ff73
                                                ;   {metadata(method data f=
or {method} {0x000000405f3fb9d0} 'hashCode' '()I' in 'java/lang/String')}
--- SNIP

so IIUC java says its generating 0xebde at 0x00000040126d7680 instead of
0x0000.

Hope the above makes sense. I'm not sure where to go from here so any
suggestions would be a great help.

** Bug watch added: github.com/multiarch/qemu-user-static/issues #129
   https://github.com/multiarch/qemu-user-static/issues/129

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

