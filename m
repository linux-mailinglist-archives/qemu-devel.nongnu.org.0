Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C73574AC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:57:39 +0200 (CEST)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUDMw-0008UQ-Fo
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUDLH-0007mZ-EN
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:55:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:35736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUDL5-0001dL-CA
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:55:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lUDL2-0007cy-5q
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 18:55:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 244C12E8157
 for <qemu-devel@nongnu.org>; Wed,  7 Apr 2021 18:55:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Apr 2021 18:39:29 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <1921948@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=rth@twiddle.net; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee pcc-goog rth xairy
X-Launchpad-Bug-Reporter: Andrey Konovalov (xairy)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <161713286145.25906.15042270704525675392.malonedeb@wampee.canonical.com>
Message-Id: <877dleuds3.fsf@linaro.org>
Subject: [Bug 1921948] Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 2da74cff7b4c01743ebd37ed25992aff83948a07
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

> We were incorrectly assuming that only the first byte of an MTE access
> is checked against the tags.  But per the ARM, unaligned accesses are
> pre-decomposed into single-byte accesses.  So by the time we reach the
> actual MTE check in the ARM pseudocode, all accesses are aligned.
>
> Therefore, the first failure is always either the first byte of the
> access, or the first byte of the granule.
>
> In addition, some of the arithmetic is off for last-first -> count.
> This does not become directly visible until a later patch that passes
> single bytes into this function, so ptr =3D=3D ptr_last.
>
> Buglink: https://bugs.launchpad.net/bugs/1921948

Minor note: you can Cc: Bug 1921948 <1921948@bugs.launchpad.net> to
automatically copy patches to the appropriate bugs which is useful if
you don't have the Cc for the reporter.

