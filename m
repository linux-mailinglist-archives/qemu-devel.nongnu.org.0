Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D687F36F73C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:37:54 +0200 (CEST)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOen-0000Yz-U0
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOct-0007f8-QV
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:35:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:49566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOcp-0007p9-Pi
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:35:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOcn-0003On-U3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:35:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D6F652E8164
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:35:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:21:33 -0000
From: Thomas Huth <1605123@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: leni536 th-huth
X-Launchpad-Bug-Reporter: Lenard Szolnoki (leni536)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160721083616.745.90271.malonedeb@gac.canonical.com>
Message-Id: <161977089406.11026.11492465156487036966.launchpad@gac.canonical.com>
Subject: [Bug 1605123] Re: PEXT returns wrong values,
 seemingly switches arguments
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 8b460467e8c367d6c384df808b9630f181557b59
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
Reply-To: Bug 1605123 <1605123@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1605123

Title:
  PEXT returns wrong values, seemingly switches arguments

Status in QEMU:
  Fix Released

Bug description:
  Hi,

  I fiddled with BMI2 instructions and discovered that pext instructions
  emulated with "qemu-x86_64 -cpu Haswell" return the wrong value. It
  seemingly switches up its arguments. I suspect that the error is around t=
he
  gen_helper_pext(...) call in target-i386/translate.c. I checked helper_pe=
xt
  in target-i386/int_helper.c and it works fine.

  I ran my program on a CPU with BMI2 instruction set too, and it indeed
  returns different values.

  I didn't check pdep, it could have the same problem.

  $ qemu-x86_64 --version
  qemu-x86_64 version 2.6.50 (v2.6.0-2095-ge66b05e-dirty), Copyright (c) 20=
03-2008 Fabrice Bellard

  $ uname -a
  Linux lenard-hp 4.3.0-1-amd64 #1 SMP Debian 4.3.5-1 (2016-02-06) x86_64 G=
NU/Linux

  I compiled the attached file with the command line "gcc -o main -g
  -mbmi2 main.c".

  $ gcc --version
  gcc (Debian 5.4.0-6) 5.4.0 20160609

  Best regards,
  L=C3=A9n=C3=A1rd Szolnoki

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1605123/+subscriptions

