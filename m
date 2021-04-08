Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A831357EB6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:07:57 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQdo-0007xe-8r
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUQbi-0006cU-Su
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:05:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:47104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUQbe-00021D-8Y
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:05:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lUQbb-0002Fj-2r
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 09:05:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CD8232E8167
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 09:05:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Apr 2021 08:36:17 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <1921948@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee pcc-goog pmaydell rth xairy
X-Launchpad-Bug-Reporter: Andrey Konovalov (xairy)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <161713286145.25906.15042270704525675392.malonedeb@wampee.canonical.com>
Message-Id: <87y2dttalb.fsf@linaro.org>
Subject: [Bug 1921948] Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 07d75726d376abb0f39e1785fe02ff7f46e0d8a6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/7/21 11:39 AM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>> =

>>> We were incorrectly assuming that only the first byte of an MTE access
>>> is checked against the tags.  But per the ARM, unaligned accesses are
>>> pre-decomposed into single-byte accesses.  So by the time we reach the
>>> actual MTE check in the ARM pseudocode, all accesses are aligned.
>>>
>>> Therefore, the first failure is always either the first byte of the
>>> access, or the first byte of the granule.
>>>
<snip>

I replicated the original test case as a kunit test:

  static void kmalloc_node_oob_span_right(struct kunit *test)
  {
          char *ptr;
          size_t size =3D 128;

          ptr =3D kmalloc_node(size, GFP_KERNEL, 0);
          KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);

          KUNIT_EXPECT_KASAN_FAIL(test, *(volatile unsigned long *)(ptr + 1=
24) =3D 0);
          kfree(ptr);
  }

which before this fix triggered:

  [    6.753429]     # kmalloc_node_oob_span_right: EXPECTATION FAILED at l=
ib/test_kasan.c:163
  [    6.753429]     Expected ({ do { extern void __compiletime_assert_337(=
void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ON=
CE()."))); if (!((sizeof(
  fail_data.report_expected) =3D=3D sizeof(char) || sizeof(fail_data.report=
_expected) =3D=3D sizeof(short) || sizeof(fail_data.report_expected) =3D=3D=
 sizeof(int) || sizeof(fail_data.repo
  rt_expected) =3D=3D sizeof(long)) || sizeof(fail_data.report_expected) =
=3D=3D sizeof(long long))) __compiletime_assert_337(); } while (0); (*(cons=
t volatile typeof( _Generic((fail_d
  ata.report_expected), char: (char)0, unsigned char: (unsigned char)0, sig=
ned char: (signed char)0, unsigned short: (unsigned short)0, signed short: =
(signed short)0, unsigned
   int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigne=
d long)0, signed long: (signed long)0, unsigned long long: (unsigned long l=
ong)0, signed long long:
  (signed long long)0, default: (fail_data.report_expected))) *
  [    6.759388]     not ok 4 - kmalloc_node_oob_span_right

And is OK by the end of the series:

  [    6.587381] The buggy address belongs to the object at ffff000003325800
  [    6.587381]  which belongs to the cache kmalloc-128 of size 128
  [    6.588372] The buggy address is located 0 bytes to the right of
  [    6.588372]  128-byte region [ffff000003325800, ffff000003325880)
  [    6.589354] The buggy address belongs to the page:
  [    6.589948] page:(____ptrval____) refcount:1 mapcount:0 mapping:000000=
0000000000 index:0x0 pfn:0x43325
  [    6.590911] flags: 0x3fffc0000000200(slab)
  [    6.591648] raw: 03fffc0000000200 dead000000000100 dead000000000122 fd=
ff000002401200
  [    6.592346] raw: 0000000000000000 0000000080100010 00000001ffffffff 00=
00000000000000
  [    6.593007] page dumped because: kasan: bad access detected
  [    6.593532]
  [    6.593775] Memory state around the buggy address:
  [    6.594360]  ffff000003325600: f3 f3 f3 f3 f3 f3 f3 f3 fe fe fe fe fe =
fe fe fe
  [    6.594991]  ffff000003325700: fd fd fd fd fd fd fd fd fe fe fe fe fe =
fe fe fe
  [    6.595594] >ffff000003325800: f8 f8 f8 f8 f8 f8 f8 f8 fe fe fe fe fe =
fe fe fe
  [    6.596180]                                            ^
  [    6.596714]  ffff000003325900: f7 f7 f7 f7 fe fe fe fe fe fe fe fe fe =
fe fe fe
  [    6.597309]  ffff000003325a00: f4 f4 fe fe fe fe fe fe fe fe fe fe fe =
fe fe fe
  [    6.597925] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  [    6.598513] Disabling lock debugging due to kernel taint
  [    6.600353]     ok 1 - kmalloc_node_oob_span_right
  [    6.600554] ok 1 - kasan

But it still fails this patch until:

 target/arm: Fix unaligned checks for mte_check1, mte_probe1

So I guess that is the one that should have the buglink.

Anyway code wise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

-- =

Alex Benn=C3=A9e

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

