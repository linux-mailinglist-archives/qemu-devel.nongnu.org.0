Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926CC42528A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:08:04 +0200 (CEST)
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSBv-0000Gh-4h
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYS6x-0003Hb-JZ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:02:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYS6u-0004Fg-Pk
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633608172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JHW3u7AGavagY2Qou7XRiSadlO0b1LXflj0bdCZwIN4=;
 b=dH/pk5k1p6NPePPl3RCrF8bw4gv/t0xhCvJJEF+pILTlu6jWvFJsnnBGBBZT0H3+dLV0wI
 wGoUqgnaSWpBVmUFCfGRD11kHP27surZ4joHdYXzVQbeACWUehY3ff2e7MmhOvR8TbCPRp
 AC4WXVMirY+GcItnhFZX7KQs7vjqmE8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-dCfkd6AdPh2RJtn5HdyZNg-1; Thu, 07 Oct 2021 08:02:51 -0400
X-MC-Unique: dCfkd6AdPh2RJtn5HdyZNg-1
Received: by mail-ed1-f72.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so5655745edi.12
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JHW3u7AGavagY2Qou7XRiSadlO0b1LXflj0bdCZwIN4=;
 b=5HL1Eean/kJGzXPEfgw3HsaO1ClF9H4ab1CDgawAwn0C84FaSz/ldLUlHkUqB1UhmB
 86JzgWu88eICUaQg3HZnaahBMt3Y/Zi6yVWa7qIzqHXHfUtaDPo/ho80rg51keTILieH
 Kb+yJkNjWTAmyzpcgYkPFHL0yR6uWMt2krQnMkeT4s9tj8e8iXDHCB0080j3zZEumB0x
 VdeWz2lTHKA6L9ItQr/unHsjZ+lSHqT/Rugn8Xi7W4E5M2cip2oGU0PDx7ENW1/Bs4VE
 /rRPy/Beu8zeTQ+cMaa3BjnVSr5LCxhx3VW7FK0smDuuhyFKL0e0kNT7kMHEyRi+gM4o
 vs0g==
X-Gm-Message-State: AOAM533+TjaCkLNsUib6Kf+MSiit2hySTrko5AtLqYDxBogbXIBv9cXx
 NB4ImegRhahXd92KzUQcAjhQ7lHIfZcYdLtetKlmSFTePxk1n4PvhvtHosxdgBrJqCQR94oIVzX
 tZKdqr91BcEjokHI=
X-Received: by 2002:a05:6402:34cc:: with SMTP id
 w12mr5726678edc.340.1633608169813; 
 Thu, 07 Oct 2021 05:02:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy4gDrNt7dIjdO7U886SuvizqYvRvKPcFc8BNOfWZ5Famh1NUEbc8mQgpjiI7Yi3ejXBdysw==
X-Received: by 2002:a05:6402:34cc:: with SMTP id
 w12mr5726639edc.340.1633608169596; 
 Thu, 07 Oct 2021 05:02:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z4sm2662579edd.46.2021.10.07.05.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 05:02:49 -0700 (PDT)
Message-ID: <9a778b91-d175-8062-6783-740ba42c4321@redhat.com>
Date: Thu, 7 Oct 2021 14:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 08/25] block: introduce assert_bdrv_graph_writable
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-9-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211005143215.29500-9-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/21 16:31, Emanuele Giuseppe Esposito wrote:
> We want to be sure that the functions that write the child and
> parent list of a bs are either under BQL or drain.
> If this guarantee holds, then we can read the list also in the I/O APIs.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c                                | 5 +++++
>   block/io.c                             | 5 +++++
>   include/block/block_int-global-state.h | 8 +++++++-
>   3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index b912f517a4..7d1eb847a4 100644
> --- a/block.c
> +++ b/block.c
> @@ -2711,12 +2711,14 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>           if (child->klass->detach) {
>               child->klass->detach(child);
>           }
> +        assert_bdrv_graph_writable(old_bs);
>           QLIST_REMOVE(child, next_parent);
>       }
>   
>       child->bs = new_bs;
>   
>       if (new_bs) {
> +        assert_bdrv_graph_writable(new_bs);
>           QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>   
>           /*
> @@ -2917,6 +2919,7 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>           return ret;
>       }
>   
> +    assert_bdrv_graph_writable(parent_bs);
>       QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
>       /*
>        * child is removed in bdrv_attach_child_common_abort(), so don't care to
> @@ -3117,6 +3120,7 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
>   void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
>   {
>       g_assert(qemu_in_main_thread());
> +    assert_bdrv_graph_writable(parent);
>       if (child == NULL) {
>           return;
>       }
> @@ -4878,6 +4882,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
>       BdrvRemoveFilterOrCowChild *s = opaque;
>       BlockDriverState *parent_bs = s->child->opaque;
>   
> +    assert_bdrv_graph_writable(parent_bs);
>       QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
>       if (s->is_backing) {
>           parent_bs->backing = s->child;
> diff --git a/block/io.c b/block/io.c
> index 21dcc5d962..d184183b07 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -739,6 +739,11 @@ void bdrv_drain_all(void)
>       bdrv_drain_all_end();
>   }
>   
> +void assert_bdrv_graph_writable(BlockDriverState *bs)
> +{
> +    g_assert(qatomic_read(&bs->quiesce_counter) > 0 || qemu_in_main_thread());
> +}

Hmm, wait - I think this should be an "&&", not an OR?

Paolo

> +
>   /**
>    * Remove an active request from the tracked requests list
>    *
> diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
> index aad549cb85..a53ab146fc 100644
> --- a/include/block/block_int-global-state.h
> +++ b/include/block/block_int-global-state.h
> @@ -343,4 +343,10 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
>    */
>   void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
>   
> -#endif /* BLOCK_INT_GLOBAL_STATE*/
> +/**
> + * Make sure that the function is either running under
> + * drain, or under BQL.
> + */
> +void assert_bdrv_graph_writable(BlockDriverState *bs);
> +
> +#endif /* BLOCK_INT_GLOBAL_STATE */
> 


