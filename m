Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453BC5762DD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:35:00 +0200 (CEST)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLT8-0008EJ-Vi
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCLRH-0006GV-CL
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:33:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCLRE-0004KT-Jv
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657891979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+C23Fk42KScF98rGV7MOv6k6GsyiGYfeMsiydwl1SA=;
 b=CKQdJr1wcXhDuyz8u9dbNW5i3UCwQQvBNl32UEdEm2BCluqNQ7uXrhxJ0HQaNjEIdJ0okL
 cHeXYmX6Bk808nyYag9axDRI0dKbJamk6u7hZkcpuahqGXPy6MsB2V7r/tOCErcy+ffq/j
 DPK0tr5bEjcO+ntqPyT8jVKHdRTxcbo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-dAoJtievNmaHFEmrBqNoSQ-1; Fri, 15 Jul 2022 09:32:58 -0400
X-MC-Unique: dAoJtievNmaHFEmrBqNoSQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 c9-20020a05640227c900b0043ad14b1fa0so3494999ede.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 06:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g+C23Fk42KScF98rGV7MOv6k6GsyiGYfeMsiydwl1SA=;
 b=RMRBqcA139uHzIWdDYEZIn4QsSZ5lSTmJSJk3+K4wt1WM1B9M9bmhSicB+xxFtCkMZ
 jiILswLuM3CJhKqA27D7+PK5Bfyd3jK3tnM3lm+TP+9SBGyNz3BEmKau2+4Uqmqs0Irc
 qsJY3hgDw/PF2/ncJ7Lkev39UEVVoBl8hvfnVSE5jNnykORM4Eqhtn3Mq9Gq4zvemegI
 6F7asS7iA+k3dmG1heK6TPl6NwXJPk84m6vONJ+Sp4ezrCmDzw+NXz0ARlzrBSaduWqE
 DnqysgYyQLwF32vUPrsduJfY8fMtj0KcU0w1WWdKA9VLSMNmVBKWBhB5UAJ2nNwMYf2j
 sOhQ==
X-Gm-Message-State: AJIora8t4i7HRXccsBWWjUWDlgvlseQz9otwK9AbbSjCucscqlhouL3h
 un0HVPCpQQT1G2p232M6oIr8uKf69YYQ0PNuQKw34WgyWk/Krq6D51WijDSazzrCoFXKpjhu6SX
 bAZdaUaR8wIULuXI=
X-Received: by 2002:a05:6402:2786:b0:43a:dc4e:ea63 with SMTP id
 b6-20020a056402278600b0043adc4eea63mr19441278ede.175.1657891976208; 
 Fri, 15 Jul 2022 06:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tLTcrMZzZGAi1JwOcDOIEQOv8q3xv2RWWDx8toE9sg3H1gABuY50kOne9+5sV7eNGBigciMg==
X-Received: by 2002:a05:6402:2786:b0:43a:dc4e:ea63 with SMTP id
 b6-20020a056402278600b0043adc4eea63mr19441225ede.175.1657891975775; 
 Fri, 15 Jul 2022 06:32:55 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 b6-20020aa7cd06000000b004355998ec1asm2782666edw.14.2022.07.15.06.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 06:32:54 -0700 (PDT)
Message-ID: <b4146d6b-3879-f6f9-d573-5c5289afb593@redhat.com>
Date: Fri, 15 Jul 2022 15:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 7/8] block: use the new _change_ API instead of
 _can_set_ and _set_
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-8-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220712211911.1302836-8-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 12.07.22 23:19, Emanuele Giuseppe Esposito wrote:
> Replace all direct usage of ->can_set_aio_ctx and ->set_aio_ctx,
> and call bdrv_child_try_change_aio_context() in
> bdrv_try_set_aio_context(), the main function called through
> the whole block layer.
>
>  From this point onwards, ->can_set_aio_ctx and ->set_aio_ctx
> won't be used anymore.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c               | 30 ++++++++++++++++--------------
>   block/block-backend.c |  8 ++++++--
>   2 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/block.c b/block.c
> index a7ba590dfa..101188a2d4 100644
> --- a/block.c
> +++ b/block.c
> @@ -2966,17 +2966,18 @@ static void bdrv_attach_child_common_abort(void *opaque)
>       }
>   
>       if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
> +        Transaction *tran;
>           GSList *ignore;
> +        bool ret;
>   
> -        /* No need to ignore `child`, because it has been detached already */
> -        ignore = NULL;
> -        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
> -                                      &error_abort);
> -        g_slist_free(ignore);
> +        tran = tran_new();
>   
> +        /* No need to ignore `child`, because it has been detached already */
>           ignore = NULL;
> -        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
> +        ret = child->klass->change_aio_ctx(child, s->old_parent_ctx, &ignore,
> +                                           tran, &error_abort);
>           g_slist_free(ignore);
> +        tran_finalize(tran, ret ? ret : -1);

As far as I understand, the transaction is supposed to always succeed; 
that’s why we pass `&error_abort`, I thought.

If so, `ret` should always be true.  More importantly, though, I think 
the `ret ? ret : -1` is wrong because it’ll always evaluate to either 1 
or -1, but never to 0, which would indicate success.  I think it should 
be `ret == true ? 0 : -1`, or even better `assert(ret == true); 
tran_finalize(tran, 0);`.

>       }
>   
>       bdrv_unref(bs);
> @@ -3037,17 +3038,18 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
>           Error *local_err = NULL;
>           int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
>   
> -        if (ret < 0 && child_class->can_set_aio_ctx) {
> +        if (ret < 0 && child_class->change_aio_ctx) {
> +            Transaction *tran = tran_new();
>               GSList *ignore = g_slist_prepend(NULL, new_child);
> -            if (child_class->can_set_aio_ctx(new_child, child_ctx, &ignore,
> -                                             NULL))
> -            {
> +            bool ret_child;
> +
> +            ret_child = child_class->change_aio_ctx(new_child, child_ctx,
> +                                                    &ignore, tran, NULL);
> +            if (ret_child) {

To be honest, due to the mix of return value styles we have, perhaps a 
`ret_child == true` would help to signal that this is a success path.

>                   error_free(local_err);
>                   ret = 0;
> -                g_slist_free(ignore);
> -                ignore = g_slist_prepend(NULL, new_child);
> -                child_class->set_aio_ctx(new_child, child_ctx, &ignore);
>               }
> +            tran_finalize(tran, ret_child ? ret_child : -1);

This too should probably be `ret_child == true ? 0 : -1`.

>               g_slist_free(ignore);
>           }
>   
> @@ -7708,7 +7710,7 @@ int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>                                Error **errp)
>   {
>       GLOBAL_STATE_CODE();
> -    return bdrv_child_try_set_aio_context(bs, ctx, NULL, errp);
> +    return bdrv_child_try_change_aio_context(bs, ctx, NULL, errp);

Why not remove this function and adjust all callers?

Hanna

>   }
>   
>   void bdrv_add_aio_context_notifier(BlockDriverState *bs,


