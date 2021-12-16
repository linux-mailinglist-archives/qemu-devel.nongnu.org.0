Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3783477523
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:59:35 +0100 (CET)
Received: from localhost ([::1]:56244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxsEI-0003Zs-J0
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:59:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxsCT-0002Ty-Oe
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:57:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mxsCQ-00015T-Ge
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639666656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVrUpX32xaNzCZeJpiIM8e1Y+EvICxCHaNItmVQSAMw=;
 b=jBQKN6DPkVwSzPJVPN530BJn5Lmw00DznbiRQTD9c8FL8yrlXGhQrLxHnzHb+Ng8zYx4um
 BP8tzeOzrUGDmbBP1cUi/NheZ0P3feIbyZcaz1P90BV4rAwmwAVRktbOzn5YknMnFrU+td
 RQ8GKlfBGK4bDt29zuhVbpMSrhfiUec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-SYbvweDcMhmrGjpRuINigQ-1; Thu, 16 Dec 2021 09:57:35 -0500
X-MC-Unique: SYbvweDcMhmrGjpRuINigQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so2239741wrm.8
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 06:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IVrUpX32xaNzCZeJpiIM8e1Y+EvICxCHaNItmVQSAMw=;
 b=dO+n1imdnLuRCsDcYySVlPeXqEMjcvkDKWvgvyOTB5/GHRL+lw1TicShvnQH04At8g
 tVfxY3CJ/qfVUNY//JiU/BbzA0QbH3ouMSEb1rFOg0U5v9/zLzGLHHNn2aoY4tv3lm6J
 p1leVcPWZvV1SWHldVznabQxL4YAvUDsbGcTUAZUAyhz6WPnTL+6pGJbRWz5zIT5rBy/
 NkHHRz4IqVCHy3aCPAg0yrGFtk7w5T6p7nWR+WkQMxnPGOsq3d/XdgGEywwCoIOnaebr
 PxkVmRlVuAlGVs9QTrHkCG3Jbd8xqWIXhQVKt050+EmPGuEd888oHS7BlBiOn+3yTQ+c
 ZgIw==
X-Gm-Message-State: AOAM533qEakw3mnbdI6wI3wD2KmX7vTUJ2jlG6Vb/aIhYaXX33d5tmbC
 qjUkoA6UWj72NuSCWqtIyVcSWATIcFK0K7ziHYGtkzTPBhbWwWWjZLuedB43ZwD+EVKgPX7ROPj
 mqPci9ZU0Vg9yivE=
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr5360186wmj.45.1639666654311; 
 Thu, 16 Dec 2021 06:57:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQnqmU9HVrPjxFrAF4RjMJfuI5UTPbdz9KtYs2BCT3xDD2SDnEe5d2ldx+TeqyTrwMsG//mw==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr5360158wmj.45.1639666654108; 
 Thu, 16 Dec 2021 06:57:34 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j17sm6723435wmq.41.2021.12.16.06.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 06:57:33 -0800 (PST)
Message-ID: <f996c8cc-c025-f8a5-c89d-cd8b8a94e7c5@redhat.com>
Date: Thu, 16 Dec 2021 15:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 10/31] block.c: modify .attach and .detach callbacks of
 child_of_bds
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-11-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-11-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
> According to the assertions put in the previous patch, we should
> first drain and then modify the ->children list. In this way
> we prevent other iothreads to read the list while it is being
> updated.
>
> In this case, moving the drain won't cause any harm, because
> child is a parameter of the drain function so it will still be
> included in the operation, despite not being in the list.

Sounds good.

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/block.c b/block.c
> index 522a273140..5516c84ec4 100644
> --- a/block.c
> +++ b/block.c
> @@ -1416,6 +1416,7 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>   {
>       BlockDriverState *bs = child->opaque;
>   
> +    bdrv_apply_subtree_drain(child, bs);
>       assert_bdrv_graph_writable(bs);
>       QLIST_INSERT_HEAD(&bs->children, child, next);
>   
> @@ -1423,7 +1424,6 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>           bdrv_backing_attach(child);
>       }
>   
> -    bdrv_apply_subtree_drain(child, bs);

I think we should also remove the empty line above.

Hanna

>   }
>   
>   static void bdrv_child_cb_detach(BdrvChild *child)
> @@ -1434,10 +1434,9 @@ static void bdrv_child_cb_detach(BdrvChild *child)
>           bdrv_backing_detach(child);
>       }
>   
> -    bdrv_unapply_subtree_drain(child, bs);
> -
>       assert_bdrv_graph_writable(bs);
>       QLIST_REMOVE(child, next);
> +    bdrv_unapply_subtree_drain(child, bs);
>   }
>   
>   static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,


