Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA62542F3E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 13:33:59 +0200 (CEST)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nytwj-0005f1-L0
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 07:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nytqo-0002ba-Sf
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:27:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nytql-0001TR-Op
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654687666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eAsvzzX08PZj7jFd2mM+vhJk8dfuzNH4ajNg4EYOH9o=;
 b=eSwXHEtTTsVrbk/Mo8U2CVFmpJsU+gVEQvtEMkedEBzLIr35w/NorpiStWmMWHPjXsyGOP
 wcXomlDZTrUZzP38pdWOZLnrPQbyn2Ih1OStCTYBYiTj9i7R4dOXxjJov5xwNcVQ11jqC/
 7IiH4j0JJ8GgtXuRZSH39/fpcfz8PaM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-sgZ_BUj0PCyOBIorKxLvEw-1; Wed, 08 Jun 2022 07:27:45 -0400
X-MC-Unique: sgZ_BUj0PCyOBIorKxLvEw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m18-20020adff392000000b0021848a78a53so2186436wro.19
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 04:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eAsvzzX08PZj7jFd2mM+vhJk8dfuzNH4ajNg4EYOH9o=;
 b=cXKkqjwUsTg6jDDo6bI6SNKinNwQVRltavjR3KO+3bzWhFVhkFisxkzoIQY8+/StNe
 y8s0xu2NWUoaJbNT5PXMxEenDN3BFzf7DFbk/wTRdoVaz1Evmd9Nqi+q7JeNvZFkiEW2
 /F+CAGNWYgy5vV6sB/LqfSUunUw1yaGxRP7+euUMM8SblSAOkz45fNKNsSUOtA8M6THs
 SutC2WrwYYXBkNEIOUhW126UH2jv3Bg3rq3QyADAFIVaeAgTP1nMxMPHFAsNuv5DvVZA
 j4TSjf+RGG8Uq+NnOCQWZXUldD5X648QnhV83RbnscGKppeagW0vJB+iZraaVtI1MrIl
 n4Rw==
X-Gm-Message-State: AOAM531hvSxvXx1L7pucnqmQZ34k3MR8JTKWwq8XeJ7UQCemcFCL0r+y
 e6AO1FXJsuA5bhzx5GgMSbJXIQvYLPRZieBBsNx1EfqBnaIKq05OrGsReiu5OLR3VFiz8TXuvMQ
 Tx38IbU37YTdXhFc=
X-Received: by 2002:a05:6000:15c6:b0:216:7615:f00d with SMTP id
 y6-20020a05600015c600b002167615f00dmr22152648wry.327.1654687663934; 
 Wed, 08 Jun 2022 04:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSxa7S/xQs0+E7IMhzFTr4Jf+TS8m8cauhqW5hPv3nRt2CZVh3NDdfwAihczXG12VwP6aE5A==
X-Received: by 2002:a05:6000:15c6:b0:216:7615:f00d with SMTP id
 y6-20020a05600015c600b002167615f00dmr22152621wry.327.1654687663670; 
 Wed, 08 Jun 2022 04:27:43 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d6a8d000000b0020c5253d8f7sm20844252wru.67.2022.06.08.04.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 04:27:43 -0700 (PDT)
Message-ID: <d4595686-6cda-56ec-bf0e-e3a9a9ef0d9e@redhat.com>
Date: Wed, 8 Jun 2022 13:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 19/45] block: refactor bdrv_list_refresh_perms to allow
 any list of nodes
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-20-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-20-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> We are going to increase usage of collecting nodes in a list to then
> update, and calling bdrv_topological_dfs() each time is not convenient,
> and not correct as we are going to interleave graph modifying with
> filling the node list.
>
> So, let's switch to a function that takes any list of nodes, adds all
> their subtrees and do topological sort. And finally, refresh
> permissions.
>
> While being here, make the function public, as we'll want to use it
> from blockdev.c in near future.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block.c | 51 ++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 19 deletions(-)
>
> diff --git a/block.c b/block.c
> index f3ed351360..9009f73534 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -2510,6 +2514,24 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
>       return 0;
>   }
>   
> +/*
> + * @list is any list of nodes. List is completed by all subtreees and

*subtrees

With that fixed:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> + * topologically sorted. It's not a problem if some node occurs in the @list
> + * several times.
> + */
> +static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
> +                                   Transaction *tran, Error **errp)
> +{
> +    g_autoptr(GHashTable) found = g_hash_table_new(NULL, NULL);
> +    g_autoptr(GSList) refresh_list = NULL;
> +
> +    for ( ; list; list = list->next) {
> +        refresh_list = bdrv_topological_dfs(refresh_list, found, list->data);
> +    }
> +
> +    return bdrv_do_refresh_perms(refresh_list, q, tran, errp);
> +}
> +


