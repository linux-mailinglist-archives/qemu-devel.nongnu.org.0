Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439545EDE92
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:15:58 +0200 (CEST)
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXqv-0006wm-0U
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1odXme-0001VS-0u; Wed, 28 Sep 2022 10:11:33 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:48725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1odXmZ-0000SD-LK; Wed, 28 Sep 2022 10:11:31 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A679244641;
 Wed, 28 Sep 2022 16:11:08 +0200 (CEST)
Message-ID: <1db7f571-cb7f-c293-04cc-cd856e060c3f@proxmox.com>
Date: Wed, 28 Sep 2022 16:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Fiona Ebner <f.ebner@proxmox.com>
Subject: Question regarding live-migration with drive-mirror
Content-Language: en-US
To: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: jsnow@redhat.com, vsementsov@yandex-team.ru, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, quintela@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 =?UTF-8?Q?Fabian_Gr=c3=bcnbichler?= <f.gruenbichler@proxmox.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
recently one of our users provided a backtrace[0] for the following
assertion failure during a live migration that uses drive-mirror to sync
a local disk:
> bdrv_co_write_req_prepare: Assertion `!(bs->open_flags & BDRV_O_INACTIVE)' failed

The way we do migration with a local disk is essentially:
1. start target instance with a suitable NBD export
2. start drive-mirror on the source side and wait for it to become ready
once
3. issue 'migrate' QMP command
4. cancel drive-mirror blockjob after the migration has finished

I reproduced the issue with the following fio script running in the
guest (to dirty lots of clusters):
> fio --name=make-mirror-work --size=100M --direct=1 --rw=randwrite \
>     --bs=4k --ioengine=psync --numjobs=5 --runtime=60 --time_based

AFAIU, the issue is that nothing guarantees that the drive mirror is
ready when the migration inactivates the block drives.

Is using copy-mode=write-blocking for drive-mirror to only way to avoid
this issue? There, the downside is that the network (used by the mirror)
would become a bottleneck for IO in the guest, while the behavior would
really only be needed during the final phase.

I guess the assert should be avoided in any case. Here's a few ideas
that came to mind:
1. migration should fail gracefully
2. migration should wait for the mirror-jobs to become ready before
inactivating the block drives - that would increase the downtime in
these situations of course
2A. additionally, drive-mirror could be taken into account when
converging the migration somehow?

I noticed the following comment in the mirror implementation
>         /* Note that even when no rate limit is applied we need to yield
>          * periodically with no pending I/O so that bdrv_drain_all() returns.
>          * We do so every BLKOCK_JOB_SLICE_TIME nanoseconds, or when there is
>          * an error, or when the source is clean, whichever comes first. */

3. change draining behavior after the job was ready once, so that
bdrv_drain_all() will only return when the job is ready again? Hope I'm
not completely misunderstanding this.

Best Regards,
Fiona

[0]:
> Thread 1 (Thread 0x7f3389d4a000 (LWP 2297576) "kvm"):
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007f339488d537 in __GI_abort () at abort.c:79
> #2  0x00007f339488d40f in __assert_fail_base (fmt=0x7f3394a056a8 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x5595f85bfd70 "!(bs->open_flags & BDRV_O_INACTIVE)", file=0x5595f85cb576 "../block/io.c", line=2026, function=<optimized out>) at assert.c:92
> #3  0x00007f339489c662 in __GI___assert_fail (assertion=assertion@entry=0x5595f85bfd70 "!(bs->open_flags & BDRV_O_INACTIVE)", file=file@entry=0x5595f85cb576 "../block/io.c", line=line@entry=2026, function=function@entry=0x5595f85cc510 <__PRETTY_FUNCTION__.8> "bdrv_co_write_req_prepare") at assert.c:101
> #4  0x00005595f83218f2 in bdrv_co_write_req_prepare (child=0x5595f91cab90, offset=60867018752, bytes=196608, req=0x7f324a2e9d70, flags=0) at ../block/io.c:2026
> #5  0x00005595f8323384 in bdrv_aligned_pwritev (child=child@entry=0x5595f91cab90, req=req@entry=0x7f324a2e9d70, offset=60867018752, bytes=196608, align=align@entry=1, qiov=0x5595f9030d58, qiov_offset=0, flags=0) at ../block/io.c:2140
> #6  0x00005595f832485a in bdrv_co_pwritev_part (child=0x5595f91cab90, offset=<optimized out>, offset@entry=60867018752, bytes=<optimized out>, bytes@entry=196608, qiov=<optimized out>, qiov@entry=0x5595f9030d58, qiov_offset=<optimized out>, qiov_offset@entry=0, flags=flags@entry=0) at ../block/io.c:2353
> #7  0x00005595f8315a09 in blk_co_do_pwritev_part (blk=blk@entry=0x5595f91db8c0, offset=60867018752, bytes=196608, qiov=qiov@entry=0x5595f9030d58, qiov_offset=qiov_offset@entry=0, flags=flags@entry=0) at ../block/block-backend.c:1365
> #8  0x00005595f8315bdd in blk_co_pwritev_part (flags=0, qiov_offset=0, qiov=qiov@entry=0x5595f9030d58, bytes=<optimized out>, offset=<optimized out>, blk=0x5595f91db8c0) at ../block/block-backend.c:1380
> #9  blk_co_pwritev (blk=0x5595f91db8c0, offset=<optimized out>, bytes=<optimized out>, qiov=qiov@entry=0x5595f9030d58, flags=flags@entry=0) at ../block/block-backend.c:1391
> #10 0x00005595f8328a59 in mirror_read_complete (ret=0, op=0x5595f9030d50) at ../block/mirror.c:260
> #11 mirror_co_read (opaque=0x5595f9030d50) at ../block/mirror.c:400
> #12 0x00005595f843a39b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> #13 0x00007f33948b8d40 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #14 0x00007f324a3ea6e0 in ?? ()
> #15 0x0000000000000000 in ?? ()


