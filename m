Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515E36B1B0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 12:35:15 +0200 (CEST)
Received: from localhost ([::1]:43638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1layaA-0006ZG-Az
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 06:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1layZ1-000624-6n
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1layYz-000409-0l
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619433239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wq7xRLBA2wgcybhDWPhZAUPjVhZ80jkqeXILEyOKneU=;
 b=eFQGmBt2aGFYwQcWcW5d4ibIIzb5Ajuu7v+ygVQOO/nnpHL583aSAoI6MTmTVBmG8k71Y2
 4+1n9F+P8uGqdhoeQPVfpxC1KgaOjUxvB0Bvau9FCpdMl+Y8404tpBd9BnfY5TUy2Dw4ba
 r+1txOaIY6QTTQEKJRPUHoYQHlrsb4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-B0u6hkYvMPOl-Dqwdw2jtg-1; Mon, 26 Apr 2021 06:33:57 -0400
X-MC-Unique: B0u6hkYvMPOl-Dqwdw2jtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7552F83DD20;
 Mon, 26 Apr 2021 10:33:56 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-120.ams2.redhat.com
 [10.36.112.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 568121972B;
 Mon, 26 Apr 2021 10:33:51 +0000 (UTC)
Subject: Re: [PATCH 1/2] block/export: Free ignored Error
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210422145335.65814-1-mreitz@redhat.com>
 <20210422145335.65814-2-mreitz@redhat.com>
 <e1374b1a-67f0-b55e-2d3e-7440dea21b26@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <125519ee-718c-2647-cff1-b920a699223d@redhat.com>
Date: Mon, 26 Apr 2021 12:33:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e1374b1a-67f0-b55e-2d3e-7440dea21b26@virtuozzo.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.04.21 11:44, Vladimir Sementsov-Ogievskiy wrote:
> 22.04.2021 17:53, Max Reitz wrote:
>> When invoking block-export-add with some iothread and
>> fixed-iothread=false, and changing the node's iothread fails, the error
>> is supposed to be ignored.
>>
>> However, it is still stored in *errp, which is wrong.  If a second error
>> occurs, the "*errp must be NULL" assertion in error_setv() fails:
>>
>>    qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion
>>    `*errp == NULL' failed.
>>
>> So the error from bdrv_try_set_aio_context() must be freed when it is
>> ignored.
>>
>> Fixes: f51d23c80af73c95e0ce703ad06a300f1b3d63ef
>>         ("block/export: add iothread and fixed-iothread options")
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/export/export.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/block/export/export.c b/block/export/export.c
>> index fec7d9f738..ce5dd3e59b 100644
>> --- a/block/export/export.c
>> +++ b/block/export/export.c
>> @@ -68,6 +68,7 @@ static const BlockExportDriver 
>> *blk_exp_find_driver(BlockExportType type)
>>   BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
>>   {
>> +    ERRP_GUARD();
>>       bool fixed_iothread = export->has_fixed_iothread && 
>> export->fixed_iothread;
>>       const BlockExportDriver *drv;
>>       BlockExport *exp = NULL;
>> @@ -127,6 +128,9 @@ BlockExport *blk_exp_add(BlockExportOptions 
>> *export, Error **errp)
>>               ctx = new_ctx;
>>           } else if (fixed_iothread) {
>>               goto fail;
>> +        } else {
>> +            error_free(*errp);
>> +            *errp = NULL;
>>           }
>>       }
>>
> 
> I don't think ERRP_GUARD is needed in this case: we don't need to handle 
> errp somehow except for just free if it was set.

Perhaps not, but style-wise, I prefer not special-casing the
errp == NULL case.

(It can be argued that ERRP_GUARD similarly special-cases it, but that’s 
hidden from my view.  Also, the errp == NULL case actually doesn’t even 
happen, so ERRP_GUARD is effectively a no-op and it won’t cost 
performance (not that it really matters).)

Of course we could also do this:

ret = bdrv_try_set_aio_context(bs, new_ctx, fixed_iothread ? errp : NULL);

Would be even shorter.

> So we can simply do:
> 
> } else if (errp) {
>     error_free(*errp);
>     *errp = NULL;
> }
> 
> Let's only check that errp is really set on failure path of 
> bdrv_try_set_aio_context():

OK,  but out of interest, why?  error_free() doesn’t care.  I mean it 
might be a problem if blk_exp_add() returns an error without setting 
*errp, but that’d’ve been pre-existing.

Max

> bdrv_try_set_aio_context() fails iff bdrv_can_set_aio_context() fails, 
> which in turn may fail iff bdrv_parent_can_set_aio_context() or 
> bdrv_child_can_set_aio_context() fails.
> 
> bdrv_parent_can_set_aio_context() has two failure path, on first it set 
> errp by hand, and on second it has assertion that errp is set.
> 
> bdrv_child_can_set_aio_context() may fail only if nested call to 
> bdrv_can_set_aio_context() fails, so recursion is closed.
> 
> 


