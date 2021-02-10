Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B5F316C3D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:13:49 +0100 (CET)
Received: from localhost ([::1]:56256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9t3k-0007em-8J
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9sjZ-0002ZY-3l
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:52:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9sjX-0002yJ-Bx
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612975974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RSmf9keZhU9TOP9fZuLID1i3OP+qdJdlVtlU3wVbHK8=;
 b=IdEOD8UC/R6GAwRJiEOFtNu+idn9JfNPstHp44aqJqs16ujqVtr5InOx1ow8Wnt1XpNakh
 P8tIlxuVGmn96dxrQpjtTZr+dTVygHikUcNYNKaZaZVjL1oBG1X/5gcmXcScOJMUsKNa8k
 IAiLqa6HGDtjuhkXfKc2PZG3ALxGMbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-9PIQgRnAPHS6S2geJbLl-w-1; Wed, 10 Feb 2021 11:52:52 -0500
X-MC-Unique: 9PIQgRnAPHS6S2geJbLl-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67A3E81425C;
 Wed, 10 Feb 2021 16:52:51 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4926360C0F;
 Wed, 10 Feb 2021 16:52:49 +0000 (UTC)
Date: Wed, 10 Feb 2021 17:52:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [RFC PATCH v2 1/4] block: Allow changing bs->file on reopen
Message-ID: <20210210165247.GH5144@merkur.fritz.box>
References: <cover.1612809837.git.berto@igalia.com>
 <670613fb7829ae2bf1329fca2e13bd51bd357024.1612809837.git.berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <670613fb7829ae2bf1329fca2e13bd51bd357024.1612809837.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.02.2021 um 19:44 hat Alberto Garcia geschrieben:
> When the x-blockdev-reopen was added it allowed reconfiguring the
> graph by replacing backing files, but changing the 'file' option was
> forbidden. Because of this restriction some operations are not
> possible, notably inserting and removing block filters.
> 
> This patch adds support for replacing the 'file' option. This is
> similar to replacing the backing file and the user is likewise
> responsible for the correctness of the resulting graph, otherwise this
> can lead to data corruption.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  include/block/block.h  |  1 +
>  block.c                | 65 ++++++++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/245 |  7 +++--
>  3 files changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index 82271d9ccd..6dd687a69e 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -196,6 +196,7 @@ typedef struct BDRVReopenState {
>      bool backing_missing;
>      bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
>      BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
> +    BlockDriverState *old_file_bs;    /* keep pointer for permissions update */
>      uint64_t perm, shared_perm;
>      QDict *options;
>      QDict *explicit_options;
> diff --git a/block.c b/block.c
> index 576b145cbf..19b62da4af 100644
> --- a/block.c
> +++ b/block.c
> @@ -3978,6 +3978,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
>              refresh_list = bdrv_topological_dfs(refresh_list, found,
>                                                  state->old_backing_bs);
>          }
> +        if (state->old_file_bs) {
> +            refresh_list = bdrv_topological_dfs(refresh_list, found,
> +                                                state->old_file_bs);
> +        }
>      }
>  
>      ret = bdrv_list_refresh_perms(refresh_list, bs_queue, &tran, errp);
> @@ -4196,6 +4200,61 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
>      return 0;
>  }
>  
> +static int bdrv_reopen_parse_file(BDRVReopenState *reopen_state,
> +                                  GSList **tran,
> +                                  Error **errp)
> +{
> +    BlockDriverState *bs = reopen_state->bs;
> +    BlockDriverState *new_file_bs;
> +    QObject *value;
> +    const char *str;
> +
> +    value = qdict_get(reopen_state->options, "file");
> +    if (value == NULL) {
> +        return 0;
> +    }
> +
> +    /* The 'file' option only allows strings */
> +    assert(qobject_type(value) == QTYPE_QSTRING);

This is true, but not entirely obvious: The QAPI schema has BlockdevRef,
which can be either a string or a dict. However, we're dealing with a
flattened options dict here, so no more nested dicts.

qemu-io doesn't go through the schema, but its parser represents all
scalars as strings, so it's correct even in this case.

> +
> +    str = qobject_get_try_str(value);

This function doesn't exist in master any more, but we already know that
we have a string here, so it's easy enough to replace:

str = qstring_get_str(qobject_to(QString, value));

> +    new_file_bs = bdrv_lookup_bs(NULL, str, errp);
> +    if (new_file_bs == NULL) {
> +        return -EINVAL;
> +    } else if (bdrv_recurse_has_child(new_file_bs, bs)) {
> +        error_setg(errp, "Making '%s' a file of '%s' "
> +                   "would create a cycle", str, bs->node_name);
> +        return -EINVAL;
> +    }
> +
> +    assert(bs->file && bs->file->bs);
> +
> +    /* If 'file' points to the current child then there's nothing to do */
> +    if (bs->file->bs == new_file_bs) {
> +        return 0;
> +    }
> +
> +    if (bs->file->frozen) {
> +        error_setg(errp, "Cannot change the 'file' link of '%s' "
> +                   "from '%s' to '%s'", bs->node_name,
> +                   bs->file->bs->node_name, new_file_bs->node_name);
> +        return -EPERM;
> +    }
> +
> +    /* Check AioContext compatibility */
> +    if (!bdrv_reopen_can_attach(bs, bs->file, new_file_bs, errp)) {
> +        return -EINVAL;
> +    }
> +
> +    /* Store the old file bs because we'll need to refresh its permissions */
> +    reopen_state->old_file_bs = bs->file->bs;
> +
> +    /* And finally replace the child */
> +    bdrv_replace_child(bs->file, new_file_bs, tran);
> +
> +    return 0;
> +}

As Vladimir said, it would be nice to avoid some duplication with the
backing file switching code (especially when you consider that we might
get more of these cases, think of qcow2 data files or VMDK extents), but
generally this patch makes sense to me.

Kevin


