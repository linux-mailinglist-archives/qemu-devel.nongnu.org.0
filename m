Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B939330F238
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:33:04 +0100 (CET)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7csh-0006Nl-Ro
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7crI-0005q2-P1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:31:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l7crG-0008NF-W6
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612438294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gK9BBYpN29EDbUZDHl96AQjT+v18TaWCyYEB12HZyL8=;
 b=imDbw013QF+9FUrRxslBGR5DogdV5yIFPbuSTxiEcXSiGqxaIeKAOBSnBeScQ9S3TiCNrE
 j1YDAtc7bZ3h0jKoLSJrtvTRoDbmMc+7sWllXeQwmYKCH4f4LjYxvXC+Oneox9XKLcAGrD
 hfLODtounybgSaiqeN8pauCQqKBNrbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-EubUaFruO8upRk9wXORvig-1; Thu, 04 Feb 2021 06:31:32 -0500
X-MC-Unique: EubUaFruO8upRk9wXORvig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 148E0107ACF9;
 Thu,  4 Feb 2021 11:31:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99CE15D762;
 Thu,  4 Feb 2021 11:31:29 +0000 (UTC)
Date: Thu, 4 Feb 2021 12:31:28 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 25/36] block: introduce bdrv_drop_filter()
Message-ID: <20210204113128.GD6496@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-26-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-26-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> Using bdrv_replace_node() for removing filter is not good enough: it
> keeps child reference of the filter, which may conflict with original
> top node during permission update.
> 
> Instead let's create new interface, which will do all graph
> modifications first and then update permissions.
> 
> Let's modify bdrv_replace_node_common(), allowing it additionally drop
> backing chain child link pointing to new node. This is quite
> appropriate for bdrv_drop_intermediate() and makes possible to add
> new bdrv_drop_filter() as a simple wrapper.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block.h |  1 +
>  block.c               | 42 ++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index 8f6100dad7..0f21ef313f 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -348,6 +348,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>                  Error **errp);
>  int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>                        Error **errp);
> +int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
>  
>  int bdrv_parse_aio(const char *mode, int *flags);
>  int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
> diff --git a/block.c b/block.c
> index b1394b721c..e835a78f06 100644
> --- a/block.c
> +++ b/block.c
> @@ -4919,7 +4919,6 @@ static TransactionActionDrv bdrv_remove_backing_drv = {
>      .commit = bdrv_child_free,
>  };
>  
> -__attribute__((unused))
>  static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran)
>  {
>      if (!bs->backing) {
> @@ -4968,15 +4967,30 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
>   *
>   * With auto_skip=false the error is returned if from has a parent which should
>   * not be updated.
> + *
> + * With detach_subchain to must be in a backing chain of from. In this case

@to and @from make it easier to read.

> + * backing link of the cow-parent of @to is removed.
>   */
>  static int bdrv_replace_node_common(BlockDriverState *from,
>                                      BlockDriverState *to,
> -                                    bool auto_skip, Error **errp)
> +                                    bool auto_skip, bool detach_subchain,
> +                                    Error **errp)
>  {
>      int ret = -EPERM;
>      GSList *tran = NULL;
>      g_autoptr(GHashTable) found = NULL;
>      g_autoptr(GSList) refresh_list = NULL;
> +    BlockDriverState *to_cow_parent;
> +
> +    if (detach_subchain) {
> +        assert(bdrv_chain_contains(from, to));

The loop below also relies on from != to, so maybe assert that, too.

> +        for (to_cow_parent = from;
> +             bdrv_filter_or_cow_bs(to_cow_parent) != to;
> +             to_cow_parent = bdrv_filter_or_cow_bs(to_cow_parent))
> +        {
> +            ;
> +        }
> +    }
>  
>      /* Make sure that @from doesn't go away until we have successfully attached
>       * all of its parents to @to. */
> @@ -4997,6 +5011,10 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>          goto out;
>      }
>  
> +    if (detach_subchain) {
> +        bdrv_remove_backing(to_cow_parent, &tran);
> +    }

So bdrv_drop_filter() only works for filters that go through
bs->backing?

Wouldn't it have been more useful to make it bdrv_remove_filter_or_cow()
like you use already use in other places in this patch?

If not, the limitation needs to be documented for bdrv_drop_filter().

Kevin


