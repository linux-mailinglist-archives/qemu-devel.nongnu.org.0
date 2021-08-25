Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C560E3F7048
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:23:12 +0200 (CEST)
Received: from localhost ([::1]:38244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInFa-0003nE-Oj
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDJ-0000yt-2M
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:45 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:38168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDH-0008P2-BL
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:44 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 6E05E3F765
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876040;
 bh=NJ400/9ij2jY89NDODm7BbqYuhdApRZ8IbAgiHlMEHo=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=mNljjvTZmRbj4eHX3D7ZlVHJD447/x9quwDT8qwTHrmT/Fr4TJPdSFC9ijH613my4
 9URGQuUQX8FqXyXO3U6mXSeHG/rkW8X2ouaSH6Eb2hQkiyh+VuMKZ378ge6ohj6/Ko
 fqGXZ66YrQ8aXsOx7t1xYus7gKZmvaUax4vYrQWuDIuUAIs6hFMESPrho2iINpDrbR
 qY/EisKL2azbqyH3rW2ILeNjZzkgV7iAbNCYzg07t4WUcRr5t1pSlKq5sIpdMdc0Df
 1xp6eLBDd9Z39bl0mOxan3C0WQRG2X16F/pEgM/g9HL6HjRgqfwKKmv/kRF1HygaF7
 V5C6oZ0Hg+35w==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 435A02E817C
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:10:59 -0000
From: Thomas Huth <1926044@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Tags: arm linux-user mte
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rth th-huth vitalybuka
X-Launchpad-Bug-Reporter: Vitaly Buka (vitalybuka)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161931792564.17271.10395230459178895166.malonedeb@chaenomeles.canonical.com>
Message-Id: <162987546085.26613.16582976239976628344.launchpad@wampee.canonical.com>
Subject: [Bug 1926044] Re: QEMU-user doesn't report HWCAP2_MTE
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: b5f4961d2cb13126c6510527ede810497d67b224
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926044

Title:
  QEMU-user doesn't report HWCAP2_MTE

Status in QEMU:
  Fix Released

Bug description:
  Reproducible on ffa090bc56e73e287a63261e70ac02c0970be61a

  Host Debian 5.10.24 x86_64 GNU

  Configured with "configure --disable-system --enable-linux-user
  --static"

  This one works and prints "OK" as expected:
  clang tests/tcg/aarch64/mte-3.c -target aarch64-linux-gnu  -fsanitize=3Dm=
emtag -march=3Darmv8+memtag
  qemu-aarch64 --cpu max -L /usr/aarch64-linux-gnu ./a.out && echo OK

 =20
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

 =20
  clang mytest.c -target aarch64-linux-gnu  -fsanitize=3Dmemtag -march=3Dar=
mv8+memtag
  qemu-aarch64 --cpu max -L /usr/aarch64-linux-gnu ./a.out

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926044/+subscriptions


