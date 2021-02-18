Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC1631EBF2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:04:28 +0100 (CET)
Received: from localhost ([::1]:55876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCln1-0000CS-Ju
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCllH-00082Y-Qu
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:02:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lCllC-0003Ct-3v
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613664152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+YdJCbSeNsPTbBjVriRKgk5sXfu5L627490OfHJZc4=;
 b=bUQ4qJ5t2mXUp8rWBSfKj+1umU+tpqX66FCgpMBkzX0IG7LfEJiOh7vEn1RkobIPxu5Jgf
 LCBbYvtHEX9FRvg/Bpy2kWI1IabTut1lTxyz0UfAeam7XY1eQqFRiQEjE4hDYmtVc8QtfF
 eWO/W+aqlv/U9FpqkAFUNix22g00PmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-EWjHju-0NcGCZCQAmY5vzg-1; Thu, 18 Feb 2021 11:02:30 -0500
X-MC-Unique: EWjHju-0NcGCZCQAmY5vzg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FA7A80197D;
 Thu, 18 Feb 2021 16:02:29 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-35.ams2.redhat.com
 [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84ECB19714;
 Thu, 18 Feb 2021 16:02:27 +0000 (UTC)
Subject: Re: [PATCH 3/7] block/qcow2: use compressed write cache
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <20210129165030.640169-4-vsementsov@virtuozzo.com>
 <446ebfd5-ac72-dc18-fde3-6cc7ffa73176@redhat.com>
 <cf19abbc-7d37-d483-e1b2-c36c22e9babd@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8b50ed82-5ed5-1d8e-2725-756665acfdcd@redhat.com>
Date: Thu, 18 Feb 2021 17:02:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cf19abbc-7d37-d483-e1b2-c36c22e9babd@virtuozzo.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.21 13:53, Vladimir Sementsov-Ogievskiy wrote:
> 10.02.2021 20:11, Max Reitz wrote:
>> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>>> Introduce a new option: compressed-cache-size, with default to 64
>>> clusters (to be not less than 64 default max-workers for backup job).
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   qapi/block-core.json   |  8 +++-
>>>   block/qcow2.h          |  4 ++
>>>   block/qcow2-refcount.c | 13 +++++++
>>>   block/qcow2.c          | 87 ++++++++++++++++++++++++++++++++++++++++--
>>>   4 files changed, 108 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index 9f555d5c1d..e0be6657f3 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -3202,6 +3202,11 @@
>>>   #             an image, the data file name is loaded from the image
>>>   #             file. (since 4.0)
>>>   #
>>> +# @compressed-cache-size: The maximum size of compressed write cache in
>>> +#                         bytes. If positive must be not less than
>>> +#                         cluster size. 0 disables the feature. Default
>>> +#                         is 64 * cluster_size. (since 6.0)
>>
>> Do we need this, really?  If you don’t use compression, the cache 
>> won’t use any memory, right?  Do you plan on using this option?
>>
>> I’d just set it to a sane default.
> 
> OK for me
> 
>>
>> OTOH, “a sane default” poses two questions, namely whether 64 * 
>> cluster_size is reasonable – with subclusters, the cluster size may be 
>> rather high, so 64 * cluster_size may well be like 128 MB.  Are 64 
>> clusters really necessary for a reasonable performance?
>>
>> Second, I think I could live with a rather high default if clusters 
>> are flushed as soon as they are full.  OTOH, as I briefly touched on, 
>> in practice, I suppose compressed images are just written to 
>> constantly, so even if clusters are flushed as soon as they are full, 
>> the cache will still remain full all the time.
>>
>>
>> Different topic: Why is the cache disableable?  I thought there are no 
>> downsides?
>>
> 
> to compare performance for example..

Well :D
Doesn’t seem like a reason to expose it to the outside, though, I don’t 
know.

Max


