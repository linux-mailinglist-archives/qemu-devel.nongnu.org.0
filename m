Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F97B387B0F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:24:02 +0200 (CEST)
Received: from localhost ([::1]:38538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0dd-0004CM-8d
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj0c8-0003NC-EJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:22:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj0c6-0006eG-6y
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621347745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7B1ygcbckd/zrvK+m0062hXljsq5SHFTNYdbLSGC81o=;
 b=h1O2SIdQWqnefcHUEZlX+yq9DltbHTsbJ7CqoTUGVOgh9+l5aL20J3YeHGuKB8heC6g/Hl
 0GZufk0UF4h03+HP2K7jrVvmRAd8En+wz7ikPkT0a/nnedspVlEED++zwp+y9mRtT/O8Nu
 dyaUpTUYQnEACkdHvyelpitA4fvD7wE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-ZhUhj_l2NhGxvI22S5epJg-1; Tue, 18 May 2021 10:22:23 -0400
X-MC-Unique: ZhUhj_l2NhGxvI22S5epJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63A7107ACF5;
 Tue, 18 May 2021 14:22:22 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A5B41349A;
 Tue, 18 May 2021 14:22:19 +0000 (UTC)
Subject: Re: [PATCH 17/21] block/block-copy: switch to fully set bitmap by
 default
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-19-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c3ef61db-8573-e648-80c6-0997580de8d5@redhat.com>
Date: Tue, 18 May 2021 16:22:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517064428.16223-19-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
> block-copy has a bit inconvenient interface around dirty bitmap: user
> should get pointer to it and than set by hand. We do need a possibility
> to share the bitmap with backup job.
> 
> But default of empty bitmap is strange.

I don’t know, I don’t find it strange.  It expects its user to specify 
what data to copy, so clearly it gives said user a blank slate.

> Switch to full-set bitmap by
> default. This way we will not care about setting dirty bitmap in
> copy-before-write filter when publish it so that it can be used in
> separate of backup job.

That’s a valid reason, though, so:

Reviewed-by: Max Reitz <mreitz@redhat.com>

Still, I find it stranger this way, because I’m more used to 
“initialization to 0 by default”.

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/backup.c     | 16 +++++++---------
>   block/block-copy.c |  1 +
>   2 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/block/backup.c b/block/backup.c
> index 90cca1ca30..706c54fea1 100644
> --- a/block/backup.c
> +++ b/block/backup.c
> @@ -233,18 +233,16 @@ static void backup_init_bcs_bitmap(BackupBlockJob *job)
>       BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
>   
>       if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
> +        bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
>           ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
>                                                  NULL, true);
>           assert(ret);
> -    } else {
> -        if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
> -            /*
> -             * We can't hog the coroutine to initialize this thoroughly.
> -             * Set a flag and resume work when we are able to yield safely.
> -             */
> -            block_copy_set_skip_unallocated(job->bcs, true);
> -        }
> -        bdrv_set_dirty_bitmap(bcs_bitmap, 0, job->len);
> +    } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
> +        /*
> +         * We can't hog the coroutine to initialize this thoroughly.
> +         * Set a flag and resume work when we are able to yield safely.
> +         */
> +        block_copy_set_skip_unallocated(job->bcs, true);
>       }
>   
>       estimate = bdrv_get_dirty_count(bcs_bitmap);
> diff --git a/block/block-copy.c b/block/block-copy.c
> index 9020234c6e..4126f7e8cc 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -296,6 +296,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>           return NULL;
>       }
>       bdrv_disable_dirty_bitmap(copy_bitmap);
> +    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
>   
>       /*
>        * Why we always set BDRV_REQ_SERIALISING write flag:
> 


