Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C9C518101
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:27:07 +0200 (CEST)
Received: from localhost ([::1]:40398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlooE-0001cY-J9
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nloly-0000ai-3f
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:24:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlolv-0001ol-QR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651569881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NstedNmjgtX5wXMa4fF9wxiDA3u7SADv7OBdcjcFFSA=;
 b=HxGFxm0l1e/Ot3fk0AYlVJZYIiQn7Y/bl6r8jPVCdnKV/u4zpVg1OvcOlqcuKai84GXrwR
 9q2GCsD7B7t7H3aizDefThbfU1U1fj4KB0nh+46mnh8pfqJ90hUGNzfMS88SGEoiQeGa5Y
 dVp/NWACB3ZbFh9vega+D/HMWFWuQl4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-w1OemwYxOs637Bce_Tmp-Q-1; Tue, 03 May 2022 05:24:38 -0400
X-MC-Unique: w1OemwYxOs637Bce_Tmp-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAAC829AA2EE;
 Tue,  3 May 2022 09:24:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F035690DA;
 Tue,  3 May 2022 09:24:34 +0000 (UTC)
Date: Tue, 3 May 2022 11:24:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 hreitz@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 vsementsov@openvz.org, nikita.lapshin@virtuozzo.com
Subject: Re: [PATCH v3 2/3] block: improve block_dirty_bitmap_merge(): don't
 allocate extra bitmap
Message-ID: <YnD00CJqxBT/hM2T@redhat.com>
References: <20220401100804.315728-1-vsementsov@openvz.org>
 <20220401100804.315728-3-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401100804.315728-3-vsementsov@openvz.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.04.2022 um 12:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
> We don't need extra bitmap. All we need is to backup the original
> bitmap when we do first merge. So, drop extra temporary bitmap and work
> directly with target and backup.
> 
> Still to keep old semantics, that on failure target is unchanged and
> user don't need to restore, we need a local_backup variable and do
> restore ourselves on failure path.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>  block/monitor/bitmap-qmp-cmds.c | 39 ++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 20 deletions(-)
> 
> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
> index 4db704c015..07d0da323b 100644
> --- a/block/monitor/bitmap-qmp-cmds.c
> +++ b/block/monitor/bitmap-qmp-cmds.c
> @@ -261,8 +261,9 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>                                            HBitmap **backup, Error **errp)
>  {
>      BlockDriverState *bs;
> -    BdrvDirtyBitmap *dst, *src, *anon;
> +    BdrvDirtyBitmap *dst, *src;
>      BlockDirtyBitmapMergeSourceList *lst;
> +    HBitmap *local_backup = NULL;
>  
>      GLOBAL_STATE_CODE();
>  
> @@ -271,12 +272,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>          return NULL;
>      }
>  
> -    anon = bdrv_create_dirty_bitmap(bs, bdrv_dirty_bitmap_granularity(dst),
> -                                    NULL, errp);
> -    if (!anon) {
> -        return NULL;
> -    }
> -
>      for (lst = bms; lst; lst = lst->next) {
>          switch (lst->value->type) {
>              const char *name, *node;
> @@ -285,8 +280,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>              src = bdrv_find_dirty_bitmap(bs, name);
>              if (!src) {
>                  error_setg(errp, "Dirty bitmap '%s' not found", name);
> -                dst = NULL;
> -                goto out;
> +                goto fail;
>              }
>              break;
>          case QTYPE_QDICT:
> @@ -294,29 +288,34 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>              name = lst->value->u.external.name;
>              src = block_dirty_bitmap_lookup(node, name, NULL, errp);
>              if (!src) {
> -                dst = NULL;
> -                goto out;
> +                goto fail;
>              }
>              break;
>          default:
>              abort();
>          }
>  
> -        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
> -            dst = NULL;
> -            goto out;
> +        /* We do backup only for first merge operation */
> +        if (!bdrv_merge_dirty_bitmap(dst, src,
> +                                     local_backup ? NULL : &local_backup,
> +                                     errp))
> +        {
> +            goto fail;
>          }
>      }
>  
> -    /* Merge into dst; dst is unchanged on failure. */
> -    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
> -        dst = NULL;
> -        goto out;
> +    if (backup) {
> +        *backup = local_backup;
>      }

Don't we need something like '... else { hbitmap_free(local_backup); }'
in order to avoid leaking the memory?

>  
> - out:
> -    bdrv_release_dirty_bitmap(anon);
>      return dst;
> +
> +fail:
> +    if (local_backup) {
> +        bdrv_restore_dirty_bitmap(dst, local_backup);
> +    }
> +
> +    return NULL;
>  }

Kevin


