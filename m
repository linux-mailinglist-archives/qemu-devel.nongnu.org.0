Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C465760A8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 13:36:47 +0200 (CEST)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCJck-0001cn-24
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 07:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCJah-0008OK-If
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCJae-0002ap-Iq
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 07:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657884875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJxSlBeNrAQnnJ3L1KfoLJBbSKALgkW5At84iOaEqEo=;
 b=f22onCfVZ6NZx15txBIU1U9AYBcQk/JU7RR60oNfcTH6HRQCkF/br2RChYMMmfN0XlKXIn
 116y4XXnCsHA7VPcLcJ6Fv+D75xjz8JJyjsBmB0qGO0SWm+dy6M8sFBeaCPNPKOaurfrCj
 HlAo+CGW8Banq7XAeHaI6CBPlj0no6U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-3RkxssPnOACw7p3TZn9L4A-1; Fri, 15 Jul 2022 07:34:34 -0400
X-MC-Unique: 3RkxssPnOACw7p3TZn9L4A-1
Received: by mail-ed1-f69.google.com with SMTP id
 c9-20020a05640227c900b0043ad14b1fa0so3302620ede.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 04:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IJxSlBeNrAQnnJ3L1KfoLJBbSKALgkW5At84iOaEqEo=;
 b=h+9J6NNu37kMsZpupQnyE7t5/szMQyFhlEeZpe6DHDeVx0fbYZ0cERVCCiLHmMwljX
 2BMuB552aYNoU2l/OKXLFOB85Y5pQ+N+be4eKri34NeNxtmIuQD/WfJ2dV39nYW+KQyQ
 DUSuN3TLeiH9Tr2/eDVtv+JP3OckhBWAo1ePbwex867ceiFb7zX8Vx8Aqx4QehKRZf8F
 pRlaW+WQoY6WC1+r6qVnSES8ZYbmRkA6kJqywd1duGUUCNkUxhCNz4sxb1x6QQXW/qFz
 Uc1T0eBDGbEDXPrst2SmdAWYKQAB/jb8EN+HXn9EI983xm9V0gzO8b7parA6eF8ZPEL3
 WZTQ==
X-Gm-Message-State: AJIora9BhCKE1YjSdO6OnBTA6S/AzE9S8XGoaU5kn4BWCNQbhtynPyTj
 hFFl1bTI8II/+6xQkRF5FXxXy4MIYlbZ/ySB1n+I8B44zSfeTYY+cW3IP6OiRGBmmz/Cdf0bANv
 Fq+KV0Nk5zksxL7k=
X-Received: by 2002:a17:907:60cc:b0:72b:40a8:a5b with SMTP id
 hv12-20020a17090760cc00b0072b40a80a5bmr12959117ejc.379.1657884872994; 
 Fri, 15 Jul 2022 04:34:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOnh/+P5afTYydCXGSGkuCR1bPlsrgjP39nnj8ltgAfGjoO9oIMgy/DSizb+vnopcwTzSKpg==
X-Received: by 2002:a17:907:60cc:b0:72b:40a8:a5b with SMTP id
 hv12-20020a17090760cc00b0072b40a80a5bmr12959097ejc.379.1657884872741; 
 Fri, 15 Jul 2022 04:34:32 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a170906769600b00722dceb3f8bsm1938719ejm.151.2022.07.15.04.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 04:34:32 -0700 (PDT)
Message-ID: <933db2a8-e2f2-589a-6794-3509b94b6957@redhat.com>
Date: Fri, 15 Jul 2022 13:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 6/8] block-backend: implement .change_aio_ctx in
 child_root
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-7-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220712211911.1302836-7-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> blk_root_change_aio_ctx() is very similar to blk_root_can_set_aio_ctx(),
> but implements a new transaction so that if all check pass, the new
> transaction's .commit will take care of changing the BlockBackend
> AioContext. blk_root_set_aio_ctx_commit() is the same as
> blk_root_set_aio_ctx().
>
> Note: bdrv_child_try_change_aio_context() is not called by
> anyone at this point.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-backend.c | 54 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index f425b00793..674eaaa2bf 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c

[...]

> @@ -2208,6 +2212,56 @@ int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,

[...]

> +static bool blk_root_change_aio_ctx(BdrvChild *child, AioContext *ctx,
> +                                    GSList **visited, Transaction *tran,
> +                                    Error **errp)
> +{
> +    BlockBackend *blk = child->opaque;
> +    BdrvStateBlkRootContext *s;
> +
> +    if (blk->allow_aio_context_change) {
> +        goto finish;
> +    }
> +
> +    /*
> +     * Only manually created BlockBackends that are not attached to anything
> +     * can change their AioContext without updating their user.
> +     */
> +    if (!blk->name || blk->dev) {
> +        /* TODO Add BB name/QOM path */
> +        error_setg(errp, "Cannot change iothread of active block backend");
> +        return false;
> +    }

Is the goto really necessary?  Or, rather, do you prefer this to 
something like

if (!blk->allow_aio_context_change) {
     /*
      * Manually created BlockBackends (those with a name) that are not
      * attached to anything can change their AioContext without updating
      * their user; return an error for others.
      */
     if (!blk->name || blk->dev) {
         ...
     }
}

If you prefer the goto, I’d at least rename the label to 
“change_context” or “allowed” or something.

Hanna

> +
> +finish:
> +    s = g_new(BdrvStateBlkRootContext, 1);
> +    *s = (BdrvStateBlkRootContext) {
> +        .new_ctx = ctx,
> +        .blk = blk,
> +    };
> +
> +    tran_add_tail(tran, &set_blk_root_context, s);

(Again, not a huge fan of this.)

> +    return true;
> +}
> +
>   static bool blk_root_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
>                                        GSList **ignore, Error **errp)
>   {


