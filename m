Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF63169C4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:09:01 +0100 (CET)
Received: from localhost ([::1]:58526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9r6y-0003Aq-Lk
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9r5N-0002Xf-Fs
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:07:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9r5L-0007vo-0v
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612969637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Ei891898dYcd9JvSiemTlQjzHvjWU38+Qyht2P4y1g=;
 b=ItiACjhKnT3ek/Q1cYibnGMW3lHXETHkLUfPuCJapaAjA+07i8FxZRUH8q4hg/znJe/mxS
 /YJFOf6IE9Nj//oIAu7YYS4rI/K0NmRWFIpDXt5kHRCtxUvgFwACFRu7Id9uccCRzeTfXF
 7Ypn+/tsedOQ2u1Xu1oxM2FoaLYyAAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-BJezA6QKPq6NS4toYMVNVg-1; Wed, 10 Feb 2021 10:07:13 -0500
X-MC-Unique: BJezA6QKPq6NS4toYMVNVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2AC26D4EE;
 Wed, 10 Feb 2021 15:07:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 668195D9D0;
 Wed, 10 Feb 2021 15:07:10 +0000 (UTC)
Date: Wed, 10 Feb 2021 16:07:08 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 36/36] block: refactor bdrv_node_check_perm()
Message-ID: <20210210150708.GG5144@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-37-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-37-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Now, bdrv_node_check_perm() is called only with fresh cumulative
> permissions, so its actually "refresh_perm".
> 
> Move permission calculation to the function. Also, drop unreachable
> error message.
> 
> Add also Virtuozzo copyright, as big work is done at this point.

I guess we could add many copyright lines then... Maybe we should, I
don't know.

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c | 38 +++++++++-----------------------------
>  1 file changed, 9 insertions(+), 29 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 20b1cf59f7..576b145cbf 100644
> --- a/block.c
> +++ b/block.c
> @@ -2,6 +2,7 @@
>   * QEMU System Emulator block driver
>   *
>   * Copyright (c) 2003 Fabrice Bellard
> + * Copyright (c) 2020 Virtuozzo International GmbH.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
>   * of this software and associated documentation files (the "Software"), to deal
> @@ -2204,23 +2205,15 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
>      /* old_bs reference is transparently moved from @child to @s */
>  }
>  
> -/*
> - * Check whether permissions on this node can be changed in a way that
> - * @cumulative_perms and @cumulative_shared_perms are the new cumulative
> - * permissions of all its parents. This involves checking whether all necessary
> - * permission changes to child nodes can be performed.
> - *
> - * A call to this function must always be followed by a call to bdrv_set_perm()
> - * or bdrv_abort_perm_update().
> - */

Would you mind updating the comment rather than removing it?

> -static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
> -                                uint64_t cumulative_perms,
> -                                uint64_t cumulative_shared_perms,
> -                                GSList **tran, Error **errp)
> +static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
> +                                  GSList **tran, Error **errp)
>  {
>      BlockDriver *drv = bs->drv;
>      BdrvChild *c;
>      int ret;
> +    uint64_t cumulative_perms, cumulative_shared_perms;
> +
> +    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
>  
>      /* Write permissions never work with read-only images */
>      if ((cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) &&
> @@ -2229,15 +2222,8 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
>          if (!bdrv_is_writable_after_reopen(bs, NULL)) {
>              error_setg(errp, "Block node is read-only");
>          } else {
> -            uint64_t current_perms, current_shared;
> -            bdrv_get_cumulative_perm(bs, &current_perms, &current_shared);
> -            if (current_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
> -                error_setg(errp, "Cannot make block node read-only, there is "
> -                           "a writer on it");
> -            } else {
> -                error_setg(errp, "Cannot make block node read-only and create "
> -                           "a writer on it");
> -            }
> +            error_setg(errp, "Cannot make block node read-only, there is "
> +                       "a writer on it");

Hm, so if you want to add a new writer to an existing read-only node,
this is the error message that you would get?

Now that we can't distinguish both cases any more, should we try to
rephrase it so that it makes sense for both directions? Like "Read-only
block node <node-name> cannot support read-write users"?


Sorry for it taking so long, but I've now finally looked at all patches
in this series. Please feel free to send v3 when you're ready.

Kevin


