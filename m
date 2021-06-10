Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CD33A246B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:22:30 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrE5G-0004sK-13
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrE3h-0003w5-Jb
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:20:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:46330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lrE3f-00027A-55
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:20:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lrE3b-0001Ze-AQ
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:20:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BCA8D2E818F
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:20:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Jun 2021 06:06:48 -0000
From: Thomas Huth <1921948@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee pcc-goog pmaydell rth th-huth vitalybuka
 xairy
X-Launchpad-Bug-Reporter: Andrey Konovalov (xairy)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161713286145.25906.15042270704525675392.malonedeb@wampee.canonical.com>
Message-Id: <162330520894.5806.8706760658123811165.malone@soybean.canonical.com>
Subject: [Bug 1921948] Re: MTE tags not checked properly for unaligned
 accesses at EL1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: a8a50ebb28b01748b193e33b0a45f889d79b3898
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
Reply-To: Bug 1921948 <1921948@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for opening the new ticket. I'm closing this one here on
Launchpad now so that we don't accidentally migrate it later
automatically.

** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921948

Title:
  MTE tags not checked properly for unaligned accesses at EL1

Status in QEMU:
  Fix Released

Bug description:
  For kernel memory accesses that span across two memory granules,
  QEMU's MTE implementation only checks the tag of the first granule but
  not of the second one.

  To reproduce this, build the Linux kernel with CONFIG_KASAN_HW_TAGS
  enabled, apply the patch below, and boot the kernel:

  diff --git a/sound/last.c b/sound/last.c
  index f0bb98780e70..04745cb30b74 100644
  --- a/sound/last.c
  +++ b/sound/last.c
  @@ -5,12 +5,18 @@
    */
   =

   #include <linux/init.h>
  +#include <linux/slab.h>
   #include <sound/core.h>
   =

   static int __init alsa_sound_last_init(void)
   {
          struct snd_card *card;
          int idx, ok =3D 0;
  +
  +       char *ptr =3D kmalloc(128, GFP_KERNEL);
  +       pr_err("KASAN report should follow:\n");
  +       *(volatile unsigned long *)(ptr + 124);
  +       kfree(ptr);
          =

          printk(KERN_INFO "ALSA device list:\n");
          for (idx =3D 0; idx < SNDRV_CARDS; idx++) {

  KASAN tags the 128 allocated bytes with the same tag as the returned
  pointer. The memory granule that follows the 128 allocated bytes has a
  different tag (with 1/15 probability).

  Expected result: a tag fault is detected and a KASAN report is printed wh=
en accessing bytes [124, 130).
  Observed result: no tag fault is detected and no KASAN report is printed.

  Here are the flags that I use to run QEMU if they matter:

  qemu-system-aarch64 -s -machine virt,mte=3Don -cpu max -m 2G -smp 2 -net
  user,host=3D10.0.2.10,hostfwd=3Dtcp:127.0.0.1:10021-:22 -net nic
  -nographic -kernel ./Image -append "console=3DttyAMA0 root=3D/dev/vda
  earlyprintk=3Dserial" -drive file=3D./fs.img,format=3Draw,if=3Dvirtio -no-
  shutdown -no-reboot

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921948/+subscriptions

