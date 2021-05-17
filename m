Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3BF38387B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:53:54 +0200 (CEST)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifZ3-0002mx-6M
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lifWg-00011T-2b
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:51:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lifWd-0003AX-Ti
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621266683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E6xNvbLn+2lTF2rLzJtCD/WGmDTQF24y2RVjtmPAyQw=;
 b=Fy51+V9j9LelMQQvuX5XM0FhZrd4aCoQiTyscG+hw9Ls8GoBNXVQn075U/a0yxsGms7sKk
 t0XDBJwg6OsGsIu/RxLveHXpeiyiBnEVRk9kcdoOPLa35e3iUpZZwIyuM8R8IzikL+uyiG
 VyrRjdahX/j5I4yyKXePdjEIWqvEkfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-jGNRdi_bN9CAARgeiuiLHw-1; Mon, 17 May 2021 11:51:20 -0400
X-MC-Unique: jGNRdi_bN9CAARgeiuiLHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D45641927803;
 Mon, 17 May 2021 15:51:18 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-29.ams2.redhat.com
 [10.36.113.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AA7610027A5;
 Mon, 17 May 2021 15:51:16 +0000 (UTC)
Subject: Re: [PATCH 01/21] block: introduce bdrv_replace_child_bs()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-3-vsementsov@virtuozzo.com>
 <ee302de8-bd22-b43c-f30f-eedce438d825@redhat.com>
 <554dc7c4-c16e-932b-21b1-e803cb1cee32@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <cdfbd6f3-0d87-942c-9037-6a80ff6a76d5@redhat.com>
Date: Mon, 17 May 2021 17:51:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <554dc7c4-c16e-932b-21b1-e803cb1cee32@virtuozzo.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17.05.21 16:30, Vladimir Sementsov-Ogievskiy wrote:
> 17.05.2021 15:09, Max Reitz wrote:
>> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>>> Add function to transactionally replace bs inside BdrvChild.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   include/block/block.h |  2 ++
>>>   block.c               | 36 ++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 38 insertions(+)
>>
>> As you may guess, I know little about the rewritten replacing 
>> functions, so this is kind of difficult to review for me.  However, 
>> nothing looks out of place, and the function looks sufficiently 
>> similar to bdrv_replace_node_common() to make me happy.
>>
>>> diff --git a/include/block/block.h b/include/block/block.h
>>> index 82185965ff..f9d5fcb108 100644
>>> --- a/include/block/block.h
>>> +++ b/include/block/block.h
>>> @@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, 
>>> BlockDriverState *bs_top,
>>>                   Error **errp);
>>>   int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>>>                         Error **errp);
>>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>>> +                          Error **errp);
>>>   BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict 
>>> *node_options,
>>>                                      int flags, Error **errp);
>>>   int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
>>> diff --git a/block.c b/block.c
>>> index 9ad725d205..755fa53d85 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -4961,6 +4961,42 @@ out:
>>>       return ret;
>>>   }
>>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>>> +                          Error **errp)
>>> +{
>>> +    int ret;
>>> +    Transaction *tran = tran_new();
>>> +    g_autoptr(GHashTable) found = NULL;
>>> +    g_autoptr(GSList) refresh_list = NULL;
>>> +    BlockDriverState *old_bs = child->bs;
>>> +
>>> +    if (old_bs) {
>>
>> Hm.  Can child->bs be ever NULL?
> 
> Hmm. Most probably not :)
> 
> In some intermediate states we don't have bs in child, but it shouldn't 
> be the place where bdrv_replace_child_bs is called.
> 
>>
>>> +        bdrv_ref(old_bs);
>>> +        bdrv_drained_begin(old_bs);
>>> +    }
>>> +    bdrv_drained_begin(new_bs);
>>
>> (I was wondering why we couldn’t handle the new_bs == NULL case here 
>> to replace bdrv_remove_filter_or_cow_child(), but then I realized it’s 
>> probably because that’s kind of difficult, precisely because child->bs 
>> at least should generally be non-NULL.  Which is why 
>> bdrv_remove_filter_or_cow_child() needs to add its own transaction 
>> entry to handle the BdrvChild object and the pointer to it.
>>
>> Hence me wondering whether we could assume child->bs not to be NULL.)
> 
> bdrv_remove_filter_or_cow_child() is "lower leve" function: it doesn't 
> do drained section nor permission update. And new 
> bdrv_replace_child_bs() is public function, which cares about these things.
> 
>>
>>> +
>>> +    bdrv_replace_child(child, new_bs, tran);
>>> +
>>> +    found = g_hash_table_new(NULL, NULL);
>>> +    if (old_bs) {
>>> +        refresh_list = bdrv_topological_dfs(refresh_list, found, 
>>> old_bs);
>>> +    }
>>> +    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
>>> +
>>> +    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
>>
>> Speaking of bdrv_remove_filter_or_cow_child(): That function doesn’t 
>> refresh permissions.  I think it’s correct to do it here, so the 
>> following question doesn’t really concern this patch, but: Why don’t 
>> we do it there?
>>
>> I guess it’s because we expect the node to go away anyway, so we don’t 
>> need to refresh the permissions.  And that assumption should hold true 
>> right now, given its callers.  But is that a safe assumption in 
>> general?  Would there be a problem if we refreshed permissions there?  
>> Or is not refreshing permissions just part of the function’s interface?
>>
> 
> Caller of bdrv_remove_filter_or_cow_child() should care about 
> permissions:  bdrv_replace_node_common() do this, and 
> bdrv_set_backing_noperm() has "_noperm" in the name..

OK.  Makes me wonder why bdrv_remove_filter_or_cow_child() then doesn’t 
have _noperm in its name, or why its comment doesn’t explain this 
interface contract, but, well. :)

> The main impact of previous big rework of permission is new scheme of 
> working with permission update:
> 
>   - first do all graph modifications, not thinking about permissions
>   - refresh permissions for the whole updated subgraph
>   - if refresh failed, rollback all the modifications (main sense if 
> transactions here and there is possibility to do this rollback)
> 
> So a lot of internal functions with @tran argument don't update 
> permissions. But of course, we should care to update permissions after 
> any graph modification.

Ah, OK.  Makes sense, thanks.

Max


