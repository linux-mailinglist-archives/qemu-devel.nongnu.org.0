Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C04937E5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:03:14 +0100 (CET)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7oA-0003xn-1d
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:03:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7eF-0004GL-Dj; Wed, 19 Jan 2022 04:52:59 -0500
Received: from [2a00:1450:4864:20::32a] (port=38687
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7eD-0006VO-J7; Wed, 19 Jan 2022 04:52:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso6408680wmb.3; 
 Wed, 19 Jan 2022 01:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q0Z3bXNJ8unZaWMz/3l04voneeLb4jk9/1Qubs/4FKs=;
 b=KkTx8v0sLlfqGyL45kJyr3AYx3fzv0rtcboUMEYgEITK2mzQtE+dtX4+FumY6lpCC0
 LWQ4QB5CRC/ylcqh+BlWjGsawPwNubHRhjdC/kR3j4b1SyMO93vW5o5UCWTOZ7/AOHkF
 wgdsDDyNFk+yCzZoEYothtoVXKWrfpGH5SEiM+ou2x1vX3qrdFm4h94qh8RTSxl5ktRS
 wgQ8w8yz4znjADsOltiQEujbmc5MZO8+moFr8kX9DHlyMrQwDl1ZB3fTkFM9CP/qFcel
 vhRNK0gpcmrCMgAg0mgOzcoUZ1wwCX3b+hrY+8jhpJy8rUb6lA3QfJBziENG9jp+EqJV
 kcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q0Z3bXNJ8unZaWMz/3l04voneeLb4jk9/1Qubs/4FKs=;
 b=EWJsyjnDeVJiCs1yVhLCm4KynzGJTmAF1I0gMaQX7grPue4fmthtt2gK6q/MMHzAvB
 eSkzo0KGY9ItwxY/qpxeai8U2Bll8EJ6qY2AkwLYtsLGvxKbEtH1AWEMHJzmiNrWpnW9
 AsNtFnZuMD2NzpPzMdOBQlia6itwaAUvJK/CyWREyPfP+a6ZYVcYSMOEY0pC19rs0+D4
 H4zkWexMVnrV1fj/pc2NdKncYjIawJnOPzRsh9u6hU6644PnyZatM7BulsvA9mHKMHVC
 45gN5FV502uw/98OkzA73f5d5WkYiHafNX1hqJMhoWKaCHExJGA0Kcas7rePmZi6dY0G
 O4bA==
X-Gm-Message-State: AOAM531YEDCf7L4Dod7OD4e1MNuyqSVKUbLLwIo0p7rzvkYR3hI0ptPD
 kzvcpfvzptDQI1N4wVEoFik=
X-Google-Smtp-Source: ABdhPJyzw16aczUET8kobawq0UOZ/Gx20mZdEss83hCy4b508fGpm3mgJelldpiZMAF+Wya0oYRD3A==
X-Received: by 2002:a5d:64e8:: with SMTP id g8mr24850057wri.286.1642585975526; 
 Wed, 19 Jan 2022 01:52:55 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id z1sm16368203wrw.95.2022.01.19.01.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:52:55 -0800 (PST)
Message-ID: <1bd90b22-c8c6-3201-e26e-17fdb305eb19@redhat.com>
Date: Wed, 19 Jan 2022 10:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 07/12] block/io.c: introduce
 bdrv_subtree_drained_{begin/end}_unlocked
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-8-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220118162738.1366281-8-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 17:27, Emanuele Giuseppe Esposito wrote:
> Same as the locked version, but use BDRV_POLL_UNLOCKED

... We are going to add drains to all graph modifications, and they are 
generally performed without the AioContext lock taken.

