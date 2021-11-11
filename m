Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592144DA8C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:34:38 +0100 (CET)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlD25-0003vF-4L
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:34:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlD0R-0002Ly-2Z
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:32:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlD0N-0005dN-O9
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636648370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdpGhlHD6mpuI2KFWCAG4NrEQDtoJZI9RM6vjLqecho=;
 b=BYq9oOLLioBAjX2O+9DJaIdNllNoyn4lVcJXl/iZL/saws9rXKhYTHLux1r9GRcwhLLVQB
 Oa8YELdIFPCVNcEd8GGDwaeDcMyiX+/tlUBlVnapri5Rx0WMMEHP+n2cQPM62dun4jk4Zk
 D+v1sXkG18ygnBe+8XkQJRH2PgIZdaA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-tyrbFBk3OzaxuUBJnQoImQ-1; Thu, 11 Nov 2021 11:32:49 -0500
X-MC-Unique: tyrbFBk3OzaxuUBJnQoImQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so2957987wmj.7
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 08:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YdpGhlHD6mpuI2KFWCAG4NrEQDtoJZI9RM6vjLqecho=;
 b=Kf73xu6tQbA1gTdkVl0wap5Zrbq8frJ2y7Cm8CcQlKVhYEW/CL9G0me61bod9ImPqi
 aj2E6eQU8P4bmTSzMWj87ReyNk+pOx/+NN1jfmQFrwuSEOq4ZGpQrtIwo3OVk8xaMJPB
 xdxjyXG/ux55kKIcW/4SjYQZvn13oOTJ82yRfCXLeJI3NITF7HVMyJepbbIoLURNMBl0
 NCbJdrh97lw+NZyh1ac1JdyEw2BuaN/E6hTPmZyGl4qSWmHWcikS/1G28cmTchr/adfD
 yD6nBktvqY6UFUT8twY+R0/cd7mf37CNCyeTZNQCppT/Ep+oL1cPyWknhz3+n8wtfDBP
 rm/g==
X-Gm-Message-State: AOAM530wZydEGdxfW/LfqeyaekUOwzbx4bgMLQB0i6qDfj577oNi9M+T
 hZOuZzH/0FD5awoEguxOvL5HBj0/PoAv0dwb/jrvqwtKzEQEaWU3WVfgiTGj/sSO7P0qfJefx12
 2BA7u1ujD0GVQVdA=
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr26275627wmc.58.1636648368021; 
 Thu, 11 Nov 2021 08:32:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyltdmHHZ9eq6/JRFf/HkH392DPLatSj4Ext4u5avsZ00o2xuN60R7yiKku8mI/w1vcVOkmGQ==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr26275584wmc.58.1636648367782; 
 Thu, 11 Nov 2021 08:32:47 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j17sm4000162wmq.41.2021.11.11.08.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 08:32:47 -0800 (PST)
Message-ID: <3defb901-0356-bb01-8e13-ad984a63f48a@redhat.com>
Date: Thu, 11 Nov 2021 17:32:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 03/25] assertions for block global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-4-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-4-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> All the global state (GS) API functions will check that
> qemu_in_main_thread() returns true. If not, it means
> that the safety of BQL cannot be guaranteed, and
> they need to be moved to I/O.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c        | 136 +++++++++++++++++++++++++++++++++++++++++++++++--
>   block/commit.c |   2 +
>   block/io.c     |  20 ++++++++
>   blockdev.c     |   1 +
>   4 files changed, 156 insertions(+), 3 deletions(-)
>
> diff --git a/block.c b/block.c
> index 6fdb4d7712..672f946065 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -5606,7 +5678,6 @@ int64_t bdrv_getlength(BlockDriverState *bs)
>   void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr)
>   {
>       int64_t nb_sectors = bdrv_nb_sectors(bs);
> -
>       *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
>   }
>   

This hunk seems at least unrelated.

[...]

> @@ -5958,6 +6043,7 @@ const char *bdrv_get_parent_name(const BlockDriverState *bs)
>   /* TODO check what callers really want: bs->node_name or blk_name() */
>   const char *bdrv_get_device_name(const BlockDriverState *bs)
>   {
> +    assert(qemu_in_main_thread());
>       return bdrv_get_parent_name(bs) ?: "";
>   }
>   

This function is invoked from qcow2_signal_corruption(), which comes 
generally from an I/O path.  Is it safe to assert that we’re in the main 
thread here?

Well, the question is probably rather whether this needs really be a 
considered a global-state function, or whether putting it in common or 
I/O is fine.  I believe you’re right given that it invokes 
bdrv_get_parent_name(), it cannot be thread-safe, but then we’ll have to 
change qcow2_signal_corruption() so it doesn’t invoke this function.

[...]

> diff --git a/block/io.c b/block/io.c
> index bb0a254def..c5d7f8495e 100644
> --- a/block/io.c
> +++ b/block/io.c

[...]

> @@ -544,6 +546,7 @@ void bdrv_drained_end(BlockDriverState *bs)
>   
>   void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter)
>   {
> +    assert(qemu_in_main_thread());
>       bdrv_do_drained_end(bs, false, NULL, false, drained_end_counter);
>   }

Why is bdrv_drained_end an I/O function and this is a GS function, even 
though it does just a subset?

> @@ -586,12 +589,14 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
>   void coroutine_fn bdrv_co_drain(BlockDriverState *bs)
>   {
>       assert(qemu_in_coroutine());
> +    assert(qemu_in_main_thread());
>       bdrv_drained_begin(bs);
>       bdrv_drained_end(bs);
>   }
>   
>   void bdrv_drain(BlockDriverState *bs)
>   {
> +    assert(qemu_in_main_thread());
>       bdrv_drained_begin(bs);
>       bdrv_drained_end(bs);
>   }

Why are these GS functions when both bdrv_drained_begin() and 
bdrv_drained_end() are I/O functions?

I can understand making the drain_all functions GS functions, but it 
seems weird to say it’s an I/O function when a single BDS is drained via 
bdrv_drained_begin() and bdrv_drained_end(), but not via bdrv_drain(), 
which just does both.

(I can see that there are no I/O path callers, but I still find it strange.)

[...]

> @@ -2731,6 +2742,7 @@ int bdrv_block_status_above(BlockDriverState *bs, BlockDriverState *base,
>   int bdrv_block_status(BlockDriverState *bs, int64_t offset, int64_t bytes,
>                         int64_t *pnum, int64_t *map, BlockDriverState **file)
>   {
> +    assert(qemu_in_main_thread());
>       return bdrv_block_status_above(bs, bdrv_filter_or_cow_bs(bs),
>                                      offset, bytes, pnum, map, file);
>   }

Why is this a GS function as opposed to all other block-status 
functions?  Because of the bdrv_filter_or_cow_bs() call?

And isn’t the call from nvme_block_status_all() basically an I/O path?  
(Or is that always run in the main thread?)

> @@ -2800,6 +2812,7 @@ int bdrv_is_allocated_above(BlockDriverState *top,
>                               int64_t bytes, int64_t *pnum)
>   {
>       int depth;
> +
>       int ret = bdrv_common_block_status_above(top, base, include_base, false,
>                                                offset, bytes, pnum, NULL, NULL,
>                                                &depth);

This hunk too seems unrelated.

Hanna


