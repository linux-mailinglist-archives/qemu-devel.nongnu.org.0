Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D95E2EFDB3
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:31:26 +0100 (CET)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5uP-00050E-71
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pj-0008GM-HR
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:46634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pg-0006vB-TJ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pb-0006rE-5l
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5E40D2E8188
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:56 -0000
From: Launchpad Bug Tracker <1728325@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ibuclaw janitor rth th-huth
X-Launchpad-Bug-Reporter: Iain Buclaw (ibuclaw)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150923941073.9276.8418169350776607737.malonedeb@wampee.canonical.com>
Message-Id: <161016587614.8490.7282877723309128575.malone@loganberry.canonical.com>
Subject: [Bug 1728325] Re: POWER8: Wrong behaviour with float-to-int punning
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: a5979ca8308f694a9f2410622f7532caf30d9efd
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
Reply-To: Bug 1728325 <1728325@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1728325

Title:
  POWER8: Wrong behaviour with float-to-int punning

Status in QEMU:
  Expired

Bug description:
  Building a reduced test program with 'gcc -O2 -fno-inline
  -mcpu=3Dpower8' produces wrong results at runtime. I don't think gcc is
  at fault here.

  ---
  #include <stdio.h>

  int getWord(const float x)
  {
    return *(int*)&x;
  }

  void main()
  {
      int foo =3D getWord(+123.456f);
      int bar =3D getWord(-123.456f);

      printf("%d\n", foo);
      printf("%d\n", bar);
      return;
  }
  ---

  This prints:
  ---
  0
  0
  ---

  Compiling with 'gcc -O2 -fno-inline -mcpu=3Dpower7' and you instead get t=
he expected result:
  ---
  1123477881
  -1024005767
  ---

  =

  The different between the two programs is:

  --- power7.s
  +++ power8.s
  @@ -6,9 +6,9 @@
   	.globl getWord
   	.type	getWord, @function
   getWord:
  -	stfs 1,-16(1)
  -	ori 2,2,0
  -	lwa 3,-16(1)
  +	xscvdpspn 0,1
  +	mfvsrwz 3,0
  +	extsw 3,3
   	blr
   	.long 0
   	.byte 0,0,0,0,0,0,0,0
          .size   getWord,.-getWord

  =

  Seems like qemu doesn't handle xscvdpspn/mfvsrwz correctly.

  https://github.com/qemu/qemu/commit/7ee19fb9d682689d36c849576c808cf92e3ba=
e40
  https://github.com/qemu/qemu/commit/f5c0f7f981333da59cc35c3210d05ec1775c9=
7c1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1728325/+subscriptions

