Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA931697D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:54:00 +0100 (CET)
Received: from localhost ([::1]:42652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qsR-0004O4-7a
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9qqC-000346-Na
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:51:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9qq3-0001Pw-2u
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612968689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pvj7Q3Zsk9cAanb2ksyLIvTb/jbe1OIA11gqOjCxQt8=;
 b=EOxV4s6LQwbnS/e8fhmzE3YLDmgxY82cZoF3xZNuP8gOrZnsxcr9ArvZmfVPJHPMBrUeKt
 tTK00WLgM8g5HC/VSM+cDxROWXxI4PLmpo5LvJdiZMhvjPnDhqTHEXptD+IezqBaqGDY23
 iuD1ICzrCc9BWh7a9depmOrD3ITMFdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-to-fGzK9OiuWoK_BuWN-7Q-1; Wed, 10 Feb 2021 09:51:27 -0500
X-MC-Unique: to-fGzK9OiuWoK_BuWN-7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CE83801962;
 Wed, 10 Feb 2021 14:51:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B23319CB0;
 Wed, 10 Feb 2021 14:51:24 +0000 (UTC)
Date: Wed, 10 Feb 2021 15:51:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 34/36] block: refactor bdrv_child_set_perm_safe()
 transaction action
Message-ID: <20210210145122.GF5144@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-35-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-35-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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

Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Old interfaces dropped, nobody directly calls
> bdrv_child_set_perm_abort() and bdrv_child_set_perm_commit(), so we can
> use personal state structure for the action and stop exploiting
> BdrvChild structure. Also, drop "_safe" suffix which is redundant now.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> diff --git a/block.c b/block.c
> index 3093d20db8..1fde22e4f4 100644
> --- a/block.c
> +++ b/block.c
> @@ -2070,59 +2070,40 @@ static GSList *bdrv_topological_dfs(GSList *list, GHashTable *found,
>      return g_slist_prepend(list, bs);
>  }
>  
> -static void bdrv_child_set_perm_commit(void *opaque)
> -{
> -    BdrvChild *c = opaque;
> -
> -    c->has_backup_perm = false;
> -}
> +typedef struct BdrvChildSetPermState {
> +    BdrvChild *child;
> +    uint64_t old_perm;
> +    uint64_t old_shared_perm;
> +} BdrvChildSetPermState;
>  
>  static void bdrv_child_set_perm_abort(void *opaque)
>  {
> -    BdrvChild *c = opaque;
> -    /*
> -     * We may have child->has_backup_perm unset at this point, as in case of
> -     * _check_ stage of permission update failure we may _check_ not the whole
> -     * subtree.  Still, _abort_ is called on the whole subtree anyway.
> -     */
> -    if (c->has_backup_perm) {
> -        c->perm = c->backup_perm;
> -        c->shared_perm = c->backup_shared_perm;
> -        c->has_backup_perm = false;
> -    }
> +    BdrvChildSetPermState *s = opaque;
> +
> +    s->child->perm = s->old_perm;
> +    s->child->shared_perm = s->old_shared_perm;
>  }

Ah, so this patch actually implements what I had asked for somewhere at
the start of the series.

Don't bother changing it earlier then. As long as it's in the same
series, this is fine.

Kevin


