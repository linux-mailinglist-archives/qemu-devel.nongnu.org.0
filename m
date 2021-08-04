Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE93DFC7D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:08:59 +0200 (CEST)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBBxS-00048G-Nn
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBBvv-0002bu-CC
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBBvs-0006XB-JH
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628064439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDxbm940JsOSf0x2EP+cydrrvDNg+Ve2z3WOQXX3otU=;
 b=W1bpCPcks21EalkXIALoQpr6FqPgnvuCekazEweP5KyQgb9UsiulN4SIWqCzk+IMA+CfaU
 tFc+q5Mp02Buk/f8/2JIfWfWu/saAVprqi2zr6FfCVBqZTAEwbqZlDkYY3DxB29z38iwko
 n71xoY+GKvBaIk6tnA90vCQ96rDRFkg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-OkVBjttqOq2-SwYyvKZw4A-1; Wed, 04 Aug 2021 04:07:18 -0400
X-MC-Unique: OkVBjttqOq2-SwYyvKZw4A-1
Received: by mail-wm1-f71.google.com with SMTP id
 o26-20020a05600c511ab0290252d0248251so488575wms.1
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sDxbm940JsOSf0x2EP+cydrrvDNg+Ve2z3WOQXX3otU=;
 b=nPAAb8bkf3ublBn+bhwBtK/MF3Npzm6m4tV1QImhgpXewedqctT9iU+bCzSmKx/Dsd
 UDs683fD0U/y7BcW6Br31NTLCFE4xviHKwAGWymLcbhheZLI3ZZ6rAVtl2XjuC8y0pfw
 in8yPcTbgOqiZlYnGW2WbU7pAK//2WflKy0I3u1zFcuaBn5tUWUIhGPSA7FPYZJxcadG
 3GBnO+X7B2rRyezu+Sd3GLtj1oaK+piZ+zowhoTTqHugDpItkTzNdKQEkOeoY2o+vzAJ
 iZUk+JBz9tvcckfbb2RW6N+T9anP2YAMavyZxkiPBpbPP/Qv3koKL2W+B7aOx9cu85wf
 ZW3Q==
X-Gm-Message-State: AOAM531+NUvPFeF0mL00myaCk+XY9Y0XAmTpowhse0vuVyFSWr+Mb9dm
 EgVWwWMPbSkt8eknbgkChLpp0+n0AlGILf9jsClTrQ6CfOCtQFSmZjSD+KtHIF/5klEtl0mI8+9
 NPsCgHy5hy3wxrxE=
X-Received: by 2002:adf:db07:: with SMTP id s7mr28364333wri.106.1628064437348; 
 Wed, 04 Aug 2021 01:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYSrPke5hOp+2BuTc1qi731TvimMwIS5Y3vWnnxtHUTcGTsoCFPooL3u+fF38VKY63K28E8A==
X-Received: by 2002:adf:db07:: with SMTP id s7mr28364295wri.106.1628064437016; 
 Wed, 04 Aug 2021 01:07:17 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 f194sm5169607wmf.23.2021.08.04.01.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 01:07:16 -0700 (PDT)
Subject: Re: [PATCH for-6.1? v2 5/7] job: Add job_cancel_requested()
To: Kevin Wolf <kwolf@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-6-mreitz@redhat.com> <YQlRzOzXOxeBLb0B@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <13d07f4b-9659-4576-1757-a7d75f7e16c2@redhat.com>
Date: Wed, 4 Aug 2021 10:07:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQlRzOzXOxeBLb0B@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.08.21 16:25, Kevin Wolf wrote:
> Am 26.07.2021 um 16:46 hat Max Reitz geschrieben:
>> Most callers of job_is_cancelled() actually want to know whether the job
>> is on its way to immediate termination.  For example, we refuse to pause
>> jobs that are cancelled; but this only makes sense for jobs that are
>> really actually cancelled.
>>
>> A mirror job that is cancelled during READY with force=false should
>> absolutely be allowed to pause.  This "cancellation" (which is actually
>> a kind of completion) may take an indefinite amount of time, and so
>> should behave like any job during normal operation.  For example, with
>> on-target-error=stop, the job should stop on write errors.  (In
>> contrast, force-cancelled jobs should not get write errors, as they
>> should just terminate and not do further I/O.)
>>
>> Therefore, redefine job_is_cancelled() to only return true for jobs that
>> are force-cancelled (which as of HEAD^ means any job that interprets the
>> cancellation request as a request for immediate termination), and add
>> job_cancel_request() as the general variant, which returns true for any
>> jobs which have been requested to be cancelled, whether it be
>> immediately or after an arbitrarily long completion phase.
>>
>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   include/qemu/job.h |  8 +++++++-
>>   block/mirror.c     | 10 ++++------
>>   job.c              |  7 ++++++-
>>   3 files changed, 17 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 8aa90f7395..032edf3c5f 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
>>   /** Returns true if the job should not be visible to the management layer. */
>>   bool job_is_internal(Job *job);
>>   
>> -/** Returns whether the job is scheduled for cancellation. */
>> +/** Returns whether the job is being cancelled. */
>>   bool job_is_cancelled(Job *job);
>>   
>> +/**
>> + * Returns whether the job is scheduled for cancellation (at an
>> + * indefinite point).
>> + */
>> +bool job_cancel_requested(Job *job);
> I don't think non-force blockdev-cancel for mirror should actually be
> considered cancellation, so what is the question that this function
> answers?
>
> "Is this a cancelled job, or a mirror block job that is supposed to
> complete soon, but only if it doesn't switch over the users to the
> target on completion"?

Well, technically yes, but it was more intended as “Has the user ever 
invoked (block-)job-cancel on this job?”.

> Is this ever a reasonable question to ask, except maybe inside the
> mirror implementation itself?

I asked myself the same for v3, but found two places in job.c where I 
would like to keep it:

First, there’s an assertion in job_completed_txn_abort().  All jobs 
other than @job have been force-cancelled, and so job_is_cancelled() 
would be true for them.  As for @job itself, the function is mostly 
called when the job’s return value is not 0, but a soft-cancelled mirror 
does have a return value of 0 and so would not end up in that function.
But job_cancel() invokes job_completed_txn_abort() if the job has been 
deferred to the main loop, which mostly correlates with the job having 
been completed (in which case the assertion is skipped), but not 100 % 
(there’s a small window between setting deferred_to_main_loop and the 
job changing to a completed state).
So I’d prefer to keep the assertion as-is functionally, i.e. to only 
check job->cancelled.

Second, job_complete() refuses to let a job complete that has been 
cancelled.  This function is basically only invoked by the user (through 
qmp_block_job_complete()/qmp_job_complete(), or job_complete_sync(), 
which comes from qemu-img), so I believe that it should correspond to 
the external interface we have right now; i.e., if the user has invoked 
(block-)job-cancel at one point, job_complete() should generally return 
an error.

> job_complete() is the only function outside of mirror that seems to use
> it. But even there, it feels wrong to make a difference. Either we
> accept redundant completion requests, or we don't. It doesn't really
> matter how the job reconfigures the graph on completion. (Also, I feel
> this should really have been part of the state machine, but I'm not sure
> if we want to touch it now...)

Well, yes, I don’t think it makes a difference because I don’t think 
anyone will first tell the job via block-job-cancel to complete without 
pivoting, and then change their mind and call block-job-complete after 
all.  (Not least because that’s an error pre-series.)

Also, I’m not even sure whether completing after a soft cancel request 
works.  I don’t think any of our code accounts for such a case, so I’d 
rather avoid allowing it if there’s no need to allow it anyway.

Max


