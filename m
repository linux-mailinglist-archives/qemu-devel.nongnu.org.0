Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553CA387A83
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:58:00 +0200 (CEST)
Received: from localhost ([::1]:40542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0ER-0001Ag-EC
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj0DZ-0000MT-F6
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj0DX-0008LO-Qh
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621346223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U1Yrz4hpfKcPzBkVpVkKjDKdXdLT7FJfGvL4f49nKYI=;
 b=hipj71joX5hxmjGg6SK6S8KQ6VkwxD/20Z9HxqiIioh++U0zvcDtM/XbqZ0XEbfA7AwOHm
 Qnzl4PQ52V8cjzcjFVxeUYMB8bbTVC0RvsyPHaNa9pr/yPr8Jnyvs0Du9FjI/azgNsSCqE
 bktlfHGE+917n/oJSl+yldicrNrtAUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-xZYqCUsjPwu5XGe95lzu1Q-1; Tue, 18 May 2021 09:56:59 -0400
X-MC-Unique: xZYqCUsjPwu5XGe95lzu1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB26F802690;
 Tue, 18 May 2021 13:56:58 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B76285D6AD;
 Tue, 18 May 2021 13:56:56 +0000 (UTC)
Subject: Re: [PATCH 16/21] block/copy-before-write: cbw_init(): use options
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-18-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7fe834fc-741d-bac1-b325-35092473313e@redhat.com>
Date: Tue, 18 May 2021 15:56:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-18-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
> One more step closer to .bdrv_open(): use options instead of plain
> arguments. Move to bdrv_open_child() calls, native for drive open
> handlers.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.c | 37 ++++++++++++++++++++-----------------
>   1 file changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index ddd79b3686..9ff1bf676c 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -144,27 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
>       }
>   }
>   
> -static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
> -                    BlockDriverState *target, bool compress, Error **errp)
> +static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
>   {
>       BDRVCopyBeforeWriteState *s = bs->opaque;
>   
> -    bdrv_ref(target);
> -    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
> -                                  BDRV_CHILD_DATA, errp);
> -    if (!s->target) {
> -        error_prepend(errp, "Cannot attach target child: ");
> -        bdrv_unref(target);
> +    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
> +                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
> +                               false, errp);
> +    if (!bs->file) {
>           return -EINVAL;
>       }
>   
> -    bdrv_ref(source);
> -    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
> -                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
> -                                 errp);
> -    if (!bs->file) {
> -        error_prepend(errp, "Cannot attach file child: ");
> -        bdrv_unref(source);
> +    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
> +                                BDRV_CHILD_DATA, false, errp);
> +    if (!s->target) {
>           return -EINVAL;
>       }
>   
> @@ -175,7 +168,10 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
>               ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>                bs->file->bs->supported_zero_flags);
>   
> -    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
> +    qdict_del(options, "cluster-size");

What is this about?

> +    s->bcs = block_copy_state_new(bs->file, s->target, false,
> +            qdict_get_try_bool(options, "x-deprecated-compress", false), errp);

First, I’d keep the `compress` variable and use it to store the value, 
because this doesn’t look very nice.

Second, what’s the story here?  “deprecated” sounds to me like you’re 
planning to use a different interface eventually, but looking ahead for 
a bit I didn’t find anything yet.

Max

> +    qdict_del(options, "x-deprecated-compress");
>       if (!s->bcs) {
>           error_prepend(errp, "Cannot create block-copy-state: ");
>           return -EINVAL;
> @@ -212,6 +208,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
>       int ret;
>       BDRVCopyBeforeWriteState *state;
>       BlockDriverState *top;
> +    QDict *opts;
>   
>       assert(source->total_sectors == target->total_sectors);
>   
> @@ -223,7 +220,13 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
>       }
>       state = top->opaque;
>   
> -    ret = cbw_init(top, source, target, compress, errp);
> +    opts = qdict_new();
> +    qdict_put_str(opts, "file", bdrv_get_node_name(source));
> +    qdict_put_str(opts, "target", bdrv_get_node_name(target));
> +    qdict_put_bool(opts, "x-deprecated-compress", compress);
> +
> +    ret = cbw_init(top, opts, errp);
> +    qobject_unref(opts);
>       if (ret < 0) {
>           goto fail;
>       }
> 


