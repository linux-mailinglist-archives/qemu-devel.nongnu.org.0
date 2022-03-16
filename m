Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8C44DAD57
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 10:19:05 +0100 (CET)
Received: from localhost ([::1]:38298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUPo8-0004ov-Cy
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 05:19:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUPly-0003ON-Dg
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:16:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUPlw-0002Fb-N8
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647422208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7y9rIzECF2jbKgH0FT9bIDLbO2lNXlqlZFLNDGYTa1k=;
 b=X7pvxC/Cxnupx43h0pbwq8ZtxPUwPefb7fONl6onmdptq96CQDlKV3TqTL6o/vsO/AXgSQ
 cXXVHQSJuwf08JiqawwvB8Xy5LXQyZJxtgFs/kheXjmF0erNkOYMFpyBZI2TNoO/RKAeoF
 QvCFV6bPIRWORu6qaPW6rVrTtgsQiQo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-B7BeNbmbPZqb460ktgik1A-1; Wed, 16 Mar 2022 05:16:47 -0400
X-MC-Unique: B7BeNbmbPZqb460ktgik1A-1
Received: by mail-qk1-f197.google.com with SMTP id
 h68-20020a376c47000000b0067e05dade89so1123365qkc.2
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 02:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7y9rIzECF2jbKgH0FT9bIDLbO2lNXlqlZFLNDGYTa1k=;
 b=wsgvLZFtavCb4/eAw2wY7IcPLcLeTzQoncUMJgyOm0ctsN2QHzTCLooqjcQz/OLyoD
 0fQ0GPS9aqw6Q3HVlx17ISRY2Ljezkk4Z4pDSyJzQWul8JvbZeG/fHY3UTs6zpkhEQMm
 v8VkTk7o0xzft2nasvy850icvozm4YPsbvdW+oEtP/DmS6ADK45vhazSxKpQ0u+1pqje
 WgSMam4W6pAwfIgvWgiBxIUS3tIyiTaSPSeUgA23jsUbpvrhuKuD0ZOPV/kIIJ+H5iQU
 pLgkmt6MmRPGR67XIdD68w4rtcqi5J6Ru2nNSdzvuHcXN8+5o8ZyOaGU/O+EUaU4aeSl
 p84g==
X-Gm-Message-State: AOAM533kvJ8rjlGS/IbPUqw9xH45MOKkQ7Yq9SNoOH0tXaJ6wEdFAemB
 DlOjcwOghxo9MdVriWfWgICWNfJVWczohUE5IqoXx3rrkZX8q0lHhyjmhch9ws8TtY0mS2LyDtK
 NOW5I+qv8EMie+hk=
X-Received: by 2002:a05:620a:2591:b0:67a:f1ef:cda3 with SMTP id
 x17-20020a05620a259100b0067af1efcda3mr20766069qko.656.1647422206827; 
 Wed, 16 Mar 2022 02:16:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM+bbGVGhnRk9v0kR0iZSxb8m5gIj3EDQvUZJztes2Uu+r14wgLi47JDQJlgWar0zNRa9lKQ==
X-Received: by 2002:a05:620a:2591:b0:67a:f1ef:cda3 with SMTP id
 x17-20020a05620a259100b0067af1efcda3mr20766055qko.656.1647422206577; 
 Wed, 16 Mar 2022 02:16:46 -0700 (PDT)
Received: from [192.168.149.119]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a05620a12ac00b0067d4bfffc59sm638016qki.118.2022.03.16.02.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 02:16:46 -0700 (PDT)
Message-ID: <c3fe0225-ee8d-6add-7fb9-ee6770b1288b@redhat.com>
Date: Wed, 16 Mar 2022 10:16:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 05/10] block.c: bdrv_replace_child_noperm: first call
 ->attach(), and then add child
To: qemu-block@nongnu.org
References: <20220314131854.2202651-1-eesposit@redhat.com>
 <20220314131854.2202651-6-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-6-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unfortunately this patch is not safe: theoretically ->attach can call
bdrv_apply_subtree_drain, and if it polls, will can call a bh that
for example reads the graph, finding it in an inconsistent state, since
it is between the two writes QLIST_INSERT_HEAD(&bs->children, child,
next); and QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);

Please ignore it.
This patch could eventually go in the subtree_drain serie, if we decide
to go in that direction.

Emanuele


Am 14/03/2022 um 14:18 schrieb Emanuele Giuseppe Esposito:
> Doing the opposite can make adding the child node to a non-drained node,
> as apply_subtree_drain is only done in ->attach() and thus make
> assert_bdrv_graph_writable fail.
> 
> This can happen for example during a transaction rollback (test 245,
> test_io_with_graph_changes):
> 1. a node is removed from the graph, thus it is undrained
> 2. then something happens, and we need to roll back the transactions
>    through tran_abort()
> 3. at this point, the current code would first attach the undrained node
>    to the graph via QLIST_INSERT_HEAD, and then call ->attach() that
>    will take care of restoring the drain with apply_subtree_drain(),
>    leaving the node undrained between the two operations.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/block.c b/block.c
> index d870ba5393..c6a550f9c6 100644
> --- a/block.c
> +++ b/block.c
> @@ -1434,6 +1434,11 @@ static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
>      *child_flags = flags;
>  }
>  
> +/*
> + * Add the child node to child->opaque->children list,
> + * and then apply the drain to the whole child subtree,
> + * so that the drain count matches with the parent.
> + */
>  static void bdrv_child_cb_attach(BdrvChild *child)
>  {
>      BlockDriverState *bs = child->opaque;
> @@ -2889,8 +2894,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>      }
>  
>      if (new_bs) {
> -        assert_bdrv_graph_writable(new_bs);
> -        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>  
>          /*
>           * Detaching the old node may have led to the new node's
> @@ -2901,12 +2904,19 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>          assert(new_bs->quiesce_counter <= new_bs_quiesce_counter);
>          drain_saldo += new_bs->quiesce_counter - new_bs_quiesce_counter;
>  
> -        /* Attach only after starting new drained sections, so that recursive
> -         * drain sections coming from @child don't get an extra .drained_begin
> -         * callback. */
> +        /*
> +         * First call ->attach() cb.
> +         * In child_of_bds case, add child to the parent
> +         * (child->opaque) ->children list and if
> +         * necessary add missing drains in the child subtree.
> +         */
>          if (child->klass->attach) {
>              child->klass->attach(child);
>          }
> +
> +        /* Then add child to new_bs->parents list */
> +        assert_bdrv_graph_writable(new_bs);
> +        QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>      }
>  
>      /*
> 


