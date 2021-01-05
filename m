Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5262EAB44
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 13:54:54 +0100 (CET)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwlrR-0003Rc-3K
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 07:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kwloC-0001I0-FN
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kwlo2-0004tz-I6
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609851078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sElePyBJ33UG2jMNuJUiJzsk50gB2TUFN4xyNP+HZBk=;
 b=JvFqCzWcrjWYMLtnUAIwpWPLj+SuKb/o2zP4pF3QFeRkvXZ/g2aoOlSGguceLuQFI+6sbJ
 ef7/XnpX7mVQBSgN5/qrgPOJ/wEvEiDBrFbio0tu1rr4pp5wC21dzOcko7x2+zJlGnOiyU
 VgDY9XP03pV108I08GZczHOT4joik84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-n2zOXJQqO1iWNx4UJAH0fw-1; Tue, 05 Jan 2021 07:51:17 -0500
X-MC-Unique: n2zOXJQqO1iWNx4UJAH0fw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3B1A1835869;
 Tue,  5 Jan 2021 12:51:15 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-1.ams2.redhat.com
 [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B0BA60855;
 Tue,  5 Jan 2021 12:51:07 +0000 (UTC)
Subject: Re: [PATCH v15 09/13] stream: rework backing-file changing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-10-vsementsov@virtuozzo.com>
 <48f91f57-3463-4f99-d15a-9a83446502f2@redhat.com>
 <a1a2ec98-517d-ae6b-21b5-e6ef9312c847@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8132a9a9-1cc4-a7af-558f-81d47b72d077@redhat.com>
Date: Tue, 5 Jan 2021 13:51:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a1a2ec98-517d-ae6b-21b5-e6ef9312c847@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.20 18:53, Vladimir Sementsov-Ogievskiy wrote:
> 22.12.2020 18:59, Max Reitz wrote:
>> On 16.12.20 07:16, Vladimir Sementsov-Ogievskiy wrote:
>>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>
>>> Stream in stream_prepare calls bdrv_change_backing_file() to change
>>> backing-file in the metadata of bs.
>>>
>>> It may use either backing-file parameter given by user or just take
>>> filename of base on job start.
>>>
>>> Backing file format is determined by base on job finish.
>>>
>>> There are some problems with this design, we solve only two by this
>>> patch:
>>>
>>> 1. Consider scenario with backing-file unset. Current concept of stream
>>> supports changing of the base during the job (we don't freeze link to
>>> the base). So, we should not save base filename at job start,
>>>
>>>    - let's determine name of the base on job finish.
>>>
>>> 2. Using direct base to determine filename and format is not very good:
>>> base node may be a filter, so its filename may be JSON, and format_name
>>> is not good for storing into qcow2 metadata as backing file format.
>>>
>>>    - let's use unfiltered_base
>>>
>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>    [vsementsov: change commit subject, change logic in stream_prepare]
>>> ---
>>>   block/stream.c | 9 +++++----
>>>   blockdev.c     | 8 +-------
>>>   2 files changed, 6 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/block/stream.c b/block/stream.c
>>> index 6e281c71ac..6a525a5edf 100644
>>> --- a/block/stream.c
>>> +++ b/block/stream.c
>>
>> [...]
>>
>>> @@ -73,10 +74,10 @@ static int stream_prepare(Job *job)
>>>       if (bdrv_cow_child(unfiltered_bs)) {
>>>           const char *base_id = NULL, *base_fmt = NULL;
>>> -        if (base) {
>>> -            base_id = s->backing_file_str;
>>> -            if (base->drv) {
>>> -                base_fmt = base->drv->format_name;
>>> +        if (unfiltered_base) {
>>> +            base_id = s->backing_file_str ?: unfiltered_base->filename;
>>> +            if (unfiltered_base->drv) {
>>> +                base_fmt = unfiltered_base->drv->format_name;
>>>               }
>>>           }
>>>           bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
>>
>> I think I preferred the v14 behavior of not setting a backing file 
>> format if backing_file_str is nowhere to be found in the current 
>> backing chain.  (I just noticed, I had a typo in my reply to v14, 
>> though; the “continuing on with setting a backing_fmt” should have 
>> read “continuing on *without* setting a backing_fmt”...)
>>
>> Anyway, this is still an improvement on the pre-patch behavior, so:
>>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>
>> (And as we discussed, the best would be for the user to specify a 
>> backing format through a yet-to-be-added option.)
>>
> 
> We discussed that the original aim of backing_file_str arg is something 
> like fd-passing, when qemu doesn't know real name. In that way what was 
> done in v14 is a degradation: we'll never find such name in a backing 
> chain. And acutally, using format of backing file is a correct thing.

It was my understanding that this was an example use case; other users 
might want to use backing-file for something else entirely.  (I imagined 
using e.g. a completely different file in a different format.)

OTOH, considering that “something else entirely” simply doesn’t work 
(because the driver has to be something from the backing chain), my 
imagination was just too wild.  If anyone should ever want to follow up 
on it, I expect them to complain, and we’ll worry about it then.

> So, as I understand now:
> 
> We set backing file to the node which is the new backing-bs (maybe, 
> skipping some filters). Nobody should set backing in qcow2 metadata to 
> something absolutely different. So, using format_name of backing bs 
> (skipping filters) is a correct thing.
> 
> We want to support cases when qemu doens't know real file-names. So, 
> trying to check filename, or search it in a backing chain is wrong idea..
> 
> Hmm, or when we search backing name, we really track what was written in 
> backing_file field of some qcow2 image in a chain, so it should be 
> something correct?

If it does something else than what people want it to do, they’ll 
complain. :)

(It isn’t like this patch is breaking anything that would work right now.)

So I agree that we don’t need backing-fmt now.  (Or maybe ever.)

Max

Max


