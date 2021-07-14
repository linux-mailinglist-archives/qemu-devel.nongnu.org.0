Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7414B3C834B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:56:44 +0200 (CEST)
Received: from localhost ([::1]:37824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3cZH-0002Qp-In
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m3cXr-0000Pr-8r; Wed, 14 Jul 2021 06:55:15 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:58845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m3cXl-0007V2-O6; Wed, 14 Jul 2021 06:55:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BFB0E74570E;
 Wed, 14 Jul 2021 12:55:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8332B74570C; Wed, 14 Jul 2021 12:55:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 81C7174570A;
 Wed, 14 Jul 2021 12:55:06 +0200 (CEST)
Date: Wed, 14 Jul 2021 12:55:06 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: Host folder sharing via USB issue
In-Reply-To: <de0b7543-1f4b-7eb4-fc8a-d8643e79b7da@virtuozzo.com>
Message-ID: <1ed746ce-915d-ba1c-bb80-6ea39c42b8b@eik.bme.hu>
References: <F120718F-C548-47C7-BAF7-ABFEC1F9E8CD@gmail.com>
 <de0b7543-1f4b-7eb4-fc8a-d8643e79b7da@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Programmingkid <programmingkidx@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021, Vladimir Sementsov-Ogievskiy wrote:
> 14.07.2021 00:04, Programmingkid wrote:
>> Hi I have noticed that host folder sharing via USB has recently stopped 
>> working. After doing some git bisecting I found this as the patch that 
>> seems to be the issue:
>> 
>> 25f78d9e2de528473d52acfcf7acdfb64e3453d4 is the first bad commit
>> commit 25f78d9e2de528473d52acfcf7acdfb64e3453d4
>> Author: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Date:   Thu Jun 10 15:05:34 2021 +0300
>>
>>      block: move supports_backing check to 
>> bdrv_set_file_or_backing_noperm()
>>           Move supports_backing check of bdrv_reopen_parse_backing to 
>> called
>>      (through bdrv_set_backing_noperm()) bdrv_set_file_or_backing_noperm()
>>      function. The check applies to general case, so it's appropriate for
>>      bdrv_set_file_or_backing_noperm().
>>           We have to declare backing support for two test drivers, 
>> otherwise new
>>      check fails.
>>           Signed-off-by: Vladimir Sementsov-Ogievskiy 
>> <vsementsov@virtuozzo.com>
>>      Message-Id: <20210610120537.196183-7-vsementsov@virtuozzo.com>
>>      Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>
>>   block.c                          | 29 +++++++++++++++--------------
>>   tests/unit/test-bdrv-drain.c     |  1 +
>>   tests/unit/test-bdrv-graph-mod.c |  1 +
>>   3 files changed, 17 insertions(+), 14 deletions(-)
>> 
>> To reproduce this issue run this command:
>> qemu-system-i386 -usb -device usb-storage,drive=fat16 -drive 
>> file=fat:rw:fat-type=16:"<path to host folder>",id=fat16,format=raw,if=none
>> 
>> Results:
>> Unexpected error in bdrv_set_file_or_backing_noperm() at ../block.c:3159:
>> qemu-system-i386: -drive file=fat:rw:fat-type=16:<host folder 
>> path>,id=fat16,format=raw,if=none: Driver 'vvfat' of node '#block057' does 
>> not support backing files
>> Abort trap: 6
>> 
>> Expected results:
>> QEMU start running normally.
>> 
>> Please let me know if you need more information.
>> 
>> Thank you.
>> 
>
> Hi!
>
> Look at bt:
>
> #0  0x00007fd34f6939d5 in raise () at /lib64/libc.so.6
> #1  0x00007fd34f67c8a4 in abort () at /lib64/libc.so.6
> #2  0x000055e446d967aa in error_handle_fatal (errp=0x55e447652680 
> <error_abort>, err=0x55e448d17a20) at ../util/error.c:40
> #3  0x000055e446d968da in error_setv
>    (errp=0x55e447652680 <error_abort>, src=0x55e446f8755b "../block.c", 
> line=3158, func=0x55e446f89c20 <__func__.64> 
> "bdrv_set_file_or_backing_noperm", err_class=ERROR_CLASS_GENERIC_ERROR, 
> fmt=0x55e446f88458 "Driver '%s' of node '%s' does not support backing files", 
> ap=0x7ffc31aba090, suffix=0x0) at ../util/error.c:73
> #4  0x000055e446d96ab8 in error_setg_internal
>    (errp=0x55e447652680 <error_abort>, src=0x55e446f8755b "../block.c", 
> line=3158, func=0x55e446f89c20 <__func__.64> 
> "bdrv_set_file_or_backing_noperm", fmt=0x55e446f88458 "Driver '%s' of node 
> '%s' does not support backing files") at ../util/error.c:97
> #5  0x000055e446c411cf in bdrv_set_file_or_backing_noperm 
> (parent_bs=0x55e448ceebe0, child_bs=0x55e448d21e40, is_backing=true, 
> tran=0x55e448d16c20, errp=0x55e447652680 <error_abort>) at ../block.c:3158
> #6  0x000055e446c41377 in bdrv_set_backing_noperm (bs=0x55e448ceebe0, 
> backing_hd=0x55e448d21e40, tran=0x55e448d16c20, errp=0x55e447652680 
> <error_abort>) at ../block.c:3218
> #7  0x000055e446c413ae in bdrv_set_backing_hd (bs=0x55e448ceebe0, 
> backing_hd=0x55e448d21e40, errp=0x55e447652680 <error_abort>) at 
> ../block.c:3227
> #8  0x000055e446c1bd37 in enable_write_target (bs=0x55e448ceebe0, 
> errp=0x7ffc31aba360) at ../block/vvfat.c:3191
> #9  0x000055e446c16fe8 in vvfat_open (bs=0x55e448ceebe0, 
> options=0x55e448cf4330, flags=155650, errp=0x7ffc31aba360) at 
> ../block/vvfat.c:1236
> #10 0x000055e446c3df37 in bdrv_open_driver (bs=0x55e448ceebe0, 
> drv=0x55e4475e9760 <bdrv_vvfat>, node_name=0x0, options=0x55e448cf4330, 
> open_flags=155650, errp=0x7ffc31aba470) at ../block.c:1550
> #11 0x000055e446c3e8ee in bdrv_open_common (bs=0x55e448ceebe0, file=0x0, 
> options=0x55e448cf4330, errp=0x7ffc31aba470) at ../block.c:1827
> #12 0x000055e446c427b6 in bdrv_open_inherit
>    (filename=0x55e448ce4300 "fat:rw:fat-type=16:/tmp", reference=0x0, 
> options=0x55e448cf4330, flags=40962, parent=0x55e448ce75a0, 
> child_class=0x55e4475099c0 <child_of_bds>, child_role=19, 
> errp=0x7ffc31aba670)
>    at ../block.c:3747
> #13 0x000055e446c419f5 in bdrv_open_child_bs
>    (filename=0x55e448ce4300 "fat:rw:fat-type=16:/tmp", 
> options=0x55e448cec9f0, bdref_key=0x55e446f884d0 "file", 
> parent=0x55e448ce75a0, child_class=0x55e4475099c0 <child_of_bds>, 
> child_role=19, allow_none=true, errp=0x7ffc31aba670) at ../block.c:3387
> #14 0x000055e446c42568 in bdrv_open_inherit
>    (filename=0x55e448ce4300 "fat:rw:fat-type=16:/tmp", reference=0x0, 
> options=0x55e448cec9f0, flags=8194, parent=0x0, child_class=0x0, 
> child_role=0, errp=0x55e447652688 <error_fatal>) at ../block.c:3694
> #15 0x000055e446c42cf6 in bdrv_open (filename=0x55e448ce4300 
> "fat:rw:fat-type=16:/tmp", reference=0x0, options=0x55e448ce4f00, flags=0, 
> errp=0x55e447652688 <error_fatal>) at ../block.c:3840
> #16 0x000055e446c5fcaf in blk_new_open (filename=0x55e448ce4300 
> "fat:rw:fat-type=16:/tmp", reference=0x0, options=0x55e448ce4f00, flags=0, 
> errp=0x55e447652688 <error_fatal>) at ../block/block-backend.c:435
> #17 0x000055e446beca1d in blockdev_init (file=0x55e448ce4300 
> "fat:rw:fat-type=16:/tmp", bs_opts=0x55e448ce4f00, errp=0x55e447652688 
> <error_fatal>) at ../blockdev.c:609
> #18 0x000055e446bed900 in drive_new (all_opts=0x55e448ac4850, 
> block_default_type=IF_IDE, errp=0x55e447652688 <error_fatal>) at 
> ../blockdev.c:993
> #19 0x000055e446abd69e in drive_init_func (opaque=0x55e448bd4d40, 
> opts=0x55e448ac4850, errp=0x55e447652688 <error_fatal>) at 
> ../softmmu/vl.c:613
> #20 0x000055e446da26d9 in qemu_opts_foreach (list=0x55e4475e8960 
> <qemu_drive_opts>, func=0x55e446abd66a <drive_init_func>, 
> opaque=0x55e448bd4d40, errp=0x55e447652688 <error_fatal>) at 
> ../util/qemu-option.c:1137
> #21 0x000055e446abd8e7 in configure_blockdev (bdo_queue=0x55e44757a2a0 
> <bdo_queue>, machine_class=0x55e448bd4c90, snapshot=0) at ../softmmu/vl.c:672
> #22 0x000055e446ac1b75 in qemu_create_early_backends () at 
> ../softmmu/vl.c:1925
> #23 0x000055e446ac5c1f in qemu_init (argc=6, argv=0x7ffc31abae58, 
> envp=0x7ffc31abae90) at ../softmmu/vl.c:3636
> #24 0x000055e4466b3c71 in main (argc=6, argv=0x7ffc31abae58, 
> envp=0x7ffc31abae90) at ../softmmu/main.c:49
> (gdb) fr 5
> #5  0x000055e446c411cf in bdrv_set_file_or_backing_noperm 
> (parent_bs=0x55e448ceebe0, child_bs=0x55e448d21e40, is_backing=true, 
> tran=0x55e448d16c20, errp=0x55e447652680 <error_abort>) at ../block.c:3158
> 3158            error_setg(errp, "Driver '%s' of node '%s' does not support 
> backing "
>
>
> (gdb) fr 7
> #7  0x000055e446c413ae in bdrv_set_backing_hd (bs=0x55e448ceebe0, 
> backing_hd=0x55e448d21e40, errp=0x55e447652680 <error_abort>) at 
> ../block.c:3227
> 3227        ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
> (gdb) p bs->drv
> $1 = (BlockDriver *) 0x55e4475e9760 <bdrv_vvfat>
>
>
> Hmm. Really vvfat doesn't seem to support backing files. But it does create a 
> node with vvfat_write_target driver and set it as backing of itself (of vvfat 
> node I mean).. And I don't see, where is this backing used.
>
>
> Looking at git history, I see commit a8a4d15c1c34d of 2017, which describes 
> that this fake backing file doesn't work anyway.
>
> So, if just remove this backing file, bug doesn't reproduce. But I think 
> better fix is to deprecate vvfat (recommend use virtio-fs instead for 
> sharing) and drop it after deprecation period.

