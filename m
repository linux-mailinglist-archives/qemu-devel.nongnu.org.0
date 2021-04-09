Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C44359BD1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:20:16 +0200 (CEST)
Received: from localhost ([::1]:48654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUoFM-00022N-0f
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUoE1-00016T-CU
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:18:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUoDx-0002zg-Nj
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617963528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vfj1TqpRE5xD9SpKqnmo2DVYb8DHJd497FHdLkOzeMw=;
 b=SATFKJJJwwiz1EHse/Ee84emRyvJIP2Y/SASp9sEzytDeVFr8p94e2vRoqYIBQtUk2PLlK
 lKChW74b/2sF+y0gvCdgAGzZfU+kyN3e78OJkp/eczmV52rXjqUVyxHllB10dqYt7vNMcA
 /wce1Smh/C79BLo9stQxELJNIQ1zYgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-GhzGxypdOFyDtFMW0nenzA-1; Fri, 09 Apr 2021 06:18:46 -0400
X-MC-Unique: GhzGxypdOFyDtFMW0nenzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76FFF107ACC7;
 Fri,  9 Apr 2021 10:18:45 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-67.ams2.redhat.com
 [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 044AF6F965;
 Fri,  9 Apr 2021 10:18:43 +0000 (UTC)
Subject: Re: [PATCH for-6.0? 1/3] job: Add job_wait_unpaused() for
 block-job-complete
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20210408162039.242670-1-mreitz@redhat.com>
 <20210408162039.242670-2-mreitz@redhat.com>
 <505ba75a-996b-0c65-0c49-add50e55e3ce@virtuozzo.com>
 <66c60724-d3b5-383b-7a19-9e9498e1c132@redhat.com>
 <ad98de4b-a51f-1cce-c44d-a80110712a42@virtuozzo.com>
 <da048f58-43a6-6811-6ad2-0d7899737a23@redhat.com>
 <43b679be-5b06-5b29-755b-76966915a5dc@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <417fd780-520c-40b7-eb22-0a851b10c682@redhat.com>
Date: Fri, 9 Apr 2021 12:18:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <43b679be-5b06-5b29-755b-76966915a5dc@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.04.21 12:07, Vladimir Sementsov-Ogievskiy wrote:
> 09.04.2021 12:51, Max Reitz wrote:
>> On 08.04.21 19:26, Vladimir Sementsov-Ogievskiy wrote:
>>> 08.04.2021 20:04, John Snow wrote:
>>>> On 4/8/21 12:58 PM, Vladimir Sementsov-Ogievskiy wrote:
>>>>> job-complete command is async. Can we instead just add a boolean 
>>>>> like job->completion_requested, and set it if job-complete called 
>>>>> in STANDBY state, and on job_resume job_complete will be called 
>>>>> automatically if this boolean is true?
>>>>
>>>> job_complete has a synchronous setup, though -- we lose out on a lot 
>>>> of synchronous error checking in that circumstance.
>>>
>>> yes, that's a problem..
>>>
>>>>
>>>> I was not able to audit it to determine that it'd be safe to attempt 
>>>> that setup during a drained section -- I imagine it won't work and 
>>>> will fail, though.
>>>>
>>>> So I thought we'd have to signal completion and run the setup 
>>>> *later*, but what do we do if we get an error then? Does the entire 
>>>> job fail? Do we emit some new event? ("BLOCK_JOB_COMPLETION_FAILED" 
>>>> ?) Is it recoverable?
>>>>
>>>
>>> Isn't it possible even now, that after successful job-complete job 
>>> still fails and we report BLOCK_JOB_COMPLETED with error?
>>>
>>> And actually, how much benefit user get from the fact that 
>>> job-complete may fail?
>>>
>>> We can make job-complete a simple always-success boolean flag setter 
>>> like job-pause.
>>
>> I wanted to say the following:
>>
>>   But job-pause does always succeed, in contrast to block-job-complete.
>>
>>   block-job-complete is more akin to job-finalize, which too is a
>>   synchronous operation.
>>
>> But when I wrote that last sentence, I asked myself whether what 
>> mirror_complete() does isn’t actually a remnant of what we had to do 
>> when we didn’t have job-finalize yet.  Shouldn’t that all be in 
>> mirror_exit_common()?  What’s the advantage of opening the backing 
>> chain or putting blockers on the to-replace node in 
>> block-job-complete? Aren’t that all graph-changing operation, 
>> basically, i.e. stuff that should be done in job-finalize?
>>
>> If we move everything to mirror_exit_common(), all that remains to do 
>> is basically set some should_complete flag (could even be part of the 
>> Job struct), and then the whole problem disappears.
>>
>> Thoughts?
>>
> 
> Sounds good.. ButI want to understand first one simple thing: can job 
> fail even after block-job-complete succeeded?

Sure, if you get an I/O error afterwards.

> As I understand current users think that it can't. And 
> block-job-complete is documented as "This command completes an active 
> background block operation synchronously". So it's assumed that if 
> block-job-complete succeeded we are totally done.

I think the only thing that block-job-complete does is signal to the job 
it should exit once source and target have converged again.  (The READY 
event just says that source and target have converged once already.)

(Only in write-blocking copy mode is there a guarantee of source and 
target remaining converged after READY.)

Well, and of course mirror_complete() also does a couple of stuff that 
prepares replacing the source by the target.

> But maybe, it's wrong? Can mirror_prepare fail after mirror_complete 
> success?

Oh definitely.  For example, mirror_prepare replaces the source by the 
target, which can definitely fail.  (See mirror_exit_common().)

> And user must check job status after job is finalized? Or check 
> error in BLOCK_JOB_COMPLETED event?

If the BLOCK_JOB_COMPLETED event shows an error, then the job doesn’t 
even try to complete.  If there is an error on job-finalize, source and 
target have converged (so the target is consistent), but the source most 
likely couldn’t be replaced by the target.

I suppose in practice if anything goes wrong libvirt just shows an error 
and that’s it.  No matter where the error occurs exactly.

Max