Paolo

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/io.c               | 50 +++++++++++++++++++++++++++++-----------
>   include/block/block-io.h |  2 ++
>   2 files changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/block/io.c b/block/io.c
> index 5123b7b713..9d5167f64a 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -244,6 +244,7 @@ typedef struct {
>       bool begin;
>       bool recursive;
>       bool poll;
> +    bool unlock;
>       BdrvChild *parent;
>       bool ignore_bds_parents;
>       int *drained_end_counter;
> @@ -334,7 +335,7 @@ static bool bdrv_drain_poll_top_level(BlockDriverState *bs, bool recursive,
>   
>   static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
>                                     BdrvChild *parent, bool ignore_bds_parents,
> -                                  bool poll);
> +                                  bool poll, bool unlock);
>   static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
>                                   BdrvChild *parent, bool ignore_bds_parents,
>                                   int *drained_end_counter);
> @@ -352,7 +353,8 @@ static void bdrv_co_drain_bh_cb(void *opaque)
>           if (data->begin) {
>               assert(!data->drained_end_counter);
>               bdrv_do_drained_begin(bs, data->recursive, data->parent,
> -                                  data->ignore_bds_parents, data->poll);
> +                                  data->ignore_bds_parents, data->poll,
> +                                  data->unlock);
>           } else {
>               assert(!data->poll);
>               bdrv_do_drained_end(bs, data->recursive, data->parent,
> @@ -374,6 +376,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
>                                                   BdrvChild *parent,
>                                                   bool ignore_bds_parents,
>                                                   bool poll,
> +                                                bool unlock,
>                                                   int *drained_end_counter)
>   {
>       BdrvCoDrainData data;
> @@ -394,6 +397,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
>           .parent = parent,
>           .ignore_bds_parents = ignore_bds_parents,
>           .poll = poll,
> +        .unlock = unlock,
>           .drained_end_counter = drained_end_counter,
>       };
>   
> @@ -441,13 +445,13 @@ static void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
>   
>   static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
>                                     BdrvChild *parent, bool ignore_bds_parents,
> -                                  bool poll)
> +                                  bool poll, bool unlock)
>   {
>       BdrvChild *child, *next;
>   
>       if (qemu_in_coroutine()) {
>           bdrv_co_yield_to_drain(bs, true, recursive, parent, ignore_bds_parents,
> -                               poll, NULL);
> +                               poll, unlock, NULL);
>           return;
>       }
>   
> @@ -458,7 +462,7 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
>           bs->recursive_quiesce_counter++;
>           QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
>               bdrv_do_drained_begin(child->bs, true, child, ignore_bds_parents,
> -                                  false);
> +                                  false, false);
>           }
>       }
>   
> @@ -473,23 +477,35 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
>        */
>       if (poll) {
>           assert(!ignore_bds_parents);
> -        BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, recursive, parent));
> +        if (unlock) {
> +            BDRV_POLL_WHILE_UNLOCKED(bs,
> +                                     bdrv_drain_poll_top_level(bs, recursive,
> +                                                               parent));
> +        } else {
> +            BDRV_POLL_WHILE(bs,
> +                            bdrv_drain_poll_top_level(bs, recursive, parent));
> +        }
>       }
>   }
>   
>   void bdrv_drained_begin(BlockDriverState *bs)
>   {
> -    bdrv_do_drained_begin(bs, false, NULL, false, true);
> +    bdrv_do_drained_begin(bs, false, NULL, false, true, false);
>   }
>   
>   void bdrv_subtree_drained_begin(BlockDriverState *bs)
>   {
> -    bdrv_do_drained_begin(bs, true, NULL, false, true);
> +    bdrv_do_drained_begin(bs, true, NULL, false, true, false);
> +}
> +
> +void bdrv_subtree_drained_begin_unlocked(BlockDriverState *bs)
> +{
> +    bdrv_do_drained_begin(bs, true, NULL, false, true, true);
>   }
>   
>   void bdrv_drained_begin_no_poll(BlockDriverState *bs)
>   {
> -    bdrv_do_drained_begin(bs, false, NULL, false, false);
> +    bdrv_do_drained_begin(bs, false, NULL, false, false, false);
>   }
>   
>   /**
> @@ -517,7 +533,7 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
>   
>       if (qemu_in_coroutine()) {
>           bdrv_co_yield_to_drain(bs, false, recursive, parent, ignore_bds_parents,
> -                               false, drained_end_counter);
> +                               false, false, drained_end_counter);
>           return;
>       }
>       assert(bs->quiesce_counter > 0);
> @@ -561,12 +577,19 @@ void bdrv_subtree_drained_end(BlockDriverState *bs)
>       BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
>   }
>   
> +void bdrv_subtree_drained_end_unlocked(BlockDriverState *bs)
> +{
> +    int drained_end_counter = 0;
> +    bdrv_do_drained_end(bs, true, NULL, false, &drained_end_counter);
> +    BDRV_POLL_WHILE_UNLOCKED(bs, qatomic_read(&drained_end_counter) > 0);
> +}
> +
>   void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent)
>   {
>       int i;
>   
>       for (i = 0; i < new_parent->recursive_quiesce_counter; i++) {
> -        bdrv_do_drained_begin(child->bs, true, child, false, true);
> +        bdrv_do_drained_begin(child->bs, true, child, false, true, false);
>       }
>   }
>   
> @@ -651,7 +674,8 @@ void bdrv_drain_all_begin(void)
>       assert(qemu_in_main_thread());
>   
>       if (qemu_in_coroutine()) {
> -        bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, NULL);
> +        bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, false,
> +                               NULL);
>           return;
>       }
>   
> @@ -676,7 +700,7 @@ void bdrv_drain_all_begin(void)
>           AioContext *aio_context = bdrv_get_aio_context(bs);
>   
>           aio_context_acquire(aio_context);
> -        bdrv_do_drained_begin(bs, false, NULL, true, false);
> +        bdrv_do_drained_begin(bs, false, NULL, true, false, false);
>           aio_context_release(aio_context);
>       }
>   
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 34a991649c..a329ae24c1 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -253,6 +253,7 @@ void bdrv_drained_begin_no_poll(BlockDriverState *bs);
>    * exclusive access to all child nodes as well.
>    */
>   void bdrv_subtree_drained_begin(BlockDriverState *bs);
> +void bdrv_subtree_drained_begin_unlocked(BlockDriverState *bs);
>   
>   /**
>    * bdrv_drained_end:
> @@ -285,6 +286,7 @@ void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter);
>    * End a quiescent section started by bdrv_subtree_drained_begin().
>    */
>   void bdrv_subtree_drained_end(BlockDriverState *bs);
> +void bdrv_subtree_drained_end_unlocked(BlockDriverState *bs);
>   
>   bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
>                                        uint32_t granularity, Error **errp);


