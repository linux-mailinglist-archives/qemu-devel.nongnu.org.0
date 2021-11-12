Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4DA44E91C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 15:43:36 +0100 (CET)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlXmA-00055m-RJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 09:43:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlXjX-0003b3-Ur
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 09:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlXjT-0003UY-Ku
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 09:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636728046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkoeBCEl0r8G+zMBD6O9UO2bqizAofqJG/DsTDaMSjo=;
 b=LADgXl/eYu7fNUyhboWoaqXUolpGuuWoapL991xwlRVFogpHygJQY9tXrNh8YGSYVW88rU
 6hMPbEDm8KApudceqYoZuBxi95RFSIX0LfQbXR2LzFU3cPPp9OCukYHgjG5+ekQ+yyFJmk
 h+LtNGCN7FduC0cR9s2aY5nMN2lR9bM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-4Ldie3BwPJWQYnBYQ06qKw-1; Fri, 12 Nov 2021 09:40:43 -0500
X-MC-Unique: 4Ldie3BwPJWQYnBYQ06qKw-1
Received: by mail-wr1-f70.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so1592388wrb.2
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 06:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DkoeBCEl0r8G+zMBD6O9UO2bqizAofqJG/DsTDaMSjo=;
 b=Y48lWDju/HiWr/dvev7RawkUbCFxaMLKM9zSmVcloFmJJ9ItbiF8k9wNF1cElfEZsd
 Uw0/r7+MOCthBfcA427QGqsJO4QGVYEW5Lq2jYSc6manntFxAhS/HNhuBOnLA85DtyS+
 CZKsOLrRvribUkSKNs00Ry1ZNXLnYc1aJ2XbBhqkGV0OoOv5Frwp7XMPBBV+UuWyZFxU
 QdwXiUvdAWsmKFtfmYWMfUlP0POJTXsNQ2jA9LjHrsSF9VilxnT+YwoIZ0AKCeOOcO+h
 Zr4tnu0v28aPFA6V170rjWALCeoVBvKxaE6s0TUPAg1wwo/ZEb6xhwDaZfUnvJbgdCl+
 1qrA==
X-Gm-Message-State: AOAM531FHXmHO13knzhTkf31vf1IQ4r7u363eLFSBeMQ+zNxN5alq6MD
 tERiyMaHvE5A4i5qLUNgim40bMUPJGdxwrcqHS0rGo+JKo4OEogHjpktGh9Azb4FAw/RcZ4bkNF
 uEHhG8nd5bAnfpNI=
X-Received: by 2002:a1c:8:: with SMTP id 8mr17804699wma.106.1636728041959;
 Fri, 12 Nov 2021 06:40:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhKnPY5p/BP7+BsAKCgUIHgYN0+8B9cYsx1hMQC8FEXP5BueyuNRiuXSPWWcMNrnly34bwLQ==
X-Received: by 2002:a1c:8:: with SMTP id 8mr17804643wma.106.1636728041664;
 Fri, 12 Nov 2021 06:40:41 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id v7sm5721716wrq.25.2021.11.12.06.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 06:40:41 -0800 (PST)
Message-ID: <734073bb-80e6-3caf-d6b5-c8f2ade86044@redhat.com>
Date: Fri, 12 Nov 2021 15:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 08/25] block: introduce assert_bdrv_graph_writable
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-9-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-9-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> We want to be sure that the functions that write the child and
> parent list of a bs are under BQL and drain.
>
> BQL prevents from concurrent writings from the GS API, while
> drains protect from I/O.
>
> TODO: drains are missing in some functions using this assert.
> Therefore a proper assertion will fail. Because adding drains
> requires additional discussions, they will be added in future
> series.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c                                |  5 +++++
>   block/io.c                             | 11 +++++++++++
>   include/block/block_int-global-state.h | 10 +++++++++-
>   3 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/block.c b/block.c
> index 41c5883c5c..94bff5c757 100644
> --- a/block.c
> +++ b/block.c
> @@ -2734,12 +2734,14 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>           if (child->klass->detach) {
>               child->klass->detach(child);
>           }
> +        assert_bdrv_graph_writable(old_bs);
>           QLIST_REMOVE(child, next_parent);

I think this belongs above the .detach() call (and the QLIST_REMOVE() 
belongs into the .detach() implementation, as done in 
https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00240.html, 
which has been merged to Kevin’s block branch).

>       }
>   
>       child->bs = new_bs;
>   
>       if (new_bs) {
> +        assert_bdrv_graph_writable(new_bs);
>           QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);

In both these places it’s a bit strange that the assertion is done on 
the child nodes.  The subgraph starting from them isn’t modified after 
all, so their subgraph technically doesn’t need to be writable.  I think 
a single assertion on the parent node would be preferable.

I presume the problem with that is that we don’t have the parent node 
here?  Do we need a new BdrvChildClass method that performs this 
assertion on the parent node?

>   
>           /*
> @@ -2940,6 +2942,7 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>           return ret;
>       }
>   
> +    assert_bdrv_graph_writable(parent_bs);
>       QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
>       /*
>        * child is removed in bdrv_attach_child_common_abort(), so don't care to
> @@ -3140,6 +3143,7 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
>   void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
>   {
>       assert(qemu_in_main_thread());
> +    assert_bdrv_graph_writable(parent);

It looks to me like we have this assertion mainly because 
bdrv_replace_child_noperm() doesn’t have a pointer to this parent node.  
It’s a workaround, but we should have this in every path that eventually 
ends up at bdrv_replace_child_noperm(), and that seems rather difficult 
for the bdrv_replace_node() family of functions. That to me sounds like 
it’d be good to have this as a BdrvChildClass function.

>       if (child == NULL) {
>           return;
>       }
> @@ -4903,6 +4907,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
>       BdrvRemoveFilterOrCowChild *s = opaque;
>       BlockDriverState *parent_bs = s->child->opaque;
>   
> +    assert_bdrv_graph_writable(parent_bs);
>       QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
>       if (s->is_backing) {
>           parent_bs->backing = s->child;
> diff --git a/block/io.c b/block/io.c
> index f271ab3684..1c71e354d6 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -740,6 +740,17 @@ void bdrv_drain_all(void)
>       bdrv_drain_all_end();
>   }
>   
> +void assert_bdrv_graph_writable(BlockDriverState *bs)
> +{
> +    /*
> +     * TODO: this function is incomplete. Because the users of this
> +     * assert lack the necessary drains, check only for BQL.
> +     * Once the necessary drains are added,
> +     * assert also for qatomic_read(&bs->quiesce_counter) > 0
> +     */
> +    assert(qemu_in_main_thread());
> +}
> +
>   /**
>    * Remove an active request from the tracked requests list
>    *
> diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
> index d08e80222c..6bd7746409 100644
> --- a/include/block/block_int-global-state.h
> +++ b/include/block/block_int-global-state.h
> @@ -316,4 +316,12 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
>    */
>   void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
>   
> -#endif /* BLOCK_INT_GLOBAL_STATE*/
> +/**
> + * Make sure that the function is either running under
> + * drain and BQL. The latter protects from concurrent writings

“either ... and” sounds wrong to me.  I’d drop the “either” or say 
“running under both drain and BQL”.

Hanna

> + * from the GS API, while the former prevents concurrent reads
> + * from I/O.
> + */
> +void assert_bdrv_graph_writable(BlockDriverState *bs);
> +
> +#endif /* BLOCK_INT_GLOBAL_STATE */


