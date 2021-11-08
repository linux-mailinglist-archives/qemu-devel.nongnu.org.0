Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290DB447D8A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 11:14:15 +0100 (CET)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk1fJ-0004Lw-Jr
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 05:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mk1e9-0003Mu-7X
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:13:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mk1e5-0003yZ-CR
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636366375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSsAaYK8Bv1rj9d8WKUhtcChG+2vy4We91YL89OvK+s=;
 b=GP7ajCicwO2a7hzFGSr66/1d628cNMtxcJaT3eOU97RDutVGuTSZJ8AjY3Cx3j62z6Y0gq
 G3BA9o+f0MMd1xypV1dQF1jXjPr5yKo0hLQaJ2A36q90K6i4qLptD6rujnKk2/8IzzKoia
 NYIpjmklrYYOqX7ViFV0pv+aURQC4qg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-BetrZplDOXWlTZ_FjqUntQ-1; Mon, 08 Nov 2021 05:12:54 -0500
X-MC-Unique: BetrZplDOXWlTZ_FjqUntQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso9918851wme.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 02:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oSsAaYK8Bv1rj9d8WKUhtcChG+2vy4We91YL89OvK+s=;
 b=M6JARx90D5oacdxromLnMEIqbjYTiJE/bGxKJ7i9tZmFSlVoHpfS9t+0G9PFuNZ2qs
 PG4F7bxgvZ/2e6zn6yiuRQeGAfm2ZeYiq7wd0VsilD17nLU2btCkmZyh4wZf2rcn/se0
 6gLBBPmC9u+DLn9R62taVinVUEw9iXixNRpGaplTvWVzv5MjbKt4nuIAhns51a9YfR2N
 YLLQIlZur8pvKno0RkGSxgLqyJBue0mbua2srvQzftihjzpTNdNT3+DeRLcs4fcaaDDR
 NrCKpEwS1hB+394fqGBqv3U5L7smyZ6Zp9t0S1l5EMgL23K4IE2WXi2m798P9T3TG9vd
 4FZg==
X-Gm-Message-State: AOAM532NhYpgV72VAHWesP2M5U98DE5bVPsr2EeaLVWsYKDA+fxXhW1T
 PAr+Xj8im/xTASTKW/gREyWjW3FrC0Uexb5qi/XRRFp9CdMxXWBXMu0mbLqb9QykOXxW1tpDefd
 fQRRcc3hLTF3rgCw=
X-Received: by 2002:adf:eb81:: with SMTP id t1mr4181462wrn.133.1636366373167; 
 Mon, 08 Nov 2021 02:12:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgTQyxVOmA889ZFXPIm8ufhtS7DnLPLink6j0KvvWzhzMyO+8xm8IkRIvYZohVzlDpADTC5g==
X-Received: by 2002:adf:eb81:: with SMTP id t1mr4181434wrn.133.1636366372951; 
 Mon, 08 Nov 2021 02:12:52 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id u23sm9340919wru.21.2021.11.08.02.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 02:12:52 -0800 (PST)
Message-ID: <ce386d54-f183-082e-4ef6-e665ff0ae927@redhat.com>
Date: Mon, 8 Nov 2021 11:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/7] block: Let replace_child_noperm free children
To: Kevin Wolf <kwolf@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
 <20211104103849.46855-7-hreitz@redhat.com> <YYVQvkRFekBcJL1R@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YYVQvkRFekBcJL1R@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.11.21 16:41, Kevin Wolf wrote:
