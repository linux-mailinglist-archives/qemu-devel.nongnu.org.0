Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2A366D7F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 16:02:56 +0200 (CEST)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZDRP-0000Zy-G4
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 10:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lZDPg-0008UK-N9; Wed, 21 Apr 2021 10:01:08 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:46034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lZDPb-0005nT-UQ; Wed, 21 Apr 2021 10:01:07 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7C8362E1567;
 Wed, 21 Apr 2021 17:00:55 +0300 (MSK)
Received: from myt6-76f0a6db1a7e.qloud-c.yandex.net
 (myt6-76f0a6db1a7e.qloud-c.yandex.net [2a02:6b8:c12:422d:0:640:76f0:a6db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 kbKjsru6hp-0r00rkGL; Wed, 21 Apr 2021 17:00:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619013655; bh=b2MOXubJdz3oWgOppcbDbrIeoYF+Y6v96nIURKYJ3iU=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=yZqq0Q41jWWA35zNrLoduGGzKs5XghrC8nyMw+8OU66ZHkuKCZHByY068UXHKvqY4
 PGd7fhbkva+zSuAowfaZkJl9WtkX4pP8SSeSXKdVmyf5TbGKpDQx5YA/z/XxAJCgK3
 LxjE0H3Nwx/e8USsv6YmBXZEW/sagxQxlgqN/smE=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by myt6-76f0a6db1a7e.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 85bW5lFM9k-0rouX1H3; Wed, 21 Apr 2021 17:00:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 21 Apr 2021 17:00:49 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 02/33] block/nbd: fix how state is cleared on
 nbd_open() failure paths
Message-ID: <YIAwEYbLpqzzFzd4@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416080911.83197-3-vsementsov@virtuozzo.com>
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:08:40AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We have two "return error" paths in nbd_open() after
> nbd_process_options(). Actually we should call nbd_clear_bdrvstate()
> on these paths. Interesting that nbd_process_options() calls
> nbd_clear_bdrvstate() by itself.
> 
> Let's fix leaks and refactor things to be more obvious:
> 
> - intialize yank at top of nbd_open()
> - move yank cleanup to nbd_clear_bdrvstate()
> - refactor nbd_open() so that all failure paths except for
>   yank-register goes through nbd_clear_bdrvstate()
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 739ae2941f..a407a3814b 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -152,8 +152,12 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
>  static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
>  static void nbd_yank(void *opaque);
>  
> -static void nbd_clear_bdrvstate(BDRVNBDState *s)
> +static void nbd_clear_bdrvstate(BlockDriverState *bs)
>  {
> +    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> +
> +    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
> +
>      object_unref(OBJECT(s->tlscreds));
>      qapi_free_SocketAddress(s->saddr);
>      s->saddr = NULL;
> @@ -2279,9 +2283,6 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
>      ret = 0;
>  
>   error:
> -    if (ret < 0) {
> -        nbd_clear_bdrvstate(s);
> -    }
>      qemu_opts_del(opts);
>      return ret;
>  }
> @@ -2292,11 +2293,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>      int ret;
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>  
> -    ret = nbd_process_options(bs, options, errp);
> -    if (ret < 0) {
> -        return ret;
> -    }
> -
>      s->bs = bs;
>      qemu_co_mutex_init(&s->send_mutex);
>      qemu_co_queue_init(&s->free_sema);
> @@ -2305,20 +2301,23 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>          return -EEXIST;
>      }
>  
> +    ret = nbd_process_options(bs, options, errp);
> +    if (ret < 0) {
> +        goto fail;
> +    }
> +
>      /*
>       * establish TCP connection, return error if it fails
>       * TODO: Configurable retry-until-timeout behaviour.
>       */
>      if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
> -        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
> -        return -ECONNREFUSED;
> +        ret = -ECONNREFUSED;
> +        goto fail;
>      }
>  
>      ret = nbd_client_handshake(bs, errp);

Not that this was introduced by this patch, but once you're at it:
AFAICT nbd_client_handshake() calls yank_unregister_instance() on some
error path(s); I assume this needs to go too, otherwise it's called
twice (and asserts).

Roman.

>      if (ret < 0) {
> -        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
> -        nbd_clear_bdrvstate(s);
> -        return ret;
> +        goto fail;
>      }
>      /* successfully connected */
>      s->state = NBD_CLIENT_CONNECTED;
> @@ -2330,6 +2329,10 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
>      aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
>  
>      return 0;
> +
> +fail:
> +    nbd_clear_bdrvstate(bs);
> +    return ret;
>  }
>  
>  static int nbd_co_flush(BlockDriverState *bs)
> @@ -2373,11 +2376,8 @@ static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
>  
>  static void nbd_close(BlockDriverState *bs)
>  {
> -    BDRVNBDState *s = bs->opaque;
> -
>      nbd_client_close(bs);
> -    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
> -    nbd_clear_bdrvstate(s);
> +    nbd_clear_bdrvstate(bs);
>  }
>  
>  /*

