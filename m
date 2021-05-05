Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA6A374359
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:13:03 +0200 (CEST)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leL54-0000zr-4n
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leKLJ-00021l-96
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1leKLG-0003p6-Bo
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620231941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuaeK2f9mN8U9L/XEH6DS6+tp2HVIMqwEJqwoyIfvCE=;
 b=cls1JO6YBGjvMG+NogNdlZJn7wRDqvfZfioi49LkfP9b/uLAPSizjRg527YehZ2QzNninl
 TwhBT+hebs1rcvzi+H1lbdi5thOBwlyoPCqm0tXWtfOYcAQr6xMJSCD9mTmuYs4b+2E3d2
 an2N0SP698Bav8J3ZFv8pz+evus6ZtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-LPNpn2N2NAifUN2qFNlrCw-1; Wed, 05 May 2021 12:25:37 -0400
X-MC-Unique: LPNpn2N2NAifUN2qFNlrCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FC84107ACC7;
 Wed,  5 May 2021 16:25:36 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-153.ams2.redhat.com
 [10.36.115.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCEF719C46;
 Wed,  5 May 2021 16:25:34 +0000 (UTC)
Subject: Re: [PATCH] block/snapshot: Clarify goto fallback behavior
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210503095418.31521-1-mreitz@redhat.com>
 <29db0d1f-2d60-7df6-e6d0-97b89cf636ef@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <11eaa840-a882-3ba9-3069-91501b4c92fe@redhat.com>
Date: Wed, 5 May 2021 18:25:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <29db0d1f-2d60-7df6-e6d0-97b89cf636ef@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Kevin Wolf <kwolf@redhat.com>, gregory.farnum@dreamhost.com,
 qemu-devel@nongnu.org, morita.kazutaka@lab.ntt.co.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.05.21 17:05, Vladimir Sementsov-Ogievskiy wrote:
> 03.05.2021 12:54, Max Reitz wrote:
>> In the bdrv_snapshot_goto() fallback code, we work with a pointer to
>> either bs->file or bs->backing. 
> 
>> We close that child,
> 
> Do we?

We *detach it.

>> close the node
>> (with .bdrv_close()), apply the snapshot on the child node, and then
>> re-open the node (with .bdrv_open()).
>>
>> In order for .bdrv_open() to attach the same child node that we had
>> before, we pass "file={child-node}" or "backing={child-node}" to it.
>> Therefore, when .bdrv_open() has returned success, we can assume that
>> bs->file or bs->backing (respectively) points to our original child
>> again.  This is verified by an assertion.
>>
>> All of this is not immediately clear from a quick glance at the code,
>> so add a comment to the assertion what it is for, and why it is valid.
>> It certainly confused Coverity.
>>
>> Reported-by: Coverity (CID 1452774)
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/snapshot.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/snapshot.c b/block/snapshot.c
>> index e8ae9a28c1..cce5e35b35 100644
>> --- a/block/snapshot.c
>> +++ b/block/snapshot.c
>> @@ -275,13 +275,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>>           qobject_unref(file_options);
>>           g_free(subqdict_prefix);
>> +        /* Force .bdrv_open() below to re-attach fallback_bs on 
>> *fallback_ptr */
>>           qdict_put_str(options, (*fallback_ptr)->name,
>>                         bdrv_get_node_name(fallback_bs));
>> +        /* Now close bs, apply the snapshot on fallback_bs, and 
>> re-open bs */
>>           if (drv->bdrv_close) {
>>               drv->bdrv_close(bs);
>>           }
>> +        /* .bdrv_open() will re-attach it */
>>           bdrv_unref_child(bs, *fallback_ptr);
>>           *fallback_ptr = NULL;
>> @@ -296,7 +299,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>>               return ret < 0 ? ret : open_ret;
>>           }
>> -        assert(fallback_bs == (*fallback_ptr)->bs);
>> +        /*
>> +         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
>> +         * was closed above and set to NULL, but the .bdrv_open() call
>> +         * has opened it again, because we set the respective option
>> +         * (with the qdict_put_str() call above).
>> +         * Assert that .bdrv_open() has attached some child on
>> +         * *fallback_ptr, and that it has attached the one we wanted
>> +         * it to (i.e., fallback_bs).
>> +         */
>> +        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
>>           bdrv_unref(fallback_bs);
>>           return ret;
>>       }
>>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> ===
> 
> I still think that this fallback has more problems.. Nothing guarantee 
> that all format drivers (even restricted to those who have only one 
> child) support such logic.
> 
> For example, .bdrv_open() may rely on state structure were zeroed and 
> not initialize some fields. And .bdrv_close() may just g_free() some 
> things, not setting them to zero.. So we probably should call 
> bdrv_open()/bdrv_close() generic functions. But we can't: at least 
> bdrv_close() requires that node has no parents.
> 
> Not saying about that we lose everything on failure (when actually, it's 
> better to restore original state on failure).
> 
> This feature should instead be done with help of bdrv_reopen_multiple(), 
> and even with it it's not obvious how to do it properly.
> 
> The feature were done long ago in 2010 with commit 
> 7cdb1f6d305e1000b5f882257cbee71b8bb08ef5 by Morita Kazutaka.
> 
> Note also, that the only protocol driver that support snapshots is rbd, 
> and snapshot support was added to it in 2012 with commit 
> bd6032470631d8d5de6db84ecb55398b70d9d2f3 by Gregory Farnum.
> 
> Other two drivers with support are sheepdog (which is deprecated) and 
> qcow2 (I doubt that it should be used as protocol driver for some other 
> format).
> 
> 
> Do we really need this fallback? Is it used somewhere? May be, we can 
> just deprecate it, and look will someone complain?

Maybe? :)

Max


