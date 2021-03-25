Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733713494D6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:02:06 +0100 (CET)
Received: from localhost ([::1]:45188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRUr-0007rx-GX
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPRP7-0003rB-JW
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:56:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:57644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lPRP5-0000YU-BS
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:56:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lPRP3-0001NL-Ec
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 14:56:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 64A072E8163
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 14:56:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Mar 2021 14:48:12 -0000
From: Simon Tatham <1918302@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=alex.bennee@linaro.org; 
X-Launchpad-Bug-Tags: arm semihosting
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee pmaydell statham-arm
X-Launchpad-Bug-Reporter: Simon Tatham (statham-arm)
X-Launchpad-Bug-Modifier: Simon Tatham (statham-arm)
References: <161530383644.26074.10419563158373925479.malonedeb@gac.canonical.com>
Message-Id: <161668369242.23701.13941988455563078430.malone@chaenomeles.canonical.com>
Subject: [Bug 1918302] Re: qemu-system-arm segfaults while servicing
 SYS_HEAPINFO
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 06ecf2332f27a86bdbb71809911d7d172591ee74
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
Reply-To: Bug 1918302 <1918302@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Firstly, I agree with Peter's comment =E2=80=93 this test image is exactly =
an
example of what he describes, in that it carefully doesn't make any use
of the value of SP it started up with (doesn't push or pop anything,
doesn't make sp-relative offsets). Very near the start, it invokes
SYS_HEAPINFO to decide what to set SP to.

I retried the image with qemu master, running qemu-system-arm itself
inside gdb to help figure out what was going on. What seems to happen,
in detail, is:

1. common_semi_find_region_base falls through to the fallback "return 0;" a=
t the end of the function, because the iteration found no subregion at all =
with subregion->ram set to true. In fact the five regions it iterated throu=
gh were:
addr =3D 0x4000a000, size =3D 0x1000, ram =3D 0x0, readonly =3D 0x0
addr =3D 0x40009000, size =3D 0x1000, ram =3D 0x0, readonly =3D 0x0
addr =3D 0x40008000, size =3D 0x1000, ram =3D 0x0, readonly =3D 0x0
addr =3D 0xf0000000, size =3D 0x10000000, ram =3D 0x0, readonly =3D 0x0
addr =3D 0x40000000, size =3D 0x20000000, ram =3D 0x0, readonly =3D 0x0

2. So common_semi_rambase returns zero to the TARGET_SYS_HEAPINFO
handler in do_common_semihosting().

3. current_machine->ram_size is set to 0x8000000, and with rambase=3D0, the=
 SYS_HEAPINFO handler ends up computing the following values in retvals[]:
retvals[0] (heap base)   =3D 0x4000000
retvals[1] (heap limit)  =3D 0x8000000
retvals[2] (stack base)  =3D 0x8000000
retvals[3] (stack limit) =3D 0x0

4. The setup code faithfully initializes sp to 0x8000000, and then crashes =
on the first PUSH instruction that the program executes:
0x00001950:  b5b0       push     {r4, r5, r7, lr}

5. That's how we end up in the tight loop at 0xce4 as mentioned above:
in this test image, that's the address of the dummy handler for (among
other things) memory faults.

The emulated machine definitely has some RAM at 0x20000000, because
that's where the SYS_HEAPINFO output block was, and the semihosting code
was happy to write to there. So I think SYS_HEAPINFO surely _ought_ to
have returned some heap and stack values in that region. And the reason
it didn't was that for some reason it didn't find any RAM regions at all
in the iteration through get_system_memory()->subregions.

So I think there are still two problems. Using the input value of SP to
decide which RAM region to return is surely the wrong policy, because SP
is literally uninitialised at this point. But also, finding any RAM
regions *at all* seems to be failing in this case.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918302

Title:
  qemu-system-arm segfaults while servicing SYS_HEAPINFO

Status in QEMU:
  Fix Committed

Bug description:
  I compiled QEMU version 5.2.0 from source on Ubuntu 18.04, and tried
  to use it to run the attached bare-metal Arm hello-world image, using
  the command line

  qemu-system-arm -M microbit -semihosting -nographic -device
  loader,file=3Dhello.hex

  The result was that qemu-system-arm itself died of a segfault.
  Compiling it for debugging, the location of the segfault was in
  target/arm/arm-semi.c, in the case handler for the semihosting call
  TARGET_SYS_HEAPINFO, on line 1020 which assigns to 'rambase':

              const struct arm_boot_info *info =3D env->boot_info;
              target_ulong rambase =3D info->loader_start;

  and the problem seems to be that 'info', aka env->boot_info, is NULL
  in this context.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918302/+subscriptions

