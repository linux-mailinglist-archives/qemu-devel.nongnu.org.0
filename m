Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E435345B
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Apr 2021 16:42:17 +0200 (CEST)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lShTd-0004JT-19
	for lists+qemu-devel@lfdr.de; Sat, 03 Apr 2021 10:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lShSJ-0003gU-4H
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 10:40:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:51624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lShSH-0001XH-7p
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 10:40:54 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lShSF-0002nI-6q
 for <qemu-devel@nongnu.org>; Sat, 03 Apr 2021 14:40:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1B7E82E8050
 for <qemu-devel@nongnu.org>; Sat,  3 Apr 2021 14:40:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Apr 2021 14:34:14 -0000
From: Andrey Konovalov <1921948@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: pcc-goog rth xairy
X-Launchpad-Bug-Reporter: Andrey Konovalov (xairy)
X-Launchpad-Bug-Modifier: Andrey Konovalov (xairy)
References: <161713286145.25906.15042270704525675392.malonedeb@wampee.canonical.com>
Message-Id: <161746045417.26990.16587353702195332523.malone@wampee.canonical.com>
Subject: [Bug 1921948] Re: MTE tags not checked properly for unaligned
 accesses at EL1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 51f74e7fbc4b61e0a3bc081b0d1a958a8c980428
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
Reply-To: Bug 1921948 <1921948@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With v2, a lot of KASAN tests start failing. This likely means that MTE
tag faults stop being generated in certain cases.

With v3 [1], no MTE faults are generated at all.

[1]
https://patchew.org/QEMU/20210402214217.422585-1-richard.henderson@linaro.o=
rg/

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921948

Title:
  MTE tags not checked properly for unaligned accesses at EL1

Status in QEMU:
  In Progress

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

