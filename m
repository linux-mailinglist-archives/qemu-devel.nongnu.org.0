Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F05F7583
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 10:50:35 +0200 (CEST)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogj3x-0003iE-O5
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 04:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogiya-0001X9-Oa
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogiyW-0002KD-DG
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 04:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665132295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3C+TWxsDykr6xKeCsJ0r5KCsvN/Wt7QCA5BLiHuuxc=;
 b=XcgH56pamTUqCQEe5jvP59/p0TXMvGg9NR9UH/rbEvTjGmQxvuCH5Nq9pDB4ijTTm/00gK
 tQqqqNuiVUaBkk/kXa0OSX2+6Nt3k2kFZ2nZ2mQFcAbtddtXVD4yQhK7HKgO8K1kobNKC0
 cy3Af4opOl4d418IAU7rdValo5mh2hA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-AjSScE8gM56BAnwR-voyCA-1; Fri, 07 Oct 2022 04:44:54 -0400
X-MC-Unique: AjSScE8gM56BAnwR-voyCA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D033285A583;
 Fri,  7 Oct 2022 08:44:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEABC53593D;
 Fri,  7 Oct 2022 08:44:52 +0000 (UTC)
Date: Fri, 7 Oct 2022 10:44:51 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, eesposit@redhat.com
Subject: Re: [PATCH 1/3] block: bdrv_child_get_parent_aio_context is not GS
Message-ID: <Yz/nA30Ke0PJovrb@redhat.com>
References: <20220923125227.300202-1-hreitz@redhat.com>
 <20220923125227.300202-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923125227.300202-2-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Am 23.09.2022 um 14:52 hat Hanna Reitz geschrieben:
> All implementations of bdrv_child_get_parent_aio_context() are IO_CODE
> (or do not mark anything in the case of block jobs), so this too can be
> IO_CODE.  By the definition of "I/O API functions" in block-io.h, this
> is a strict relaxation, as I/O code can be run from both GS and I/O code
> arbitrarily.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

There are three implementations of .get_parent_aio_context in the tree:

1. child_of_bds_get_parent_aio_context() in block.c
   This is already IO_CODE(), good.

2. child_job_get_parent_aio_context() in blockjob.c
   This is explicitly marked GLOBAL_STATE_CODE() after Emanuele's series
   to avoid the AioContext lock in jobs. I suppose it could be made
   IO_CODE() if it also used JOB_LOCK_GUARD().

3. blk_root_get_parent_aio_context() in block-backend.c
   This doesn't have any annotation, but it only calls
   blk_get_aio_context(), which is IO_CODE. So this one is good, too.

Seems we just have a semantic merge conflict with Emanuele's series. Can
you rebase on top of my tree?

Kevin


