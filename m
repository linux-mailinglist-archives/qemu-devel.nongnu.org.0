Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4604D450678
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:18:03 +0100 (CET)
Received: from localhost ([::1]:59394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmco6-0003jd-4J
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmcls-0002ok-Jq
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:15:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmclp-00021m-8k
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636985740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpS8gCNrZGqAirb29HfxC9bgVt5pHtPCVVLRJi4MPhk=;
 b=D7gdxwLu1TviwW8eyIp3O+r/HxdS56lcfVkguNAuSkUadTkD4GZXxDcoEWYAe5xrSgtNX/
 zzkwvqpPcuG2WE6CiVBlcuUdmV/gv0JWmXkEvM4248cXgucoQrmPpNQK7Dei6qWFHtjVuP
 NHcE3Cbd4rTfN/4gWLeZNHTwIch+t3E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-SqM_iuZiPsm3tGyzBirf3g-1; Mon, 15 Nov 2021 09:15:39 -0500
X-MC-Unique: SqM_iuZiPsm3tGyzBirf3g-1
Received: by mail-wm1-f70.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so7074910wmr.3
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=MpS8gCNrZGqAirb29HfxC9bgVt5pHtPCVVLRJi4MPhk=;
 b=M744g8Zb01t/AO70f+NgDGnufDeGXNVqGp2BQ8M6rgpbrnETJ4yu9uNqCiDH4bpDpO
 mlQkKQWIoxnV32vjdCuCIVzNO67Srr+H+/6R2swnuyBKXzsY/pGtowqTsOhIh9o3RXMi
 fNDVTZgWrCwiBvJj+9RxkKGg1jpcCFpC+hnQjcBwmYJD8VnxYgczp0SsHiY9NT4d2zpN
 eSjmih13UBR3nNsyILuNysFtKUzrjNar5XwjyQrEibxqT25fW19LMWyv6YxkJzWV9Wmg
 ntjWbZru8E1rZOj4H3IC49wQoZ3NxfDK+ttBvXKTZ9MyGvigAklrF3EayIoVz1EyETaz
 1iXA==
X-Gm-Message-State: AOAM533lXE0lYkoskDsqQKU62Y2rdkj2tZMFjmXTvumPs+FSMxO6IkU4
 6ZVyC2QiYnuD9TnqwFjpqDGO1wB75z/IlEKCdvPaLHf+Vcux7IclYao30yH9HG2qcirllchZU8o
 AwBwVLY5rIyM/zhc=
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr46813524wrr.210.1636985738212; 
 Mon, 15 Nov 2021 06:15:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVFNCZXcvEoD4OJrIA7Bbg9KuQZJafR3iwVStqwPgAgbPGNR88x+M9Q86rWBwa532qPsJCyA==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr46813468wrr.210.1636985737936; 
 Mon, 15 Nov 2021 06:15:37 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id w4sm2566560wrs.88.2021.11.15.06.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 06:15:37 -0800 (PST)
Message-ID: <ecd77c39-d75c-e896-2e7e-51bf15a0128f@redhat.com>
Date: Mon, 15 Nov 2021 15:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 20/25] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
From: Hanna Reitz <hreitz@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-21-eesposit@redhat.com>
 <83cf9336-e37d-bf48-961c-8103b5c7bc62@redhat.com>
In-Reply-To: <83cf9336-e37d-bf48-961c-8103b5c7bc62@redhat.com>
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

On 15.11.21 13:48, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/block.c b/block.c
>> index 94bff5c757..40c4729b8d 100644
>> --- a/block.c
>> +++ b/block.c
>
> [...]
>
>> @@ -2148,6 +2152,7 @@ static void bdrv_child_perm(BlockDriverState 
>> *bs, BlockDriverState *child_bs,
>>                               uint64_t *nperm, uint64_t *nshared)
>>   {
>>       assert(bs->drv && bs->drv->bdrv_child_perm);
>> +    assert(qemu_in_main_thread());
>>       bs->drv->bdrv_child_perm(bs, c, role, reopen_queue,
>>                                parent_perm, parent_shared,
>>                                nperm, nshared);
>
> (Should’ve noticed earlier, but only did now...)
>
> First, this function is indirectly called by bdrv_refresh_perms(). I 
> understand that all perm-related functions are classified as GS.
>
> However, bdrv_co_invalidate_cache() invokes bdrv_refresh_perms. Being 
> declared in block/coroutine.h, it’s an I/O function, so it mustn’t 
> call such a GS function. BlockDriver.bdrv_co_invalidate_cache(), 
> bdrv_invalidate_cache(), and blk_invalidate_cache() are also 
> classified as I/O functions. Perhaps all of these functions should be 
> classified as GS functions?  I believe their callers and their purpose 
> would allow for this.
>
>
> Second, it’s called by bdrv_child_refresh_perms(), which is called by 
> block_crypto_amend_options_generic_luks().  This function is called by 
> block_crypto_co_amend_luks(), which is a BlockDriver.bdrv_co_amend 
> implementation, which is classified as an I/O function.
>
> Honestly, I don’t know how to fix that mess.  The best would be if we 
> could make the perm functions thread-safe and classify them as I/O, 
> but it seems to me like that’s impossible (I sure hope I’m wrong).  On 
> the other hand, .bdrv_co_amend very much strikes me like a GS 
> function, but it isn’t.  I’m afraid it must work on nodes that are not 
> in the main context, and it launches a job, so AFAIU we absolutely 
> cannot run it under the BQL.
>
> It almost seems to me like we’d need a thread-safe variant of the perm 
> functions that’s allowed to fail when it cannot guarantee thread 
> safety or something.  Or perhaps I’m wrong and the perm functions can 
> actually be classified as thread-safe and I/O, that’d be great…

Hm.  Can we perhaps let block_crypto_amend_options_generic_luks() take 
the BQL just for the permission adjustment (i.e. the 
bdrv_child_refresh_perms() call)?  Would that work? :/

Hanna