> Am 04.11.2021 um 11:38 hat Hanna Reitz geschrieben:
>> In most of the block layer, especially when traversing down from other
>> BlockDriverStates, we assume that BdrvChild.bs can never be NULL.  When
>> it becomes NULL, it is expected that the corresponding BdrvChild pointer
>> also becomes NULL and the BdrvChild object is freed.
>>
>> Therefore, once bdrv_replace_child_noperm() sets the BdrvChild.bs
>> pointer to NULL, it should also immediately set the corresponding
>> BdrvChild pointer (like bs->file or bs->backing) to NULL.
>>
>> In that context, it also makes sense for this function to free the
>> child.  Sometimes we cannot do so, though, because it is called in a
>> transactional context where the caller might still want to reinstate the
>> child in the abort branch (and free it only on commit), so this behavior
>> has to remain optional.
>>
>> In bdrv_replace_child_tran()'s abort handler, we now rely on the fact
>> that the BdrvChild passed to bdrv_replace_child_tran() must have had a
>> non-NULL .bs pointer initially.  Make a note of that and assert it.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   block.c | 102 +++++++++++++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 86 insertions(+), 16 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index ff45447686..0a85ede8dc 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -87,8 +87,10 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>>   static bool bdrv_recurse_has_child(BlockDriverState *bs,
>>                                      BlockDriverState *child);
>>   
>> +static void bdrv_child_free(BdrvChild *child);
>>   static void bdrv_replace_child_noperm(BdrvChild **child,
>> -                                      BlockDriverState *new_bs);
>> +                                      BlockDriverState *new_bs,
>> +                                      bool free_empty_child);
>>   static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>>                                                 BdrvChild *child,
>>                                                 Transaction *tran);
>> @@ -2256,12 +2258,16 @@ typedef struct BdrvReplaceChildState {
>>       BdrvChild *child;
>>       BdrvChild **childp;
>>       BlockDriverState *old_bs;
>> +    bool free_empty_child;
>>   } BdrvReplaceChildState;
>>   
>>   static void bdrv_replace_child_commit(void *opaque)
>>   {
>>       BdrvReplaceChildState *s = opaque;
>>   
>> +    if (s->free_empty_child && !s->child->bs) {
>> +        bdrv_child_free(s->child);
>> +    }
>>       bdrv_unref(s->old_bs);
>>   }
>>   
>> @@ -2270,8 +2276,23 @@ static void bdrv_replace_child_abort(void *opaque)
>>       BdrvReplaceChildState *s = opaque;
>>       BlockDriverState *new_bs = s->child->bs;
>>   
>> -    /* old_bs reference is transparently moved from @s to *s->childp */
>> -    bdrv_replace_child_noperm(s->childp, s->old_bs);
>> +    /*
>> +     * old_bs reference is transparently moved from @s to s->child;
>> +     * pass &s->child here instead of s->childp, because *s->childp
>> +     * will have been cleared by bdrv_replace_child_tran()'s
>> +     * bdrv_replace_child_noperm() call if new_bs is NULL, and we must
>> +     * not pass a NULL *s->childp here.
>> +     */
>> +    bdrv_replace_child_noperm(&s->child, s->old_bs, true);
> Passing free_empty_child=true with a non-NULL new_bs looks a bit
> confusing because the child isn't supposed to become empty anyway.

I wasn’t sure what to do.  I decided to make the contract “Caller should 
pass false only if they will deal with freeing the child”, and so I 
ended up passing `true` in cases such as here.  I felt like `true` 
should kind of be the default case, and `false` the exception.

>> +    /*
>> +     * The child was pre-existing, so s->old_bs must be non-NULL, and
>> +     * s->child thus must not have been freed
>> +     */
>> +    assert(s->child != NULL);
>> +    if (!new_bs) {
>> +        /* As described above, *s->childp was cleared, so restore it */
>> +        *s->childp = s->child;
>> +    }
> If it wasn't cleared, doesn't it still contain s->child, so this could
> just be an unconditional rollback?

I think so, yes.  We’d still have to explain why the rollback is 
required, though, so would dropping the condition really make it 
simpler?  (Of course this also goes in the opposite direction: Is making 
it conditional simpler? :))

I just feel like the comment would be something like “Restore *s->childp 
in case it was cleared as described above”, and then I’d find it a bit 
strange if the “in case” isn’t part of the code...  *shrug*

Hanna


