Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF725BAE9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 08:15:43 +0200 (CEST)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDiX8-0002oG-Fa
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 02:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kDiSR-0000ZC-Ls
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 02:10:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:35214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kDiSP-0001Zq-AP
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 02:10:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kDiSL-0003Eg-El
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 06:10:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 494982E806E
 for <qemu-devel@nongnu.org>; Thu,  3 Sep 2020 06:10:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2020 05:57:51 -0000
From: "Tony.LI" <1894029@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigboy0822 mjt+launchpad-tls
X-Launchpad-Bug-Reporter: Tony.LI (bigboy0822)
X-Launchpad-Bug-Modifier: Tony.LI (bigboy0822)
References: <159910633026.21998.12641804380669884506.malonedeb@chaenomeles.canonical.com>
Message-Id: <159911267193.21091.13069323481456927478.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1894029] Re: qemu-i386 malloc error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="195cbfa84cb75815472f69dd83d46f006869050b"; Instance="production"
X-Launchpad-Hash: 5c3aeb6fd30703d23969b7807e21c67a14b0eb85
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:20:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1894029 <1894029@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

  Hi!I use qemu-i386-static on 64 bit machines.And memory request succeeded=
, but the pointer is wrong.
  This is my test program:
  =

  #include <stdint.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <unistd.h>
  =

  int main(int argc, char **argv)
  {
-         void *pa=3D0,*pb=3D0,*pc=3D0,*pd=3D0;
-         pa =3D malloc(sizeof(uint32_t));
-         pb =3D malloc(sizeof(uint32_t));
-         pc =3D malloc(4);
-         pd =3D malloc(4);
-         printf("pa: 0x%x\n",pa);
-         printf("pb: 0x%x\n",pb);
-         printf("pc: 0x%x\n",pc);
-         printf("pd: 0x%x\n",pd);
-         printf("uint32_t:%d\n",sizeof(uint32_t));
-         free(pa);
-         free(pb);
-         free(pc);
-         free(pd);
-         return 0;
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *pa=3D0,*pb=3D0,*pc=
=3D0,*pd=3D0;
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pa =3D malloc(sizeof(uint=
32_t));
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pb =3D malloc(sizeof(uint=
32_t));
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pc =3D malloc(4);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pd =3D malloc(4);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("pa: 0x%x\n",pa);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("pb: 0x%x\n",pb);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("pc: 0x%x\n",pc);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("pd: 0x%x\n",pd);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("uint32_t:%d\n",si=
zeof(uint32_t));
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(pa);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(pb);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(pc);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(pd);
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
  }
  =

  And it is wrong:
  =

  pa: 0x400051a0
  pb: 0x400051b0
  pc: 0x400051c0
  pd: 0x400051d0
  uint32_t:4
  =

  Why did I apply for 4 bytes of space, but the pointer only increased by 2=
 bytes??
  Is it a BUG??

** Description changed:

- Hi!I use qemu-i386-static on 64 bit machines.And memory request succeeded=
, but the pointer is wrong.
- This is my test program:
- =

- #include <stdint.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
- =

- int main(int argc, char **argv)
- {
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void *pa=3D0,*pb=3D0,*pc=
=3D0,*pd=3D0;
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pa =3D malloc(sizeof(uint=
32_t));
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pb =3D malloc(sizeof(uint=
32_t));
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pc =3D malloc(4);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pd =3D malloc(4);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("pa: 0x%x\n",pa);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("pb: 0x%x\n",pb);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("pc: 0x%x\n",pc);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("pd: 0x%x\n",pd);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printf("uint32_t:%d\n",si=
zeof(uint32_t));
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(pa);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(pb);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(pc);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(pd);
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
- }
- =

- And it is wrong:
- =

- pa: 0x400051a0
- pb: 0x400051b0
- pc: 0x400051c0
- pd: 0x400051d0
- uint32_t:4
- =

- Why did I apply for 4 bytes of space, but the pointer only increased by 2=
 bytes??
- Is it a BUG??
+ Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894029

Title:
  qemu-i386 malloc error

Status in QEMU:
  Invalid

Bug description:
  Invalid

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894029/+subscriptions

