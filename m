Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98671319BDB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 10:27:11 +0100 (CET)
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUjG-00024p-Ns
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 04:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAUhb-0001Ck-2y
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAUhU-0005tl-S4
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613121919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G13VzGXrnKdWIPnPRY74DAhH7rgNtWPYpG7JwtSviIU=;
 b=i3rUCGqC+zJb+LbJkZHEnO+q4TkC9rlMNUVWDDbYWHsuycyjRyY6QtOKWE5XANq5s4uw9x
 9wD0IDQ/WuDBheJT20xZddR6IP785w5+FY7W7vANeewzkzK1UrEg1Qap/8yY39fRHRrILp
 68ufxorNjbTegFgnuROlRucwi8/OKxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-RLjJCbRFO9esuqlzH9V_MQ-1; Fri, 12 Feb 2021 04:25:16 -0500
X-MC-Unique: RLjJCbRFO9esuqlzH9V_MQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F80DDF8A4;
 Fri, 12 Feb 2021 09:25:15 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-227.ams2.redhat.com
 [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0B281A879;
 Fri, 12 Feb 2021 09:25:13 +0000 (UTC)
Subject: Re: [PATCH 2/2] file-posix: Cache next hole
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20210211172242.146671-1-mreitz@redhat.com>
 <20210211172242.146671-3-mreitz@redhat.com>
 <f86be907-ddc3-9629-1179-ccf585c013ae@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <176f890a-5df5-2e68-c29c-b22d312bf977@redhat.com>
Date: Fri, 12 Feb 2021 10:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f86be907-ddc3-9629-1179-ccf585c013ae@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.21 21:00, Eric Blake wrote:
> On 2/11/21 11:22 AM, Max Reitz wrote:
>> We have repeatedly received reports that SEEK_HOLE and SEEK_DATA are
>> slow on certain filesystems and/or under certain circumstances.  That is
>> why we generally try to avoid it (which is why bdrv_co_block_status()
>> has the @want_zero parameter, and which is why qcow2 has a metadata
>> preallocation detection, so we do not fall through to the protocol layer
>> to discover which blocks are zero, unless that is really necessary
>> (i.e., for metadata-preallocated images)).
>>
>> In addition to those measures, we can also try to speed up zero
>> detection by letting file-posix cache some hole location information,
>> namely where the next hole after the most recently queried offset is.
>> This helps especially for images that are (nearly) fully allocated,
>> which is coincidentally also the case where querying for zero
>> information cannot gain us much.
>>
>> Note that this of course only works so long as we have no concurrent
>> writers to the image, which is the case when the WRITE capability is not
>> shared.
>>
>> Alternatively (or perhaps as an improvement in the future), we could let
>> file-posix keep track of what it knows is zero and what it knows is
>> non-zero with bitmaps, which would help images that actually have a
>> significant number of holes (where this implementation here cannot do
>> much).  But for such images, SEEK_HOLE/DATA are generally faster (they
>> do not need to seek through the whole file), and the performance lost by
>> querying the block status does not feel as bad because it is outweighed
>> by the performance that can be saved by special-cases zeroed areas, so
>> focussing on images that are (nearly) fully allocated is more important.
> 
> focusing

Wiktionary lists both as valid. *shrug*

>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/file-posix.c | 81 +++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 80 insertions(+), 1 deletion(-)
>>
> 
>>   static int find_allocation(BlockDriverState *bs, off_t start,
>>                              off_t *data, off_t *hole)
>>   {
>> -#if defined SEEK_HOLE && defined SEEK_DATA
>>       BDRVRawState *s = bs->opaque;
>> +
>> +    if (s->next_zero_offset_valid) {
>> +        if (start >= s->next_zero_offset_from && start < s->next_zero_offset) {
>> +            *data = start;
>> +            *hole = s->next_zero_offset;
>> +            return 0;
>> +        }
>> +    }
>> +
>> +#if defined SEEK_HOLE && defined SEEK_DATA
> 
> Why move the #if? If SEEK_HOLE is not defined, s->next_zero_offset_valid
> should never be set, because we'll treat the entire image as data.  But
> at the same time, it doesn't hurt, so doesn't stop my review.

I found it better to put it outside the SEEK_HOLE/DATA section, because 
while it won’t work when neither are defined, the code is still valid.

I don’t know. :)

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

Max


