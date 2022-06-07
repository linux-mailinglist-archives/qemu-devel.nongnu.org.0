Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9BB540378
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 18:11:30 +0200 (CEST)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nybnl-0000Ae-25
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 12:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nybbp-0008D0-0j
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 11:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nybbl-0002yn-7c
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 11:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654617543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMlpfL5Lhs2Pl6vQm9hTeV3gmyUgKH7he1s1m+zdDbQ=;
 b=HG9j0Hy/Fa4IFgGUr21HJ9fULnoOfjQ/Exzn7VO3ZtQwvr01dHCveIm7B+qwvVXsu3q3PG
 iIJzzy5FDDcsHUyc3kOKYiGC/f+CaXFgZR8RerVGFS2dzFBli03ry+/os4ka9UFUyrlI0e
 IIyDNIxW9ZTQ8+QY/Vtx37g9CEkThMY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-L3lkxS8PPnORI1bUMNvyzw-1; Tue, 07 Jun 2022 11:59:02 -0400
X-MC-Unique: L3lkxS8PPnORI1bUMNvyzw-1
Received: by mail-wm1-f72.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so1811815wmb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 08:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YMlpfL5Lhs2Pl6vQm9hTeV3gmyUgKH7he1s1m+zdDbQ=;
 b=pxJxssa4S0lVoZnObQl5CnJgZjRjMb8qgyp7ZoObA9ZmwCGwcEkd4UainS1KaJS4jr
 H3E0xHCNTlOffT6uogU1SJW9DANO7l5+pFPAprBYJWv7wdXFPYivvckK4GMoRfMYhyGD
 YCTz7IBcMwyOTXaUECgDLqTWvLqdoqCyzfQK/iSvIrZiW5snV6Scj3gsh44UAX5ATeKS
 defnePRUm4zkHc58JhfuJ72rlzNj6cScAOwfkIP+FykYezPl4nued7xSBDUHBPVWbSif
 n/EVd0Kn+b1y7Uanz+Hq32DgF2puoMScmdkeDquVPxO8OljtgXuZlUU1l64FBNA6IqIP
 twPg==
X-Gm-Message-State: AOAM531BzFkTMJa7FShGuhVAT/b779VjmBfEW/ty4IJsR5+6+40LS+zz
 AAj7b8oAEjM82MPgkbkq2YsWgpSEeOkilUWJkAOZndW0NAGk7PxywXNDMvTk+Cx+q01JLhXURD3
 GBoUAm9UU/gvBV/c=
X-Received: by 2002:a05:600c:4f96:b0:397:652a:69d0 with SMTP id
 n22-20020a05600c4f9600b00397652a69d0mr57806503wmq.16.1654617540998; 
 Tue, 07 Jun 2022 08:59:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze1Siq4J9BRCQ5ENJ7pZw2st9e9V2IQm9+ZINMDOGyKqFggRxxT4PY+D/jlh/ITCtGyBD4Ow==
X-Received: by 2002:a05:600c:4f96:b0:397:652a:69d0 with SMTP id
 n22-20020a05600c4f9600b00397652a69d0mr57806477wmq.16.1654617540701; 
 Tue, 07 Jun 2022 08:59:00 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a5d6711000000b00218453adaefsm4424560wru.101.2022.06.07.08.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 08:59:00 -0700 (PDT)
Message-ID: <4c9c40f0-07bb-5526-fe9d-1711742dd195@redhat.com>
Date: Tue, 7 Jun 2022 17:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 14/45] block/snapshot: drop indirection around
 bdrv_snapshot_fallback_ptr
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-15-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-15-vsementsov@openvz.org>
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
> Now the indirection is not actually used, we can safely reduce it to
> simple pointer.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/snapshot.c | 39 +++++++++++++++++----------------------
>   1 file changed, 17 insertions(+), 22 deletions(-)

Looks good, just wondering whether we should drop some of the "_ptr" 
suffixes now.

> diff --git a/block/snapshot.c b/block/snapshot.c
> index 02a880911f..4eb9258de6 100644
> --- a/block/snapshot.c
> +++ b/block/snapshot.c
> @@ -151,34 +151,29 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
>   }
>   
>   /**
> - * Return a pointer to the child BDS pointer to which we can fall
> + * Return a pointer to child of given BDS to which we can fall
>    * back if the given BDS does not support snapshots.
>    * Return NULL if there is no BDS to (safely) fall back to.
> - *
> - * We need to return an indirect pointer because bdrv_snapshot_goto()
> - * has to modify the BdrvChild pointer.
>    */
> -static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
> +static BdrvChild *bdrv_snapshot_fallback_ptr(BlockDriverState *bs)

The _ptr part was meant to point out that it returns an indirect 
pointer; maybe we should name it bdrv_snapshot_fallback_child() now?

>   {
> -    BdrvChild **fallback;
> -    BdrvChild *child = bdrv_primary_child(bs);
> +    BdrvChild *fallback = bdrv_primary_child(bs);
> +    BdrvChild *child;
>   
>       /* We allow fallback only to primary child */
> -    if (!child) {
> +    if (!fallback) {
>           return NULL;
>       }
> -    fallback = (child == bs->file ? &bs->file : &bs->backing);
> -    assert(*fallback == child);
>   
>       /*
>        * Check that there are no other children that would need to be
>        * snapshotted.  If there are, it is not safe to fall back to
> -     * *fallback.
> +     * fallback.
>        */
>       QLIST_FOREACH(child, &bs->children, next) {
>           if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
>                              BDRV_CHILD_FILTERED) &&
> -            child != *fallback)
> +            child != fallback)
>           {
>               return NULL;
>           }
> @@ -189,8 +184,8 @@ static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
>   
>   static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *bs)
>   {
> -    BdrvChild **child_ptr = bdrv_snapshot_fallback_ptr(bs);

Just "child" is enough (and better) now, I think.

> -    return child_ptr ? (*child_ptr)->bs : NULL;
> +    BdrvChild *child_ptr = bdrv_snapshot_fallback_ptr(bs);
> +    return child_ptr ? child_ptr->bs : NULL;
>   }
>   
>   int bdrv_can_snapshot(BlockDriverState *bs)


