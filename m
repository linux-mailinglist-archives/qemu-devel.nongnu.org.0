Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2749736A442
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 04:57:11 +0200 (CEST)
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laUxJ-0000aJ-Kv
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 22:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1laUvs-0007wR-19
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 22:55:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:48686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1laUvq-00086F-7n
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 22:55:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1laUvo-00073a-BO
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 02:55:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 439A22E815B
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 02:55:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Apr 2021 02:45:24 -0000
From: Vitaly Buka <1926044@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: aarch64 mte user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: vitalybuka
X-Launchpad-Bug-Reporter: Vitaly Buka (vitalybuka)
X-Launchpad-Bug-Modifier: Vitaly Buka (vitalybuka)
References: <161931792564.17271.10395230459178895166.malonedeb@chaenomeles.canonical.com>
Message-Id: <161931872418.11632.3946056012604457888.malone@wampee.canonical.com>
Subject: [Bug 1926044] Re: QEMU-user doesn't report HWCAP2_MTE
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 014e248d0379cd3bf2fcfddd07946d6ca6507e2a
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
Reply-To: Bug 1926044 <1926044@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually if we make it like this:

#include <stdio.h>
#include <sys/auxv.h>

int main(int ac, char **av)
{
    for (int i =3D 0; i < 32; ++i)
        if ((int)(getauxval(AT_HWCAP2) & (1 << i)))
            printf("%d\n", i);
}


clang mytest.c -target aarch64-linux-gnu -fsanitize=3Dmemtag -march=3Darmv8=
+memtag
qemu-aarch64 --cpu max -L /usr/aarch64-linux-gnu ./a.out

I see only: HWCAP_FP HWCAP_CRC32 HWCAP_ATOMICS
So no HWCAP2_BTI as well.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926044

Title:
  QEMU-user doesn't report HWCAP2_MTE

Status in QEMU:
  New

Bug description:
  Reproducible on ffa090bc56e73e287a63261e70ac02c0970be61a

  Host Debian 5.10.24 x86_64 GNU

  Configured with "configure --disable-system --enable-linux-user
  --static"

  This one works and prints "OK" as expected:
  clang tests/tcg/aarch64/mte-3.c -target aarch64-linux-gnu  -fsanitize=3Dm=
emtag -march=3Darmv8+memtag
  qemu-aarch64 --cpu max -L /usr/aarch64-linux-gnu ./a.out && echo OK

  =

  This one fails and print "0":
  cat mytest.c
  #include <stdio.h>
  #include <sys/auxv.h>

  #ifndef HWCAP2_MTE
  #define HWCAP2_MTE (1 << 18)
  #endif

  int main(int ac, char **av)
  {
      printf("%d\n", (int)(getauxval(AT_HWCAP2) & HWCAP2_MTE));
  }

  =

  clang mytest.c -target aarch64-linux-gnu  -fsanitize=3Dmemtag -march=3Dar=
mv8+memtag
  qemu-aarch64 --cpu max -L /usr/aarch64-linux-gnu ./a.out

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926044/+subscriptions

