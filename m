Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D5366AC0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 14:27:19 +0200 (CEST)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZBwr-0004JX-Jn
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 08:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lZBui-0003XX-3O
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lZBud-0000FF-Va
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 08:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619007896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ynjbl31vn+3aJlqR0qn4aIxucTzp5uaVUNCSz1XYac=;
 b=IKBrYvIEodn7iwf/CQQPKzh52QLhjdUE+yqp3EJROgwt71mXhTTdWfERXVw/bxVDjjhYdr
 aQ4PXn8Tu6HxpADuE74IpqxeaolRz0XszE3t7j4kCCtlhO1zbQWHuRgPFPvOGs6Yh5Ogvf
 zdbHGmwBlbjahscUzcmb49Oy2qkwTAo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-y5CrTVAMNFmjsxtTSmI8ww-1; Wed, 21 Apr 2021 08:24:55 -0400
X-MC-Unique: y5CrTVAMNFmjsxtTSmI8ww-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020a5d68ca0000b0290102982b78eeso12627970wrw.16
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 05:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Ynjbl31vn+3aJlqR0qn4aIxucTzp5uaVUNCSz1XYac=;
 b=Hy1yp/v2GlcllPSzUzUaPfbvkvWA54f3/UNJ9F/Oe6+ex7LiPmv46aIk06sQvPBjmn
 vobUNepr6/OfO8Q+Eh37Nm7lKsfXymWpuZfksDyIhKwaLBOdl7QvTxmhcY46P38vDhmi
 VOcHxXkK5qEwJ9dUZHdBX9xIu8eokjurAojqRXfuhXGqVTj53jtH64jXuv7zslYhNh9F
 QIXp3mCEj75V2rdwUNWGhkiPaZxUsbr3A49QCyn/hAV66wGKeOt0gNCx0XkPf8zgiHsG
 hGPtwnEY2fF/DMJ96FdI7v6m8MAfHaZZ4egb1gmEc7I3e7n1DsvCSbpSOCWbd/uLxSXN
 eY0A==
X-Gm-Message-State: AOAM532htE1s5+qH1JDM8fgc7ahr7gYFvyRoMy8uLXCqxPGYmHck53qG
 /A1ueuNmPvU7gBSjGRRlnf091oWDXHHoEvb/0Mnwpz5pcqhFcgm2C2g9loLbD6Jdn/U3vSNMJ0i
 74YL4diNbzbqNTDALHGtmnafS/7TI0sWE8/9sy9B/jJ+vFSh0YPPyBD22NyPf+YLh2Sc=
X-Received: by 2002:adf:d0cc:: with SMTP id z12mr27151925wrh.18.1619007893795; 
 Wed, 21 Apr 2021 05:24:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv96EN+9BJ4ZnJ3oGAryDVEbqDK6hPS0C7LTrVjQ6kDOYOtLN/WYB/+Ri14lRnLcKKFViAfQ==
X-Received: by 2002:adf:d0cc:: with SMTP id z12mr27151887wrh.18.1619007893377; 
 Wed, 21 Apr 2021 05:24:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y145sm1878558wmc.24.2021.04.21.05.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 05:24:52 -0700 (PDT)
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-9-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 8/8] block: do not take AioContext around reopen
Message-ID: <8074955a-df34-2aa9-cf2e-f7571eda389c@redhat.com>
Date: Wed, 21 Apr 2021 14:24:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-9-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/21 10:55, Emanuele Giuseppe Esposito wrote:
> Reopen needs to handle AioContext carefully due to calling
> bdrv_drain_all_begin/end.  By not taking AioContext around calls to
> bdrv_reopen_multiple, we can drop the function's release/acquire
> pair and the AioContext argument too.

So... I wrote this commit message and I cannot parse it anymore---much 
less relate it to the code in the patch.  This is a problem, but it 
doesn't mean that the patch is wrong.

bdrv_reopen_multiple does not have the AioContext argument anymore. 
It's not doing release/acquire either.  The relevant commit is commit 
1a63a90750 ("block: Keep nodes drained between reopen_queue/multiple", 
2017-12-22).  You're basically cleaning up after that code in the same 
way as patch 7: reopen functions take care of keeping the BDS quiescent, 
so there's nothing to synchronize on.

For the future, the important step you missed was to check your diff 
against the one that you cherry-picked from.  Then you would have 
noticed that 1) it's much smaller 2) one thing that is mentioned in the 
commit message ("drop the function's release/acquire pair and argument") 
is not needed anymore.

