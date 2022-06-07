Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AD540005
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 15:30:20 +0200 (CEST)
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZHm-0006P2-MH
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 09:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyZ8O-00054b-LE
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nyZ8M-00060K-V3
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654608033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNw4zKMgFYfgLpVH2yuciSpnlmu08UOpKqDLBBrZcgk=;
 b=defQEjaT0iRo8GtgrcVpdvNlz7SvC/JZhsQhrahs+eipAWwVZAtUy8eAQ+HByFSonWCNWY
 aefBukJt/h1PraXm6zm/+SAva2qJ1biS4q/7ayr5xU2Q0zMX84eNwiO2vXq3vR4mo9/xkX
 5g3OM0YZ76NWLD5W7SOoe/b6rnzjga8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-RRWHKegiMsS1_5aBTn880Q-1; Tue, 07 Jun 2022 09:20:32 -0400
X-MC-Unique: RRWHKegiMsS1_5aBTn880Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 e19-20020a05600c4e5300b0039c4b6acd83so4252126wmq.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 06:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UNw4zKMgFYfgLpVH2yuciSpnlmu08UOpKqDLBBrZcgk=;
 b=L9iWFI/U8UkXs8Mjc7opcxp4OX/x01xFhwDyY0dmT74j10fBgb4+RP0c/fikWvOtkk
 eaMMzUs5kCCz5z5JDuqzVP0FOeIKivNtp9rCwcpQJtcX00L8bREXsKcDwNqcDj3cFTGw
 liEgUKimeTSj0wbATpgDhTmiIl4/G57CqD5XuWYHtNNFpMuFAo+/VdH+WkQIORUzNvoY
 y90FjyWDgQ/Z8cbDXkYGH47f/uSgvifJv6wPEd9REcu+oNnSBba1TBkCua0DvC172v39
 vem+EQ4Sj+NonbVohXVntG2/djnIJuQPqPigTkNgYBpPtaShdYxB+pnuE4l9GPR6jr4+
 NB7A==
X-Gm-Message-State: AOAM532M8HjBNWROsEH24eYG5B+WhBezZvRCZd0f3SxvuYo5AHTt+wqB
 Gm3v93LXs/kbJPIKxVUtQhvttzXGdd2Y/DXh4Tb9ayL+Z5zTJxmY575p4nO9cJ3WiXTyEooDODi
 /OrAW1z7F4UGhCB4=
X-Received: by 2002:a1c:4d05:0:b0:39c:5932:d9f1 with SMTP id
 o5-20020a1c4d05000000b0039c5932d9f1mr3873480wmh.52.1654608031315; 
 Tue, 07 Jun 2022 06:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziygD8F4SoG3C0hgURNexZGshvaRji6Neg0X57HOGqAGO0NBmDxdWL96B3i8ohlD+U+FV6vQ==
X-Received: by 2002:a1c:4d05:0:b0:39c:5932:d9f1 with SMTP id
 o5-20020a1c4d05000000b0039c5932d9f1mr3873441wmh.52.1654608031033; 
 Tue, 07 Jun 2022 06:20:31 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 u10-20020adfdd4a000000b002102cc4d63asm21161365wrm.81.2022.06.07.06.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 06:20:30 -0700 (PDT)
Message-ID: <5ec6428c-a2b2-3d85-cece-46f78fa80ce3@redhat.com>
Date: Tue, 7 Jun 2022 15:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 02/18] job.h: categorize fields in struct Job
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220314133707.2206082-1-eesposit@redhat.com>
 <20220314133707.2206082-3-eesposit@redhat.com> <YpowFFFD0hKOFtWF@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YpowFFFD0hKOFtWF@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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



Am 03/06/2022 um 18:00 schrieb Kevin Wolf:
> Am 14.03.2022 um 14:36 hat Emanuele Giuseppe Esposito geschrieben:
>> Categorize the fields in struct Job to understand which ones
>> need to be protected by the job mutex and which don't.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> I suppose it might be a result of moving things back and forth between
> patches, but this patch doesn't really define separate categories.
> 
>>  include/qemu/job.h | 59 ++++++++++++++++++++++++++--------------------
>>  1 file changed, 34 insertions(+), 25 deletions(-)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index d1192ffd61..86ec46c09e 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -40,27 +40,50 @@ typedef struct JobTxn JobTxn;
>>   * Long-running operation.
>>   */
>>  typedef struct Job {
>> +
>> +    /* Fields set at initialization (job_create), and never modified */
> 
> This is clearly a comment starting a category, but I can't see any other
> comment indicating that another category would start.
> 
>>      /** The ID of the job. May be NULL for internal jobs. */
>>      char *id;
>>  
>> -    /** The type of this job. */
>> +    /**
>> +     * The type of this job.
>> +     * All callbacks are called with job_mutex *not* held.
>> +     */
>>      const JobDriver *driver;
>>  
>> -    /** Reference count of the block job */
>> -    int refcnt;
>> -
>> -    /** Current state; See @JobStatus for details. */
>> -    JobStatus status;
>> -
>> -    /** AioContext to run the job coroutine in */
>> -    AioContext *aio_context;
>> -
>>      /**
>>       * The coroutine that executes the job.  If not NULL, it is reentered when
>>       * busy is false and the job is cancelled.
>> +     * Initialized in job_start()
>>       */
>>      Coroutine *co;
>>  
>> +    /** True if this job should automatically finalize itself */
>> +    bool auto_finalize;
>> +
>> +    /** True if this job should automatically dismiss itself */
>> +    bool auto_dismiss;
>> +
>> +    /** The completion function that will be called when the job completes.  */
>> +    BlockCompletionFunc *cb;
>> +
>> +    /** The opaque value that is passed to the completion function.  */
>> +    void *opaque;
>> +
>> +    /* ProgressMeter API is thread-safe */
>> +    ProgressMeter progress;
>> +
>> +
> 
> And the end of the series, this is where the cutoff is and the rest is:
> 
>     /** Protected by job_mutex */
> 
> With this in mind, it seems correct to me that everything above progress
> is indeed never changed after creating the job. Of course, it's hard to
> tell without looking at the final result, so if you have to respin for
> some reason, it would be good to mark the end of the section more
> clearly for the intermediate state to make sense.

How can I do that? I left two empty lines in this patch, I don't know
what to use to signal the end of this category.

Emanuele


