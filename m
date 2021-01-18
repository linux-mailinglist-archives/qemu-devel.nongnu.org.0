Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E192FA2CE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:22:17 +0100 (CET)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1VQ8-00016k-VF
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1VOd-0000V8-Gy
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:20:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1VOb-0000j6-0H
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610979640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGPpLzYOGthYNpZGvEwPGWh8wUf1bBYSWQTD57w+ULQ=;
 b=ZUoZJPgV+fOMkLSlw33NEie/BdF507CjTusyUk3uYXRL/nJpU/2McGGc+IA308pht4+9rk
 SvjyKqU3N3e33ytwhzc3mpxBaDcpt0u/EqRoJwcrW3D99AcX0G5xWdpdXJ5aBzzsp/2WlA
 G+qY5aegvclJ/bnKyW7g7Bx85OW/Ggs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-DRBspz_zN2qZdli_CT2Eng-1; Mon, 18 Jan 2021 09:20:38 -0500
X-MC-Unique: DRBspz_zN2qZdli_CT2Eng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 013D9107ACF5;
 Mon, 18 Jan 2021 14:20:37 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B56201F471;
 Mon, 18 Jan 2021 14:20:34 +0000 (UTC)
Subject: Re: [PATCH v4 09/23] job: call job_enter from job_pause
From: Max Reitz <mreitz@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <20210116214705.822267-10-vsementsov@virtuozzo.com>
 <cbd92d66-c403-e37e-2bf9-2c301f9fd667@redhat.com>
Message-ID: <d68bbac5-0c19-7ee5-fd79-1f4c7d688a9f@redhat.com>
Date: Mon, 18 Jan 2021 15:20:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cbd92d66-c403-e37e-2bf9-2c301f9fd667@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 18.01.21 14:45, Max Reitz wrote:
> On 16.01.21 22:46, Vladimir Sementsov-Ogievskiy wrote:
>> If main job coroutine called job_yield (while some background process
>> is in progress), we should give it a chance to call job_pause_point().
>> It will be used in backup, when moved on async block-copy.
>>
>> Note, that job_user_pause is not enough: we want to handle
>> child_job_drained_begin() as well, which call job_pause().
> 
> OK.
> 
>> Still, if job is already in job_do_yield() in job_pause_point() we
>> should not enter it.
> 
> Agreed.
> 
>> iotest 109 output is modified: on stop we do bdrv_drain_all() which now
>> triggers job pause immediately (and pause after ready is standby).
> 
> Sounds like a good thing.
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   job.c                      |  3 +++
>>   tests/qemu-iotests/109.out | 24 ++++++++++++++++++++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/job.c b/job.c
>> index 8fecf38960..3aaaebafe2 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -553,6 +553,9 @@ static bool job_timer_not_pending(Job *job)
>>   void job_pause(Job *job)
>>   {
>>       job->pause_count++;
>> +    if (!job->paused) {
>> +        job_enter(job);
>> +    }
>>   }
> 
> I see job_pause is also called from block_job_error_action() – should we 
> reenter the job there, too?
> 
> (It looks to me like e.g. mirror would basically just continue to run, 
> then, until it needs to yield because of some other issue.  I don’t know 
> whether that’s a problem, because I suppose we don’t guarantee to stop 
> immediately on an error, though I suspect users would expect us to do 
> that as early as possible (i.e., not to launch new requests).
> 
> [Quite some time later]
> 
> I’ve now tested a mirror job that stops due to a target error, and it 
> actually does not make any progress; or at least it doesn’t report any. 
>   So it looks like my concern is unjustified.  I don’t know why it’s 
> unjustified, though, so perhaps you can explain it before I give my R-b 
> O:))

Oh, I guess because job_enter_cond() doesn’t enter if the job is busy 
already.  That would make a lot of sense, so I’m going to assume that’s 
what’s preventing the job_enter() to do anything if the job is already 
running (which it has to be to invoke block_job_error_action()).

Reviewed-by: Max Reitz <mreitz@redhat.com>


