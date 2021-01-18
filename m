Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A402FA4F4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:42:18 +0100 (CET)
Received: from localhost ([::1]:52888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WfZ-0006NZ-1j
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1Wdv-0005pK-6a
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1Wdq-0004mD-PX
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610984428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AhgYzUpwMNgQ02/bpbyCiWPXN35G78wveHycbIr0fak=;
 b=be792ephMvh4hbyPZx4LEiNOwpOF+dwHrg5+AopZxKTSPh8Ev9+QTZ8kmgM60bsJBRcM3Q
 nE5DGw6F86Jwl8EbIrydwSSB+6pf9q5zPuJTGw/cGGlpWKaRC1S3FAB3/tHFfgw20uD8dq
 ugnGGxa0O8NJyaDXDJM9jpHtC0z5J3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-KeBzTyX2O--uG-vhHGatzw-1; Mon, 18 Jan 2021 10:40:27 -0500
X-MC-Unique: KeBzTyX2O--uG-vhHGatzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4004107ACE4;
 Mon, 18 Jan 2021 15:40:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66F631820E;
 Mon, 18 Jan 2021 15:40:23 +0000 (UTC)
Date: Mon, 18 Jan 2021 16:40:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 09/36] block: return value from bdrv_replace_node()
Message-ID: <20210118154022.GI11555@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-10-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Functions with errp argument are not recommened to be void-functions.
> Improve bdrv_replace_node().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block.h |  4 ++--
>  block.c               | 14 ++++++++------
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index 5d59984ad4..8f6100dad7 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -346,8 +346,8 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
>  BlockDriverState *bdrv_new(void);
>  int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>                  Error **errp);
> -void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
> -                       Error **errp);
> +int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
> +                      Error **errp);
>  
>  int bdrv_parse_aio(const char *mode, int *flags);
>  int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
> diff --git a/block.c b/block.c
> index 3765c7caed..29082c6d47 100644
> --- a/block.c
> +++ b/block.c
> @@ -4537,14 +4537,14 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
>   * With auto_skip=false the error is returned if from has a parent which should
>   * not be updated.
>   */
> -static void bdrv_replace_node_common(BlockDriverState *from,
> -                                     BlockDriverState *to,
> -                                     bool auto_skip, Error **errp)
> +static int bdrv_replace_node_common(BlockDriverState *from,
> +                                    BlockDriverState *to,
> +                                    bool auto_skip, Error **errp)
>  {
> +    int ret = -EPERM;
>      BdrvChild *c, *next;
>      GSList *list = NULL, *p;
>      uint64_t perm = 0, shared = BLK_PERM_ALL;
> -    int ret;

I think I'd prefer setting ret in each error path. This makes it more
obvious that ret has the right value and hasn't been modified between
the initialisation and the error.

>  
>      /* Make sure that @from doesn't go away until we have successfully attached
>       * all of its parents to @to. */
> @@ -4600,10 +4600,12 @@ out:

Let's add an explicit ret = 0 right before the out: label.

>      g_slist_free(list);
>      bdrv_drained_end(from);
>      bdrv_unref(from);
> +
> +    return ret;
>  }

With these changes:

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


