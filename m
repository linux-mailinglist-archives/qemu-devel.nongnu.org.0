Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB706516DC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 00:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Pyo-0007tu-VZ; Mon, 19 Dec 2022 18:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7Pym-0007t8-Gv; Mon, 19 Dec 2022 18:55:32 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p7Pyk-0003oY-9r; Mon, 19 Dec 2022 18:55:32 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F404438CD2;
 Mon, 19 Dec 2022 23:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671494128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SdDd6YFaK2wq+MkD0bNVqgUuXulRbv1OBUWq9uNAQAY=;
 b=Da36SmvVs7YTs7wUt+OjqKO0zy+XgZLmlT8EoKHxX40gyynta2+SdMBa+tpdhVX0SU92Qu
 G4NMKur/8wTyWSkMpOiq4HpaLMzfmX5uhzs8Oku7jb9IV693gysxj+jZx4ANO/NSQZWAQV
 8ZtE4Cps1zi4a6K57PAp+rWXR2N2eck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671494128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SdDd6YFaK2wq+MkD0bNVqgUuXulRbv1OBUWq9uNAQAY=;
 b=YQNUpmUQwjo+6EwIds80mAl97vbeMFC1OaXflicuEbfPr6u9+ht10G9qfNHSfL+l8XKJq7
 nm9nFr+J1cExXfCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7905113498;
 Mon, 19 Dec 2022 23:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LCO+D+/5oGMicQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 19 Dec 2022 23:55:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PULL v3 00/50] Block layer patches
In-Reply-To: <20221215152407.201278-1-kwolf@redhat.com>
References: <20221215152407.201278-1-kwolf@redhat.com>
Date: Mon, 19 Dec 2022 20:55:24 -0300
Message-ID: <87r0wvosnn.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kevin Wolf <kwolf@redhat.com> writes:

> The following changes since commit 48804eebd4a327e4b11f902ba80a00876ee53a43:
>
>   Merge tag 'pull-misc-2022-12-14' of https://repo.or.cz/qemu/armbru into staging (2022-12-15 10:13:46 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 1b3ff9feb942c2ad0b01ac931e99ad451ab0ef39:
>
>   block: GRAPH_RDLOCK for functions only called by co_wrappers (2022-12-15 16:08:23 +0100)
>
> v3:
> - Dropped "configure: Enable -Wthread-safety if present" because FreeBSD
>   has TSA annotations in its pthread locking functions, so we would have
>   to annotate the use of every lock in QEMU first before we can enable
>   it.
>
> v2:
> - Changed TSA capability name to "mutex" to work with older clang
>   versions. The tsan-build CI job succeeds now.
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Code cleanups around block graph modification
> - Simplify drain
> - coroutine_fn correctness fixes, including splitting generated
>   coroutine wrappers into co_wrapper (to be called only from
>   non-coroutine context) and co_wrapper_mixed (both coroutine and
>   non-coroutine context)
> - Introduce a block graph rwlock
>
> ----------------------------------------------------------------
> Emanuele Giuseppe Esposito (21):
>       block-io: introduce coroutine_fn duplicates for bdrv_common_block_status_above callers
>       block-copy: add coroutine_fn annotations
>       nbd/server.c: add coroutine_fn annotations
>       block-backend: replace bdrv_*_above with blk_*_above
>       block/vmdk: add coroutine_fn annotations
>       block: avoid duplicating filename string in bdrv_create
>       block: distinguish between bdrv_create running in coroutine and not
>       block: bdrv_create_file is a coroutine_fn
>       block: rename generated_co_wrapper in co_wrapper_mixed
>       block-coroutine-wrapper.py: introduce co_wrapper
>       block-coroutine-wrapper.py: support functions without bs arg
>       block-coroutine-wrapper.py: support also basic return types
>       block: convert bdrv_create to co_wrapper
>       block/dirty-bitmap: convert coroutine-only functions to co_wrapper
>       graph-lock: Implement guard macros
>       async: Register/unregister aiocontext in graph lock list
>       block: wrlock in bdrv_replace_child_noperm
>       block: remove unnecessary assert_bdrv_graph_writable()
>       block: assert that graph read and writes are performed correctly
>       block-coroutine-wrapper.py: introduce annotations that take the graph rdlock
>       block: use co_wrapper_mixed_bdrv_rdlock in functions taking the rdlock
>
> Kevin Wolf (24):
>       qed: Don't yield in bdrv_qed_co_drain_begin()
>       test-bdrv-drain: Don't yield in .bdrv_co_drained_begin/end()
>       block: Revert .bdrv_drained_begin/end to non-coroutine_fn
>       block: Remove drained_end_counter
>       block: Inline bdrv_drain_invoke()
>       block: Fix locking for bdrv_reopen_queue_child()
>       block: Drain individual nodes during reopen
>       block: Don't use subtree drains in bdrv_drop_intermediate()
>       stream: Replace subtree drain with a single node drain
>       block: Remove subtree drains
>       block: Call drain callbacks only once
>       block: Remove ignore_bds_parents parameter from drain_begin/end.
>       block: Drop out of coroutine in bdrv_do_drained_begin_quiesce()
>       block: Don't poll in bdrv_replace_child_noperm()
>       block: Remove poll parameter from bdrv_parent_drained_begin_single()
>       block: Factor out bdrv_drain_all_begin_nopoll()

