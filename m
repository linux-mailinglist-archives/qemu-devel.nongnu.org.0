Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C85480E9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 09:54:55 +0200 (CEST)
Received: from localhost ([::1]:33568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0euT-0002np-VI
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 03:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o0emg-0000wI-RL
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 03:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o0eme-0001jF-3b
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 03:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655106404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4ZM8Zlqyp10xdHik+0x7DFJpN6PcMMu7zvrR9LGBy0=;
 b=J/TivGLr532PRRF+hqnCcZWpYQRCYJSp1RJeBUug4dYoNd0nMsiLAKY4guELT9Qjz8YtUU
 Wdyk+T4BajomXQ/1lVCr6pL9+glkrpWB5XdFhoMKmn8Hyn9e3TXjBoc6Riuscre3qewP1k
 FDPA1v9ItSJ0YXVTQBjaLA+sG+TN4cU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-qy3lt8XFPXWctYxky-gIkw-1; Mon, 13 Jun 2022 03:46:43 -0400
X-MC-Unique: qy3lt8XFPXWctYxky-gIkw-1
Received: by mail-ed1-f72.google.com with SMTP id
 eh10-20020a0564020f8a00b0042dd9bf7c57so3451832edb.17
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 00:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O4ZM8Zlqyp10xdHik+0x7DFJpN6PcMMu7zvrR9LGBy0=;
 b=xqnVFs5NkWKcDVVjbuG87hwvvsRWaSTuk5q7qg9AVOXU86o65MYrNB6qOqLR5J29rS
 yNeZRrsgi6Kqc9ByKwX4N6U4NJUoihT7Yjs0YVk2CdV8VgaOiFzXqQc1h5uNHAMM9Dgl
 k0sX0Y9xCugXCpNSmnRJ9M7c76U16TikpSKuBR45uxsqJ2IsKnh5QH2BPp6ZJZdtOwkt
 0WOeTg9XnwShA28vfBSVOGuijXNczVocWGhhEIY8IRP+pmNukJIC59x2IZzOFc6oyNjN
 TkpQQF9cHDpVmzIXSWPrZ9c4CZ3nBcznN7USSq9IKOEl3dAy9Lg8Y1rf42JcblTNV5ap
 VhDQ==
X-Gm-Message-State: AOAM530hY2Z6SD7UkOqKMPLspRtokbmjtfPIAXerPcKsaBm8kRAam2Rs
 nOpfF5E5RBPzIPNDEpIushbFZx7yfoIp/v/ZFnWCrGzugXk/IYznv12OcUZPXsI8XSOtDG18mRb
 /0pjty8t3iVjgPjk=
X-Received: by 2002:a17:906:5959:b0:710:c2e8:79f3 with SMTP id
 g25-20020a170906595900b00710c2e879f3mr42175350ejr.489.1655106401835; 
 Mon, 13 Jun 2022 00:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLChZ+C+lbw/PAkX8rbvElFSCqrvS9BFxnKdFxnhOXpjPuF9FL8YXo6C5ed3DK5kGr8KBnBg==
X-Received: by 2002:a17:906:5959:b0:710:c2e8:79f3 with SMTP id
 g25-20020a170906595900b00710c2e879f3mr42175334ejr.489.1655106401606; 
 Mon, 13 Jun 2022 00:46:41 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 bq15-20020a056402214f00b0042ab2127051sm4395910edb.64.2022.06.13.00.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 00:46:40 -0700 (PDT)
Message-ID: <80b132a2-bf15-4335-c8fa-048d2b7a83ec@redhat.com>
Date: Mon, 13 Jun 2022 09:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 21/45] block: add bdrv_try_set_aio_context_tran
 transaction action
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-22-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-22-vsementsov@openvz.org>
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

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> To be used in further commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>
> diff --git a/block.c b/block.c
> index be19964f89..1900cdf277 100644
> --- a/block.c
> +++ b/block.c
> @@ -2907,6 +2907,54 @@ static void bdrv_child_free(BdrvChild *child)
>       g_free(child);
>   }
>   
> +typedef struct BdrvTrySetAioContextState {
> +    BlockDriverState *bs;
> +    AioContext *old_ctx;
> +} BdrvTrySetAioContextState;
> +
> +static void bdrv_try_set_aio_context_abort(void *opaque)
> +{
> +    BdrvTrySetAioContextState *s = opaque;
> +
> +    if (bdrv_get_aio_context(s->bs) != s->old_ctx) {
> +        bdrv_try_set_aio_context(s->bs, s->old_ctx, &error_abort);

As far as I understand, users of this transaction will need to do a bit 
of AioContext lock shuffling: To set the context, they need to hold 
old_ctx, but not new_ctx; but in case of abort, they need to release 
old_ctx and acquire new_ctx before the abort handlers are called.  (Due 
to the constraints on bdrv_set_aio_context_ignore().)

If that’s true, I think that should be documented somewhere.

> +    }
> +}
> +


