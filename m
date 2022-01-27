Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C791249E090
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:19:15 +0100 (CET)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2o6-0005xf-Tf
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:19:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD2Yv-0000ng-SV
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:03:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD2Yt-0004z4-0T
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643281410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DCK+hytWKrtRjseMcd8S4fbni0FpujdsjylKtkxOmdQ=;
 b=L+HpwqhS6n6WZSeceG3T0m8dPWPbZXJmszMOGQZAS2toeRfEn0haDNRd+HeHkom18CiLOC
 VJkuOcHLuoSWd25XsheCsLXgpyRsdgXFaAOuyi9Fi+H3OC1nWf1lq6DSh88i0ySl3OMTTN
 r9QFg/zzjjcfovP/2uJt3r71NPlze7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-9qOcr5urPYWTae4vvHHrPQ-1; Thu, 27 Jan 2022 06:03:26 -0500
X-MC-Unique: 9qOcr5urPYWTae4vvHHrPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9FF21926DA9;
 Thu, 27 Jan 2022 11:03:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A32F110F86;
 Thu, 27 Jan 2022 11:03:20 +0000 (UTC)
Date: Thu, 27 Jan 2022 12:03:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 21/33] block: move BQL logic of
 bdrv_co_invalidate_cache in bdrv_activate
Message-ID: <YfJ79zaea6yFFh4w@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-22-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220121170544.2049944-22-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
> Split bdrv_co_invalidate cache in two: the GS code that takes
> care of permissions and running GS callbacks, and leave only the
> I/O code (->bdrv_co_invalidate_cache) running in the I/O coroutine.
> 
> The only side effect is that bdrv_co_invalidate_cache is not
> recursive anymore, and so is every direct call to
> bdrv_invalidate_cache().
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 36 +++++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 7ab5031027..bad834c86e 100644
> --- a/block.c
> +++ b/block.c
> @@ -6550,23 +6550,20 @@ void bdrv_init_with_whitelist(void)
>  }
>  
>  int bdrv_activate(BlockDriverState *bs, Error **errp)
> -{
> -    return bdrv_invalidate_cache(bs, errp);
> -}
> -
> -int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>  {
>      BdrvChild *child, *parent;
>      Error *local_err = NULL;
>      int ret;
>      BdrvDirtyBitmap *bm;
>  
> +    assert(qemu_in_main_thread());
> +
>      if (!bs->drv)  {
>          return -ENOMEDIUM;
>      }
>  
>      QLIST_FOREACH(child, &bs->children, next) {
> -        bdrv_co_invalidate_cache(child->bs, &local_err);
> +        bdrv_activate(child->bs, &local_err);
>          if (local_err) {
>              error_propagate(errp, local_err);
>              return -EINVAL;
> @@ -6579,7 +6576,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>       * Note that the required permissions of inactive images are always a
>       * subset of the permissions required after activating the image. This
>       * allows us to just get the permissions upfront without restricting
> -     * drv->bdrv_invalidate_cache().
> +     * drv->bdrv_co_invalidate_cache().
>       *
>       * It also means that in error cases, we don't have to try and revert to
>       * the old permissions (which is an operation that could fail, too). We can
> @@ -6594,14 +6591,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>              return ret;
>          }
>  
> -        if (bs->drv->bdrv_co_invalidate_cache) {
> -            bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
> -            if (local_err) {
> -                bs->open_flags |= BDRV_O_INACTIVE;
> -                error_propagate(errp, local_err);
> -                return -EINVAL;
> -            }
> -        }
> +        bdrv_invalidate_cache(bs, errp);
>  
>          FOR_EACH_DIRTY_BITMAP(bs, bm) {
>              bdrv_dirty_bitmap_skip_store(bm, false);
> @@ -6629,6 +6619,22 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>      return 0;
>  }
>  
> +int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
> +{
> +    Error *local_err = NULL;
> +
> +    if (bs->drv->bdrv_co_invalidate_cache) {
> +        bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
> +        if (local_err) {
> +            bs->open_flags |= BDRV_O_INACTIVE;

This doesn't feel like the right place. The flag is cleared by the
caller, so it should also be set again on failure by the caller and not
by this function.

What bdrv_co_invalidate_cache() could do is assert that BDRV_O_INACTIVE
is cleared when it's called.

> +            error_propagate(errp, local_err);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}

Kevin


