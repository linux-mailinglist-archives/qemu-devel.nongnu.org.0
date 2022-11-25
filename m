Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11299638F7F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 19:05:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyd3U-0001FU-OC; Fri, 25 Nov 2022 13:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyd3S-0001FC-PZ; Fri, 25 Nov 2022 13:04:03 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyd3O-00059S-G7; Fri, 25 Nov 2022 13:04:01 -0500
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 41C1C601BC;
 Fri, 25 Nov 2022 21:03:31 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id T3R9A20NliE1-UXAMkaeI; Fri, 25 Nov 2022 21:03:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669399410; bh=SArqmbubp3uffMlVrOneAGsveroOYfuXEB5wq8/1YAc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=aWLWEpjmJBP6Ed5fsJqv0huO2mbwcgyBT6EXSEFijmh8qLLt6AmZ0UOxHVNupXkNd
 z7K9LfEsXjWAzlb5Mvgqj2uGvQoa4WBQLvpOQn8i5r53Y1JX5x+3Ff0Nl/MNkyDe13
 uf6ahPjMfUoQ8fzaZxE/0lICp0ph9MfDwJSq1KEU=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e45ea640-294d-201b-7b0d-94755eaccd30@yandex-team.ru>
Date: Fri, 25 Nov 2022 21:03:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 07/14] block: distinguish between bdrv_create running
 in coroutine and not
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20221125133518.418328-1-eesposit@redhat.com>
 <20221125133518.418328-8-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221125133518.418328-8-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

On 11/25/22 16:35, Emanuele Giuseppe Esposito wrote:
> Call two different functions depending on whether bdrv_create
> is in coroutine or not, following the same pattern as
> generated_co_wrapper functions.
> 
> This allows to also call the coroutine function directly,
> without using CreateCo or relying in bdrv_create().
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block.c | 71 +++++++++++++++++++++++++++++----------------------------
>   1 file changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 9d51e7b6e5..2cf50b37c4 100644
> --- a/block.c
> +++ b/block.c
> @@ -528,63 +528,64 @@ typedef struct CreateCo {
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
> +    ERRP_GUARD();
> +    assert(*errp == NULL);
> +    assert(drv);

Why we need these two assertions? These are general assumptions, and we don't assert it in all functions. Dereference of NULL will crash not worse than assertion. I'd drop them.

> +
> +    if (!drv->bdrv_co_create_opts) {
> +        error_setg(errp, "Driver '%s' does not support image creation",
> +                   drv->format_name);
> +        return -ENOTSUP;
> +    }
> +
> +    ret = drv->bdrv_co_create_opts(drv, filename, opts, errp);
>   

and this empty line, looks accidental.

Offtopic: hope one day we fix *open* functions to always set errp on error paths.

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
>   
> -    ret = cco->drv->bdrv_co_create_opts(cco->drv,
> -                                        cco->filename, cco->opts, &local_err);
> -    error_propagate(&cco->err, local_err);
> -    cco->ret = ret;
> +    cco->ret = bdrv_co_create(cco->drv, cco->filename, cco->opts, &cco->err);

We need aio_wait_kick() call here, like in other co_entry() functions. Otherwise we may stuck in aio_poll()

with it:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Hmm actually, we can simply merge this patch into patch 13 (and move 08 to be after 13). Why to refactor bdrv_create twice?


-- 
Best regards,
Vladimir