Hi, 

With today's master at c15dc499cc (Merge tag 'pull-misc-20221218'
of https://gitlab.com/rth7680/qemu into staging, 2022-12-19),

I get a test failure:

$ make check-avocado AVOCADO_TESTS=../tests/avocado/reverse_debugging.py:ReverseDebugging_X86_64.test_x86_64_pc
...
Output: qemu-system-x86_64: ../block/block-backend.c:2572:
blk_root_drained_poll: Assertion `blk->quiesce_counter' failed.

Bisect points to this patch
da0bd74434 (block: Factor out bdrv_drain_all_begin_nopoll(), 2022-12-07)

Command from avocado logs (paths cut to save space):

./qemu-system-x86_64 -display none -vga none \
-chardev socket,id=mon,path=monitor.sock \
-mon chardev=mon,mode=control -machine pc \
-chardev socket,id=console,path=console.sock,server=on,wait=off \
-serial chardev:console -icount shift=7,rr=record,rrfile=replay.bin,rrsnapshot=init \
-net none -drive file=disk.qcow2,if=none

Happens with arm as well:

./qemu-system-aarch64 -display none -vga none \
-chardev socket,id=mon,path=monitor.sock \
-mon chardev=mon,mode=control -machine virt \
-chardev socket,id=console,path=console.sock,server=on,wait=off \
-serial chardev:console -cpu cortex-a53 -icount \
 shift=7,rr=record,rrfile=replay.bin,rrsnapshot=init \
-net none -drive file=disk.qcow2,if=none \
-kernel vmlinuz

>       Import clang-tsa.h
>       clang-tsa: Add TSA_ASSERT() macro
>       clang-tsa: Add macros for shared locks
>       test-bdrv-drain: Fix incorrrect drain assumptions
>       block: Fix locking in external_snapshot_prepare()
>       graph-lock: TSA annotations for lock/unlock functions
>       Mark assert_bdrv_graph_readable/writable() GRAPH_RD/WRLOCK
>       block: GRAPH_RDLOCK for functions only called by co_wrappers
>
> Paolo Bonzini (1):
>       graph-lock: Introduce a lock to protect block graph operations
>
> Vladimir Sementsov-Ogievskiy (4):
>       block: Inline bdrv_detach_child()
>       block: drop bdrv_remove_filter_or_cow_child
>       block: bdrv_refresh_perms(): allow external tran
>       block: refactor bdrv_list_refresh_perms to allow any list of nodes
>