virtio-fs needs guest drivers which is not available on most but a few 
guests. vvfat is more interoperable therefore would be useful for those 
guests that have FAT and USB (basically everything has these) if it 
worked. Therefore instead of deprecating and dropping it fixing it would 
be better just because QEMU is not only about running Linux guests.

Regards,
BALATON Zoltan

>
>
> Use it with no guarantee:) :
>
> diff --git a/block/vvfat.c b/block/vvfat.c
> index ae9d387da7..34bf1e3a86 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -3098,26 +3098,6 @@ static int coroutine_fn 
> vvfat_co_block_status(BlockDriverState *bs,
>     return BDRV_BLOCK_DATA;
> }
> -static int coroutine_fn
> -write_target_commit(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
> -                    QEMUIOVector *qiov, int flags)
> -{
> -    int ret;
> -
> -    BDRVVVFATState* s = *((BDRVVVFATState**) bs->opaque);
> -    qemu_co_mutex_lock(&s->lock);
> -    ret = try_commit(s);
> -    qemu_co_mutex_unlock(&s->lock);
> -
> -    return ret;
> -}
> -
> -static BlockDriver vvfat_write_target = {
> -    .format_name        = "vvfat_write_target",
> -    .instance_size      = sizeof(void*),
> -    .bdrv_co_pwritev    = write_target_commit,
> -};
> -
> static void vvfat_qcow_options(BdrvChildRole role, bool parent_is_format,
>                                int *child_flags, QDict *child_options,
>                                int parent_flags, QDict *parent_options)
> @@ -3133,7 +3113,6 @@ static int enable_write_target(BlockDriverState *bs, 
> Error **errp)
> {
>     BDRVVVFATState *s = bs->opaque;
>     BlockDriver *bdrv_qcow = NULL;
> -    BlockDriverState *backing;
>     QemuOpts *opts = NULL;
>     int ret;
>     int size = sector2cluster(s, s->sector_count);
> @@ -3184,13 +3163,6 @@ static int enable_write_target(BlockDriverState *bs, 
> Error **errp)
>     unlink(s->qcow_filename);
> #endif
> -    backing = bdrv_new_open_driver(&vvfat_write_target, NULL, 
> BDRV_O_ALLOW_RDWR,
> -                                   &error_abort);
> -    *(void**) backing->opaque = s;
> -
> -    bdrv_set_backing_hd(s->bs, backing, &error_abort);
> -    bdrv_unref(backing);
> -
>     return 0;
>  err:
> @@ -3205,17 +3177,10 @@ static void vvfat_child_perm(BlockDriverState *bs, 
> BdrvChild *c,
>                              uint64_t perm, uint64_t shared,
>                              uint64_t *nperm, uint64_t *nshared)
> {
> -    if (role & BDRV_CHILD_DATA) {
> -        /* This is a private node, nobody should try to attach to it */
> -        *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
> -        *nshared = BLK_PERM_WRITE_UNCHANGED;
> -    } else {
> -        assert(role & BDRV_CHILD_COW);
> -        /* The backing file is there so 'commit' can use it. vvfat doesn't
> -         * access it in any way. */
> -        *nperm = 0;
> -        *nshared = BLK_PERM_ALL;
> -    }
> +    assert(role & BDRV_CHILD_DATA);
> +    /* This is a private node, nobody should try to attach to it */
> +    *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
> +    *nshared = BLK_PERM_WRITE_UNCHANGED;
> }
>  static void vvfat_close(BlockDriverState *bs)
>
>
>
>
>
>

