Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8B2F3772
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:45:20 +0100 (CET)
Received: from localhost ([::1]:40012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNjL-0005PJ-9g
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kzNS2-0001x0-P1; Tue, 12 Jan 2021 12:27:27 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:42985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kzNRu-0000we-MH; Tue, 12 Jan 2021 12:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=1xcm1uCeETDYYhvfEpYMV5igN2wWoe8JgjOHr5CLrZw=; 
 b=CqvnmRN2+zR0kDecUTW/moY/LC/x24Md7aV0d+b2meUMny1Ks4Rc2Txv+Du3EXA1RE6DLoIOTm32sfWEHXcJLYmJm1eeIA1QWYHPbDvjvLbiROwCfiYwezrWsYwU+eenetWUQFf0H/QOyZKOx4egKtwmRtVTr+CiaOPc7D6tQC3KQa6zuTJ61FWM1bWBuCN2af85XoUjTC+ybjBYNm1Pp5bnKMZncnlNobv+1mcVxYDS/LIL3JR6LXNfxX5znbgCxehRQA2DRd+HmlxDcPbppTzH5YytRzLnUorGbuWifCXBfv4I6gN93pD8Odi54UXqoX3xPCUBhhbiBkKy7Hz/sw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kzNRp-0005Zy-MK; Tue, 12 Jan 2021 18:27:13 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kzNRp-0002B7-D8; Tue, 12 Jan 2021 18:27:13 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v5 01/14] block: return status from bdrv_append and friends
In-Reply-To: <20210109125811.209870-2-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
 <20210109125811.209870-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 12 Jan 2021 18:27:13 +0100
Message-ID: <w51y2gyukum.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, pavel.dovgaluk@ispras.ru,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat 09 Jan 2021 01:57:58 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> -void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
> +int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>                           Error **errp)

The indentation of the second line should be adjusted, shouldn't it?

>  {
> +    int ret;
>      bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
>          bdrv_inherits_from_recursive(backing_hd, bs);
>  
>      if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
> -        return;
> +        return -EPERM;
>      }
>  
>      if (backing_hd) {
> @@ -2853,15 +2854,24 @@ void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>
>      bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
>                                      bdrv_backing_role(bs), errp);
> +    if (!bs->backing) {
> +        ret = -EPERM;
> +        goto out;
> +    }

This is not visible in the patch, but before the bdrv_attach_child()
call there's this:

    if (!backing_hd) {
        goto out;
    }

But in this case 'ret' is still uninitialized.

>  out:
>      bdrv_refresh_limits(bs, NULL);
> +
> +    return ret;
>  }



> -static void bdrv_replace_node_common(BlockDriverState *from,
> -                                     BlockDriverState *to,
> -                                     bool auto_skip, Error **errp)
> +static int bdrv_replace_node_common(BlockDriverState *from,
> +                                    BlockDriverState *to,
> +                                    bool auto_skip, Error **errp)
>  {
>      BdrvChild *c, *next;
>      GSList *list = NULL, *p;
> @@ -4562,6 +4572,7 @@ static void bdrv_replace_node_common(BlockDriverState *from,
>              goto out;
>          }
>          if (c->frozen) {
> +            ret = -EPERM;
>              error_setg(errp, "Cannot change '%s' link to '%s'",
>                         c->name, from->node_name);
>              goto out;

Same here, you set 'ret' in the second 'goto out' but not in the first.

Berto

