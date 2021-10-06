Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508BC424272
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:19:23 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9da-0000zT-CJ
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mY9K7-0002ek-LI
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:59:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mY9K4-0002ek-1n
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633535951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X4qLtUjj7LUFXzjZxMXpwpXX99MFt5Lp9BBFMTTUH7U=;
 b=hORTdcMhsdRqG9uDC+cJgJ56EEHXp9bOeCPlhmmNhu91Hqqoq/JFhHogGswDGs9mpbKppC
 asXRBUR+ehI0f94jMnWZakdADKk8dZ3dnnQUqGzNCEn727puIWW52dBfce2eRryuZ1gBik
 RBPs1VcQ49oUY37HSDjxWdS/ixbjMHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-p-2oG3ibM6-UQi7gDpqZ0g-1; Wed, 06 Oct 2021 11:59:07 -0400
X-MC-Unique: p-2oG3ibM6-UQi7gDpqZ0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6830D180830F;
 Wed,  6 Oct 2021 15:59:06 +0000 (UTC)
Received: from redhat.com (ovpn-113-79.phx2.redhat.com [10.3.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4083660853;
 Wed,  6 Oct 2021 15:59:03 +0000 (UTC)
Date: Wed, 6 Oct 2021 10:59:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 04/12] block-backend: convert blk_co_pdiscard to int64_t
 bytes
Message-ID: <20211006155901.kcko2ycnd5vtt7un@redhat.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
 <20211006131718.214235-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211006131718.214235-5-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-815-1dd940
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Wed, Oct 06, 2021 at 03:17:10PM +0200, Vladimir Sementsov-Ogievskiy wrote:
> We updated blk_do_pdiscard() and its wrapper blk_co_pdiscard(). Both
> functions are updated so that parameter type becomes wider, so all
> callers should be OK with it.
> 
> Look at blk_do_pdiscard(): bytes passed only to
> blk_check_byte_request() and bdrv_co_pdiscard(), which already has
> int64_t bytes parameter, so we are OK.
> 
> Note that requests exceeding INT_MAX are still restricted by
> blk_check_byte_request().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/sysemu/block-backend.h | 3 ++-
>  block/block-backend.c          | 5 +++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
> index 844bb039c5..398e7abb02 100644
> --- a/include/sysemu/block-backend.h
> +++ b/include/sysemu/block-backend.h
> @@ -181,7 +181,8 @@ void blk_aio_cancel_async(BlockAIOCB *acb);
>  int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
>  BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
>                            BlockCompletionFunc *cb, void *opaque);
> -int blk_co_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
> +int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
> +                                 int64_t bytes);

Commit message didn't mention the addition of this label, but it looks
correct.

>  int blk_co_flush(BlockBackend *blk);

I guess fixing blk_co_flush to have the coroutine_fn label would be a
separate patch.  Or, you could rearrange the patches to add the label
on multiple functions independently from type changes.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


