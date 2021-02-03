Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E468630E503
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:35:43 +0100 (CET)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PoM-00041V-F2
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7Pmg-0003PL-6v
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:33:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7Pmd-0007ZV-4G
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612388032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y6JhyDcRTrcMeHILFbUDFzatac77S4PVESNexOfahXA=;
 b=cVUlbn8RraDwGhvVUYG1VKad95OFZsih3ZCZrEM++TzJAZmSVI6fblNc2x+bPQv9Chl4IA
 cZ5uK6/w96TuUSYdqSrYL5jqP5EVLG+nHtQ9/I8m2VBp2HvUFYyimMTvQxnheFXvfY25yR
 ahtkT27lxfHI/bajXNFj7m+2jgvj6b8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-l2azhLdWPMCT5NhJ2NUfGg-1; Wed, 03 Feb 2021 16:33:50 -0500
X-MC-Unique: l2azhLdWPMCT5NhJ2NUfGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E517801961;
 Wed,  3 Feb 2021 21:33:49 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-32.ams2.redhat.com [10.36.115.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F192B4D;
 Wed,  3 Feb 2021 21:33:47 +0000 (UTC)
Date: Wed, 3 Feb 2021 22:33:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 23/36] block: adapt bdrv_append() for inserting filters
Message-ID: <20210203213346.GJ5507@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-24-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-24-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> bdrv_append is not very good for inserting filters: it does extra
> permission update as part of bdrv_set_backing_hd(). During this update
> filter may conflict with other parents of top_bs.
> 
> Instead, let's first do all graph modifications and after it update
> permissions.

This sounds like it fixes a bug. If so, should we have a test like for
the other cases fixed by this series?

> Note: bdrv_append() is still only works for backing-child based
> filters. It's something to improve later.
> 
> It simplifies the fact that bdrv_append() used to append new nodes,
> without backing child. Let's add an assertion.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 02da1a90bc..7094922509 100644
> --- a/block.c
> +++ b/block.c
> @@ -4998,22 +4998,28 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>  int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>                  Error **errp)
>  {
> -    Error *local_err = NULL;
> +    int ret;
> +    GSList *tran = NULL;
>  
> -    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return -EPERM;
> +    assert(!bs_new->backing);
> +
> +    ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
> +                                   &child_of_bds, bdrv_backing_role(bs_new),
> +                                   &bs_new->backing, &tran, errp);
> +    if (ret < 0) {
> +        goto out;
>      }

I don't think changing bs->backing without bdrv_set_backing_hd() is
correct at the moment. We lose a few things:

1. The bdrv_is_backing_chain_frozen() check
2. Updating backing_hd->inherits_from if necessary
3. bdrv_refresh_limits()

If I'm not missing anything, all of these are needed in the context of
bdrv_append().

> -    bdrv_replace_node(bs_top, bs_new, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        bdrv_set_backing_hd(bs_new, NULL, &error_abort);
> -        return -EPERM;
> +    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, &tran, errp);
> +    if (ret < 0) {
> +        goto out;
>      }
>  
> -    return 0;
> +    ret = bdrv_refresh_perms(bs_new, errp);
> +out:
> +    tran_finalize(tran, ret);
> +
> +    return ret;
>  }

Kevin


