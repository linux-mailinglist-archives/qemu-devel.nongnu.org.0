Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04DF2E0337
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 01:11:57 +0100 (CET)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krVHQ-0006Mx-AG
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 19:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1krVGO-0005x5-Ee
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:10:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:53832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1krVGM-0001op-7k
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:10:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1krVGJ-0006Tv-TW
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 00:10:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DC2BB2E8138
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 00:10:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Dec 2020 00:03:14 -0000
From: Peter Collingbourne <1907137@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pcc-goog rth
X-Launchpad-Bug-Reporter: Peter Collingbourne (pcc-goog)
X-Launchpad-Bug-Modifier: Peter Collingbourne (pcc-goog)
References: <160737386315.5907.11436467204976213940.malonedeb@gac.canonical.com>
Message-Id: <160859539435.2354.7022837748952323772.malone@soybean.canonical.com>
Subject: [Bug 1907137] Re: LDTR not properly emulated when MTE tag checks
 enabled at EL0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: 6108f490ebd60ba7b6ad349edb8a0e3af67ad1e1
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
Reply-To: Bug 1907137 <1907137@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the patch. I've verified that it fixes the assertion failure
with both TCF0=3D1 and TCF0=3D2.

You can disregard the kernel panic from comment #1 since it turns out
that it was from an older build of QEMU that did not have 50244cc76abc.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907137

Title:
  LDTR not properly emulated when MTE tag checks enabled at EL0

Status in QEMU:
  In Progress

Bug description:
  I am trying to boot Android (just the non-GUI parts for now) under
  QEMU with MTE enabled. This can be done by following the instructions
  here to build the fvp-eng target with MTE support:

  https://cs.android.com/android/platform/superproject/+/master:device/gene=
ric/goldfish/fvpbase/

  and launching QEMU with the following command:

  qemu-system-aarch64 -kernel $ANDROID_PRODUCT_OUT/kernel -initrd
  $ANDROID_PRODUCT_OUT/combined-ramdisk.img -machine virt,mte=3Don -cpu
  max -drive driver=3Draw,file=3D$ANDROID_PRODUCT_OUT/system-
  qemu.img,if=3Dnone,id=3Dsystem -device virtio-blk-device,drive=3Dsystem
  -append "console=3DttyAMA0 earlyprintk=3DttyAMA0
  androidboot.hardware=3Dfvpbase
  androidboot.boot_devices=3Da003e00.virtio_mmio loglevel=3D9
  printk.devkmsg=3Don buildvariant=3Deng" -m 512 -nographic -no-reboot

  If I do this then QEMU crashes like so:

  **
  ERROR:../target/arm/mte_helper.c:558:mte_check_fail: code should not be r=
eached
  Bail out! ERROR:../target/arm/mte_helper.c:558:mte_check_fail: code shoul=
d not be reached

  The error is caused by an MTE tag check fault from an LDTR instruction
  in __arch_copy_from_user. At this point TCF=3D0 and TCF0=3D2.

  I have this patch that gets me past the error but it is unclear
  whether this is the correct fix since there may be other confusion
  between TCF and TCF0 elsewhere.

  diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
  index 153bd1e9df..aa5db4eac4 100644
  --- a/target/arm/mte_helper.c
  +++ b/target/arm/mte_helper.c
  @@ -552,10 +552,8 @@ static void mte_check_fail(CPUARMState *env, uint32_=
t desc,
       case 0:
           /*
            * Tag check fail does not affect the PE.
  -         * We eliminate this case by not setting MTE_ACTIVE
  -         * in tb_flags, so that we never make this runtime call.
            */
  -        g_assert_not_reached();
  +        break;
   =

       case 2:
           /* Tag check fail causes asynchronous flag set.  */

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907137/+subscriptions

