Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A3371498
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:54:39 +0200 (CEST)
Received: from localhost ([::1]:46580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldX9q-0002Uf-Ak
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldX8b-0001bT-RE
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldX8a-0002Rs-9p
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620042799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8kkAR5EGfAE090OPh/KsGJX+brYK4EqBaKBuN9HwdL8=;
 b=WS/MIIuhddebD/4yiZV79T/NEQBR+YrmcvIkKYbY+qSc4N2jP+KEHQcBQQMhCNbXeKGDCO
 dr1ggC8OkkfVFSmtQi9hkH0er/V92LyX5alUJ6yxSB0j3J+uSn0rLEuvyyz3P5e/sMxLvE
 bfyNZO1hstYfAW2UOg2tV3pYyiIZf4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-_02GWk6eMmilFqAyiBd1Ng-1; Mon, 03 May 2021 07:53:16 -0400
X-MC-Unique: _02GWk6eMmilFqAyiBd1Ng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44DA5801106;
 Mon,  3 May 2021 11:53:15 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-107.ams2.redhat.com
 [10.36.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3492B10013C1;
 Mon,  3 May 2021 11:53:13 +0000 (UTC)
Subject: Re: [PATCH 1/2] block: Fix Transaction leak in
 bdrv_root_attach_child()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210503110555.24001-1-kwolf@redhat.com>
 <20210503110555.24001-2-kwolf@redhat.com>
 <9e23f679-84ac-9d1a-09dc-4894cd9d6979@redhat.com>
 <cdef7d37-1d8c-85c3-de0e-0730949bda92@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a7a4c787-8dd9-858f-c627-6b20809d30dd@redhat.com>
Date: Mon, 3 May 2021 13:53:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cdef7d37-1d8c-85c3-de0e-0730949bda92@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.05.21 13:51, Vladimir Sementsov-Ogievskiy wrote:
> 03.05.2021 14:49, Max Reitz wrote:
>> On 03.05.21 13:05, Kevin Wolf wrote:
>>> The error path needs to call tran_finalize(), too.
>>>
>>> Fixes: CID 1452773
>>> Fixes: 548a74c0dbc858edd1a7ee3045b5f2fe710bd8b1
>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>> ---
>>>   block.c | 7 ++++---
>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/block.c b/block.c
>>> index 874c22c43e..5c0ced6238 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -2918,13 +2918,14 @@ BdrvChild 
>>> *bdrv_root_attach_child(BlockDriverState *child_bs,
>>>                                      child_role, perm, shared_perm, 
>>> opaque,
>>>                                      &child, tran, errp);
>>>       if (ret < 0) {
>>> -        bdrv_unref(child_bs);
>>> -        return NULL;
>>> +        assert(child == NULL);
>>> +        goto out;
>>>       }
>>>       ret = bdrv_refresh_perms(child_bs, errp);
>>> -    tran_finalize(tran, ret);
>>> +out:
>>> +    tran_finalize(tran, ret);
>>>       bdrv_unref(child_bs);
>>>       return child;
>>
>> Looks OK, so:
>>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>
>> However, the function’s description says that it will return NULL on 
>> error.  But if bdrv_refresh_perms() fails, it will still return a 
>> non-NULL child.  Is that right?
>>
> 
> No, it's reset to NULL on transaction abort, so code is correct. It's 
> not obvious, and I've added a comment and assertion in my version of 
> this fix "[PATCH 1/6] block: fix leak of tran in bdrv_root_attach_child"

The fact that the transaction keeps the pointer to this local variable 
around is a bit horrifying, but well.

Max


