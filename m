Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DA03E43A5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:11:05 +0200 (CEST)
Received: from localhost ([::1]:35400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2FM-0007oL-Mk
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD2Dv-0006OU-Kl
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1mD2Du-0008NQ-5Q
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628503773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d71/i2uz+tPW671bGqYHrfhFfU608MepnksqEbG9EMU=;
 b=WvT4GmvDwY2KiWGk1y8Dn+GMp0gYZ56dIgkWq4nYG2MtIxBtcAZHJqNsTfKFrrgdGQ2k6y
 CnJA1HYHOnhft88KN5cBYjVdpEGkJwguFiTMwRa44avegMON1W91gvDyIrsjBIXCQR5UYx
 aG9K2/nP3MF0o2Gt8w3iErjZGgKcM8o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-wimWZCKpPayYB2Mmfp6PoQ-1; Mon, 09 Aug 2021 06:09:27 -0400
X-MC-Unique: wimWZCKpPayYB2Mmfp6PoQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so1549313wma.4
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=d71/i2uz+tPW671bGqYHrfhFfU608MepnksqEbG9EMU=;
 b=az8B36mHMrpmXvYMMrR27iaSRKoSrjyPFzWg6wLMU59KZqtcyk1tpscTrkU8UoYdPA
 et6t82UbBidW9hVwbHXicS0O3942is88f1mV+b8SN5h5U6jqkfLDZiDXe5WVCWavlzhe
 ethfs6zHhSP3Ql9Ov/hJ/yXMqWmyc/kJVckVQ6hYCsPISUNrRcsmJF7GN8x8znp5d17t
 B+GvRoCwxHsEHTG8z6UTjWwHFwcVgASWftCjGWZJLuiltGMiFbME88X5uaDilWwsnklj
 arBRnSqcOu0wOEK7I7NzWeeldOFlAZQaqQ9G2o/7VnBOkHdmu6JJgTVI/tz2iApRgg0w
 U5WQ==
X-Gm-Message-State: AOAM530kPBq9kXEKTSAlkyBQU2I30iO9CtS4bRXA4dwA6p6pjs8IwblO
 Z2Hphl52nAKm1CTnRF8wn5Gs2I3S/C7ivFIZrOXWScqqnhCg9vPYNMEr+GNtM1YkoEVJu1ntx0s
 PydyktPeoHQKn9LlVXQu6Wjj/nXwmvR134jFaOimsq+TGg08pNnq0wbLyu7bgKVl9
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr15859879wmk.51.1628503765007; 
 Mon, 09 Aug 2021 03:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4VlooPWI5ykL8i7YywjHoiZUBZRJVLCiMRjkwx9AKcWrnTsbkL4XTQTooybCMzJXcGcDmNg==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr15859851wmk.51.1628503764720; 
 Mon, 09 Aug 2021 03:09:24 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 o17sm385026wmp.13.2021.08.09.03.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 03:09:24 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v3 05/12] job: @force parameter for
 job_cancel_sync{, _all}()
To: Eric Blake <eblake@redhat.com>
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-6-mreitz@redhat.com>
 <20210806193938.blsklchugkfbz27i@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ef68a0a8-26b9-6643-e1d6-7897b06d8e34@redhat.com>
Date: Mon, 9 Aug 2021 12:09:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806193938.blsklchugkfbz27i@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 21:39, Eric Blake wrote:
> On Fri, Aug 06, 2021 at 11:38:52AM +0200, Max Reitz wrote:
>> Callers should be able to specify whether they want job_cancel_sync() to
>> force-cancel the job or not.
>>
>> In fact, almost all invocations do not care about consistency of the
>> result and just want the job to terminate as soon as possible, so they
>> should pass force=true.  The replication block driver is the exception.
>>
>> This changes some iotest outputs, because quitting qemu while a mirror
>> job is active will now lead to it being cancelled instead of completed,
>> which is what we want.  (Cancelling a READY mirror job with force=false
>> may take an indefinite amount of time, which we do not want when
>> quitting.  If users want consistent results, they must have all jobs be
>> done before they quit qemu.)
> Feels somewhat like a bug fix, but I also understand why you'd prefer
> to delay this to 6.2 (it is not a fresh regression, but a longstanding
> issue).

It is, hence the “Buglink” tag below.  However, only all of this series 
together really fixes that bug (or at least patches 5+7+9 together), 
just taking one wouldn’t help much.  And together, it’s just too much 
for 6.2 at this point.

>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>> +++ b/job.c
>> @@ -982,12 +982,24 @@ static void job_cancel_err(Job *job, Error **errp)
>>       job_cancel(job, false);
>>   }
>>   
>> -int job_cancel_sync(Job *job)
>> +/**
>> + * Same as job_cancel_err(), but force-cancel.
>> + */
>> +static void job_force_cancel_err(Job *job, Error **errp)
>>   {
>> -    return job_finish_sync(job, &job_cancel_err, NULL);
>> +    job_cancel(job, true);
>> +}
> In isolation, it looks odd that errp is passed but not used.  But
> looking further, it's because this is a callback that must have a
> given signature, so it's okay.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>


