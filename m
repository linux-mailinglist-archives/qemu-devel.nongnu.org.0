Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59135BD38B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:21:57 +0200 (CEST)
Received: from localhost ([::1]:55824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKSy-0005oU-Ly
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oaKRJ-0002IJ-LT; Mon, 19 Sep 2022 13:20:13 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:44914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oaKRH-0008QD-Me; Mon, 19 Sep 2022 13:20:13 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 452B62E0941;
 Mon, 19 Sep 2022 20:20:02 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b505::1:12] (unknown
 [2a02:6b8:b081:b505::1:12])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 DIMuETEkt8-K0P8TSJp; Mon, 19 Sep 2022 20:20:01 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663608001; bh=vuv18Wpqa0frrNY/BP+SHMy9DkdfbRTeea4CAv4Yn0I=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Wk4RUOs6KE30mVtzj3Oe9v37nsUmfR6NFU1K2yLpIRyeaEKaH7Yzytj8bQnSTNJzf
 0aFIslssOeUubPeHbEz6yc2kkyjGmT8MernC80v3S6EA3oydgxpyuMHGl3ZpowrEmF
 S/hU9o3OY9MB4cWcNIZymued5aj+cskQ4ZeFd5mQ=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7fc8bc06-6a44-9dc9-2fe4-4b7a321bf86b@yandex-team.ru>
Date: Mon, 19 Sep 2022 20:20:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 for-7.2 00/15] block: cleanup backing and file handling
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com
References: <20220726201134.924743-1-vsementsov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220726201134.924743-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ping. Seems, all patches are reviewed

On 7/26/22 23:11, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> That's the first part of
> "[PATCH v5 00/45] Transactional block-graph modifying API",
> updated and is fully reviewed by Hanna.
> 
> v7: add r-bs and rebase on master
> 
> Vladimir Sementsov-Ogievskiy (15):
>    block: BlockDriver: add .filtered_child_is_backing field
>    block: introduce bdrv_open_file_child() helper
>    block/blklogwrites: don't care to remove bs->file child on failure
>    test-bdrv-graph-mod: update test_parallel_perm_update test case
>    tests-bdrv-drain: bdrv_replace_test driver: declare supports_backing
>    test-bdrv-graph-mod: fix filters to be filters
>    block: document connection between child roles and
>      bs->backing/bs->file
>    block/snapshot: stress that we fallback to primary child
>    Revert "block: Let replace_child_noperm free children"
>    Revert "block: Let replace_child_tran keep indirect pointer"
>    Revert "block: Restructure remove_file_or_backing_child()"
>    Revert "block: Pass BdrvChild ** to replace_child_noperm"
>    block: Manipulate bs->file / bs->backing pointers in .attach/.detach
>    block/snapshot: drop indirection around bdrv_snapshot_fallback_ptr
>    block: refactor bdrv_remove_file_or_backing_child to bdrv_remove_child
> 
>   block.c                            | 435 ++++++++++-------------------
>   block/blkdebug.c                   |   9 +-
>   block/blklogwrites.c               |  11 +-
>   block/blkreplay.c                  |   7 +-
>   block/blkverify.c                  |   9 +-
>   block/bochs.c                      |   7 +-
>   block/cloop.c                      |   7 +-
>   block/commit.c                     |   1 +
>   block/copy-before-write.c          |   9 +-
>   block/copy-on-read.c               |   9 +-
>   block/crypto.c                     |  11 +-
>   block/dmg.c                        |   7 +-
>   block/filter-compress.c            |   8 +-
>   block/mirror.c                     |   1 +
>   block/parallels.c                  |   7 +-
>   block/preallocate.c                |   9 +-
>   block/qcow.c                       |   6 +-
>   block/qcow2.c                      |   8 +-
>   block/qed.c                        |   8 +-
>   block/raw-format.c                 |   4 +-
>   block/replication.c                |   8 +-
>   block/snapshot-access.c            |   6 +-
>   block/snapshot.c                   |  59 ++--
>   block/throttle.c                   |   8 +-
>   block/vdi.c                        |   7 +-
>   block/vhdx.c                       |   7 +-
>   block/vmdk.c                       |   7 +-
>   block/vpc.c                        |   7 +-
>   include/block/block-common.h       |  39 +++
>   include/block/block-global-state.h |   3 +
>   include/block/block_int-common.h   |  29 +-
>   tests/unit/test-bdrv-drain.c       |  11 +-
>   tests/unit/test-bdrv-graph-mod.c   | 104 ++++---
>   33 files changed, 389 insertions(+), 479 deletions(-)
> 


-- 
Best regards,
Vladimir

