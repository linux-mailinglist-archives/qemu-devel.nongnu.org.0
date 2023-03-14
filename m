Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60506B930C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 13:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc3Xh-0003WF-FX; Tue, 14 Mar 2023 08:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>)
 id 1pc3Xd-0003VK-4B; Tue, 14 Mar 2023 08:14:09 -0400
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>)
 id 1pc3Xa-0001Gn-TK; Tue, 14 Mar 2023 08:14:08 -0400
Received: (Authenticated sender: eric@blake.one)
 by mail.gandi.net (Postfix) with ESMTPSA id 8841B40004;
 Tue, 14 Mar 2023 12:13:58 +0000 (UTC)
Date: Tue, 14 Mar 2023 07:13:55 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, vsementsov@yandex-team.ru,
 hreitz@redhat.com, kwolf@redhat.com
Subject: Re: [PATCH nbd 2/4] nbd: Split out block device state from
 underlying NBD connections
Message-ID: <20230314121355.ofpnagticzq6hlnx@blake.one>
References: <20230309113946.1528247-1-rjones@redhat.com>
 <20230309113946.1528247-3-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309113946.1528247-3-rjones@redhat.com>
User-Agent: NeoMutt/20220429
Received-SPF: permerror client-ip=2001:4b98:dc4:8::222;
 envelope-from=eblake@redhat.com; helo=relay2-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Mar 09, 2023 at 11:39:44AM +0000, Richard W.M. Jones wrote:
> To implement multi-conn, we will put multiple underlying NBD
> connections (ie. NBDClientConnection) inside the NBD block device
> handle (BDRVNBDState).  This requires first breaking the one-to-one
> relationship between NBDClientConnection and BDRVNBDState.
> 
> To do this a new structure (NBDConnState) is implemented.
> NBDConnState takes all the per-connection state out of the block
> driver struct.  BDRVNBDState now contains a conns[] array of pointers
> to NBDConnState, one for each underlying multi-conn connection.
> 
> After this change there is still a one-to-one relationship because we
> only ever use the zeroth slot in the conns[] array.  Thus this does
> not implement multi-conn yet.
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  block/coroutines.h |   5 +-
>  block/nbd.c        | 674 ++++++++++++++++++++++++---------------------
>  2 files changed, 358 insertions(+), 321 deletions(-)
> 
> diff --git a/block/coroutines.h b/block/coroutines.h
> index dd9f3d449b..14b01d8591 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -62,7 +62,7 @@ int coroutine_fn GRAPH_RDLOCK
>  bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>  
>  int coroutine_fn
> -nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
> +nbd_co_do_establish_connection(BlockDriverState *bs, void *cs, bool blocking,
>                                 Error **errp);

I guess the void* here is because you couldn't find a way to expose
the new type through the coroutine wrapper generator?

>  
>  
> @@ -86,6 +86,7 @@ bdrv_common_block_status_above(BlockDriverState *bs,
>                                 BlockDriverState **file,
>                                 int *depth);
>  int co_wrapper_mixed
> -nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
> +nbd_do_establish_connection(BlockDriverState *bs, void *cs, bool blocking,
> +                            Error **errp);
>

same here

>  #endif /* BLOCK_COROUTINES_H */
> diff --git a/block/nbd.c b/block/nbd.c
> index 5ffae0b798..84e8a1add0 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -51,8 +51,8 @@
>  #define MAX_NBD_REQUESTS    16
>  #define MAX_MULTI_CONN      16
>  
> -#define HANDLE_TO_INDEX(bs, handle) ((handle) ^ (uint64_t)(intptr_t)(bs))
> -#define INDEX_TO_HANDLE(bs, index)  ((index)  ^ (uint64_t)(intptr_t)(bs))
> +#define HANDLE_TO_INDEX(cs, handle) ((handle) ^ (uint64_t)(intptr_t)(cs))
> +#define INDEX_TO_HANDLE(cs, index)  ((index)  ^ (uint64_t)(intptr_t)(cs))

Independently of your patches, these macros are odd.  I think we could
just as easily define

#define HANDLE_TO_INDEX(XX, handle) ((handle) - 1)
#define INDEX_TO_HANDLE(XX, index) ((index) + 1)

and then refactor to drop the unused parameter, since we never really
depend on it (I audited the code when you first asked me about it on
IRC, and we do a bounds check that whatever the server returns lies
within our expected index of 0-15 before dereferencing any memory with
it, so we are NOT relying on the server passing us a pointer that we
depend on).

Overall, your patch is mostly mechanical and looks nice to me.

>  
>  /*
>   * Update @bs with information learned during a completed negotiation process.
>   * Return failure if the server's advertised options are incompatible with the
>   * client's needs.
> + *
> + * Note that we are only called for the first connection (s->conns[0])
> + * because multi-conn assumes that all other connections are alike.
> + * We don't check that assumption but probably should (XXX).
>   */
> -static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
> +static int nbd_handle_updated_info(BlockDriverState *bs,
> +                                   NBDConnState *cs, Error **errp)

But as you pointed out in your cover letter, we'll probably want to
address the XXX comments like this one prior to actually committing
the series.  We really should be making sure that the secondary
clients see the same server parameters as the first one, regardless of
whether they are open in parallel (once multi-conn is enabled) or in
series after a reopen (which is what we currently try to support).

> @@ -318,129 +332,132 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
>  }
>  
>  int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
> +                                                void *csvp,
>                                                  bool blocking, Error **errp)
>  {
>      BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
> +    NBDConnState *cs = csvp;

Is there a way to get the new type passed through the coroutine
generator without the use of void*?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

