Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0867B633764
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:47:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOuM-0007K4-E1; Tue, 22 Nov 2022 03:45:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxOuJ-0007Iw-SK
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:45:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oxOuH-0001An-Ra
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669106728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L68qzcfzsRdiXpaTOdlxA7ESYROYWLD7BxtPPVjWmoY=;
 b=QuGtZ6PCATCl30mAoPKJr2d6cXaHQdlm9odnPSDfSpEIsS1Lgute3dBCbXnKee0sMetNKr
 mmHL52KTCiltns3LPKBNIn/OLqVs755Dqmfp6GCd+0WMj5wHJ0l9Zt/ypkfT9xk8W95mF+
 0J20sERq9SNZKgpu9xHoMHj7t33QKWs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-ocPVgsnoPtqQB8V27apzwQ-1; Tue, 22 Nov 2022 03:45:25 -0500
X-MC-Unique: ocPVgsnoPtqQB8V27apzwQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5F5F3817962;
 Tue, 22 Nov 2022 08:45:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7556A4B3FC6;
 Tue, 22 Nov 2022 08:45:23 +0000 (UTC)
Date: Tue, 22 Nov 2022 09:45:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 08/11] block: distinguish between bdrv_create running
 in coroutine and not
Message-ID: <Y3yMICQrkbmB4Aaq@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-9-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116122241.2856527-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> Call two different functions depending on whether bdrv_create
> is in coroutine or not, following the same pattern as
> generated_co_wrapper functions.
> 
> This allows to also call the coroutine function directly,
> without using CreateCo or relying in bdrv_create().
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 76 ++++++++++++++++++++++++++++-----------------------------
>  1 file changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 577639c7e0..c610a32e77 100644
> --- a/block.c
> +++ b/block.c
> @@ -528,66 +528,66 @@ typedef struct CreateCo {
>      Error *err;
>  } CreateCo;
>  
> -static void coroutine_fn bdrv_create_co_entry(void *opaque)
> +static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
> +                                       QemuOpts *opts, Error **errp)
>  {
> -    Error *local_err = NULL;
>      int ret;
> +    char *filename_copy;
> +    GLOBAL_STATE_CODE();
> +    assert(*errp == NULL);

Your use of *errp in this function will crash if NULL is passed. You
need ERRP_GUARD() first before you can do this.

> +    assert(drv);
> +
> +    if (!drv->bdrv_co_create_opts) {
> +        error_setg(errp, "Driver '%s' does not support image creation",
> +                   drv->format_name);
> +        return -ENOTSUP;
> +    }
>  
> +    filename_copy = g_strdup(filename);

It's only preserved from the pre-patch state, but I don't think this is
necessary? We know that the string will stay around until the function
returns, and the parameter of drv->bdrv_co_create_opts is const char*,
so it must not be modified either.

Maybe worth a cleanup patch on top to just use filename directly?

> +    ret = drv->bdrv_co_create_opts(drv, filename_copy, opts, errp);
> +
> +    if (ret < 0 && !*errp) {
> +        error_setg_errno(errp, -ret, "Could not create image");
> +    }
> +
> +    g_free(filename_copy);
> +    return ret;
> +}

Kevin


