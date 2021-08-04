Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54063DFCCE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:27:54 +0200 (CEST)
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCFl-0005o3-Vi
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBCDE-0001K0-4u
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:25:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mBCDA-0004Sj-SN
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=716DoHE66/4/SVHidi5SZIDomJ0ma/XXmN2LPro6/3g=;
 b=PC+J0EJQocx8jgav8s5JDsybKa4lldK6F3xwi4UNlW7cnls4ofgges27O/xyRFCJ0500jW
 KDYkn6SgKy08DgkPNCZLQ3OpLHMoRJ6iC8DmUS2aSXeQrVjlzvDphk92yPyeblfJMZJgBM
 OXCCrrgUrvrbLeOfIxPLRLZ775mGagE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-98EHjtwLM8eNRBbc0K4j4g-1; Wed, 04 Aug 2021 04:25:11 -0400
X-MC-Unique: 98EHjtwLM8eNRBbc0K4j4g-1
Received: by mail-wr1-f69.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso519850wri.18
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=716DoHE66/4/SVHidi5SZIDomJ0ma/XXmN2LPro6/3g=;
 b=PkGX5KP8jTicIYhg3m7WnhMDW45DY+tlh+NuvW+nRSIaqYasv+qiM6e3JW6q8CF9eO
 6gqz9oZl3CyArp+uJ2oLS/dOt8EUFr0lM9gS6hTZa45QCcuSdLjtY+5Zj6LkVaO1fVYz
 6bffP+uEDapKM9cBT/cuVnJKJ9his2bbv18Irxeftj+7D7ZE0sU3DmRxcJlKOjrjJldq
 Ci0X0pawcbHu2cQBIISsQeCXT5Uv0qDtWtwP8QyY7ls6i6tPQIH5LNJYR1yQhdsMh160
 HbWUabkOHjjlmPtEuyvXbc9S2OKXOLG2sUzUIFFyWbdnySnNYPicXG50p9M9D+Cof5qX
 EC3A==
X-Gm-Message-State: AOAM5329VXmtepTsCfttw85Y366WLqwZUjc1C7NNA0BcqcK8JjoRuPmV
 e1vXRLB2bDXd0ypzQS/Oao5KAzuXt3ZAQdRD4G+6x/KeFLHpScK43sdf8BZE+N/dCcKqUE9pmHY
 61y3xQgqoTobY86M=
X-Received: by 2002:a5d:6545:: with SMTP id z5mr3090711wrv.167.1628065509975; 
 Wed, 04 Aug 2021 01:25:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzos1CiR1NkTexG1D93R7mb0MUovcI3ISCsBDEtyCgqbFYTK0NBF0Ve3Q8ynBxMXQhPEnlssg==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr3090675wrv.167.1628065509645; 
 Wed, 04 Aug 2021 01:25:09 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 h8sm5079656wmb.35.2021.08.04.01.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 01:25:08 -0700 (PDT)
Subject: Re: [PATCH for-6.1? v2 6/7] mirror: Check job_is_cancelled() earlier
To: Kevin Wolf <kwolf@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-7-mreitz@redhat.com> <YQlT4rO9OoykGl/b@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <cbf2f3c8-6e7a-b277-f90a-483699828b6f@redhat.com>
Date: Wed, 4 Aug 2021 10:25:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQlT4rO9OoykGl/b@redhat.com>
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

On 03.08.21 16:34, Kevin Wolf wrote:
> Am 26.07.2021 um 16:46 hat Max Reitz geschrieben:
>> We must check whether the job is force-cancelled early in our main loop,
>> most importantly before any `continue` statement.  For example, we used
>> to have `continue`s before our current checking location that are
>> triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
>> failing, force-cancelling the job would not terminate it.
>>
>> A job being force-cancelled should be treated the same as the job having
>> failed, so put the check in the same place where we check `s->ret < 0`.
>>
>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/mirror.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 72e02fa34e..46d1a1e5a2 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -993,7 +993,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>               mirror_wait_for_any_operation(s, true);
>>           }
>>   
>> -        if (s->ret < 0) {
>> +        if (s->ret < 0 || job_is_cancelled(&s->common.job)) {
>>               ret = s->ret;
>>               goto immediate_exit;
>>           }
>> @@ -1078,8 +1078,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>               break;
>>           }
>>   
>> -        ret = 0;
>> -
>>           if (job_is_ready(&s->common.job) && !should_complete) {
>>               delay_ns = (s->in_flight == 0 &&
>>                           cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
>> @@ -1087,9 +1085,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>>           trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
>>                                     delay_ns);
>>           job_sleep_ns(&s->common.job, delay_ns);
>> -        if (job_is_cancelled(&s->common.job)) {
>> -            break;
>> -        }
> I think it was intentional that the check is here because it means
> skipping the job_sleep_ns() and instead cancelling immediately, and we
> probably still want that. Between your check above and here, the
> coroutine can yield, so cancellation could have been newly requested.

I’m afraid I don’t quite understand.  If cancel is requested in 
job_sleep_ns(), then we will go back to the top of the loop, wait for 
in-flight active requests and then break.  Waiting for the in-flight 
requests seems unnecessary, but does it really make a difference in 
practice?  We don’t start new requests, so it should be legal to wait 
for existing ones to settle, and also I believe someone will have to 
wait for those in-flight requests anyway (when the mirror top node is 
removed).  (The only thing we could do is to cancel the in-flight 
requests, but that is what mirror_cancel() does.)

Looking more at the whole loop, there are a couple of places that can 
yield.  Of course we can check whether the job has been cancelled after 
every single one of them, but that would be a bit strange.  We only 
really need to check before we initiate new requests or want to change 
the state.  I believe the right place to do the check would be after the 
job_pause_point().

And perhaps the active write functions (bdrv_mirror_top_do_write() and 
bdrv_mirror_top_pwritev()) should stop copying to the target if the job 
has been cancelled.

Max

> So have the check in both places, I guess? And a comment to explain why
> neither is redundant.
>
>>           s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>>       }
> Kevin
>


