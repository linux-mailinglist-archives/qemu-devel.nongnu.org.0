Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D587E4DAD4F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 10:16:40 +0100 (CET)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUPln-0002B9-DE
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 05:16:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUPj8-0000uX-MZ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:13:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUPj5-0001g6-Sh
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647422030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eirLEtthy7ZpN4InfG/Q64J+a+dw3cy5ojo07nAqGcs=;
 b=PuswNYyCyY7QfnhNZdNaNhxfYgUDUrWJAuXIMMXQiUW/gch5JCtgsP1oqqipRtCVFbMF3t
 wDQJbts1ysx3zEU7dW77+1TbX1Lq99g2ksUV/5ExhhqVl/j5MBY/dDF0i20Du4HBYt9XmP
 298OdCp94M7xO8U6KsGIOtLsNwVzMNU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-6UqpMmHHNkSv2Mv3ZZf96Q-1; Wed, 16 Mar 2022 05:13:49 -0400
X-MC-Unique: 6UqpMmHHNkSv2Mv3ZZf96Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 f11-20020a05620a20cb00b0067b3fedce10so1086332qka.15
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 02:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eirLEtthy7ZpN4InfG/Q64J+a+dw3cy5ojo07nAqGcs=;
 b=57XqBN7ZfIN4j3ZnLQSY9LYqV7JaftHyZ+ZttuD7iYWBM2AjCxOgtyldQ/uWWITnPP
 NJRwhTWz1JEekS0kEly6Paix2d+bQ+ZucRQMhl/1aX3Oovgy/Obgrqk4KJ+XHJTe7yfF
 7Wj0nLxRH+rcrN4/AqbVFUwYekvCd/adww6LpKg8ateIiW+rsWX+erwcVKmf+Kj/cFod
 qgN8udm9jXO/+2A7pnkTb2+Cx2ZEzugFm3B9/isfA4G3oVmkHlP6roTOvufc7k19lGR/
 mhGMLDPJlYVbF5CNTy57GaHBA5oMETEV2fG4EfOyRV+dztTj6IoaHuakVGlTQGHjkgUm
 z7SA==
X-Gm-Message-State: AOAM531xq0AhMcYw5NUHOUagEtgSfLlAHBbpWLchJhc7+0ECcnJrd+eg
 zJEELF+yyAOk3W8fEFG5E4GOGunJvPstU07uyprbSAfCtT3XU3CniGQrQ0Xh1yO8VXBXjcIOEQj
 a7E3qohm9OuGMdB8=
X-Received: by 2002:ac8:5bd6:0:b0:2e1:c841:35f6 with SMTP id
 b22-20020ac85bd6000000b002e1c84135f6mr15273385qtb.120.1647422028989; 
 Wed, 16 Mar 2022 02:13:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFCKblJbc6/fHVQgHX4PwDQE+tONp/4pvl+PZhRE/NjbGXwihufwxWld1zNRJxMzf/1ZZ9Rg==
X-Received: by 2002:ac8:5bd6:0:b0:2e1:c841:35f6 with SMTP id
 b22-20020ac85bd6000000b002e1c84135f6mr15273371qtb.120.1647422028755; 
 Wed, 16 Mar 2022 02:13:48 -0700 (PDT)
Received: from [192.168.149.119]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm1010835qtw.65.2022.03.16.02.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 02:13:48 -0700 (PDT)
Message-ID: <919a7e95-984c-8684-de39-53dfd5e133a8@redhat.com>
Date: Wed, 16 Mar 2022 10:13:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 04/10] block.c: bdrv_replace_child_noperm: first remove
 the child, and then call ->detach()
To: qemu-block@nongnu.org
References: <20220314131854.2202651-1-eesposit@redhat.com>
 <20220314131854.2202651-5-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-5-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

Unfortunately this patch is not safe: theoretically ->detach can call
bdrv_unapply_subtree_drain, and if it polls, will can call a bh that
for example reads the graph, finding it in an inconsistent state, since
it is between the two writes QLIST_REMOVE(child, next_parent); and
QLIST_REMOVE(child, next);

Please ignore it.
This patch could eventually go in the subtree_drain serie, if we decide
to go in that direction.

Emanuele

Am 14/03/2022 um 14:18 schrieb Emanuele Giuseppe Esposito:
> Doing the opposite can make ->detach() (more precisely
> bdrv_unapply_subtree_drain() in bdrv_child_cb_detach) undo the subtree_drain
> just performed to protect the removal of the child from the graph,
> thus making the fully-enabled assert_bdrv_graph_writable fail.
> 
> Note that assert_bdrv_graph_writable is not yet fully enabled.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 372f16f4a0..d870ba5393 100644
> --- a/block.c
> +++ b/block.c
> @@ -1448,6 +1448,11 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>      bdrv_apply_subtree_drain(child, bs);
>  }
>  
> +/*
> + * Unapply the drain in the whole child subtree, as
> + * it has been already detached, and then remove from
> + * child->opaque->children.
> + */
>  static void bdrv_child_cb_detach(BdrvChild *child)
>  {
>      BlockDriverState *bs = child->opaque;
> @@ -2864,14 +2869,18 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>      }
>  
>      if (old_bs) {
> -        /* Detach first so that the recursive drain sections coming from @child
> -         * are already gone and we only end the drain sections that came from
> -         * elsewhere. */
> +        /* First remove child from child->bs->parents list */
> +        assert_bdrv_graph_writable(old_bs);
> +        QLIST_REMOVE(child, next_parent);
> +        /*
> +         * Then call ->detach() cb.
> +         * In child_of_bds case, update the child parent
> +         * (child->opaque) ->children list and
> +         * remove any drain left in the child subtree.
> +         */
>          if (child->klass->detach) {
>              child->klass->detach(child);
>          }
> -        assert_bdrv_graph_writable(old_bs);
> -        QLIST_REMOVE(child, next_parent);
>      }
>  
>      child->bs = new_bs;
> 