Anyway I'm trying to get the kasas unit tests running as a way of
testing this (and maybe expanding with a version of Andrey's test). I
suspect this may be a PEBCAC issue but I built an MTE enabled kernel
with:

  CONFIG_HAVE_ARCH_KASAN=3Dy
  CONFIG_HAVE_ARCH_KASAN_SW_TAGS=3Dy
  CONFIG_HAVE_ARCH_KASAN_HW_TAGS=3Dy
  CONFIG_CC_HAS_KASAN_GENERIC=3Dy
  CONFIG_KASAN=3Dy
  # CONFIG_KASAN_GENERIC is not set
  CONFIG_KASAN_HW_TAGS=3Dy
  CONFIG_KASAN_STACK=3D1
  CONFIG_KASAN_KUNIT_TEST=3Dm
  CONFIG_TEST_KASAN_MODULE=3Dm

and was able to boot it. But when I insmod the kasan tests:

  insmod test_kasan.ko

it looks like it just keeps looping failing on the same test:

  Ignoring spurious kernel translation fault at virtual address dead0000000=
0010a
  WARNING: CPU: 0 PID: 1444 at arch/arm64/mm/fault.c:364 __do_kernel_fault+=
0xc4/0x1bc
  Modules linked in: test_kasan(+)
  CPU: 0 PID: 1444 Comm: kunit_try_catch Tainted: G    B   W         5.11.0=
-ajb-kasan #3
  Hardware name: linux,dummy-virt (DT)
  pstate: 60400009 (nZCv daif +PAN -UAO -TCO BTYPE=3D--)
  pc : __do_kernel_fault+0xc4/0x1bc
  lr : __do_kernel_fault+0xc4/0x1bc
  sp : ffffffc01191b900
  x29: ffffffc01191b900 x28: fcffff8001f7a880
  x27: fcffff8001c01e00 x26: 0000000000000000
  x25: 0000000000000001 x24: 00000000000000f4
  x23: 0000000020400009 x22: dead00000000010a
  x21: 0000000000000025 x20: ffffffc01191b9d0
  x19: 0000000097c08004 x18: 0000000000000000
  x17: 000000000000000a x16: 000017a83fb75794
  x15: 0000000000000030 x14: 6c656e72656b2073
  x13: ffffffc010e21be0 x12: 00000000000001aa
  x11: 000000000000008e x10: ffffffc010e2d930
  x9 : 000000000003a6d0 x8 : ffffffc010e21be0
  x7 : ffffffc010e2cbe0 x6 : 0000000000000d50
  x5 : ffffff8007f9c850 x4 : ffffffc01191b700
  x3 : 0000000000000001 x2 : 0000000000000000
  x1 : 0000000000000000 x0 : fcffff8001f7a880
  Call trace:
   __do_kernel_fault+0xc4/0x1bc
   do_translation_fault+0x98/0xb0
   do_mem_abort+0x44/0xb0
   el1_abort+0x40/0x6c
   el1_sync_handler+0x6c/0xb0
   el1_sync+0x70/0x100
   kasan_update_kunit_status+0x6c/0x1ac
   kasan_report_invalid_free+0x34/0xa0
   ____kasan_slab_free.constprop.0+0xf8/0x1a0
   __kasan_slab_free+0x10/0x20
   slab_free_freelist_hook+0xf8/0x1a0
   kfree+0x148/0x25c
   kunit_destroy_resource+0x15c/0x1bc
   string_stream_destroy+0x20/0x80
   kunit_do_assertion+0x190/0x1e4
   kmalloc_double_kzfree+0x158/0x190 [test_kasan]
   kunit_try_run_case+0x78/0xa4
   kunit_generic_run_threadfn_adapter+0x20/0x2c
   kthread+0x134/0x144
   ret_from_fork+0x10/0x38
  ---[ end trace 5acd02cdb9b3d3f0 ]---

but maybe I'm using the kunit tests wrong. It's my first time playing
with them.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 38 +++++++++++++++++---------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
>
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 8be17e1b70..c87717127c 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -757,10 +757,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>                      uint64_t ptr, uintptr_t ra)
>  {
>      int mmu_idx, ptr_tag, bit55;
> -    uint64_t ptr_last, ptr_end, prev_page, next_page;
> -    uint64_t tag_first, tag_end;
> -    uint64_t tag_byte_first, tag_byte_end;
> -    uint32_t esize, total, tag_count, tag_size, n, c;
> +    uint64_t ptr_last, prev_page, next_page;
> +    uint64_t tag_first, tag_last;
> +    uint64_t tag_byte_first, tag_byte_last;
> +    uint32_t total, tag_count, tag_size, n, c;
>      uint8_t *mem1, *mem2;
>      MMUAccessType type;
>  =

> @@ -779,29 +779,27 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>  =

>      mmu_idx =3D FIELD_EX32(desc, MTEDESC, MIDX);
>      type =3D FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DAT=
A_LOAD;
> -    esize =3D FIELD_EX32(desc, MTEDESC, ESIZE);
>      total =3D FIELD_EX32(desc, MTEDESC, TSIZE);
>  =

>      /* Find the addr of the end of the access, and of the last element. =
*/
> -    ptr_end =3D ptr + total;
> -    ptr_last =3D ptr_end - esize;
> +    ptr_last =3D ptr + total - 1;
>  =

>      /* Round the bounds to the tag granule, and compute the number of ta=
gs. */
>      tag_first =3D QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
> -    tag_end =3D QEMU_ALIGN_UP(ptr_last, TAG_GRANULE);
> -    tag_count =3D (tag_end - tag_first) / TAG_GRANULE;
> +    tag_last =3D QEMU_ALIGN_DOWN(ptr_last, TAG_GRANULE);
> +    tag_count =3D ((tag_last - tag_first) / TAG_GRANULE) + 1;
>  =

>      /* Round the bounds to twice the tag granule, and compute the bytes.=
 */
>      tag_byte_first =3D QEMU_ALIGN_DOWN(ptr, 2 * TAG_GRANULE);
> -    tag_byte_end =3D QEMU_ALIGN_UP(ptr_last, 2 * TAG_GRANULE);
> +    tag_byte_last =3D QEMU_ALIGN_DOWN(ptr_last, 2 * TAG_GRANULE);
>  =

>      /* Locate the page boundaries. */
>      prev_page =3D ptr & TARGET_PAGE_MASK;
>      next_page =3D prev_page + TARGET_PAGE_SIZE;
>  =

> -    if (likely(tag_end - prev_page <=3D TARGET_PAGE_SIZE)) {
> +    if (likely(tag_last - prev_page <=3D TARGET_PAGE_SIZE)) {
>          /* Memory access stays on one page. */
> -        tag_size =3D (tag_byte_end - tag_byte_first) / (2 * TAG_GRANULE);
> +        tag_size =3D ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANUL=
E)) + 1;
>          mem1 =3D allocation_tag_mem(env, mmu_idx, ptr, type, total,
>                                    MMU_DATA_LOAD, tag_size, ra);
>          if (!mem1) {
> @@ -815,9 +813,9 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>          mem1 =3D allocation_tag_mem(env, mmu_idx, ptr, type, next_page -=
 ptr,
>                                    MMU_DATA_LOAD, tag_size, ra);
>  =

> -        tag_size =3D (tag_byte_end - next_page) / (2 * TAG_GRANULE);
> +        tag_size =3D ((tag_byte_last - next_page) / (2 * TAG_GRANULE)) +=
 1;
>          mem2 =3D allocation_tag_mem(env, mmu_idx, next_page, type,
> -                                  ptr_end - next_page,
> +                                  ptr_last - next_page + 1,
>                                    MMU_DATA_LOAD, tag_size, ra);
>  =

>          /*
> @@ -838,15 +836,13 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>      }
>  =

>      /*
> -     * If we failed, we know which granule.  Compute the element that
> -     * is first in that granule, and signal failure on that element.
> +     * If we failed, we know which granule.  For the first granule, the
> +     * failure address is @ptr, the first byte accessed.  Otherwise the
> +     * failure address is the first byte of the nth granule.
>       */
>      if (unlikely(n < tag_count)) {
> -        uint64_t fail_ofs;
> -
> -        fail_ofs =3D tag_first + n * TAG_GRANULE - ptr;
> -        fail_ofs =3D ROUND_UP(fail_ofs, esize);
> -        mte_check_fail(env, desc, ptr + fail_ofs, ra);
> +        uint64_t fault =3D (n =3D=3D 0 ? ptr : tag_first + n * TAG_GRANU=
LE);
> +        mte_check_fail(env, desc, fault, ra);
>      }
>  =

>   done:


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

