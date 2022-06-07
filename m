Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D715402AA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 17:43:16 +0200 (CEST)
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nybMR-00028M-8f
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 11:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nybKc-00019L-K6; Tue, 07 Jun 2022 11:41:22 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nybKa-0000Hl-8z; Tue, 07 Jun 2022 11:41:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id m26so13300037wrb.4;
 Tue, 07 Jun 2022 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lctIiD2qfu7sDwJUw/JmNCqPAQZg/65+uJMVD0fdgI8=;
 b=K3XIwAekFWHXtTBfx5RMWNHOmLrH6O+YX9K6jzNEaLt7h/cTpalSqJFRPWgerbFdNA
 jej+86c0xPpDypgX6NxyJ2LSjiJRL+Hibt/ShHuWj8/+D+3MTjt5SsWOVB8kxdu1StcZ
 M/vcytejC7fajPoM7jbP7V5lBNp0ZCNbD3vs9N9CYEl/qixk7uAPInKhHzLJ8zyENVI2
 HUVXKdH+8Ce3H/2xF1whu1YRF0PbAi0plLIVSxaQ/w9G4ypSFSq6rpzjT32bHocqKgDC
 NCYHi4XJB+7LLFefMef+D15T7qEh/okjsr95OA+ug5EmFxYDwBq1PCy4NyhiKrx1AgZk
 RUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lctIiD2qfu7sDwJUw/JmNCqPAQZg/65+uJMVD0fdgI8=;
 b=L4aZJVJ1fYGjYxrFWPAXazkn6j00eXC35i2Yp5haIQovNrxtulthtJWntSecuW1mCT
 KwZFtUgLHuAZvVwJcvMIzUH59tam5Hl3eAwUIrbTDp+pvswedYdvclr1p3WzxnwISXEu
 /r5lKdmkEmHGIMCDDaRyhIWG2YxMMUNMXC89CVzbDjo77hC0veO+3+1tJ8nDBucG0TSi
 RL/eoWnwgyvIUPC6vRJ/cKDt8M1z6kVwlIJZ1GQW958v5RgE4ujC1hZINozeJn2gJID/
 5WLL4DT9jykDkUvzEVQIxiV/SSe4dCcphfBduWXy59N2d4GiXwsL0KBf5M5gcnkMLeg5
 jQXA==
X-Gm-Message-State: AOAM531XJq36T74K0XFCmtpjyQu1itafqL1s1ghDtIUm6z+gbLBkJANj
 fpiGHqfaP/pg+TS4zdT1y+w=
X-Google-Smtp-Source: ABdhPJx29whvKkI+hd+DfE0AwtGs3S2lmiGDAk7yY/nkkohrMr9qi5TluKFUHs6vspMSvkV2o1QG+g==
X-Received: by 2002:a5d:5686:0:b0:217:7da8:8c5a with SMTP id
 f6-20020a5d5686000000b002177da88c5amr13972365wrv.3.1654616477793; 
 Tue, 07 Jun 2022 08:41:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 s8-20020a5d69c8000000b002102b16b9a4sm18152152wrw.110.2022.06.07.08.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 08:41:17 -0700 (PDT)
Message-ID: <581e7327-9615-08f2-afeb-cba13058a8aa@redhat.com>
Date: Tue, 7 Jun 2022 17:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 02/18] job.h: categorize fields in struct Job
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-3-eesposit@redhat.com> <YpowFFFD0hKOFtWF@redhat.com>
 <5ec6428c-a2b2-3d85-cece-46f78fa80ce3@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <5ec6428c-a2b2-3d85-cece-46f78fa80ce3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/22 15:20, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 03/06/2022 um 18:00 schrieb Kevin Wolf:
>> Am 14.03.2022 um 14:36 hat Emanuele Giuseppe Esposito geschrieben:
>>> Categorize the fields in struct Job to understand which ones
>>> need to be protected by the job mutex and which don't.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> I suppose it might be a result of moving things back and forth between
>> patches, but this patch doesn't really define separate categories.
>>
>>>   include/qemu/job.h | 59 ++++++++++++++++++++++++++--------------------
>>>   1 file changed, 34 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>>> index d1192ffd61..86ec46c09e 100644
>>> --- a/include/qemu/job.h
>>> +++ b/include/qemu/job.h
>>> @@ -40,27 +40,50 @@ typedef struct JobTxn JobTxn;
>>>    * Long-running operation.
>>>    */
>>>   typedef struct Job {
>>> +
>>> +    /* Fields set at initialization (job_create), and never modified */
>>
>> This is clearly a comment starting a category, but I can't see any other
>> comment indicating that another category would start.
>>
>>>       /** The ID of the job. May be NULL for internal jobs. */
>>>       char *id;
>>>   
>>> -    /** The type of this job. */
>>> +    /**
>>> +     * The type of this job.
>>> +     * All callbacks are called with job_mutex *not* held.
>>> +     */
>>>       const JobDriver *driver;
>>>   
>>> -    /** Reference count of the block job */
>>> -    int refcnt;
>>> -
>>> -    /** Current state; See @JobStatus for details. */
>>> -    JobStatus status;
>>> -
>>> -    /** AioContext to run the job coroutine in */
>>> -    AioContext *aio_context;
>>> -
>>>       /**
>>>        * The coroutine that executes the job.  If not NULL, it is reentered when
>>>        * busy is false and the job is cancelled.
>>> +     * Initialized in job_start()
>>>        */
>>>       Coroutine *co;
>>>   
>>> +    /** True if this job should automatically finalize itself */
>>> +    bool auto_finalize;
>>> +
>>> +    /** True if this job should automatically dismiss itself */
>>> +    bool auto_dismiss;
>>> +
>>> +    /** The completion function that will be called when the job completes.  */
>>> +    BlockCompletionFunc *cb;
>>> +
>>> +    /** The opaque value that is passed to the completion function.  */
>>> +    void *opaque;
>>> +
>>> +    /* ProgressMeter API is thread-safe */
>>> +    ProgressMeter progress;
>>> +
>>> +
>>
>> And the end of the series, this is where the cutoff is and the rest is:
>>
>>      /** Protected by job_mutex */
>>
>> With this in mind, it seems correct to me that everything above progress
>> is indeed never changed after creating the job. Of course, it's hard to
>> tell without looking at the final result, so if you have to respin for
>> some reason, it would be good to mark the end of the section more
>> clearly for the intermediate state to make sense.
> 
> How can I do that? I left two empty lines in this patch, I don't know
> what to use to signal the end of this category.

Can you already add "/** Protected by AioContext lock */" in this patch 
and then change it later?

Paolo

