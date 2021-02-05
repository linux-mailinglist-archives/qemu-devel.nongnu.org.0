Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A03310A0D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:17:48 +0100 (CET)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7z7T-0002Gm-Nh
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l7z5Q-0001Hn-JT; Fri, 05 Feb 2021 06:15:40 -0500
Received: from mx2.suse.de ([195.135.220.15]:39280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l7z5K-00011t-Hf; Fri, 05 Feb 2021 06:15:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1DFFAD24;
 Fri,  5 Feb 2021 11:15:30 +0000 (UTC)
Subject: Re: [PATCH] iotests: 30: drop from auto group (and effectively from
 make check)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210205111021.715240-1-vsementsov@virtuozzo.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <dd4a56d4-a347-296a-1dbc-cd279e7e223c@suse.de>
Date: Fri, 5 Feb 2021 12:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210205111021.715240-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just in case it helps,

I started getting this error only when I rebased to latest master a couple days ago, after regular rebasing and testing with full make check every 1 or 2 days.

Ciao,

Claudio


On 2/5/21 12:10 PM, Vladimir Sementsov-Ogievskiy wrote:
> I reproduced the following crash fast enough:
> 
> 0  raise () at /lib64/libc.so.6
> 1  abort () at /lib64/libc.so.6
> 2  _nl_load_domain.cold () at /lib64/libc.so.6
> 3  annobin_assert.c_end () at /lib64/libc.so.6
> 4  bdrv_reopen_multiple (bs_queue=0x55de75fa9b70, errp=0x0)
>    at ../block.c:3820
> 5  bdrv_reopen_set_read_only (bs=0x55de760fc020, read_only=true,
>    errp=0x0) at ../block.c:3870
> 6  stream_clean (job=0x55de75fa9410) at ../block/stream.c:99
> 7  job_clean (job=0x55de75fa9410) at ../job.c:680
> 8  job_finalize_single (job=0x55de75fa9410) at ../job.c:696
> 9  job_txn_apply (job=0x55de75fa9410,
>    fn=0x55de741eee27 <job_finalize_single>) at ../job.c:158
> 10 job_do_finalize (job=0x55de75fa9410) at ../job.c:805
> 11 job_completed_txn_success (job=0x55de75fa9410) at ../job.c:855
> 12 job_completed (job=0x55de75fa9410) at ../job.c:868
> 13 job_exit (opaque=0x55de75fa9410) at ../job.c:888
> 14 aio_bh_call (bh=0x55de76b9b4e0) at ../util/async.c:136
> 15 aio_bh_poll (ctx=0x55de75bc5300) at ../util/async.c:164
> 16 aio_dispatch (ctx=0x55de75bc5300) at ../util/aio-posix.c:381
> 17 aio_ctx_dispatch (source=0x55de75bc5300, callback=0x0,
>    user_data=0x0) at ../util/async.c:306
> 18 g_main_context_dispatch () at /lib64/libglib-2.0.so.0
> 19 glib_pollfds_poll () at ../util/main-loop.c:232
> 20 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
> 21 main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
> 22 qemu_main_loop () at ../softmmu/runstate.c:722
> 23 main (argc=20, argv=0x7ffe218f0268, envp=0x7ffe218f0310) at
>    ../softmmu/main.c:50
> 
> (gdb) fr 4
> 4  bdrv_reopen_multiple (bs_queue=0x55de75fa9b70, errp=0x0) at
>       ../block.c:3820
> 3820                assert(perm == state->perm);
> (gdb) list
> 3815
> 3816            if (ret == 0) {
> 3817                uint64_t perm, shared;
> 3818
> 3819                bdrv_get_cumulative_perm(state->bs, &perm,
>                     &shared);
> 3820                assert(perm == state->perm);
> 3821                assert(shared == state->shared_perm);
> 3822
> 3823                bdrv_set_perm(state->bs);
> 3824            } else {
> (gdb) p perm
> $1 = 1
> (gdb) p state->perm
> $2 = 0
> 
> Then I had 38 successful iterations and another crash:
> 0  bdrv_check_update_perm (bs=0x5631ac97bc50, q=0x0, new_used_perm=1,
>    new_shared_perm=31, ignore_children=0x0, errp=0x7ffd9d477cf8) at
>    ../block.c:2197
> 1  bdrv_root_attach_child
>     (child_bs=0x5631ac97bc50, child_name=0x5631aaf6b1f9 "backing",
>     child_class=0x5631ab280ca0 <child_of_bds>, child_role=8,
>     ctx=0x5631ab757300, perm=1, shared_perm=31, opaque=0x5631abb8c020,
>     errp=0x7ffd9d477cf8)
>     at ../block.c:2642
> 2  bdrv_attach_child (parent_bs=0x5631abb8c020,
>    child_bs=0x5631ac97bc50, child_name=0x5631aaf6b1f9 "backing",
>    child_class=0x5631ab280ca0 <child_of_bds>, child_role=8,
>    errp=0x7ffd9d477cf8)
>     at ../block.c:2719
> 3  bdrv_set_backing_hd (bs=0x5631abb8c020, backing_hd=0x5631ac97bc50,
>    errp=0x7ffd9d477cf8) at ../block.c:2854
> 4  stream_prepare (job=0x5631ac751eb0) at ../block/stream.c:74
> 5  job_prepare (job=0x5631ac751eb0) at ../job.c:784
> 6  job_txn_apply (job=0x5631ac751eb0, fn=0x5631aacb1156 <job_prepare>)
>    at ../job.c:158
> 7  job_do_finalize (job=0x5631ac751eb0) at ../job.c:801
> 8  job_completed_txn_success (job=0x5631ac751eb0) at ../job.c:855
> 9  job_completed (job=0x5631ac751eb0) at ../job.c:868
> 10 job_exit (opaque=0x5631ac751eb0) at ../job.c:888
> 11 aio_bh_call (bh=0x7f3d9c007680) at ../util/async.c:136
> 12 aio_bh_poll (ctx=0x5631ab757300) at ../util/async.c:164
> 13 aio_dispatch (ctx=0x5631ab757300) at ../util/aio-posix.c:381
> 14 aio_ctx_dispatch (source=0x5631ab757300, callback=0x0,
>    user_data=0x0) at ../util/async.c:306
> 15 g_main_context_dispatch () at /lib64/libglib-2.0.so.0
> 16 glib_pollfds_poll () at ../util/main-loop.c:232
> 17 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
> 18 main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
> 19 qemu_main_loop () at ../softmmu/runstate.c:722
> 20 main (argc=20, argv=0x7ffd9d478198, envp=0x7ffd9d478240) at
>    ../softmmu/main.c:50
> (gdb) list
> 2192        QLIST_FOREACH(c, &bs->parents, next_parent) {
> 2193            if (g_slist_find(ignore_children, c)) {
> 2194                continue;
> 2195            }
> 2196
> 2197            if ((new_used_perm & c->shared_perm) != new_used_perm)
>                 {
> 2198                char *user = bdrv_child_user_desc(c);
> 2199                char *perm_names = bdrv_perm_names(new_used_perm &
>                     ~c->shared_perm);
> 2200
> 2201                error_setg(errp, "Conflicts with use by %s as '%s',
>                     which does not "
> (gdb) p c
> $1 = (BdrvChild *) 0x8585858585858585
> 
> and trying to reproduce it on top of
> "block: update graph permissions update" I had 634 successful
> iterations
> and then the following crash (which looks much better):
> 0  raise () at /lib64/libc.so.6
> 1  abort () at /lib64/libc.so.6
> 2  _nl_load_domain.cold () at /lib64/libc.so.6
> 3  annobin_assert.c_end () at /lib64/libc.so.6
> 4  bdrv_replace_child_noperm (child=0x5585bb632010,
>    new_bs=0x5585bc4f42a0) at ../block.c:2589
> 5  bdrv_replace_child (child=0x5585bb632010, new_bs=0x5585bc4f42a0,
>    tran=0x7fff5a14d8e0) at ../block.c:2211
> 6  bdrv_set_backing_noperm (bs=0x5585bb704020,
>    backing_bs=0x5585bc4f42a0, tran=0x7fff5a14d8e0, errp=0x7fff5a14d918)
>    at ../block.c:3030
> 7  bdrv_set_backing_hd (bs=0x5585bb704020, backing_hd=0x5585bc4f42a0,
>    errp=0x7fff5a14d918) at ../block.c:3072
> 8  stream_prepare (job=0x5585bc2ef230) at ../block/stream.c:74
> 9  job_prepare (job=0x5585bc2ef230) at ../job.c:784
> 10 job_txn_apply (job=0x5585bc2ef230, fn=0x5585ba638ad0 <job_prepare>)
>    at ../job.c:158
> 11 job_do_finalize (job=0x5585bc2ef230) at ../job.c:801
> 12 job_completed_txn_success (job=0x5585bc2ef230) at ../job.c:855
> 13 job_completed (job=0x5585bc2ef230) at ../job.c:868
> 14 job_exit (opaque=0x5585bc2ef230) at ../job.c:888
> 15 aio_bh_call (bh=0x7f62b8004270) at ../util/async.c:136
> 16 aio_bh_poll (ctx=0x5585bb2ce4a0) at ../util/async.c:164
> 17 aio_dispatch (ctx=0x5585bb2ce4a0) at ../util/aio-posix.c:381
> 18 aio_ctx_dispatch (source=0x5585bb2ce4a0, callback=0x0,
>    user_data=0x0) at ../util/async.c:306
> 19 g_main_context_dispatch () at /lib64/libglib-2.0.so.0
> 20 glib_pollfds_poll () at ../util/main-loop.c:232
> 21 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
> 22 main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
> 23 qemu_main_loop () at ../softmmu/runstate.c:722
> 24 main (argc=20, argv=0x7fff5a14ddb8, envp=0x7fff5a14de60) at
>    ../softmmu/main.c:50
> 
> (gdb) fr 4
> 4  bdrv_replace_child_noperm (child=0x5585bb632010,
>    new_bs=0x5585bc4f42a0) at ../block.c:2589
> 2589            assert(bdrv_get_aio_context(old_bs) ==
>                 bdrv_get_aio_context(new_bs));
> (gdb) list
> 2584        int drain_saldo;
> 2585
> 2586        assert(!child->frozen);
> 2587
> 2588        if (old_bs && new_bs) {
> 2589            assert(bdrv_get_aio_context(old_bs) ==
>                 bdrv_get_aio_context(new_bs));
> 2590        }
> 2591
> 2592        new_bs_quiesce_counter = (new_bs ? new_bs->quiesce_counter
>             : 0);
> 2593        drain_saldo = new_bs_quiesce_counter -
>             child->parent_quiesce_counter;
> 
> So it seems reasonable to drop test from auto group at least until we
> merge "block: update graph permissions update"
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Note: be free to shorten commit message if needed :)
> 
>  tests/qemu-iotests/030 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
> index 832fe4a1e2..12aa9ed37e 100755
> --- a/tests/qemu-iotests/030
> +++ b/tests/qemu-iotests/030
> @@ -1,5 +1,5 @@
>  #!/usr/bin/env python3
> -# group: rw auto backing
> +# group: rw backing
>  #
>  # Tests for image streaming.
>  #
> 


