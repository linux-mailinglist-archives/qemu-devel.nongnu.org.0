Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E5645C25
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 15:13:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2vAX-00012v-EC; Wed, 07 Dec 2022 09:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p2vAR-00012a-Br
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p2vAP-0003qX-IB
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:12:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670422376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geMJ+rTFuXnBdJy/WLsDSar94qIChEl7yHF2wjx3axE=;
 b=eMPIvxKayzi/YOeIQc4hESSnia7yj6iaT24aEzCtMz9QL2LCUQhC7YP2J+aUSSjBJwPUcC
 zZSD+KyQiPap5mpJBuX+vqYtETaSoY/rUJsDEv3BJBU/uGHPSzYOBEX5r7vl7IlVq9OwWb
 TX82Hv499PF6q1iCGr542oWP49q4KLo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-Q1vLyJ35OYygvBlcTOH_dw-1; Wed, 07 Dec 2022 09:12:54 -0500
X-MC-Unique: Q1vLyJ35OYygvBlcTOH_dw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c1-20020a7bc001000000b003cfe40fca79so648437wmb.6
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 06:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=geMJ+rTFuXnBdJy/WLsDSar94qIChEl7yHF2wjx3axE=;
 b=y+z2JL7nP4NKH8kny2QHV1fCYueSGPR71fpfinslpwQelNyt6aese9S1Wuc27cI39h
 KJlymG0oW+uOa00EfZgTTb06HpugzHfxK5vaoC9dTSqP0HQNqoN8+UA5pEwXe7NSYexy
 uj85Aytkp49yrDK/HQuTNCaTt8D3izQpK3rYYvZlbPaE6Bt3ZJKX5RGf+nukPchYzK+I
 l0Hf1xvEaRZPbLrK+F97QB1kFDW9Uezjy6qiRuizLlTGUdpvdr2cASbUh7k9rbmupeV7
 sdF2rSi9bYP4fdspKCpcF8LjqSsXC3ap3WnIMzvswyEvpSOWakQDSDMcLu3pIKq7RFL6
 /NxA==
X-Gm-Message-State: ANoB5pmA9FLQupodpu/cu0aE/Pnzl/Us+YiFVPkHufnu8FP1ObUA3jYx
 RA0JIw5p6X6gpnw0XlHj/CHQDa4eoBtlukgL1ys1pRVHWR6hf+4J/rJFlOKvNAhFzYp/PtLTt1/
 vbjGr65n+nF0V2U8=
X-Received: by 2002:a05:600c:4446:b0:3d0:7e9a:75c1 with SMTP id
 v6-20020a05600c444600b003d07e9a75c1mr19533729wmn.157.1670422370861; 
 Wed, 07 Dec 2022 06:12:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5deDWpEOCrNK9vAJhGALL8/CibuCreBYoGPFAHeYp5TcGDyK5TUZEs7D1ni0iQxBYHs3OhoA==
X-Received: by 2002:a05:600c:4446:b0:3d0:7e9a:75c1 with SMTP id
 v6-20020a05600c444600b003d07e9a75c1mr19533717wmn.157.1670422370601; 
 Wed, 07 Dec 2022 06:12:50 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 z8-20020adfdf88000000b002258235bda3sm19583887wrl.61.2022.12.07.06.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 06:12:50 -0800 (PST)
