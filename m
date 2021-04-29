Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FCD36E94C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:04:45 +0200 (CEST)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4TM-0003ye-HG
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc4QB-0002ae-P6
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:01:27 -0400
Received: from indium.canonical.com ([91.189.90.7]:39084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc4Q6-0005fE-0N
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:01:27 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc4Q4-0007fG-Ae
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 11:01:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4F2FC2E815B
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 11:01:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 10:54:35 -0000
From: Thomas Huth <1926044@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Tags: arm linux-user mte
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rth vitalybuka
X-Launchpad-Bug-Reporter: Vitaly Buka (vitalybuka)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161931792564.17271.10395230459178895166.malonedeb@chaenomeles.canonical.com>
Message-Id: <161969367580.9853.1583703046427884863.launchpad@gac.canonical.com>
Subject: [Bug 1926044] Re: QEMU-user doesn't report HWCAP2_MTE
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: d3e69ff88cb3404452356b88fb299a63e184b912
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
Reply-To: Bug 1926044 <1926044@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags removed: user
** Tags added: linux-user

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926044

Title:
  QEMU-user doesn't report HWCAP2_MTE

Status in QEMU:
  In Progress

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

