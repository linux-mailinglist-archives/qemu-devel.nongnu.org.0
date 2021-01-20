Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F532FCDDC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:40:17 +0100 (CET)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2AuO-0000vi-OC
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2Atc-0000PF-MY
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:39:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2Ata-0004rQ-4u
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611139165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Foa8U2ELhcshvqJO1UmFwN4l7RbotHXpgi5AlM0z8/c=;
 b=egaGp14futrup8kynGb/timDedJY9AZF8QrfXZtDGF2iLm8SkOa4TXyXYtTNrogHf5x3dt
 A51sDyQvAhffEy3eh+4Td9NS1rOO2MZ79thAp7y9l4nShAhDpiPwQPBKuw72w4GivRzEi6
 Gtmxqnr9m+TeAw0E8fxSgY91RhQj8rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-uU1X2KXEPnKdQuxaXJ-5kg-1; Wed, 20 Jan 2021 05:39:21 -0500
X-MC-Unique: uU1X2KXEPnKdQuxaXJ-5kg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CDB98066F1;
 Wed, 20 Jan 2021 10:39:20 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-178.ams2.redhat.com
 [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F07EF1002382;
 Wed, 20 Jan 2021 10:39:17 +0000 (UTC)
Subject: Re: [PATCH v4 00/23] backup performance: block_status + async
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <3a5ea1b1-1137-4ac5-5aac-5bdec0b7b0d5@redhat.com>
 <eb6ad5ca-0254-c9a7-63e3-3a4619e397cd@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <29cccc86-a450-3326-2d70-f3022e32b5db@redhat.com>
Date: Wed, 20 Jan 2021 11:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <eb6ad5ca-0254-c9a7-63e3-3a4619e397cd@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.01.21 20:22, Vladimir Sementsov-Ogievskiy wrote:
> 19.01.2021 21:40, Max Reitz wrote:
>> On 16.01.21 22:46, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi Max!
>>> I applied my series onto yours 129-fixing and found, that 129 fails 
>>> for backup.
>>> And setting small max-chunk and even max-workers to 1 doesn't help! 
>>> (setting
>>> speed like in v3 still helps).
>>>
>>> And I found, that the problem is that really, the whole backup job 
>>> goes during
>>> drain, because in new architecture we do just job_yield() during the 
>>> whole
>>> background block-copy.
>>>
>>> This leads to modifying the existing patch in the series, which does 
>>> job_enter()
>>> from job_user_pause: we just need call job_enter() from job_pause() 
>>> to cover
>>> not only user pauses but also drained_begin.
>>>
>>> So, now I don't need any additional fixing of 129.
>>>
>>> Changes in v4:
>>> - add a lot of Max's r-b's, thanks!
>>>
>>> 03: fix over-80 line (in comment), add r-b
>>> 09: was "[PATCH v3 10/25] job: call job_enter from job_user_pause",
>>>      now changed to finally fix 129 iotest, drop r-b
>>>
>>> 10: squash-in additional wording on max-chunk, fix error message, 
>>> keep r-b
>>> 17: drop extra include, assert job_is_cancelled() instead of check, 
>>> add r-b
>>> 18: adjust commit message, add r-b
>>> 23: add comments and assertion, about the fact that test doesn't support
>>>      paths with colon inside
>>>      fix s/disable-copy-range/use-copy-range/
>>
>> Hmmm, for me, 129 sometimes fails still, because it completes too 
>> quickly...  (The error then is that 'return[0]' does not exist in 
>> query-block-jobs’s result, because the job is already gone.)
>>
>> When I insert a print(result) after the query-block-jobs, I can see 
>> that the job has always progressed really far, even if its still 
>> running. (Like, generally the offset is just one MB shy of 1G.)
>>
>> I suspect the problem is that block-copy just copies too much from the 
>> start (by default); i.e., it starts 64 workers with, hm, well, 1 MB of 
>> chunk size?  Shouldn’t fill the 128 MB immediately...
>>
>> Anyway, limiting the number of workers (to 1) and the chunk size (to 
>> 64k) with x-perf does ensure that the backup job’s progress is limited 
>> to 1 MB or so, which looks fine to me.
>>
>> I suppose we should do that, then (in 129), before patch 17?
> 
> Yes, that sounds reasonable
> 
>>
>> (PS: I can also see a MacOS failure in iotest 256.  I suspect it’s 
>> related to this series, because 256 is a backup test (with iothreads), 
>> but I’m not sure yet.  The log is here:
>>
>> https://cirrus-ci.com/task/5276331753603072
>> )
>>
> 
> qemu received signal 31 ?
> 
> googling for MacOS...
> 
>   31    SIGUSR2      terminate process    User defined signal 2

coroutine-sigaltstack uses SIGUSR2 to set up new coroutines.  Perhaps 
it’s unrelated to backup?  Guess I’ll just run the test one more time. O:)

Max


