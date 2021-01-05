Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8B02EAB47
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 13:55:35 +0100 (CET)
Received: from localhost ([::1]:58502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwls7-0004KL-2Q
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 07:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kwlpD-0001o9-3Q
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kwlpB-0005CY-Cs
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609851152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gvq6j5UmMHNkBLkDpD8I/UF3ID/dmHiGqk52x73H1ZU=;
 b=YLrQjTloSLbQ1N+N4uuOlc+gX4Tqe+fIiK0Apr6pl5um5L53EmAidYqDgVLDDVPdBZsTTw
 TWjw3sKApl8NGiQx6LSv1Vijgr+IEgpTF2UrFxDAzycJtmzpUD8iEEWL9e/QIB2UEiy9Fy
 dPkS7d+K58rGmeQ6+G/yjYw5nAE6f8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-YhN_WAb7P3-cuhzNW-J9IA-1; Tue, 05 Jan 2021 07:52:31 -0500
X-MC-Unique: YhN_WAb7P3-cuhzNW-J9IA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A406659;
 Tue,  5 Jan 2021 12:52:29 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-1.ams2.redhat.com
 [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 971DC5B4A4;
 Tue,  5 Jan 2021 12:52:23 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v15 13/13] block: apply COR-filter to block-stream jobs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-14-vsementsov@virtuozzo.com>
 <fa2c8c5e-78b5-6d4a-6e23-aaec2249debb@redhat.com>
 <e1d9bfea-ff70-1a02-0422-d59ebf1dc011@virtuozzo.com>
Message-ID: <86990a8d-1c20-62ea-f18c-ff34af4b9cbc@redhat.com>
Date: Tue, 5 Jan 2021 13:52:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e1d9bfea-ff70-1a02-0422-d59ebf1dc011@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On 22.12.20 19:07, Vladimir Sementsov-Ogievskiy wrote:
> 22.12.2020 19:20, Max Reitz wrote:
>> On 16.12.20 07:17, Vladimir Sementsov-Ogievskiy wrote:
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
>>> ---
>>>   block/stream.c             | 105 ++++++++++++++++++++++---------------
>>>   tests/qemu-iotests/030     |   8 +--
>>>   tests/qemu-iotests/141.out |   2 +-
>>>   tests/qemu-iotests/245     |  20 ++++---
>>>   4 files changed, 80 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/block/stream.c b/block/stream.c
>>> index 626dfa2b22..1fa742b0db 100644
>>> --- a/block/stream.c
>>> +++ b/block/stream.c
>>
>> [...]
>>
>>> @@ -266,30 +251,62 @@ void stream_start(const char *job_id, 
>>> BlockDriverState *bs,
>>
>> [...]
>>
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
>>
>> Shouldn’t we keep the “bs_read_only = false;” here?
>>
> 
> No, as we don't goto fail.

Ah, right, then it won’t do anything.

> (pre-patch, we goto fail here, and don't want 
> fail: code path to reopend back to RW (as reopening to RO is failed 
> anyway (and we hope it's transactional enough)))

That’s why we had bs_read_only = false; pre-patch, so the reopen back to 
RW is skipped.

And with this patch, we don’t need anything else from the “fail” path 
(freezing is done by the filter, and the filter doesn’t exist yet), so 
it’s correct to condense the “bs_read_only = false; goto fail;” into a 
plain “return”.

Reviewed-by: Max Reitz <mreitz@redhat.com>


