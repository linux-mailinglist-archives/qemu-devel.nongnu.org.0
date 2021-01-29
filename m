Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9403086F9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:25:43 +0100 (CET)
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5P66-00021N-UF
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l5P3u-0001AQ-J6
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:23:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l5P3s-0006aS-MN
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611908603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzNTqAB06XuwOTbaHhD8nqrgsxvF2qtWdTOIiKii4H8=;
 b=XZOcbvK2xVl9q4NkCqPMoozBwUoyvhdRtmlVeZQkAC2OozirbQG2cMLj3pGqYCHnm7Ulsr
 gcGXeQvziDOZPt4XDJ5JlqHfQprs8bfD1OdU2mjnwf0nZKDMJDBrWW7oKiCvW1v1AFGffv
 Wr5HbOcotK/4tI2Qs1HoPZrgA0rRRmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-COwKxgAOOquhoDkq88f5vQ-1; Fri, 29 Jan 2021 03:23:20 -0500
X-MC-Unique: COwKxgAOOquhoDkq88f5vQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7514E84A5E1;
 Fri, 29 Jan 2021 08:23:19 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB631DB;
 Fri, 29 Jan 2021 08:23:17 +0000 (UTC)
Subject: Re: [PULL 14/53] block: apply COR-filter to block-stream jobs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
 <20210126142016.806073-15-mreitz@redhat.com>
 <9772b42b-8175-9433-7a56-405403d64dd9@redhat.com>
 <3aea506b-eba0-3068-be5e-d6fbb43e6cba@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f4e3aee6-5b64-5d1c-91a9-cb3206a01107@redhat.com>
Date: Fri, 29 Jan 2021 09:23:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3aea506b-eba0-3068-be5e-d6fbb43e6cba@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.01.21 06:26, Vladimir Sementsov-Ogievskiy wrote:
> 28.01.2021 21:38, Philippe Mathieu-Daudé wrote:
>> Hi Andrey,
>>
>> On 1/26/21 3:19 PM, Max Reitz wrote:
>>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>
>>> This patch completes the series with the COR-filter applied to
>>> block-stream operations.
>>>
>>> Adding the filter makes it possible in future implement discarding
>>> copied regions in backing files during the block-stream job, to reduce
>>> the disk overuse (we need control on permissions).
>>>
>>> Also, the filter now is smart enough to do copy-on-read with specified
>>> base, so we have benefit on guest reads even when doing block-stream of
>>> the part of the backing chain.
>>>
>>> Several iotests are slightly modified due to filter insertion.
>>>
>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> Message-Id: <20201216061703.70908-14-vsementsov@virtuozzo.com>
>>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   block/stream.c             | 105 ++++++++++++++++++++++---------------
>>>   tests/qemu-iotests/030     |   8 +--
>>>   tests/qemu-iotests/141.out |   2 +-
>>>   tests/qemu-iotests/245     |  20 ++++---
>>>   4 files changed, 80 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/block/stream.c b/block/stream.c
>> ...
>>> @@ -228,7 +211,9 @@ void stream_start(const char *job_id, 
>>> BlockDriverState *bs,
>>>       bool bs_read_only;
>>>       int basic_flags = BLK_PERM_CONSISTENT_READ | 
>>> BLK_PERM_WRITE_UNCHANGED;
>>>       BlockDriverState *base_overlay;
>>> +    BlockDriverState *cor_filter_bs = NULL;
>>>       BlockDriverState *above_base;
>>> +    QDict *opts;
>>>       assert(!(base && bottom));
>>>       assert(!(backing_file_str && bottom));
>>> @@ -266,30 +251,62 @@ void stream_start(const char *job_id, 
>>> BlockDriverState *bs,
>>>           }
>>>       }
>>> -    if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
>>> -        return;
>>> -    }
>>> -
>>>       /* Make sure that the image is opened in read-write mode */
>>>       bs_read_only = bdrv_is_read_only(bs);
>>>       if (bs_read_only) {
>>> -        if (bdrv_reopen_set_read_only(bs, false, errp) != 0) {
>>> -            bs_read_only = false;
>>> -            goto fail;
>>> +        int ret;
>>> +        /* Hold the chain during reopen */
>>> +        if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
>>> +            return;
>>> +        }
>>> +
>>> +        ret = bdrv_reopen_set_read_only(bs, false, errp);
>>> +
>>> +        /* failure, or cor-filter will hold the chain */
>>> +        bdrv_unfreeze_backing_chain(bs, above_base);
>>> +
>>> +        if (ret < 0) {
>>> +            return;
>>>           }
>>>       }
>>> -    /* Prevent concurrent jobs trying to modify the graph structure 
>>> here, we
>>> -     * already have our own plans. Also don't allow resize as the 
>>> image size is
>>> -     * queried only at the job start and then cached. */
>>> -    s = block_job_create(job_id, &stream_job_driver, NULL, bs,
>>> -                         basic_flags | BLK_PERM_GRAPH_MOD,
>>> +    opts = qdict_new();
>>
>> Coverity reported (CID 1445793) that this resource could be leaked...
>>
>>> +
>>> +    qdict_put_str(opts, "driver", "copy-on-read");
>>> +    qdict_put_str(opts, "file", bdrv_get_node_name(bs));
>>> +    /* Pass the base_overlay node name as 'bottom' to COR driver */
>>> +    qdict_put_str(opts, "bottom", base_overlay->node_name);
>>> +    if (filter_node_name) {
>>> +        qdict_put_str(opts, "node-name", filter_node_name);
>>> +    }
>>> +
>>> +    cor_filter_bs = bdrv_insert_node(bs, opts, BDRV_O_RDWR, errp);
>>> +    if (!cor_filter_bs) {
>>
>> ... probably here.
>>
>> Should we call g_free(opts) here?
> 
> 
> Actually, not..
> 
> bdrv_insert_node() calls bdrv_open() which eats options even on failure.
> 
> I see, CID already marked false-positive?

Yes, I did that.

This isn’t the first time Coverity has reported a failed bdrv_open() 
call would leak the options QDict.  Perhaps someone™ should look into 
why it likes to thinks that, but so far I haven’t been sufficiently 
bothered by it.

Max


