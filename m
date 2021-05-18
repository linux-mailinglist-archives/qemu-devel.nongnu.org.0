Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DDD387B76
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:42:38 +0200 (CEST)
Received: from localhost ([::1]:47124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0vV-0004Gv-4M
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj0jP-0003QZ-M0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:29:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lj0jO-0002cO-1L
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621348197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHGHOTpBZSv/8JbZy4YY3ZRhxhJCxThLALi17qHjEYM=;
 b=ObUgck2oyf1gb4fwaveOi8lawI1E3KGsfZbuDb4zKTm9ablKUJ1XHnaQrb/PstY3E1TGBw
 xccaLmB+UD3vQ5Ww7aV1U3+eYwk9rwylt3WnrDu1085pUUXXOwX4CUjREhWGGw1UFDPE6G
 Ygjb8UZ8Wt1A8fvZ35pfWhAbNZlJejo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-SgLI9kt7PmCAmRdw-lUv4Q-1; Tue, 18 May 2021 10:29:54 -0400
X-MC-Unique: SgLI9kt7PmCAmRdw-lUv4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FD181005D71;
 Tue, 18 May 2021 14:29:37 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D27D4163FD;
 Tue, 18 May 2021 14:29:34 +0000 (UTC)
Subject: Re: [PATCH 16/21] block/copy-before-write: cbw_init(): use options
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-18-vsementsov@virtuozzo.com>
 <7fe834fc-741d-bac1-b325-35092473313e@redhat.com>
 <a8694b70-e411-ac27-8dd1-8081c7a03b39@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <cf3b987b-4426-0378-c5bc-17ae9454b05b@redhat.com>
Date: Tue, 18 May 2021 16:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a8694b70-e411-ac27-8dd1-8081c7a03b39@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.05.21 16:24, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 16:56, Max Reitz wrote:
>> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>>> One more step closer to .bdrv_open(): use options instead of plain
>>> arguments. Move to bdrv_open_child() calls, native for drive open
>>> handlers.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   block/copy-before-write.c | 37 ++++++++++++++++++++-----------------
>>>   1 file changed, 20 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>>> index ddd79b3686..9ff1bf676c 100644
>>> --- a/block/copy-before-write.c
>>> +++ b/block/copy-before-write.c
>>> @@ -144,27 +144,20 @@ static void cbw_child_perm(BlockDriverState 
>>> *bs, BdrvChild *c,
>>>       }
>>>   }
>>> -static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
>>> -                    BlockDriverState *target, bool compress, Error 
>>> **errp)
>>> +static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
>>>   {
>>>       BDRVCopyBeforeWriteState *s = bs->opaque;
>>> -    bdrv_ref(target);
>>> -    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
>>> -                                  BDRV_CHILD_DATA, errp);
>>> -    if (!s->target) {
>>> -        error_prepend(errp, "Cannot attach target child: ");
>>> -        bdrv_unref(target);
>>> +    bs->file = bdrv_open_child(NULL, options, "file", bs, 
>>> &child_of_bds,
>>> +                               BDRV_CHILD_FILTERED | 
>>> BDRV_CHILD_PRIMARY,
>>> +                               false, errp);
>>> +    if (!bs->file) {
>>>           return -EINVAL;
>>>       }
>>> -    bdrv_ref(source);
>>> -    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
>>> -                                 BDRV_CHILD_FILTERED | 
>>> BDRV_CHILD_PRIMARY,
>>> -                                 errp);
>>> -    if (!bs->file) {
>>> -        error_prepend(errp, "Cannot attach file child: ");
>>> -        bdrv_unref(source);
>>> +    s->target = bdrv_open_child(NULL, options, "target", bs, 
>>> &child_of_bds,
>>> +                                BDRV_CHILD_DATA, false, errp);
>>> +    if (!s->target) {
>>>           return -EINVAL;
>>>       }
>>> @@ -175,7 +168,10 @@ static int cbw_init(BlockDriverState *bs, 
>>> BlockDriverState *source,
>>>               ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | 
>>> BDRV_REQ_NO_FALLBACK) &
>>>                bs->file->bs->supported_zero_flags);
>>> -    s->bcs = block_copy_state_new(bs->file, s->target, false, 
>>> compress, errp);
>>> +    qdict_del(options, "cluster-size");
>>
>> What is this about?
> 
> accidental, will drop. (it's a remaining of my first solution where I 
> tried to pass cluster-size, then I decided that's better move 
> cluster-size detection to block_copy)
> 
>>
>>> +    s->bcs = block_copy_state_new(bs->file, s->target, false,
>>> +            qdict_get_try_bool(options, "x-deprecated-compress", 
>>> false), errp);
>>
>> First, I’d keep the `compress` variable and use it to store the value, 
>> because this doesn’t look very nice.
> 
> OK
> 
>>
>> Second, what’s the story here?  “deprecated” sounds to me like you’re 
>> planning to use a different interface eventually, but looking ahead 
>> for a bit I didn’t find anything yet.
>>
> 
> I should have described it in commit message.
> 
> We have "compress" filter driver. So instead adding "compress" option to 
> every block job or filter, user should use "compress" filter. That's why 
> I don't want to publish compress option for copy-before-write filter. 
> Still we need it to maintain "compress" option of backup job. I also 
> want to deprecate "compress" option in backup, then everything will be 
> clear.

Oh, that’s true.  Until backup’s option is deprecated, I think a comment 
would be more useful than a note in the commit message, though.

Max


