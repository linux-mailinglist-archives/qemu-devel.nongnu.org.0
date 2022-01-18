Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A792A4929A9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:29:19 +0100 (CET)
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qQA-0008Gf-GD
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:29:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9omR-0004lX-An
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:44:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9omP-0006sJ-1H
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642513448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBqx632YwSXB+l0K84Q1gsBgdli9DAQbEMqx2TYmCv4=;
 b=fsvoHnC1rJkKXbTubbI2M/JvtsYznp/ivJgKI5lrKjTtQOjfj2PerkLzH62o33l2quB+Qv
 k5ctYcmszi8WRSCCG8hLU2qCaCIsn3qaCN7Xy6XwRpWfrOcYDKa80STrgi/OyQWNU7q24s
 gEl/G5NnkdCqbBBjMbvH3u62wRxvgL0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-gYWEF6XaMg2M0OCZxnyuig-1; Tue, 18 Jan 2022 08:44:07 -0500
X-MC-Unique: gYWEF6XaMg2M0OCZxnyuig-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso2099732wmb.9
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 05:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YBqx632YwSXB+l0K84Q1gsBgdli9DAQbEMqx2TYmCv4=;
 b=Sl0l5VPugU1/+je6p5dwCUyQjwtUYT1lQwz4EhZ7Qhz1aa4aTpTZbaypeUUVnp9zfP
 IEg0SOkQl5eBPpH+JVjWHoXoeXtP24ImHhmZmQufd5aR9gfNOdzWyYjSC3pljEglYmq+
 jd6wgcd2Gpf3Z9jbYOAWrga/fZ00GadZTApge721EEUVjUBd/yYua9bgMAotoaqET0Dn
 9fI7FxuTxKoVXwkQwMx/JX3RUDj5EAUPj9vfeu9u2zglslBbrJPCqJgE7E2j0xsUZhkh
 K7jWXzhuJy5afDLa1KZA2LYfQSQNDjdu8f/UmZ5RXwARTGya2kUK3ROrXkDu5ekSR6f9
 EFkA==
X-Gm-Message-State: AOAM531ZIy5B1xTmVaILRoh1R7Hb8AgycX8X6pukYShkncQANsm/CG8E
 0myspVy7mCqAnaUPBbIIan615aeRHZ+Ntu4m5yC2lDd2/XUiE+iJHuzPR4OoF1V8w0RXjYqR4zk
 IUNO+2JrguFOOQDY=
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr7354945wrx.277.1642513445946; 
 Tue, 18 Jan 2022 05:44:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsLa9nFIdFtJqi1SIxsbw6V0aTudOsNaIL6ccbL2g04bAvMX5yu9VFkAkLBRNc6ApypcbciA==
X-Received: by 2002:a05:6000:144a:: with SMTP id
 v10mr7354924wrx.277.1642513445768; 
 Tue, 18 Jan 2022 05:44:05 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id h8sm2647111wmq.26.2022.01.18.05.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 05:44:05 -0800 (PST)
Message-ID: <f1db9f43-6425-1507-3718-bdbf2cea7602@redhat.com>
Date: Tue, 18 Jan 2022 14:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 08/19] block/reqlist: add reqlist_wait_all()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-9-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-9-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
> Add function to wait for all intersecting requests.
> To be used in the further commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/reqlist.h | 8 ++++++++
>   block/reqlist.c         | 8 ++++++++
>   2 files changed, 16 insertions(+)
>
> diff --git a/include/block/reqlist.h b/include/block/reqlist.h
> index b904d80216..4695623bb3 100644
> --- a/include/block/reqlist.h
> +++ b/include/block/reqlist.h
> @@ -53,6 +53,14 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
>   bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
>                                      int64_t bytes, CoMutex *lock);
>   
> +/*
> + * Wait for all intersecting requests. It just calls reqlist_wait_one() in a
> + * loops, caller is responsible to stop producing new requests in this region

s/loops/loop/

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> + * in parallel, otherwise reqlist_wait_all() may never return.
> + */
> +void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
> +                                   int64_t bytes, CoMutex *lock);
> +
>   /*
>    * Shrink request and wake all waiting coroutines (may be some of them are not
>    * intersecting with shrunk request).


