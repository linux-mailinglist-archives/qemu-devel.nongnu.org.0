Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62222DDC69
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 01:34:18 +0100 (CET)
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq3ir-0003Ez-6f
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 19:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kq3fh-0002GG-Il
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 19:31:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:44500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kq3fZ-0000p3-Ld
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 19:30:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kq3fW-0006tK-Bj
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 00:30:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5776D2E813B
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 00:30:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Dec 2020 00:24:37 -0000
From: Peter Collingbourne <1907137@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pcc-goog
X-Launchpad-Bug-Reporter: Peter Collingbourne (pcc-goog)
X-Launchpad-Bug-Modifier: Peter Collingbourne (pcc-goog)
References: <160737386315.5907.11436467204976213940.malonedeb@gac.canonical.com>
Message-Id: <160825107808.15540.5821650576834609004.malone@soybean.canonical.com>
Subject: [Bug 1907137] Re: LDTR not properly emulated when MTE tag checks
 enabled at EL0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a68a6d599c812dd1dd335307d9c5c017c50ba81b"; Instance="production"
X-Launchpad-Hash: 97bb6c42e39cd27b7cd1bbe26c9c5e30ddefdbb5
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

The workaround patch above is insufficient if I change userspace to set
TCF0=3D1. With that I get a kernel panic:

[   13.336255][    C0] Bad mode in Synchronous Abort handler detected on CP=
U0, code 0x92000011 -- DABT (lower EL)
[   13.337437][    C0] CPU: 0 PID: 1 Comm: init Not tainted 5.10.0-rc7-main=
line-00300-gf4328758abb6 #1
[   13.338086][    C0] Hardware name: linux,dummy-virt (DT)
[   13.338948][    C0] pstate: 20400005 (nzCv daif +PAN -UAO -TCO BTYPE=3D-=
-)
[   13.339951][    C0] pc : __arch_copy_from_user+0x1e4/0x340
[   13.340483][    C0] lr : _copy_from_user+0xbc/0x564
[   13.340930][    C0] sp : ffffffc01000bda0
[   13.341385][    C0] x29: ffffffc01000bda0
[   13.342295][    C0] x28: ffffff804011c100
[   13.342951][    C0]
[   13.343321][    C0] x27: 0000000000000000
[   13.343759][    C0] x26: 0000000000000000
[   13.344178][    C0]
[   13.344513][    C0] x25: 0000000000000000
[   13.344954][    C0] x24: 0000000000000000
[   13.345382][    C0]
[   13.345713][    C0] x23: 0300007e18aca850
[   13.346153][    C0] x22: 0300007e18aca860
[   13.346809][    C0]
[   13.347144][    C0] x21: ffffff8043d1ef80
[   13.347596][    C0] x20: 0300007e18aca850
[   13.348023][    C0]
[   13.348354][    C0] x19: ffffff8043295000
[   13.348806][    C0] x18: ffffff8040103c38
[   13.349232][    C0]
[   13.349557][    C0] x17: 0000000004000000
[   13.349998][    C0] x16: 0000007fffffffff
[   13.350634][    C0]
[   13.350965][    C0] x15: 0000007f9fed34f8
[   13.351409][    C0] x14: 006d65747379730c
[   13.351844][    C0]
[   13.352167][    C0] x13: 00000000000001ed
[   13.352610][    C0] x12: 0000000000000000
[   13.353034][    C0]
[   13.353358][    C0] x11: 0000000000000000
[   13.353802][    C0] x10: 0000000000000000
[   13.354232][    C0]
[   13.354785][    C0] x9 : 006d65747379730c
[   13.355236][    C0] x8 : 0000000000000000
[   13.355673][    C0]
[   13.355998][    C0] x7 : 0000000000000000
[   13.356448][    C0] x6 : ffffff8043295040
[   13.356874][    C0]
[   13.357200][    C0] x5 : ffffff8043296000
[   13.357646][    C0] x4 : 0000000000000000
[   13.358077][    C0]
[   13.358423][    C0] x3 : 0000000000000001
[   13.359055][    C0] x2 : 0000000000000f80
[   13.359497][    C0]
[   13.359829][    C0] x1 : 0300007e18aca8c0
[   13.360278][    C0] x0 : ffffff8043295000
[   13.360705][    C0]
[   13.362315][    C0] Kernel panic - not syncing: bad mode
[   13.362377][    C0] CPU: 0 PID: 1 Comm: init Not tainted 5.10.0-rc7-main=
line-00300-gf4328758abb6 #1
[   13.362410][    C0] Hardware name: linux,dummy-virt (DT)
[   13.362442][    C0] Call trace:
[   13.362474][    C0]  dump_backtrace+0x0/0x1e0
[   13.362507][    C0]  show_stack+0x1c/0x2c
[   13.362539][    C0]  dump_stack+0xd0/0x154
[   13.362570][    C0]  panic+0x158/0x370
[   13.362602][    C0]  bad_el0_sync+0x0/0x5c
[   13.362634][    C0]  el1_inv+0x3c/0x5c
[   13.362666][    C0]  el1_sync_handler+0x64/0x8c
[   13.362698][    C0]  el1_sync+0x84/0x140
[   13.362730][    C0]  __arch_copy_from_user+0x1e4/0x340
[   13.362762][    C0]  copy_mount_options+0x40/0x1d0
[   13.362794][    C0]  __arm64_sys_mount+0x84/0x13c
[   13.362826][    C0]  el0_svc_common+0xc0/0x1b4
[   13.362858][    C0]  do_el0_svc+0x20/0x30
[   13.362890][    C0]  el0_svc+0x14/0x24
[   13.362922][    C0]  el0_sync_handler+0x88/0xec
[   13.362953][    C0]  el0_sync+0x17c/0x180
[   13.363547][    C0] Kernel Offset: 0x2abd800000 from 0xffffffc010000000
[   13.363580][    C0] PHYS_OFFSET: 0x40000000
[   13.363613][    C0] CPU features: 0x27e0152,6180a230
[   13.363644][    C0] Memory Limit: none

It looks like the tag check fault coming from the LDTR is reported using
the wrong EL.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907137

Title:
  LDTR not properly emulated when MTE tag checks enabled at EL0

Status in QEMU:
  New

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

