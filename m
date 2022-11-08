Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32653621799
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:01:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQ4d-00030Q-2f; Tue, 08 Nov 2022 09:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osQ4Z-0002zf-Fw; Tue, 08 Nov 2022 09:59:31 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osQ4W-0001fp-3P; Tue, 08 Nov 2022 09:59:31 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 0B0C35EB8D;
 Tue,  8 Nov 2022 17:59:07 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Kv3Ry6M0Oe-x5OaXLgv; Tue, 08 Nov 2022 17:59:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667919546; bh=kZ2UADQ6sW2RnaMSBLLc30lV9tBNlGDOt+4xXNTNJs4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ZzUW14dZNMQYcWeHFEi8qElxoc8J9MAgVL6Yt9cXAIwqZ6juVdwsg9WLJjFAaklcU
 5uwIZyhvnQcr332cAs79QGf7JFB+pAy3IS8XAJTkq48EIeysAG5FPzY5v1utnicIKY
 18fCBXxs8abr9IUAd2wkpIsMvEXhPyXgZKg/mgYw=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <3b563221-bd67-a597-e12f-5a9106752d38@yandex-team.ru>
Date: Tue, 8 Nov 2022 17:59:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 5/9] block: distinguish between bdrv_create running in
 coroutine and not
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221104095700.4117433-6-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/4/22 12:56, Emanuele Giuseppe Esposito wrote:
> Call two different functions depending on whether bdrv_create
> is in coroutine or not, following the same pattern as
> generated_co_wrapper functions.
> 
> This allows to also call the coroutine function directly,
> without using CreateCo or relying in bdrv_create().
> 

Can we move to auto-generation of bdrv_create(), like for bdrv_check() and friends?

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 74 ++++++++++++++++++++++++++++-----------------------------
>   1 file changed, 36 insertions(+), 38 deletions(-)
> 
> diff --git a/block.c b/block.c
> index d2b2800039..0823563e4d 100644
> --- a/block.c
> +++ b/block.c
> @@ -522,66 +522,64 @@ typedef struct CreateCo {
>       Error *err;
>   } CreateCo;
>   
> -static void coroutine_fn bdrv_create_co_entry(void *opaque)
> +static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
> +                                       QemuOpts *opts, Error **errp)
>   {
> -    Error *local_err = NULL;
>       int ret;
> +    GLOBAL_STATE_CODE();
> +    assert(*errp == NULL);
> +
> +    if (!drv->bdrv_co_create_opts) {
> +        error_setg(errp, "Driver '%s' does not support image creation",
> +                   drv->format_name);
> +        return -ENOTSUP;
> +    }
> +
> +    ret = drv->bdrv_co_create_opts(drv, filename, opts, errp);
>   
> +    if (ret < 0 && !*errp) {
> +        error_setg_errno(errp, -ret, "Could not create image");
> +    }
> +
> +    return ret;
> +}
> +
> +static void coroutine_fn bdrv_create_co_entry(void *opaque)
> +{
>       CreateCo *cco = opaque;
> -    assert(cco->drv);
>       GLOBAL_STATE_CODE();
> +    assert(cco->drv);
>   
> -    ret = cco->drv->bdrv_co_create_opts(cco->drv,
> -                                        cco->filename, cco->opts, &local_err);
> -    error_propagate(&cco->err, local_err);
> -    cco->ret = ret;
> +    cco->ret = bdrv_co_create(cco->drv, cco->filename, cco->opts, &cco->err);
>   }
>   
>   int bdrv_create(BlockDriver *drv, const char* filename,
>                   QemuOpts *opts, Error **errp)
>   {
> -    int ret;
> -
>       GLOBAL_STATE_CODE();
>   
> -    Coroutine *co;
> -    CreateCo cco = {
> -        .drv = drv,
> -        .filename = g_strdup(filename),
> -        .opts = opts,
> -        .ret = NOT_DONE,
> -        .err = NULL,
> -    };
> -
> -    if (!drv->bdrv_co_create_opts) {
> -        error_setg(errp, "Driver '%s' does not support image creation", drv->format_name);
> -        ret = -ENOTSUP;
> -        goto out;
> -    }
> -
>       if (qemu_in_coroutine()) {
>           /* Fast-path if already in coroutine context */
> -        bdrv_create_co_entry(&cco);
> +        return bdrv_co_create(drv, filename, opts, errp);
>       } else {
> +        Coroutine *co;
> +        CreateCo cco = {
> +            .drv = drv,
> +            .filename = g_strdup(filename),
> +            .opts = opts,
> +            .ret = NOT_DONE,
> +            .err = NULL,
> +        };
> +
>           co = qemu_coroutine_create(bdrv_create_co_entry, &cco);
>           qemu_coroutine_enter(co);
>           while (cco.ret == NOT_DONE) {
>               aio_poll(qemu_get_aio_context(), true);
>           }
> +        error_propagate(errp, cco.err);
> +        g_free(cco.filename);
> +        return cco.ret;
>       }
> -
> -    ret = cco.ret;
> -    if (ret < 0) {
> -        if (cco.err) {
> -            error_propagate(errp, cco.err);
> -        } else {
> -            error_setg_errno(errp, -ret, "Could not create image");
> -        }
> -    }
> -
> -out:
> -    g_free(cco.filename);
> -    return ret;
>   }
>   
>   /**

-- 
Best regards,
Vladimir


