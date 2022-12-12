Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2B64A5AB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:15:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4mOS-00019u-32; Mon, 12 Dec 2022 12:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p4mON-00019O-7S
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p4mOL-0007vK-JC
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670865300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BUyxSpq+a0uBxeUCvwBnWk0mtgG32y10Fb/UD0Sq/v0=;
 b=d7SU+6gPrOjKDtGlXZS89JjnHa6Gbnu2/UwM3acoZRbDDO4KXmjAWmfMuchs/jY9iGoV/T
 9taOO8Mhht7JSRhSziju87ti63agr7hbum5TxD/f/uhcXwGs+dIGYLEyokSI9MX8DRV/yA
 wB1Ckx98wDUTgJZFLlfNlCHrkrgQhTw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-lW-xJGSLO5aoemISkOknow-1; Mon, 12 Dec 2022 12:14:57 -0500
X-MC-Unique: lW-xJGSLO5aoemISkOknow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E52DB803D4B;
 Mon, 12 Dec 2022 17:14:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C553340C2004;
 Mon, 12 Dec 2022 17:14:55 +0000 (UTC)
Date: Mon, 12 Dec 2022 18:14:52 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com,
 vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: Re: [PATCH 00/18] block: Introduce a block graph rwlock
Message-ID: <Y5dhjKx4EdeOxJmQ@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
 <d49373f0-ba87-f976-726b-64ff15a5e371@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d49373f0-ba87-f976-726b-64ff15a5e371@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 07.12.2022 um 15:12 hat Emanuele Giuseppe Esposito geschrieben:
> Am 07/12/2022 um 14:18 schrieb Kevin Wolf:
> > This series supersedes the first half of Emanuele's "Protect the block
> > layer with a rwlock: part 1". It introduces the basic infrastructure for
> > protecting the block graph (specifically parent/child links) with a
> > rwlock. Actually taking the reader lock in all necessary places is left
> > for future series.
> > 
> > Compared to Emanuele's series, this one adds patches to make use of
> > clang's Thread Safety Analysis (TSA) feature in order to statically
> > check at compile time that the places where we assert that we hold the
> > lock actually do hold it. Once we cover all relevant places, the check
> > can be extended to verify that all accesses of bs->children and
> > bs->parents hold the lock.
> > 
> > For reference, here is the more detailed version of our plan in
> > Emanuele's words from his series:
> > 
> >     The aim is to replace the current AioContext lock with much
> >     fine-grained locks, aimed to protect only specific data. Currently
> >     the AioContext lock is used pretty much everywhere, and it's not
> >     even clear what it is protecting exactly.
> > 
> >     The aim of the rwlock is to cover graph modifications: more
> >     precisely, when a BlockDriverState parent or child list is modified
> >     or read, since it can be concurrently accessed by the main loop and
> >     iothreads.
> > 
> >     The main assumption is that the main loop is the only one allowed to
> >     perform graph modifications, and so far this has always been held by
> >     the current code.
> > 
> >     The rwlock is inspired from cpus-common.c implementation, and aims
> >     to reduce cacheline bouncing by having per-aiocontext counter of
> >     readers.  All details and implementation of the lock are in patch 2.
> > 
> >     We distinguish between writer (main loop, under BQL) that modifies
> >     the graph, and readers (all other coroutines running in various
> >     AioContext), that go through the graph edges, reading ->parents
> >     and->children.  The writer (main loop)  has an "exclusive" access,
> >     so it first waits for current read to finish, and then prevents
> >     incoming ones from entering while it has the exclusive access.  The
> >     readers (coroutines in multiple AioContext) are free to access the
> >     graph as long the writer is not modifying the graph.  In case it is,
> >     they go in a CoQueue and sleep until the writer is done.
> > 
> > In this and following series, we try to follow the following locking
> > pattern:
> > 
> > - bdrv_co_* functions that call BlockDriver callbacks always expect
> >   the lock to be taken, therefore they assert.
> > 
> > - blk_co_* functions are called from external code outside the block
> >   layer, which should not have to care about the block layer's
> >   internal locking. Usually they also call blk_wait_while_drained().
> >   Therefore they take the lock internally.
> > 
> > The long term goal of this series is to eventually replace the
> > AioContext lock, so that we can get rid of it once and for all.
> > 
> > Emanuele Giuseppe Esposito (7):
> >   graph-lock: Implement guard macros
> >   async: Register/unregister aiocontext in graph lock list
> >   block: wrlock in bdrv_replace_child_noperm
> >   block: remove unnecessary assert_bdrv_graph_writable()
> >   block: assert that graph read and writes are performed correctly
> >   block-coroutine-wrapper.py: introduce annotations that take the graph
> >     rdlock
> >   block: use co_wrapper_mixed_bdrv_rdlock in functions taking the rdlock
> > 
> > Kevin Wolf (10):
> >   block: Factor out bdrv_drain_all_begin_nopoll()
> >   Import clang-tsa.h
> >   clang-tsa: Add TSA_ASSERT() macro
> >   clang-tsa: Add macros for shared locks
> >   configure: Enable -Wthread-safety if present
> >   test-bdrv-drain: Fix incorrrect drain assumptions
> >   block: Fix locking in external_snapshot_prepare()
> >   graph-lock: TSA annotations for lock/unlock functions
> >   Mark assert_bdrv_graph_readable/writable() GRAPH_RD/WRLOCK
> >   block: GRAPH_RDLOCK for functions only called by co_wrappers
> > 
> > Paolo Bonzini (1):
> >   graph-lock: Introduce a lock to protect block graph operations
> > 
> Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Thanks, applied to block-next.

Kevin