Paolo

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-backend.c |  4 ----
>   block/mirror.c        |  9 ---------
>   blockdev.c            | 19 ++++++-------------
>   3 files changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 413af51f3b..6fdc698e9e 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -2291,20 +2291,16 @@ int blk_commit_all(void)
>       BlockBackend *blk = NULL;
>   
>       while ((blk = blk_all_next(blk)) != NULL) {
> -        AioContext *aio_context = blk_get_aio_context(blk);
>           BlockDriverState *unfiltered_bs = bdrv_skip_filters(blk_bs(blk));
>   
> -        aio_context_acquire(aio_context);
>           if (blk_is_inserted(blk) && bdrv_cow_child(unfiltered_bs)) {
>               int ret;
>   
>               ret = bdrv_commit(unfiltered_bs);
>               if (ret < 0) {
> -                aio_context_release(aio_context);
>                   return ret;
>               }
>           }
> -        aio_context_release(aio_context);
>       }
>       return 0;
>   }
> diff --git a/block/mirror.c b/block/mirror.c
> index 5a71bd8bbc..43174bbc6b 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -631,7 +631,6 @@ static int mirror_exit_common(Job *job)
>       MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
>       BlockJob *bjob = &s->common;
>       MirrorBDSOpaque *bs_opaque;
> -    AioContext *replace_aio_context = NULL;
>       BlockDriverState *src;
>       BlockDriverState *target_bs;
>       BlockDriverState *mirror_top_bs;
> @@ -699,11 +698,6 @@ static int mirror_exit_common(Job *job)
>           }
>       }
>   
> -    if (s->to_replace) {
> -        replace_aio_context = bdrv_get_aio_context(s->to_replace);
> -        aio_context_acquire(replace_aio_context);
> -    }
> -
>       if (s->should_complete && !abort) {
>           BlockDriverState *to_replace = s->to_replace ?: src;
>           bool ro = bdrv_is_read_only(to_replace);
> @@ -740,9 +734,6 @@ static int mirror_exit_common(Job *job)
>           error_free(s->replace_blocker);
>           bdrv_unref(s->to_replace);
>       }
> -    if (replace_aio_context) {
> -        aio_context_release(replace_aio_context);
> -    }
>       g_free(s->replaces);
>       bdrv_unref(target_bs);
>   
> diff --git a/blockdev.c b/blockdev.c
> index e901107344..1672ef756e 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -3469,7 +3469,6 @@ void qmp_change_backing_file(const char *device,
>                                Error **errp)
>   {
>       BlockDriverState *bs = NULL;
> -    AioContext *aio_context;
>       BlockDriverState *image_bs = NULL;
>       Error *local_err = NULL;
>       bool ro;
> @@ -3480,37 +3479,34 @@ void qmp_change_backing_file(const char *device,
>           return;
>       }
>   
> -    aio_context = bdrv_get_aio_context(bs);
> -    aio_context_acquire(aio_context);
> -
>       image_bs = bdrv_lookup_bs(NULL, image_node_name, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
> -        goto out;
> +        return;
>       }
>   
>       if (!image_bs) {
>           error_setg(errp, "image file not found");
> -        goto out;
> +        return;
>       }
>   
>       if (bdrv_find_base(image_bs) == image_bs) {
>           error_setg(errp, "not allowing backing file change on an image "
>                            "without a backing file");
> -        goto out;
> +        return;
>       }
>   
>       /* even though we are not necessarily operating on bs, we need it to
>        * determine if block ops are currently prohibited on the chain */
>       if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_CHANGE, errp)) {
> -        goto out;
> +        return;
>       }
>   
>       /* final sanity check */
>       if (!bdrv_chain_contains(bs, image_bs)) {
>           error_setg(errp, "'%s' and image file are not in the same chain",
>                      device);
> -        goto out;
> +        return;
>       }
>   
>       /* if not r/w, reopen to make r/w */
> @@ -3518,7 +3514,7 @@ void qmp_change_backing_file(const char *device,
>   
>       if (ro) {
>           if (bdrv_reopen_set_read_only(image_bs, false, errp) != 0) {
> -            goto out;
> +            return;
>           }
>       }
>   
> @@ -3536,9 +3532,6 @@ void qmp_change_backing_file(const char *device,
>       if (ro) {
>           bdrv_reopen_set_read_only(image_bs, true, errp);
>       }
> -
> -out:
> -    aio_context_release(aio_context);
>   }
>   
>   void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
> 


