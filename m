Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22344C415
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:08:56 +0100 (CET)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpDb-00035O-DR
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mkpAt-0007Ys-Vm
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:06:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mkpAp-0001Pr-Ai
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636556761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJdAseoqpEvFOOpxCS/V7tH5Qz4uwoMXZEBnek0mZsc=;
 b=e2orhhtXFN2/HaqKkO3x6p4U9svJ03irD7ZFk0spTqDqeofALDqWi3qz2VMoOwktrglgJl
 VQRVieTw9hS+m3qDQgL97x7YLhr2f6xZjuupMS8AhmHD5rweqhD6sWbEQGG4k2aIwCSjeq
 ESBu3LpW/OIh+AxPqhPRtha7VaA0EHE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-dxwJmq71Nqqdf9h89EPQKg-1; Wed, 10 Nov 2021 10:06:00 -0500
X-MC-Unique: dxwJmq71Nqqdf9h89EPQKg-1
Received: by mail-wr1-f71.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so443394wrb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jJdAseoqpEvFOOpxCS/V7tH5Qz4uwoMXZEBnek0mZsc=;
 b=cxzBinFZlUjoA8PjmalZ/1LM6Z6Gwg+lfiIp6WgAiXu9BTvUp1N8jWTEM6k1Txo6Ql
 VX6zltn+zUPpfjFKJWxRZt2d6vYNe2C2hKM5KQ3GWmlekXtBQ2a+fLGxGJCDA9z80KF9
 2SswwZr++aqyplnjvRgsTz1bKFVDrM2me83tMWhIj1sJo1WynoRi3jyKsp1+AnLs/YBJ
 nnkbUjY8ES4BsUSngz2g3uKbXUjrZ+WvT1qXvwZqCh3AJ7MTCt651vppYKFr4o5Qm9/+
 0W6/f8kLq4Nj9je5cVuPfdxe3LIILbhxy7ZCm/iSFoiyXXU11nN3+tXcAElJ6AaXdElT
 wHzg==
X-Gm-Message-State: AOAM531GgpDQOVXu2Kic9WGNQ0Vzjg+yIgZnI9bwGfp7Pt9vQxFdl0IO
 2Vf9T8EFdiPCrKL9fXf7HfY1wgXrINAsQV8n9uNHtn6hh8AOgzR1hMiNhzYfPVHkD/VoPoGJZXL
 /CgxcaU2+xBwnZjg=
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr507142wrd.300.1636556759174;
 Wed, 10 Nov 2021 07:05:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtK216GYVGrARobTzGdYDONHOoOmLzElFmPzxizYvQIWizdcsGdKgT8mj4KSVmefGI/n/0kA==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr507092wrd.300.1636556758887;
 Wed, 10 Nov 2021 07:05:58 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id r17sm47618wmq.11.2021.11.10.07.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:05:58 -0800 (PST)
Message-ID: <b77f99a4-dc43-e6cb-5bee-ebcfda3917b4@redhat.com>
Date: Wed, 10 Nov 2021 16:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/7] block: Manipulate children list in .attach/.detach
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-3-hreitz@redhat.com>
 <b1d17f2e-ace3-ee0e-ef22-424f03af3d69@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <b1d17f2e-ace3-ee0e-ef22-424f03af3d69@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.11.21 13:46, Vladimir Sementsov-Ogievskiy wrote:
> 04.11.2021 13:38, Hanna Reitz wrote:
>> The children list is specific to BDS parents.  We should not modify it
>> in the general children modification code, but let BDS parents deal with
>> it in their .attach() and .detach() methods.
>>
>> This also has the advantage that a BdrvChild is removed from the
>> children list before its .bs pointer can become NULL.  BDS parents
>> generally assume that their children's .bs pointer is never NULL, so
>> this is actually a bug fix.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   block.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 580cb77a70..243ae206b5 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -1387,6 +1387,8 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>>   {
>>       BlockDriverState *bs = child->opaque;
>>   +    QLIST_INSERT_HEAD(&bs->children, child, next);
>> +
>>       if (child->role & BDRV_CHILD_COW) {
>>           bdrv_backing_attach(child);
>>       }
>> @@ -1403,6 +1405,8 @@ static void bdrv_child_cb_detach(BdrvChild *child)
>>       }
>>         bdrv_unapply_subtree_drain(child, bs);
>> +
>> +    QLIST_REMOVE(child, next);
>>   }
>>     static int bdrv_child_cb_update_filename(BdrvChild *c, 
>> BlockDriverState *base,
>> @@ -2747,7 +2751,7 @@ static void bdrv_child_free(void *opaque)
>>   static void bdrv_remove_empty_child(BdrvChild *child)
>>   {
>>       assert(!child->bs);
>> -    QLIST_SAFE_REMOVE(child, next);
>> +    assert(!child->next.le_prev); /* not in children list */
>>       bdrv_child_free(child);
>>   }
>>   @@ -2913,7 +2917,6 @@ static int 
>> bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>>           return ret;
>>       }
>>   -    QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
>
> The following comment become stale. We should remove it too. With 
> comment removed:

Ah, right, thanks!

> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


