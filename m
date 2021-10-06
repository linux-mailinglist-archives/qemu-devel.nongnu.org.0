Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD64247F7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 22:32:25 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYDaR-0005yq-7V
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 16:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYDXo-00051m-Dk
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:29:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYDXl-0007Yz-24
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633552174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/BlSKziZdACeqJp6hdKza4x6Kt8zq3H8NA9N8XMM6b4=;
 b=ZLBPig1k8eQhBo7ca41i5qfF3fyKHLu3yisMhIhExXePnqM7Bv0s+aZ6HoxATJfn5sNTZB
 2ShZRm3j0z1BQyPSnX5asvsb/6e0ncid4hnhQE5q8EgKuiEVZMKnAWLejIfwV4NR5VXSyW
 2cTzY9ISeld3mO5xpQP3AkogK7SUBKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-bhgD0nm5MNe1ARUUYwelGQ-1; Wed, 06 Oct 2021 16:29:31 -0400
X-MC-Unique: bhgD0nm5MNe1ARUUYwelGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9469456FAA;
 Wed,  6 Oct 2021 20:29:30 +0000 (UTC)
Received: from redhat.com (ovpn-113-79.phx2.redhat.com [10.3.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E42B5D9C6;
 Wed,  6 Oct 2021 20:29:27 +0000 (UTC)
Date: Wed, 6 Oct 2021 15:29:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 10/12] block-backend: convert blk_aio_ functions to
 int64_t bytes paramter
Message-ID: <20211006202925.x56o344sxsgbkrvh@redhat.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
 <20211006131718.214235-11-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211006131718.214235-11-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-815-1dd940
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 03:17:16PM +0200, Vladimir Sementsov-Ogievskiy wrote:
> 1. Convert bytes in BlkAioEmAIOCB:
>   aio->bytes is only passed to already int64_t interfaces, and set in
>   blk_aio_prwv, which is updated here.
> 
> 2. For all updated functions parameter type becomes wider so callers
>    are safe.
> 
> 3. In blk_aio_prwv we only store bytes to BlkAioEmAIOCB, which is
>    updated here.
> 
> 4. Other updated functions are wrappers on blk_aio_prwv.
> 
> Note that blk_aio_preadv and blk_aio_pwritev become safer: before this
> commit, it's theoretically possible to pass qiov with size exceeding
> INT_MAX, which than converted to int argument of blk_aio_prwv. Now it's
> converted to int64_t which is a lot better. Still add assertions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/sysemu/block-backend.h |  4 ++--
>  block/block-backend.c          | 13 ++++++++-----
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> @@ -1530,6 +1531,7 @@ BlockAIOCB *blk_aio_preadv(BlockBackend *blk, int64_t offset,
>                             QEMUIOVector *qiov, BdrvRequestFlags flags,
>                             BlockCompletionFunc *cb, void *opaque)
>  {
> +    assert(qiov->size <= INT64_MAX);

I hope this doesn't cause 32-bit compilers to warn about an
always-true expression; but if it does, we'll figure something out.
That's not enough for me to ask for you to respin this, though, so:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


