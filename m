Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB284504B5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 13:51:25 +0100 (CET)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmbSG-0001cU-PI
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 07:51:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmbPa-0007GH-Eq
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmbPX-00046z-K3
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636980514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4x3PbiFsY5zIpwaFPM+Y2zPepmTh3NQsrK4KxyqLmM=;
 b=RId6/ivsU1dpa52GuENYWr1HdTkGo9QbUlri4T4wE2jCwxc1OEfwIm6WhwtTZt/vhuIKR4
 SgoPOF+X/4eM7d+XCy2TAJ1I9irfOMEf28uM4RlHebqkgARWURv4XZfTtbehPA1ubgMjzq
 0mv53f6YySBjLd4o6WBFDDzNRhnpMfQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-rPy67x-WPGaorRvcvyJ68w-1; Mon, 15 Nov 2021 07:48:33 -0500
X-MC-Unique: rPy67x-WPGaorRvcvyJ68w-1
Received: by mail-wm1-f70.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso7837600wmq.2
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 04:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J4x3PbiFsY5zIpwaFPM+Y2zPepmTh3NQsrK4KxyqLmM=;
 b=4cbmqekLEHS938i/ifyg9JGTGfvoKm60yf6HlCfgRIGwb4sl4vCvfAA/DR23fxbLb+
 xHns2hiXEsCpxsMwdbO81rFZABnOzCZBPCVursYwQ737WTBF1qMWtBUXUghMMdNso6qP
 qK2W+HpG7IDv34oNSIVbHKxuDp/cljYKMUGL11YDOxFaDdBTvmxJzQBUI8juWFLv/Md3
 bwqNe/XNuSW+v0/K/OPB5Jd4WCZCLl2YXpWFgNgW9Zoo7aSO6A79ma5EfgsvHfFxyqRW
 L1wNcInPh9tVWlutMN3DGkPoZBpFPG2hsSMPU+8B+xOGJVVUDgAEv4xN8a8yX9cZeJwt
 s33g==
X-Gm-Message-State: AOAM531XyBFK9vsFx1O1+Fmcw+H1blolAAWDzJ6iLPgHockypTaLa2Xj
 3n7frmi0aTIxwvH4J7eR3eMD8U5JczKL0rU/cDRvQVeMmgu6LcfDEVZubDHoEcDlRN1VnAvNj+H
 g7ZOirdfrQp/9WVc=
X-Received: by 2002:a5d:5643:: with SMTP id j3mr14458526wrw.138.1636980512057; 
 Mon, 15 Nov 2021 04:48:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+JFONnF7nmOxgzk8xZbYhFGKQlA3ZCWRQfrXfTbengDV919AT5upVLHz71Yq6URvf6ArVFQ==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr14458488wrw.138.1636980511872; 
 Mon, 15 Nov 2021 04:48:31 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id c16sm13858850wrx.96.2021.11.15.04.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 04:48:31 -0800 (PST)
Message-ID: <83cf9336-e37d-bf48-961c-8103b5c7bc62@redhat.com>
Date: Mon, 15 Nov 2021 13:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 20/25] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-21-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-21-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/block.c b/block.c
> index 94bff5c757..40c4729b8d 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -2148,6 +2152,7 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
>                               uint64_t *nperm, uint64_t *nshared)
>   {
>       assert(bs->drv && bs->drv->bdrv_child_perm);
> +    assert(qemu_in_main_thread());
>       bs->drv->bdrv_child_perm(bs, c, role, reopen_queue,
>                                parent_perm, parent_shared,
>                                nperm, nshared);

(Should’ve noticed earlier, but only did now...)

First, this function is indirectly called by bdrv_refresh_perms(). I 
understand that all perm-related functions are classified as GS.

However, bdrv_co_invalidate_cache() invokes bdrv_refresh_perms. Being 
declared in block/coroutine.h, it’s an I/O function, so it mustn’t call 
such a GS function. BlockDriver.bdrv_co_invalidate_cache(), 
bdrv_invalidate_cache(), and blk_invalidate_cache() are also classified 
as I/O functions. Perhaps all of these functions should be classified as 
GS functions?  I believe their callers and their purpose would allow for 
this.


Second, it’s called by bdrv_child_refresh_perms(), which is called by 
block_crypto_amend_options_generic_luks().  This function is called by 
block_crypto_co_amend_luks(), which is a BlockDriver.bdrv_co_amend 
implementation, which is classified as an I/O function.

Honestly, I don’t know how to fix that mess.  The best would be if we 
could make the perm functions thread-safe and classify them as I/O, but 
it seems to me like that’s impossible (I sure hope I’m wrong).  On the 
other hand, .bdrv_co_amend very much strikes me like a GS function, but 
it isn’t.  I’m afraid it must work on nodes that are not in the main 
context, and it launches a job, so AFAIU we absolutely cannot run it 
under the BQL.

It almost seems to me like we’d need a thread-safe variant of the perm 
functions that’s allowed to fail when it cannot guarantee thread safety 
or something.  Or perhaps I’m wrong and the perm functions can actually 
be classified as thread-safe and I/O, that’d be great…

Hanna


