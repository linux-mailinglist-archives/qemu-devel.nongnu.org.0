Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26544C603
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 18:34:16 +0100 (CET)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkrUF-0004A3-Sc
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 12:34:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mkrSR-0002l8-0S
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 12:32:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mkrSO-0005xS-19
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 12:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636565539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hr2JsEz8F0ho5Qs6QP3kuCDiR8PHo1bmx8OrrcSh82I=;
 b=OYyW2zpahur/N7J3YnYm+AouGeF+BcBtW8Ognm3mAXUOnB8k0fdnq6YF7h8yqeCcpMn+/L
 CNk5kIN4OXGn5R7Op/DhVaWpKykNZb2jAN+4WS9FVPU0VoOyIIi2M+N+CS9R6J2GEKJINe
 FId8d7jq0aV7PSlcvTwZdAE1rpGPTFo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-sNU6VtHGM2aKmIQ0aC8GKA-1; Wed, 10 Nov 2021 12:32:16 -0500
X-MC-Unique: sNU6VtHGM2aKmIQ0aC8GKA-1
Received: by mail-wr1-f71.google.com with SMTP id
 z5-20020a5d6405000000b00182083d7d2aso578454wru.13
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 09:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hr2JsEz8F0ho5Qs6QP3kuCDiR8PHo1bmx8OrrcSh82I=;
 b=rwDis/aMuTGKl/1JBHz71Y69ZCM3obOgDeGq9wX1x7v4i2l9JE52j9oxkFHacGiWNq
 v6Yuh82v37sfznrgZah2H3goRVe0GP1CjoIxRd02EE09W0ydtlD0lyJgNASylZthJ/AV
 /3VANSqbm3hciQoE6NlfqHW6pH3aynNabBVaQCFW09u/xiGStD900MX9Q2ZfI0kQtE+9
 1egA3rwVCFgx8380s9LIhMRIQQ7U8jrH/R+n9FK0PbWQPT1K1eGTCvQPr7tdN7SYANns
 6WQYy3UvokzGj5C25vfyw3QK/00YncRD6FeOCiAtOW36EfrVRgE6SkwQzpbH+8FBOXuO
 6Z9Q==
X-Gm-Message-State: AOAM532sHGLtEiqHgIllFpZCRqmUYieYnBLsMt6Sr0mkaONyxHWq7QfJ
 KSpPUlWOWEqbuT/Fg6UuMpx3JTPTbUvbuy1IBO+bM6Gw2t+vI+47CuC+1nh2Ci0f4jNbVI2DejT
 t/89fGldxZxJlKs0=
X-Received: by 2002:a1c:7910:: with SMTP id l16mr18599489wme.36.1636565535695; 
 Wed, 10 Nov 2021 09:32:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyI1+Xjr3tlB/7IfMf1NEvjl25xIzz3HFGDYDDbczK7HxjdRyln4hvefghLvq3A1TYZlQY7VA==
X-Received: by 2002:a1c:7910:: with SMTP id l16mr18599445wme.36.1636565535432; 
 Wed, 10 Nov 2021 09:32:15 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b10sm537204wrt.36.2021.11.10.09.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 09:32:15 -0800 (PST)
Message-ID: <bc5eef2c-28b2-4e22-49b9-0f694b20ca33@redhat.com>
Date: Wed, 10 Nov 2021 18:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/7] block: Drop detached child from ignore list
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-5-hreitz@redhat.com>
 <9509e689-95cb-ec98-e27d-7f3a35e22503@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <9509e689-95cb-ec98-e27d-7f3a35e22503@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.11.21 14:38, Vladimir Sementsov-Ogievskiy wrote:
> 04.11.2021 13:38, Hanna Reitz wrote:
>> bdrv_attach_child_common_abort() restores the parent's AioContext.  To
>> do so, the child (which was supposed to be attached, but is now detached
>> again by this abort handler) is added to the ignore list for the
>> AioContext changing functions.
>>
>> However, since we modify a BDS's children list in the BdrvChildClass's
>> .attach and .detach handlers, the child is already effectively detached
>> from the parent by this point.  We do not need to put it into the ignore
>> list.
>>
>> Use this opportunity to clean up the empty line structure: Keep setting
>> the ignore list, invoking the AioContext function, and freeing the
>> ignore list in blocks separated by empty lines.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
>
> What comes in my mind, is that now bdrv_replace_child_noperm() is more 
> strong in detaching.. But may be not enough strong: we still have link 
> from the child to parent (child->opaque).. Maybe more correct for 
> BdrvChild object to have no relation with parent after detaching. But 
> than we'll need some GenericParent object (as child->class is mostly 
> about parent, not about child and even not about the edge).. Now 
> GenericParent is "included" into BdrvChild, which represents both 
> GenericParent and Edge objects..

Yes, I thought about this in exactly this function here 
(bdrv_attach_child_common_abort()).  I was wondering whether I could 
save a pointer to the BdrvChildClass, then just let 
bdrv_replace_child_noperm() free the child, and then invoke the 
BdrvChildClass methods when the child is already gone.  As you say, it’s 
really just about the parent, and child->opaque is effectively just a 
pointer to the parent object, so all of the methods that only use 
child->opaque and nothing else from the BdrvChild object can be invoked 
even after the child is gone.

But doing something about that (like changing some methods like the 
AioContext methods to only take the opaque pointer) was too invasive for 
me for this series, so in case of this function I decided to just 
begrudgingly keep the BdrvChild object around, including its 
back-connection to the parent (via child->opaque), and free it at the 
end of the function.

Besides that back-connection, there’s also to consider that some block 
drivers can keep pointers to special children in their BDS 
“subclasses”.  For example, qcow2 keeps s->data_file.  That’s a problem 
just like bs->backing or bs->file, except that it’s much more unlikely 
to cause problems in practice, and that it would probably be even more 
invasive to fix...

Hanna

>> ---
>>   block.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index b95f8dcf8f..6d230ad3d1 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2774,14 +2774,16 @@ static void 
>> bdrv_attach_child_common_abort(void *opaque)
>>       }
>>         if (bdrv_child_get_parent_aio_context(child) != 
>> s->old_parent_ctx) {
>> -        GSList *ignore = g_slist_prepend(NULL, child);
>> +        GSList *ignore;
>>   +        /* No need to ignore `child`, because it has been detached 
>> already */
>> +        ignore = NULL;
>>           child->klass->can_set_aio_ctx(child, s->old_parent_ctx, 
>> &ignore,
>>                                         &error_abort);
>>           g_slist_free(ignore);
>> -        ignore = g_slist_prepend(NULL, child);
>> -        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
>>   +        ignore = NULL;
>> +        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
>>           g_slist_free(ignore);
>>       }
>>
>
>


