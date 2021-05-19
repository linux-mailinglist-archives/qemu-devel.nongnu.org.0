Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA756388C71
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:14:06 +0200 (CEST)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljK9N-0008EJ-T8
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ljK7L-0006lb-8W
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ljK7J-0007p6-1T
 for qemu-devel@nongnu.org; Wed, 19 May 2021 07:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621422716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wR0/TlGR+eCixQo/49z9uyLgyZj+D7vG2ZmarDjfZc=;
 b=JMI+iMU1GYt8lO5eR3ihDIbikkIpULQD3DjAmP0q7XoTDw4alsCg8A0/OpgfaIhOCShe1y
 v2YIXpfkXDal6YK0rlkNeliJTk7ecFtkmPMiPX0EhEK24zN9f6B43qD5V4Nss4jjYHAoW7
 0XWkNULF3VImvBmBmRL+7175hjLjnC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-Hh9_xlooMDKc9tOrrvh1nA-1; Wed, 19 May 2021 07:11:53 -0400
X-MC-Unique: Hh9_xlooMDKc9tOrrvh1nA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F01F5107ACCD;
 Wed, 19 May 2021 11:11:51 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-128.ams2.redhat.com
 [10.36.112.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8BF05C1CF;
 Wed, 19 May 2021 11:11:49 +0000 (UTC)
Subject: Re: [PATCH 01/21] block: introduce bdrv_replace_child_bs()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-3-vsementsov@virtuozzo.com>
 <ee302de8-bd22-b43c-f30f-eedce438d825@redhat.com>
 <7291edd6-f5e2-63d3-0633-9d55fd14cfc6@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <92564eed-8787-9720-210f-61cd8379698a@redhat.com>
Date: Wed, 19 May 2021 13:11:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7291edd6-f5e2-63d3-0633-9d55fd14cfc6@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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

On 19.05.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
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
> Seems it can. For example we have hmp_drive_del command, that removes bs 
> from blk :(
> 
> qmp eject and blockdev-remove-medium seems do it too.

blk_remove_bs() doesn’t eject the BDS from the BdrvChild blk->root, 
though, it drops blk->root altogether.  Doesn’t it?

Max