Message-ID: <d49373f0-ba87-f976-726b-64ff15a5e371@redhat.com>
Date: Wed, 7 Dec 2022 15:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/18] block: Introduce a block graph rwlock
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
References: <20221207131838.239125-1-kwolf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 07/12/2022 um 14:18 schrieb Kevin Wolf:
> This series supersedes the first half of Emanuele's "Protect the block
> layer with a rwlock: part 1". It introduces the basic infrastructure for
> protecting the block graph (specifically parent/child links) with a
> rwlock. Actually taking the reader lock in all necessary places is left
> for future series.
> 
> Compared to Emanuele's series, this one adds patches to make use of
> clang's Thread Safety Analysis (TSA) feature in order to statically
> check at compile time that the places where we assert that we hold the
> lock actually do hold it. Once we cover all relevant places, the check
> can be extended to verify that all accesses of bs->children and
> bs->parents hold the lock.
> 
> For reference, here is the more detailed version of our plan in
> Emanuele's words from his series:
> 
>     The aim is to replace the current AioContext lock with much
>     fine-grained locks, aimed to protect only specific data. Currently
>     the AioContext lock is used pretty much everywhere, and it's not
>     even clear what it is protecting exactly.
> 
>     The aim of the rwlock is to cover graph modifications: more
>     precisely, when a BlockDriverState parent or child list is modified
>     or read, since it can be concurrently accessed by the main loop and
>     iothreads.
> 
>     The main assumption is that the main loop is the only one allowed to
>     perform graph modifications, and so far this has always been held by
>     the current code.
> 
>     The rwlock is inspired from cpus-common.c implementation, and aims
>     to reduce cacheline bouncing by having per-aiocontext counter of
>     readers.  All details and implementation of the lock are in patch 2.
> 
>     We distinguish between writer (main loop, under BQL) that modifies
>     the graph, and readers (all other coroutines running in various
>     AioContext), that go through the graph edges, reading ->parents
>     and->children.  The writer (main loop)  has an "exclusive" access,
>     so it first waits for current read to finish, and then prevents
>     incoming ones from entering while it has the exclusive access.  The
>     readers (coroutines in multiple AioContext) are free to access the
>     graph as long the writer is not modifying the graph.  In case it is,
>     they go in a CoQueue and sleep until the writer is done.
> 
> In this and following series, we try to follow the following locking
> pattern:
> 
> - bdrv_co_* functions that call BlockDriver callbacks always expect
>   the lock to be taken, therefore they assert.
> 
> - blk_co_* functions are called from external code outside the block
>   layer, which should not have to care about the block layer's
>   internal locking. Usually they also call blk_wait_while_drained().
>   Therefore they take the lock internally.
> 
> The long term goal of this series is to eventually replace the
> AioContext lock, so that we can get rid of it once and for all.
> 
> Emanuele Giuseppe Esposito (7):
>   graph-lock: Implement guard macros
>   async: Register/unregister aiocontext in graph lock list
>   block: wrlock in bdrv_replace_child_noperm
>   block: remove unnecessary assert_bdrv_graph_writable()
>   block: assert that graph read and writes are performed correctly
>   block-coroutine-wrapper.py: introduce annotations that take the graph
>     rdlock
>   block: use co_wrapper_mixed_bdrv_rdlock in functions taking the rdlock
> 
> Kevin Wolf (10):
>   block: Factor out bdrv_drain_all_begin_nopoll()
>   Import clang-tsa.h
>   clang-tsa: Add TSA_ASSERT() macro
>   clang-tsa: Add macros for shared locks
>   configure: Enable -Wthread-safety if present
>   test-bdrv-drain: Fix incorrrect drain assumptions
>   block: Fix locking in external_snapshot_prepare()
>   graph-lock: TSA annotations for lock/unlock functions
>   Mark assert_bdrv_graph_readable/writable() GRAPH_RD/WRLOCK
>   block: GRAPH_RDLOCK for functions only called by co_wrappers
> 
> Paolo Bonzini (1):
>   graph-lock: Introduce a lock to protect block graph operations
> 
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

^ I am curious to see if I am allowed to have my r-b also on my patches :)

>  configure                              |   1 +
>  block/coroutines.h                     |  19 +-
>  include/block/aio.h                    |   9 +
>  include/block/block-common.h           |   9 +-
>  include/block/block-global-state.h     |   1 +
>  include/block/block-io.h               |  53 +++--
>  include/block/block_int-common.h       |  24 +--
>  include/block/block_int-global-state.h |  17 --
>  include/block/block_int.h              |   1 +
>  include/block/graph-lock.h             | 280 +++++++++++++++++++++++++
>  include/qemu/clang-tsa.h               | 114 ++++++++++
>  block.c                                |  24 ++-
>  block/graph-lock.c                     | 275 ++++++++++++++++++++++++
>  block/io.c                             |  21 +-
>  blockdev.c                             |   4 +
>  stubs/graph-lock.c                     |  10 +
>  tests/unit/test-bdrv-drain.c           |  18 ++
>  util/async.c                           |   4 +
>  scripts/block-coroutine-wrapper.py     |  12 ++
>  block/meson.build                      |   1 +
>  stubs/meson.build                      |   1 +
>  21 files changed, 820 insertions(+), 78 deletions(-)
>  create mode 100644 include/block/graph-lock.h
>  create mode 100644 include/qemu/clang-tsa.h
>  create mode 100644 block/graph-lock.c
>  create mode 100644 stubs/graph-lock.c
> 


