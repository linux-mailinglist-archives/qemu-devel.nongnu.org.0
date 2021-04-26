Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2036B6C6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:27:20 +0200 (CEST)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb44t-0001pY-5o
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lb43y-0001KX-MB
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lb43w-0004T5-Kk
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619454379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0dJl8liZQUAjPjrjjLClOz++1wmoEc8fiD/Bb3AWWDM=;
 b=GmE1mfOcDdwcn/DvqUea8InShLURkxlp+1aiIi0R36he7uzB0FdeeMD1f/q1p+Ps/pGxHG
 EZ5qk/iHOsCly7AWeprdxigFlHAwxtamVgynU9fqof0nDzbQ/p57Hl2xnODSMpx940YcpM
 WkNm421eegjA6+Sft6LUbgiE4vo+A6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-nP37N8HNP0qxvt2EwYv57A-1; Mon, 26 Apr 2021 12:26:17 -0400
X-MC-Unique: nP37N8HNP0qxvt2EwYv57A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E02218BA281;
 Mon, 26 Apr 2021 16:26:16 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-177.ams2.redhat.com [10.36.114.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D37260C4A;
 Mon, 26 Apr 2021 16:26:11 +0000 (UTC)
Date: Mon, 26 Apr 2021 18:26:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 22/36] block: add bdrv_remove_filter_or_cow
 transaction action
Message-ID: <YIbpoWMyxkgRUtki@merkur.fritz.box>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-23-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210317143529.615584-23-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 15:35 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 11f7ad0818..2fca1f2ad5 100644
> --- a/block.c
> +++ b/block.c
> @@ -2929,12 +2929,19 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
>      }
>  }
>  
> +static void bdrv_child_free(void *opaque)
> +{
> +    BdrvChild *c = opaque;
> +
> +    g_free(c->name);
> +    g_free(c);
> +}
> +
>  static void bdrv_remove_empty_child(BdrvChild *child)
>  {
>      assert(!child->bs);
>      QLIST_SAFE_REMOVE(child, next);
> -    g_free(child->name);
> -    g_free(child);
> +    bdrv_child_free(child);
>  }
>  
>  typedef struct BdrvAttachChildCommonState {
> @@ -4956,6 +4963,73 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
>      return ret;
>  }
>  
> +typedef struct BdrvRemoveFilterOrCowChild {
> +    BdrvChild *child;
> +    bool is_backing;
> +} BdrvRemoveFilterOrCowChild;
> +
> +/* this doesn't restore original child bs, only the child itself */

Hm, this comment tells me that it's intentional, but why is it correct?

> +static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
> +{
> +    BdrvRemoveFilterOrCowChild *s = opaque;
> +    BlockDriverState *parent_bs = s->child->opaque;
> +
> +    QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
> +    if (s->is_backing) {
> +        parent_bs->backing = s->child;
> +    } else {
> +        parent_bs->file = s->child;
> +    }
> +}

Kevin


