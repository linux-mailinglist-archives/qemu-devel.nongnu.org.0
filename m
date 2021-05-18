Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B792B3875F4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:04:21 +0200 (CEST)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwaK-0002kE-PE
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1liwAJ-0003h9-0h
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1liwAH-0005oH-3r
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBz9QTT9pep7AG1dt3AoSjuGZzqwS5Wxu2+kXCFJC3o=;
 b=arjDHvYYPD8a5ZUQzd11fgMmAWaR4pcbfghmODPZZ8ZIfGZiUDUrM8n8srYZZhNvLFQaeH
 aDolO7C2xApNkKoIk2r1NZclHxaWY3T2niO7uSsBE82DcHgKbpGQl1rNoSE0vNGGKsR1LZ
 JLtVxP2jwhP6gW5/4G6G5IE37ggQXho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-hliNXusXO1quu50n2yNUhg-1; Tue, 18 May 2021 05:37:22 -0400
X-MC-Unique: hliNXusXO1quu50n2yNUhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0EFE180FD62;
 Tue, 18 May 2021 09:37:21 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-121.ams2.redhat.com
 [10.36.115.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 606C951C48;
 Tue, 18 May 2021 09:37:18 +0000 (UTC)
Subject: Re: [PATCH 05/21] block: rename backup-top to copy-before-write
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-7-vsementsov@virtuozzo.com>
 <75715377-5f8e-7be6-6fab-f87b015a33e3@redhat.com>
 <22561008-81a7-d8ba-3895-440437168b92@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c0abac5f-9c8f-b205-e919-f4f6ca259fb9@redhat.com>
Date: Tue, 18 May 2021 11:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <22561008-81a7-d8ba-3895-440437168b92@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On 17.05.21 21:42, Vladimir Sementsov-Ogievskiy wrote:
> 17.05.2021 19:05, Max Reitz wrote:
>> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>>> We are going to convert backup_top to full featured public filter,
>>> which can be used in separate of backup job. Start from renaming from
>>> "how it used" to "what it does".
>>
>> Is this safe?  The name was externally visible in queries after all. 
>> (I’m not saying it is unsafe, I just don’t know and would like to know 
>> whether you’ve considered this already.)
>>
>> (Regardless, renaming files and so on is fine, of course.)
> 
> Hmmm. I don't know.
> 
> It was visible yes.. But we've never documented it. And if someone 
> depends on name of the format of the filter automatically inserted 
> during backup job, it's a kind of "undocumented feature" use..
> 
> Another change I is changing child from backing to file in 11, from this 
> point of view it's unsafe too. But ше even more reasonable than good 
> name: having all public filters behave similar is a very good thing.
> 
> So, may be it a bit risky, but I think good interface worth that risk. 
> And we always can say "sorry guys, but that was not documented, we 
> didn't promise anything".

OK.

Max

> But I'm OK to go on with "backup-top" and "backing", is someone has 
> strict opinion about this.
> 
>>
>>> While updating comments in 283 iotest, drop and rephrase also things
>>> about ".active", as this field is now dropped, and filter doesn't have
>>> "inactive" mode.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   block/{backup-top.h => copy-before-write.h} |  28 +++---
>>>   block/backup.c                              |  22 ++---
>>>   block/{backup-top.c => copy-before-write.c} | 100 ++++++++++----------
>>>   MAINTAINERS                                 |   4 +-
>>>   block/meson.build                           |   2 +-
>>>   tests/qemu-iotests/283                      |  35 +++----
>>>   tests/qemu-iotests/283.out                  |   4 +-
>>>   7 files changed, 95 insertions(+), 100 deletions(-)
>>>   rename block/{backup-top.h => copy-before-write.h} (56%)
>>>   rename block/{backup-top.c => copy-before-write.c} (62%)
>>
>> [...]
>>
>>> diff --git a/block/backup-top.c b/block/copy-before-write.c
>>> similarity index 62%
>>> rename from block/backup-top.c
>>> rename to block/copy-before-write.c
>>> index 425e3778be..40e91832d7 100644
>>> --- a/block/backup-top.c
>>> +++ b/block/copy-before-write.c
>>
>> [...]
>>
>>> @@ -32,25 +32,25 @@
>>
>> [...]
>>
>>> -static coroutine_fn int backup_top_cbw(BlockDriverState *bs, 
>>> uint64_t offset,
>>> -                                       uint64_t bytes, 
>>> BdrvRequestFlags flags)
>>> +static coroutine_fn int cbw_cbw(BlockDriverState *bs, uint64_t offset,
>>> +                                uint64_t bytes, BdrvRequestFlags flags)
>>
>> I’m sure you noticed it, too, but cbw_cbw() is weird.  Perhaps 
>> cbw_do_cbw() at least?
>>
> 
> OK. Maybe even cbw_do_copy_before_write()
> 
> 


