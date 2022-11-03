Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E496618566
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:57:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdWC-0002Mq-OE; Thu, 03 Nov 2022 12:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdWA-0002Lp-Ma
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdW8-0006L9-Qt
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667494595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xJM6oHC6S2ZUjNxDMoqpVOgOTL7fj5e2hSqgg8/MXw=;
 b=ho7WZceLAJRq5V0AjnHCc2Nqc2vsoU6PDKbIphfwB7HnKqKioeNPPbyKl++4ENclYs6oUL
 fSP2vo5DPq8Vblsfopp339NfARkwkqsm2HLVzhq7XK2BQeKrFcl7wB8WA3w/e0D8ThdOli
 ZWGrwKpfAYdnds5ybG0irvluQwB0cEw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-NfZv4R1LMleb5thLR-GoJQ-1; Thu, 03 Nov 2022 12:56:34 -0400
X-MC-Unique: NfZv4R1LMleb5thLR-GoJQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 qf25-20020a1709077f1900b0078c02a23da3so1662193ejc.0
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2xJM6oHC6S2ZUjNxDMoqpVOgOTL7fj5e2hSqgg8/MXw=;
 b=q5490dSsAmJCg7ykd5KzyW2EYbhDvDF++fJBNn6m2CpVd0bBnovTfWWFeuSJYzVoGD
 agh8Ju2ZquY5n7ol7KMpMFwY/zN+MVcMN8BSSRlXp6PMBUzrqUzZP3579wN46gIIDlzz
 mnSYYZ8gitMUezEYgyZ+hcmMFoGeSuvE2r9ROkIpVwPukxLeBqOOYS/U7+380Q4UZtVG
 9xKUDBE2AtpX5x1VjnkZYriwgKTG9gpCseO2ZD64J2m+euzQ+yv/TZCY6QNS1bISDopt
 3GI876bWHKcCclC2Km8sfbZx8mcZtDK8yadiJekXVT6HKQ+Y3ooRRg6wMsdFiHZFHFhv
 Qkqw==
X-Gm-Message-State: ACrzQf2JFlR0tJa25XARFl5jqnlho5tvzTa45/lzx96iCkBhM5sVjK2a
 ZXRK/qxMszq9HL/Xz9+ioxwt9O4TvUCLdS+a8eHHYWFRnenLL7K7xmSLK4M3n+4g5D08Hfu3QLu
 gFpifds/tPVsKQes=
X-Received: by 2002:a05:6402:84d:b0:454:f41d:6ccf with SMTP id
 b13-20020a056402084d00b00454f41d6ccfmr31028250edz.129.1667494593233; 
 Thu, 03 Nov 2022 09:56:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4MDt8wogSTeZkWsurjFthIDhRaPKLY3VZVOFQY8zQKtCSpudNQHnU6zBrNSxhjbY1Y59wCAQ==
X-Received: by 2002:a05:6402:84d:b0:454:f41d:6ccf with SMTP id
 b13-20020a056402084d00b00454f41d6ccfmr31028210edz.129.1667494592845; 
 Thu, 03 Nov 2022 09:56:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 x20-20020a1709064a9400b0074136cac2e7sm702868eju.81.2022.11.03.09.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 09:56:31 -0700 (PDT)
Message-ID: <8f24c24c-ca61-108c-924b-39465a3c67fe@redhat.com>
Date: Thu, 3 Nov 2022 17:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-3-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221103134206.4041928-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 14:41, Emanuele Giuseppe Esposito wrote:
> block_copy_reset_unallocated and block_copy_is_cluster_allocated are
> only called by backup_run, a corotuine_fn itself.
> 
> Same applies to block_copy_block_status, called by
> block_copy_dirty_clusters.
> 
> Therefore mark them as coroutine too.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

They don't need to be coroutine_fn.  coroutine_fn is needed if you call 
another coroutine_fn, but not if you _are only called_ by coroutine_fn. 
There is nothing in these functions that needs them to be called from a 
coroutine.

The only exception is qemu_coroutine_yield(), which is the only leaf 
coroutine_fn.

Paolo

> ---
>   block/block-copy.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/block/block-copy.c b/block/block-copy.c
> index bb947afdda..f33ab1d0b6 100644
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -577,8 +577,9 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
>       return ret;
>   }
>   
> -static int block_copy_block_status(BlockCopyState *s, int64_t offset,
> -                                   int64_t bytes, int64_t *pnum)
> +static coroutine_fn int block_copy_block_status(BlockCopyState *s,
> +                                                int64_t offset,
> +                                                int64_t bytes, int64_t *pnum)
>   {
>       int64_t num;
>       BlockDriverState *base;
> @@ -613,8 +614,9 @@ static int block_copy_block_status(BlockCopyState *s, int64_t offset,
>    * Check if the cluster starting at offset is allocated or not.
>    * return via pnum the number of contiguous clusters sharing this allocation.
>    */
> -static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
> -                                           int64_t *pnum)
> +static int coroutine_fn block_copy_is_cluster_allocated(BlockCopyState *s,
> +                                                        int64_t offset,
> +                                                        int64_t *pnum)
>   {
>       BlockDriverState *bs = s->source->bs;
>       int64_t count, total_count = 0;
> @@ -669,8 +671,9 @@ void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
>    * @return 0 when the cluster at @offset was unallocated,
>    *         1 otherwise, and -ret on error.
>    */
> -int64_t block_copy_reset_unallocated(BlockCopyState *s,
> -                                     int64_t offset, int64_t *count)
> +int64_t coroutine_fn block_copy_reset_unallocated(BlockCopyState *s,
> +                                                  int64_t offset,
> +                                                  int64_t *count)
>   {
>       int ret;
>       int64_t clusters, bytes;


