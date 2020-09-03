Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4967D25B995
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 06:21:47 +0200 (CEST)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDgkr-0003p3-MM
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 00:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kDgjr-0003QA-NN
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 00:20:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:52158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kDgjp-00052J-CD
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 00:20:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kDgjm-0002ec-OT
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 04:20:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B74FB2E802A
 for <qemu-devel@nongnu.org>; Thu,  3 Sep 2020 04:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2020 04:12:10 -0000
From: "Tony.LI" <1894029@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigboy0822
X-Launchpad-Bug-Reporter: Tony.LI (bigboy0822)
X-Launchpad-Bug-Modifier: Tony.LI (bigboy0822)
Message-Id: <159910633026.21998.12641804380669884506.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1894029] [NEW] qemu-i386 malloc error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="195cbfa84cb75815472f69dd83d46f006869050b"; Instance="production"
X-Launchpad-Hash: 7c7f4daa0f5a4689e3beb87e1026676276dd320e
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

Public bug reported:

Hi!I use qemu-i386-static on 64 bit machines.And memory request succeeded, =
but the pointer is wrong.
This is my test program:

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv)
{
        void *pa=3D0,*pb=3D0,*pc=3D0,*pd=3D0;
        pa =3D malloc(sizeof(uint32_t));
        pb =3D malloc(sizeof(uint32_t));
        pc =3D malloc(4);
        pd =3D malloc(4);
        printf("pa: 0x%x\n",pa);
        printf("pb: 0x%x\n",pb);
        printf("pc: 0x%x\n",pc);
        printf("pd: 0x%x\n",pd);
        printf("uint32_t:%d\n",sizeof(uint32_t));
        free(pa);
        free(pb);
        free(pc);
        free(pd);
        return 0;
}

And it is wrong:

pa: 0x400051a0
pb: 0x400051b0
pc: 0x400051c0
pd: 0x400051d0
uint32_t:4

Why did I apply for 4 bytes of space, but the pointer only increased by 2 b=
ytes??
Is it a BUG??

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894029

Title:
  qemu-i386 malloc error

Status in QEMU:
  New

Bug description:
  Hi!I use qemu-i386-static on 64 bit machines.And memory request succeeded=
, but the pointer is wrong.
  This is my test program:

  #include <stdint.h>
  #include <stdio.h>
  #include <stdlib.h>
  #include <unistd.h>

  int main(int argc, char **argv)
  {
          void *pa=3D0,*pb=3D0,*pc=3D0,*pd=3D0;
          pa =3D malloc(sizeof(uint32_t));
          pb =3D malloc(sizeof(uint32_t));
          pc =3D malloc(4);
          pd =3D malloc(4);
          printf("pa: 0x%x\n",pa);
          printf("pb: 0x%x\n",pb);
          printf("pc: 0x%x\n",pc);
          printf("pd: 0x%x\n",pd);
          printf("uint32_t:%d\n",sizeof(uint32_t));
          free(pa);
          free(pb);
          free(pc);
          free(pd);
          return 0;
  }

  And it is wrong:

  pa: 0x400051a0
  pb: 0x400051b0
  pc: 0x400051c0
  pd: 0x400051d0
  uint32_t:4

  Why did I apply for 4 bytes of space, but the pointer only increased by 2=
 bytes??
  Is it a BUG??

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894029/+subscriptions

