Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA2542795
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 09:31:23 +0200 (CEST)
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyq9x-0004pA-OD
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 03:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyq6w-0003xr-6z
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 03:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyq6t-0003vs-CI
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 03:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654673290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIvAxGSfU9RW28tAD4GhmT/WzIgk61HnRqRU9NkURuE=;
 b=J6WhVrC3t3SKWRdPZM2fys1NQ+HipbxLeH0wXkVc792/f41dTDfKH71Eh154nmfJHsbHOI
 adTJ0g54Ewk9Et3Ii7VnudtShTlXQ3Z/zxA3OnKfsWkqFQZKpCm+NqWK68v9cPIWW7agM2
 RtVOsy60B/WdrMdQKfpgKZFqLKYJXtM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-H8mx7taIOkOzm-IQLOrDiQ-1; Wed, 08 Jun 2022 03:28:08 -0400
X-MC-Unique: H8mx7taIOkOzm-IQLOrDiQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d9-20020adfe849000000b00213375a746aso3990058wrn.18
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 00:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AIvAxGSfU9RW28tAD4GhmT/WzIgk61HnRqRU9NkURuE=;
 b=DozgP1lqJ/875boAkR8q9Q//10j6e/qYoBaHr2w8qyeHdmEcZqBikCWDN7RerQ7B5o
 VqzkMoYHedqb6kPb3FN3pLgcT34NdllFhUmpyF6B4PMAckxh4prt5Hqo8M4mSIh+mBQx
 eI83MSSuQ1KICW58pbMwzky4WtrH3KhyoCuOZinsO+sLRmlKKmHNpnbMJhQgTBbnIRXD
 6et4CuNnFpaW5FTEQIt/VYE9b3e1XYRFX2PKNGsjZkLBiQcmLrW36SnxncYGKrfE/Q3o
 CgksHmEoXksP7YaMwXR2GTGvskTsW5WAwGnO0A7gAfw2OM3YUHe7LRsH4d5tQ7XMg6hA
 5hbQ==
X-Gm-Message-State: AOAM530M/GzgDl2ZP/i21S0Ym1rzB+fCXGgwEQbtTlB50Nvb7sgetW7/
 taYI7s3/DnfshepsXxF30hr3N92iLXUL1pzKarJ23dWTU4ZwKZKls0PjWIqVcQHfpL/impT9z37
 owTBHpi8vUUp0/UA=
X-Received: by 2002:a5d:59a4:0:b0:218:4a29:f12b with SMTP id
 p4-20020a5d59a4000000b002184a29f12bmr10829255wrr.145.1654673287737; 
 Wed, 08 Jun 2022 00:28:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywMTXWvhyjkficYaH78yUdU01Z13m6RurYsnDWl5yUpp9ZLpBKimx/4eLVVLCKR/n3B8ztZQ==
X-Received: by 2002:a5d:59a4:0:b0:218:4a29:f12b with SMTP id
 p4-20020a5d59a4000000b002184a29f12bmr10829226wrr.145.1654673287473; 
 Wed, 08 Jun 2022 00:28:07 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adfee47000000b002185631adf0sm2892616wro.23.2022.06.08.00.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 00:28:06 -0700 (PDT)
Message-ID: <68e90a12-6dee-d26f-43bd-03b8289bdab8@redhat.com>
Date: Wed, 8 Jun 2022 09:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 02/18] job.h: categorize fields in struct Job
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
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
 <581e7327-9615-08f2-afeb-cba13058a8aa@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <581e7327-9615-08f2-afeb-cba13058a8aa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 07/06/2022 um 17:41 schrieb Paolo Bonzini:
> On 6/7/22 15:20, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 03/06/2022 um 18:00 schrieb Kevin Wolf:
>>> Am 14.03.2022 um 14:36 hat Emanuele Giuseppe Esposito geschrieben:
>>>> Categorize the fields in struct Job to understand which ones
>>>> need to be protected by the job mutex and which don't.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>
>>> I suppose it might be a result of moving things back and forth between
>>> patches, but this patch doesn't really define separate categories.
>>>
>>>>   include/qemu/job.h | 59
>>>> ++++++++++++++++++++++++++--------------------
>>>>   1 file changed, 34 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>>>> index d1192ffd61..86ec46c09e 100644
>>>> --- a/include/qemu/job.h
>>>> +++ b/include/qemu/job.h
>>>> @@ -40,27 +40,50 @@ typedef struct JobTxn JobTxn;
>>>>    * Long-running operation.
>>>>    */
>>>>   typedef struct Job {
>>>> +
>>>> +    /* Fields set at initialization (job_create), and never
>>>> modified */
>>>
>>> This is clearly a comment starting a category, but I can't see any other
>>> comment indicating that another category would start.
>>>
>>>>       /** The ID of the job. May be NULL for internal jobs. */
>>>>       char *id;
>>>>   -    /** The type of this job. */
>>>> +    /**
>>>> +     * The type of this job.
>>>> +     * All callbacks are called with job_mutex *not* held.
>>>> +     */
>>>>       const JobDriver *driver;
>>>>   -    /** Reference count of the block job */
>>>> -    int refcnt;
>>>> -
>>>> -    /** Current state; See @JobStatus for details. */
>>>> -    JobStatus status;
>>>> -
>>>> -    /** AioContext to run the job coroutine in */
>>>> -    AioContext *aio_context;
>>>> -
>>>>       /**
>>>>        * The coroutine that executes the job.  If not NULL, it is
>>>> reentered when
>>>>        * busy is false and the job is cancelled.
>>>> +     * Initialized in job_start()
>>>>        */
>>>>       Coroutine *co;
>>>>   +    /** True if this job should automatically finalize itself */
>>>> +    bool auto_finalize;
>>>> +
>>>> +    /** True if this job should automatically dismiss itself */
>>>> +    bool auto_dismiss;
>>>> +
>>>> +    /** The completion function that will be called when the job
>>>> completes.  */
>>>> +    BlockCompletionFunc *cb;
>>>> +
>>>> +    /** The opaque value that is passed to the completion
>>>> function.  */
>>>> +    void *opaque;
>>>> +
>>>> +    /* ProgressMeter API is thread-safe */
>>>> +    ProgressMeter progress;
>>>> +
>>>> +
>>>
>>> And the end of the series, this is where the cutoff is and the rest is:
>>>
>>>      /** Protected by job_mutex */
>>>
>>> With this in mind, it seems correct to me that everything above progress
>>> is indeed never changed after creating the job. Of course, it's hard to
>>> tell without looking at the final result, so if you have to respin for
>>> some reason, it would be good to mark the end of the section more
>>> clearly for the intermediate state to make sense.
>>
>> How can I do that? I left two empty lines in this patch, I don't know
>> what to use to signal the end of this category.
> 
> Can you already add "/** Protected by AioContext lock */" in this patch
> and then change it later?

Makes sense, thanks.

Emanuele
> 
> Paolo
> 


